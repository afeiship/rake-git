require "json"

package_hash = JSON.load File.open "./package.json"

# main task list:
namespace :git do
  # Core command
  def invoke_tag_action(action, args)
    msg = "add: tagging by script - #{args[:version]}"
    case action
    when :create
      sh "git tag #{args[:version]}"
    when :create_with_msg
      sh "git tag #{args[:version]} -m='#{msg}'"
    when :del
      sh "git tag -d #{args[:version]}"
    when :del_remote
      sh "git push --delete origin #{args[:version]}"
    when :push
      sh "git push origin #{args[:version]}"
    when :list_local
      sh "git tag"
    when :list_remote
      sh "git ls-remote --tags"
    when :tagging
      sh "git tag #{args[:version]} -m='#{msg}' && git push origin #{args[:version]}"
    else
      puts "defaults tag action"
    end
  end

  def invoke_branch_action(action, args)
    case action
    when :create
      sh "git branch #{args[:name]}"
    when :delete
      begin
        sh "git push --delete origin #{args[:name]}"
        sh "git branch -d #{args[:name]}"
      rescue => exception
      end
    when :list
      sh "git branch -a"
    when :push
      sh "git push --set-upstream origin #{args[:name]}"
    else
      puts "defaults branch action"
    end
  end

  def desc_name(action)
    action.to_s.capitalize.split("_").join " "
  end

  # Generate tag actions:
  [:create, :create_with_msg, :del, :del_remote, :push, :list_local, :list_remote].each do |action|
    desc "#{desc_name(action)} tag from semver file(eg: package.json)"
    task "tag_#{action}", [:version] do |task, args|
      args.with_defaults(
        :version => "v#{package_hash["version"]}",
      )
      invoke_tag_action(action, args)
    end
  end

  # Generate branch actions:
  [:create, :delete, :list, :push].each do |action|
    desc "#{desc_name(action)} branch action"
    task "branch_#{action}", [:name] do |task, args|
      invoke_branch_action(action, args)
    end
  end
end

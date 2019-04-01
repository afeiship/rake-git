require "json"

semver_hash = JSON.load File.open "./package.json"

# main task list:
namespace :git do
  # Core command
  def invoke_tag_action(action, args)
    case action
    when :create
      sh "git tag #{args[:version]}"
    when :create_with_msg
      sh "git tag #{args[:version]} -m=#{args[:msg]}"
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
    else
      puts "defaults"
    end
  end

  # Generate tag actions:
  [:create, :create_with_msg, :del, :del_remote, :push, :list_local, :list_remote].each do |action|
    desc_name = action.to_s.capitalize.split("_").join " "
    desc "#{desc_name} tag from semver file(eg: package.json/.semver)"
    task "tag_#{action}", [:version, :msg] do |task, args|
      args.with_defaults(
        :version => "v#{semver_hash["version"]}",
      )
      invoke_tag_action(action, args)
    end
  end
end

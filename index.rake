require 'json'

semver_hash = JSON.load File.open "./package.json"

# main task list:
namespace :git do
  # Core command
  def invoke_tag_action(action,args)
    case action
    when :create
      %x(git tag #{args[:version]})
    when :del
      %x(git tag -d #{args[:version]})
    when :del_remote
      %x(git push --delete origin #{args[:version]})
    when :push
      %x(git push origin #{args[:version]})
    when :list
      %x(git tag -l)
    when :list_all
      %x(git ls-remote)
    else
      puts "defaults"
    end
  end

  # Generate tag actions:
  [:create,:del,:del_remote,:push,:list,:list_all].each do |action|
    desc_name = action.to_s.capitalize.split('_').join ' '
    desc "#{desc_name} tag from semver file(eg: package.json/.semver)"
    task "tag_#{action}",[:version] do |task, args|
      args.with_defaults(
        :version => "v#{semver_hash['version']}",
        )
      invoke_tag_action(action, args)
    end
  end

end

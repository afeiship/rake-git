require 'json'

semver_hash = JSON.load File.open "./package.json"

# main task list:
namespace :git do
  # Core command
  def invoke(action,args)
    case action
    when :create
      sh "git tag #{args[:version]}"
    when :del
      sh "git tag -d #{args[:version]}"
    when :del_remote
      sh "git push --delete origin #{args[:version]}"
    when :push
      sh "git push origin #{args[:version]}"
    else
      puts "defaults"
    end
  end

  [:create,:del,:del_remote,:push].each do |action|
    task_name = action.to_s.capitalize.split('_').join ' '
    desc "#{task_name} tag from semver file(eg: package.json/.semver)"
    task "tag_#{action}",[:version] do |task, args|
      args.with_defaults(
        :version => "v#{semver_hash['version'] || args[:version]}",
        )
      invoke(action, args)
    end
  end

  desc "List all tags in local."
  task :tag_list do
    sh 'git tag -l'
  end
end

require 'json'

# load subtask:
Dir.glob("./node_modules/rake-git/tasks/*.rake").each do |task|
  load task
end

# main task list:
namespace :git do
  # Core command
  desc "Create tag from default semver file(eg: package.json/.semver)"
  task :tag_add,[:filename] do |task, args|
    args.with_defaults(
      :filename => "./package.json",
    )
    sh "git tag #{args[:filename]}"
  end

  desc "Delete tag from default semver file."
  task :tag_del,[:filename] do |task, args|
    args.with_defaults(
      :filename => "./package.json",
    )
    sh "git tag -d #{args[:filename]}"
    sh "git push --delete origin #{args[:filename]}"
  end

  desc "Push current tag to remote."
  task :tag_push,[:filename] do |task, args|
    args.with_defaults(
      :filename => "./package.json",
    )
    sh "git push origin #{args[:filename]}"
  end

  desc "List all tags in local."
  task :tag_list
    sh 'git tag -l'
  end
end

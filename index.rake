require 'json'

# load subtask:
Dir.glob("./node_modules/rake-git/tasks/*.rake").each do |task|
  load task
end

# main task list:
namespace :git do
  # build & serve:
  desc "Create tag from default semver file(eg: package.json/.semver)"
  task :tag_add do
    sh 'git tag v0.1.2-light'
  end

  desc "Delete tag from default semver file."
  task :tag_del do
    sh 'git tag -d v0.1.2-light'
    sh 'git push --delete origin v0.1.2-light'
  end

  desc "Push current tag to remote."
  task :tag_push do
    sh 'git push origin v0.1.2-light'
  end

  desc "List all tags in local."
  task :tag_list do
    sh 'git tag -l'
  end
end

require "json"
require_relative "./tag"

package_hash = JSON.load File.open "./package.json"

# main task list:
namespace :git do
  # Core command
  # Generate tag actions:
  [:create, :create_with_msg, :del, :del_remote, :push, :list_local, :list_remote].each do |action|
    desc_name = action.to_s.capitalize.split("_").join " "
    desc "#{desc_name} tag from semver file(eg: package.json)"
    task "tag_#{action}", [:version] do |task, args|
      args.with_defaults(
        :version => "v#{package_hash["version"]}",
      )
      Tag.invoke(action, args)
    end
  end
end

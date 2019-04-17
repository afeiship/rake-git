class Tag
  def self.invoke(action, args)
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
    else
      puts "defaults"
    end
  end
end

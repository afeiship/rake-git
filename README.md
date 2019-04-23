# rake-git
> Rake task for git.

## installation
```bash
npm i -D afeiship/rake-git --registry=https://registry.npm.taobao.org
```

## usage
~~~
$ rake -T
rake git:branch_create[name]       # Create branch action
rake git:branch_delete[name]       # Delete branch action
rake git:branch_list[name]         # List branch action
rake git:branch_push[name]         # Push branch action
rake git:tag_create[version]       # Create tag from semver file(eg: package.json)
rake git:tag_delete[version]       # Delete tag from semver file(eg: package.json)
rake git:tag_list[version]         # List tag from semver file(eg: package.json)
rake git:tag_list_remote[version]  # List remote tag from semver file(eg: package.json)
rake git:tag_push[version]         # Push tag from semver file(eg: package.json)
rake git:tag_tagging[version]      # Tagging tag from semver file(eg: package.json)
~~~

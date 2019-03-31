# rake-git
> Rake task for git.

## install:
```bash
npm i -S afeiship/rake-git --registry=https://registry.npm.taobao.org
```

## usage:
~~~
$ rake -T
rake git:tag_create[version]      # Create tag from semver file(eg: package.json/.semver)
rake git:tag_del[version]         # Del tag from semver file(eg: package.json/.semver)
rake git:tag_del_remote[version]  # Del remote tag from semver file(eg: package.json/.semver)
rake git:tag_list[version]        # List tag from semver file(eg: package.json/.semver)
rake git:tag_list_all[version]    # List all tag from semver file(eg: package.json/.semver)
rake git:tag_push[version]        # Push tag from semver file(eg: package.json/.semver)
~~~

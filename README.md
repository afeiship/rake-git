# rake-git
> Rake task for git.

## install:
```bash
npm i -S afeiship/rake-git --registry=https://registry.npm.taobao.org
```

## usage:
~~~
$ rake -T
rake git:tag_create[version,msg]           # Create tag from semver file(eg: package.json/.semver)
rake git:tag_create_with_msg[version,msg]  # Create with msg tag from semver file(eg: package.json/.semver)
rake git:tag_del[version,msg]              # Del tag from semver file(eg: package.json/.semver)
rake git:tag_del_remote[version,msg]       # Del remote tag from semver file(eg: package.json/.semver)
rake git:tag_list_local[version,msg]       # List local tag from semver file(eg: package.json/.semver)
rake git:tag_list_remote[version,msg]      # List remote tag from semver file(eg: package.json/.semver)
rake git:tag_push[version,msg]             # Push tag from semver file(eg: package.json/.semver)
~~~

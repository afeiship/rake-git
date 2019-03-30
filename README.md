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
rake git:tag_list                 # List all tags in local
rake git:tag_push[version]        # Push tag from semver file(eg: package.json/.semver)
~~~

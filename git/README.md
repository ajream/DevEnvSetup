# 理解 gitignore
使用 git 做代码管理工具时，设置 gitignore 的 pattern 规则十分重要。
## Pattern 规则
关于 Pattern 规则，可以查看 git 的[相关文档][1]，大致有以下几点：
* 空行不匹配任何内容，所以可以作为块分隔符；
* \# 开头表示注释，如果相匹配 \#，可以在前面加一个反斜杠，即 \#；
* 如果在匹配的内容前面加上 !，则这些匹配过的部分将被移出，如果要匹配以 ! 开头的内容，需要加上反斜杠，如 \!foo.txt；
* 如果一个匹配 pattern 后面有一个斜杠，如 foo/，则默认会匹配所有（包含父子文件夹）中的 foo 文件夹内容，并且它不会匹配单个的文件；
* 如果一个匹配 pattern 不包含斜杠，如 foo，Git 会将其作为一个 shell 的查找命令匹配内容。

## 匹配示例


* 匹配 ‘foo’ 目录下除去 ‘foo/bar/‘ 外的内容；
```
foo/ \#
!foo/bar/
```
* 匹配所有目录下的 platforms 文件夹；
```
platforms
```
* 匹配所有的 json 文件;
```
`\*.json
````

[1]:	http://git-scm.com/docs/gitignore

## 脚本整理

### 日志文件内容增加

`>>`和`tee -a`都是将输出追加到文件中的方法，但它们的使用场景略有不同。

`>>`是一种重定向操作符，用于将命令的输出追加到指定文件的末尾。例如，以下命令将`ls`命令的输出追加到`list.txt`文件的末尾：
```bash
ls >> list.txt
```
如果`list.txt`文件不存在，则会创建该文件并将`ls`命令的输出写入其中。如果文件已经存在，则会将`ls`命令的输出追加到文件末尾。

`tee -a`是一个命令，它将标准输入复制到标准输出和指定文件中。`-a`选项表示将输出追加到文件的末尾。例如，以下命令将`ls`命令的输出同时显示在终端上并追加到`list.txt`文件的末尾：
```bash
ls | tee -a list.txt
```
如果`list.txt`文件不存在，则会创建该文件并将`ls`命令的输出写入其中。如果文件已经存在，则会将`ls`命令的输出追加到文件末尾。

因此，`>>`适用于将命令的输出追加到文件中，而`tee -a`适用于将命令的输出同时显示在终端上并追加到文件中。如果你只需要将输出追加到文件中，那么使用`>>`可能更简单和直接。如果你需要同时在终端上查看输出并将其追加到文件中，那么使用`tee -a`可能更方便。


### date 基本用法

`date`命令用于显示或设置系统的日期和时间。在命令行中，你可以使用`date`命令来获取当前日期和时间，也可以根据需要格式化输出。

下面是`date`命令中常用的`+`选项的用法：

1. 显示当前日期和时间：
```bash
date
```

2. 格式化输出日期和时间：
```bash
date +"%Y-%m-%d %H:%M:%S"
```
这将按照`"%Y-%m-%d %H:%M:%S"`的格式输出当前日期和时间，例如`2024-06-07 12:30:45`。

3. 显示当前日期（年、月、日）：
```bash
date +"%Y-%m-%d"
```

4. 显示当前时间（时、分、秒）：
```bash
date +"%H:%M:%S"
```

5. 显示当前星期几：
```bash
date +"%A"
```

6. 显示当前月份：
```bash
date +"%B"
```

7. 显示当前时间戳（Unix 时间戳）：
```bash
date +"%s"
```

这些只是`date`命令的一些常见用法示例。通过结合不同的格式化选项，你可以根据需要输出各种日期和时间格式。

### 管道操作符

在Bash中，`|` 和 `&` 是两个重要的操作符，用于控制命令之间的输入输出和后台执行。

1. `|` 管道操作符：`|` 可以将一个命令的输出传递给另一个命令作为输入。这种方式可以实现命令之间的协作和数据流转。例如：

```bash
command1 | command2
```

上面的命令将 `command1` 的输出作为 `command2` 的输入。

2. `&` 后台执行操作符：在Bash中，`&` 用于将命令放入后台执行，使得命令在后台运行而不阻塞当前终端。例如：

```bash
command &
```

上面的命令将 `command` 放入后台执行。

关于Bash和Shell的区别：

- Shell 是一个通用术语，用来描述操作系统提供的命令行解释器。Bash 是 Linux 和其他类 Unix 系统上最常用的 Shell。因此，Bash 是 Shell 的一种。
- Shell 是一个命令行解释器，用户可以通过 Shell 输入命令并与操作系统进行交互。Bash 是 GNU 项目的一部分，是 Bourne Shell (sh) 的增强版本，它提供了更多的功能和特性。
- 在大多数 Linux 系统中，默认的 Shell 是 Bash，但也有其他 Shell 可供选择，比如 Zsh、Fish 等。每种 Shell 都有自己独特的特性和语法。

### grep 匹配

`grep` 是一个强大的文本搜索工具，通常用于在文件或标准输入中查找匹配特定模式的行，并将匹配的行打印出来。

下面是 `grep` 命令的一般格式：

```bash
grep [options] pattern [file...]
```

- `pattern` 是你要搜索的模式，可以是普通字符串或正则表达式。
- `file` 是要在其中搜索模式的文件。如果不指定文件，则 `grep` 会从标准输入中读取数据。

以下是一些常用的 `grep` 选项：

- `-i`：忽略大小写。
- `-v`：反转匹配，只输出不匹配的行。
- `-n`：显示匹配行的行号。
- `-c`：仅显示匹配行的计数。
- `-r`：递归地在目录中搜索文件。
- `-E`：启用扩展的正则表达式（支持更多的正则表达式语法）。

示例用法：

1. 在文件中查找包含特定字符串 "hello" 的行：
   ```bash
   grep "hello" file.txt
   ```

2. 在多个文件中递归搜索包含 "error" 的行，并显示行号：
   ```bash
   grep -n -r "error" /path/to/directory
   ```

3. 使用正则表达式查找以 "2024" 开头的行：
   ```bash
   grep "^2024" file.txt
   ```

这些只是 `grep` 命令的一些基本用法，`grep` 还有许多其他选项和功能，你可以通过阅读 `grep` 的 man 手册或者在线文档来了解更多信息。


### grep 与管道操作符

`grep`命令是一个强大的文本搜索工具，用于在文件或输入流中查找匹配指定模式的文本行。它通常与其他命令结合使用，以实现更复杂的文本处理和过滤操作。以下是一些常见的与`grep`命令连用的示例：

1. **结合`cat`命令**：`cat`命令用于显示文件内容，结合`grep`可以在文件中查找特定内容。例如，要查找包含关键字"error"的行，可以使用以下命令：

```bash
cat file.txt | grep "error"
```

2. **结合`ls`命令**：`ls`命令用于列出目录内容，结合`grep`可以过滤出特定文件或目录。例如，要列出当前目录中以".txt"结尾的文件，可以使用以下命令：

```bash
ls | grep "\.txt$"
```

3. **结合`ps`命令**：`ps`命令用于显示当前进程状态，结合`grep`可以过滤出特定进程。例如，要查找名为"firefox"的进程，可以使用以下命令：

```bash
ps aux | grep "firefox"
```

4. **结合`find`命令**：`find`命令用于在指定目录中查找文件，结合`grep`可以进一步过滤查找结果。例如，要在`/var/log`目录下查找包含关键字"error"的文件，可以使用以下命令：

```bash
find /var/log -type f -exec grep "error" {} +
```

这些是一些常见的与`grep`命令连用的示例，通过结合不同的命令，可以实现更加复杂和灵活的文本处理和搜索操作。


### 添加Ubuntu镜像源

查看ubuntu版本
```shell
cat /etc/issue
```

一般路径：
```shell
/etc/apt/source.list
```

下附一些常见的镜像源：

```shell
########   Ubuntu22.04LTS 清华镜像源   ###############
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
 
# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
```

#### 更新镜像源

```shell
sudo apt-get update #更新软件列表
sudo apt-get upgrade # 更新本地软件
```
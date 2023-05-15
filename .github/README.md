# NEOVIM 配置

个人专用。

## 安装

克隆本仓库到`nvim`配置目录：

- Windows

  ```powershell
  git clone https://github.com/thep0y/nvim.git ~\AppData\Local\nvim --depth 1
  ```

- Linux

  ```bash
  git clone https://github.com/thep0y/nvim.git ~/.config/nvim --depth 1
  ```

安装**rust**语言服务器：

```bash
rustup component add rust-analyzer
```

> 需要注意的是，插件下载的过程本质上是`git clone https://github.com/...`的过程，如果你在中国大陆且没有为 github 配置代理，很可能会因为网络问题导致部分或全部插件下载失败。
>
> 可以通过如下命令为 github 配置代理：
> 
> ```bash
> git config --global url."https://ghproxy.com/https://github.com".insteadOf "https://github.com"
> ```

在终端中执行`nvim`命令，等待自动配置完成即可，具体支持的语言查看文档：https://github.com/nvim-treesitter/nvim-treesitter#supported-languages。

### 语法高亮

`neovim`中默认支持一些语言的语法高亮，但是支持的并不全，所以我们需要根据自己的需要去安装一些语法高亮插件，比如我想要对`tsx`文件进行语法高亮，需要执行：

```bash
:TSInstall tsx
```

当你打开的某个文件语法高亮有问题时，用此方法安装即可。

## 配置

### Pyright

我使用的是`miniconda`作为虚拟环境管理器，不同平台中虚拟环境的目录不同，所以不能统一配置此变量。

在克隆本仓库后，必需设置`VENV_PATH`变量：

- 取消`lua/custom/init.lua`中的`vim.env.VENV_PATH`注释，修改为你使用的虚拟环境目录

- 通过系统或用户的环境变量设置

### Go

对 Go 进行格式时需要安装三个插件：

```bash
go install mvdan.cc/gofumpt@latest
go install github.com/incu6us/goimports-reviser/v3@latest
go install github.com/segmentio/golines@latest
```

在不作任何额外配置时可对 go 文件正常格式化、导包等操作，但无法对 struct 添加标签，需要执行`:TSInstallSync go`安装 go 解析插件。

### 其他

本仓库使用了`nvchad`作为模板，配置请查阅`NvChad`文档：https://nvchad.com/

## 快捷键

我设置了一些常用的自定义快捷键，具体查看文件[mappings.lua](https://github.com/thep0y/nvim/blob/main/lua/custom/mappings.lua)。

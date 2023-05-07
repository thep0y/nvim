# NEOVIM 配置

个人专用。

## 安装

克隆本仓库到`nvim`配置目录：

```bash
# windows
git clone https://github.com/thep0y/nvim.git C:\Users\thepoy\AppData\Local\nvim --depth 1
# Linux
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

在终端中执行`nvim`命令，等待自动配置完成即可。


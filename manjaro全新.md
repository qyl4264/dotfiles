# 1. 软件安装

## 0.9

### .1 更改软件源

编辑文件`/etc/pacman.d/mirrorlist `

```bash
# 阿里云
Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch
# 清华大学
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
```

### .2 添加archlinuxcn软件源

编辑文件`/etc/pacman.conf`，在最下面添加：

```
复制[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

### .3更新软件源并导入公钥

```
复制sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring
```

### .4更新系统

运行命令：`sudo pacman -Syyu`
出现无法安装更新的问题：`无法安装更新，xxx被manjaro-release所有`解决:
卸载`manjaro-release`:`sudo pacman -R manjaro-release`,再执行更新命令。



### B方案

  1.配置镜像源:
 `sudo pacman-mirrors -i -c China -m rank`

2.设置 archlinuxcn 源:
    `sudo vim /etc/pacman.conf`
    添加以下内容

   ```
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch

   ```

3.导入GPG Key

```
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
```

## 1.1 zsh

```bash
sudo pacman -S zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
```



## 1.2 pyenv

<https://blog.csdn.net/MyJoiT/article/details/82077474> 

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.zshrc
exec $SHELL

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
exec $SHELL
```

## 1.3 vim 插件依赖

```bash
sudo pacman -S fzf the_silver_searcher tmux ctags
```

## 1.4  应用软件
```bash
sudo pacman -S fcitx-sogoupinyin
sudo pacman -S fcitx-im
sudo pacman -S fcitx-configtool # 图形化的配置工具
pacman -S core/binutils

修改nano  ～/.profile，在最下方添加：
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

sudo timedatectl set-local-rtc true
sudo ntpdate 1.cn.pool.ntp.org

sudo pacman -S net-tools
```

## 1.5 VIM软件安装

nvim 配置文件`~/.config/nvim/init.vim`
nvim 的coc配置文件`~/.config/nvim/coc-settings.json`

## 1.6 TMUX插件安装
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

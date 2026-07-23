---
title: "WSL Graphics"
subtitle: "Linux GUI apps, fully integrated into the Windows desktop"
description: "WSLg is short for Windows Subsystem for Linux GUI and the purpose of the project is to enable support for running Linux GUI applications (X11 and Wayland) on Windows in a fully integrated desktop experience."
cover: /images/posts/WSLg_IntegratedDesktop.png
categories:
  - Linux
tags:
  - technology
  - wsl
  - wsl2
  - Linux
  - ubuntu
date: 2021-06-19 09:59:27
featured: true
version: "v1.0"
---
## Recaps

In previous post we have seen how to install [Windows Subsystem Linux](https://www.mistrysiddh.tk/posts/wsl2install) in your windows 10, so in this we will see how to use **GUI** on your system without any kind of software or other utilities. The main purpose of using this is so that you can easily use both the windows and Linux apps together on single operating system, after you have installed this WSLG on your system it will look like this.

![WSLG](/images/posts/WSLg_IntegratedDesktop.png)

Let's start the installation process.

## Brief Introduction

WSLg is short for *Windows Subsystem for Linux GUI* and the purpose of the project is to enable support for running Linux GUI applications (X11 and Wayland) on Windows in a fully integrated desktop experience.

WSLg provides an integrated experience for developers, scientists or enthusiasts that prefer or need to run Windows on their PC but also need the ability to run tools or applications which works best, or exclusively, in a Linux environment. While users can accomplish this today using a multiple system setup, with individual PC dedicated to Windows and Linux, virtual machine hosting either Windows or Linux, or an XServer running on Windows and projected into WSL, WSLg provides a more integrated, user friendly and productive alternative.

WSLg strives to make Linux GUI applications feel native and natural to use on Windows. From integration into the Start Menu for launch to appearing in the task bar, alt-tab experience to enabling cut/paste across Windows and Linux applications, WSLg enables a seamless desktop experience and workflow leveraging Windows and Linux applications.

## Installation

### Pre-requirements

Before you begin installation of WSLG you have to check few thing on your system so that there is no error while installation. Here are the requirements:

- [x] `Windows 10 Insider Preview build 21362+` (required for now but in future it will be available for normal builds if you aren't on this build then go to setup [Windows Insider](https://www.mistrysiddh.tk/posts/wsl2install/#installation-of-wsl-2) and get latest versions of Insider Preview build)
- [x] Choose your GPU (if you have already install drivers then you can skip this steps)
  - [x] [AMD GPU driver for WSL](https://community.amd.com/community/radeon-pro-graphics/blog/2020/06/17/announcing-amd-support-for-gpu-accelerated-machine-learning-training-on-windows-10)
  - [x] [Intel GPU driver for WSL](https://downloadcenter.intel.com/download/29526)
  - [x] [NVIDIA GPU driver for WSL](https://developer.nvidia.com/cuda/wsl) (I have NVIDIA GeForce on my device so I have already installed it)

### Install instructions

I assume that you have installed WSL on your system but if you haven't installed it yet then go to [WSL2 Installation](https://www.mistrysiddh.tk/posts/ws2install/) and install it. Moving further If you have an existing WSL installation without WSLg and want to update to the latest version of WSL which includes WSLg, run the command `wsl --update` from an elevated command prompt, and also download and install [Linux GUI support](https://github.com/microsoft/wslg/releases/tag/v1.0.24) on your system so that the software requirement to run WSLg will be installed automatically. 

Please note that WSLg is only compatible with WSL 2 and will not work for WSL distribution configured to work in WSL 1 mode. Verify that your Linux distro is configured for running in WSL 2 mode, if not switch to WSL 2. While you can continue to run Linux distro in WSL 1 mode after installing WSLg if you so desired, a distro configured to run in WSL 1 mode will not be able to communicate with WSLg and will not be able to run GUI applications.

You can list your currently installed distro and the version of WSL they are configured for using the following command from an elevated command prompt.

```powershell
   wsl --list -v
```

If running in version 1 mode, switch to version 2. This can take a while.

```powershell
   wsl --set-version _distro_name_ 2
```

Restart WSL by running this command from an elevated command prompt, make sure to save any pending work first:

```powershell
    wsl --shutdown
```

## Updating WSL + WSLg

To update to the latest version of WSL and WSLg released for preview, simply run `wsl --update` from an elevated command prompt or powershell.

You'll need to restart WSL for the changes to take effect. You can restart WSL by running `wsl --shutdown` from an elevated command prompt. If WSL was currently running, it will shutdown, make sure to first save any in progress work! WSL will be automatically restarted the next time you launch a WSL application or terminal.

## First Launch

If you have installed the `Ubuntu` Linux distro per these instructions, you'll find an `Ubuntu` icon in your start menu, launch it. This will launch the WSL 2 VM, launch the Ubuntu WSL distro in that VM and give you a terminal to interact with it. Voila! You're running Linux on Windows!

If you would like to explore additional Linux distributions built for WSL, you can use the `wsl --list --online` command from an elevated command prompt to enumerate the list of available distributions for your system. You can have multiple Linux distributions installed within WSL and they will happily coexist side-by-side, so don't be scared to experiment and try things out. Now let's install and try some apps

## Install and run GUI apps

If you want to get started with some GUI apps, you can run the following commands from your Linux terminal to download and install some popular applications. If you are using a different distribution than Ubuntu, it may be using a different package manager.

```
## Update all packages in your distro
sudo apt update

## Gedit
sudo apt install gedit -y

## GIMP
sudo apt install gimp -y

## Nautilus
sudo apt install nautilus -y

## VLC
sudo apt install vlc -y

## X11 apps
sudo apt install x11-apps -y

## Google Chrome
cd /tmp
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb 
sudo apt install --fix-broken -y
sudo dpkg -i google-chrome-stable_current_amd64.deb

## Microsoft Teams
cd /tmp
sudo curl -L -o "./teams.deb" "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb"
sudo apt install ./teams.deb -y

## Microsoft Edge Browser
sudo curl https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/microsoft-edge-dev_91.0.852.0-1_amd64.deb -o /tmp/edge.deb
sudo apt install /tmp/edge.deb -y
```

Once these applications are installed, you'll find them in your start menu under the distro name. For example `Ubuntu -> Microsoft Edge`. You can also launch these from your terminal window using the commands:

- `xcalc`, `xclock`, `xeyes`
- `gimp`
- `gedit ~/.bashrc`
- `nautilus`
- `vlc`
- `google-chrome`
- `teams`
- `microsoft-edge`

**Congrats you are done and ready to use GUI apps!** 

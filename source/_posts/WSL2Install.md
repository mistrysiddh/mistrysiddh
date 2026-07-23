---
title: "WSL Install"
subtitle: "Running a real Linux environment natively on Windows"
description: "The Windows Subsystem for Linux lets developers run a GNU/Linux environment -- including most command-line tools, utilities, and applications -- directly on Windows, unmodified, without the overhead of a traditional virtual machine or dual-boot setup."
cover: /images/posts/wsl2.png
categories:
  - Linux
tags:
  - technology
  - wsl
  - wsl2
  - Linux
  - ubuntu
date: 2021-06-15 12:01:11
featured: true
version: "v1.0"
---
![WSL2](/images/posts/wsl2.png)

## What is WSL?
The Windows Subsystem for Linux lets developers(WSL) run a GNU/Linux environment -- including most command-line tools, utilities, and applications -- directly on Windows, unmodified, without the overhead of a traditional virtual machine or dual-boot setup.
You can:

- Choose your favorite GNU/Linux distributions from the [Microsoft Store](https://aka.ms/wslstore).
- Run common command-line tools such as grep, sed, awk, or other ELF-64 binaries.
- Run Bash shell scripts and GNU/Linux command-line applications including:
    - Tools: vim, emacs, tmux
    - Languages: NodeJS, Javascript, Python, Ruby, C/C++, C## & F##, Rust, Go, etc.
    - Services: SSHD, MySQL, Apache, Lighttpd, MongoDB, PostgreSQL.
- Install additional software using your own GNU/Linux distribution package manager.
- Invoke Windows applications using a Unix-like command-line shell.
- Invoke GNU/Linux applications on Windows.

## What is WSL 2?

WSL 2 is a new version of the Windows Subsystem for Linux architecture that powers the Windows Subsystem for Linux to run ELF64 Linux binaries on Windows. Its primary goals are to increase file system performance, as well as adding full system call compatibility.

This new architecture changes how these Linux binaries interact with Windows and your computer's hardware, but still provides the same user experience as in WSL 1 (the current widely available version).

Individual Linux distributions can be run with either the WSL 1 or WSL 2 architecture. Each distribution can be upgraded or downgraded at any time and you can run WSL 1 and WSL 2 distributions side by side. WSL 2 uses an entirely new architecture that benefits from running a real Linux kernel. Let's see the comparison between ` WSL 1 ` and ` WSL 2 `

## Comparing WSL 1 and WSL 2
The primary difference and reasons for updating the Windows Subsystem for Linux from WSL 1 to WSL 2 are to:

  - increase file system performance,
  - support full system call compatibility.
    WSL 2 uses the latest and greatest in virtualization technology to run a Linux kernel inside of a lightweight utility virtual machine (VM). However, WSL 2 is not a traditional VM experience.

### Comparing features

| Feature                                                      | WSL 1 | WSL 2 |
| ------------------------------------------------------------ | ----- | ----- |
| Integration between Windows and Linux                        | ✅     | ✅     |
| Fast boot times                                              | ✅     | ✅     |
| Small resource foot print compared to traditional Virtual Machines | ✅     | ✅     |
| Runs with current versions of VMware and VirtualBox          | ✅     | ✅     |
| Managed VM                                                   | ❌     | ✅     |
| Full Linux Kernel                                            | ❌     | ✅     |
| Full system call compatibility                               | ❌     | ✅     |
| Performance across OS file systems                           | ✅     | ❌     |

## Performance across OS file systems

We recommend against working across operating systems with your files, unless you have a specific reason for doing so. For the fastest performance speed, store your files in the WSL file system if you are working in a Linux command line (Ubuntu, OpenSUSE, etc). If you're working in a Windows command line (PowerShell, Command Prompt), store your files in the Windows file system.

For example, when storing your WSL project files:

- Use the Linux file system root directory: `\\wsl$\Ubuntu-18.04\home\<user name>\Project`
- Not the Windows file system root directory: `C:\Users\<user name>\Project`

All currently running distributions (`wsl -l`) are accessible via network connection. To get there run a command [WIN+R] (keyboard shortcut) or type in File Explorer address bar `\\wsl$` to find respective distribution names and access their root file systems.

You can also use windows commands inside WSL's Linux [Terminal](https://en.wikipedia.org/wiki/Linux_console). Try opening a Linux distribution (ie Ubuntu), be sure that you are in the Linux home directory by entering this command: `cd ~`. Then open your Linux file system in File Explorer by entering *(don't forget the period at the end)*: `powershell.exe /c start .`

WSL 2 is only available in Windows 10, Version 1903, Build 18362 or higher. Check your Windows version by selecting the **Windows logo key + R**, type **winver**, select **OK**. (Or enter the `ver` command in Windows Command Prompt). You may need to [update to the latest Windows version](ms-settings:windowsupdate). For builds lower than 18362, WSL is not supported at all.

## Installation of WSL 2

There are two options available for installing Windows Subsystem for Linux (WSL):

- **[Simplified install](https://docs.microsoft.com/en-us/windows/wsl/install-win10#simplified-installation-for-windows-insiders)** *(preview release)*: `wsl --install`

  The `wsl --install` simplified install command requires that you join the [Windows Insiders Program](https://insider.windows.com/getting-started) and install a preview build of Windows 10 (OS build 20262 or higher), but eliminates the need to follow the manual install steps. All you need to do is open a command window with administrator privileges and run `wsl --install`, after a restart you will be ready to use WSL.

### Manual Installation Steps

If you are not on a Windows Insiders build, the features required for WSL will need to be enabled manually following the steps below.

- #### Step 1 - Enable the Windows Subsystem for Linux

You must first enable the "Windows Subsystem for Linux" optional feature before installing any Linux distributions on Windows.

Open PowerShell as Administrator and run:

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

- #### Step 2 - Check requirements for running WSL 2

To update to WSL 2, you must be running Windows 10.

- For x64 systems: **Version 1903** or higher, with **Build 18362** or higher.
- For ARM64 systems: **Version 2004** or higher, with **Build 19041** or higher.
- Builds lower than 18362 do not support WSL 2. Use the [Windows Update Assistant](https://www.microsoft.com/software-download/windows10) to update your version of Windows.

If you are running Windows 10 version 1903 or 1909, open "Settings" from your Windows menu, navigate to "Update & Security" and select "Check for Updates". Your Build number must be 18362.1049+ or 18363.1049+, with the minor build # over .1049. Read more: [WSL 2 Support is coming to Windows 10 Versions 1903 and 1909](https://devblogs.microsoft.com/commandline/wsl-2-support-is-coming-to-windows-10-versions-1903-and-1909/). See the [troubleshooting instructions](https://docs.microsoft.com/en-us/windows/wsl/troubleshooting#im-on-windows-10-version-1903-and-i-still-do-not-see-options-for-wsl-2).

- ### Step 3 - Enable Virtual Machine feature

Before installing WSL 2, you must enable the **Virtual Machine Platform** optional feature. Your machine will require [virtualization capabilities](https://docs.microsoft.com/en-us/windows/wsl/troubleshooting#error-0x80370102-the-virtual-machine-could-not-be-started-because-a-required-feature-is-not-installed) to use this feature.

Open PowerShell as Administrator and run:

```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

**Restart** your machine to complete the WSL install and update to WSL 2.

- ### Step 4 - Download the Linux kernel update package

Download the latest package:

- [WSL2 Linux kernel update package for x64 machines](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)

If you're using an ARM64 machine, please download the [ARM64 package](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_arm64.msi) instead. If you're not sure what kind of machine you have, open Command Prompt or PowerShell and enter: `systeminfo | find "System Type"`. **Caveat:** On non-English Windows versions, you might have to modify the search text, for example, in German it would be `systeminfo | find "Systemtyp"`.

- Run the update package downloaded in the previous step. (Double-click to run - you will be prompted for elevated permissions, select ‘yes’ to approve this installation.)

- #### Step 5 - Set WSL 2 as your default version

Open PowerShell and run this command to set WSL 2 as the default version when installing a new Linux distribution:

```powershell
wsl --set-default-version 2
```

- ####  Step 6 - Install your Linux distribution of choice

1. manual installation

If you are on ` Windows 10 Insider Preview build 21362+ ` then just type the following commands in powershell

```powershell
#this command will show you list of all distribution which is been supported by windows
wsl --list --online
```

as soon as paste the above command you will get this message there

```
PS C:\Users\SIDDH> wsl --list --online
The following is a list of valid distributions that can be installed.
Install using 'wsl --install -d <Distro>'.

NAME            FRIENDLY NAME
Ubuntu          Ubuntu
Debian          Debian GNU/Linux
kali-linux      Kali Linux Rolling
openSUSE-42     openSUSE Leap 42
SLES-12         SUSE Linux Enterprise Server v12
Ubuntu-16.04    Ubuntu 16.04 LTS
Ubuntu-18.04    Ubuntu 18.04 LTS
Ubuntu-20.04    Ubuntu 20.04 LTS
```

you can choose any of the distro you want to install in your system say for example if you want to install Ubuntu then just past the following command

```powershell
wsl --install -d ubuntu
```

and it will start installing into your system after completion it will ask you for a username and password set those two parameters and you will be able to use Ubuntu in your system without dual-boot

![Ubuntu Install](https://docs.microsoft.com/en-us/windows/wsl/media/ubuntuinstall.png)

2. Open the [Microsoft Store](https://aka.ms/wslstore) and select your favorite Linux distribution.

![Microsoft Store](https://docs.microsoft.com/en-us/windows/wsl/media/store.png)

The following links will open the Microsoft store page for each distribution:

- [Ubuntu 18.04 LTS](https://www.microsoft.com/store/apps/9N9TNGVNDL3Q)
- [Ubuntu 20.04 LTS](https://www.microsoft.com/store/apps/9n6svws3rx71)
- [openSUSE Leap 15.1](https://www.microsoft.com/store/apps/9NJFZK00FGKV)
- [SUSE Linux Enterprise Server 12 SP5](https://www.microsoft.com/store/apps/9MZ3D1TRP8T1)
- [SUSE Linux Enterprise Server 15 SP1](https://www.microsoft.com/store/apps/9PN498VPMF3Z)
- [Kali Linux](https://www.microsoft.com/store/apps/9PKR34TNCV07)
- [Debian GNU/Linux](https://www.microsoft.com/store/apps/9MSVKQC78PK6)
- [Fedora Remix for WSL](https://www.microsoft.com/store/apps/9n6gdm4k2hnc)
- [Pengwin](https://www.microsoft.com/store/apps/9NV1GV1PXZ6P)
- [Pengwin Enterprise](https://www.microsoft.com/store/apps/9N8LP0X93VCP)
- [Alpine WSL](https://www.microsoft.com/store/apps/9p804crf0395)

- #### Install Windows Terminal (optional)

Windows Terminal enables multiple tabs (quickly switch between multiple Linux command lines, Windows Command Prompt, PowerShell, Azure CLI, etc), create custom key bindings (shortcut keys for opening or closing tabs, copy+paste, etc.), use the search feature, and custom themes (color schemes, font styles and sizes, background image/blur/transparency).

[Install Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/get-started).

![Windows Terminal](https://docs.microsoft.com/en-us/windows/wsl/media/terminal.png)

Now you can use linux as well as windows at a same time. In next post we will be seeing how to GUI app in WSL2.

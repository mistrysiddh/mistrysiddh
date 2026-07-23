---
title: "Update any PC to Windows 11"
subtitle: "Installing Windows 11 on PCs that 'don't meet requirements'"
description: "This is a guide going over updating any PC to Windows 11 that “doesn’t meet requirements” or doesn’t use Secure Boot or has a TPM 2.0 chip."
cover: /images/posts/winver_KHcHK2lCu3.png
categories:
  - Windows
tags:
  - technology
  - windows 11
date: 2021-07-10 19:06:27
featured: false
version: "v1.0"
---
![Update Any PC ti Win11](/images/posts/winver_KHcHK2lCu3.png)
## Requirement software

1. Latest version Windows 11. [Download](https://letsupload.io/2Txxv/21996.1.210529-1541.co_release_CLIENT_CONSUMER_x64FRE_en-us.iso)
2. Winrar. [Download](https://www.rarlab.com/download.htm)
3. Rufuse. [Download](https://rufus.ie/)
4. TPM fix. [Download](https://www.mistrysiddh.tk/files/fix_TPM_error.zip) (if its prompt for password then enter `123`)

## Windows Insider Registration
The path for upgrading to 11 requires you to have an activated Windows 10 PC and be subscribed to the insider builds.

Insider builds can be registerd for use  [https://insider.windows.com/](https://insider.windows.com/)

## System Modification

Windows 11 does checks for TPM and Secure boot before it allows the upgrade process to start. However, these can be bypassed.

Note: It is important to understand Microsoft can at ANY TIME enforce these rules or ignore these modifications which means you would NO LONGER recieve updates

Here is the registry edits that need to be made: (win11bypass.reg)

```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig]
"BypassTPMCheck"=dword:00000001
"BypassSecureBootCheck"=dword:00000001
```

Download Reg File here: [https://www.mistrysiddh.tk/files/win11bypass.reg](https://www.mistrysiddh.tk/files/win11bypass.reg)

![Regedit](/images/posts/regedit_jC4CAtccM9.png)
`REBOOT AFTER MODIFICATIONS MADE`

## TPM & Secure Boot Fix
Copy Windows 11 and TPM fix in one folder

![Windows 11 & TPM fix](/images/posts/explorer_XHraYMkR0O.png)

Extract both the ISO and zip in that folder after that open `fix_TPM_error` and copy both the files and past it in `21996.1.210529-1541.co_release_CLIENT_CONSUMER_x64FRE_en-us (1)/sources` folder it will as you for replacing the file replace it.

![file replace](/images/posts/lkpepc63fl.png)

Now go back `21996.1.210529-1541.co_release_CLIENT_CONSUMER_x64FRE_en-us (1)` folder and run `setup.exe` select the options of your like.

![Setup.exe](/images/posts/SetupHost_DDXsib9QUZ.png)

## Congratulation
Congratulation now you have successfully install Windows 11 on your system

![winver](/images/posts/winver_KHcHK2lCu3.png)

## Mr. Blogger

### Podcast

<iframe src="https://open.spotify.com/embed/show/6p14uYsO8NtWD8tM3wEd4o" width="100%" height="232" frameBorder="0" allowtransparency="true" allow="encrypted-media"></iframe>

### Social Media

- Instagram - [https://instagram.com/mistrysiddh](https://instagram.com/mistrysiddh)
- Github - [https://guthub.com/mrfoxie](https://guthub.com/mrfoxie)
- Linkedin - [https://www.linkedin.com/in/SiddhMistry/](https://www.linkedin.com/in/SiddhMistry/)
- Whatsapp - [Message Me](https://api.whatsapp.com/send?phone=916355040470&text=http%3A%2F%2Fmistrysiddh.tk%2F)
- Discord - [https://discord.gg/bPrBSbQ2W4](https://discord.gg/bPrBSbQ2W4)

### Donation

- Paypal - [https://paypal.me/mistrysiddh](https://paypal.me/mistrysiddh)
- Patreon - [https://www.patreon.com/siddhmistry](https://www.patreon.com/siddhmistry)
- Buymeacoffee - [https://www.buymeacoffee.com/mistrysiddh](https://www.buymeacoffee.com/mistrysiddh)

### Play Store

[![Get it on Google Play](https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png)](https://bit.ly/2Vch9gi)


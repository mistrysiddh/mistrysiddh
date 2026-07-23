---
title: "Uninstall Edge"
subtitle: "Removing Edge Chromium for good, without it creeping back"
description: "This goes over Removing Microsoft Edge Chromium edition and keeping it removed."
cover: /images/posts/uninstall-edge.jpg
categories:
  - Windows
tags:
  - windows 1
  - technology
date: 2021-08-20 10:34:48
featured: false
version: "v1.0"
---

## The Problem

Microsoft Edge has taken over PDF viewer, and other default web tasks. Even when manually removing it will reinstall via windows updates.

## Removing the Base Install

We first need to find the Edge install of the chromium edition in your Program Files. 

Location:

```
C:\Program Files (x86)\Microsoft\Edge\Application\
```

The setup program is what we need to uninstall edge. Go to the location above and drill down from the number and Install folder

Example:

```
C:\Program Files (x86)\Microsoft\Edge\Application\92.0.902.62\Installer
```

Once you find your path you can now uninstall edge with the following command _(Note: YOURS WILL BE DIFFERENT!)_

```
C:\Program Files (x86)\Microsoft\Edge\Application\92.0.902.62\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
```

## Keep it from coming back... for now

You now need to add a registry entry. The following location `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate` needs to be added with a DWORD called `DoNotUpdateToEdgeWithChromium` with a value of `1`. 

You can do this with a simply reg file. (`stopedge.reg`)

```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate]
"DoNotUpdateToEdgeWithChromium"=dword:00000001
```

Create this file or download the file @ [https://www.mistrysiddh.tk/files/stopedge.zip](https://www.mistrysiddh.tk/files/stopedge.zip)

Run this to prevent edge reinstallation. *Note: Microsoft will kill this workaround in the future and force edge on you*


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


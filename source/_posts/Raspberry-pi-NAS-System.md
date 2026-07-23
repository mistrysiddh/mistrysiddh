---
title: "Raspberry Pi NAS System"
subtitle: "Turn a Raspberry Pi into your own NAS, at home or on the go"
description: "Use your Raspberry Pi as NAS server at home or on a drive wherever you go. Simple steps to install and easy to set up everything"
cover: /images/posts/raspberry-pi-nas.jpg
categories:
  - Raspberry Pi
  - Self Hosting
tags:
  - new site
  - technology
  - Linux
  - industrial automation
date: 2022-02-11 14:17:46
featured: true
version: "v1.0"
---

![PI NAS](https://i.ytimg.com/vi/Jc4Y2jA4Yeg/maxresdefault.jpg)

## Overview

We will be seeing a fully functional NAS server on Raspberry Pi(all pi version) homemade with simple few lines of command and with one software require before we start we will be requiring a few things before we start.

## Requirments
- Laptop or Desktop
- Stable internet connection(Mobile or Router no matter which connection is it)
- Raspberry Pi with 4GB+ ram (mine is Raspberry Pi 4 B+ model with 8GB of ram)
- MicroSD card with a minimum of 8GB size
- Power supply (power bank or cell phone adaptor)
- MicroB to HDMI with monitor(optional) if you're going to use a monitor then you will be needing of keyboard
- And most important thing a cup of [coffee](https://www.buymeacoffee.com/mistrysiddh)

## Step 1 Hardware setup
Ok first of all we need some software which will help us to flash memory card so that we can install os in the memory card to boot in pi. 

![Raspberry pi software](/images/posts/raspberry-pi.png)

Go to [https://www.raspberrypi.com/software/](https://www.raspberrypi.com/software/) and download software according to your OS I'm using Zorin OS which is based on Ubuntu so I will be using the terminal. If you are using terminal use the following command

```
sudo apt install rpi-imager
```
as you can see in the below image I have already installed it on my device
![Terminal](/images/posts/terminal-pi.png)

Go ahead and open it up after opening it up plugin your 8GB or higher sd card on your laptop. as you can see in the image I have inserted 8GB of card
![Disk](/images/posts/disk-pi.png)

Now do the following steps as soon in the photo's 

![Disk](/images/posts/raspberrypi-software.png)

![Disk](/images/posts/raspberrypi-software1.png)
Select **Raspberry Pi OS(other)**

![Disk](/images/posts/raspberrypi-software2.png)
Then select **Raspberry Pi OS Lite (Legacy)**

![Disk](/images/posts/raspberrypi-software3.png)

Now select your disk but before writing your os we will configure it first so that we don't have to connect any kind of ethernet cable or mini Wi-Fi. Press ` ALT + SHIFT + X ` to open secret setting 

![Disk](/images/posts/raspberrypi-software4.png)
**Note:** set your hostname and remember it we will be needing it later

![Disk](/images/posts/raspberrypi-software5.png)
Click on Yes and let it complete it. After that, you will be granted this message so it means that it is been completed.

![Disk](/images/posts/raspberrypi-software6.png)

# Step 2

After that plug, it into pi and power it on, well as the pi is doing some process grab a cup of [coffee](https://www.buymeacoffee.com/mistrysiddh) and wait for a few minutes.

![A few moments later](https://gifimage.net/wp-content/uploads/2018/11/gif-a-few-moment-later.gif)

Open up your terminal and enter the following command

```
# as you remember I have told you to set your hostname in the software and remember it.
ssh pi@hostname.local
```
Replace your hostname with the hostname you have set while preparing the sd card. In my case, I have set my hostname with datacenter so my command will be like this

```
ssh pi@datacenter.local
```

![Pi Login](/images/posts/terminal-pi-login.png)

as soon as you hit enter it will as you for a conformation like this
```
~ ➤ ssh pi@datacenter.local                                                   
The authenticity of host 'datacenter.local (192.168.32.200)' can't be established.
ECDSA key fingerprint is SHA256:VlnqrEfP5pLc62h2TQbN0Z4pEudRsmRQL4+LqDD6ZB8.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```
answer it with **yes** after that it will as you for a password which we have set during the software installation. As you have given the password right then you will see that you have been login into your account successfully like I did.

![Pi Login Successful](/images/posts/pi-login.png)

Congratulation we have been login successfully into our pi take a break grab a cup of [coffee](https://www.buymeacoffee.com/mistrysiddh) and relax.


## Step 2 Software setup

As we successfully login into pi first we will update the repository as well as we will be upgrading it by the following command don't worry if you haven't used Linux in your life this will be your first experience as well as it will be really easy just follow my steps.


### Update and Upgradation of packages
```
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
```
The above command will update the repositories as well as it will be upgrading all the packages which are outdated so that we don't get any kind of error while installing our NAS software. It will take a few minutes after all the process is completed we will check once again if there is any software that is left to upgrade by the following command.

```
sudo apt update && sudo apt list --upgradable
```
The following command will check whether any package is upgradable or not, if its all upgrade then it will return it with this message

![Pi updated](/images/posts/pi-updated.png)

### Packages installation

Now we will be requirement few software for NAS to install without any error follow me

```
sudo apt install wget htop -y
```
These packages are preinstalled but in some cases, these packages are not been installed so we will be making sure that it's installed.

### Script installation
This script will not affect your network connection but if it did then I will leave a tutorial at the end of installation ([Wi-Fi setup](#wi-fi-setup)). Clear your terminal by using the `clear` command it will clear your terminal so that you can see it easily. Now past this script into the terminal so that installation start's

```
wget https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install
chmod +x install
sudo ./install -n
```
Sit back and relax until the process is been done till that time go ahead and give me a cup of [coffee](https://www.buymeacoffee.com/mistrysiddh) so that I can bring up various kinds of this topic so that you can enjoy it

![Install complate](/images/posts/nas-installation-complete.png)
Congratulation it's been installed completed for our protection we will reboot our system with the following command `sudo reboot`.


## Step 3 NAS setup on browser
As in [Step 2 Software setup](#step-2-software-setup) we have installed once again we will be login into ssh account to check the IP address of our Pi use the following command to check the IP address
```
hostname -I
```
![Finding IP address](/images/posts/hostname.png)
After finding your IP address use that IP address and open it in the browser with `https://your_ip_address` and it will grant you this page

![OpenMediaVault](/images/posts/openmediavault.png)
Now now don't be frightened of the login page because you don't know the password and username well of course I also don't know. Just joking type the following and it will let you in

```txt
username: admin
password: openmediavault
```
Congratulation you have successfully login, now before doing anything we will go ahead and change the password you will grant with this screen

![Admin Panel](/images/posts/omv-admin.png)

### Changing admin panel password
Go to **System** >> **General Settings** >> Click on **Web Administrator Password** then enter your new password after doing that we will plug in any kind of hard drive or some sort of memory storing device
![Password Change](/images/posts/omv-password-change.png)

### Storage setup
As we have inserted external storage head over to **Storage** >> **Disk** and there you will be able to see your storage mounted on pi in my case I have inserted 128GB of memory card for the testing purpose also I have a few files copied into it

![Disk](/images/posts/omv-disk.png)

Select the disk and then click on Wipe

![Disk Wipe](/images/posts/omv-disk-wipe.png)

![Disk Wipe]

As we have confirmed that our storage is been mounted on our pi now we will make a shared folder so that we can access it from any device.

![Storage Delete](/images/posts/omv-storage-delete.png)

Now select the quick option

![Storage Delete](/images/posts/omv-storage-delete-1.png)


### File System setup

After wiping the data from the drive click on `File System` in the `Storage` section. Click on Add button and select `Device` and select the device and give it a label of your choice I will be giving it the name DataCenter, and make sure that you select `EXT4` in `File System`.

![Adding Device](/images/posts/omv-adding-device.png)

After hitting Yes to add device take a cup of [coffee](https://www.buymeacoffee.com/mistrysiddh) and wait for it

![Adding Device Complete](/images/posts/omv-adding-device-complete.png)

Select your device and click on the mount option to mount your device. A pop-up has been visible on the top just hit on the `Apply` button to apply changes so that to make sure that what are we going to make changes will work properly. It will take a few minutes to complete the process.

### Sharing Folder setup
![Folder Sharing](/images/posts/omv-folder-setup.png)
Now we will head to `Sharing Folder Setup` to set up our sharing folder. Go to `Access Rights Management` > `Shared Folders`  when you will go there you will find it empty because we haven't set up any sharing folder go ahead and hit that `Add` button without any thoughts.
![Folder Sharing Setup](/images/posts/omv-folder-setup-1.png)

Fill in all the details according to your need and make sure to leave `Permission` as it is until and unless you know the purpose of it. I will be labeling it as DataCenter if you want to comment on that device then you can otherwise Save it, again you will see Apply button on the top right side of the screen as shown in the image below it will take a while to apply the changes.

![Folder Sharing Setup](/images/posts/omv-folder-setup-2.png)

We will permit it so that we can `Read/Write` files into it. Select your newly created folder and click `Privileges` and give `Read/Write` to both pi users. Hit save and apply.

### Services Setup

Go to the **Services** section and select `SMB/CIFS` as soon as you select it you will be granted a screen with soo many scary options but don't worry we will be using only 2 options only. So go ahead and click sharing in the `SMB/CIFS` section.

![Samba Service](/images/posts/omv-service-smb-page.png)

![Samba Service](/images/posts/omv-services-smb-share.png)

Go ahead click on the `Add` button select your shared folder which you have been created. Hit save and apply don't change any other kind of options if your expert then only does it or else let it be as it is. Go back to the `SMB/CIFS` setting page and enable it. Hit save and apply. Take a cup of [coffee](https://www.buymeacoffee.com/mistrysiddh) and relax for a bit because we are coming to the most intrusting part which is accessing it from our devices.


## Accessing our NAS

<iframe width="560" height="315" src="https://www.youtube.com/embed/gwM9RaemCvE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
Before we move on `Windows User` please see the above video to enable `SMB`, as I'm on Ubuntu I can directly access it

![NAS Test](/images/posts/omv-nas-folder.png)
![NAS Test](/images/posts/omv-nas-auth.png)
If you try to access it, it will as you for authentication so use your pi account and password which you used while setting up os if it fails then go to `Access Rights Management` > `User`, select pi user, and edit it after that add your new password and save it. go back to the folder and try to login back and you will be successfully logged in to NAS Folder

![NAS Folder Access](/images/posts/omv-nas-folder-access.png)

##  Wi-Fi Setup
If you're going to use Wi-Fi then connect to a monitor and attach a keyboard then simply type the following command in the terminal to access the raspberry pi configuration setup

```
sudo raspi-config
# it will represent you with the screen bellow
```
![Wifi Setup](/images/posts/raspberrypi-wifi-setup.png)

Select `System Options` > `Wireless LAN` > Enter your Wi-Fi Name > Enter your Wi-Fi password
![Wifi Setup](/images/posts/raspberrypi-wifi-setup-1.png)
![Wifi Setup](/images/posts/raspberrypi-wifi-setup-2.png)
![Wifi Setup](/images/posts/raspberrypi-wifi-setup-3.png)

After completing all the above steps reboot your system with `sudo reboot` and bam done.


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


---
title: "ROS on Raspberry PI 4"
subtitle: "Getting the Robot Operating System running on a Pi 4"
description: ""
cover: /images/posts/ros-raspberrypi.png
categories:
  - Raspberry Pi
tags:
  - new site
  - technology
  - Linux
  - industrial automation
date: 2022-10-17 07:06:04
featured: true
version: "v1.0"
---

![ROS](/images/posts/ros-raspberrypi.png)

# Overview

We will be install ROS on Raspberry PI 4 without Ubuntu. In this tutorial we we will be using docker insted of using ubuntu or any other software.


# Requirments
- Laptop or Desktop
- Stable internet connection(Mobile or Router no matter which connection is it)
- Raspberry Pi with 4GB+ ram (mine is Raspberry Pi 4 B+ model with 8GB of ram)
- MicroSD card with a minimum of 32GB size
- Power supply (power bank or cell phone adaptor)
- MicroB to HDMI with monitor(optional) if you're going to use a monitor then you will be needing of keyboard
- And most important thing a cup of [coffee](https://www.buymeacoffee.com/mistrysiddh)


# Step 1 - Hardware setup
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
Then select **Raspberry Pi OS with desktop**

![Disk](/images/posts/raspberrypi-software3.png)

Now select your disk but before writing your os we will configure it first so that we don't have to connect any kind of ethernet cable or mini Wi-Fi. Press ` ALT + SHIFT + X ` to open secret setting 


![Disk](/images/posts/raspberrypi-software4.png)
**Note:** set your hostname and remember it we will be needing it later

![Disk](/images/posts/raspberrypi-software5.png)
Click on Yes and let it complete it. After that, you will be granted this message so it means that it is been completed.

![Disk](/images/posts/raspberrypi-software6.png)

# Step 2 - Booting UP

Remove your memory card from the computer and plug that it into pi and power it on, well as the pi is doing some process grab a cup of [coffee](https://www.buymeacoffee.com/mistrysiddh) and wait for a few minutes.

![A few moments later](https://gifimage.net/wp-content/uploads/2018/11/gif-a-few-moment-later.gif)

Open up your terminal and enter the following command

```bash
# as you remember I have told you to set your hostname in the software and remember it.
ssh pi@hostname.local
```
Replace your hostname with the hostname you have set while preparing the sd card. In my case, I have set my hostname with datacenter so my command will be like this

```text
ssh pi@datacenter.local
```

![Pi Login](/images/posts/terminal-pi-login.png)

as soon as you hit enter it will as you for a conformation like this
```text
~ ➤ ssh pi@datacenter.local                                                   
The authenticity of host 'datacenter.local (192.168.32.200)' can't be established.
ECDSA key fingerprint is SHA256:VlnqrEfP5pLc62h2TQbN0Z4pEudRsmRQL4+LqDD6ZB8.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```
answer it with **yes** after that it will as you for a password which we have set during the software installation. As you have given the password right then you will see that you have been login into your account successfully like I did.

![Pi Login Successful](/images/posts/pi-login.png)

Congratulation we have been login successfully into our pi take a break grab a cup of [coffee](https://www.buymeacoffee.com/mistrysiddh) and relax.

# Step 3 - Software setup

As we successfully login into pi first we will update the repository as well as we will be upgrading it by the following command don't worry if you haven't used Linux in your life this will be your first experience as well as it will be really easy just follow my steps.

## Update and Upgradation of packages

```bash
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
```

The above command will update the repositories as well as it will be upgrading all the packages which are outdated so that we don't get any kind of error while installing. It will take a few minutes after all the process is completed we will check once again if there is any software that is left to upgrade by the following command.

```bash
sudo apt update && sudo apt list --upgradable
```

The following command will check whether any package is upgradable or not, if its all upgrade then it will return it with this message

![Pi updated](/images/posts/pi-updated.png)

## Package Installation

Now we will install some few pre-required software so that we will use it properly. Follow me oh and don't forget your cup of [coffee](https://www.buymeacoffee.com/mistrysiddh) ;)

```bash
sudo apt update
sudo apt install nano wget git curl htop -y
sudo init 6 # this command will restart your Raspberry PI4
```

# Step 4 - Getting docker

There is a script which will help us to easily install docker on our PI without any command just a single command and then run it. Right simple as it says lets give it a run.

Download the following scipt

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
```
After downloading it script rut it with super user permission(root access)

```bash
sudo bash get-docker.sh
```

Grab your cup of [coffee](https://www.buymeacoffee.com/mistrysiddh) and wait till the installtion is over

Once Docker is installed, add your login user to the docker group with the following command:

```bash
sudo usermod -aG docker $(whoami)
```
For our safty we will reboot out PI for external changes


```bash
sudo init 6
```

After rebooting just check docker verion by following command:

```bash
docker version # if the following command wont work then add sudo in front of it
```

This is the following version which im running right now:

```text
docker version
Client: Docker Engine - Community
 Version:           20.10.19
 API version:       1.41
 Go version:        go1.18.7
 Git commit:        d85ef84
 Built:             Thu Oct 13 16:45:42 2022
 OS/Arch:           linux/arm64
 Context:           default
 Experimental:      true

Server: Docker Engine - Community
 Engine:
  Version:          20.10.19
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.18.7
  Git commit:       c964641
  Built:            Thu Oct 13 16:44:07 2022
  OS/Arch:          linux/arm64
  Experimental:     false
 containerd:
  Version:          1.6.8
  GitCommit:        9cd3357b7fd7218e4aec3eae239db1f68a5a6ec6
 runc:
  Version:          1.1.4
  GitCommit:        v1.1.4-0-g5fd4c4d
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

# Step 5 - Installing Docker composer

Docker Compose is a tool for automating Docker projects using a YAML file. With the help of thi file you can create many project from scratch as I did.

```bash
sudo apt install python3-pip -y
```

`PIP` is a tool which will help us to install docker composer. If it already install then we will move on to the next step

```bash
sudo pip3 install docker-compose
```

After installing docker composer we will check wheather it is installed properly or not

```text
docker-compose version
docker-compose version 1.29.2, build unknown
docker-py version: <module 'docker.version' from '/usr/local/lib/python3.10/dist-packages/docker/version.py'>
CPython version: 3.10.7
OpenSSL version: OpenSSL 3.0.5 5 Jul 2022
```

# Step 6 - Installation of ROS (semi-final step)

Before going further we will just give it a reboot so that we make sure that everything is working propely

```bash
sudo init 6
```

As we have rebooted our system we will now search for our docker repository by using docker search command

```bash
docker search siddhmistry
NAME                   DESCRIPTION              STARS     OFFICIAL   AUTOMATED
siddhmistry/mrfoxie                             0                    
siddhmistry/ros_rpi4   ROS for Raspberry PI 4   0  
```

We need to install second one which is second one `siddhmistry/ros_rpi4` follow the following steps

```bash
xhost +
docker pull siddhmistry/ros_rpi4:armhf
docker container run -it --name ROS_RPI4 --net=host -e DISPLAY siddhmistry/ros_rpi4:armhf
```

Now it will take come time so have a [coffee](https://www.buymeacoffee.com/mistrysiddh) break

# Step 7 - Final step

As by now you have noticed that a terminator has been popped up run the following command so that we can setup our ROS System

```bash
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

As we have completed all the steps try to run `roscore` if this commands works then you have successfully installed it. Press `Ctrl + C` to exit roscore after that type `exit` to exit it. Now that we have done everything we just need to install just a small thing which is called Portainer which will help to run this container easily

# Step 8 - Installing Portainer

As we know we have already install docker so we will start installing Portainer so just follow the steps

First, create the volume that Portainer Server will use to store its database:

```bash
docker volume create portainer_data
```

Then, download and install the Portainer Server container:

```bash
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

Portainer Server has now been installed. You can check to see whether the Portainer Server container has started by running `docker ps`:

```bash
docker ps
CONTAINER ID   IMAGE                          COMMAND                  CREATED       STATUS      PORTS                                                                                  NAMES             
de5b28eb2fa9   portainer/portainer-ee:latest  "/portainer"             2 weeks ago   Up 9 days   0.0.0.0:8000->8000/tcp, :::8000->8000/tcp, 0.0.0.0:9443->9443/tcp, :::9443->9443/tcp   portainer
```

Now that the installation is complete, you can log into your Portainer Server instance by opening a web browser and going to: [portainer](https://localhost:9443)


```bash
https://localhost:9443
```

When you open the url you will be asked to steup admin username and password after login into the admin panel it looks like this

![Portainer](/images/posts/portainer-admin-panel.png)

Here you will see a local enviroment click on it and this page will open it up:

![Portainer Enviroment](/images/posts/portainer-admin-panel-env.png)

At the left side panel you will able to see `Containers` option. When you open that page it will grant you with some containers.

![Portainer Enviroment](/images/posts/portainer-admin-panel-containers.png)

You will see that there is a container name `ROS_PI4` select it and press start anf baam it started working. Portainer is a tool where it will help you control your container and also to add more containers in it. I hope you loved it.


# Mr. Blogger

## Podcast

<iframe src="https://open.spotify.com/embed/show/6p14uYsO8NtWD8tM3wEd4o" width="100%" height="232" frameBorder="0" allowtransparency="true" allow="encrypted-media"></iframe>

## Social Media

- Instagram - [https://instagram.com/mistrysiddh](https://instagram.com/mistrysiddh)
- Github - [https://guthub.com/mrfoxie](https://guthub.com/mrfoxie)
- Linkedin - [https://www.linkedin.com/in/SiddhMistry/](https://www.linkedin.com/in/SiddhMistry/)
- Whatsapp - [Message Me](https://api.whatsapp.com/send?phone=916355040470&text=http%3A%2F%2Fmistrysiddh.tk%2F)
- Discord - [https://discord.gg/bPrBSbQ2W4](https://discord.gg/bPrBSbQ2W4)

## Donation

- Paypal - [https://paypal.me/mistrysiddh](https://paypal.me/mistrysiddh)
- Patreon - [https://www.patreon.com/siddhmistry](https://www.patreon.com/siddhmistry)
- Buymeacoffee - [https://www.buymeacoffee.com/mistrysiddh](https://www.buymeacoffee.com/mistrysiddh)

## Play Store

[![Get it on Google Play](https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png)](https://bit.ly/2Vch9gi)


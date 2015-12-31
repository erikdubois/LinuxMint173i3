# Minty i3 improved tiling windows manager
Installing i3 wm on Linux Mint 17.1 cinnamon

We start from an up-to-date Linux Mint 17.1 cinnamon as described on 
http://erikdubois.be/category/linux-mint



<a target="_blank" href="http://erikdubois.be/wp-content/uploads/2015/05/final_linuxmint171.png">
<img style="max-width:100%;" data-canonical-src="http://erikdubois.be/wp-content/uploads/2015/05/final_linuxmint171.png" alt="alt tag" src="http://erikdubois.be/wp-content/uploads/2015/05/final_linuxmint171.png">
</a>

#Installation procedure

First install Linux Mint 17.1 like you always would.

Then update.

Download and use proprietary drivers if needed.
Broadcom, nvidia, ati and the likes.

Upgrade your kernel if you want to. 

Get that out of the way. 

Do get the code from github. Install git first

	sudo apt-get install git

Then

	git clone https://github.com/erikdubois/mintyi3wm.git

This folder is my content of the .i3 directory.

You can copy/paste all of this in the hidden folder, do a file by file copy to your liking or only copy/paste a few lines. But everything is linked together. Some items will not work if you skip ahead.

Then you follow the steps in the installation folder. Step-1, Step-2 etc Step x is the dangerous one. You decide if you want to do that.

Some of these steps are optional. It is ofcourse my personal setup, made to suite me and to be run on a dual screen of 1680x1050 pixels.

Read before you just run a script!!

First time copy/paste line per line in a terminal.

# Overview

- installation of i3
- installation script to download and install all relevant software
- tuning of i3
	- i3 version is old on linux mint - building from github
	- dmenu with larger font and personal colors
	- j4-dmenu-desktop with larger font and personal colors
	- i3status bar replaced with i3blocks
	- lots of shortcuts in config file
	- keyboard shortcuts for Spotify
	- dual-screen settings
	- programs fixed to one screen
	- zsh instead of bash - very eyecandy due to many themes
	- theming and icons gtk2 and gtk3
	- dropbox integration
	- firefox theming
	- gimp scripts
	- google chrome theming
	- terminator theming
	- variety for changing wallpapers
	- autologin in mdm
	- how to install to latest kernel
	- how to install to latest nvidia

# Optional I3 next gap

I have learned of this 'spin-off' and I like the visual aspect of it and I still have enough room on my screens to do the work efficiently.
You can read more on their github site.

https://github.com/Airblader/i3/tree/gaps-next


# E N D   R E S U L T

Without gaps

<a target="_blank" href="http://erikdubois.be/wp-content/uploads/2015/05/i3_on_linux_mint_17_1.png">
<img style="max-width:100%;" data-canonical-src="http://erikdubois.be/wp-content/uploads/2015/05/i3_on_linux_mint_17_1.png" alt="alt tag" src="http://erikdubois.be/wp-content/uploads/2015/05/i3_on_linux_mint_17_1.png">
</a>

With gaps

<a target="_blank" href="http://erikdubois.be/wp-content/uploads/2015/05/mintyi3withgaps.png">
<img style="max-width:100%;" data-canonical-src="http://erikdubois.be/wp-content/uploads/2015/05/mintyi3withgaps.png" alt="alt tag" src="http://erikdubois.be/wp-content/uploads/2015/05/mintyi3withgaps.png">
</a>


# Sx05RE - An emulation build for Sx05 Devices

Sx05RE is based on LibreELEC (AlexELEC originally) and it runs Emulationstation/Retroarch to turn your Amlogic Sx05 device into a Retro EmulationStation! 

Please note that, Kodi is not the main focus of this, It boots directly into emulationstation with the beautiful Tronkyfran theme! 

**Features**

* Ultra fast boot
* Retroarch 1.4.1 with Lakka interface
* Plug and Play external storage
* Supports ROMS on USB (just create a file names sx05reroms and recreate the rom folders)
* Includes KODI v17 but please note that it will not be the focus of this build, only major updates will be implemented.
* Emulationstation with Tronkyfran EmulationStation theme.
* Based on LibreELEC (AlexELEC)
* Most up to date Libretro Cores
* Pre-configured for many gamepads
* Samba server – File transfer from any PC client
* SSH server – Remote console access for debugging


**Notes**

* SSH login details are user: “root” password: “sx05re”.
  SSH allows command line access to your sx05re device for configuration
  and file transfer. Linux/Mac clients can natively use SSH, while Windows
  users might want to try PuTTY for their terminal access.
* $HOME is mounted on /storage (the second ext4 partition on the drive). 
  All data transfered to the machine will go here, the rest of the system is
  read-only with the exception of /var (containing runtime configuration data).
* Manual update/downgrade procedure is as follows:
  Copy the snapshot (.tar) to the 'Update' network share (or /storage/.update) on
  your Sx05RE Device. Your system will automatically upgrade during the 
  next reboot.
* Automatic mounting of filesystems is supported. Devices such as USB Flash 
  sticks can be plugged into a running machine and will be mounted to /media,
  showing up in Kodi’s GUI.
* Comments and suggestions are more than welcome.



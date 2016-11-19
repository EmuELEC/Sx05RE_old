[Alex@ELEC](http://www.alexelec.in.ua)

# Alex@ELEC - Embedded Linux Entertainment Center

Alex@ELEC runs [Kodi](http://kodi.tv) and [VDR] (http://www.tvdr.de), an award-winning open source (GPL)
software media player and entertainment hub for digital media.

**Features**

* Ultra fast boot
* Simple configuration via Kodi itself
* Plug and Play external storage
* Support DVB-S2/T2

**Software**

* Kodi HTPC software – View/Manage all your media.
* VDR - digital satellite receiver and Video Disk Recorder.
* AceStream/AceProxy – Torrent-TV.
* RetroArch – play retro games.
* Samba server – File transfer from any PC client
* SSH server – Remote console access for debugging
* IR/Bluetooth Remote Control

**Notes**

* SSH login details are user: “root” password: “mcpc”.
  SSH allows command line access to your Alex@ELEC machine for configuration
  and file transfer. Linux/Mac clients can natively use SSH, while Windows
  users might want to try PuTTY for their terminal access.
* $HOME is mounted on /storage (the second ext4 partition on the drive). 
  All data transfered to the machine will go here, the rest of the system is
  read-only with the exception of /var (containing runtime configuration data).
* Manual update/downgrade procedure is as follows:
  Copy the snapshot (.tar) to the 'Update' network share (or /storage/.update) on
  your Alex@ELEC machine. Your system will automatically upgrade during the 
  next reboot.
* Automatic mounting of filesystems is supported. Devices such as USB Flash 
  sticks can be plugged into a running machine and will be mounted to /media,
  showing up in Kodi’s GUI.
* Comments and questions are more than welcome, help is even better and patches 
  are absolutely perfect!!

**Questions/Support**

* Forums on [http://forum.alexelec.in.ua](http://forum.alexelec.in.ua)


#include <unistd.h>
#include <net/if.h>
#include <stdint.h>
#include <asm/termbits.h>
#include "ioctls_list.h"
#include <net/if_ppp.h>
#include <alsa/sound/sb16_csp.h>
#include <alsa/sound/asound_fm.h>
#include <alsa/sound/hdsp.h>
#include <alsa/sound/sscape_ioctl.h>
#include <alsa/sound/hdspm.h>
#include <tirpc/rpc/des.h>
#include <amcodec/amports/amstream.h>
#include <amcodec/ppmgr/ppmgr.h>
#include <mtd/mtd-abi.h>
#include <mtd/ubi-user.h>
#include <rdma/ib_user_mad.h>
#include <linux/gigaset_dev.h>
#include <linux/nvram.h>
#include <linux/atmlec.h>
#include <linux/dn.h>
#include <linux/ppdev.h>
#include <linux/atm_eni.h>
#include <linux/vhost.h>
#include <linux/atm_zatm.h>
#include <linux/v4l2-subdev.h>
#include <linux/pmu.h>
#include <linux/hiddev.h>
#include <linux/hpet.h>
#include <linux/nbd.h>
#include <linux/joystick.h>
#include <linux/ptp_clock.h>
#include <linux/mmtimer.h>
#include <linux/uinput.h>
#include <linux/udf_fs_i.h>
#include <linux/toshiba.h>
#include <linux/atmarp.h>
#include <linux/i8k.h>
#include <linux/usbdevice_fs.h>
#include <linux/input.h>
#include <linux/suspend_ioctls.h>
#include <linux/msdos_fs.h>
#include <linux/watchdog.h>
#include <linux/ncp_fs.h>
#include <linux/radeonfb.h>
#include <linux/isdn_ppp.h>
#include <linux/nvme.h>
#include <linux/hidraw.h>
#include <linux/ipmi.h>
#include <linux/rfkill.h>
#include <linux/capi.h>
#include <linux/dvb/ca.h>
#include <linux/dvb/video.h>
#include <linux/dvb/frontend.h>
#include <linux/dvb/osd.h>
#include <linux/dvb/net.h>
#include <linux/dvb/dmx.h>
#include <linux/dvb/audio.h>
#include <linux/random.h>
#include <linux/btrfs.h>
#include <linux/atmmpc.h>
#include <linux/isdn.h>
#include <linux/uvcvideo.h>
#include <linux/synclink.h>
#include <linux/dm-ioctl.h>
#include <linux/pps.h>
#include <linux/fd.h>
#include <linux/rtc.h>
#include <linux/blkpg.h>
#include <linux/apm_bios.h>
#include <linux/matroxfb.h>
#include <linux/vfio.h>
#include <linux/arcfb.h>
#include <linux/videodev2.h>
#include <linux/ivtvfb.h>
#include <linux/chio.h>
#include <linux/cciss_ioctl.h>
#include <linux/usb/cdc-wdm.h>
#include <linux/usb/g_printer.h>
#include <linux/usb/gadgetfs.h>
#include <linux/usb/tmc.h>
#include <linux/usb/functionfs.h>
#include <linux/sonet.h>
#include <linux/auto_fs4.h>
#include <linux/reiserfs_fs.h>
#include <linux/atm_idt77105.h>
#include <linux/atmdev.h>
#include <linux/mic_ioctl.h>
#include <linux/kvm.h>
#include <linux/cm4000_cs.h>
#include <linux/perf_event.h>
#include <linux/if_tun.h>
#include <linux/atmclip.h>
#include <linux/media.h>
#include <linux/meye.h>
#include <linux/fb.h>
#include <linux/pktcdvd.h>
#include <linux/atm_tcp.h>
#include <linux/firewire-cdev.h>
#include <linux/spi/spidev.h>
#include <linux/atmsvc.h>
#include <linux/agpgart.h>
#include <linux/fs.h>
#include <linux/atm_nicstar.h>
#include <linux/atm_he.h>
#include <linux/omapfb.h>
#include <linux/hsi/hsi_char.h>
#include <linux/sonypi.h>
#include <linux/serio.h>
#include <linux/i2o-dev.h>
#include <linux/phantom.h>
#include <drm/drm.h>
#include <asm-generic/ioctls.h>
#include <video/sisfb.h>
#include <lirc/include/media/lirc.h>
#include <lirc/irpipe.h>
#include <sound/sb16_csp.h>
#include <sound/asound_fm.h>
#include <sound/hdsp.h>
#include <sound/firewire.h>
#include <sound/sfnt_info.h>
#include <sound/asound.h>
#include <sound/compress_offload.h>
#include <sound/hdspm.h>

const struct ioctl_entry ioctls_list[] = {
    { "PPPIOCGRASYNCMAP", PPPIOCGRASYNCMAP, -1, -1 }, // net/if_ppp.h:144
    { "PPPIOCSRASYNCMAP", PPPIOCSRASYNCMAP, -1, -1 }, // net/if_ppp.h:145
    { "PPPIOCGXASYNCMAP", PPPIOCGXASYNCMAP, -1, -1 }, // net/if_ppp.h:149
    { "PPPIOCSXASYNCMAP", PPPIOCSXASYNCMAP, -1, -1 }, // net/if_ppp.h:150
    { "SNDRV_HDSP_IOCTL_GET_PEAK_RMS", SNDRV_HDSP_IOCTL_GET_PEAK_RMS, -1, -1 }, // alsa/sound/hdsp.h:47
    { "SNDRV_HDSP_IOCTL_GET_CONFIG_INFO", SNDRV_HDSP_IOCTL_GET_CONFIG_INFO, -1, -1 }, // alsa/sound/hdsp.h:77
    { "SNDRV_HDSP_IOCTL_UPLOAD_FIRMWARE", SNDRV_HDSP_IOCTL_UPLOAD_FIRMWARE, -1, -1 }, // alsa/sound/hdsp.h:85
    { "SNDRV_HDSP_IOCTL_GET_VERSION", SNDRV_HDSP_IOCTL_GET_VERSION, -1, -1 }, // alsa/sound/hdsp.h:94
    { "SNDRV_HDSP_IOCTL_GET_MIXER", SNDRV_HDSP_IOCTL_GET_MIXER, -1, -1 }, // alsa/sound/hdsp.h:102
    { "SNDRV_HDSP_IOCTL_GET_9632_AEB", SNDRV_HDSP_IOCTL_GET_9632_AEB, -1, -1 }, // alsa/sound/hdsp.h:111
    { "SND_SSCAPE_LOAD_BOOTB", SND_SSCAPE_LOAD_BOOTB, -1, -1 }, // alsa/sound/sscape_ioctl.h:18
    { "SNDRV_HDSPM_IOCTL_GET_LTC", SNDRV_HDSPM_IOCTL_GET_LTC, -1, -1 }, // alsa/sound/hdspm.h:114
    { "SNDRV_HDSPM_IOCTL_GET_VERSION", SNDRV_HDSPM_IOCTL_GET_VERSION, -1, -1 }, // alsa/sound/hdspm.h:188
    { "SNDRV_HDSPM_IOCTL_GET_MIXER", SNDRV_HDSPM_IOCTL_GET_MIXER, -1, -1 }, // alsa/sound/hdspm.h:219
    { "AMSTREAM_IOC_VB_START", AMSTREAM_IOC_VB_START, -1, -1 }, // amcodec/amports/amstream.h:56
    { "AMSTREAM_IOC_VB_SIZE", AMSTREAM_IOC_VB_SIZE, -1, -1 }, // amcodec/amports/amstream.h:57
    { "AMSTREAM_IOC_AB_START", AMSTREAM_IOC_AB_START, -1, -1 }, // amcodec/amports/amstream.h:58
    { "AMSTREAM_IOC_AB_SIZE", AMSTREAM_IOC_AB_SIZE, -1, -1 }, // amcodec/amports/amstream.h:59
    { "AMSTREAM_IOC_VFORMAT", AMSTREAM_IOC_VFORMAT, -1, -1 }, // amcodec/amports/amstream.h:60
    { "AMSTREAM_IOC_AFORMAT", AMSTREAM_IOC_AFORMAT, -1, -1 }, // amcodec/amports/amstream.h:61
    { "AMSTREAM_IOC_VID", AMSTREAM_IOC_VID, -1, -1 }, // amcodec/amports/amstream.h:62
    { "AMSTREAM_IOC_AID", AMSTREAM_IOC_AID, -1, -1 }, // amcodec/amports/amstream.h:63
    { "AMSTREAM_IOC_VB_STATUS", AMSTREAM_IOC_VB_STATUS, -1, -1 }, // amcodec/amports/amstream.h:64
    { "AMSTREAM_IOC_AB_STATUS", AMSTREAM_IOC_AB_STATUS, -1, -1 }, // amcodec/amports/amstream.h:65
    { "AMSTREAM_IOC_SYSINFO", AMSTREAM_IOC_SYSINFO, -1, -1 }, // amcodec/amports/amstream.h:66
    { "AMSTREAM_IOC_ACHANNEL", AMSTREAM_IOC_ACHANNEL, -1, -1 }, // amcodec/amports/amstream.h:67
    { "AMSTREAM_IOC_SAMPLERATE", AMSTREAM_IOC_SAMPLERATE, -1, -1 }, // amcodec/amports/amstream.h:68
    { "AMSTREAM_IOC_DATAWIDTH", AMSTREAM_IOC_DATAWIDTH, -1, -1 }, // amcodec/amports/amstream.h:69
    { "AMSTREAM_IOC_TSTAMP", AMSTREAM_IOC_TSTAMP, -1, -1 }, // amcodec/amports/amstream.h:70
    { "AMSTREAM_IOC_VDECSTAT", AMSTREAM_IOC_VDECSTAT, -1, -1 }, // amcodec/amports/amstream.h:71
    { "AMSTREAM_IOC_ADECSTAT", AMSTREAM_IOC_ADECSTAT, -1, -1 }, // amcodec/amports/amstream.h:72
    { "AMSTREAM_IOC_PORT_INIT", AMSTREAM_IOC_PORT_INIT, -1, -1 }, // amcodec/amports/amstream.h:74
    { "AMSTREAM_IOC_TRICKMODE", AMSTREAM_IOC_TRICKMODE, -1, -1 }, // amcodec/amports/amstream.h:75
    { "AMSTREAM_IOC_AUDIO_INFO", AMSTREAM_IOC_AUDIO_INFO, -1, -1 }, // amcodec/amports/amstream.h:77
    { "AMSTREAM_IOC_TRICK_STAT", AMSTREAM_IOC_TRICK_STAT, -1, -1 }, // amcodec/amports/amstream.h:78
    { "AMSTREAM_IOC_AUDIO_RESET", AMSTREAM_IOC_AUDIO_RESET, -1, -1 }, // amcodec/amports/amstream.h:79
    { "AMSTREAM_IOC_SID", AMSTREAM_IOC_SID, -1, -1 }, // amcodec/amports/amstream.h:80
    { "AMSTREAM_IOC_VPAUSE", AMSTREAM_IOC_VPAUSE, -1, -1 }, // amcodec/amports/amstream.h:81
    { "AMSTREAM_IOC_AVTHRESH", AMSTREAM_IOC_AVTHRESH, -1, -1 }, // amcodec/amports/amstream.h:82
    { "AMSTREAM_IOC_SYNCTHRESH", AMSTREAM_IOC_SYNCTHRESH, -1, -1 }, // amcodec/amports/amstream.h:83
    { "AMSTREAM_IOC_SUB_RESET", AMSTREAM_IOC_SUB_RESET, -1, -1 }, // amcodec/amports/amstream.h:84
    { "AMSTREAM_IOC_SUB_LENGTH", AMSTREAM_IOC_SUB_LENGTH, -1, -1 }, // amcodec/amports/amstream.h:85
    { "AMSTREAM_IOC_SET_DEC_RESET", AMSTREAM_IOC_SET_DEC_RESET, -1, -1 }, // amcodec/amports/amstream.h:86
    { "AMSTREAM_IOC_TS_SKIPBYTE", AMSTREAM_IOC_TS_SKIPBYTE, -1, -1 }, // amcodec/amports/amstream.h:87
    { "AMSTREAM_IOC_SUB_TYPE", AMSTREAM_IOC_SUB_TYPE, -1, -1 }, // amcodec/amports/amstream.h:88
    { "AMSTREAM_IOC_CLEAR_VIDEO", AMSTREAM_IOC_CLEAR_VIDEO, -1, -1 }, // amcodec/amports/amstream.h:89
    { "AMSTREAM_IOC_APTS", AMSTREAM_IOC_APTS, -1, -1 }, // amcodec/amports/amstream.h:91
    { "AMSTREAM_IOC_VPTS", AMSTREAM_IOC_VPTS, -1, -1 }, // amcodec/amports/amstream.h:92
    { "AMSTREAM_IOC_PCRSCR", AMSTREAM_IOC_PCRSCR, -1, -1 }, // amcodec/amports/amstream.h:93
    { "AMSTREAM_IOC_SYNCENABLE", AMSTREAM_IOC_SYNCENABLE, -1, -1 }, // amcodec/amports/amstream.h:94
    { "AMSTREAM_IOC_GET_SYNC_ADISCON", AMSTREAM_IOC_GET_SYNC_ADISCON, -1, -1 }, // amcodec/amports/amstream.h:95
    { "AMSTREAM_IOC_SET_SYNC_ADISCON", AMSTREAM_IOC_SET_SYNC_ADISCON, -1, -1 }, // amcodec/amports/amstream.h:96
    { "AMSTREAM_IOC_GET_SYNC_VDISCON", AMSTREAM_IOC_GET_SYNC_VDISCON, -1, -1 }, // amcodec/amports/amstream.h:97
    { "AMSTREAM_IOC_SET_SYNC_VDISCON", AMSTREAM_IOC_SET_SYNC_VDISCON, -1, -1 }, // amcodec/amports/amstream.h:98
    { "AMSTREAM_IOC_GET_VIDEO_DISABLE", AMSTREAM_IOC_GET_VIDEO_DISABLE, -1, -1 }, // amcodec/amports/amstream.h:99
    { "AMSTREAM_IOC_SET_VIDEO_DISABLE", AMSTREAM_IOC_SET_VIDEO_DISABLE, -1, -1 }, // amcodec/amports/amstream.h:100
    { "AMSTREAM_IOC_SET_PCRSCR", AMSTREAM_IOC_SET_PCRSCR, -1, -1 }, // amcodec/amports/amstream.h:101
    { "AMSTREAM_IOC_GET_VIDEO_AXIS", AMSTREAM_IOC_GET_VIDEO_AXIS, -1, -1 }, // amcodec/amports/amstream.h:102
    { "AMSTREAM_IOC_SET_VIDEO_AXIS", AMSTREAM_IOC_SET_VIDEO_AXIS, -1, -1 }, // amcodec/amports/amstream.h:103
    { "AMSTREAM_IOC_GET_VIDEO_CROP", AMSTREAM_IOC_GET_VIDEO_CROP, -1, -1 }, // amcodec/amports/amstream.h:104
    { "AMSTREAM_IOC_SET_VIDEO_CROP", AMSTREAM_IOC_SET_VIDEO_CROP, -1, -1 }, // amcodec/amports/amstream.h:105
    { "AMSTREAM_IOC_PCRID", AMSTREAM_IOC_PCRID, -1, -1 }, // amcodec/amports/amstream.h:106
    { "AMSTREAM_IOC_SET_3D_TYPE", AMSTREAM_IOC_SET_3D_TYPE, -1, -1 }, // amcodec/amports/amstream.h:109
    { "AMSTREAM_IOC_GET_3D_TYPE", AMSTREAM_IOC_GET_3D_TYPE, -1, -1 }, // amcodec/amports/amstream.h:110
    { "AMSTREAM_IOC_SUB_NUM", AMSTREAM_IOC_SUB_NUM, -1, -1 }, // amcodec/amports/amstream.h:112
    { "AMSTREAM_IOC_SUB_INFO", AMSTREAM_IOC_SUB_INFO, -1, -1 }, // amcodec/amports/amstream.h:113
    { "AMSTREAM_IOC_GET_BLACKOUT_POLICY", AMSTREAM_IOC_GET_BLACKOUT_POLICY, -1, -1 }, // amcodec/amports/amstream.h:114
    { "AMSTREAM_IOC_SET_BLACKOUT_POLICY", AMSTREAM_IOC_SET_BLACKOUT_POLICY, -1, -1 }, // amcodec/amports/amstream.h:115
    { "AMSTREAM_IOC_UD_LENGTH", AMSTREAM_IOC_UD_LENGTH, -1, -1 }, // amcodec/amports/amstream.h:116
    { "AMSTREAM_IOC_UD_POC", AMSTREAM_IOC_UD_POC, -1, -1 }, // amcodec/amports/amstream.h:117
    { "AMSTREAM_IOC_GET_SCREEN_MODE", AMSTREAM_IOC_GET_SCREEN_MODE, -1, -1 }, // amcodec/amports/amstream.h:118
    { "AMSTREAM_IOC_SET_SCREEN_MODE", AMSTREAM_IOC_SET_SCREEN_MODE, -1, -1 }, // amcodec/amports/amstream.h:119
    { "AMSTREAM_IOC_GET_VIDEO_DISCONTINUE_REPORT", AMSTREAM_IOC_GET_VIDEO_DISCONTINUE_REPORT, -1, -1 }, // amcodec/amports/amstream.h:120
    { "AMSTREAM_IOC_SET_VIDEO_DISCONTINUE_REPORT", AMSTREAM_IOC_SET_VIDEO_DISCONTINUE_REPORT, -1, -1 }, // amcodec/amports/amstream.h:121
    { "AMSTREAM_IOC_VF_STATUS", AMSTREAM_IOC_VF_STATUS, -1, -1 }, // amcodec/amports/amstream.h:122
    { "AMSTREAM_IOC_CLEAR_VBUF", AMSTREAM_IOC_CLEAR_VBUF, -1, -1 }, // amcodec/amports/amstream.h:123
    { "AMSTREAM_IOC_APTS_LOOKUP", AMSTREAM_IOC_APTS_LOOKUP, -1, -1 }, // amcodec/amports/amstream.h:125
    { "GET_FIRST_APTS_FLAG", GET_FIRST_APTS_FLAG, -1, -1 }, // amcodec/amports/amstream.h:126
    { "AMSTREAM_IOC_GET_SYNC_ADISCON_DIFF", AMSTREAM_IOC_GET_SYNC_ADISCON_DIFF, -1, -1 }, // amcodec/amports/amstream.h:127
    { "AMSTREAM_IOC_GET_SYNC_VDISCON_DIFF", AMSTREAM_IOC_GET_SYNC_VDISCON_DIFF, -1, -1 }, // amcodec/amports/amstream.h:128
    { "AMSTREAM_IOC_SET_SYNC_ADISCON_DIFF", AMSTREAM_IOC_SET_SYNC_ADISCON_DIFF, -1, -1 }, // amcodec/amports/amstream.h:129
    { "AMSTREAM_IOC_SET_SYNC_VDISCON_DIFF", AMSTREAM_IOC_SET_SYNC_VDISCON_DIFF, -1, -1 }, // amcodec/amports/amstream.h:130
    { "AMSTREAM_IOC_GET_FREERUN_MODE", AMSTREAM_IOC_GET_FREERUN_MODE, -1, -1 }, // amcodec/amports/amstream.h:131
    { "AMSTREAM_IOC_SET_FREERUN_MODE", AMSTREAM_IOC_SET_FREERUN_MODE, -1, -1 }, // amcodec/amports/amstream.h:132
    { "AMSTREAM_IOC_SET_VSYNC_UPINT", AMSTREAM_IOC_SET_VSYNC_UPINT, -1, -1 }, // amcodec/amports/amstream.h:133
    { "AMSTREAM_IOC_GET_VSYNC_SLOW_FACTOR", AMSTREAM_IOC_GET_VSYNC_SLOW_FACTOR, -1, -1 }, // amcodec/amports/amstream.h:134
    { "AMSTREAM_IOC_SET_VSYNC_SLOW_FACTOR", AMSTREAM_IOC_SET_VSYNC_SLOW_FACTOR, -1, -1 }, // amcodec/amports/amstream.h:135
    { "AMSTREAM_IOC_SET_DEMUX", AMSTREAM_IOC_SET_DEMUX, -1, -1 }, // amcodec/amports/amstream.h:136
    { "AMSTREAM_IOC_SET_DRMMODE", AMSTREAM_IOC_SET_DRMMODE, -1, -1 }, // amcodec/amports/amstream.h:137
    { "AMSTREAM_IOC_TSTAMP", AMSTREAM_IOC_TSTAMP, -1, -1 }, // amcodec/amports/amstream.h:138
    { "AMSTREAM_IOC_SET_VIDEO_DELAY_LIMIT_MS", AMSTREAM_IOC_SET_VIDEO_DELAY_LIMIT_MS, -1, -1 }, // amcodec/amports/amstream.h:140
    { "AMSTREAM_IOC_GET_VIDEO_DELAY_LIMIT_MS", AMSTREAM_IOC_GET_VIDEO_DELAY_LIMIT_MS, -1, -1 }, // amcodec/amports/amstream.h:141
    { "AMSTREAM_IOC_SET_AUDIO_DELAY_LIMIT_MS", AMSTREAM_IOC_SET_AUDIO_DELAY_LIMIT_MS, -1, -1 }, // amcodec/amports/amstream.h:142
    { "AMSTREAM_IOC_GET_AUDIO_DELAY_LIMIT_MS", AMSTREAM_IOC_GET_AUDIO_DELAY_LIMIT_MS, -1, -1 }, // amcodec/amports/amstream.h:143
    { "AMSTREAM_IOC_GET_AUDIO_CUR_DELAY_MS", AMSTREAM_IOC_GET_AUDIO_CUR_DELAY_MS, -1, -1 }, // amcodec/amports/amstream.h:144
    { "AMSTREAM_IOC_GET_VIDEO_CUR_DELAY_MS", AMSTREAM_IOC_GET_VIDEO_CUR_DELAY_MS, -1, -1 }, // amcodec/amports/amstream.h:145
    { "AMSTREAM_IOC_GET_AUDIO_AVG_BITRATE_BPS", AMSTREAM_IOC_GET_AUDIO_AVG_BITRATE_BPS, -1, -1 }, // amcodec/amports/amstream.h:146
    { "AMSTREAM_IOC_GET_VIDEO_AVG_BITRATE_BPS", AMSTREAM_IOC_GET_VIDEO_AVG_BITRATE_BPS, -1, -1 }, // amcodec/amports/amstream.h:147
    { "AMSTREAM_IOC_SET_APTS", AMSTREAM_IOC_SET_APTS, -1, -1 }, // amcodec/amports/amstream.h:148
    { "AMSTREAM_IOC_GET_LAST_CHECKIN_APTS", AMSTREAM_IOC_GET_LAST_CHECKIN_APTS, -1, -1 }, // amcodec/amports/amstream.h:149
    { "AMSTREAM_IOC_GET_LAST_CHECKIN_VPTS", AMSTREAM_IOC_GET_LAST_CHECKIN_VPTS, -1, -1 }, // amcodec/amports/amstream.h:150
    { "AMSTREAM_IOC_GET_LAST_CHECKOUT_APTS", AMSTREAM_IOC_GET_LAST_CHECKOUT_APTS, -1, -1 }, // amcodec/amports/amstream.h:151
    { "AMSTREAM_IOC_GET_LAST_CHECKOUT_VPTS", AMSTREAM_IOC_GET_LAST_CHECKOUT_VPTS, -1, -1 }, // amcodec/amports/amstream.h:152
    { "AMSTREAM_IOC_SET_PLAYRATE", AMSTREAM_IOC_SET_PLAYRATE, -1, -1 }, // amcodec/amports/amstream.h:154
    { "AMSTREAM_IOC_GET_SUBTITLE_INFO", AMSTREAM_IOC_GET_SUBTITLE_INFO, -1, -1 }, // amcodec/amports/amstream.h:157
    { "AMSTREAM_IOC_SET_SUBTITLE_INFO", AMSTREAM_IOC_SET_SUBTITLE_INFO, -1, -1 }, // amcodec/amports/amstream.h:158
    { "AMSTREAM_IOC_SET_OMX_VPTS", AMSTREAM_IOC_SET_OMX_VPTS, -1, -1 }, // amcodec/amports/amstream.h:159
    { "AMSTREAM_IOC_GET_OMX_VPTS", AMSTREAM_IOC_GET_OMX_VPTS, -1, -1 }, // amcodec/amports/amstream.h:160
    { "AMSTREAM_IOC_GET_TRICK_VPTS", AMSTREAM_IOC_GET_TRICK_VPTS, -1, -1 }, // amcodec/amports/amstream.h:162
    { "AMSTREAM_IOC_DISABLE_SLOW_SYNC", AMSTREAM_IOC_DISABLE_SLOW_SYNC, -1, -1 }, // amcodec/amports/amstream.h:163
    { "AMSTREAM_IOC_GET_AUDIO_CHECKIN_BITRATE_BPS", AMSTREAM_IOC_GET_AUDIO_CHECKIN_BITRATE_BPS, -1, -1 }, // amcodec/amports/amstream.h:165
    { "AMSTREAM_IOC_GET_VIDEO_CHECKIN_BITRATE_BPS", AMSTREAM_IOC_GET_VIDEO_CHECKIN_BITRATE_BPS, -1, -1 }, // amcodec/amports/amstream.h:166
    { "AMSTREAM_IOC_GET_VERSION", AMSTREAM_IOC_GET_VERSION, -1, -1 }, // amcodec/amports/amstream.h:168
    { "AMSTREAM_IOC_GET", AMSTREAM_IOC_GET, -1, -1 }, // amcodec/amports/amstream.h:169
    { "AMSTREAM_IOC_SET", AMSTREAM_IOC_SET, -1, -1 }, // amcodec/amports/amstream.h:170
    { "AMSTREAM_IOC_GET_EX", AMSTREAM_IOC_GET_EX, -1, -1 }, // amcodec/amports/amstream.h:171
    { "AMSTREAM_IOC_SET_EX", AMSTREAM_IOC_SET_EX, -1, -1 }, // amcodec/amports/amstream.h:172
    { "AMSTREAM_IOC_GET_PTR", AMSTREAM_IOC_GET_PTR, -1, -1 }, // amcodec/amports/amstream.h:173
    { "AMSTREAM_IOC_SET_PTR", AMSTREAM_IOC_SET_PTR, -1, -1 }, // amcodec/amports/amstream.h:174
    { "AMAUDIO_IOC_SET_RESAMPLE_ENA", AMAUDIO_IOC_SET_RESAMPLE_ENA, -1, -1 }, // amcodec/amports/amstream.h:177
    { "AMAUDIO_IOC_GET_RESAMPLE_ENA", AMAUDIO_IOC_GET_RESAMPLE_ENA, -1, -1 }, // amcodec/amports/amstream.h:178
    { "AMAUDIO_IOC_SET_RESAMPLE_TYPE", AMAUDIO_IOC_SET_RESAMPLE_TYPE, -1, -1 }, // amcodec/amports/amstream.h:179
    { "AMAUDIO_IOC_GET_RESAMPLE_TYPE", AMAUDIO_IOC_GET_RESAMPLE_TYPE, -1, -1 }, // amcodec/amports/amstream.h:180
    { "AMAUDIO_IOC_SET_RESAMPLE_DELTA", AMAUDIO_IOC_SET_RESAMPLE_DELTA, -1, -1 }, // amcodec/amports/amstream.h:181
    { "PPMGR_IOC_GET_ANGLE", PPMGR_IOC_GET_ANGLE, -1, -1 }, // amcodec/ppmgr/ppmgr.h:20
    { "PPMGR_IOC_SET_ANGLE", PPMGR_IOC_SET_ANGLE, -1, -1 }, // amcodec/ppmgr/ppmgr.h:21
    { "UBI_IOCMKVOL", UBI_IOCMKVOL, -1, -1 }, // mtd/ubi-user.h:155
    { "UBI_IOCRMVOL", UBI_IOCRMVOL, -1, -1 }, // mtd/ubi-user.h:157
    { "UBI_IOCRSVOL", UBI_IOCRSVOL, -1, -1 }, // mtd/ubi-user.h:159
    { "UBI_IOCRNVOL", UBI_IOCRNVOL, -1, -1 }, // mtd/ubi-user.h:161
    { "UBI_IOCATT", UBI_IOCATT, -1, -1 }, // mtd/ubi-user.h:168
    { "UBI_IOCDET", UBI_IOCDET, -1, -1 }, // mtd/ubi-user.h:170
    { "UBI_IOCVOLUP", UBI_IOCVOLUP, -1, -1 }, // mtd/ubi-user.h:180
    { "UBI_IOCEBER", UBI_IOCEBER, -1, -1 }, // mtd/ubi-user.h:182
    { "UBI_IOCEBCH", UBI_IOCEBCH, -1, -1 }, // mtd/ubi-user.h:184
    { "UBI_IOCEBMAP", UBI_IOCEBMAP, -1, -1 }, // mtd/ubi-user.h:186
    { "UBI_IOCEBUNMAP", UBI_IOCEBUNMAP, -1, -1 }, // mtd/ubi-user.h:188
    { "UBI_IOCEBISMAP", UBI_IOCEBISMAP, -1, -1 }, // mtd/ubi-user.h:190
    { "UBI_IOCSETVOLPROP", UBI_IOCSETVOLPROP, -1, -1 }, // mtd/ubi-user.h:192
    { "GIGASET_REDIR", GIGASET_REDIR, -1, -1 }, // linux/gigaset_dev.h:23
    { "GIGASET_CONFIG", GIGASET_CONFIG, -1, -1 }, // linux/gigaset_dev.h:26
    { "GIGASET_BRKCHARS", GIGASET_BRKCHARS, -1, -1 }, // linux/gigaset_dev.h:29
    { "GIGASET_VERSION", GIGASET_VERSION, -1, -1 }, // linux/gigaset_dev.h:32
    { "SIOCSNETADDR", SIOCSNETADDR, -1, -1 }, // linux/dn.h:143
    { "SIOCGNETADDR", SIOCGNETADDR, -1, -1 }, // linux/dn.h:144
    { "OSIOCSNETADDR", OSIOCSNETADDR, -1, -1 }, // linux/dn.h:145
    { "OSIOCGNETADDR", OSIOCGNETADDR, -1, -1 }, // linux/dn.h:146
    { "PPFCONTROL", PPFCONTROL, -1, -1 }, // linux/ppdev.h:34
    { "ENI_MEMDUMP", ENI_MEMDUMP, -1, -1 }, // linux/atm_eni.h:18
    { "VHOST_SET_OWNER", VHOST_SET_OWNER, -1, -1 }, // linux/vhost.h:78
    { "VHOST_RESET_OWNER", VHOST_RESET_OWNER, -1, -1 }, // linux/vhost.h:81
    { "VHOST_SET_LOG_BASE", VHOST_SET_LOG_BASE, -1, -1 }, // linux/vhost.h:91
    { "VHOST_SET_LOG_FD", VHOST_SET_LOG_FD, -1, -1 }, // linux/vhost.h:93
    { "VHOST_SET_VRING_NUM", VHOST_SET_VRING_NUM, -1, -1 }, // linux/vhost.h:98
    { "VHOST_SET_VRING_ADDR", VHOST_SET_VRING_ADDR, -1, -1 }, // linux/vhost.h:100
    { "VHOST_SET_VRING_BASE", VHOST_SET_VRING_BASE, -1, -1 }, // linux/vhost.h:102
    { "VHOST_GET_VRING_BASE", VHOST_GET_VRING_BASE, -1, -1 }, // linux/vhost.h:104
    { "VHOST_SET_VRING_KICK", VHOST_SET_VRING_KICK, -1, -1 }, // linux/vhost.h:110
    { "VHOST_SET_VRING_CALL", VHOST_SET_VRING_CALL, -1, -1 }, // linux/vhost.h:112
    { "VHOST_SET_VRING_ERR", VHOST_SET_VRING_ERR, -1, -1 }, // linux/vhost.h:114
    { "VHOST_NET_SET_BACKEND", VHOST_NET_SET_BACKEND, -1, -1 }, // linux/vhost.h:122
    { "VHOST_SCSI_SET_ENDPOINT", VHOST_SCSI_SET_ENDPOINT, -1, -1 }, // linux/vhost.h:150
    { "VHOST_SCSI_CLEAR_ENDPOINT", VHOST_SCSI_CLEAR_ENDPOINT, -1, -1 }, // linux/vhost.h:151
    { "VHOST_SCSI_GET_ABI_VERSION", VHOST_SCSI_GET_ABI_VERSION, -1, -1 }, // linux/vhost.h:153
    { "VHOST_SCSI_SET_EVENTS_MISSED", VHOST_SCSI_SET_EVENTS_MISSED, -1, -1 }, // linux/vhost.h:155
    { "VHOST_SCSI_GET_EVENTS_MISSED", VHOST_SCSI_GET_EVENTS_MISSED, -1, -1 }, // linux/vhost.h:156
    { "NBD_DISCONNECT", NBD_DISCONNECT, -1, -1 }, // linux/nbd.h:28
    { "NBD_SET_TIMEOUT", NBD_SET_TIMEOUT, -1, -1 }, // linux/nbd.h:29
    { "NBD_SET_FLAGS", NBD_SET_FLAGS, -1, -1 }, // linux/nbd.h:30
    { "PTP_CLOCK_GETCAPS", PTP_CLOCK_GETCAPS, -1, -1 }, // linux/ptp_clock.h:85
    { "PTP_EXTTS_REQUEST", PTP_EXTTS_REQUEST, -1, -1 }, // linux/ptp_clock.h:86
    { "PTP_PEROUT_REQUEST", PTP_PEROUT_REQUEST, -1, -1 }, // linux/ptp_clock.h:87
    { "PTP_ENABLE_PPS", PTP_ENABLE_PPS, -1, -1 }, // linux/ptp_clock.h:88
    { "PTP_SYS_OFFSET", PTP_SYS_OFFSET, -1, -1 }, // linux/ptp_clock.h:89
    { "MMTIMER_GETOFFSET", MMTIMER_GETOFFSET, -1, -1 }, // linux/mmtimer.h:49
    { "MMTIMER_GETRES", MMTIMER_GETRES, -1, -1 }, // linux/mmtimer.h:50
    { "MMTIMER_GETFREQ", MMTIMER_GETFREQ, -1, -1 }, // linux/mmtimer.h:51
    { "MMTIMER_GETBITS", MMTIMER_GETBITS, -1, -1 }, // linux/mmtimer.h:52
    { "MMTIMER_MMAPAVAIL", MMTIMER_MMAPAVAIL, -1, -1 }, // linux/mmtimer.h:53
    { "MMTIMER_GETCOUNTER", MMTIMER_GETCOUNTER, -1, -1 }, // linux/mmtimer.h:54
    { "UDF_GETEASIZE", UDF_GETEASIZE, -1, -1 }, // linux/udf_fs_i.h:16
    { "UDF_GETEABLOCK", UDF_GETEABLOCK, -1, -1 }, // linux/udf_fs_i.h:17
    { "UDF_GETVOLIDENT", UDF_GETVOLIDENT, -1, -1 }, // linux/udf_fs_i.h:18
    { "UDF_RELOCATE_BLOCKS", UDF_RELOCATE_BLOCKS, -1, -1 }, // linux/udf_fs_i.h:19
    { "TOSH_SMM", TOSH_SMM, -1, -1 }, // linux/toshiba.h:25
    { "USBDEVFS_CONTROL", USBDEVFS_CONTROL, -1, -1 }, // linux/usbdevice_fs.h:148
    { "USBDEVFS_BULK", USBDEVFS_BULK, -1, -1 }, // linux/usbdevice_fs.h:150
    { "USBDEVFS_RESETEP", USBDEVFS_RESETEP, -1, -1 }, // linux/usbdevice_fs.h:152
    { "USBDEVFS_SETINTERFACE", USBDEVFS_SETINTERFACE, -1, -1 }, // linux/usbdevice_fs.h:153
    { "USBDEVFS_SETCONFIGURATION", USBDEVFS_SETCONFIGURATION, -1, -1 }, // linux/usbdevice_fs.h:154
    { "USBDEVFS_GETDRIVER", USBDEVFS_GETDRIVER, -1, -1 }, // linux/usbdevice_fs.h:155
    { "USBDEVFS_SUBMITURB", USBDEVFS_SUBMITURB, -1, -1 }, // linux/usbdevice_fs.h:156
    { "USBDEVFS_DISCARDURB", USBDEVFS_DISCARDURB, -1, -1 }, // linux/usbdevice_fs.h:158
    { "USBDEVFS_REAPURB", USBDEVFS_REAPURB, -1, -1 }, // linux/usbdevice_fs.h:159
    { "USBDEVFS_REAPURB32", USBDEVFS_REAPURB32, -1, -1 }, // linux/usbdevice_fs.h:160
    { "USBDEVFS_REAPURBNDELAY", USBDEVFS_REAPURBNDELAY, -1, -1 }, // linux/usbdevice_fs.h:161
    { "USBDEVFS_REAPURBNDELAY32", USBDEVFS_REAPURBNDELAY32, -1, -1 }, // linux/usbdevice_fs.h:162
    { "USBDEVFS_DISCSIGNAL", USBDEVFS_DISCSIGNAL, -1, -1 }, // linux/usbdevice_fs.h:163
    { "USBDEVFS_CLAIMINTERFACE", USBDEVFS_CLAIMINTERFACE, -1, -1 }, // linux/usbdevice_fs.h:165
    { "USBDEVFS_RELEASEINTERFACE", USBDEVFS_RELEASEINTERFACE, -1, -1 }, // linux/usbdevice_fs.h:166
    { "USBDEVFS_CONNECTINFO", USBDEVFS_CONNECTINFO, -1, -1 }, // linux/usbdevice_fs.h:167
    { "USBDEVFS_IOCTL", USBDEVFS_IOCTL, -1, -1 }, // linux/usbdevice_fs.h:168
    { "USBDEVFS_HUB_PORTINFO", USBDEVFS_HUB_PORTINFO, -1, -1 }, // linux/usbdevice_fs.h:170
    { "USBDEVFS_RESET", USBDEVFS_RESET, -1, -1 }, // linux/usbdevice_fs.h:171
    { "USBDEVFS_CLEAR_HALT", USBDEVFS_CLEAR_HALT, -1, -1 }, // linux/usbdevice_fs.h:172
    { "USBDEVFS_DISCONNECT", USBDEVFS_DISCONNECT, -1, -1 }, // linux/usbdevice_fs.h:173
    { "USBDEVFS_CONNECT", USBDEVFS_CONNECT, -1, -1 }, // linux/usbdevice_fs.h:174
    { "USBDEVFS_CLAIM_PORT", USBDEVFS_CLAIM_PORT, -1, -1 }, // linux/usbdevice_fs.h:175
    { "USBDEVFS_RELEASE_PORT", USBDEVFS_RELEASE_PORT, -1, -1 }, // linux/usbdevice_fs.h:176
    { "USBDEVFS_GET_CAPABILITIES", USBDEVFS_GET_CAPABILITIES, -1, -1 }, // linux/usbdevice_fs.h:177
    { "USBDEVFS_DISCONNECT_CLAIM", USBDEVFS_DISCONNECT_CLAIM, -1, -1 }, // linux/usbdevice_fs.h:178
    { "WDIOC_SETTIMEOUT", WDIOC_SETTIMEOUT, -1, -1 }, // linux/watchdog.h:29
    { "WDIOC_GETTIMEOUT", WDIOC_GETTIMEOUT, -1, -1 }, // linux/watchdog.h:30
    { "NCP_IOC_CONN_LOGGED_IN", NCP_IOC_CONN_LOGGED_IN, -1, -1 }, // linux/ncp_fs.h:111
    { "NCP_IOC_GET_FS_INFO", NCP_IOC_GET_FS_INFO, -1, -1 }, // linux/ncp_fs.h:114
    { "PPPIOCGCALLINFO", PPPIOCGCALLINFO, -1, -1 }, // linux/isdn_ppp.h:30
    { "PPPIOCBUNDLE", PPPIOCBUNDLE, -1, -1 }, // linux/isdn_ppp.h:31
    { "PPPIOCGMPFLAGS", PPPIOCGMPFLAGS, -1, -1 }, // linux/isdn_ppp.h:32
    { "PPPIOCSMPFLAGS", PPPIOCSMPFLAGS, -1, -1 }, // linux/isdn_ppp.h:33
    { "PPPIOCSMPMTU", PPPIOCSMPMTU, -1, -1 }, // linux/isdn_ppp.h:34
    { "PPPIOCSMPMRU", PPPIOCSMPMRU, -1, -1 }, // linux/isdn_ppp.h:35
    { "PPPIOCGCOMPRESSORS", PPPIOCGCOMPRESSORS, -1, -1 }, // linux/isdn_ppp.h:36
    { "PPPIOCSCOMPRESSOR", PPPIOCSCOMPRESSOR, -1, -1 }, // linux/isdn_ppp.h:37
    { "PPPIOCGIFNAME", PPPIOCGIFNAME, -1, -1 }, // linux/isdn_ppp.h:38
    { "IPMICTL_UNREGISTER_FOR_CMD_CHANS", IPMICTL_UNREGISTER_FOR_CMD_CHANS, -1, -1 }, // linux/ipmi.h:391
    { "CA_RESET", CA_RESET, -1, -1 }, // linux/dvb/ca.h:81
    { "CA_GET_CAP", CA_GET_CAP, -1, -1 }, // linux/dvb/ca.h:82
    { "CA_GET_SLOT_INFO", CA_GET_SLOT_INFO, -1, -1 }, // linux/dvb/ca.h:83
    { "CA_GET_DESCR_INFO", CA_GET_DESCR_INFO, -1, -1 }, // linux/dvb/ca.h:84
    { "CA_GET_MSG", CA_GET_MSG, -1, -1 }, // linux/dvb/ca.h:85
    { "CA_SEND_MSG", CA_SEND_MSG, -1, -1 }, // linux/dvb/ca.h:86
    { "CA_SET_DESCR", CA_SET_DESCR, -1, -1 }, // linux/dvb/ca.h:87
    { "CA_SET_PID", CA_SET_PID, -1, -1 }, // linux/dvb/ca.h:88
    { "VIDEO_STOP", VIDEO_STOP, -1, -1 }, // linux/dvb/video.h:227
    { "VIDEO_PLAY", VIDEO_PLAY, -1, -1 }, // linux/dvb/video.h:228
    { "VIDEO_FREEZE", VIDEO_FREEZE, -1, -1 }, // linux/dvb/video.h:229
    { "VIDEO_CONTINUE", VIDEO_CONTINUE, -1, -1 }, // linux/dvb/video.h:230
    { "VIDEO_SELECT_SOURCE", VIDEO_SELECT_SOURCE, -1, -1 }, // linux/dvb/video.h:231
    { "VIDEO_SET_BLANK", VIDEO_SET_BLANK, -1, -1 }, // linux/dvb/video.h:232
    { "VIDEO_GET_STATUS", VIDEO_GET_STATUS, -1, -1 }, // linux/dvb/video.h:233
    { "VIDEO_GET_EVENT", VIDEO_GET_EVENT, -1, -1 }, // linux/dvb/video.h:234
    { "VIDEO_SET_DISPLAY_FORMAT", VIDEO_SET_DISPLAY_FORMAT, -1, -1 }, // linux/dvb/video.h:235
    { "VIDEO_STILLPICTURE", VIDEO_STILLPICTURE, -1, -1 }, // linux/dvb/video.h:236
    { "VIDEO_FAST_FORWARD", VIDEO_FAST_FORWARD, -1, -1 }, // linux/dvb/video.h:237
    { "VIDEO_SLOWMOTION", VIDEO_SLOWMOTION, -1, -1 }, // linux/dvb/video.h:238
    { "VIDEO_GET_CAPABILITIES", VIDEO_GET_CAPABILITIES, -1, -1 }, // linux/dvb/video.h:239
    { "VIDEO_CLEAR_BUFFER", VIDEO_CLEAR_BUFFER, -1, -1 }, // linux/dvb/video.h:240
    { "VIDEO_SET_ID", VIDEO_SET_ID, -1, -1 }, // linux/dvb/video.h:241
    { "VIDEO_SET_STREAMTYPE", VIDEO_SET_STREAMTYPE, -1, -1 }, // linux/dvb/video.h:242
    { "VIDEO_SET_FORMAT", VIDEO_SET_FORMAT, -1, -1 }, // linux/dvb/video.h:243
    { "VIDEO_SET_SYSTEM", VIDEO_SET_SYSTEM, -1, -1 }, // linux/dvb/video.h:244
    { "VIDEO_SET_HIGHLIGHT", VIDEO_SET_HIGHLIGHT, -1, -1 }, // linux/dvb/video.h:245
    { "VIDEO_SET_SPU", VIDEO_SET_SPU, -1, -1 }, // linux/dvb/video.h:246
    { "VIDEO_SET_SPU_PALETTE", VIDEO_SET_SPU_PALETTE, -1, -1 }, // linux/dvb/video.h:247
    { "VIDEO_GET_NAVI", VIDEO_GET_NAVI, -1, -1 }, // linux/dvb/video.h:248
    { "VIDEO_SET_ATTRIBUTES", VIDEO_SET_ATTRIBUTES, -1, -1 }, // linux/dvb/video.h:249
    { "VIDEO_GET_SIZE", VIDEO_GET_SIZE, -1, -1 }, // linux/dvb/video.h:250
    { "VIDEO_GET_FRAME_RATE", VIDEO_GET_FRAME_RATE, -1, -1 }, // linux/dvb/video.h:251
    { "VIDEO_GET_PTS", VIDEO_GET_PTS, -1, -1 }, // linux/dvb/video.h:264
    { "VIDEO_GET_FRAME_COUNT", VIDEO_GET_FRAME_COUNT, -1, -1 }, // linux/dvb/video.h:267
    { "VIDEO_COMMAND", VIDEO_COMMAND, -1, -1 }, // linux/dvb/video.h:269
    { "VIDEO_TRY_COMMAND", VIDEO_TRY_COMMAND, -1, -1 }, // linux/dvb/video.h:270
    { "FE_SET_PROPERTY", FE_SET_PROPERTY, -1, -1 }, // linux/dvb/frontend.h:542
    { "FE_GET_PROPERTY", FE_GET_PROPERTY, -1, -1 }, // linux/dvb/frontend.h:543
    { "FE_GET_INFO", FE_GET_INFO, -1, -1 }, // linux/dvb/frontend.h:554
    { "FE_DISEQC_RESET_OVERLOAD", FE_DISEQC_RESET_OVERLOAD, -1, -1 }, // linux/dvb/frontend.h:556
    { "FE_DISEQC_SEND_MASTER_CMD", FE_DISEQC_SEND_MASTER_CMD, -1, -1 }, // linux/dvb/frontend.h:557
    { "FE_DISEQC_RECV_SLAVE_REPLY", FE_DISEQC_RECV_SLAVE_REPLY, -1, -1 }, // linux/dvb/frontend.h:558
    { "FE_DISEQC_SEND_BURST", FE_DISEQC_SEND_BURST, -1, -1 }, // linux/dvb/frontend.h:559
    { "FE_SET_TONE", FE_SET_TONE, -1, -1 }, // linux/dvb/frontend.h:561
    { "FE_SET_VOLTAGE", FE_SET_VOLTAGE, -1, -1 }, // linux/dvb/frontend.h:562
    { "FE_ENABLE_HIGH_LNB_VOLTAGE", FE_ENABLE_HIGH_LNB_VOLTAGE, -1, -1 }, // linux/dvb/frontend.h:563
    { "FE_READ_STATUS", FE_READ_STATUS, -1, -1 }, // linux/dvb/frontend.h:565
    { "FE_READ_BER", FE_READ_BER, -1, -1 }, // linux/dvb/frontend.h:566
    { "FE_READ_SIGNAL_STRENGTH", FE_READ_SIGNAL_STRENGTH, -1, -1 }, // linux/dvb/frontend.h:567
    { "FE_READ_SNR", FE_READ_SNR, -1, -1 }, // linux/dvb/frontend.h:568
    { "FE_READ_UNCORRECTED_BLOCKS", FE_READ_UNCORRECTED_BLOCKS, -1, -1 }, // linux/dvb/frontend.h:569
    { "FE_SET_FRONTEND", FE_SET_FRONTEND, -1, -1 }, // linux/dvb/frontend.h:570
    { "FE_GET_FRONTEND", FE_GET_FRONTEND, -1, -1 }, // linux/dvb/frontend.h:571
    { "FE_SET_FRONTEND_TUNE_MODE", FE_SET_FRONTEND_TUNE_MODE, -1, -1 }, // linux/dvb/frontend.h:572
    { "FE_GET_EVENT", FE_GET_EVENT, -1, -1 }, // linux/dvb/frontend.h:573
    { "FE_DISHNETWORK_SEND_LEGACY_CMD", FE_DISHNETWORK_SEND_LEGACY_CMD, -1, -1 }, // linux/dvb/frontend.h:575
    { "OSD_SEND_CMD", OSD_SEND_CMD, -1, -1 }, // linux/dvb/osd.h:141
    { "OSD_GET_CAPABILITY", OSD_GET_CAPABILITY, -1, -1 }, // linux/dvb/osd.h:142
    { "NET_ADD_IF", NET_ADD_IF, -1, -1 }, // linux/dvb/net.h:38
    { "NET_REMOVE_IF", NET_REMOVE_IF, -1, -1 }, // linux/dvb/net.h:39
    { "NET_GET_IF", NET_GET_IF, -1, -1 }, // linux/dvb/net.h:40
    { "__NET_ADD_IF_OLD", __NET_ADD_IF_OLD, -1, -1 }, // linux/dvb/net.h:48
    { "__NET_GET_IF_OLD", __NET_GET_IF_OLD, -1, -1 }, // linux/dvb/net.h:49
    { "DMX_START", DMX_START, -1, -1 }, // linux/dvb/dmx.h:136
    { "DMX_STOP", DMX_STOP, -1, -1 }, // linux/dvb/dmx.h:137
    { "DMX_SET_FILTER", DMX_SET_FILTER, -1, -1 }, // linux/dvb/dmx.h:138
    { "DMX_SET_PES_FILTER", DMX_SET_PES_FILTER, -1, -1 }, // linux/dvb/dmx.h:139
    { "DMX_SET_BUFFER_SIZE", DMX_SET_BUFFER_SIZE, -1, -1 }, // linux/dvb/dmx.h:140
    { "DMX_GET_PES_PIDS", DMX_GET_PES_PIDS, -1, -1 }, // linux/dvb/dmx.h:141
    { "DMX_GET_CAPS", DMX_GET_CAPS, -1, -1 }, // linux/dvb/dmx.h:142
    { "DMX_SET_SOURCE", DMX_SET_SOURCE, -1, -1 }, // linux/dvb/dmx.h:143
    { "DMX_GET_STC", DMX_GET_STC, -1, -1 }, // linux/dvb/dmx.h:144
    { "DMX_ADD_PID", DMX_ADD_PID, -1, -1 }, // linux/dvb/dmx.h:145
    { "DMX_REMOVE_PID", DMX_REMOVE_PID, -1, -1 }, // linux/dvb/dmx.h:146
    { "AUDIO_STOP", AUDIO_STOP, -1, -1 }, // linux/dvb/audio.h:101
    { "AUDIO_PLAY", AUDIO_PLAY, -1, -1 }, // linux/dvb/audio.h:102
    { "AUDIO_PAUSE", AUDIO_PAUSE, -1, -1 }, // linux/dvb/audio.h:103
    { "AUDIO_CONTINUE", AUDIO_CONTINUE, -1, -1 }, // linux/dvb/audio.h:104
    { "AUDIO_SELECT_SOURCE", AUDIO_SELECT_SOURCE, -1, -1 }, // linux/dvb/audio.h:105
    { "AUDIO_SET_MUTE", AUDIO_SET_MUTE, -1, -1 }, // linux/dvb/audio.h:106
    { "AUDIO_SET_AV_SYNC", AUDIO_SET_AV_SYNC, -1, -1 }, // linux/dvb/audio.h:107
    { "AUDIO_SET_BYPASS_MODE", AUDIO_SET_BYPASS_MODE, -1, -1 }, // linux/dvb/audio.h:108
    { "AUDIO_CHANNEL_SELECT", AUDIO_CHANNEL_SELECT, -1, -1 }, // linux/dvb/audio.h:109
    { "AUDIO_GET_STATUS", AUDIO_GET_STATUS, -1, -1 }, // linux/dvb/audio.h:110
    { "AUDIO_GET_CAPABILITIES", AUDIO_GET_CAPABILITIES, -1, -1 }, // linux/dvb/audio.h:112
    { "AUDIO_CLEAR_BUFFER", AUDIO_CLEAR_BUFFER, -1, -1 }, // linux/dvb/audio.h:113
    { "AUDIO_SET_ID", AUDIO_SET_ID, -1, -1 }, // linux/dvb/audio.h:114
    { "AUDIO_SET_MIXER", AUDIO_SET_MIXER, -1, -1 }, // linux/dvb/audio.h:115
    { "AUDIO_SET_STREAMTYPE", AUDIO_SET_STREAMTYPE, -1, -1 }, // linux/dvb/audio.h:116
    { "AUDIO_SET_EXT_ID", AUDIO_SET_EXT_ID, -1, -1 }, // linux/dvb/audio.h:117
    { "AUDIO_SET_ATTRIBUTES", AUDIO_SET_ATTRIBUTES, -1, -1 }, // linux/dvb/audio.h:118
    { "AUDIO_SET_KARAOKE", AUDIO_SET_KARAOKE, -1, -1 }, // linux/dvb/audio.h:119
    { "AUDIO_GET_PTS", AUDIO_GET_PTS, -1, -1 }, // linux/dvb/audio.h:132
    { "AUDIO_BILINGUAL_CHANNEL_SELECT", AUDIO_BILINGUAL_CHANNEL_SELECT, -1, -1 }, // linux/dvb/audio.h:133
    { "BTRFS_IOC_SNAP_CREATE", BTRFS_IOC_SNAP_CREATE, -1, -1 }, // linux/btrfs.h:521
    { "BTRFS_IOC_DEFRAG", BTRFS_IOC_DEFRAG, -1, -1 }, // linux/btrfs.h:523
    { "BTRFS_IOC_RESIZE", BTRFS_IOC_RESIZE, -1, -1 }, // linux/btrfs.h:525
    { "BTRFS_IOC_SCAN_DEV", BTRFS_IOC_SCAN_DEV, -1, -1 }, // linux/btrfs.h:527
    { "BTRFS_IOC_TRANS_START", BTRFS_IOC_TRANS_START, -1, -1 }, // linux/btrfs.h:533
    { "BTRFS_IOC_TRANS_END", BTRFS_IOC_TRANS_END, -1, -1 }, // linux/btrfs.h:534
    { "BTRFS_IOC_SYNC", BTRFS_IOC_SYNC, -1, -1 }, // linux/btrfs.h:535
    { "BTRFS_IOC_CLONE", BTRFS_IOC_CLONE, -1, -1 }, // linux/btrfs.h:537
    { "BTRFS_IOC_ADD_DEV", BTRFS_IOC_ADD_DEV, -1, -1 }, // linux/btrfs.h:538
    { "BTRFS_IOC_RM_DEV", BTRFS_IOC_RM_DEV, -1, -1 }, // linux/btrfs.h:540
    { "BTRFS_IOC_BALANCE", BTRFS_IOC_BALANCE, -1, -1 }, // linux/btrfs.h:542
    { "BTRFS_IOC_CLONE_RANGE", BTRFS_IOC_CLONE_RANGE, -1, -1 }, // linux/btrfs.h:545
    { "BTRFS_IOC_SUBVOL_CREATE", BTRFS_IOC_SUBVOL_CREATE, -1, -1 }, // linux/btrfs.h:548
    { "BTRFS_IOC_SNAP_DESTROY", BTRFS_IOC_SNAP_DESTROY, -1, -1 }, // linux/btrfs.h:550
    { "BTRFS_IOC_TREE_SEARCH", BTRFS_IOC_TREE_SEARCH, -1, -1 }, // linux/btrfs.h:554
    { "BTRFS_IOC_INO_LOOKUP", BTRFS_IOC_INO_LOOKUP, -1, -1 }, // linux/btrfs.h:556
    { "BTRFS_IOC_DEFAULT_SUBVOL", BTRFS_IOC_DEFAULT_SUBVOL, -1, -1 }, // linux/btrfs.h:558
    { "BTRFS_IOC_SPACE_INFO", BTRFS_IOC_SPACE_INFO, -1, -1 }, // linux/btrfs.h:559
    { "BTRFS_IOC_START_SYNC", BTRFS_IOC_START_SYNC, -1, -1 }, // linux/btrfs.h:561
    { "BTRFS_IOC_WAIT_SYNC", BTRFS_IOC_WAIT_SYNC, -1, -1 }, // linux/btrfs.h:562
    { "BTRFS_IOC_SNAP_CREATE_V2", BTRFS_IOC_SNAP_CREATE_V2, -1, -1 }, // linux/btrfs.h:563
    { "BTRFS_IOC_SUBVOL_CREATE_V2", BTRFS_IOC_SUBVOL_CREATE_V2, -1, -1 }, // linux/btrfs.h:565
    { "BTRFS_IOC_SUBVOL_GETFLAGS", BTRFS_IOC_SUBVOL_GETFLAGS, -1, -1 }, // linux/btrfs.h:567
    { "BTRFS_IOC_SUBVOL_SETFLAGS", BTRFS_IOC_SUBVOL_SETFLAGS, -1, -1 }, // linux/btrfs.h:568
    { "BTRFS_IOC_SCRUB", BTRFS_IOC_SCRUB, -1, -1 }, // linux/btrfs.h:569
    { "BTRFS_IOC_SCRUB_CANCEL", BTRFS_IOC_SCRUB_CANCEL, -1, -1 }, // linux/btrfs.h:571
    { "BTRFS_IOC_SCRUB_PROGRESS", BTRFS_IOC_SCRUB_PROGRESS, -1, -1 }, // linux/btrfs.h:572
    { "BTRFS_IOC_DEV_INFO", BTRFS_IOC_DEV_INFO, -1, -1 }, // linux/btrfs.h:574
    { "BTRFS_IOC_FS_INFO", BTRFS_IOC_FS_INFO, -1, -1 }, // linux/btrfs.h:576
    { "BTRFS_IOC_BALANCE_V2", BTRFS_IOC_BALANCE_V2, -1, -1 }, // linux/btrfs.h:578
    { "BTRFS_IOC_BALANCE_CTL", BTRFS_IOC_BALANCE_CTL, -1, -1 }, // linux/btrfs.h:580
    { "BTRFS_IOC_BALANCE_PROGRESS", BTRFS_IOC_BALANCE_PROGRESS, -1, -1 }, // linux/btrfs.h:581
    { "BTRFS_IOC_INO_PATHS", BTRFS_IOC_INO_PATHS, -1, -1 }, // linux/btrfs.h:583
    { "BTRFS_IOC_LOGICAL_INO", BTRFS_IOC_LOGICAL_INO, -1, -1 }, // linux/btrfs.h:585
    { "BTRFS_IOC_SET_RECEIVED_SUBVOL", BTRFS_IOC_SET_RECEIVED_SUBVOL, -1, -1 }, // linux/btrfs.h:587
    { "BTRFS_IOC_SEND", BTRFS_IOC_SEND, -1, -1 }, // linux/btrfs.h:589
    { "BTRFS_IOC_DEVICES_READY", BTRFS_IOC_DEVICES_READY, -1, -1 }, // linux/btrfs.h:590
    { "BTRFS_IOC_QUOTA_CTL", BTRFS_IOC_QUOTA_CTL, -1, -1 }, // linux/btrfs.h:592
    { "BTRFS_IOC_QGROUP_ASSIGN", BTRFS_IOC_QGROUP_ASSIGN, -1, -1 }, // linux/btrfs.h:594
    { "BTRFS_IOC_QGROUP_CREATE", BTRFS_IOC_QGROUP_CREATE, -1, -1 }, // linux/btrfs.h:596
    { "BTRFS_IOC_QGROUP_LIMIT", BTRFS_IOC_QGROUP_LIMIT, -1, -1 }, // linux/btrfs.h:598
    { "BTRFS_IOC_QUOTA_RESCAN", BTRFS_IOC_QUOTA_RESCAN, -1, -1 }, // linux/btrfs.h:600
    { "BTRFS_IOC_QUOTA_RESCAN_STATUS", BTRFS_IOC_QUOTA_RESCAN_STATUS, -1, -1 }, // linux/btrfs.h:602
    { "BTRFS_IOC_QUOTA_RESCAN_WAIT", BTRFS_IOC_QUOTA_RESCAN_WAIT, -1, -1 }, // linux/btrfs.h:604
    { "BTRFS_IOC_GET_DEV_STATS", BTRFS_IOC_GET_DEV_STATS, -1, -1 }, // linux/btrfs.h:609
    { "BTRFS_IOC_DEV_REPLACE", BTRFS_IOC_DEV_REPLACE, -1, -1 }, // linux/btrfs.h:611
    { "BTRFS_IOC_FILE_EXTENT_SAME", BTRFS_IOC_FILE_EXTENT_SAME, -1, -1 }, // linux/btrfs.h:613
    { "BTRFS_IOC_GET_FEATURES", BTRFS_IOC_GET_FEATURES, -1, -1 }, // linux/btrfs.h:615
    { "BTRFS_IOC_SET_FEATURES", BTRFS_IOC_SET_FEATURES, -1, -1 }, // linux/btrfs.h:617
    { "BTRFS_IOC_GET_SUPPORTED_FEATURES", BTRFS_IOC_GET_SUPPORTED_FEATURES, -1, -1 }, // linux/btrfs.h:619
    { "ATMMPC_CTRL", ATMMPC_CTRL, -1, -1 }, // linux/atmmpc.h:9
    { "ATMMPC_DATA", ATMMPC_DATA, -1, -1 }, // linux/atmmpc.h:10
    { "IIOCNETAIF", IIOCNETAIF, -1, -1 }, // linux/isdn.h:24
    { "IIOCNETDIF", IIOCNETDIF, -1, -1 }, // linux/isdn.h:25
    { "IIOCNETSCF", IIOCNETSCF, -1, -1 }, // linux/isdn.h:26
    { "IIOCNETGCF", IIOCNETGCF, -1, -1 }, // linux/isdn.h:27
    { "IIOCNETANM", IIOCNETANM, -1, -1 }, // linux/isdn.h:28
    { "IIOCNETDNM", IIOCNETDNM, -1, -1 }, // linux/isdn.h:29
    { "IIOCNETGNM", IIOCNETGNM, -1, -1 }, // linux/isdn.h:30
    { "IIOCGETSET", IIOCGETSET, -1, -1 }, // linux/isdn.h:31
    { "IIOCSETSET", IIOCSETSET, -1, -1 }, // linux/isdn.h:32
    { "IIOCSETVER", IIOCSETVER, -1, -1 }, // linux/isdn.h:33
    { "IIOCNETHUP", IIOCNETHUP, -1, -1 }, // linux/isdn.h:34
    { "IIOCSETGST", IIOCSETGST, -1, -1 }, // linux/isdn.h:35
    { "IIOCSETBRJ", IIOCSETBRJ, -1, -1 }, // linux/isdn.h:36
    { "IIOCSIGPRF", IIOCSIGPRF, -1, -1 }, // linux/isdn.h:37
    { "IIOCGETPRF", IIOCGETPRF, -1, -1 }, // linux/isdn.h:38
    { "IIOCSETPRF", IIOCSETPRF, -1, -1 }, // linux/isdn.h:39
    { "IIOCGETMAP", IIOCGETMAP, -1, -1 }, // linux/isdn.h:40
    { "IIOCSETMAP", IIOCSETMAP, -1, -1 }, // linux/isdn.h:41
    { "IIOCNETASL", IIOCNETASL, -1, -1 }, // linux/isdn.h:42
    { "IIOCNETDIL", IIOCNETDIL, -1, -1 }, // linux/isdn.h:43
    { "IIOCGETCPS", IIOCGETCPS, -1, -1 }, // linux/isdn.h:44
    { "IIOCGETDVR", IIOCGETDVR, -1, -1 }, // linux/isdn.h:45
    { "IIOCNETLCR", IIOCNETLCR, -1, -1 }, // linux/isdn.h:46
    { "IIOCNETDWRSET", IIOCNETDWRSET, -1, -1 }, // linux/isdn.h:47
    { "IIOCNETALN", IIOCNETALN, -1, -1 }, // linux/isdn.h:49
    { "IIOCNETDLN", IIOCNETDLN, -1, -1 }, // linux/isdn.h:50
    { "IIOCNETGPN", IIOCNETGPN, -1, -1 }, // linux/isdn.h:52
    { "IIOCDBGVAR", IIOCDBGVAR, -1, -1 }, // linux/isdn.h:54
    { "IIOCDRVCTL", IIOCDRVCTL, -1, -1 }, // linux/isdn.h:56
    { "DM_VERSION", DM_VERSION, -1, -1 }, // linux/dm-ioctl.h:248
    { "DM_REMOVE_ALL", DM_REMOVE_ALL, -1, -1 }, // linux/dm-ioctl.h:249
    { "DM_LIST_DEVICES", DM_LIST_DEVICES, -1, -1 }, // linux/dm-ioctl.h:250
    { "DM_DEV_CREATE", DM_DEV_CREATE, -1, -1 }, // linux/dm-ioctl.h:252
    { "DM_DEV_REMOVE", DM_DEV_REMOVE, -1, -1 }, // linux/dm-ioctl.h:253
    { "DM_DEV_RENAME", DM_DEV_RENAME, -1, -1 }, // linux/dm-ioctl.h:254
    { "DM_DEV_SUSPEND", DM_DEV_SUSPEND, -1, -1 }, // linux/dm-ioctl.h:255
    { "DM_DEV_STATUS", DM_DEV_STATUS, -1, -1 }, // linux/dm-ioctl.h:256
    { "DM_DEV_WAIT", DM_DEV_WAIT, -1, -1 }, // linux/dm-ioctl.h:257
    { "DM_TABLE_LOAD", DM_TABLE_LOAD, -1, -1 }, // linux/dm-ioctl.h:259
    { "DM_TABLE_CLEAR", DM_TABLE_CLEAR, -1, -1 }, // linux/dm-ioctl.h:260
    { "DM_TABLE_DEPS", DM_TABLE_DEPS, -1, -1 }, // linux/dm-ioctl.h:261
    { "DM_TABLE_STATUS", DM_TABLE_STATUS, -1, -1 }, // linux/dm-ioctl.h:262
    { "DM_LIST_VERSIONS", DM_LIST_VERSIONS, -1, -1 }, // linux/dm-ioctl.h:264
    { "DM_TARGET_MSG", DM_TARGET_MSG, -1, -1 }, // linux/dm-ioctl.h:266
    { "FDCLRPRM", FDCLRPRM, -1, -1 }, // linux/fd.h:48
    { "FDSETPRM", FDSETPRM, -1, -1 }, // linux/fd.h:51
    { "FDDEFPRM", FDDEFPRM, -1, -1 }, // linux/fd.h:55
    { "FDGETPRM", FDGETPRM, -1, -1 }, // linux/fd.h:56
    { "FDMSGON", FDMSGON, -1, -1 }, // linux/fd.h:62
    { "FDMSGOFF", FDMSGOFF, -1, -1 }, // linux/fd.h:63
    { "FDFMTBEG", FDFMTBEG, -1, -1 }, // linux/fd.h:76
    { "FDFMTTRK", FDFMTTRK, -1, -1 }, // linux/fd.h:78
    { "FDFMTEND", FDFMTEND, -1, -1 }, // linux/fd.h:80
    { "FDFLUSH", FDFLUSH, -1, -1 }, // linux/fd.h:108
    { "FDSETMAXERRS", FDSETMAXERRS, -1, -1 }, // linux/fd.h:112
    { "FDGETMAXERRS", FDGETMAXERRS, -1, -1 }, // linux/fd.h:113
    { "FDGETDRVTYP", FDGETDRVTYP, -1, -1 }, // linux/fd.h:119
    { "FDSETDRVPRM", FDSETDRVPRM, -1, -1 }, // linux/fd.h:192
    { "FDGETDRVPRM", FDGETDRVPRM, -1, -1 }, // linux/fd.h:193
    { "FDGETDRVSTAT", FDGETDRVSTAT, -1, -1 }, // linux/fd.h:235
    { "FDPOLLDRVSTAT", FDPOLLDRVSTAT, -1, -1 }, // linux/fd.h:236
    { "FDRESET", FDRESET, -1, -1 }, // linux/fd.h:248
    { "FDGETFDCSTAT", FDGETFDCSTAT, -1, -1 }, // linux/fd.h:286
    { "FDWERRORCLR", FDWERRORCLR, -1, -1 }, // linux/fd.h:314
    { "FDWERRORGET", FDWERRORGET, -1, -1 }, // linux/fd.h:316
    { "FDRAWCMD", FDRAWCMD, -1, -1 }, // linux/fd.h:370
    { "FDTWADDLE", FDTWADDLE, -1, -1 }, // linux/fd.h:374
    { "FDEJECT", FDEJECT, -1, -1 }, // linux/fd.h:378
    { "BLKPG", BLKPG, -1, -1 }, // linux/blkpg.h:30
    { "VFIO_IOMMU_GET_INFO", VFIO_IOMMU_GET_INFO, -1, -1 }, // linux/vfio.h:382
    { "VFIO_IOMMU_MAP_DMA", VFIO_IOMMU_MAP_DMA, -1, -1 }, // linux/vfio.h:400
    { "VFIO_IOMMU_UNMAP_DMA", VFIO_IOMMU_UNMAP_DMA, -1, -1 }, // linux/vfio.h:419
    { "VIDIOC_QUERYCAP", VIDIOC_QUERYCAP, -1, -1 }, // linux/videodev2.h:2001
    { "VIDIOC_RESERVED", VIDIOC_RESERVED, -1, -1 }, // linux/videodev2.h:2002
    { "VIDIOC_ENUM_FMT", VIDIOC_ENUM_FMT, -1, -1 }, // linux/videodev2.h:2003
    { "VIDIOC_G_FBUF", VIDIOC_G_FBUF, -1, -1 }, // linux/videodev2.h:2008
    { "VIDIOC_S_FBUF", VIDIOC_S_FBUF, -1, -1 }, // linux/videodev2.h:2009
    { "VIDIOC_OVERLAY", VIDIOC_OVERLAY, -1, -1 }, // linux/videodev2.h:2010
    { "VIDIOC_STREAMON", VIDIOC_STREAMON, -1, -1 }, // linux/videodev2.h:2014
    { "VIDIOC_STREAMOFF", VIDIOC_STREAMOFF, -1, -1 }, // linux/videodev2.h:2015
    { "VIDIOC_G_STD", VIDIOC_G_STD, -1, -1 }, // linux/videodev2.h:2018
    { "VIDIOC_S_STD", VIDIOC_S_STD, -1, -1 }, // linux/videodev2.h:2019
    { "VIDIOC_S_TUNER", VIDIOC_S_TUNER, -1, -1 }, // linux/videodev2.h:2025
    { "VIDIOC_G_AUDIO", VIDIOC_G_AUDIO, -1, -1 }, // linux/videodev2.h:2026
    { "VIDIOC_S_AUDIO", VIDIOC_S_AUDIO, -1, -1 }, // linux/videodev2.h:2027
    { "VIDIOC_G_INPUT", VIDIOC_G_INPUT, -1, -1 }, // linux/videodev2.h:2030
    { "VIDIOC_G_OUTPUT", VIDIOC_G_OUTPUT, -1, -1 }, // linux/videodev2.h:2032
    { "VIDIOC_G_AUDOUT", VIDIOC_G_AUDOUT, -1, -1 }, // linux/videodev2.h:2035
    { "VIDIOC_S_AUDOUT", VIDIOC_S_AUDOUT, -1, -1 }, // linux/videodev2.h:2036
    { "VIDIOC_S_MODULATOR", VIDIOC_S_MODULATOR, -1, -1 }, // linux/videodev2.h:2038
    { "VIDIOC_S_FREQUENCY", VIDIOC_S_FREQUENCY, -1, -1 }, // linux/videodev2.h:2040
    { "VIDIOC_S_CROP", VIDIOC_S_CROP, -1, -1 }, // linux/videodev2.h:2043
    { "VIDIOC_G_JPEGCOMP", VIDIOC_G_JPEGCOMP, -1, -1 }, // linux/videodev2.h:2044
    { "VIDIOC_S_JPEGCOMP", VIDIOC_S_JPEGCOMP, -1, -1 }, // linux/videodev2.h:2045
    { "VIDIOC_QUERYSTD", VIDIOC_QUERYSTD, -1, -1 }, // linux/videodev2.h:2046
    { "VIDIOC_G_PRIORITY", VIDIOC_G_PRIORITY, -1, -1 }, // linux/videodev2.h:2050
    { "VIDIOC_S_PRIORITY", VIDIOC_S_PRIORITY, -1, -1 }, // linux/videodev2.h:2051
    { "VIDIOC_G_SLICED_VBI_CAP", VIDIOC_G_SLICED_VBI_CAP, -1, -1 }, // linux/videodev2.h:2052
    { "VIDIOC_LOG_STATUS", VIDIOC_LOG_STATUS, -1, -1 }, // linux/videodev2.h:2053
    { "VIDIOC_ENUM_FRAMEINTERVALS", VIDIOC_ENUM_FRAMEINTERVALS, -1, -1 }, // linux/videodev2.h:2058
    { "VIDIOC_G_ENC_INDEX", VIDIOC_G_ENC_INDEX, -1, -1 }, // linux/videodev2.h:2059
    { "VIDIOC_ENCODER_CMD", VIDIOC_ENCODER_CMD, -1, -1 }, // linux/videodev2.h:2060
    { "VIDIOC_TRY_ENCODER_CMD", VIDIOC_TRY_ENCODER_CMD, -1, -1 }, // linux/videodev2.h:2061
    { "VIDIOC_DBG_S_REGISTER", VIDIOC_DBG_S_REGISTER, -1, -1 }, // linux/videodev2.h:2066
    { "VIDIOC_S_HW_FREQ_SEEK", VIDIOC_S_HW_FREQ_SEEK, -1, -1 }, // linux/videodev2.h:2069
    { "VIDIOC_DQEVENT", VIDIOC_DQEVENT, -1, -1 }, // linux/videodev2.h:2073
    { "VIDIOC_SUBSCRIBE_EVENT", VIDIOC_SUBSCRIBE_EVENT, -1, -1 }, // linux/videodev2.h:2074
    { "VIDIOC_UNSUBSCRIBE_EVENT", VIDIOC_UNSUBSCRIBE_EVENT, -1, -1 }, // linux/videodev2.h:2075
    { "VIDIOC_ENUM_DV_TIMINGS", VIDIOC_ENUM_DV_TIMINGS, -1, -1 }, // linux/videodev2.h:2093
    { "VIDIOC_QUERY_DV_TIMINGS", VIDIOC_QUERY_DV_TIMINGS, -1, -1 }, // linux/videodev2.h:2094
    { "VIDIOC_DV_TIMINGS_CAP", VIDIOC_DV_TIMINGS_CAP, -1, -1 }, // linux/videodev2.h:2095
    { "VIDIOC_DBG_G_CHIP_INFO", VIDIOC_DBG_G_CHIP_INFO, -1, -1 }, // linux/videodev2.h:2103
    { "CHIOMOVE", CHIOMOVE, -1, -1 }, // linux/chio.h:150
    { "CHIOEXCHANGE", CHIOEXCHANGE, -1, -1 }, // linux/chio.h:151
    { "CHIOPOSITION", CHIOPOSITION, -1, -1 }, // linux/chio.h:152
    { "CHIOGPICKER", CHIOGPICKER, -1, -1 }, // linux/chio.h:153
    { "CHIOSPICKER", CHIOSPICKER, -1, -1 }, // linux/chio.h:154
    { "CHIOGPARAMS", CHIOGPARAMS, -1, -1 }, // linux/chio.h:155
    { "CHIOGSTATUS", CHIOGSTATUS, -1, -1 }, // linux/chio.h:156
    { "CHIOGELEM", CHIOGELEM, -1, -1 }, // linux/chio.h:157
    { "CHIOINITELEM", CHIOINITELEM, -1, -1 }, // linux/chio.h:158
    { "CHIOSVOLTAG", CHIOSVOLTAG, -1, -1 }, // linux/chio.h:159
    { "CHIOGVPARAMS", CHIOGVPARAMS, -1, -1 }, // linux/chio.h:160
    { "CCISS_GETPCIINFO", CCISS_GETPCIINFO, -1, -1 }, // linux/cciss_ioctl.h:64
    { "CCISS_GETINTINFO", CCISS_GETINTINFO, -1, -1 }, // linux/cciss_ioctl.h:66
    { "CCISS_SETINTINFO", CCISS_SETINTINFO, -1, -1 }, // linux/cciss_ioctl.h:67
    { "CCISS_GETNODENAME", CCISS_GETNODENAME, -1, -1 }, // linux/cciss_ioctl.h:69
    { "CCISS_SETNODENAME", CCISS_SETNODENAME, -1, -1 }, // linux/cciss_ioctl.h:70
    { "CCISS_GETHEARTBEAT", CCISS_GETHEARTBEAT, -1, -1 }, // linux/cciss_ioctl.h:72
    { "CCISS_GETBUSTYPES", CCISS_GETBUSTYPES, -1, -1 }, // linux/cciss_ioctl.h:73
    { "CCISS_GETFIRMVER", CCISS_GETFIRMVER, -1, -1 }, // linux/cciss_ioctl.h:74
    { "CCISS_GETDRIVVER", CCISS_GETDRIVVER, -1, -1 }, // linux/cciss_ioctl.h:75
    { "CCISS_REVALIDVOLS", CCISS_REVALIDVOLS, -1, -1 }, // linux/cciss_ioctl.h:76
    { "CCISS_PASSTHRU", CCISS_PASSTHRU, -1, -1 }, // linux/cciss_ioctl.h:77
    { "CCISS_DEREGDISK", CCISS_DEREGDISK, -1, -1 }, // linux/cciss_ioctl.h:78
    { "CCISS_REGNEWDISK", CCISS_REGNEWDISK, -1, -1 }, // linux/cciss_ioctl.h:81
    { "CCISS_REGNEWD", CCISS_REGNEWD, -1, -1 }, // linux/cciss_ioctl.h:83
    { "CCISS_RESCANDISK", CCISS_RESCANDISK, -1, -1 }, // linux/cciss_ioctl.h:84
    { "CCISS_GETLUNINFO", CCISS_GETLUNINFO, -1, -1 }, // linux/cciss_ioctl.h:85
    { "CCISS_BIG_PASSTHRU", CCISS_BIG_PASSTHRU, -1, -1 }, // linux/cciss_ioctl.h:86
    { "IOCTL_WDM_MAX_COMMAND", IOCTL_WDM_MAX_COMMAND, -1, -1 }, // linux/usb/cdc-wdm.h:21
    { "SONET_SETFRAMING", SONET_SETFRAMING, -1, -1 }, // linux/sonet.h:37
    { "SONET_GETFRAMING", SONET_GETFRAMING, -1, -1 }, // linux/sonet.h:39
    { "SONET_GETFRSENSE", SONET_GETFRSENSE, -1, -1 }, // linux/sonet.h:41
    { "ATM_NEWBACKENDIF", ATM_NEWBACKENDIF, -1, -1 }, // linux/atmdev.h:99
    { "MIC_VIRTIO_ADD_DEVICE", MIC_VIRTIO_ADD_DEVICE, -1, -1 }, // linux/mic_ioctl.h:55
    { "MIC_VIRTIO_CONFIG_CHANGE", MIC_VIRTIO_CONFIG_CHANGE, -1, -1 }, // linux/mic_ioctl.h:70
    { "__KVM_DEPRECATED_MAIN_0x07", __KVM_DEPRECATED_MAIN_0x07, -1, -1 }, // linux/kvm.h:64
    { "__KVM_DEPRECATED_MAIN_0x08", __KVM_DEPRECATED_MAIN_0x08, -1, -1 }, // linux/kvm.h:65
    { "__KVM_DEPRECATED_VM_R_0x70", __KVM_DEPRECATED_VM_R_0x70, -1, -1 }, // linux/kvm.h:67
    { "__KVM_DEPRECATED_VCPU_W_0x87", __KVM_DEPRECATED_VCPU_W_0x87, -1, -1 }, // linux/kvm.h:82
    { "KVM_GET_API_VERSION", KVM_GET_API_VERSION, -1, -1 }, // linux/kvm.h:539
    { "KVM_CREATE_VM", KVM_CREATE_VM, -1, -1 }, // linux/kvm.h:540
    { "CM_IOSDBGLVL", CM_IOSDBGLVL, -1, -1 }, // linux/cm4000_cs.h:50
    { "TUNSETNOCSUM", TUNSETNOCSUM, -1, -1 }, // linux/if_tun.h:41
    { "TUNSETDEBUG", TUNSETDEBUG, -1, -1 }, // linux/if_tun.h:42
    { "TUNSETIFF", TUNSETIFF, -1, -1 }, // linux/if_tun.h:43
    { "TUNSETPERSIST", TUNSETPERSIST, -1, -1 }, // linux/if_tun.h:44
    { "TUNSETOWNER", TUNSETOWNER, -1, -1 }, // linux/if_tun.h:45
    { "TUNSETLINK", TUNSETLINK, -1, -1 }, // linux/if_tun.h:46
    { "TUNSETGROUP", TUNSETGROUP, -1, -1 }, // linux/if_tun.h:47
    { "TUNGETFEATURES", TUNGETFEATURES, -1, -1 }, // linux/if_tun.h:48
    { "TUNSETOFFLOAD", TUNSETOFFLOAD, -1, -1 }, // linux/if_tun.h:49
    { "TUNSETTXFILTER", TUNSETTXFILTER, -1, -1 }, // linux/if_tun.h:50
    { "TUNGETIFF", TUNGETIFF, -1, -1 }, // linux/if_tun.h:51
    { "TUNGETSNDBUF", TUNGETSNDBUF, -1, -1 }, // linux/if_tun.h:52
    { "TUNSETSNDBUF", TUNSETSNDBUF, -1, -1 }, // linux/if_tun.h:53
    { "TUNATTACHFILTER", TUNATTACHFILTER, -1, -1 }, // linux/if_tun.h:54
    { "TUNDETACHFILTER", TUNDETACHFILTER, -1, -1 }, // linux/if_tun.h:55
    { "TUNGETVNETHDRSZ", TUNGETVNETHDRSZ, -1, -1 }, // linux/if_tun.h:56
    { "TUNSETVNETHDRSZ", TUNSETVNETHDRSZ, -1, -1 }, // linux/if_tun.h:57
    { "TUNSETQUEUE", TUNSETQUEUE, -1, -1 }, // linux/if_tun.h:58
    { "TUNGETFILTER", TUNGETFILTER, -1, -1 }, // linux/if_tun.h:60
    { "FBIO_CURSOR", FBIO_CURSOR, -1, -1 }, // linux/fb.h:19
    { "FW_CDEV_IOC_GET_INFO", FW_CDEV_IOC_GET_INFO, -1, -1 }, // linux/firewire-cdev.h:393
    { "FW_CDEV_IOC_SEND_REQUEST", FW_CDEV_IOC_SEND_REQUEST, -1, -1 }, // linux/firewire-cdev.h:394
    { "FW_CDEV_IOC_ALLOCATE", FW_CDEV_IOC_ALLOCATE, -1, -1 }, // linux/firewire-cdev.h:395
    { "FW_CDEV_IOC_DEALLOCATE", FW_CDEV_IOC_DEALLOCATE, -1, -1 }, // linux/firewire-cdev.h:396
    { "FW_CDEV_IOC_SEND_RESPONSE", FW_CDEV_IOC_SEND_RESPONSE, -1, -1 }, // linux/firewire-cdev.h:397
    { "FW_CDEV_IOC_INITIATE_BUS_RESET", FW_CDEV_IOC_INITIATE_BUS_RESET, -1, -1 }, // linux/firewire-cdev.h:398
    { "FW_CDEV_IOC_ADD_DESCRIPTOR", FW_CDEV_IOC_ADD_DESCRIPTOR, -1, -1 }, // linux/firewire-cdev.h:399
    { "FW_CDEV_IOC_REMOVE_DESCRIPTOR", FW_CDEV_IOC_REMOVE_DESCRIPTOR, -1, -1 }, // linux/firewire-cdev.h:400
    { "FW_CDEV_IOC_CREATE_ISO_CONTEXT", FW_CDEV_IOC_CREATE_ISO_CONTEXT, -1, -1 }, // linux/firewire-cdev.h:401
    { "FW_CDEV_IOC_QUEUE_ISO", FW_CDEV_IOC_QUEUE_ISO, -1, -1 }, // linux/firewire-cdev.h:402
    { "FW_CDEV_IOC_START_ISO", FW_CDEV_IOC_START_ISO, -1, -1 }, // linux/firewire-cdev.h:403
    { "FW_CDEV_IOC_STOP_ISO", FW_CDEV_IOC_STOP_ISO, -1, -1 }, // linux/firewire-cdev.h:404
    { "FW_CDEV_IOC_GET_CYCLE_TIMER", FW_CDEV_IOC_GET_CYCLE_TIMER, -1, -1 }, // linux/firewire-cdev.h:407
    { "FW_CDEV_IOC_ALLOCATE_ISO_RESOURCE", FW_CDEV_IOC_ALLOCATE_ISO_RESOURCE, -1, -1 }, // linux/firewire-cdev.h:410
    { "FW_CDEV_IOC_DEALLOCATE_ISO_RESOURCE", FW_CDEV_IOC_DEALLOCATE_ISO_RESOURCE, -1, -1 }, // linux/firewire-cdev.h:411
    { "FW_CDEV_IOC_ALLOCATE_ISO_RESOURCE_ONCE", FW_CDEV_IOC_ALLOCATE_ISO_RESOURCE_ONCE, -1, -1 }, // linux/firewire-cdev.h:412
    { "FW_CDEV_IOC_DEALLOCATE_ISO_RESOURCE_ONCE", FW_CDEV_IOC_DEALLOCATE_ISO_RESOURCE_ONCE, -1, -1 }, // linux/firewire-cdev.h:413
    { "FW_CDEV_IOC_GET_SPEED", FW_CDEV_IOC_GET_SPEED, -1, -1 }, // linux/firewire-cdev.h:414
    { "FW_CDEV_IOC_SEND_BROADCAST_REQUEST", FW_CDEV_IOC_SEND_BROADCAST_REQUEST, -1, -1 }, // linux/firewire-cdev.h:415
    { "FW_CDEV_IOC_SEND_STREAM_PACKET", FW_CDEV_IOC_SEND_STREAM_PACKET, -1, -1 }, // linux/firewire-cdev.h:416
    { "FW_CDEV_IOC_GET_CYCLE_TIMER2", FW_CDEV_IOC_GET_CYCLE_TIMER2, -1, -1 }, // linux/firewire-cdev.h:419
    { "FW_CDEV_IOC_SEND_PHY_PACKET", FW_CDEV_IOC_SEND_PHY_PACKET, -1, -1 }, // linux/firewire-cdev.h:422
    { "FW_CDEV_IOC_RECEIVE_PHY_PACKETS", FW_CDEV_IOC_RECEIVE_PHY_PACKETS, -1, -1 }, // linux/firewire-cdev.h:423
    { "FW_CDEV_IOC_SET_ISO_CHANNELS", FW_CDEV_IOC_SET_ISO_CHANNELS, -1, -1 }, // linux/firewire-cdev.h:424
    { "FW_CDEV_IOC_FLUSH_ISO", FW_CDEV_IOC_FLUSH_ISO, -1, -1 }, // linux/firewire-cdev.h:427
    { "ATMSIGD_CTRL", ATMSIGD_CTRL, -1, -1 }, // linux/atmsvc.h:14
    { "AGPIOC_ALLOCATE", AGPIOC_ALLOCATE, -1, -1 }, // linux/agpgart.h:37
    { "BLKROSET", BLKROSET, -1, -1 }, // linux/fs.h:110
    { "BLKROGET", BLKROGET, -1, -1 }, // linux/fs.h:111
    { "BLKRRPART", BLKRRPART, -1, -1 }, // linux/fs.h:112
    { "BLKGETSIZE", BLKGETSIZE, -1, -1 }, // linux/fs.h:113
    { "BLKFLSBUF", BLKFLSBUF, -1, -1 }, // linux/fs.h:114
    { "BLKRASET", BLKRASET, -1, -1 }, // linux/fs.h:115
    { "BLKRAGET", BLKRAGET, -1, -1 }, // linux/fs.h:116
    { "BLKFRASET", BLKFRASET, -1, -1 }, // linux/fs.h:117
    { "BLKFRAGET", BLKFRAGET, -1, -1 }, // linux/fs.h:118
    { "BLKSECTSET", BLKSECTSET, -1, -1 }, // linux/fs.h:119
    { "BLKSECTGET", BLKSECTGET, -1, -1 }, // linux/fs.h:120
    { "BLKSSZGET", BLKSSZGET, -1, -1 }, // linux/fs.h:121
    { "BLKPG", BLKPG, -1, -1 }, // linux/fs.h:123
    { "BLKBSZGET", BLKBSZGET, -1, -1 }, // linux/fs.h:133
    { "BLKBSZSET", BLKBSZSET, -1, -1 }, // linux/fs.h:134
    { "BLKGETSIZE64", BLKGETSIZE64, -1, -1 }, // linux/fs.h:135
    { "BLKTRACESTART", BLKTRACESTART, -1, -1 }, // linux/fs.h:137
    { "BLKTRACESTOP", BLKTRACESTOP, -1, -1 }, // linux/fs.h:138
    { "BLKTRACETEARDOWN", BLKTRACETEARDOWN, -1, -1 }, // linux/fs.h:139
    { "BLKDISCARD", BLKDISCARD, -1, -1 }, // linux/fs.h:140
    { "BLKIOMIN", BLKIOMIN, -1, -1 }, // linux/fs.h:141
    { "BLKIOOPT", BLKIOOPT, -1, -1 }, // linux/fs.h:142
    { "BLKALIGNOFF", BLKALIGNOFF, -1, -1 }, // linux/fs.h:143
    { "BLKPBSZGET", BLKPBSZGET, -1, -1 }, // linux/fs.h:144
    { "BLKDISCARDZEROES", BLKDISCARDZEROES, -1, -1 }, // linux/fs.h:145
    { "BLKSECDISCARD", BLKSECDISCARD, -1, -1 }, // linux/fs.h:146
    { "BLKROTATIONAL", BLKROTATIONAL, -1, -1 }, // linux/fs.h:147
    { "BLKZEROOUT", BLKZEROOUT, -1, -1 }, // linux/fs.h:148
    { "FIBMAP", FIBMAP, -1, -1 }, // linux/fs.h:151
    { "FIGETBSZ", FIGETBSZ, -1, -1 }, // linux/fs.h:152
    { "SISFB_GET_INFO_OLD", SISFB_GET_INFO_OLD, -1, -1 }, // video/sisfb.h:187
    { "SISFB_GET_VBRSTATUS_OLD", SISFB_GET_VBRSTATUS_OLD, -1, -1 }, // video/sisfb.h:189
    { "SISFB_GET_AUTOMAXIMIZE_OLD", SISFB_GET_AUTOMAXIMIZE_OLD, -1, -1 }, // video/sisfb.h:191
    { "SISFB_SET_AUTOMAXIMIZE_OLD", SISFB_SET_AUTOMAXIMIZE_OLD, -1, -1 }, // video/sisfb.h:192
    { "LIRC_GET_FEATURES", LIRC_GET_FEATURES, -1, -1 }, // lirc/include/media/lirc.h:126
    { "LIRC_GET_SEND_MODE", LIRC_GET_SEND_MODE, -1, -1 }, // lirc/include/media/lirc.h:128
    { "LIRC_GET_REC_MODE", LIRC_GET_REC_MODE, -1, -1 }, // lirc/include/media/lirc.h:129
    { "LIRC_GET_SEND_CARRIER", LIRC_GET_SEND_CARRIER, -1, -1 }, // lirc/include/media/lirc.h:130
    { "LIRC_GET_REC_CARRIER", LIRC_GET_REC_CARRIER, -1, -1 }, // lirc/include/media/lirc.h:131
    { "LIRC_GET_SEND_DUTY_CYCLE", LIRC_GET_SEND_DUTY_CYCLE, -1, -1 }, // lirc/include/media/lirc.h:132
    { "LIRC_GET_REC_DUTY_CYCLE", LIRC_GET_REC_DUTY_CYCLE, -1, -1 }, // lirc/include/media/lirc.h:133
    { "LIRC_GET_REC_RESOLUTION", LIRC_GET_REC_RESOLUTION, -1, -1 }, // lirc/include/media/lirc.h:134
    { "LIRC_GET_MIN_TIMEOUT", LIRC_GET_MIN_TIMEOUT, -1, -1 }, // lirc/include/media/lirc.h:136
    { "LIRC_GET_MAX_TIMEOUT", LIRC_GET_MAX_TIMEOUT, -1, -1 }, // lirc/include/media/lirc.h:137
    { "LIRC_GET_MIN_FILTER_PULSE", LIRC_GET_MIN_FILTER_PULSE, -1, -1 }, // lirc/include/media/lirc.h:139
    { "LIRC_GET_MAX_FILTER_PULSE", LIRC_GET_MAX_FILTER_PULSE, -1, -1 }, // lirc/include/media/lirc.h:140
    { "LIRC_GET_MIN_FILTER_SPACE", LIRC_GET_MIN_FILTER_SPACE, -1, -1 }, // lirc/include/media/lirc.h:141
    { "LIRC_GET_MAX_FILTER_SPACE", LIRC_GET_MAX_FILTER_SPACE, -1, -1 }, // lirc/include/media/lirc.h:142
    { "LIRC_GET_LENGTH", LIRC_GET_LENGTH, -1, -1 }, // lirc/include/media/lirc.h:145
    { "LIRC_SET_SEND_MODE", LIRC_SET_SEND_MODE, -1, -1 }, // lirc/include/media/lirc.h:147
    { "LIRC_SET_REC_MODE", LIRC_SET_REC_MODE, -1, -1 }, // lirc/include/media/lirc.h:148
    { "LIRC_SET_SEND_CARRIER", LIRC_SET_SEND_CARRIER, -1, -1 }, // lirc/include/media/lirc.h:150
    { "LIRC_SET_REC_CARRIER", LIRC_SET_REC_CARRIER, -1, -1 }, // lirc/include/media/lirc.h:151
    { "LIRC_SET_SEND_DUTY_CYCLE", LIRC_SET_SEND_DUTY_CYCLE, -1, -1 }, // lirc/include/media/lirc.h:152
    { "LIRC_SET_REC_DUTY_CYCLE", LIRC_SET_REC_DUTY_CYCLE, -1, -1 }, // lirc/include/media/lirc.h:153
    { "LIRC_SET_TRANSMITTER_MASK", LIRC_SET_TRANSMITTER_MASK, -1, -1 }, // lirc/include/media/lirc.h:154
    { "LIRC_SET_REC_TIMEOUT", LIRC_SET_REC_TIMEOUT, -1, -1 }, // lirc/include/media/lirc.h:161
    { "LIRC_SET_REC_TIMEOUT_REPORTS", LIRC_SET_REC_TIMEOUT_REPORTS, -1, -1 }, // lirc/include/media/lirc.h:164
    { "LIRC_SET_REC_FILTER_PULSE", LIRC_SET_REC_FILTER_PULSE, -1, -1 }, // lirc/include/media/lirc.h:170
    { "LIRC_SET_REC_FILTER_SPACE", LIRC_SET_REC_FILTER_SPACE, -1, -1 }, // lirc/include/media/lirc.h:175
    { "LIRC_SET_REC_FILTER", LIRC_SET_REC_FILTER, -1, -1 }, // lirc/include/media/lirc.h:180
    { "LIRC_SET_MEASURE_CARRIER_MODE", LIRC_SET_MEASURE_CARRIER_MODE, -1, -1 }, // lirc/include/media/lirc.h:186
    { "LIRC_SET_REC_DUTY_CYCLE_RANGE", LIRC_SET_REC_DUTY_CYCLE_RANGE, -1, -1 }, // lirc/include/media/lirc.h:195
    { "LIRC_SET_REC_CARRIER_RANGE", LIRC_SET_REC_CARRIER_RANGE, -1, -1 }, // lirc/include/media/lirc.h:196
    { "LIRC_NOTIFY_DECODE", LIRC_NOTIFY_DECODE, -1, -1 }, // lirc/include/media/lirc.h:198
    { "LIRC_SETUP_START", LIRC_SETUP_START, -1, -1 }, // lirc/include/media/lirc.h:200
    { "LIRC_SETUP_END", LIRC_SETUP_END, -1, -1 }, // lirc/include/media/lirc.h:201
    { "LIRC_SET_WIDEBAND_RECEIVER", LIRC_SET_WIDEBAND_RECEIVER, -1, -1 }, // lirc/include/media/lirc.h:202
    { "LIRC_SET_FEATURES", LIRC_SET_FEATURES, -1, -1 }, // lirc/irpipe.h:3
    { "LIRC_SET_LENGTH", LIRC_SET_LENGTH, -1, -1 }, // lirc/irpipe.h:4
    { "SNDRV_HDSP_IOCTL_GET_PEAK_RMS", SNDRV_HDSP_IOCTL_GET_PEAK_RMS, -1, -1 }, // sound/hdsp.h:45
    { "SNDRV_HDSP_IOCTL_GET_CONFIG_INFO", SNDRV_HDSP_IOCTL_GET_CONFIG_INFO, -1, -1 }, // sound/hdsp.h:73
    { "SNDRV_HDSP_IOCTL_UPLOAD_FIRMWARE", SNDRV_HDSP_IOCTL_UPLOAD_FIRMWARE, -1, -1 }, // sound/hdsp.h:79
    { "SNDRV_HDSP_IOCTL_GET_VERSION", SNDRV_HDSP_IOCTL_GET_VERSION, -1, -1 }, // sound/hdsp.h:86
    { "SNDRV_HDSP_IOCTL_GET_MIXER", SNDRV_HDSP_IOCTL_GET_MIXER, -1, -1 }, // sound/hdsp.h:92
    { "SNDRV_HDSP_IOCTL_GET_9632_AEB", SNDRV_HDSP_IOCTL_GET_9632_AEB, -1, -1 }, // sound/hdsp.h:99
    { "SNDRV_FIREWIRE_IOCTL_GET_INFO", SNDRV_FIREWIRE_IOCTL_GET_INFO, -1, -1 }, // sound/firewire.h:32
    { "SNDRV_FIREWIRE_IOCTL_LOCK", SNDRV_FIREWIRE_IOCTL_LOCK, -1, -1 }, // sound/firewire.h:33
    { "SNDRV_FIREWIRE_IOCTL_UNLOCK", SNDRV_FIREWIRE_IOCTL_UNLOCK, -1, -1 }, // sound/firewire.h:34
    { "SNDRV_EMUX_IOCTL_REMOVE_LAST_SAMPLES", SNDRV_EMUX_IOCTL_REMOVE_LAST_SAMPLES, -1, -1 }, // sound/sfnt_info.h:208
    { "SNDRV_CTL_IOCTL_SUBSCRIBE_EVENTS", SNDRV_CTL_IOCTL_SUBSCRIBE_EVENTS, -1, -1 }, // sound/asound.h:914
    { "SNDRV_CTL_IOCTL_HWDEP_NEXT_DEVICE", SNDRV_CTL_IOCTL_HWDEP_NEXT_DEVICE, -1, -1 }, // sound/asound.h:921
    { "SNDRV_CTL_IOCTL_PCM_PREFER_SUBDEVICE", SNDRV_CTL_IOCTL_PCM_PREFER_SUBDEVICE, -1, -1 }, // sound/asound.h:925
    { "SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE", SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE, -1, -1 }, // sound/asound.h:926
    { "SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE", SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE, -1, -1 }, // sound/asound.h:928
    { "SNDRV_HDSPM_IOCTL_GET_LTC", SNDRV_HDSPM_IOCTL_GET_LTC, -1, -1 }, // sound/hdspm.h:114
    { "SNDRV_HDSPM_IOCTL_GET_VERSION", SNDRV_HDSPM_IOCTL_GET_VERSION, -1, -1 }, // sound/hdspm.h:188
    { "SNDRV_HDSPM_IOCTL_GET_MIXER", SNDRV_HDSPM_IOCTL_GET_MIXER, -1, -1 }, // sound/hdspm.h:219
    { NULL, 0 },
};

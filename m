Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9fcc-0006ec-N5
 for ath10k@lists.infradead.org; Wed, 23 Nov 2016 22:02:32 +0000
Received: by mail-qk0-x230.google.com with SMTP id x190so30716960qkb.0
 for <ath10k@lists.infradead.org>; Wed, 23 Nov 2016 14:02:09 -0800 (PST)
MIME-Version: 1.0
From: Zoilo Gomez <zoilo214.gomez@gmail.com>
Date: Wed, 23 Nov 2016 23:02:08 +0100
Message-ID: <CAMfKPAXXtuwbn2nQC19NwN=XuF-B8XQEzuk0pMPS8tHRMUV3Yg@mail.gmail.com>
Subject: ath10k qca988x: hostapd does not start properly
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi guys,

I am trying to build an AP using QCA988X. All seems to go well to the
point where I can load the ath10k drivers, and (after installing
firmware in /lib/firmware/QCA988X/HW2.0), firmware seems to be loaded
properly. I can run iw and get results (see below), however hostapd
does not start properly, throwing errors (a.o.):
=> Channel list update timeout - try to continue anyway
=> channel [0] (36) is disabled for use in AP mode, flags: 0x853 NO-IR
=> wlan0: IEEE 802.11 Configured channel (36) not found from the
channel list of current mode (2) IEEE 802.11a

This must be really easy, but I have just started working on this, so
your help to get me going is very much appreciated!

Thank you in advance for your time and help,

Zoilo.



Kernel is 3.10.87 with backport-3.18.1-1.

I use these firware versions:

~ # ls -l /root/firmware-*
-rwxr-xr-x    1 root     root        197244 Nov 16  2016
/root/firmware-2.bin_10.1.467.2-1
-rwxr-xr-x    1 root     root        235056 Nov 17  2016
/root/firmware-3.bin_10.2.2.39.6-1


~ # iw list
Wiphy phy1
        max # scan SSIDs: 16
        max scan IEs length: 199 bytes
        max # sched scan SSIDs: 0
        max # match sets: 0
        Retry short limit: 7
        Retry long limit: 4
        Coverage class: 0 (up to 0m)
        Device supports AP-side u-APSD.
        Supported Ciphers:
                * WEP40 (00-0f-ac:1)
                * WEP104 (00-0f-ac:5)
                * TKIP (00-0f-ac:2)
                * CCMP (00-0f-ac:4)
                * CMAC (00-0f-ac:6)
        Available Antennas: TX 0x7 RX 0x7
        Configured Antennas: TX 0x7 RX 0x7
        Supported interface modes:
                 * managed
                 * AP
                 * AP/VLAN
                 * monitor
        Band 2:
                Capabilities: 0x19e3
                        RX LDPC
                        HT20/HT40
                        Static SM Power Save
                        RX HT20 SGI
                        RX HT40 SGI
                        TX STBC
                        RX STBC 1-stream
                        Max AMSDU length: 7935 bytes
                        DSSS/CCK HT40
                Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
                Minimum RX AMPDU time spacing: 8 usec (0x06)
                HT TX/RX MCS rate indexes supported: 0-23
                VHT Capabilities (0x338001b2):
                        Max MPDU length: 11454
                        Supported Channel Width: neither 160 nor 80+80
                        RX LDPC
                        short GI (80 MHz)
                        TX STBC
                        RX antenna pattern consistency
                        TX antenna pattern consistency
                VHT RX MCS set:
                        1 streams: MCS 0-9
                        2 streams: MCS 0-9
                        3 streams: MCS 0-9
                        4 streams: not supported
                        5 streams: not supported
                        6 streams: not supported
                        7 streams: not supported
                        8 streams: not supported
                VHT RX highest supported: 0 Mbps
                VHT TX MCS set:
                        1 streams: MCS 0-9
                        2 streams: MCS 0-9
                        3 streams: MCS 0-9
                        4 streams: not supported
                        5 streams: not supported
                        6 streams: not supported
                        7 streams: not supported
                        8 streams: not supported
                VHT TX highest supported: 0 Mbps
                Bitrates (non-HT):
                        * 6.0 Mbps
                        * 9.0 Mbps
                        * 12.0 Mbps
                        * 18.0 Mbps
                        * 24.0 Mbps
                        * 36.0 Mbps
                        * 48.0 Mbps
                        * 54.0 Mbps
                Frequencies:
                        * 5180 MHz [36] (30.0 dBm) (no IR)
                        * 5200 MHz [40] (30.0 dBm) (no IR)
                        * 5220 MHz [44] (30.0 dBm) (no IR)
                        * 5240 MHz [48] (30.0 dBm) (no IR)
                        * 5260 MHz [52] (30.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 207721 sec)
                          DFS CAC time: 0 ms
                        * 5280 MHz [56] (30.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 207721 sec)
                          DFS CAC time: 0 ms
                        * 5300 MHz [60] (30.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 207721 sec)
                          DFS CAC time: 0 ms
                        * 5320 MHz [64] (30.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 207721 sec)
                          DFS CAC time: 0 ms
                        * 5500 MHz [100] (disabled)
                        * 5520 MHz [104] (disabled)
                        * 5540 MHz [108] (disabled)
                        * 5560 MHz [112] (disabled)
                        * 5580 MHz [116] (disabled)
                        * 5600 MHz [120] (disabled)
                        * 5620 MHz [124] (disabled)
                        * 5640 MHz [128] (disabled)
                        * 5660 MHz [132] (disabled)
                        * 5680 MHz [136] (disabled)
                        * 5700 MHz [140] (disabled)
                        * 5745 MHz [149] (30.0 dBm) (no IR)
                        * 5765 MHz [153] (30.0 dBm) (no IR)
                        * 5785 MHz [157] (30.0 dBm) (no IR)
                        * 5805 MHz [161] (30.0 dBm) (no IR)
                        * 5825 MHz [165] (30.0 dBm) (no IR)
        Supported commands:
                 * new_interface
                 * set_interface
                 * new_key
                 * start_ap
                 * new_station
                 * new_mpath
                 * set_mesh_config
                 * set_bss
                 * authenticate
                 * associate
                 * deauthenticate
                 * disassociate
                 * join_ibss
                 * join_mesh
                 * remain_on_channel
                 * set_tx_bitrate_mask
                 * frame
                 * frame_wait_cancel
                 * set_wiphy_netns
                 * set_channel
                 * set_wds_peer
                 * probe_client
                 * set_noack_map
                 * register_beacons
                 * start_p2p_device
                 * set_mcast_rate
                 * channel_switch
                 * set_qos_map
                 * connect
                 * disconnect
        Supported TX frame types:
                 * IBSS: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80
0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
                 * managed: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
                 * AP: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80
0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
                 * AP/VLAN: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
                 * mesh point: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
                 * P2P-client: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
                 * P2P-GO: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
                 * P2P-device: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
        Supported RX frame types:
                 * IBSS: 0x40 0xb0 0xc0 0xd0
                 * managed: 0x40 0xd0
                 * AP: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
                 * AP/VLAN: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
                 * mesh point: 0xb0 0xc0 0xd0
                 * P2P-client: 0x40 0xd0
                 * P2P-GO: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
                 * P2P-device: 0x40 0xd0
        software interface modes (can always be added):
                 * AP/VLAN
                 * monitor
        valid interface combinations:
                 * #{ AP } <= 8,
                   total <= 8, #channels <= 1, STA/AP BI must match
        HT Capability overrides:
                 * MCS: ff ff ff ff ff ff ff ff ff ff
                 * maximum A-MSDU length
                 * supported channel width
                 * short GI for 40 MHz
                 * max A-MPDU length exponent
                 * min MPDU start spacing
        Device supports TX status socket option.
        Device supports HT-IBSS.
        Device supports SAE with AUTHENTICATE command
        Device supports scan flush.
        Device supports per-vif TX power setting
        Driver supports a userspace MPM
        Device supports static SMPS




Here is my configuration file for hostapd:

/root # cat test.80211ac.conf
interface=wlan0
driver=nl80211

ssid=ath10k-test

country_code=US
hw_mode=a
channel=36
ht_capab=[HT40+]
ieee80211n=1
ieee80211ac=1
vht_oper_chwidth=1
vht_oper_centr_freq_seg0_idx=42




Now hostapd won't start properly, throws some errors, a.o.

/root # hostapd -ddd test.80211ac.conf
random: Trying to read entropy from /dev/random
Configuration file: test.80211ac.conf
rfkill: Cannot open RFKILL control device
nl80211: RFKILL status not available
nl80211: Supported cipher 00-0f-ac:1
nl80211: Supported cipher 00-0f-ac:5
nl80211: Supported cipher 00-0f-ac:2
nl80211: Supported cipher 00-0f-ac:4
nl80211: Supported cipher 00-0f-ac:6
nl80211: Using driver-based off-channel TX
nl80211: interface wlan0 in phy phy1
nl80211: Set mode ifindex 29 iftype 3 (AP)
nl80211: Failed to set interface 29 to mode 3: -16 (Device or resource busy)
nl80211: Try mode change after setting interface down

nl80211: Set mode ifindex 29 iftype 3 (AP)
nl80211: Mode change succeeded while interface is down

IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
nl80211: Setup AP(wlan0) - device_ap_sme=0 use_monitor=0
nl80211: Subscribe to mgmt frames with AP handle 0x14e33f70
nl80211: Register frame type=0xb0 (WLAN_FC_STYPE_AUTH)
nl_handle=0x14e33f70 match=
nl80211: Register frame type=0x0 (WLAN_FC_STYPE_ASSOC_REQ)
nl_handle=0x14e33f70 match=
nl80211: Register frame type=0x20 (WLAN_FC_STYPE_REASSOC_REQ)
nl_handle=0x14e33f70 match=
nl80211: Register frame type=0xa0 (WLAN_FC_STYPE_DISASSOC)
nl_handle=0x14e33f70 match=
nl80211: Register frame type=0xc0 (WLAN_FC_STYPE_DEAUTH)
nl_handle=0x14e33f70 match=
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION)
nl_handle=0x14e33f70 match=
nl80211: Register frame type=0x40 (WLAN_FC_STYPE_PROBE_REQ)
nl_handle=0x14e33f70 match=
nl80211: Add own interface ifindex 29
nl80211: if_indices[16]: 29
phy: phy1
BSS count 1, BSSID mask 00:00:00:00:00:00 (0 bits)
wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
cfg80211: Calling CRDA to update world regulatory domain
Previous country code 00, new country code US
Continue interface setup after channel list update
ctrl_iface not configured!
RTM_NEWLINK: ifi_index=29 ifname=wlan0 operstate=33554432 linkmode=0
ifi_family=0 ifi_flags=0x1002 ()
nl80211: Ignore interface down event since interface wlan0 is up
RTM_NEWLINK: ifi_index=29 ifname=wlan0 operstate=33554432 linkmode=0
ifi_family=0 ifi_flags=0x1003 ([UP])

Channel list update timeout - try to continue anyway
nl80211: Regulatory information - country=00
nl80211: 2402-2472 @ 40 MHz 20 mBm
nl80211: 2457-2482 @ 40 MHz 20 mBm (no IR)
nl80211: 2474-2494 @ 20 MHz 20 mBm (no OFDM) (no IR)
nl80211: 5170-5250 @ 160 MHz 20 mBm (no IR)
nl80211: 5250-5330 @ 160 MHz 20 mBm (DFS) (no IR)
nl80211: 5490-5730 @ 160 MHz 20 mBm (DFS) (no IR)
channel [0] (36) is disabled for use in AP mode, flags: 0x853 NO-IR
wlan0: IEEE 802.11 Configured channel (36) not found from the channel
list of current mode (2) IEEE 802.11a
wlan0: IEEE 802.11 Hardware does not support configured channel
Could not select hw_mode and channel. (-3)
wlan0: interface state COUNTRY_UPDATE->DISABLED
wlan0: AP-DISABLED
hostapd_interface_deinit_free(0x14e33540)
hostapd_interface_deinit_free: num_bss=1 conf->num_bss=1
hostapd_interface_deinit(0x14e33540)
wlan0: interface state DISABLED->DISABLED
hostapd_bss_deinit: deinit bss wlan0
wlan0: Deauthenticate all stations
nl80211: send_mlme - da= ff:ff:ff:ff:ff:ff noack=0 freq=0 no_cck=0
offchanok=0 wait_time=0 fc=0xc0 (WLAN_FC_STYPE_DEA3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=0
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=0 wait=0 no_cck=0 no_ack=0 offchanok=0
CMD_FRAME - hexdump(len=26): c0 00 00 00 ff ff ff ff ff ff 30 10 b3 f9
7f 45 30 10 b3 f9 7f 45 00 00 03 00
nl80211: Frame command failed: ret=-22 (Invalid argument) (freq=0 wait=0)
wlan0: AP-DISABLED
hostapd_cleanup(hapd=0x14e34780 (wlan0))
hostapd_free_hapd_data: Interface wlan0 wasn't started
hostapd_interface_deinit_free: driver=0x1014cec0 drv_priv=0x14e35660
-> hapd_deinit
nl80211: deinit ifname=wlan0 disabled_11b_rates=0
nl80211: Remove monitor interface: refcount=0
nl80211: Remove beacon (ifindex=29)
netlink: Operstate: ifindex=29 linkmode=0 (kernel-control),
operstate=6 (IF_OPER_UP)
nl80211: Set mode ifindex 29 iftype 2 (STATION)
nl80211: Failed to set interface 29 to mode 2: -16 (Device or resource busy)
nl80211: Try mode change after setting interface down
nl80211: Set mode ifindex 29 iftype 2 (STATION)
nl80211: Mode change succeeded while interface is down
IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
nl80211: Teardown AP(wlan0) - device_ap_sme=0 use_monitor=0
nl80211: Unsubscribe mgmt frames handle 0x888888889c6bb7f9 (AP teardown)
hostapd_interface_free(0x14e33540)
hostapd_interface_free: free hapd 0x14e34780
hostapd_cleanup_iface(0x14e33540)
hostapd_cleanup_iface_partial(0x14e33540)
hostapd_cleanup_iface: free iface=0x14e33540

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

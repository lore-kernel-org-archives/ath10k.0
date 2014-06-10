Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuUqy-0003VU-1X
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 22:49:16 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id A1E8440A9E6
 for <ath10k@lists.infradead.org>; Tue, 10 Jun 2014 15:48:51 -0700 (PDT)
Message-ID: <53978B53.8050501@candelatech.com>
Date: Tue, 10 Jun 2014 15:48:51 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: How to configure hostapd + ath10k for DFS channel?
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
To: ath10k <ath10k@lists.infradead.org>


I'm trying to put an AP on a DFS channel (52) in order to test
my CT firmware in station mode on DFS channels.

I have tried both CT and standard upstream 10.1.467-2.1 firmware on
the AP machine, with similar behaviour (hostapd will not start
because DFS cannot set channel, or something like that).

Kernel is 'ath', fairly recent, with a bunch of my own ath10k
patches applied (though they should mostly not be doing anything
different from upstream when running standard firmware).

Any idea what I am doing wrong?

Anyone have this working on some combination of kernel and firmware?


dmesg|grep ath10k
[   53.328946] ath10k: firmware 10.1.467.2-1 booted
[   53.337922] ath10k: wmi event firmware message 'P 145 V 16 T 443'
[   53.338611] ath10k: htt target version 2.1
[   53.338618] ath10k: start, state going from OFF to ON
[   53.338916] ath10k: Creating vdev id: 0  map: 65535
[   53.338920] ath10k: mac vdev create 0 (add interface) type 1 subtype 0
[   53.339580] ath10k: mac vdev 0 cts_prot 0
[   53.339588] ath10k: mac vdev 0 slot_time 1
[   53.339634] ath10k: mac vdev 0 preamble 1n
[   53.339865] ath10k: mac config channel 2412 mhz flags 0x1a0
[   53.339869] ath10k: mac radar config update: chan 2412MHz radar 0 chan radar 0 chan state USABLE
[   53.339872] ath10k: mac config power 30

## I wonder why this is using 2412Mhz above??


hostapd logs:

1402439819.655628: Configuration file: /home/lanforge/hostapd_vap1.conf
1402439819.655745: Line 8: DEPRECATED: 'dump_file' configuration variable is not used anymore
1402439819.655932: ctrl_interface_group=0
1402439819.656544: rfkill: initial event: idx=0 type=1 op=0 soft=0 hard=0
1402439819.656552: rfkill: initial event: idx=1 type=1 op=0 soft=0 hard=0
1402439819.656661: nl80211: Supported cipher 00-0f-ac:1
1402439819.656668: nl80211: Supported cipher 00-0f-ac:5
1402439819.656671: nl80211: Supported cipher 00-0f-ac:2
1402439819.656674: nl80211: Supported cipher 00-0f-ac:4
1402439819.656677: nl80211: Supported cipher 00-0f-ac:6
1402439819.656709: nl80211: Using driver-based off-channel TX
1402439819.656723: nl80211: interface vap1 in phy wiphy1
1402439820.105062: nl80211: Set mode ifindex 6 iftype 3 (AP)
1402439820.105092: nl80211: Setup AP(vap1) - device_ap_sme=0 use_monitor=0
1402439820.105117: nl80211: Subscribe to mgmt frames with AP handle 0xb98990
1402439820.105125: nl80211: Register frame type=0xb0 nl_handle=0xb98990 match=
1402439820.105139: nl80211: Register frame type=0x0 nl_handle=0xb98990 match=
1402439820.105149: nl80211: Register frame type=0x20 nl_handle=0xb98990 match=
1402439820.105159: nl80211: Register frame type=0xa0 nl_handle=0xb98990 match=
1402439820.105168: nl80211: Register frame type=0xc0 nl_handle=0xb98990 match=
1402439820.105178: nl80211: Register frame type=0xd0 nl_handle=0xb98990 match=
1402439820.105188: nl80211: Register frame type=0x40 nl_handle=0xb98990 match=
1402439821.358618: nl80211: Add own interface ifindex 6
1402439821.358631: nl80211: if_indices[16]: 6
1402439821.358646: phy: wiphy1
1402439821.358655: BSS count 1, BSSID mask 00:00:00:00:00:00 (0 bits)
1402439821.358669: Using existing control interface directory.
1402439821.358742: vap1: interface state UNINITIALIZED->COUNTRY_UPDATE
1402439821.358789: nl80211: set-country reg-domain alpha2: US

1402439821.358822: Previous country code US, new country code US
1402439821.359012: nl80211: Regulatory information - country=US
1402439821.359022: nl80211: 2402-2472 @ 40 MHz 30 mBm
1402439821.359033: nl80211: 5170-5250 @ 80 MHz 17 mBm
1402439821.359040: nl80211: 5250-5330 @ 80 MHz 23 mBm (DFS)
1402439821.359047: nl80211: 5735-5835 @ 80 MHz 30 mBm
1402439821.359054: nl80211: 57240-63720 @ 2160 MHz 40 mBm
1402439821.359074: nl80211: Added 802.11b mode based on 802.11g information
1402439821.359090: hw vht capab: 0x338001b2, conf vht capab: 0x300001b2
1402439821.359098: vap1: interface state COUNTRY_UPDATE->HT_SCAN
1402439821.359103: Scan for neighboring BSSes prior to enabling 40 MHz channel
1402439821.359109: 40 MHz affected channel range: [5250,5290] MHz
1402439821.359121: vap1: nl80211: scan request
1402439821.359286: Scan requested (ret=0) - scan timeout 10 seconds
1402439821.359323: Interface initialization will be completed in a callback
1402439821.359339: ctrl_iface not configured!
1402439821.359754: RTM_NEWLINK: ifi_index=6 ifname=vap1 operstate=2 linkmode=0 ifi_flags=0x1002 ()
1402439821.359787: nl80211: Ignore interface down event since interface vap1 is up
1402439821.359794: RTM_NEWLINK: ifi_index=6 ifname=vap1 operstate=2 linkmode=0 ifi_flags=0x1002 ()
1402439821.359803: nl80211: Ignore interface down event since interface vap1 is up
1402439821.359808: RTM_NEWLINK: ifi_index=6 ifname=vap1 operstate=2 linkmode=0 ifi_flags=0x1003 ([UP])
1402439821.359836: nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for vap1
1402439821.359843: vap1: nl80211: Scan trigger
1402439821.359853: vap1: Event SCAN_STARTED (49) received
1402439821.359857: Unknown event 49
1402439821.659615: nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for vap1
1402439821.659661: vap1: nl80211: New scan results available
1402439821.659677: nl80211: Scan included frequencies: 5260 5280
1402439821.659686: vap1: Event SCAN_RESULTS (3) received
1402439821.659768: nl80211: Received scan results (0 BSSes)
1402439821.659822: HT40: control channel: 52  secondary channel: 56
1402439821.659832: Completing interface initialization
1402439821.659838: Mode: IEEE 802.11a  Channel: 52  Frequency: 5260 MHz
1402439821.659861: DFS 3 channels required radar detection
1402439821.659866: DFS all channels available, (SKIP CAC): no
1402439821.659870: DFS 0 chans unavailable - choose other channel: no
1402439821.659876: vap1: interface state HT_SCAN->DFS
1402439821.659880: DFS start CAC on 5260 MHz
1402439821.659887: vap1: DFS-CAC-START freq=5260 chan=52 sec_chan=1, width=1, seg0=54, seg1=0, cac_time=0s
1402439821.659893: Can't set freq params
1402439821.659897: DFS start_dfs_cac() failed, -1
1402439821.659901: Interface initialization failed
1402439821.659905: vap1: interface state DFS->DISABLED
1402439821.659910: vap1: AP-DISABLED
1402439821.659918: hostapd_interface_deinit_free(0xb97e40)
1402439821.659923: hostapd_interface_deinit_free: num_bss=1 conf->num_bss=1
1402439821.659928: hostapd_interface_deinit(0xb97e40)
1402439821.659934: hostapd_bss_deinit: deinit bss vap1
1402439821.659943: vap1: Deauthenticate all stations
1402439821.659952: nl80211: send_mlme - noack=0 freq=0 no_cck=0 offchanok=0 wait_time=0 fc=0xc0 nlmode=3
1402439821.659961: nl80211: send_mlme -> send_frame
1402439821.659966: nl80211: send_frame - Use bss->freq=0
1402439821.659970: nl80211: send_frame -> send_frame_cmd
1402439821.660022: nl80211: Frame command failed: ret=-22 (Invalid argument) (freq=0 wait=0)
1402439821.660032: hostapd_cleanup(hapd=0xb9a550 (vap1))
1402439821.660083: Control interface directory not empty - leaving it behind
1402439821.660091: hostapd_free_hapd_data: Interface vap1 wasn't started
1402439821.660096: hostapd_interface_deinit_free: driver=0x507fe0 drv_priv=0xb9b2f0 -> hapd_deinit
1402439821.667778: nl80211: Remove monitor interface: refcount=0
1402439821.667810: nl80211: Remove beacon (ifindex=6)
1402439821.672864: netlink: Operstate: ifindex=6 linkmode=0 (kernel-control), operstate=6 (IF_OPER_UP)
1402439821.672914: nl80211: Unsubscribe mgmt frames handle 0x8888888888310119 (deinit)
1402439821.672985: hostapd_interface_free(0xb97e40)
1402439821.672999: hostapd_interface_free: free hapd 0xb9a550
1402439821.673006: hostapd_cleanup_iface(0xb97e40)
1402439821.673015: hostapd_cleanup_iface_partial(0xb97e40)
1402439821.673027: hostapd_cleanup_iface: free iface=0xb97e40



And, hostapd config file:


interface=vap1
driver=nl80211
logger_syslog=-1
logger_syslog_level=2
logger_stdout=-1
logger_stdout_level=2
dump_file=/home/lanforge/wifi/hostapd_vap1.dump
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0
ssid=ben-ath10k-wle900vx
bssid=04:f0:21:03:38:99
country_code=US
ieee80211d=1
ieee80211h=1
hw_mode=a
ieee80211n=1
ieee80211ac=1
beacon_int=100
dtim_period=2
max_num_sta=2007
rts_threshold=2347
fragm_threshold=2346
preamble=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
# Enable HT modes if you want 300Mbps+ throughput.
#ht_capab=[HT20][HT40-][HT40+][GF][SHORT-GI-20][SHORT-GI-40]
#         [TX-STBC][RX-STBC123][MAX-AMSDU-7935][DSSS_CCK-40][PSMP][LSIG-TXOP-PROT]
ht_capab=[HT20][HT40+][SHORT-GI-40][SHORT-GI-20]
vht_capab=[MAX-MPDU-11454][RXLDPC][TX-STBC-2BY1][RX-STBC-1][MAX-A-MPDU-LEN-EXP0][RX-ANTENNA-PATTERN][TX-ANTENNA-PATTERN][SHORT-GI-80]
wmm_enabled=1
wmm_ac_bk_cwmin=4
wmm_ac_bk_cwmax=10
wmm_ac_bk_aifs=7
wmm_ac_bk_txop_limit=0
wmm_ac_bk_acm=0
wmm_ac_be_aifs=3
wmm_ac_be_cwmin=4
wmm_ac_be_cwmax=10
wmm_ac_be_txop_limit=0
wmm_ac_be_acm=0
wmm_ac_vi_aifs=2
wmm_ac_vi_cwmin=3
wmm_ac_vi_cwmax=4
wmm_ac_vi_txop_limit=94
wmm_ac_vi_acm=0
wmm_ac_vo_aifs=2
wmm_ac_vo_cwmin=2
wmm_ac_vo_cwmax=3
wmm_ac_vo_txop_limit=47
wmm_ac_vo_acm=0
### TX queue parameters
tx_queue_data3_aifs=7
tx_queue_data3_cwmin=15
tx_queue_data3_cwmax=1023
tx_queue_data3_burst=0
tx_queue_data2_aifs=3
tx_queue_data2_cwmin=15
tx_queue_data2_cwmax=63
tx_queue_data2_burst=0
tx_queue_data1_aifs=1
tx_queue_data1_cwmin=7
tx_queue_data1_cwmax=15
tx_queue_data1_burst=3.0
tx_queue_data0_aifs=1
tx_queue_data0_cwmin=3
tx_queue_data0_cwmax=7
tx_queue_data0_burst=1.5
channel=52
vht_oper_centr_freq_seg0_idx=54
vht_oper_chwidth=1
ieee8021x=0
eapol_key_index_workaround=0
eap_server=0
own_ip_addr=127.0.0.1
wpa=2
wpa_pairwise=TKIP CCMP
wpa_passphrase=ath10k-passwd

# Error emulation settings.
ignore_probe_probability=0.000000
ignore_auth_probability=0.000000
ignore_assoc_probability=0.000000
ignore_reassoc_probability=0.000000
corrupt_gtk_rekey_mic_probability=0.000000

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

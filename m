Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.devolo.com ([89.1.14.71])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1azixa-0004ma-K1
 for ath10k@lists.infradead.org; Mon, 09 May 2016 11:02:59 +0000
Received: from localhost (localhost [127.0.0.1])
 by smtp.devolo.com (Postfix) with ESMTP id B689110029C
 for <ath10k@lists.infradead.org>; Mon,  9 May 2016 13:02:22 +0200 (CEST)
Received: from smtp.devolo.com ([127.0.0.1])
 by localhost (smtp.devolo.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsHdo+Zh6jcA for <ath10k@lists.infradead.org>;
 Mon,  9 May 2016 13:02:09 +0200 (CEST)
Received: from mail.devolo.de (vesta.devolo.intern [10.1.1.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.devolo.com (Postfix) with ESMTPS id C4B7C100107
 for <ath10k@lists.infradead.org>; Mon,  9 May 2016 13:02:08 +0200 (CEST)
From: Guenther Kelleter <Guenther.Kelleter@devolo.de>
Subject: ath10k+hostapd: dynamic VLAN issue
Date: Mon, 9 May 2016 11:02:07 +0000
Message-ID: <EF6DF72779EE294A8A2425E8DA3BC0CC5434F83C@Pallas.devolo.intern>
Content-Language: de-DE
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "'ath10k@lists.infradead.org'" <ath10k@lists.infradead.org>

Hi

With OpenWrt master branch (based on hostapd e15dcf6d1bc2725388555523effca7=
5b1ffab735, 2016-01-15) dynamic vlans are not working anymore. There seems =
to be an Issue introduced with hostapd commit 7cebc8e2100626dc6981a3f533010=
58452953b9b (at least the error messages I see were introduced with this co=
mmit).
On OpenWrt Chaos Calmer based on hostapd 2.4 dynamic VLANs are working prop=
erly.

But: Failure happens with ath10k driver.
Ath9k looks good regarding this issue: vlan_bridge is created and the tagge=
d wlan interface added to this bridge.
I'm not very familiar with hostapd/mac80211 and don't know how to debug thi=
s further or whether this is a bug in hostapd, mac80211 or ath10k...

Following is a debug log of the failure:  look for "set_key failed"


Configuration file: /var/run/hostapd-phy0.conf
[...]
wlan0: ACS-COMPLETED freq=3D5580 channel=3D116
Disable HT capability [DSSS_CCK-40] on 5 GHz band
hw vht capab: 0x338001b2, conf vht capab: 0x338000b2
wlan0: interface state ACS->HT_SCAN
Scan for neighboring BSSes prior to enabling 40 MHz channel
40 MHz affected channel range: [5570,5610] MHz
wlan0: nl80211: scan request
nl80211: Passive scan requested
nl80211: Scan frequency 5580 MHz
nl80211: Scan frequency 5600 MHz
Scan requested (ret=3D0) - scan timeout 30 seconds
Interface initialization will be completed in a callback
RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 wext ifi_family=3D0 ifi_flags=3D=
0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlan0
wlan0: nl80211: Scan trigger
wlan0: Event SCAN_STARTED (47) received
Unknown event 47
RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 wext ifi_family=3D0 ifi_flags=3D=
0x1003 ([UP])
nl80211: Event message available
nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlan0
wlan0: nl80211: New scan results available
nl80211: Scan included frequencies: 5580 5600
wlan0: Event SCAN_RESULTS (3) received
nl80211: Received scan results (21 BSSes)
HT40: control channel: 116=A0 secondary channel: 120
Completing interface initialization
Mode: IEEE 802.11a=A0 Channel: 116=A0 Frequency: 5580 MHz
DFS 4 channels required radar detection
DFS all channels available, (SKIP CAC): yes
nl80211: Set freq 5580 (ht_enabled=3D1, vht_enabled=3D1, bandwidth=3D80 MHz=
, cf1=3D5610 MHz, cf2=3D0 MHz)
=A0 * freq=3D5580
=A0 * vht_enabled=3D1
=A0 * ht_enabled=3D1
=A0 * bandwidth=3D80
=A0 * channel_width=3D3
=A0 * center_freq1=3D5610
=A0 * center_freq2=3D0
RATE[0] rate=3D60 flags=3D0x1
RATE[1] rate=3D90 flags=3D0x0
RATE[2] rate=3D120 flags=3D0x1
RATE[3] rate=3D180 flags=3D0x0
RATE[4] rate=3D240 flags=3D0x1
RATE[5] rate=3D360 flags=3D0x0
RATE[6] rate=3D480 flags=3D0x0
RATE[7] rate=3D540 flags=3D0x0
hostapd_setup_bss(hapd=3D0x77b002e0 (wlan0), first=3D1)
wlan0: Flushing old station entries
nl80211: flush -> DEL_STATION wlan0 (all)
wlan0: Deauthenticate all stations
nl80211: send_mlme - da=3D ff:ff:ff:ff:ff:ff noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xc0 (WLAN_FC_STYPE_DEAUTH) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D26): c0 00 00 00 ff ff ff ff ff ff f4 06 8d 38 59=
 75 f4 06 8d 38 59 75 00 00 02 00
nl80211: Frame command failed: ret=3D-16 (Resource busy) (freq=3D5580 wait=
=3D0)
wpa_driver_nl80211_set_key: ifindex=3D34 (wlan0) alg=3D0 addr=3D0 key_idx=
=3D0 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D34 (wlan0) alg=3D0 addr=3D0 key_idx=
=3D1 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D34 (wlan0) alg=3D0 addr=3D0 key_idx=
=3D2 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D34 (wlan0) alg=3D0 addr=3D0 key_idx=
=3D3 set_tx=3D0 seq_len=3D0 key_len=3D0
Using interface wlan0 with hwaddr f4:06:8d:38:59:75 and ssid "devolo-746"
Deriving WPA PSK based on passphrase
SSID - hexdump_ascii(len=3D10):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 devolo-746=A0=A0=A0=A0=A0 =

PSK (ASCII passphrase) - hexdump_ascii(len=3D8): [REMOVED]
PSK (from passphrase) - hexdump(len=3D32): [REMOVED]
GMK - hexdump(len=3D32): [REMOVED]
Key Counter - hexdump(len=3D32): [REMOVED]
WPA: Delay group state machine start until Beacon frames have been configur=
ed
VLAN: vlan_set_name_type(name_type=3D2)
nl80211: Set beacon (beacon_set=3D0)
nl80211: Beacon head - hexdump(len=3D61): 80 00 00 00 ff ff ff ff ff ff f4 =
06 8d 38 59 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 =
00 0a 64 65 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74
nl80211: Beacon tail - hexdump(len=3D156): 07 0a 44 45 20 24 08 14 64 0b 1b=
 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 02 0c=
 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00=
 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff=
 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02=
 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: ifindex=3D34
nl80211: beacon_int=3D100
nl80211: dtim_period=3D2
nl80211: ssid - hexdump_ascii(len=3D10):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 devolo-746=A0=A0=A0=A0 =A0
=A0 * beacon_int=3D100
nl80211: hidden SSID not in use
nl80211: privacy=3D1
nl80211: auth_algs=3D0x1
nl80211: wpa_version=3D0x2
nl80211: key_mgmt_suites=3D0x2
nl80211: pairwise_ciphers=3D0x10
nl80211: group_cipher=3D0x10
nl80211: SMPS mode - off
nl80211: beacon_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: proberesp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: assocresp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
WPA: Start group state machine to set initial keys
WPA: group state machine entering state GTK_INIT (VLAN-ID 0)
GTK - hexdump(len=3D16): [REMOVED]
WPA: group state machine entering state SETKEYSDONE (VLAN-ID 0)
wpa_driver_nl80211_set_key: ifindex=3D34 (wlan0) alg=3D3 addr=3D0x496be4 ke=
y_idx=3D1 set_tx=3D1 seq_len=3D0 key_len=3D16
nl80211: KEY_DATA - hexdump(len=3D16): [REMOVED]
=A0=A0 broadcast key
nl80211: Set wlan0 operstate 0->1 (UP)
netlink: Operstate: ifindex=3D34 linkmode=3D-1 (no change), operstate=3D6 (=
IF_OPER_UP)
hostapd_setup_bss(hapd=3D0x77bba010 (wlan0-1), first=3D0)
nl80211: Create interface iftype 3 (AP)
nl80211: Ignored event (cmd=3D7) for foreign interface (ifindex 58 wdev 0x0)
nl80211: New interface wlan0-1 created: ifindex=3D58
nl80211: Add own interface ifindex 58
nl80211: if_indices[16]: 5 34 58
nl80211: Adding interface wlan0-1 into bridge br-lan
nl80211: Setup AP(wlan0-1) - device_ap_sme=3D0 use_monitor=3D0
nl80211: Subscribe to mgmt frames with AP handle 0x87bc20
nl80211: Register frame type=3D0xb0 (WLAN_FC_STYPE_AUTH) nl_handle=3D0x87bc=
20 match=3D
nl80211: Register frame type=3D0x0 (WLAN_FC_STYPE_ASSOC_REQ) nl_handle=3D0x=
87bc20 match=3D
nl80211: Register frame type=3D0x20 (WLAN_FC_STYPE_REASSOC_REQ) nl_handle=
=3D0x87bc20 match=3D
nl80211: Register frame type=3D0xa0 (WLAN_FC_STYPE_DISASSOC) nl_handle=3D0x=
87bc20 match=3D
nl80211: Register frame type=3D0xc0 (WLAN_FC_STYPE_DEAUTH) nl_handle=3D0x87=
bc20 match=3D
nl80211: Register frame type=3D0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=3D0x87=
bc20 match=3D
nl80211: Register frame type=3D0x40 (WLAN_FC_STYPE_PROBE_REQ) nl_handle=3D0=
x87bc20 match=3D
nl80211: Add own interface ifindex 58
nl80211: ifindex 58 already in the list
wlan0: Flushing old station entries
nl80211: flush -> DEL_STATION wlan0-1 (all)
wlan0: Deauthenticate all stations
nl80211: send_mlme - da=3D ff:ff:ff:ff:ff:ff noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xc0 (WLAN_FC_STYPE_DEAUTH) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D26): c0 00 00 00 ff ff ff ff ff ff f6 06 8d 38 59=
 75 f6 06 8d 38 59 75 00 00 02 00
nl80211: Frame command failed: ret=3D-16 (Resource busy) (freq=3D5580 wait=
=3D0)
wpa_driver_nl80211_set_key: ifindex=3D58 (wlan0-1) alg=3D0 addr=3D0 key_idx=
=3D0 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D58 (wlan0-1) alg=3D0 addr=3D0 key_idx=
=3D1 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D58 (wlan0-1) alg=3D0 addr=3D0 key_idx=
=3D2 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D58 (wlan0-1) alg=3D0 addr=3D0 key_idx=
=3D3 set_tx=3D0 seq_len=3D0 key_len=3D0
Using interface wlan0-1 with hwaddr f6:06:8d:38:59:75 and ssid "devolo-746-=
20"
Deriving WPA PSK based on passphrase
SSID - hexdump_ascii(len=3D13):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36 2d 32 30=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 devolo-746-20=A0=A0 =

PSK (ASCII passphrase) - hexdump_ascii(len=3D16): [REMOVED]
PSK (from passphrase) - hexdump(len=3D32): [REMOVED]
GMK - hexdump(len=3D32): [REMOVED]
Key Counter - hexdump(len=3D32): [REMOVED]
WPA: Delay group state machine start until Beacon frames have been configur=
ed
VLAN: vlan_set_name_type(name_type=3D2)
nl80211: Set beacon (beacon_set=3D0)
nl80211: Beacon head - hexdump(len=3D64): 80 00 00 00 ff ff ff ff ff ff f6 =
06 8d 38 59 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 =
00 0d 64 65 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c =
03 01 74
nl80211: Beacon tail - hexdump(len=3D156): 07 0a 44 45 20 24 08 14 64 0b 1b=
 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 02 0c=
 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00=
 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff=
 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02=
 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: ifindex=3D58
nl80211: beacon_int=3D100
nl80211: dtim_period=3D2
nl80211: ssid - hexdump_ascii(len=3D13):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36 2d 32 30=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 devolo-746-20=A0=A0 =

=A0 * beacon_int=3D100
nl80211: hidden SSID not in use
nl80211: privacy=3D1
nl80211: auth_algs=3D0x1
nl80211: wpa_version=3D0x2
nl80211: key_mgmt_suites=3D0x2
nl80211: pairwise_ciphers=3D0x10
nl80211: group_cipher=3D0x10
nl80211: SMPS mode - off
nl80211: beacon_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: proberesp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: assocresp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
WPA: Start group state machine to set initial keys
WPA: group state machine entering state GTK_INIT (VLAN-ID 0)
GTK - hexdump(len=3D16): [REMOVED]
WPA: group state machine entering state SETKEYSDONE (VLAN-ID 0)
wpa_driver_nl80211_set_key: ifindex=3D58 (wlan0-1) alg=3D3 addr=3D0x496be4 =
key_idx=3D1 set_tx=3D1 seq_len=3D0 key_len=3D16
nl80211: KEY_DATA - hexdump(len=3D16): [REMOVED]
=A0=A0 broadcast key
nl80211: Set wlan0-1 operstate 1->1 (UP)
netlink: Operstate: ifindex=3D34 linkmode=3D-1 (no change), operstate=3D6 (=
IF_OPER_UP)
hostapd_setup_bss(hapd=3D0x77bba6d0 (wlan0-2), first=3D0)
nl80211: Create interface iftype 3 (AP)
nl80211: Ignored event (cmd=3D7) for foreign interface (ifindex 59 wdev 0x0)
nl80211: New interface wlan0-2 created: ifindex=3D59
nl80211: Add own interface ifindex 59
nl80211: if_indices[16]: 5 34 58 59
nl80211: Setup AP(wlan0-2) - device_ap_sme=3D0 use_monitor=3D0
nl80211: Subscribe to mgmt frames with AP handle 0x87bcf0
nl80211: Register frame type=3D0xb0 (WLAN_FC_STYPE_AUTH) nl_handle=3D0x87bc=
f0 match=3D
nl80211: Register frame type=3D0x0 (WLAN_FC_STYPE_ASSOC_REQ) nl_handle=3D0x=
87bcf0 match=3D
nl80211: Register frame type=3D0x20 (WLAN_FC_STYPE_REASSOC_REQ) nl_handle=
=3D0x87bcf0 match=3D
nl80211: Register frame type=3D0xa0 (WLAN_FC_STYPE_DISASSOC) nl_handle=3D0x=
87bcf0 match=3D
nl80211: Register frame type=3D0xc0 (WLAN_FC_STYPE_DEAUTH) nl_handle=3D0x87=
bcf0 match=3D
nl80211: Register frame type=3D0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=3D0x87=
bcf0 match=3D
nl80211: Register frame type=3D0x40 (WLAN_FC_STYPE_PROBE_REQ) nl_handle=3D0=
x87bcf0 match=3D
nl80211: Add own interface ifindex 59
nl80211: ifindex 59 already in the list
wlan0: Flushing old station entries
nl80211: flush -> DEL_STATION wlan0-2 (all)
wlan0: Deauthenticate all stations
nl80211: send_mlme - da=3D ff:ff:ff:ff:ff:ff noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xc0 (WLAN_FC_STYPE_DEAUTH) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D26): c0 00 00 00 ff ff ff ff ff ff f2 06 8d 38 59=
 75 f2 06 8d 38 59 75 00 00 02 00
nl80211: Frame command failed: ret=3D-16 (Resource busy) (freq=3D5580 wait=
=3D0)
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D0 addr=3D0 key_idx=
=3D0 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D0 addr=3D0 key_idx=
=3D1 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D0 addr=3D0 key_idx=
=3D2 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D0 addr=3D0 key_idx=
=3D3 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D0 addr=3D0 key_idx=
=3D4 set_tx=3D0 seq_len=3D0 key_len=3D0
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D0 addr=3D0 key_idx=
=3D5 set_tx=3D0 seq_len=3D0 key_len=3D0
Using interface wlan0-2 with hwaddr f2:06:8d:38:59:75 and ssid "devolo-746-=
r"
wlan0-2: RADIUS Authentication server 172.25.1.120:1812
RADIUS local address: 172.25.201.218:54851
GMK - hexdump(len=3D32): [REMOVED]
Key Counter - hexdump(len=3D32): [REMOVED]
WPA: Delay group state machine start until Beacon frames have been configur=
ed
VLAN: vlan_set_name_type(name_type=3D3)
nl80211: Set beacon (beacon_set=3D0)
nl80211: Beacon head - hexdump(len=3D63): 80 00 00 00 ff ff ff ff ff ff f2 =
06 8d 38 59 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 =
00 0c 64 65 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 =
01 74
nl80211: Beacon tail - hexdump(len=3D156): 07 0a 44 45 20 24 08 14 64 0b 1b=
 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 8c=
 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00=
 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff=
 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02=
 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: ifindex=3D59
nl80211: beacon_int=3D100
nl80211: dtim_period=3D2
nl80211: ssid - hexdump_ascii(len=3D12):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36 2d 72=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 devolo-746-r=A0=A0=A0 =

=A0 * beacon_int=3D100
nl80211: hidden SSID not in use
nl80211: privacy=3D1
nl80211: auth_algs=3D0x1
nl80211: wpa_version=3D0x2
nl80211: key_mgmt_suites=3D0x1
nl80211: pairwise_ciphers=3D0x10
nl80211: group_cipher=3D0x10
nl80211: SMPS mode - off
nl80211: beacon_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: proberesp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: assocresp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
WPA: Start group state machine to set initial keys
WPA: group state machine entering state GTK_INIT (VLAN-ID 0)
GTK - hexdump(len=3D16): [REMOVED]
IGTK - hexdump(len=3D16): [REMOVED]
WPA: group state machine entering state SETKEYSDONE (VLAN-ID 0)
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D3 addr=3D0x496be4 =
key_idx=3D1 set_tx=3D1 seq_len=3D0 key_len=3D16
nl80211: KEY_DATA - hexdump(len=3D16): [REMOVED]
=A0=A0 broadcast key
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D4 addr=3D0x496be4 =
key_idx=3D4 set_tx=3D1 seq_len=3D0 key_len=3D16
nl80211: KEY_DATA - hexdump(len=3D16): [REMOVED]
=A0=A0 broadcast key
nl80211: Set wlan0-2 operstate 1->1 (UP)
netlink: Operstate: ifindex=3D34 linkmode=3D-1 (no change), operstate=3D6 (=
IF_OPER_UP)
wlan0: interface state HT_SCAN->ENABLED
wlan0: AP-ENABLED =

wlan0: Setup of interface done.
RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 master=3D5 operstate=3D100663296=
 ifi_family=3D7 ifi_flags=3D0x11043 ([UP][RUNNING][LOWER_UP])
nl80211: Add ifindex 5 for bridge br-lan
nl80211: Add own interface ifindex 5
nl80211: ifindex 5 already in the list
RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 master=3D5 operstate=3D100663296=
 ifi_family=3D7 ifi_flags=3D0x11043 ([UP][RUNNING][LOWER_UP])
nl80211: Add ifindex 5 for bridge br-lan
nl80211: Add own interface ifindex 5
nl80211: ifindex 5 already in the list
RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 master=3D5 operstate=3D100663296=
 ifi_family=3D7 ifi_flags=3D0x11043 ([UP][RUNNING][LOWER_UP])
nl80211: Add ifindex 5 for bridge br-lan
nl80211: Add own interface ifindex 5
nl80211: ifindex 5 already in the list
RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 operstate=3D100663296 linkmode=
=3D0 master=3D5 ifi_family=3D0 ifi_flags=3D0x11043 ([UP][RUNNING][LOWER_UP])
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 operstate=3D33554432 linkmode=
=3D0 ifi_family=3D0 ifi_flags=3D0x1002 ()
nl80211: Ignore interface down event since interface wlan0-1 is up
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 operstate=3D33554432 linkmode=
=3D0 ifi_family=3D0 ifi_flags=3D0x1002 ()
nl80211: Ignore interface down event since interface wlan0-1 is up
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 operstate=3D33554432 linkmode=
=3D0 master=3D5 ifi_family=3D0 ifi_flags=3D0x1002 ()
nl80211: Ignore interface down event since interface wlan0-1 is up
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 operstate=3D33554432 linkmode=
=3D0 master=3D5 ifi_family=3D0 ifi_flags=3D0x1002 ()
nl80211: Ignore interface down event since interface wlan0-1 is up
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 master=3D5 operstate=3D3355443=
2 ifi_family=3D7 ifi_flags=3D0x1002 ()
nl80211: Ignore interface down event since interface wlan0-1 is up
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 operstate=3D0 linkmode=3D0 mas=
ter=3D5 ifi_family=3D0 ifi_flags=3D0x1043 ([UP][RUNNING])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
VLAN: RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-2)
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 master=3D5 operstate=3D0 ifi_f=
amily=3D7 ifi_flags=3D0x1043 ([UP][RUNNING])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
nl80211: Add ifindex 5 for bridge br-lan
nl80211: Add own interface ifindex 5
nl80211: ifindex 5 already in the list
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 master=3D5 operstate=3D0 ifi_f=
amily=3D7 ifi_flags=3D0x1043 ([UP][RUNNING])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
nl80211: Add ifindex 5 for bridge br-lan
nl80211: Add own interface ifindex 5
nl80211: ifindex 5 already in the list
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 master=3D5 operstate=3D0 ifi_f=
amily=3D7 ifi_flags=3D0x1043 ([UP][RUNNING])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
nl80211: Add ifindex 5 for bridge br-lan
nl80211: Add own interface ifindex 5
nl80211: ifindex 5 already in the list
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 master=3D5 operstate=3D1006632=
96 ifi_family=3D7 ifi_flags=3D0x11043 ([UP][RUNNING][LOWER_UP])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
nl80211: Add ifindex 5 for bridge br-lan
nl80211: Add own interface ifindex 5
nl80211: ifindex 5 already in the list
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 operstate=3D100663296 linkmode=
=3D0 master=3D5 ifi_family=3D0 ifi_flags=3D0x11043 ([UP][RUNNING][LOWER_UP])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 operstate=3D33554432 linkmode=
=3D0 ifi_family=3D0 ifi_flags=3D0x1002 ()
nl80211: Ignore interface down event since interface wlan0-2 is up
RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 operstate=3D33554432 linkmode=
=3D0 ifi_family=3D0 ifi_flags=3D0x1002 ()
nl80211: Ignore interface down event since interface wlan0-2 is up
RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 operstate=3D0 linkmode=3D0 ifi=
_family=3D0 ifi_flags=3D0x1043 ([UP][RUNNING])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 operstate=3D33554432 linkmode=
=3D0 ifi_family=3D0 ifi_flags=3D0x1003 ([UP])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 operstate=3D100663296 linkmode=
=3D0 ifi_family=3D0 ifi_flags=3D0x11043 ([UP][RUNNING][LOWER_UP])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
VLAN: RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D0 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2)
VLAN: RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 ifi_family=3D0 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D0 ifi_flags=
=3D0x1002 ()
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x1043 ([UP][RUNNING])
VLAN: vlan_newlink(wlan0-2)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D0 ifi_flags=
=3D0x1002 ()
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x1003 ([UP])
VLAN: vlan_newlink(wlan0-2)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D0 ifi_flags=
=3D0x1002 ()
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-2)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D0 ifi_flags=
=3D0x1002 ()
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D7 ifi_flags=
=3D0x1002 ()
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D0 ifi_flags=
=3D0x1043 ([UP][RUNNING])
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D7 ifi_flags=
=3D0x1043 ([UP][RUNNING])
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D7 ifi_flags=
=3D0x1043 ([UP][RUNNING])
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D7 ifi_flags=
=3D0x1043 ([UP][RUNNING])
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D0 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x1043 ([UP][RUNNING])
VLAN: vlan_newlink(wlan0-2)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x1003 ([UP])
VLAN: vlan_newlink(wlan0-2)
VLAN: RTM_NEWLINK: ifi_index=3D59 ifname=3Dwlan0-2 ifi_family=3D0 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-2)
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 78 7e 61 61 15 a3 ff ff ff ff ff ff 10 24 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-1 fc=3D0=
x40 seq_ctrl=3D0x2410 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D217): 50 00 00 00 78 7e 61 61 15 a3 f4 06 8d 38 5=
9 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0a 64 6=
5 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0a 44 4=
5 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 0=
4 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 0=
0 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 b=
f 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 3=
0 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 3=
2 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 78 7e 61 61 15 a3 ff ff ff ff ff ff 10 24 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-1 fc=3D0=
x40 seq_ctrl=3D0x2410 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D220): 50 00 00 00 78 7e 61 61 15 a3 f6 06 8d 38 5=
9 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0d 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 0=
7 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 0=
0 0f ac 04 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 0=
0 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 0=
0 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 0=
4 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5=
e 00 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 78 7e 61 61 15 a3 ff ff ff ff ff ff 10 24 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-1 fc=3D0=
x40 seq_ctrl=3D0x2410 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 master=3D5 operstate=3D100663296=
 ifi_family=3D7 ifi_flags=3D0x11043 ([UP][RUNNING][LOWER_UP])
nl80211: Add ifindex 5 for bridge br-lan
nl80211: Add own interface ifindex 5
nl80211: ifindex 5 already in the list
VLAN: RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0)
VLAN: RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0)
VLAN: RTM_NEWLINK: ifi_index=3D34 ifname=3Dwlan0 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0)
RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 master=3D5 operstate=3D1006632=
96 ifi_family=3D7 ifi_flags=3D0x11043 ([UP][RUNNING][LOWER_UP])
wlan0: Event INTERFACE_STATUS (5) received
Unknown event 5
nl80211: Add ifindex 5 for bridge br-lan
nl80211: Add own interface ifindex 5
nl80211: ifindex 5 already in the list
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-1)
VLAN: RTM_NEWLINK: ifi_index=3D58 ifname=3Dwlan0-1 ifi_family=3D7 ifi_flags=
=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-1)
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3De0:9d:31:46:e7:f8
nl80211: MLME event frame - hexdump(len=3D64): 40 00 00 00 ff ff ff ff ff f=
f e0 9d 31 46 e7 f8 ff ff ff ff ff ff 20 e1 00 00 01 08 0c 12 18 24 30 48 6=
0 6c 2d 1a 72 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00
nl80211: Frame event
nl80211: RX frame sa=3De0:9d:31:46:e7:f8 freq=3D5580 ssi_signal=3D-59 fc=3D=
0x40 seq_ctrl=3D0xe120 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D64
nl80211: send_mlme - da=3D e0:9d:31:46:e7:f8 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D217): 50 00 00 00 e0 9d 31 46 e7 f8 f4 06 8d 38 5=
9 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0a 64 6=
5 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0a 44 4=
5 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 0=
4 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 0=
0 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 b=
f 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 3=
0 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 3=
2 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3De0:9d:31:46:e7:f8
nl80211: MLME event frame - hexdump(len=3D64): 40 00 00 00 ff ff ff ff ff f=
f e0 9d 31 46 e7 f8 ff ff ff ff ff ff 20 e1 00 00 01 08 0c 12 18 24 30 48 6=
0 6c 2d 1a 72 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00
nl80211: Frame event
nl80211: RX frame sa=3De0:9d:31:46:e7:f8 freq=3D5580 ssi_signal=3D-59 fc=3D=
0x40 seq_ctrl=3D0xe120 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D64
nl80211: send_mlme - da=3D e0:9d:31:46:e7:f8 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D220): 50 00 00 00 e0 9d 31 46 e7 f8 f6 06 8d 38 5=
9 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0d 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 0=
7 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 0=
0 0f ac 04 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 0=
0 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 0=
0 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 0=
4 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5=
e 00 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3De0:9d:31:46:e7:f8
nl80211: MLME event frame - hexdump(len=3D64): 40 00 00 00 ff ff ff ff ff f=
f e0 9d 31 46 e7 f8 ff ff ff ff ff ff 20 e1 00 00 01 08 0c 12 18 24 30 48 6=
0 6c 2d 1a 72 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00
nl80211: Frame event
nl80211: RX frame sa=3De0:9d:31:46:e7:f8 freq=3D5580 ssi_signal=3D-59 fc=3D=
0x40 seq_ctrl=3D0xe120 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D64
nl80211: send_mlme - da=3D e0:9d:31:46:e7:f8 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 e0 9d 31 46 e7 f8 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3De0:9d:31:46:e7:f8
nl80211: MLME event frame - hexdump(len=3D64): 40 00 00 00 ff ff ff ff ff f=
f e0 9d 31 46 e7 f8 ff ff ff ff ff ff 30 e1 00 00 01 08 0c 12 18 24 30 48 6=
0 6c 2d 1a 72 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00
nl80211: Frame event
nl80211: RX frame sa=3De0:9d:31:46:e7:f8 freq=3D5580 ssi_signal=3D-58 fc=3D=
0x40 seq_ctrl=3D0xe130 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D64
nl80211: send_mlme - da=3D e0:9d:31:46:e7:f8 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D217): 50 00 00 00 e0 9d 31 46 e7 f8 f4 06 8d 38 5=
9 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0a 64 6=
5 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0a 44 4=
5 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 0=
4 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 0=
0 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 b=
f 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 3=
0 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 3=
2 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3De0:9d:31:46:e7:f8
nl80211: MLME event frame - hexdump(len=3D64): 40 00 00 00 ff ff ff ff ff f=
f e0 9d 31 46 e7 f8 ff ff ff ff ff ff 30 e1 00 00 01 08 0c 12 18 24 30 48 6=
0 6c 2d 1a 72 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00
nl80211: Frame event
nl80211: RX frame sa=3De0:9d:31:46:e7:f8 freq=3D5580 ssi_signal=3D-58 fc=3D=
0x40 seq_ctrl=3D0xe130 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D64
nl80211: send_mlme - da=3D e0:9d:31:46:e7:f8 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D220): 50 00 00 00 e0 9d 31 46 e7 f8 f6 06 8d 38 5=
9 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0d 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 0=
7 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 0=
0 0f ac 04 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 0=
0 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 0=
0 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 0=
4 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5=
e 00 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3De0:9d:31:46:e7:f8
nl80211: MLME event frame - hexdump(len=3D64): 40 00 00 00 ff ff ff ff ff f=
f e0 9d 31 46 e7 f8 ff ff ff ff ff ff 30 e1 00 00 01 08 0c 12 18 24 30 48 6=
0 6c 2d 1a 72 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00
nl80211: Frame event
nl80211: RX frame sa=3De0:9d:31:46:e7:f8 freq=3D5580 ssi_signal=3D-58 fc=3D=
0x40 seq_ctrl=3D0xe130 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D64
nl80211: send_mlme - da=3D e0:9d:31:46:e7:f8 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 e0 9d 31 46 e7 f8 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D70:ec:e4:91:f8:93
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 70 ec e4 91 f8 93 ff ff ff ff ff ff c0 69 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D70:ec:e4:91:f8:93 freq=3D5580 ssi_signal=3D-52 fc=3D=
0x40 seq_ctrl=3D0x69c0 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 70:ec:e4:91:f8:93 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D217): 50 00 00 00 70 ec e4 91 f8 93 f4 06 8d 38 5=
9 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0a 64 6=
5 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0a 44 4=
5 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 0=
4 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 0=
0 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 b=
f 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 3=
0 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 3=
2 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D70:ec:e4:91:f8:93
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 70 ec e4 91 f8 93 ff ff ff ff ff ff c0 69 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D70:ec:e4:91:f8:93 freq=3D5580 ssi_signal=3D-52 fc=3D=
0x40 seq_ctrl=3D0x69c0 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 70:ec:e4:91:f8:93 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D220): 50 00 00 00 70 ec e4 91 f8 93 f6 06 8d 38 5=
9 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0d 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 0=
7 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 0=
0 0f ac 04 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 0=
0 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 0=
0 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 0=
4 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5=
e 00 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D70:ec:e4:91:f8:93
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 70 ec e4 91 f8 93 ff ff ff ff ff ff c0 69 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D70:ec:e4:91:f8:93 freq=3D5580 ssi_signal=3D-52 fc=3D=
0x40 seq_ctrl=3D0x69c0 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 70:ec:e4:91:f8:93 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 70 ec e4 91 f8 93 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3Ddc:53:60:61:b1:ec
nl80211: MLME event frame - hexdump(len=3D78): 40 00 00 00 ff ff ff ff ff f=
f dc 53 60 61 b1 ec ff ff ff ff ff ff 90 42 00 00 01 08 8c 12 98 24 b0 48 6=
0 6c 2d 1a e7 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 bf 0c b1 71 80 03 fa ff 00 00 fa ff 00 00
nl80211: Frame event
nl80211: RX frame sa=3Ddc:53:60:61:b1:ec freq=3D5580 ssi_signal=3D-70 fc=3D=
0x40 seq_ctrl=3D0x4290 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D78
nl80211: send_mlme - da=3D dc:53:60:61:b1:ec noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D217): 50 00 00 00 dc 53 60 61 b1 ec f4 06 8d 38 5=
9 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0a 64 6=
5 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0a 44 4=
5 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 0=
4 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 0=
0 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 b=
f 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 3=
0 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 3=
2 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3Ddc:53:60:61:b1:ec
nl80211: MLME event frame - hexdump(len=3D78): 40 00 00 00 ff ff ff ff ff f=
f dc 53 60 61 b1 ec ff ff ff ff ff ff 90 42 00 00 01 08 8c 12 98 24 b0 48 6=
0 6c 2d 1a e7 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 bf 0c b1 71 80 03 fa ff 00 00 fa ff 00 00
nl80211: Frame event
nl80211: RX frame sa=3Ddc:53:60:61:b1:ec freq=3D5580 ssi_signal=3D-70 fc=3D=
0x40 seq_ctrl=3D0x4290 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D78
nl80211: send_mlme - da=3D dc:53:60:61:b1:ec noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D220): 50 00 00 00 dc 53 60 61 b1 ec f6 06 8d 38 5=
9 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0d 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 0=
7 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 0=
0 0f ac 04 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 0=
0 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 0=
0 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 0=
4 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5=
e 00 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3Ddc:53:60:61:b1:ec
nl80211: MLME event frame - hexdump(len=3D78): 40 00 00 00 ff ff ff ff ff f=
f dc 53 60 61 b1 ec ff ff ff ff ff ff 90 42 00 00 01 08 8c 12 98 24 b0 48 6=
0 6c 2d 1a e7 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 bf 0c b1 71 80 03 fa ff 00 00 fa ff 00 00
nl80211: Frame event
nl80211: RX frame sa=3Ddc:53:60:61:b1:ec freq=3D5580 ssi_signal=3D-70 fc=3D=
0x40 seq_ctrl=3D0x4290 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D78
nl80211: send_mlme - da=3D dc:53:60:61:b1:ec noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 dc 53 60 61 b1 ec f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 78 7e 61 61 15 a3 ff ff ff ff ff ff 00 29 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-20 fc=3D=
0x40 seq_ctrl=3D0x2900 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D217): 50 00 00 00 78 7e 61 61 15 a3 f4 06 8d 38 5=
9 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0a 64 6=
5 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0a 44 4=
5 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 0=
4 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 0=
0 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 b=
f 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 3=
0 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 3=
2 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 78 7e 61 61 15 a3 ff ff ff ff ff ff 00 29 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-20 fc=3D=
0x40 seq_ctrl=3D0x2900 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D220): 50 00 00 00 78 7e 61 61 15 a3 f6 06 8d 38 5=
9 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0d 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 0=
7 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 0=
0 0f ac 04 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 0=
0 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 0=
0 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 0=
4 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5=
e 00 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 78 7e 61 61 15 a3 ff ff ff ff ff ff 00 29 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-20 fc=3D=
0x40 seq_ctrl=3D0x2900 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D34:13:e8:40:3d:c8
nl80211: MLME event frame - hexdump(len=3D78): 40 00 00 00 ff ff ff ff ff f=
f 34 13 e8 40 3d c8 ff ff ff ff ff ff 60 5b 00 00 01 08 8c 12 98 24 b0 48 6=
0 6c 2d 1a e7 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 bf 0c b1 71 81 03 fa ff 00 00 fa ff 00 00
nl80211: Frame event
nl80211: RX frame sa=3D34:13:e8:40:3d:c8 freq=3D5580 ssi_signal=3D-52 fc=3D=
0x40 seq_ctrl=3D0x5b60 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D78
nl80211: send_mlme - da=3D 34:13:e8:40:3d:c8 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D217): 50 00 00 00 34 13 e8 40 3d c8 f4 06 8d 38 5=
9 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0a 64 6=
5 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0a 44 4=
5 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 0=
4 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 0=
0 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 b=
f 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 3=
0 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 3=
2 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D34:13:e8:40:3d:c8
nl80211: MLME event frame - hexdump(len=3D78): 40 00 00 00 ff ff ff ff ff f=
f 34 13 e8 40 3d c8 ff ff ff ff ff ff 60 5b 00 00 01 08 8c 12 98 24 b0 48 6=
0 6c 2d 1a e7 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 bf 0c b1 71 81 03 fa ff 00 00 fa ff 00 00
nl80211: Frame event
nl80211: RX frame sa=3D34:13:e8:40:3d:c8 freq=3D5580 ssi_signal=3D-52 fc=3D=
0x40 seq_ctrl=3D0x5b60 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D78
nl80211: send_mlme - da=3D 34:13:e8:40:3d:c8 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D220): 50 00 00 00 34 13 e8 40 3d c8 f6 06 8d 38 5=
9 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0d 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 0=
7 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 0=
0 0f ac 04 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 0=
0 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 0=
0 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 0=
4 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5=
e 00 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D34:13:e8:40:3d:c8
nl80211: MLME event frame - hexdump(len=3D78): 40 00 00 00 ff ff ff ff ff f=
f 34 13 e8 40 3d c8 ff ff ff ff ff ff 60 5b 00 00 01 08 8c 12 98 24 b0 48 6=
0 6c 2d 1a e7 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 bf 0c b1 71 81 03 fa ff 00 00 fa ff 00 00
nl80211: Frame event
nl80211: RX frame sa=3D34:13:e8:40:3d:c8 freq=3D5580 ssi_signal=3D-52 fc=3D=
0x40 seq_ctrl=3D0x5b60 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D78
nl80211: send_mlme - da=3D 34:13:e8:40:3d:c8 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 34 13 e8 40 3d c8 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D34:13:e8:40:3d:c8
nl80211: MLME event frame - hexdump(len=3D84): 40 00 00 00 ff ff ff ff ff f=
f 34 13 e8 40 3d c8 ff ff ff ff ff ff 70 5b 00 06 57 61 6c 6c 65 72 01 08 8=
c 12 98 24 b0 48 60 6c 2d 1a e7 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 bf 0c b1 71 81 03 fa ff 00 00 fa ff 00 00
nl80211: Frame event
nl80211: RX frame sa=3D34:13:e8:40:3d:c8 freq=3D5580 ssi_signal=3D-51 fc=3D=
0x40 seq_ctrl=3D0x5b70 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D84
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D34:13:e8:40:3d:c8
nl80211: MLME event frame - hexdump(len=3D84): 40 00 00 00 ff ff ff ff ff f=
f 34 13 e8 40 3d c8 ff ff ff ff ff ff 70 5b 00 06 57 61 6c 6c 65 72 01 08 8=
c 12 98 24 b0 48 60 6c 2d 1a e7 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 bf 0c b1 71 81 03 fa ff 00 00 fa ff 00 00
nl80211: Frame event
nl80211: RX frame sa=3D34:13:e8:40:3d:c8 freq=3D5580 ssi_signal=3D-51 fc=3D=
0x40 seq_ctrl=3D0x5b70 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D84
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D34:13:e8:40:3d:c8
nl80211: MLME event frame - hexdump(len=3D84): 40 00 00 00 ff ff ff ff ff f=
f 34 13 e8 40 3d c8 ff ff ff ff ff ff 70 5b 00 06 57 61 6c 6c 65 72 01 08 8=
c 12 98 24 b0 48 60 6c 2d 1a e7 09 17 ff ff 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 bf 0c b1 71 81 03 fa ff 00 00 fa ff 00 00
nl80211: Frame event
nl80211: RX frame sa=3D34:13:e8:40:3d:c8 freq=3D5580 ssi_signal=3D-51 fc=3D=
0x40 seq_ctrl=3D0x5b70 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D84
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3Dec:88:92:6f:78:dd
nl80211: MLME event frame - hexdump(len=3D246): 40 00 00 00 ff ff ff ff ff =
ff ec 88 92 6f 78 dd ff ff ff ff ff ff e0 95 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 6f 00 17 ff ff 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 06 00 00 08 80 01 40 bf 0c 32 58 81 0f fa ff 00 00 fa ff =
00 00 dd 80 00 50 f2 04 10 4a 00 01 10 10 3a 00 01 00 10 08 00 02 42 88 10 =
47 00 10 09 31 e9 ba 3d 13 55 f0 84 48 bc 15 2a a5 fb 3a 10 54 00 08 00 0a =
00 50 f2 04 00 05 10 3c 00 01 03 10 02 00 02 00 00 10 09 00 02 00 00 10 12 =
00 02 00 00 10 21 00 08 6d 6f 74 6f 72 6f 6c 61 10 23 00 07 4e 65 78 75 73 =
20 36 10 24 00 07 4e 65 78 75 73 20 36 10 11 00 05 73 68 61 6d 75 10 49 00 =
06 00 37 2a 00 01 20 dd 11 50 6f 9a 09 02 02 00 25 00 06 05 00 44 45 04 51 =
01 dd 09 00 10 18 02 00 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3Dec:88:92:6f:78:dd freq=3D5580 ssi_signal=3D-57 fc=3D=
0x40 seq_ctrl=3D0x95e0 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D246
nl80211: send_mlme - da=3D ec:88:92:6f:78:dd noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D217): 50 00 00 00 ec 88 92 6f 78 dd f4 06 8d 38 5=
9 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0a 64 6=
5 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0a 44 4=
5 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 0=
4 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 0=
0 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 b=
f 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 3=
0 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 3=
2 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3Dec:88:92:6f:78:dd
nl80211: MLME event frame - hexdump(len=3D246): 40 00 00 00 ff ff ff ff ff =
ff ec 88 92 6f 78 dd ff ff ff ff ff ff e0 95 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 6f 00 17 ff ff 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 06 00 00 08 80 01 40 bf 0c 32 58 81 0f fa ff 00 00 fa ff =
00 00 dd 80 00 50 f2 04 10 4a 00 01 10 10 3a 00 01 00 10 08 00 02 42 88 10 =
47 00 10 09 31 e9 ba 3d 13 55 f0 84 48 bc 15 2a a5 fb 3a 10 54 00 08 00 0a =
00 50 f2 04 00 05 10 3c 00 01 03 10 02 00 02 00 00 10 09 00 02 00 00 10 12 =
00 02 00 00 10 21 00 08 6d 6f 74 6f 72 6f 6c 61 10 23 00 07 4e 65 78 75 73 =
20 36 10 24 00 07 4e 65 78 75 73 20 36 10 11 00 05 73 68 61 6d 75 10 49 00 =
06 00 37 2a 00 01 20 dd 11 50 6f 9a 09 02 02 00 25 00 06 05 00 44 45 04 51 =
01 dd 09 00 10 18 02 00 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3Dec:88:92:6f:78:dd freq=3D5580 ssi_signal=3D-57 fc=3D=
0x40 seq_ctrl=3D0x95e0 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D246
nl80211: send_mlme - da=3D ec:88:92:6f:78:dd noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D220): 50 00 00 00 ec 88 92 6f 78 dd f6 06 8d 38 5=
9 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0d 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 0=
7 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 0=
0 0f ac 04 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 0=
0 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 0=
0 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 0=
4 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5=
e 00 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3Dec:88:92:6f:78:dd
nl80211: MLME event frame - hexdump(len=3D246): 40 00 00 00 ff ff ff ff ff =
ff ec 88 92 6f 78 dd ff ff ff ff ff ff e0 95 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 6f 00 17 ff ff 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 06 00 00 08 80 01 40 bf 0c 32 58 81 0f fa ff 00 00 fa ff =
00 00 dd 80 00 50 f2 04 10 4a 00 01 10 10 3a 00 01 00 10 08 00 02 42 88 10 =
47 00 10 09 31 e9 ba 3d 13 55 f0 84 48 bc 15 2a a5 fb 3a 10 54 00 08 00 0a =
00 50 f2 04 00 05 10 3c 00 01 03 10 02 00 02 00 00 10 09 00 02 00 00 10 12 =
00 02 00 00 10 21 00 08 6d 6f 74 6f 72 6f 6c 61 10 23 00 07 4e 65 78 75 73 =
20 36 10 24 00 07 4e 65 78 75 73 20 36 10 11 00 05 73 68 61 6d 75 10 49 00 =
06 00 37 2a 00 01 20 dd 11 50 6f 9a 09 02 02 00 25 00 06 05 00 44 45 04 51 =
01 dd 09 00 10 18 02 00 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3Dec:88:92:6f:78:dd freq=3D5580 ssi_signal=3D-57 fc=3D=
0x40 seq_ctrl=3D0x95e0 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D246
nl80211: send_mlme - da=3D ec:88:92:6f:78:dd noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 ec 88 92 6f 78 dd f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3De8:50:8b:a2:4e:50
nl80211: MLME event frame - hexdump(len=3D138): 40 00 00 00 ff ff ff ff ff =
ff e8 50 8b a2 4e 50 ff ff ff ff ff ff 10 f7 00 0c 64 65 76 6f 6c 6f 5f 67 =
75 65 73 74 01 08 0c 12 18 24 30 48 60 6c 2d 1a 6f 00 17 ff ff 00 00 01 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 00 00 08 80 01 40 =
00 40 6b 01 0f bf 0c 32 58 81 0f fa ff 00 00 fa ff 00 00 dd 05 50 6f 9a 10 =
10 dd 05 00 90 4c 04 07 dd 08 00 50 f2 08 00 12 00 4e dd 09 00 10 18 02 00 =
00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3De8:50:8b:a2:4e:50 freq=3D5580 ssi_signal=3D-63 fc=3D=
0x40 seq_ctrl=3D0xf710 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D138
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3De8:50:8b:a2:4e:50
nl80211: MLME event frame - hexdump(len=3D138): 40 00 00 00 ff ff ff ff ff =
ff e8 50 8b a2 4e 50 ff ff ff ff ff ff 10 f7 00 0c 64 65 76 6f 6c 6f 5f 67 =
75 65 73 74 01 08 0c 12 18 24 30 48 60 6c 2d 1a 6f 00 17 ff ff 00 00 01 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 00 00 08 80 01 40 =
00 40 6b 01 0f bf 0c 32 58 81 0f fa ff 00 00 fa ff 00 00 dd 05 50 6f 9a 10 =
10 dd 05 00 90 4c 04 07 dd 08 00 50 f2 08 00 12 00 4e dd 09 00 10 18 02 00 =
00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3De8:50:8b:a2:4e:50 freq=3D5580 ssi_signal=3D-63 fc=3D=
0x40 seq_ctrl=3D0xf710 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D138
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3De8:50:8b:a2:4e:50
nl80211: MLME event frame - hexdump(len=3D138): 40 00 00 00 ff ff ff ff ff =
ff e8 50 8b a2 4e 50 ff ff ff ff ff ff 10 f7 00 0c 64 65 76 6f 6c 6f 5f 67 =
75 65 73 74 01 08 0c 12 18 24 30 48 60 6c 2d 1a 6f 00 17 ff ff 00 00 01 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 00 00 08 80 01 40 =
00 40 6b 01 0f bf 0c 32 58 81 0f fa ff 00 00 fa ff 00 00 dd 05 50 6f 9a 10 =
10 dd 05 00 90 4c 04 07 dd 08 00 50 f2 08 00 12 00 4e dd 09 00 10 18 02 00 =
00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3De8:50:8b:a2:4e:50 freq=3D5580 ssi_signal=3D-63 fc=3D=
0x40 seq_ctrl=3D0xf710 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D138
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: wlan0: Ignore MLME frame event for foreign address
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: wlan0-1: Ignore MLME frame event for foreign address
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D130): 40 00 3c 00 f2 06 8d 38 59 =
75 78 7e 61 61 15 a3 ff ff ff ff ff ff 40 2a 00 0c 64 65 76 6f 6c 6f 2d 37 =
34 36 2d 72 01 08 0c 12 18 24 30 48 60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 08 84 00 00 =
00 40 6b 07 0f ff ff ff ff ff ff bf 0c 32 50 80 0f fe ff 00 00 fe ff 00 00 =
dd 08 00 50 f2 08 00 0d 00 00 dd 09 00 10 18 02 00 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-5 fc=3D0=
x40 seq_ctrl=3D0x2a40 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D130
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted; cookie 0xac
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D219): 50 00 00 00 78 7e 61 61 15 =
a3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 =
31 01 00 0c 64 65 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 =
6c 03 01 74 07 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f =
ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b =
ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 =
74 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 =
00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a =
00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 =
00 00 42 43 5e 00 62 32 2f 00
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D51): b0 00 3c 00 f2 06 8d 38 59 7=
5 78 7e 61 61 15 a3 f2 06 8d 38 59 75 50 2a 00 00 01 00 00 00 7f 08 04 00 0=
0 00 00 00 00 40 dd 09 00 10 18 02 00 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-20 fc=3D=
0xb0 seq_ctrl=3D0x2a50 stype=3D11 (WLAN_FC_STYPE_AUTH) len=3D51
wlan0: Event RX_MGMT (19) received
mgmt::auth
authentication: STA=3D78:7e:61:61:15:a3 auth_alg=3D0 auth_transaction=3D1 s=
tatus_code=3D0 wep=3D0 seq_ctrl=3D0x2a50
=A0 New STA
ap_sta_add: register ap_handle_timer timeout for 78:7e:61:61:15:a3 (300 sec=
onds - ap_max_inactivity)
authentication reply: STA=3D78:7e:61:61:15:a3 auth_alg=3D0 auth_transaction=
=3D2 resp=3D0 (IE len=3D0)
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xb0 (WLAN_FC_STYPE_AUTH) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D30): b0 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 59=
 75 f2 06 8d 38 59 75 00 00 00 00 02 00 00 00
nl80211: Frame TX command accepted; cookie 0xad
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D30): b0 00 00 00 78 7e 61 61 15 a=
3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 00 00 02 00 00 00
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
mgmt::auth cb
wlan0-2: STA 78:7e:61:61:15:a3 IEEE 802.11: authenticated
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D158): 00 00 3c 00 f2 06 8d 38 59 =
75 78 7e 61 61 15 a3 f2 06 8d 38 59 75 60 2a 11 01 14 00 00 0c 64 65 76 6f =
6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 21 02 02 e0 24 06 24 =
04 34 04 64 0b 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 =
8c 00 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c 32 50 80 0f fe ff 00 00 =
fe ff 00 00 dd 09 00 10 18 02 00 00 10 00 00 dd 07 00 50 f2 02 00 01 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-3 fc=3D0=
x0 seq_ctrl=3D0x2a60 stype=3D0 (WLAN_FC_STYPE_ASSOC_REQ) len=3D158
wlan0: Event RX_MGMT (19) received
mgmt::assoc_req
association request: STA=3D78:7e:61:61:15:a3 capab_info=3D0x111 listen_inte=
rval=3D20 seq_ctrl=3D0x2a60
WMM IE - hexdump(len=3D7): 00 50 f2 02 00 01 00
Validating WMM IE: OUI 00:50:f2=A0 OUI type 2=A0 OUI sub-type 0=A0 version =
1=A0 QoS info 0x0
=A0 new AID 1
HT: STA 78:7e:61:61:15:a3 HT Capabilities Info: 0x0063
update_sta_ht STA 78:7e:61:61:15:a3 - no greenfield, num of non-gf stations=
 1
hostapd_ht_operation_update current operation mode=3D0x0
hostapd_ht_operation_update new operation mode=3D0x4 changes=3D1
nl80211: Set beacon (beacon_set=3D1)
nl80211: Beacon head - hexdump(len=3D61): 80 00 00 00 ff ff ff ff ff ff f4 =
06 8d 38 59 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 11 01 =
00 0a 64 65 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74
nl80211: Beacon tail - hexdump(len=3D156): 07 0a 44 45 20 24 08 14 64 0b 1b=
 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 02 0c=
 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00=
 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff=
 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02=
 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: ifindex=3D34
nl80211: beacon_int=3D100
nl80211: dtim_period=3D2
nl80211: ssid - hexdump_ascii(len=3D10):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 devolo-746=A0=A0=A0=A0=A0 =

=A0 * beacon_int=3D100
nl80211: hidden SSID not in use
nl80211: privacy=3D1
nl80211: auth_algs=3D0x1
nl80211: wpa_version=3D0x2
nl80211: key_mgmt_suites=3D0x2
nl80211: pairwise_ciphers=3D0x10
nl80211: group_cipher=3D0x10
nl80211: SMPS mode - off
nl80211: beacon_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: proberesp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: assocresp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: Set beacon (beacon_set=3D1)
nl80211: Beacon head - hexdump(len=3D64): 80 00 00 00 ff ff ff ff ff ff f6 =
06 8d 38 59 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 11 01 =
00 0d 64 65 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c =
03 01 74
nl80211: Beacon tail - hexdump(len=3D156): 07 0a 44 45 20 24 08 14 64 0b 1b=
 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 02 0c=
 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00=
 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff=
 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02=
 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: ifindex=3D58
nl80211: beacon_int=3D100
nl80211: dtim_period=3D2
nl80211: ssid - hexdump_ascii(len=3D13):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36 2d 32 30=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 devolo-746-20=A0=A0 =

=A0 * beacon_int=3D100
nl80211: hidden SSID not in use
nl80211: privacy=3D1
nl80211: auth_algs=3D0x1
nl80211: wpa_version=3D0x2
nl80211: key_mgmt_suites=3D0x2
nl80211: pairwise_ciphers=3D0x10
nl80211: group_cipher=3D0x10
nl80211: SMPS mode - off
nl80211: beacon_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: proberesp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: assocresp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: Set beacon (beacon_set=3D1)
nl80211: Beacon head - hexdump(len=3D63): 80 00 00 00 ff ff ff ff ff ff f2 =
06 8d 38 59 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 11 01 =
00 0c 64 65 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 =
01 74
nl80211: Beacon tail - hexdump(len=3D156): 07 0a 44 45 20 24 08 14 64 0b 1b=
 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 8c=
 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00=
 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff=
 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02=
 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: ifindex=3D59
nl80211: beacon_int=3D100
nl80211: dtim_period=3D2
nl80211: ssid - hexdump_ascii(len=3D12):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36 2d 72=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 devolo-746-r=A0=A0=A0 =

=A0 * beacon_int=3D100
nl80211: hidden SSID not in use
nl80211: privacy=3D1
nl80211: auth_algs=3D0x1
nl80211: wpa_version=3D0x2
nl80211: key_mgmt_suites=3D0x1
nl80211: pairwise_ciphers=3D0x10
nl80211: group_cipher=3D0x10
nl80211: SMPS mode - off
nl80211: beacon_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: proberesp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: assocresp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x10 (WLAN_FC_STYPE_ASSOC_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D149): 10 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 11 01 00 00 01 c0 01 08 8c 12 98 24 b0 48 60 6=
c 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 0=
0 00 00 00 3d 16 74 05 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff 7f 0=
8 04 00 00 00 00 00 00 40 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 0=
0 00 42 43 5e 00 62 32 2f 00
nl80211: Frame TX command accepted; cookie 0xae
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D149): 10 00 00 00 78 7e 61 61 15 =
a3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 11 01 00 00 01 c0 01 08 8c 12 =
98 24 b0 48 60 6c 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 =
00 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 =
7a 00 fc ff 7f 08 04 00 00 00 00 00 00 40 dd 18 00 50 f2 02 01 01 80 00 03 =
a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
mgmt::assoc_resp cb
wlan0-2: STA 78:7e:61:61:15:a3 IEEE 802.11: associated (aid 1)
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D0 addr=3D0x87ceb8 =
key_idx=3D0 set_tx=3D1 seq_len=3D0 key_len=3D0
=A0=A0 addr=3D78:7e:61:61:15:a3
nl80211: sta_remove -> DEL_STATION wlan0-2 78:7e:61:61:15:a3 --> -2 (No suc=
h file or directory)
nl80211: Add STA 78:7e:61:61:15:a3
=A0 * supported rates - hexdump(len=3D8): 8c 12 98 24 b0 48 60 6c
=A0 * capability=3D0x111
=A0 * ht_capabilities - hexdump(len=3D26): 63 00 17 ff 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
=A0 * vht_capabilities - hexdump(len=3D12): 32 00 80 0f fe ff 00 00 fe ff 0=
0 00
=A0 * aid=3D1
=A0 * listen_interval=3D20
=A0 * flags set=3D0x18 mask=3D0x18
=A0 * qosinfo=3D0x0
nl80211: wlan0-2[59]: set_sta_vlan(78:7e:61:61:15:a3, ifname=3Dwlan0-2[59],=
 vlan_id=3D0)
nl80211: Set STA flags - ifname=3Dwlan0-2 addr=3D78:7e:61:61:15:a3 total_fl=
ags=3D0xa flags_or=3D0xa flags_and=3D0xfffffffb authorized=3D0
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D0 addr=3D0x87ceb8 =
key_idx=3D0 set_tx=3D1 seq_len=3D0 key_len=3D0
=A0=A0 addr=3D78:7e:61:61:15:a3
EAP: Server state machine created
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state IDLE
IEEE 802.1X: 78:7e:61:61:15:a3 CTRL_DIR entering state FORCE_BOTH
WPA: 78:7e:61:61:15:a3 WPA_PTK entering state INITIALIZE
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D0 addr=3D0x87ceb8 =
key_idx=3D0 set_tx=3D1 seq_len=3D0 key_len=3D0
=A0=A0 addr=3D78:7e:61:61:15:a3
WPA: 78:7e:61:61:15:a3 WPA_PTK_GROUP entering state IDLE
WPA: 78:7e:61:61:15:a3 WPA_PTK entering state AUTHENTICATION
WPA: 78:7e:61:61:15:a3 WPA_PTK entering state AUTHENTICATION2
WPA: Re-initialize GMK/Counter on first station
GMK - hexdump(len=3D32): [REMOVED]
Key Counter - hexdump(len=3D32): [REMOVED]
GTK - hexdump(len=3D16): [REMOVED]
IGTK - hexdump(len=3D16): [REMOVED]
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D3 addr=3D0x496be4 =
key_idx=3D1 set_tx=3D1 seq_len=3D0 key_len=3D16
nl80211: KEY_DATA - hexdump(len=3D16): [REMOVED]
=A0=A0 broadcast key
wpa_driver_nl80211_set_key: ifindex=3D59 (wlan0-2) alg=3D4 addr=3D0x496be4 =
key_idx=3D4 set_tx=3D1 seq_len=3D0 key_len=3D16
nl80211: KEY_DATA - hexdump(len=3D16): [REMOVED]
=A0=A0 broadcast key
WPA: Assign ANonce - hexdump(len=3D32): 44 62 dc f1 f5 bb 58 28 d0 b6 f7 b3=
 50 08 85 84 c3 0d 92 5f 91 10 6d c1 d5 92 46 df 1b 00 00 d6
wlan0-2: hostapd_new_assoc_sta: reschedule ap_handle_timer timeout for 78:7=
e:61:61:15:a3 (300 seconds - ap_max_inactivity)
IEEE 802.1X: 78:7e:61:61:15:a3 AUTH_PAE entering state DISCONNECTED
nl80211: Set STA flags - ifname=3Dwlan0-2 addr=3D78:7e:61:61:15:a3 total_fl=
ags=3D0xa flags_or=3D0x0 flags_and=3D0xfffffffe authorized=3D0
IEEE 802.1X: 78:7e:61:61:15:a3 AUTH_PAE entering state RESTART
EAP: EAP entering state INITIALIZE
wlan0: CTRL-EVENT-EAP-STARTED 78:7e:61:61:15:a3
EAP: EAP entering state SELECT_ACTION
EAP: getDecision: no identity known yet -> CONTINUE
EAP: EAP entering state PROPOSE_METHOD
EAP: getNextMethod: vendor 0 type 1
wlan0: CTRL-EVENT-EAP-PROPOSED-METHOD vendor=3D0 method=3D1
EAP: EAP entering state METHOD_REQUEST
EAP: building EAP-Request: Identifier 1
EAP: EAP entering state SEND_REQUEST
EAP: EAP entering state IDLE
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 AUTH_PAE entering state CONNECTING
IEEE 802.1X: 78:7e:61:61:15:a3 AUTH_PAE entering state AUTHENTICATING
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
nl80211: Event message available
nl80211: Drv Event 19 (NL80211_CMD_NEW_STATION) received for wlan0-2
nl80211: New station 78:7e:61:61:15:a3
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D5 =
- ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 15 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D11
EAP: code=3D2 identifier=3D1 length=3D11
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D1 respMethod=3D1 resp=
Vendor=3D0 respVendorMethod=3D0
EAP: EAP entering state INTEGRITY_CHECK
EAP: EAP entering state METHOD_RESPONSE
EAP-Identity: Peer identity - hexdump_ascii(len=3D6):
=A0=A0=A0=A0 76 6c 61 6e 32 30=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vlan20=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 =

EAP: EAP entering state SELECT_ACTION
EAP: getDecision: -> PASSTHROUGH
EAP: EAP entering state INITIALIZE_PASSTHROUGH
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
RADIUS message: code=3D1 (Access-Request) identifier=3D0 length=3D195
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D13
=A0=A0=A0=A0=A0 Value: 0201000b01766c616e3230
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 46bd3adb04e0ec8c3d2273df9520a93a
RADIUS message: code=3D11 (Access-Challenge) identifier=3D0 length=3D96
=A0=A0 Attribute 64 (Tunnel-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 0000000d
=A0=A0 Attribute 65 (Tunnel-Medium-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 00000006
=A0=A0 Attribute 81 (Tunnel-Private-Group-Id) length=3D4
=A0=A0=A0=A0=A0 Value: 3230
=A0=A0 Attribute 79 (EAP-Message) length=3D24
=A0=A0=A0=A0=A0 Value: 010200160410e7b5179e834b4b83aba781af3920a71f
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 83e54d5f46a6d9d5f62840021510f9a3
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def6fa6412bb494401b1f8c908
RADIUS packet matching with station 78:7e:61:61:15:a3
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D2
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D22=
 - ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 12 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D8
EAP: code=3D2 identifier=3D2 length=3D8
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED2
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D2 respMethod=3D3 resp=
Vendor=3D0 respVendorMethod=3D0
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
Copied RADIUS State Attribute
RADIUS message: code=3D1 (Access-Request) identifier=3D1 length=3D210
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0 =A0=A0=A0=A0Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D10
=A0=A0=A0=A0=A0 Value: 020200080319152b
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def6fa6412bb494401b1f8c908
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 6a65e20c188250eab20c36e127a410a7
RADIUS message: code=3D11 (Access-Challenge) identifier=3D1 length=3D80
=A0=A0 Attribute 64 (Tunnel-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 0000000d
=A0=A0 Attribute 65 (Tunnel-Medium-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 00000006
=A0=A0 Attribute 81 (Tunnel-Private-Group-Id) length=3D4
=A0=A0=A0=A0=A0 Value: 3230
=A0=A0 Attribute 79 (EAP-Message) length=3D8
=A0=A0=A0=A0=A0 Value: 010300061920
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 70845a8a7e43ed918c4254e394507e0b
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def7fb7912bb494401b1f8c908
RADIUS packet matching with station 78:7e:61:61:15:a3
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D3
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D6 =
- ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 135 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D131
EAP: code=3D2 identifier=3D3 length=3D131
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED2
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D3 respMethod=3D25 res=
pVendor=3D0 respVendorMethod=3D0
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
Copied RADIUS State Attribute
RADIUS message: code=3D1 (Access-Request) identifier=3D2 length=3D333
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D133
=A0=A0=A0=A0=A0 Value: 02030083198000000079160301007401000070030157304de826=
75c7942f5e488c7471fe7d3542be55ad51210cfbe48b6403fb14d800002800ffc024c023c00=
ac009c008c028c027c014c013c012003d003c0035002f000ac007c011000500040100001f00=
0a00080006001700180019000b0002010000050005010000000000120000
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def7fb7912bb494401b1f8c908
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 67a4b3509aaed26a517465a0e9fe509d
RADIUS message: code=3D11 (Access-Challenge) identifier=3D2 length=3D1090
=A0=A0 Attribute 79 (EAP-Message) length=3D255
=A0=A0=A0=A0=A0 Value: 0104040019c0000009b41603010039020000350301492365b4a4=
3980755ed3b403f27b66dcbb287e3c35f5f6fe03588a71a9d63fb900c01400000dff0100010=
0000b00040300010216030108180b00081400081100038e3082038a30820272a00302010202=
0101300d06092a864886f70d0101040500308183310b3009060355040613024445310c300a0=
60355040813034e5257310f300d0603550407130641616368656e31123010060355040a1309=
6465766f6c6f2041473126302406092a864886f70d010901161774696d2e6865726d616e736=
b69406465766f6c6f2e6465311930170603550403131042532d454e2d445654205241444955=
5330
=A0=A0 Attribute 79 (EAP-Message) length=3D255
=A0=A0=A0=A0=A0 Value: 20170d3135303732343131323432345a180f3231313530363330=
3131323432345a3072310b3009060355040613024445310c300a060355040813034e5257311=
23010060355040a13096465766f6c6f204147311930170603550403131042532d454e2d4456=
54205241444955533126302406092a864886f70d010901161774696d2e6865726d616e736b6=
9406465766f6c6f2e646530820122300d06092a864886f70d01010105000382010f00308201=
0a0282010100e3551d8927b561c0d234bfe0ee87235e9c107647fd81d89ed1438b062cae098=
185d91a091a483df2bab484bb4cb961c088af0a0339e4752419780f733cfd13f1ad9b45d5c1=
d56d
=A0=A0 Attribute 79 (EAP-Message) length=3D255
=A0=A0=A0=A0=A0 Value: 85196328f0ab07392a1ff1df62e1d143d7efafbaaaaf0b2ed3e2=
24b9802a5281135826f3785e45b88d6223f147cb684625f880c94290357c0eab285ef6adfd5=
a67f0e6a39828e1942db4a86d4cd3eda3f96cf28c646401c32a0bd85b6a1f550a7f0c933652=
8a1684ba199a2fbb6f8ddc5ea47e84100de91771fcba7d2abe194981bda3650cc27a67bb9a4=
1bb38ab815b76ea2a59e430b4de8b68ba35d0683c9dd36c05ed5cf79307d204a7ce097d5a0d=
196d1b90bb271c1dd90203010001a317301530130603551d25040c300a06082b06010505070=
301300d06092a864886f70d01010405000382010100dd571dab5e7559b084874101b06132d9=
0fc7
=A0=A0 Attribute 79 (EAP-Message) length=3D255
=A0=A0=A0=A0=A0 Value: c2141a1fb5351116c891f0dc9eecf1cdc5593002193e04036c9b=
715caa6e170ab6bbf8949fbcf3703b99dbcba4a1db48fde59708021ccbdd168f7c504dda8ce=
597fbccfc13eff5401baf7785730b733d7b9622b23ce22605845b890123641bdda5f244ca90=
9a801af9d560b7d6219980aa5addcf4d3a610634b8d898c77042278f53549322ec672e3585c=
f4e6c96c49772d415021e6880434bcffdee30dfc7a6329bfad2105d1f6b4967a5e1bf7fa1a1=
5192fa394b66d1054a3306bc8dbd946a9d29b6bfb1f16a03612ba97c983f2faaeb2b4a3e653=
6702e5ed646596e6d2e2a5def88aa3b41f5bf9096afe1794400047d3082047930820361a003=
0201
=A0=A0 Attribute 79 (EAP-Message) length=3D14
=A0=A0=A0=A0=A0 Value: 02020900855ee85032c395f2
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 55ffa1b5b1143fe1604a00bbf942e7bc
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def4fc7912bb494401b1f8c908
RADIUS packet matching with station 78:7e:61:61:15:a3
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D4
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D10=
24 - ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 10 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D6
EAP: code=3D2 identifier=3D4 length=3D6
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED2
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D4 respMethod=3D25 res=
pVendor=3D0 respVendorMethod=3D0
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
Copied RADIUS State Attribute
RADIUS message: code=3D1 (Access-Request) identifier=3D3 length=3D208
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D8
=A0=A0=A0=A0=A0 Value: 020400061900
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def4fc7912bb494401b1f8c908
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 35d9bc18653cefd2be43d6680b34b1f1
RADIUS message: code=3D11 (Access-Challenge) identifier=3D3 length=3D1086
=A0=A0 Attribute 79 (EAP-Message) length=3D255
=A0=A0=A0=A0=A0 Value: 010503fc1940300d06092a864886f70d01010b0500308183310b=
3009060355040613024445310c300a060355040813034e5257310f300d06035504071306416=
16368656e31123010060355040a13096465766f6c6f2041473126302406092a864886f70d01=
0901161774696d2e6865726d616e736b69406465766f6c6f2e6465311930170603550403131=
042532d454e2d445654205241444955533020170d3135303732343131323432345a180f3231=
3135303633303131323432345a308183310b3009060355040613024445310c300a060355040=
813034e5257310f300d0603550407130641616368656e31123010060355040a13096465766f=
6c6f
=A0=A0 Attribute 79 (EAP-Message) length=3D255
=A0=A0=A0=A0=A0 Value: 2041473126302406092a864886f70d010901161774696d2e6865=
726d616e736b69406465766f6c6f2e6465311930170603550403131042532d454e2d4456542=
052414449555330820122300d06092a864886f70d01010105000382010f003082010a028201=
0100e35a5cd5b80b2fefff5db11f68d36c6a3c718e3c76773e029a29ded22f9ce75023e9851=
6f1558d6c3f80d9f53694908b22b1280fd4e241f2d611557880929e65c75f063cba82dde414=
17d60d9d5abcb48a56a48b59e66a3439c5e407b446b1d28835d7cb79a4ffa8e021671d12534=
a2c64de4b48be1f031d6be51ce1fb8d82751c39118a4367d1652b805b7cb01b96efbcfd14c0=
1324
=A0=A0 Attribute 79 (EAP-Message) length=3D255
=A0=A0=A0=A0=A0 Value: d44f12f1af548db35958d2b05fa976ce3ba1a9ee84e71fac5f33=
26e28ad412cd1c2e7036872b817e6e337535176c9f36f36471f0c702bb5f1557b44483faa6e=
a61565c1a662b4570f57fbdc7100bbadecc2675df309af768bde4260963dee61e4c0cd420fe=
693af870c30203010001a381eb3081e8301d0603551d0e04160414587a9e2e54417f6aa9313=
3dcd36a76ad5f861d703081b80603551d230481b03081ad8014587a9e2e54417f6aa93133dc=
d36a76ad5f861d70a18189a48186308183310b3009060355040613024445310c300a0603550=
40813034e5257310f300d0603550407130641616368656e31123010060355040a1309646576=
6f6c
=A0=A0 Attribute 79 (EAP-Message) length=3D255
=A0=A0=A0=A0=A0 Value: 6f2041473126302406092a864886f70d010901161774696d2e68=
65726d616e736b69406465766f6c6f2e6465311930170603550403131042532d454e2d44565=
420524144495553820900855ee85032c395f2300c0603551d13040530030101ff300d06092a=
864886f70d01010b05000382010100387c050de0191efc3a1aa9023ee91d3f53fcd1bbf80da=
da1385f0859f085237d3c8584f5d4e1ff65384db488c1ed9b15be14dd3771526ff7b513aea4=
d6ddcd41a265581a27fad2d8ea7436212ffd49c4cd39667b4016e65705817c776eed5243726=
5e461dee4f1474fff7c0513718ca7f5bc0cb8f6fa6026e60c8669b5da358274b9916393cdeb=
60b3
=A0=A0 Attribute 79 (EAP-Message) length=3D10
=A0=A0=A0=A0=A0 Value: ab3c6cb1fb613341
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: cf29719917c787784f6b5afd0f7136c8
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def5fd7912bb494401b1f8c908
RADIUS packet matching with station 78:7e:61:61:15:a3
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D5
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D10=
20 - ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 10 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D6
EAP: code=3D2 identifier=3D5 length=3D6
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED2
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D5 respMethod=3D25 res=
pVendor=3D0 respVendorMethod=3D0
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
Copied RADIUS State Attribute
RADIUS message: code=3D1 (Access-Request) identifier=3D4 length=3D208
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D8
=A0=A0=A0=A0=A0 Value: 020500061900
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def5fd7912bb494401b1f8c908
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: b4e328ff515442753bc26ede7ce522a3
RADIUS message: code=3D11 (Access-Challenge) identifier=3D4 length=3D522
=A0=A0 Attribute 79 (EAP-Message) length=3D255
=A0=A0=A0=A0=A0 Value: 010601ce19005769c2b7cce91636c239f721371bf47c11142823=
5b024ddd7c8e78f27ef6511f8aa4a694217004676c32bc201662faf95ff8e985568b7394c54=
d547b45f2c21afdd59fec16da4e87b7e2f461b02f864b44897d30dda7467c3e39e2bb354206=
a79ce43f2163223615b040f97c817817160301014b0c00014703001741048553fb2042e2c3f=
de1fa35bb1707f6722e937faa3afbf89fec8d2a42ad1eb2b027a410b6db5aa5c36d8667637d=
c53ad1a6f8754d3546faaf7d194e8f527ef932010054e5c8e2d7e145645d5cdbdddb1c45e34=
594fdecb2baa8c98df364f2ec70d0939a2f4279fc6a6bfaaccaceca7e3681967d3f02d8b67b=
f1db
=A0=A0 Attribute 79 (EAP-Message) length=3D211
=A0=A0=A0=A0=A0 Value: fc98e041016232a6a9d70acffefb5911067b057ecdde33e31dca=
7ba442057e842e242ba9c2c15dab59f542c86dc493bdffbc362891afb7a598ff438de10c2e4=
988f2c459a786710b75ce552d079add0724afd0d25df2f84b4020b5f19bd69d3c14a25b6e8b=
c35b014f52754d6867595d7fd277c7b790a3badd2002b79ce3656c29d9f0397b6de762afe43=
a1d54e112fd0bb21c143625115b4685e7cd646a2da57386cd51746d3d2f0cae763b719da7fa=
34b48952b46f9bfe0342315af6d2a35969ad4724a3fe833316030100040e000000
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0 =A0=A0Value: df21ba291e69e36b33efdc21273e87d0
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def2fe7912bb494401b1f8c908
RADIUS packet matching with station 78:7e:61:61:15:a3
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D6
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D46=
2 - ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 148 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D144
EAP: code=3D2 identifier=3D6 length=3D144
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED2
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D6 respMethod=3D25 res=
pVendor=3D0 respVendorMethod=3D0
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
Copied RADIUS State Attribute
RADIUS message: code=3D1 (Access-Request) identifier=3D5 length=3D346
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D146
=A0=A0=A0=A0=A0 Value: 020600901980000000861603010046100000424104fdeb1c1259=
9d78eef418d2e480cddb4128e7dc98bdae1b8d9142adb815a4826409e02c9b5417965e2f960=
4e8681030bd9ffd209c7fc9f1548ea8f84dc2d7132814030100010116030100302510fafc55=
7a3dc3ced3fe1db0806b14799f0f953f3b81af8818f0a9989aab3a8c38e4010ca19909294d5=
1124a7708ac
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def2fe7912bb494401b1f8c908
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: e1411cff1a0155d11b0e4223401400fd
RADIUS message: code=3D11 (Access-Challenge) identifier=3D5 length=3D123
=A0=A0 Attribute 79 (EAP-Message) length=3D67
=A0=A0=A0=A0=A0 Value: 01070041190014030100010116030100303c342fb78c2f1e64d2=
ae41b92a54e5788bc9fbb2fe3f58b20b4a728861b1a1d83ad46244ac6b736f6042957222afc=
a0c
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 524213b718f7f992922c9338353e4a9a
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def3ff7912bb494401b1f8c908
RADIUS packet matching with station 78:7e:61:61:15:a3
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D7
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D65=
 - ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 10 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D6
EAP: code=3D2 identifier=3D7 length=3D6
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED2
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D7 respMethod=3D25 res=
pVendor=3D0 respVendorMethod=3D0
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
Copied RADIUS State Attribute
RADIUS message: code=3D1 (Access-Request) identifier=3D6 length=3D208
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D8
=A0=A0=A0=A0=A0 Value: 020700061900
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def3ff7912bb494401b1f8c908
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: e5218b4f7138f6ff61c5820e8ed459fd
RADIUS message: code=3D11 (Access-Challenge) identifier=3D6 length=3D101
=A0=A0 Attribute 79 (EAP-Message) length=3D45
=A0=A0=A0=A0=A0 Value: 0108002b19001703010020f769ce09c1260bade3c87853f0d9d0=
73b6b6369b7d6f46bbcff52c04150fc01e
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 174dc7193454443b530577b4cd2e77e3
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def0f07912bb494401b1f8c908
RADIUS packet matching with station 78:7e:61:61:15:a3
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D8
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D43=
 - ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 47 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D43
EAP: code=3D2 identifier=3D8 length=3D43
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED2
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D8 respMethod=3D25 res=
pVendor=3D0 respVendorMethod=3D0
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
Copied RADIUS State Attribute
RADIUS message: code=3D1 (Access-Request) identifier=3D7 length=3D245
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D45
=A0=A0=A0=A0=A0 Value: 0208002b19001703010020a71e4b339090589af7abb0baa23fb1=
3573f8130d22d205ad5b10706d2a8a02a9
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def0f07912bb494401b1f8c908
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: b862f6ef2a68b60b14c47c197f1e8ed4
RADIUS message: code=3D11 (Access-Challenge) identifier=3D7 length=3D133
=A0=A0 Attribute 79 (EAP-Message) length=3D77
=A0=A0=A0=A0=A0 Value: 0109004b190017030100407a5a0397969c5f6da123869bc787f0=
da1c5391f50217922b6b3ea314baed773c2a283ecfde0676131b8c7ff98e4e6daf615052518=
5f0464963d4a8e488566def
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: ab07d7ee943df4b6c01c882d85d0e219
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def1f17912bb494401b1f8c908
RADIUS packet matching with station 78:7e:61:61:15:a3
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D9
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D75=
 - ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 111 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D107
EAP: code=3D2 identifier=3D9 length=3D107
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED2
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D9 respMethod=3D25 res=
pVendor=3D0 respVendorMethod=3D0
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
Copied RADIUS State Attribute
RADIUS message: code=3D1 (Access-Request) identifier=3D8 length=3D309
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D109
=A0=A0=A0=A0=A0 Value: 0209006b190017030100606f2beadba0b5ca989cb7f2e78b3757=
1f6727f10de763003c7dc3b45606f5aa5cc5b1ffe9a27a224355b701d422fcb25490a34e6a5=
492aebbab8ea85eec06d9fa85490b44d6376181caeb2de937fd9f4f352bdaa7a2a6405f50ee=
a28e74b75abd
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860def1f17912bb494401b1f8c908
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: c110188afd195e80a72dbfb2109dc2ed
RADIUS message: code=3D11 (Access-Challenge) identifier=3D8 length=3D149
=A0=A0 Attribute 79 (EAP-Message) length=3D93
=A0=A0=A0=A0=A0 Value: 010a005b190017030100508bb66e548499abdd822f1daf3dd5ad=
31abf8228becdc86430239a5a4e42f746030817a9a8cadac2491608f65db34d5a7445a35899=
c6289857a2b43d9fe0b5f0a6d37d24d3542734d355e50c65656c3ef
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 1822e065ba49ea1b623b695ab621a8cf
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860defef27912bb494401b1f8c908
RADIUS packet matching with station 78:7e:61:61:15:a3
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D10
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D91=
 - ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 47 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D43
EAP: code=3D2 identifier=3D10 length=3D43
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED2
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D10 respMethod=3D25 re=
spVendor=3D0 respVendorMethod=3D0
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
Copied RADIUS State Attribute
RADIUS message: code=3D1 (Access-Request) identifier=3D9 length=3D245
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D45
=A0=A0=A0=A0=A0 Value: 020a002b19001703010020bf542d158f3618a3d7f077648e07ba=
468a4048f09f32eb71349d217db0f21b79
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860defef27912bb494401b1f8c908
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 09c621f67a2d06cdccf40e301968087c
RADIUS message: code=3D11 (Access-Challenge) identifier=3D9 length=3D101
=A0=A0 Attribute 79 (EAP-Message) length=3D45
=A0=A0=A0=A0=A0 Value: 010b002b19001703010020d0af163e806625dfc6e4a762f96d43=
7a7a5ac465e0e3deb774025d2abb56380c
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: 1441b741eb13c9b30066af7be6c81abd
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860defff37912bb494401b1f8c908
RADIUS packet matching with station 78:7e:61:61:15:a3
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D11
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D43=
 - ack=3D1
wlan0: Event EAPOL_RX (24) received
IEEE 802.1X: 47 bytes from 78:7e:61:61:15:a3
=A0=A0 IEEE 802.1X: version=3D1 type=3D0 length=3D43
EAP: code=3D2 identifier=3D11 length=3D43
=A0(response)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state RESPONSE
EAP: EAP entering state RECEIVED2
EAP: parseEapResp: rxResp=3D1 rxInitiate=3D0 respId=3D11 respMethod=3D25 re=
spVendor=3D0 respVendorMethod=3D0
EAP: EAP entering state AAA_REQUEST
EAP: EAP entering state AAA_IDLE
Encapsulating EAP message into a RADIUS packet
Copied RADIUS State Attribute
RADIUS message: code=3D1 (Access-Request) identifier=3D10 length=3D245
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 30 (Called-Station-Id) length=3D32
=A0=A0=A0=A0=A0 Value: 'F2-06-8D-38-59-75:devolo-746-r'
=A0=A0 Attribute 61 (NAS-Port-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 19
=A0=A0 Attribute 5 (NAS-Port) length=3D6
=A0=A0=A0=A0=A0 Value: 1
=A0=A0 Attribute 31 (Calling-Station-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '78-7E-61-61-15-A3'
=A0=A0 Attribute 77 (Connect-Info) length=3D24
=A0=A0=A0=A0=A0 Value: 'CONNECT 54Mbps 802.11a'
=A0=A0 Attribute 44 (Acct-Session-Id) length=3D19
=A0=A0=A0=A0=A0 Value: '29E6929C-00000000'
=A0=A0 Attribute 186 (WLAN-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 187 (WLAN-Group-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac04
=A0=A0 Attribute 188 (WLAN-AKM-Suite) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac01
=A0=A0 Attribute 189 (WLAN-Group-Mgmt-Pairwise-Cipher) length=3D6
=A0=A0=A0=A0=A0 Value: 000fac06
=A0=A0 Attribute 12 (Framed-MTU) length=3D6
=A0=A0=A0=A0=A0 Value: 1400
=A0=A0 Attribute 79 (EAP-Message) length=3D45
=A0=A0=A0=A0=A0 Value: 020b002b19001703010020f7c2433d897e55436b004657afc6ed=
211e5642ff4b01f0f7f7da4da96c9e74c0
=A0=A0 Attribute 24 (State) length=3D18
=A0=A0=A0=A0=A0 Value: f6f860defff37912bb494401b1f8c908
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: a67a90156e9672d86d1eaa262e9a9d8d
RADIUS message: code=3D2 (Access-Accept) identifier=3D10 length=3D184
=A0=A0 Attribute 64 (Tunnel-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 0000000d
=A0=A0 Attribute 65 (Tunnel-Medium-Type) length=3D6
=A0=A0=A0=A0=A0 Value: 00000006
=A0=A0 Attribute 81 (Tunnel-Private-Group-Id) length=3D4
=A0=A0=A0=A0=A0 Value: 3230
=A0=A0 Attribute 1 (User-Name) length=3D8
=A0=A0=A0=A0=A0 Value: 'vlan20'
=A0=A0 Attribute 26 (Vendor-Specific) length=3D58
=A0=A0=A0=A0=A0 Value: 000001371134a0f70252fbe06324d804d467447b71787a9ecc17=
67c7f8e898b68e2d907646f73ba812891ac5dcabf54644f3ee828d242520
=A0=A0 Attribute 26 (Vendor-Specific) length=3D58
=A0=A0=A0=A0=A0 Value: 000001371034ad37bae05e37f02403abedef37b8a75ae0473a63=
c3eb3045e5f28f6f9b7da50bff0edcafea1a96b46be62287c1752a41c759
=A0=A0 Attribute 79 (EAP-Message) length=3D6
=A0=A0=A0=A0=A0 Value: 030b0004
=A0=A0 Attribute 80 (Message-Authenticator) length=3D18
=A0=A0=A0=A0=A0 Value: b9f6699164c28c304bf17bd865f4a776
RADIUS packet matching with station 78:7e:61:61:15:a3
wlan0-2: STA 78:7e:61:61:15:a3 RADIUS: VLAN ID 20
VLAN: vlan_add_dynamic(vlan_id=3D20 ifname=3Dwlan0-2.#)
nl80211: Create interface iftype 4 (AP_VLAN)
nl80211: Ignored event (cmd=3D7) for foreign interface (ifindex 60 wdev 0x0)
nl80211: New interface wlan0-2.20 created: ifindex=3D60
nl80211: Add own interface ifindex 60
nl80211: if_indices[16]: 5 34 58 59 60
nl80211: Add own interface ifindex 60
nl80211: ifindex 60 already in the list
VLAN: Set interface wlan0-2.20 up
WPA: Add group state machine for VLAN-ID 20
GMK - hexdump(len=3D32): [REMOVED]
Key Counter - hexdump(len=3D32): [REMOVED]
WPA: group state machine entering state GTK_INIT (VLAN-ID 20)
GTK - hexdump(len=3D16): [REMOVED]
IGTK - hexdump(len=3D16): [REMOVED]
WPA: group state machine entering state SETKEYSDONE (VLAN-ID 20)
wpa_driver_nl80211_set_key: ifindex=3D60 (wlan0-2.20) alg=3D3 addr=3D0x496b=
e4 key_idx=3D1 set_tx=3D1 seq_len=3D0 key_len=3D16
nl80211: KEY_DATA - hexdump(len=3D16): [REMOVED]
=A0=A0 broadcast key
nl80211: set_key failed; err=3D-22 Invalid argument)
WPA: group state machine entering state FATAL_FAILURE
WPA: Ensure group state machine running for VLAN ID 20
WPA initialization for VLAN 20 failed (-1)
WPA: Try stopping group state machine for VLAN ID 20
WPA: Remove group state machine for VLAN-ID 20
WPA deinit of wlan0-2.20 failed
nl80211: wpa_driver_nl80211_if_remove(type=3D1 ifname=3Dwlan0-2.20) ifindex=
=3D60 added_if=3D1
nl80211: Remove interface ifindex=3D60
nl80211: if_indices[16]: 5 34 58 59
EAP: EAP entering state AAA_RESPONSE
EAP: getId: id=3D11
EAP: EAP entering state SEND_REQUEST2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 3 seconds (from dynamic back off; retransCount=3D0)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
nl80211: Ignore RTM_NEWLINK event for foreign ifindex 60
nl80211: Ignore RTM_NEWLINK event for foreign ifindex 60
nl80211: Ignore RTM_NEWLINK event for foreign ifindex 60
nl80211: Ignore RTM_NEWLINK event for foreign ifindex 60
nl80211: Ignore RTM_DELLINK event for foreign ifindex 60
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2.20)
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D4 =
- ack=3D1
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x11043 ([UP][RUNNING][LOWER_UP])
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_NEWLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_newlink(wlan0-2.20)
VLAN: RTM_DELLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_dellink(wlan0-2.20)
VLAN: RTM_DELLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_dellink(wlan0-2.20)
VLAN: RTM_DELLINK: ifi_index=3D60 ifname=3Dwlan0-2.20 ifi_family=3D0 ifi_fl=
ags=3D0x1002 ()
VLAN: vlan_dellink(wlan0-2.20)
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D70:ec:e4:91:f8:93
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 70 ec e4 91 f8 93 ff ff ff ff ff ff 60 6f 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D70:ec:e4:91:f8:93 freq=3D5580 ssi_signal=3D-50 fc=3D=
0x40 seq_ctrl=3D0x6f60 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 70:ec:e4:91:f8:93 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D217): 50 00 00 00 70 ec e4 91 f8 93 f4 06 8d 38 5=
9 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 11 01 00 0a 64 6=
5 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0a 44 4=
5 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 0=
4 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 0=
0 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 b=
f 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 3=
0 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 3=
2 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D70:ec:e4:91:f8:93
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 70 ec e4 91 f8 93 ff ff ff ff ff ff 60 6f 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D70:ec:e4:91:f8:93 freq=3D5580 ssi_signal=3D-50 fc=3D=
0x40 seq_ctrl=3D0x6f60 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 70:ec:e4:91:f8:93 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D220): 50 00 00 00 70 ec e4 91 f8 93 f6 06 8d 38 5=
9 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 11 01 00 0d 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 0=
7 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 0=
0 0f ac 04 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 0=
0 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 0=
0 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 0=
4 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5=
e 00 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3D70:ec:e4:91:f8:93
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff 70 ec e4 91 f8 93 ff ff ff ff ff ff 60 6f 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 10 00 00 dd 09 =
00 10 18 02 01 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D70:ec:e4:91:f8:93 freq=3D5580 ssi_signal=3D-50 fc=3D=
0x40 seq_ctrl=3D0x6f60 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D 70:ec:e4:91:f8:93 noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 70 ec e4 91 f8 93 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 11 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Drop oldest pending send action cookie 0x0
IEEE 802.1X: 78:7e:61:61:15:a3 - (EAP) retransWhile --> 0
EAP: EAP entering state RETRANSMIT2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 6 seconds (from dynamic back off; retransCount=3D1)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D4 =
- ack=3D1
nl80211: Event message available
nl80211: Drv Event 71 (NL80211_CMD_UNPROT_DISASSOCIATE) received for wlan0-2
nl80211: MLME event 71 (NL80211_CMD_UNPROT_DISASSOCIATE) on wlan0-2(f2:06:8=
d:38:59:75) A1=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D26): a0 00 3c 00 f2 06 8d 38 59 7=
5 78 7e 61 61 15 a3 f2 06 8d 38 59 75 80 2a 08 00
nl80211: Unprot Disassociate event
wlan0: Event UNPROT_DISASSOC (32) received
Unknown event 32
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3Dfa:f0:76:ef:6e:5d
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff fa f0 76 ef 6e 5d ff ff ff ff ff ff 90 2a 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 0d 00 00 dd 09 =
00 10 18 02 00 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3Dfa:f0:76:ef:6e:5d freq=3D5580 ssi_signal=3D-29 fc=3D=
0x40 seq_ctrl=3D0x2a90 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D fa:f0:76:ef:6e:5d noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D217): 50 00 00 00 fa f0 76 ef 6e 5d f4 06 8d 38 5=
9 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 11 01 00 0a 64 6=
5 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0a 44 4=
5 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 0=
4 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 0=
0 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 b=
f 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 3=
0 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 3=
2 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3Dfa:f0:76:ef:6e:5d
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff fa f0 76 ef 6e 5d ff ff ff ff ff ff 90 2a 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 0d 00 00 dd 09 =
00 10 18 02 00 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3Dfa:f0:76:ef:6e:5d freq=3D5580 ssi_signal=3D-29 fc=3D=
0x40 seq_ctrl=3D0x2a90 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D fa:f0:76:ef:6e:5d noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D220): 50 00 00 00 fa f0 76 ef 6e 5d f6 06 8d 38 5=
9 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 11 01 00 0d 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 0=
7 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 0=
0 0f ac 04 01 00 00 0f ac 02 0c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 0=
0 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 0=
0 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 0=
4 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5=
e 00 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Dff:ff:ff:ff:ff:ff A2=3Dfa:f0:76:ef:6e:5d
nl80211: MLME event frame - hexdump(len=3D118): 40 00 00 00 ff ff ff ff ff =
ff fa f0 76 ef 6e 5d ff ff ff ff ff ff 90 2a 00 00 01 08 0c 12 18 24 30 48 =
60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 08 84 00 00 00 40 6b 07 0f ff ff ff ff ff ff bf =
0c 32 50 80 0f fe ff 00 00 fe ff 00 00 dd 08 00 50 f2 08 00 0d 00 00 dd 09 =
00 10 18 02 00 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3Dfa:f0:76:ef:6e:5d freq=3D5580 ssi_signal=3D-29 fc=3D=
0x40 seq_ctrl=3D0x2a90 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D118
nl80211: send_mlme - da=3D fa:f0:76:ef:6e:5d noack=3D1 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D1 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 fa f0 76 ef 6e 5d f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 11 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted (no ACK); cookie 0x0
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0(f4:06:8d:38:59:75) A1=
=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: wlan0: Ignore MLME frame event for foreign address
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-1
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-1(f6:06:8d:38:59:75) A1=
=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: wlan0-1: Ignore MLME frame event for foreign address
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D130): 40 00 3c 00 f2 06 8d 38 59 =
75 78 7e 61 61 15 a3 ff ff ff ff ff ff a0 2a 00 0c 64 65 76 6f 6c 6f 2d 37 =
34 36 2d 72 01 08 0c 12 18 24 30 48 60 6c 2d 1a 63 00 17 ff 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 08 84 00 00 =
00 40 6b 07 0f ff ff ff ff ff ff bf 0c 32 50 80 0f fe ff 00 00 fe ff 00 00 =
dd 08 00 50 f2 08 00 0d 00 00 dd 09 00 10 18 02 00 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-29 fc=3D=
0x40 seq_ctrl=3D0x2aa0 stype=3D4 (WLAN_FC_STYPE_PROBE_REQ) len=3D130
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x50 (WLAN_FC_STYPE_PROBE_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D219): 50 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 11 01 00 0c 64 6=
5 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 01 74 07 0=
a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0=
f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 0=
0 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 0=
0 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 0=
2 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 0=
0 62 32 2f 00
nl80211: Frame TX command accepted; cookie 0xaf
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D219): 50 00 00 00 78 7e 61 61 15 =
a3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 =
11 01 00 0c 64 65 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 =
6c 03 01 74 07 0a 44 45 20 24 08 14 64 0b 1b 00 20 01 03 30 14 01 00 00 0f =
ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 8c 00 3b 02 80 00 2d 1a ef 09 1b =
ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 =
74 05 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 =
00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 05 01 7a =
00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 =
00 00 42 43 5e 00 62 32 2f 00
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D51): b0 00 3c 00 f2 06 8d 38 59 7=
5 78 7e 61 61 15 a3 f2 06 8d 38 59 75 b0 2a 00 00 01 00 00 00 7f 08 04 00 0=
0 00 00 00 00 40 dd 09 00 10 18 02 00 00 10 00 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-29 fc=3D=
0xb0 seq_ctrl=3D0x2ab0 stype=3D11 (WLAN_FC_STYPE_AUTH) len=3D51
wlan0: Event RX_MGMT (19) received
mgmt::auth
authentication: STA=3D78:7e:61:61:15:a3 auth_alg=3D0 auth_transaction=3D1 s=
tatus_code=3D0 wep=3D0 seq_ctrl=3D0x2ab0
authentication reply: STA=3D78:7e:61:61:15:a3 auth_alg=3D0 auth_transaction=
=3D2 resp=3D0 (IE len=3D0)
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xb0 (WLAN_FC_STYPE_AUTH) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D30): b0 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 59=
 75 f2 06 8d 38 59 75 00 00 00 00 02 00 00 00
nl80211: Frame TX command accepted; cookie 0xb0
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D30): b0 00 00 00 78 7e 61 61 15 a=
3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 00 00 02 00 00 00
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
mgmt::auth cb
wlan0-2: STA 78:7e:61:61:15:a3 IEEE 802.11: authenticated
nl80211: Event message available
nl80211: BSS Event 59 (NL80211_CMD_FRAME) received for wlan0-2
nl80211: MLME event 59 (NL80211_CMD_FRAME) on wlan0-2(f2:06:8d:38:59:75) A1=
=3Df2:06:8d:38:59:75 A2=3D78:7e:61:61:15:a3
nl80211: MLME event frame - hexdump(len=3D158): 00 00 3c 00 f2 06 8d 38 59 =
75 78 7e 61 61 15 a3 f2 06 8d 38 59 75 c0 2a 11 01 14 00 00 0c 64 65 76 6f =
6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 21 02 02 e0 24 06 24 =
04 34 04 64 0b 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 =
8c 00 2d 1a 63 00 17 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c 32 50 80 0f fe ff 00 00 =
fe ff 00 00 dd 09 00 10 18 02 00 00 10 00 00 dd 07 00 50 f2 02 00 01 00
nl80211: Frame event
nl80211: RX frame sa=3D78:7e:61:61:15:a3 freq=3D5580 ssi_signal=3D-28 fc=3D=
0x0 seq_ctrl=3D0x2ac0 stype=3D0 (WLAN_FC_STYPE_ASSOC_REQ) len=3D158
wlan0: Event RX_MGMT (19) received
mgmt::assoc_req
association request: STA=3D78:7e:61:61:15:a3 capab_info=3D0x111 listen_inte=
rval=3D20 seq_ctrl=3D0x2ac0
WMM IE - hexdump(len=3D7): 00 50 f2 02 00 01 00
Validating WMM IE: OUI 00:50:f2=A0 OUI type 2=A0 OUI sub-type 0=A0 version =
1=A0 QoS info 0x0
wlan0-2: SA Query timer for STA 78:7e:61:61:15:a3 (count=3D0)
IEEE 802.11: Sending SA Query Request to 78:7e:61:61:15:a3
IEEE 802.11: SA Query Transaction ID - hexdump(len=3D2): 52 f9
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xd0 (WLAN_FC_STYPE_ACTION) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D28): d0 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 59=
 75 f2 06 8d 38 59 75 00 00 08 00 52 f9
nl80211: Frame TX command accepted; cookie 0xb1
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Update send_action_cookie from 0x0 to 0xb1
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0x10 (WLAN_FC_STYPE_ASSOC_RESP) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D156): 10 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 5=
9 75 f2 06 8d 38 59 75 00 00 11 01 1e 00 01 c0 01 08 8c 12 98 24 b0 48 60 6=
c 38 05 03 e7 03 00 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 0=
1 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 bf 0c b2 00 80 33 fa ff 00 00 fa ff 00 00 c0 0=
5 01 7a 00 fc ff 7f 08 04 00 00 00 00 00 00 40 dd 18 00 50 f2 02 01 01 80 0=
0 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: Frame TX command accepted; cookie 0xb2
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D28): d0 00 00 00 78 7e 61 61 15 a=
3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 08 00 52 f9
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
mgmt::action cb
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D156): 10 00 00 00 78 7e 61 61 15 =
a3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 11 01 1e 00 01 c0 01 08 8c 12 =
98 24 b0 48 60 6c 38 05 03 e7 03 00 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 =
00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3d 16 74 05 04 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 bf 0c b2 00 80 33 fa ff 00 00 =
fa ff 00 00 c0 05 01 7a 00 fc ff 7f 08 04 00 00 00 00 00 00 40 dd 18 00 50 =
f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
mgmt::assoc_resp cb
wlan0-2: SA Query timer for STA 78:7e:61:61:15:a3 (count=3D1)
IEEE 802.11: Sending SA Query Request to 78:7e:61:61:15:a3
IEEE 802.11: SA Query Transaction ID - hexdump(len=3D2): 55 01
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xd0 (WLAN_FC_STYPE_ACTION) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D28): d0 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 59=
 75 f2 06 8d 38 59 75 00 00 08 00 55 01
nl80211: Frame TX command accepted; cookie 0xb3
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Update send_action_cookie from 0xb1 to 0xb3
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D28): d0 00 00 00 78 7e 61 61 15 a=
3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 08 00 55 01
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
mgmt::action cb
wlan0-2: SA Query timer for STA 78:7e:61:61:15:a3 (count=3D2)
IEEE 802.11: Sending SA Query Request to 78:7e:61:61:15:a3
IEEE 802.11: SA Query Transaction ID - hexdump(len=3D2): 8c e1
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xd0 (WLAN_FC_STYPE_ACTION) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D28): d0 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 59=
 75 f2 06 8d 38 59 75 00 00 08 00 8c e1
nl80211: Frame TX command accepted; cookie 0xb4
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Update send_action_cookie from 0xb3 to 0xb4
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D28): d0 00 00 00 78 7e 61 61 15 a=
3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 08 00 8c e1
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
mgmt::action cb
wlan0-2: SA Query timer for STA 78:7e:61:61:15:a3 (count=3D3)
IEEE 802.11: Sending SA Query Request to 78:7e:61:61:15:a3
IEEE 802.11: SA Query Transaction ID - hexdump(len=3D2): ac ec
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xd0 (WLAN_FC_STYPE_ACTION) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D28): d0 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 59=
 75 f2 06 8d 38 59 75 00 00 08 00 ac ec
nl80211: Frame TX command accepted; cookie 0xb5
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Update send_action_cookie from 0xb4 to 0xb5
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D28): d0 00 00 00 78 7e 61 61 15 a=
3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 08 00 ac ec
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
mgmt::action cb
wlan0-2: SA Query timer for STA 78:7e:61:61:15:a3 (count=3D4)
IEEE 802.11: Sending SA Query Request to 78:7e:61:61:15:a3
IEEE 802.11: SA Query Transaction ID - hexdump(len=3D2): 00 37
nl80211: send_mlme - da=3D 78:7e:61:61:15:a3 noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xd0 (WLAN_FC_STYPE_ACTION) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D28): d0 00 00 00 78 7e 61 61 15 a3 f2 06 8d 38 59=
 75 f2 06 8d 38 59 75 00 00 08 00 00 37
nl80211: Frame TX command accepted; cookie 0xb6
nl80211: Drop oldest pending send action cookie 0x0
nl80211: Update send_action_cookie from 0xb5 to 0xb6
nl80211: Event message available
nl80211: Drv Event 60 (NL80211_CMD_FRAME_TX_STATUS) received for wlan0-2
nl80211: MLME event 60 (NL80211_CMD_FRAME_TX_STATUS) on wlan0-2(f2:06:8d:38=
:59:75) A1=3D78:7e:61:61:15:a3 A2=3Df2:06:8d:38:59:75
nl80211: MLME event frame - hexdump(len=3D28): d0 00 00 00 78 7e 61 61 15 a=
3 f2 06 8d 38 59 75 f2 06 8d 38 59 75 00 00 08 00 00 37
nl80211: Frame TX status event
wlan0: Event TX_STATUS (17) received
mgmt::action cb
wlan0-2: SA Query timer for STA 78:7e:61:61:15:a3 (count=3D5)
IEEE 802.1X: 78:7e:61:61:15:a3 - (EAP) retransWhile --> 0
EAP: EAP entering state RETRANSMIT2
EAP: EAP entering state IDLE2
EAP: retransmit timeout 12 seconds (from dynamic back off; retransCount=3D2)
IEEE 802.1X: 78:7e:61:61:15:a3 BE_AUTH entering state REQUEST
wlan0: Event EAPOL_TX_STATUS (38) received
IEEE 802.1X: 78:7e:61:61:15:a3 TX status - version=3D2 type=3D0 length=3D4 =
- ack=3D0
Signal 2 received - terminating
hostapd_interface_deinit_free(0x77ad2010)
hostapd_interface_deinit_free: num_bss=3D3 conf->num_bss=3D3
hostapd_interface_deinit(0x77ad2010)
wlan0: interface state ENABLED->DISABLED
hostapd_bss_deinit: deinit bss wlan0-2
Removing station 78:7e:61:61:15:a3
hostapd_ht_operation_update current operation mode=3D0x4
hostapd_ht_operation_update new operation mode=3D0x0 changes=3D1
nl80211: Set beacon (beacon_set=3D1)
nl80211: Beacon head - hexdump(len=3D61): 80 00 00 00 ff ff ff ff ff ff f4 =
06 8d 38 59 75 f4 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 =
00 0a 64 65 76 6f 6c 6f 2d 37 34 36 01 08 8c 12 98 24 b0 48 60 6c 03 01 74
nl80211: Beacon tail - hexdump(len=3D156): 07 0a 44 45 20 24 08 14 64 0b 1b=
 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 02 0c=
 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00=
 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff=
 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02=
 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: ifindex=3D34
nl80211: beacon_int=3D100
nl80211: dtim_period=3D2
nl80211: ssid - hexdump_ascii(len=3D10):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 devolo-746=A0=A0=A0=A0=A0 =

=A0 * beacon_int=3D100
nl80211: hidden SSID not in use
nl80211: privacy=3D1
nl80211: auth_algs=3D0x1
nl80211: wpa_version=3D0x2
nl80211: key_mgmt_suites=3D0x2
nl80211: pairwise_ciphers=3D0x10
nl80211: group_cipher=3D0x10
nl80211: SMPS mode - off
nl80211: beacon_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: proberesp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: assocresp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: Set beacon (beacon_set=3D1)
nl80211: Beacon head - hexdump(len=3D64): 80 00 00 00 ff ff ff ff ff ff f6 =
06 8d 38 59 75 f6 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 =
00 0d 64 65 76 6f 6c 6f 2d 37 34 36 2d 32 30 01 08 8c 12 98 24 b0 48 60 6c =
03 01 74
nl80211: Beacon tail - hexdump(len=3D156): 07 0a 44 45 20 24 08 14 64 0b 1b=
 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 02 0c=
 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00=
 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff=
 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02=
 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: ifindex=3D58
nl80211: beacon_int=3D100
nl80211: dtim_period=3D2
nl80211: ssid - hexdump_ascii(len=3D13):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36 2d 32 30=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 devolo-746-20=A0=A0 =

=A0 * beacon_int=3D100
nl80211: hidden SSID not in use
nl80211: privacy=3D1
nl80211: auth_algs=3D0x1
nl80211: wpa_version=3D0x2
nl80211: key_mgmt_suites=3D0x2
nl80211: pairwise_ciphers=3D0x10
nl80211: group_cipher=3D0x10
nl80211: SMPS mode - off
nl80211: beacon_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: proberesp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: assocresp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: Set beacon (beacon_set=3D1)
nl80211: Beacon head - hexdump(len=3D63): 80 00 00 00 ff ff ff ff ff ff f2 =
06 8d 38 59 75 f2 06 8d 38 59 75 00 00 00 00 00 00 00 00 00 00 64 00 31 01 =
00 0c 64 65 76 6f 6c 6f 2d 37 34 36 2d 72 01 08 8c 12 98 24 b0 48 60 6c 03 =
01 74
nl80211: Beacon tail - hexdump(len=3D156): 07 0a 44 45 20 24 08 14 64 0b 1b=
 00 20 01 03 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 8c=
 00 3b 02 80 00 2d 1a ef 09 1b ff ff 00 00 00 00 00 00 00 00 00 00 01 00 00=
 00 00 00 00 00 00 00 00 3d 16 74 05 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 7f 08 04 00 00 00 00 00 00 40 bf 0c b2 00 80 33 fa ff=
 00 00 fa ff 00 00 c0 05 01 7a 00 fc ff c3 04 02 30 30 30 dd 18 00 50 f2 02=
 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
nl80211: ifindex=3D59
nl80211: beacon_int=3D100
nl80211: dtim_period=3D2
nl80211: ssid - hexdump_ascii(len=3D12):
=A0=A0=A0=A0 64 65 76 6f 6c 6f 2d 37 34 36 2d 72=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 devolo-746-r=A0=A0=A0 =

=A0 * beacon_int=3D100
nl80211: hidden SSID not in use
nl80211: privacy=3D1
nl80211: auth_algs=3D0x1
nl80211: wpa_version=3D0x2
nl80211: key_mgmt_suites=3D0x1
nl80211: pairwise_ciphers=3D0x10
nl80211: group_cipher=3D0x10
nl80211: SMPS mode - off
nl80211: beacon_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: proberesp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
nl80211: assocresp_ies - hexdump(len=3D10): 7f 08 04 00 00 00 00 00 00 40
ap_free_sta: cancel ap_handle_timer for 78:7e:61:61:15:a3
EAP: Server state machine removed
wlan0: Deauthenticate all stations
nl80211: send_mlme - da=3D ff:ff:ff:ff:ff:ff noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xc0 (WLAN_FC_STYPE_DEAUTH) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D26): c0 00 00 00 ff ff ff ff ff ff f2 06 8d 38 59=
 75 f2 06 8d 38 59 75 00 00 03 00
nl80211: Frame TX command accepted; cookie 0xb7
nl80211: Drop oldest pending send action cookie 0x0
wlan0: AP-DISABLED =

hostapd_cleanup(hapd=3D0x77bba6d0 (wlan0-2))
Control interface directory not empty - leaving it behind
hostapd_free_hapd_data(wlan0-2)
nl80211: wpa_driver_nl80211_if_remove(type=3D2 ifname=3Dwlan0-2) ifindex=3D=
59 added_if=3D1
nl80211: Remove interface ifindex=3D59
nl80211: if_indices[16]: 5 34 58
nl80211: Not the first BSS - remove it
nl80211: Teardown AP(wlan0-2) - device_ap_sme=3D0 use_monitor=3D0
nl80211: Unsubscribe mgmt frames handle 0x880f3479 (AP teardown)
nl80211: Remove beacon (ifindex=3D59)
hostapd_bss_deinit: deinit bss wlan0-1
wlan0: Deauthenticate all stations
nl80211: send_mlme - da=3D ff:ff:ff:ff:ff:ff noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xc0 (WLAN_FC_STYPE_DEAUTH) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D26): c0 00 00 00 ff ff ff ff ff ff f6 06 8d 38 59=
 75 f6 06 8d 38 59 75 00 00 03 00
nl80211: Frame TX command accepted; cookie 0xb8
nl80211: Drop oldest pending send action cookie 0x0
wlan0: AP-DISABLED =

hostapd_cleanup(hapd=3D0x77bba010 (wlan0-1))
Control interface directory not empty - leaving it behind
hostapd_free_hapd_data(wlan0-1)
nl80211: wpa_driver_nl80211_if_remove(type=3D2 ifname=3Dwlan0-1) ifindex=3D=
58 added_if=3D1
nl80211: Remove interface ifindex=3D58
nl80211: if_indices[16]: 5 34
nl80211: Failed to remove interface wlan0-1 from bridge br-lan: No such dev=
ice
nl80211: Not the first BSS - remove it
nl80211: Teardown AP(wlan0-1) - device_ap_sme=3D0 use_monitor=3D0
nl80211: Unsubscribe mgmt frames handle 0x880f34a9 (AP teardown)
nl80211: Remove beacon (ifindex=3D58)
hostapd_bss_deinit: deinit bss wlan0
wlan0: Deauthenticate all stations
nl80211: send_mlme - da=3D ff:ff:ff:ff:ff:ff noack=3D0 freq=3D0 no_cck=3D0 =
offchanok=3D0 wait_time=3D0 fc=3D0xc0 (WLAN_FC_STYPE_DEAUTH) nlmode=3D3
nl80211: send_mlme -> send_frame
nl80211: send_frame - Use bss->freq=3D5580
nl80211: send_frame -> send_frame_cmd
nl80211: CMD_FRAME freq=3D5580 wait=3D0 no_cck=3D0 no_ack=3D0 offchanok=3D0
CMD_FRAME - hexdump(len=3D26): c0 00 00 00 ff ff ff ff ff ff f4 06 8d 38 59=
 75 f4 06 8d 38 59 75 00 00 03 00
nl80211: Frame TX command accepted; cookie 0xb9
nl80211: Drop oldest pending send action cookie 0x0
wlan0: AP-DISABLED =

hostapd_cleanup(hapd=3D0x77b002e0 (wlan0))
hostapd_free_hapd_data(wlan0)
hostapd_interface_deinit_free: driver=3D0x4a9e20 drv_priv=3D0x77bbae10 -> h=
apd_deinit
nl80211: deinit ifname=3Dwlan0 disabled_11b_rates=3D0
nl80211: Remove monitor interface: refcount=3D0
nl80211: Remove beacon (ifindex=3D34)
netlink: Operstate: ifindex=3D34 linkmode=3D0 (kernel-control), operstate=
=3D6 (IF_OPER_UP)
nl80211: Unsubscribe mgmt frames handle 0xff3910e9 (deinit)
hostapd_interface_free(0x77ad2010)
hostapd_interface_free: free hapd 0x77b002e0
hostapd_interface_free: free hapd 0x77bba010
hostapd_interface_free: free hapd 0x77bba6d0
hostapd_cleanup_iface(0x77ad2010)
hostapd_cleanup_iface_partial(0x77ad2010)
hostapd_cleanup_iface: free iface=3D0x77ad2010




Regards
G=FCnther




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

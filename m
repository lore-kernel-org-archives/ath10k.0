Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1Yw4-0002HA-8Q
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 12:12:33 +0000
MIME-Version: 1.0
Message-ID: <trinity-533ad800-3fb7-4e15-ac5a-c322abe10daa-1448453523853@3capp-webde-bs27>
From: "Roman Bange" <mofasofa123@gmx.de>
Subject: Re: QCA6174 hw2.1 Firmware crash when connecting to a 5GHz network
Content-Type: multipart/mixed;
 boundary=rekcebs-a7301e8c-65e8-4290-ba4e-db2f47070059
Date: Wed, 25 Nov 2015 13:12:03 +0100
In-Reply-To: <CACKGw+Fw=9EZAM1SxWcF612s=OePH0sKPc7fUywjJ=6r9yVovw@mail.gmail.com>
References: <trinity-4c2e549c-06f4-4928-89eb-6ec669ff3681-1447860514624@3capp-gmx-bs61>, 
 <CACKGw+Fw=9EZAM1SxWcF612s=OePH0sKPc7fUywjJ=6r9yVovw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: mailinglist ath10k <ath10k@lists.infradead.org>

--rekcebs-a7301e8c-65e8-4290-ba4e-db2f47070059
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Sorry for my late answer=2E
=C2=A0
Sadly the AP's im connecting to, are part of my universities wifi so i can=
't tell you the excat chipset they use=2E
I tried to connect without the network manager so i followed the instructi=
ons and did a try with wpa_supplicant=2E

I attached you the log i got, but sadly it didn't work either=2E

Btw=2E=2E=2E connecting to a unencrypted 5Ghz network works fine=2E But wh=
en i try to build up a connection with an VPN over an unencrypted wifi fail=
s too=2E




=C2=A0

Gesendet:=C2=A0Donnerstag, 19=2E November 2015 um 11:09 Uhr
Von:=C2=A0"Bartosz Markowski" <bartosz=2Emarkowski@tieto=2Ecom>
An:=C2=A0"Roman Bange" <mofasofa123@gmx=2Ede>
Cc:=C2=A0ath10k <ath10k@lists=2Einfradead=2Eorg>
Betreff:=C2=A0Re: QCA6174 hw2=2E1 Firmware crash when connecting to a 5GHz=
 network
On 18 November 2015 at 16:28, Roman Bange <mofasofa123@gmx=2Ede> wrote:
> Hey,
>
> im getting a firmware crash when i try to connect to a 5GHz network=2E
> I tested the older firmware WLAN=2ERM=2E1=2E1-00141, which is now provid=
ed in linux-firmware, and SW_RM=2E1=2E1=2E1-00157-QCARMSWPZ-1, which is pro=
vided by you in ath10k-firmware=2E
>
> SW_RM=2E1=2E1=2E1-00157-QCARMSWPZ-1 didn't crash but i wasn't able to co=
nnect either=2E
>
> In addition i tested a solution that worked for me with the 4=2E1 Kernel=
 where i extracted the firmware out of the windows driver (and can be found=
 here (https://github=2Ecom/sumdog/ath10k-firmware)=2E This solution didn't=
 worked for me too=2E
>
> I tested the firmware with 4=2E2=2E0-16 under Ubuntu, but experienced th=
e same problem with the stable releases 4=2E2=2E6 and 4=2E3 too=2E I have n=
ot tested the 4=2E4-rc1 Kernel yet because its not compilable with the Ubun=
tu packages=2E

The firmware crash you experience with "older" firmwares got fixed in
the 000157=2E
It's most likely related with wrong txbf capability advertisement,
which your card (and firmware for it) does not support=2E

May I ask what AP you test with?

> I attached the related dmesg logs to this mail=2E

When you use the 000157 firmware you can see there's a successful
auth/assoc seq=2E but later on for some reason there's a local deauth
triggered=2E

[ 58=2E966382] wlp3s0: authenticate with f0:7f:06:2a:44:2d
[ 59=2E008957] wlp3s0: send auth to f0:7f:06:2a:44:2d (try 1/3)
[ 59=2E009546] wlp3s0: authenticated
[ 59=2E014268] wlp3s0: associate with f0:7f:06:2a:44:2d (try 1/3)
[ 59=2E019139] wlp3s0: RX AssocResp from f0:7f:06:2a:44:2d (capab=3D0x11
status=3D0 aid=3D6)
[ 59=2E022291] wlp3s0: associated
[ 59=2E022324] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
=2E=2E=2E
[ 62=2E130412] wlp3s0: deauthenticating from f0:7f:06:2a:44:2d by
local choice (Reason: 3=3DDEAUTH_LEAVING)

And these steps repeat in your log=2E

Could you try to connect with the AP w/o the network manager (using
wpa_supplicant / wpa_cli directly)?

> Best regards,
> Roman
> _______________________________________________
> ath10k mailing list
> ath10k@lists=2Einfradead=2Eorg
> http://lists=2Einfradead=2Eorg/mailman/listinfo/ath10k[http://lists=2Ein=
fradead=2Eorg/mailman/listinfo/ath10k]
>

--
Bartosz
--rekcebs-a7301e8c-65e8-4290-ba4e-db2f47070059
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="wpasupplicant log"

sudo ethtool -i wlp3s0
driver: ath10k_pci
version: 4.4.0-040400rc2-generic
firmware-version: SW_RM.1.1.1-00157-QCARMSWPZ-1
bus-info: 0000:03:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no


sudo wpa_supplicant -c /etc/wpa_supplicant/wpa_supplicant.conf -D wext -i wlp3s0 -d
wpa_supplicant v2.4
random: Trying to read entropy from /dev/random
Successfully initialized wpa_supplicant
Initializing interface 'wlp3s0' conf '/etc/wpa_supplicant/wpa_supplicant.conf' driver 'wext' ctrl_interface 'N/A' bridge 'N/A'
Configuration file '/etc/wpa_supplicant/wpa_supplicant.conf' -> '/etc/wpa_supplicant/wpa_supplicant.conf'
Reading configuration file '/etc/wpa_supplicant/wpa_supplicant.conf'
Priority group 1
   id=0 ssid='UniKoeln-802.1X'
WEXT: cfg80211-based driver detected
wext: interface wlp3s0 phy: phy0
rfkill: initial event: idx=0 type=1 op=0 soft=0 hard=0
rfkill: initial event: idx=1 type=2 op=0 soft=1 hard=0
rfkill: initial event: idx=2 type=1 op=0 soft=0 hard=0
SIOCGIWRANGE: WE(compiled)=22 WE(source)=21 enc_capa=0xf
  capabilities: key_mgmt 0xf enc 0x1f flags 0x0
netlink: Operstate: ifindex=3 linkmode=1 (userspace-control), operstate=5 (IF_OPER_DORMANT)
Add interface wlp3s0 to a new radio phy0
wlp3s0: Own MAC address: 5c:93:a2:99:93:f9
wpa_driver_wext_set_key: alg=0 key_idx=0 set_tx=0 seq_len=0 key_len=0
wpa_driver_wext_set_key: alg=0 key_idx=1 set_tx=0 seq_len=0 key_len=0
wpa_driver_wext_set_key: alg=0 key_idx=2 set_tx=0 seq_len=0 key_len=0
wpa_driver_wext_set_key: alg=0 key_idx=3 set_tx=0 seq_len=0 key_len=0
wpa_driver_wext_set_key: alg=0 key_idx=4 set_tx=0 seq_len=0 key_len=0
ioctl[SIOCSIWENCODEEXT]: Invalid argument
Driver did not support SIOCSIWENCODEEXT
wpa_driver_wext_set_key: alg=0 key_idx=5 set_tx=0 seq_len=0 key_len=0
ioctl[SIOCSIWENCODEEXT]: Invalid argument
Driver did not support SIOCSIWENCODEEXT
wpa_driver_wext_set_countermeasures
wlp3s0: RSN: flushing PMKID list in the driver
wlp3s0: Setting scan request: 0.100000 sec
TDLS: TDLS operation not supported by driver
TDLS: Driver uses internal link setup
TDLS: Driver does not support TDLS channel switching
wlp3s0: WPS: UUID based on MAC address: 8a7be570-3936-5f56-8311-a492b25abe79
ENGINE: Loading dynamic engine
ENGINE: Loading dynamic engine
EAPOL: SUPP_PAE entering state DISCONNECTED
EAPOL: Supplicant port status: Unauthorized
EAPOL: KEY_RX entering state NO_KEY_RECEIVE
EAPOL: SUPP_BE entering state INITIALIZE
EAP: EAP entering state DISABLED
wlp3s0: Added interface wlp3s0
wlp3s0: State: DISCONNECTED -> DISCONNECTED
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
random: Got 20/20 bytes from /dev/random
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b06 len=12
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b1a len=16
wlp3s0: State: DISCONNECTED -> SCANNING
Scan SSID - hexdump_ascii(len=15):
     55 6e 69 4b 6f 65 6c 6e 2d 38 30 32 2e 31 58      UniKoeln-802.1X 
wlp3s0: Starting AP scan for wildcard SSID (Interleave with specific)
wlp3s0: Add radio work 'scan'@0x55d8c57cb430
wlp3s0: First radio work item in the queue - schedule start immediately
wlp3s0: Starting radio work 'scan'@0x55d8c57cb430 after 0.000006 second wait
Scan requested (ret=0) - scan timeout 10 seconds
EAPOL: disable timer tick
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b19 len=16
wlp3s0: Event SCAN_RESULTS (3) received
Scan results did not fit - trying larger buffer (8192 bytes)
Scan results did not fit - trying larger buffer (16384 bytes)
Scan results did not fit - trying larger buffer (32768 bytes)
Received 19640 bytes of scan results (37 BSSes)
wlp3s0: BSS: Start scan result update 1
wlp3s0: BSS: Add new id 0 BSSID f0:7f:06:2a:44:2d SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 1 BSSID f0:7f:06:2a:44:2e SSID 'eduroam'
wlp3s0: BSS: Add new id 2 BSSID f0:7f:06:20:04:ae SSID 'eduroam'
wlp3s0: BSS: Add new id 3 BSSID f0:7f:06:20:04:ad SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 4 BSSID f0:7f:06:32:50:8b SSID 'eduroam'
wlp3s0: BSS: Add new id 5 BSSID f0:7f:06:32:50:8c SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 6 BSSID a4:18:75:42:6e:21 SSID 'eduroam'
wlp3s0: BSS: Add new id 7 BSSID a4:18:75:42:6e:22 SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 8 BSSID f0:7f:06:2a:44:22 SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 9 BSSID f0:7f:06:2a:44:21 SSID 'eduroam'
wlp3s0: BSS: Add new id 10 BSSID a4:18:75:42:6e:2d SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 11 BSSID a4:18:75:42:6e:2e SSID 'eduroam'
wlp3s0: BSS: Add new id 12 BSSID f0:7f:06:2a:36:1e SSID 'eduroam'
wlp3s0: BSS: Add new id 13 BSSID f0:7f:06:2a:36:12 SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 14 BSSID f0:7f:06:2a:36:1d SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 15 BSSID f0:7f:06:10:9f:0c SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 16 BSSID f0:7f:06:10:9f:0b SSID 'eduroam'
wlp3s0: BSS: Add new id 17 BSSID f0:7f:06:32:50:83 SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 18 BSSID f0:7f:06:2a:36:11 SSID 'eduroam'
wlp3s0: BSS: Add new id 19 BSSID f0:7f:06:32:50:84 SSID 'eduroam'
wlp3s0: BSS: Add new id 20 BSSID 2c:3f:38:58:15:eb SSID 'eduroam'
wlp3s0: BSS: Add new id 21 BSSID 2c:3f:38:58:15:ec SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 22 BSSID 2c:3f:38:58:1f:73 SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 23 BSSID 2c:3f:38:58:1f:74 SSID 'eduroam'
wlp3s0: BSS: Add new id 24 BSSID 2c:3f:38:58:15:e4 SSID 'eduroam'
wlp3s0: BSS: Add new id 25 BSSID f0:7f:06:2a:44:2c SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 26 BSSID f0:7f:06:20:04:ac SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 27 BSSID f0:7f:06:32:50:8a SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 28 BSSID a4:18:75:42:6e:23 SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 29 BSSID f0:7f:06:2a:44:23 SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 30 BSSID a4:18:75:42:6e:2c SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 31 BSSID f0:7f:06:2a:36:13 SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 32 BSSID f0:7f:06:2a:36:1c SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 33 BSSID f0:7f:06:10:9f:0a SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 34 BSSID f0:7f:06:32:50:85 SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 35 BSSID 2c:3f:38:58:1f:75 SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 36 BSSID 2c:3f:38:58:15:ea SSID 'UniKoeln-WEB'
BSS: last_scan_res_used=37/64
wlp3s0: New scan results available (own=0 ext=0)
wlp3s0: Radio work 'scan'@0x55d8c57cb430 done in 4.683841 seconds
wlp3s0: Selecting BSS from priority group 1
wlp3s0: 0: f0:7f:06:2a:44:2d ssid='UniKoeln-802.1X' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-62
wlp3s0:    selected based on RSN IE
wlp3s0:    selected BSS f0:7f:06:2a:44:2d ssid='UniKoeln-802.1X'
wlp3s0: Considering connect request: reassociate: 0  selected: f0:7f:06:2a:44:2d  bssid: 00:00:00:00:00:00  pending: 00:00:00:00:00:00  wpa_state: SCANNING  ssid=0x55d8c57acff0  current_ssid=(nil)
wlp3s0: Request association with f0:7f:06:2a:44:2d
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=17): 00 0f 55 6e 69 4b 6f 65 6c 6e 2d 38 30 32 2e 31 58
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=14): 07 0c 44 45 20 24 08 17 64 05 17 84 03 1e
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=7): 0b 05 06 00 03 8d 5b
WPA: RSN IE in EAPOL-Key - hexdump(len=22): 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 28 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=24): 3d 16 70 0f 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=32): 85 1e 05 00 8f 00 0f 00 ff 03 59 00 61 70 32 37 30 30 2d 72 7a 6b 77 2d 6f 67 35 00 06 00 00 4d
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=8): 96 06 00 40 96 00 0e 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=7): c0 05 01 6a 00 00 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=6): c3 04 02 02 02 02
WPA: WMM Parameter Element - hexdump(len=24): 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
TDLS: TDLS is allowed in the target BSS
TDLS: TDLS channel switch allowed in the target BSS
wlp3s0: Add radio work 'connect'@0x55d8c57cb430
wlp3s0: First radio work item in the queue - schedule start immediately
wlp3s0: Starting radio work 'connect'@0x55d8c57cb430 after 0.000011 second wait
wlp3s0: Trying to associate with f0:7f:06:2a:44:2d (SSID='UniKoeln-802.1X' freq=5560 MHz)
FT: Stored MDIE and FTIE from (Re)Association Response - hexdump(len=0):
wlp3s0: Cancelling scan request
wlp3s0: WPA: clearing own WPA/RSN IE
wlp3s0: Automatic auth_alg selection: 0x1
RSN: PMKSA cache search - network_ctx=0x55d8c57acff0 try_opportunistic=0
RSN: Search for BSSID f0:7f:06:2a:44:2d
RSN: No PMKSA cache entry found
wlp3s0: RSN: using IEEE 802.11i/D9.0
wlp3s0: WPA: Selected cipher suites: group 16 pairwise 16 key_mgmt 1 proto 2
wlp3s0: WPA: Selected mgmt group cipher 32
wlp3s0: WPA: clearing AP WPA IE
WPA: set AP RSN IE - hexdump(len=22): 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 28 00
wlp3s0: WPA: using GTK CCMP
wlp3s0: WPA: using PTK CCMP
wlp3s0: WPA: using KEY_MGMT 802.1X
wlp3s0: WPA: not using MGMT group cipher
WPA: Set own WPA IE default - hexdump(len=22): 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 00 00
wlp3s0: State: SCANNING -> ASSOCIATING
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
Limit connection to BSSID f0:7f:06:2a:44:2d freq=5560 MHz based on scan results (bssid_set=0)
wlp3s0: set_disable_max_amsdu: -1
wlp3s0: set_ampdu_factor: -1
wlp3s0: set_ampdu_density: -1
wlp3s0: set_disable_ht40: 0
wlp3s0: set_disable_sgi: 0
wlp3s0: set_disable_ldpc: 0
wlp3s0: Determining shared radio frequencies (max len 1)
wlp3s0: Shared frequencies (len=0): completed iteration
wpa_driver_wext_associate
wpa_driver_wext_set_drop_unencrypted
wpa_driver_wext_set_psk
ioctl[SIOCSIWFREQ]: Device or resource busy
wlp3s0: Association request to the driver failed
wlp3s0: Setting authentication timeout: 5 sec 0 usec
EAPOL: External notification - EAP success=0
EAPOL: External notification - EAP fail=0
EAPOL: External notification - portControl=Auto
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b1a len=16
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b06 len=12
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b1a len=31
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b19 len=16
wlp3s0: Event SCAN_RESULTS (3) received
Scan results did not fit - trying larger buffer (8192 bytes)
Scan results did not fit - trying larger buffer (16384 bytes)
Scan results did not fit - trying larger buffer (32768 bytes)
Received 21678 bytes of scan results (41 BSSes)
wlp3s0: BSS: Start scan result update 2
wlp3s0: BSS: Add new id 37 BSSID 2c:3f:38:58:1f:7c SSID 'UniKoeln-802.1X'
wlp3s0: BSS: Add new id 38 BSSID 2c:3f:38:58:1f:7b SSID 'eduroam'
wlp3s0: BSS: Add new id 39 BSSID 2c:3f:38:58:1f:7a SSID 'UniKoeln-WEB'
wlp3s0: BSS: Add new id 40 BSSID 2c:3f:38:58:15:e5 SSID 'UniKoeln-WEB'
BSS: last_scan_res_used=41/64
wlp3s0: New scan results available (own=0 ext=0)
wlp3s0: Selecting BSS from priority group 1
wlp3s0: 0: f0:7f:06:2a:44:2d ssid='UniKoeln-802.1X' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-61
wlp3s0:    selected based on RSN IE
wlp3s0:    selected BSS f0:7f:06:2a:44:2d ssid='UniKoeln-802.1X'
wlp3s0: Considering connect request: reassociate: 0  selected: f0:7f:06:2a:44:2d  bssid: 00:00:00:00:00:00  pending: f0:7f:06:2a:44:2d  wpa_state: ASSOCIATING  ssid=0x55d8c57acff0  current_ssid=0x55d8c57acff0
wlp3s0: Already associated or trying to connect with the selected AP
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
wlp3s0: Authentication with f0:7f:06:2a:44:2d timed out.
Added BSSID f0:7f:06:2a:44:2d into blacklist
TDLS: Remove peers on disassociation
wlp3s0: WPA: Clear old PMK and PTK
wlp3s0: Request to deauthenticate - bssid=00:00:00:00:00:00 pending_bssid=f0:7f:06:2a:44:2d reason=3 state=ASSOCIATING
TDLS: Tear down peers
wpa_driver_wext_deauthenticate
wlp3s0: Event DEAUTH (12) received
wlp3s0: Deauthentication notification
wlp3s0:  * reason 3 (locally generated)
Deauthentication frame IE(s) - hexdump(len=0): [NULL]
wlp3s0: CTRL-EVENT-DISCONNECTED bssid=f0:7f:06:2a:44:2d reason=3 locally_generated=1
wlp3s0: Auto connect enabled: try to reconnect (wps=0/0 wpa_state=5)
wlp3s0: Setting scan request: 0.100000 sec
wlp3s0: Radio work 'connect'@0x55d8c57cb430 done in 5.089540 seconds
BSSID f0:7f:06:2a:44:2d blacklist count incremented to 2
wlp3s0: Blacklist count 2 --> request scan in 500 ms
wlp3s0: Ignore new scan request for 0.500000 sec since an earlier request is scheduled to trigger sooner
TDLS: Remove peers on disassociation
wlp3s0: WPA: Clear old PMK and PTK
wlp3s0: Disconnect event - remove keys
wlp3s0: State: ASSOCIATING -> DISCONNECTED
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
EAPOL: External notification - portEnabled=0
EAPOL: External notification - portValid=0
wlp3s0: State: DISCONNECTED -> DISCONNECTED
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
EAPOL: External notification - portEnabled=0
EAPOL: External notification - portValid=0
wlp3s0: Ignore new scan request for 1.000000 sec since an earlier request is scheduled to trigger sooner
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b1a len=16
wlp3s0: State: DISCONNECTED -> SCANNING
Scan SSID - hexdump_ascii(len=15):
     55 6e 69 4b 6f 65 6c 6e 2d 38 30 32 2e 31 58      UniKoeln-802.1X 
wlp3s0: Starting AP scan for specific SSID: UniKoeln-802.1X
wlp3s0: Add radio work 'scan'@0x55d8c57cb430
wlp3s0: First radio work item in the queue - schedule start immediately
wlp3s0: Starting radio work 'scan'@0x55d8c57cb430 after 0.000007 second wait
Scan requested (ret=0) - scan timeout 30 seconds
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b19 len=16
wlp3s0: Event SCAN_RESULTS (3) received
Scan results did not fit - trying larger buffer (8192 bytes)
Scan results did not fit - trying larger buffer (16384 bytes)
Scan results did not fit - trying larger buffer (32768 bytes)
Received 22207 bytes of scan results (42 BSSes)
wlp3s0: BSS: Start scan result update 3
wlp3s0: BSS: Add new id 41 BSSID 2c:3f:38:58:15:e3 SSID 'UniKoeln-802.1X'
BSS: last_scan_res_used=42/64
wlp3s0: New scan results available (own=0 ext=0)
wlp3s0: Radio work 'scan'@0x55d8c57cb430 done in 4.684136 seconds
wlp3s0: Selecting BSS from priority group 1
wlp3s0: 0: f0:7f:06:2a:44:2d ssid='UniKoeln-802.1X' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-61
wlp3s0:    skip - blacklisted (count=2 limit=0)
wlp3s0: 1: f0:7f:06:2a:44:2e ssid='eduroam' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-62
wlp3s0:    skip - SSID mismatch
wlp3s0: 2: f0:7f:06:20:04:ae ssid='eduroam' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-69
wlp3s0:    skip - SSID mismatch
wlp3s0: 3: f0:7f:06:20:04:ad ssid='UniKoeln-802.1X' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-69
wlp3s0:    selected based on RSN IE
wlp3s0:    selected BSS f0:7f:06:20:04:ad ssid='UniKoeln-802.1X'
wlp3s0: Considering connect request: reassociate: 1  selected: f0:7f:06:20:04:ad  bssid: 00:00:00:00:00:00  pending: 00:00:00:00:00:00  wpa_state: SCANNING  ssid=0x55d8c57acff0  current_ssid=(nil)
wlp3s0: Request association with f0:7f:06:20:04:ad
wlp3s0: Re-association to the same ESS
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=17): 00 0f 55 6e 69 4b 6f 65 6c 6e 2d 38 30 32 2e 31 58
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=14): 07 0c 44 45 20 24 08 17 64 05 17 84 03 1e
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=7): 0b 05 01 00 08 8d 5b
WPA: RSN IE in EAPOL-Key - hexdump(len=22): 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 28 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=24): 3d 16 40 0f 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=32): 85 1e 02 00 8f 00 0f 00 ff 03 59 00 61 70 32 37 30 30 2d 72 7a 6b 77 2d 6f 67 35 00 01 00 00 4d
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=8): 96 06 00 40 96 00 0c 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=7): c0 05 01 3a 00 00 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=6): c3 04 02 02 02 02
WPA: WMM Parameter Element - hexdump(len=24): 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
TDLS: TDLS is allowed in the target BSS
TDLS: TDLS channel switch allowed in the target BSS
wlp3s0: Add radio work 'connect'@0x55d8c57cb430
wlp3s0: First radio work item in the queue - schedule start immediately
wlp3s0: Starting radio work 'connect'@0x55d8c57cb430 after 0.000010 second wait
wlp3s0: Trying to associate with f0:7f:06:20:04:ad (SSID='UniKoeln-802.1X' freq=5320 MHz)
FT: Stored MDIE and FTIE from (Re)Association Response - hexdump(len=0):
wlp3s0: Cancelling scan request
wlp3s0: WPA: clearing own WPA/RSN IE
wlp3s0: Automatic auth_alg selection: 0x1
RSN: PMKSA cache search - network_ctx=0x55d8c57acff0 try_opportunistic=0
RSN: Search for BSSID f0:7f:06:20:04:ad
RSN: No PMKSA cache entry found
wlp3s0: RSN: using IEEE 802.11i/D9.0
wlp3s0: WPA: Selected cipher suites: group 16 pairwise 16 key_mgmt 1 proto 2
wlp3s0: WPA: Selected mgmt group cipher 32
wlp3s0: WPA: clearing AP WPA IE
WPA: set AP RSN IE - hexdump(len=22): 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 28 00
wlp3s0: WPA: using GTK CCMP
wlp3s0: WPA: using PTK CCMP
wlp3s0: WPA: using KEY_MGMT 802.1X
wlp3s0: WPA: not using MGMT group cipher
WPA: Set own WPA IE default - hexdump(len=22): 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 00 00
wlp3s0: State: SCANNING -> ASSOCIATING
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
Limit connection to BSSID f0:7f:06:20:04:ad freq=5320 MHz based on scan results (bssid_set=0)
wlp3s0: set_disable_max_amsdu: -1
wlp3s0: set_ampdu_factor: -1
wlp3s0: set_ampdu_density: -1
wlp3s0: set_disable_ht40: 0
wlp3s0: set_disable_sgi: 0
wlp3s0: set_disable_ldpc: 0
wlp3s0: Determining shared radio frequencies (max len 1)
wlp3s0: Shared frequencies (len=0): completed iteration
wpa_driver_wext_associate
wpa_driver_wext_set_drop_unencrypted
wpa_driver_wext_set_psk
ioctl[SIOCSIWFREQ]: Device or resource busy
wlp3s0: Association request to the driver failed
wlp3s0: Setting authentication timeout: 5 sec 0 usec
EAPOL: External notification - EAP success=0
EAPOL: External notification - EAP fail=0
EAPOL: External notification - portControl=Auto
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b1a len=16
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b06 len=12
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b1a len=31
l2_packet_receive: src=f0:7f:06:20:04:ad len=65
wlp3s0: RX EAPOL from f0:7f:06:20:04:ad
wlp3s0: Not associated - Delay processing of received EAPOL frame (state=ASSOCIATING bssid=00:00:00:00:00:00)
RTM_NEWLINK: operstate=0 ifi_flags=0x11003 ([UP][LOWER_UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
RTM_NEWLINK: operstate=0 ifi_flags=0x11003 ([UP][LOWER_UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8c08 len=164
AssocResp IE wireless event - hexdump(len=148): 01 06 18 24 b0 48 60 6c 2d 1a ee 19 1b ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3d 16 40 0f 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 00 10 00 00 00 40 00 40 bf 0c b2 79 83 0f ea ff 00 00 ea ff 00 00 c0 05 01 3a 00 00 00 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00 dd 1d 00 40 96 0c 01 86 f2 8f 9d 7c 3e 51 01 00 00 18 83 00 00 00 00 d8 8e 73 c4 56 41 c0 46
RTM_NEWLINK: operstate=0 ifi_flags=0x11003 ([UP][LOWER_UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b15 len=24
Wireless event: new AP: f0:7f:06:20:04:ad
wlp3s0: Event ASSOCINFO (4) received
wlp3s0: Association info event
resp_ies - hexdump(len=148): 01 06 18 24 b0 48 60 6c 2d 1a ee 19 1b ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3d 16 40 0f 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 00 10 00 00 00 40 00 40 bf 0c b2 79 83 0f ea ff 00 00 ea ff 00 00 c0 05 01 3a 00 00 00 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00 dd 1d 00 40 96 0c 01 86 f2 8f 9d 7c 3e 51 01 00 00 18 83 00 00 00 00 d8 8e 73 c4 56 41 c0 46
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=24): 3d 16 40 0f 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=7): c0 05 01 3a 00 00 00
WPA: WMM Parameter Element - hexdump(len=24): 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
FT: Stored MDIE and FTIE from (Re)Association Response - hexdump(len=0):
wlp3s0: Event ASSOC (0) received
wlp3s0: State: ASSOCIATING -> ASSOCIATED
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
wlp3s0: Associated with 00:00:00:00:00:00
wlp3s0: WPA: Association event - clear replay counter
wlp3s0: WPA: Clear old PTK
TDLS: Remove peers on association
EAPOL: External notification - portEnabled=0
EAPOL: External notification - portValid=0
EAPOL: External notification - portEnabled=1
EAPOL: SUPP_PAE entering state CONNECTING
EAPOL: enable timer tick
EAPOL: SUPP_BE entering state IDLE
EAP: EAP entering state INITIALIZE
EAP: EAP entering state IDLE
wlp3s0: Setting authentication timeout: 10 sec 0 usec
wlp3s0: Cancelling scan request
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b15 len=24
Wireless event: new AP: 00:00:00:00:00:00
wlp3s0: Event DISASSOC (1) received
wlp3s0: Disassociation notification
wlp3s0: CTRL-EVENT-DISCONNECTED bssid=f0:7f:06:20:04:ad reason=0
wlp3s0: Auto connect enabled: try to reconnect (wps=0/0 wpa_state=6)
wlp3s0: Setting scan request: 0.100000 sec
wlp3s0: Radio work 'connect'@0x55d8c57cb430 done in 0.056241 seconds
Added BSSID f0:7f:06:20:04:ad into blacklist
wlp3s0: Another BSS in this ESS has been seen; try it next
BSSID f0:7f:06:20:04:ad blacklist count incremented to 2
wlp3s0: Blacklist count 1 --> request scan in 100 ms
wlp3s0: Ignore new scan request for 0.100000 sec since an earlier request is scheduled to trigger sooner
TDLS: Remove peers on disassociation
wlp3s0: WPA: Clear old PMK and PTK
wlp3s0: Disconnect event - remove keys
wlp3s0: State: ASSOCIATED -> DISCONNECTED
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
EAPOL: External notification - portEnabled=0
EAPOL: SUPP_PAE entering state DISCONNECTED
EAPOL: Supplicant port status: Unauthorized
EAPOL: SUPP_BE entering state INITIALIZE
EAP: EAP entering state DISABLED
EAPOL: External notification - portValid=0
wlp3s0: State: DISCONNECTED -> SCANNING
wlp3s0: Starting AP scan for wildcard SSID
wlp3s0: Optimize scan based on previously generated frequency list
wlp3s0: Add radio work 'scan'@0x55d8c57cb430
wlp3s0: First radio work item in the queue - schedule start immediately
wlp3s0: Starting radio work 'scan'@0x55d8c57cb430 after 0.000006 second wait
Scan requested (ret=0) - scan timeout 30 seconds
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
EAPOL: startWhen --> 0
EAPOL: disable timer tick
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b19 len=16
wlp3s0: Event SCAN_RESULTS (3) received
Scan results did not fit - trying larger buffer (8192 bytes)
Scan results did not fit - trying larger buffer (16384 bytes)
Scan results did not fit - trying larger buffer (32768 bytes)
Received 22203 bytes of scan results (42 BSSes)
wlp3s0: BSS: Start scan result update 4
BSS: last_scan_res_used=42/64
wlp3s0: New scan results available (own=0 ext=0)
wlp3s0: Radio work 'scan'@0x55d8c57cb430 done in 4.685224 seconds
wlp3s0: Selecting BSS from priority group 1
wlp3s0: 0: f0:7f:06:2a:44:2e ssid='eduroam' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-61
wlp3s0:    skip - SSID mismatch
wlp3s0: 1: f0:7f:06:2a:44:2d ssid='UniKoeln-802.1X' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-61
wlp3s0:    skip - blacklisted (count=2 limit=0)
wlp3s0: 2: f0:7f:06:20:04:ad ssid='UniKoeln-802.1X' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-67
wlp3s0:    skip - blacklisted (count=2 limit=0)
wlp3s0: 3: f0:7f:06:20:04:ae ssid='eduroam' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-68
wlp3s0:    skip - SSID mismatch
wlp3s0: 4: f0:7f:06:32:50:8c ssid='UniKoeln-802.1X' wpa_ie_len=0 rsn_ie_len=20 caps=0x11 level=-70
wlp3s0:    selected based on RSN IE
wlp3s0:    selected BSS f0:7f:06:32:50:8c ssid='UniKoeln-802.1X'
wlp3s0: Considering connect request: reassociate: 0  selected: f0:7f:06:32:50:8c  bssid: 00:00:00:00:00:00  pending: 00:00:00:00:00:00  wpa_state: SCANNING  ssid=0x55d8c57acff0  current_ssid=(nil)
wlp3s0: Request association with f0:7f:06:32:50:8c
wlp3s0: Re-association to the same ESS
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=17): 00 0f 55 6e 69 4b 6f 65 6c 6e 2d 38 30 32 2e 31 58
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=14): 07 0c 44 45 20 24 08 17 64 05 17 84 03 1e
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=7): 0b 05 00 00 01 8d 5b
WPA: RSN IE in EAPOL-Key - hexdump(len=22): 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 28 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=24): 3d 16 24 0d 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=32): 85 1e 02 00 8f 00 0f 00 ff 03 59 00 61 70 32 37 30 30 2d 72 7a 6b 77 2d 6f 67 35 00 00 00 00 4d
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=8): 96 06 00 40 96 00 0c 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=7): c0 05 01 2a 00 00 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=6): c3 04 02 02 02 02
WPA: WMM Parameter Element - hexdump(len=24): 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
TDLS: TDLS is allowed in the target BSS
TDLS: TDLS channel switch allowed in the target BSS
wlp3s0: Add radio work 'connect'@0x55d8c57cb430
wlp3s0: First radio work item in the queue - schedule start immediately
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
RSN: Ignored PMKID candidate without preauth flag
wlp3s0: Starting radio work 'connect'@0x55d8c57cb430 after 0.000072 second wait
wlp3s0: Trying to associate with f0:7f:06:32:50:8c (SSID='UniKoeln-802.1X' freq=5180 MHz)
FT: Stored MDIE and FTIE from (Re)Association Response - hexdump(len=0):
wlp3s0: Cancelling scan request
wlp3s0: WPA: clearing own WPA/RSN IE
wlp3s0: Automatic auth_alg selection: 0x1
RSN: PMKSA cache search - network_ctx=0x55d8c57acff0 try_opportunistic=0
RSN: Search for BSSID f0:7f:06:32:50:8c
RSN: No PMKSA cache entry found
wlp3s0: RSN: using IEEE 802.11i/D9.0
wlp3s0: WPA: Selected cipher suites: group 16 pairwise 16 key_mgmt 1 proto 2
wlp3s0: WPA: Selected mgmt group cipher 32
wlp3s0: WPA: clearing AP WPA IE
WPA: set AP RSN IE - hexdump(len=22): 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 28 00
wlp3s0: WPA: using GTK CCMP
wlp3s0: WPA: using PTK CCMP
wlp3s0: WPA: using KEY_MGMT 802.1X
wlp3s0: WPA: not using MGMT group cipher
WPA: Set own WPA IE default - hexdump(len=22): 30 14 01 00 00 0f ac 04 01 00 00 0f ac 04 01 00 00 0f ac 01 00 00
wlp3s0: State: SCANNING -> ASSOCIATING
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
Limit connection to BSSID f0:7f:06:32:50:8c freq=5180 MHz based on scan results (bssid_set=0)
wlp3s0: set_disable_max_amsdu: -1
wlp3s0: set_ampdu_factor: -1
wlp3s0: set_ampdu_density: -1
wlp3s0: set_disable_ht40: 0
wlp3s0: set_disable_sgi: 0
wlp3s0: set_disable_ldpc: 0
wlp3s0: Determining shared radio frequencies (max len 1)
wlp3s0: Shared frequencies (len=0): completed iteration
wpa_driver_wext_associate
wpa_driver_wext_set_drop_unencrypted
wpa_driver_wext_set_psk
ioctl[SIOCSIWFREQ]: Device or resource busy
wlp3s0: Association request to the driver failed
wlp3s0: Setting authentication timeout: 5 sec 0 usec
EAPOL: External notification - EAP success=0
EAPOL: External notification - EAP fail=0
EAPOL: External notification - portControl=Auto
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b1a len=16
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b06 len=12
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b1a len=31
l2_packet_receive: src=f0:7f:06:32:50:8c len=65
wlp3s0: RX EAPOL from f0:7f:06:32:50:8c
wlp3s0: Not associated - Delay processing of received EAPOL frame (state=ASSOCIATING bssid=00:00:00:00:00:00)
RTM_NEWLINK: operstate=0 ifi_flags=0x11003 ([UP][LOWER_UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
RTM_NEWLINK: operstate=0 ifi_flags=0x11003 ([UP][LOWER_UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8c08 len=164
AssocResp IE wireless event - hexdump(len=148): 01 06 18 24 b0 48 60 6c 2d 1a ee 19 1b ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3d 16 24 0d 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 00 10 00 00 00 40 00 40 bf 0c b2 79 83 0f ea ff 00 00 ea ff 00 00 c0 05 01 2a 00 00 00 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00 dd 1d 00 40 96 0c 01 ac 4f 08 ae 7c 3e 51 01 00 00 40 a0 00 00 00 00 e6 73 02 24 fa 57 8a a2
RTM_NEWLINK: operstate=0 ifi_flags=0x11003 ([UP][LOWER_UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b15 len=24
Wireless event: new AP: f0:7f:06:32:50:8c
wlp3s0: Event ASSOCINFO (4) received
wlp3s0: Association info event
resp_ies - hexdump(len=148): 01 06 18 24 b0 48 60 6c 2d 1a ee 19 1b ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3d 16 24 0d 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 00 10 00 00 00 40 00 40 bf 0c b2 79 83 0f ea ff 00 00 ea ff 00 00 c0 05 01 2a 00 00 00 dd 18 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00 dd 1d 00 40 96 0c 01 ac 4f 08 ae 7c 3e 51 01 00 00 40 a0 00 00 00 00 e6 73 02 24 fa 57 8a a2
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=24): 3d 16 24 0d 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
WPA: Unrecognized EAPOL-Key Key Data IE - hexdump(len=7): c0 05 01 2a 00 00 00
WPA: WMM Parameter Element - hexdump(len=24): 00 50 f2 02 01 01 80 00 03 a4 00 00 27 a4 00 00 42 43 5e 00 62 32 2f 00
FT: Stored MDIE and FTIE from (Re)Association Response - hexdump(len=0):
wlp3s0: Event ASSOC (0) received
wlp3s0: State: ASSOCIATING -> ASSOCIATED
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
wlp3s0: Associated to a new BSS: BSSID=f0:7f:06:32:50:8c
wlp3s0: Associated with f0:7f:06:32:50:8c
wlp3s0: WPA: Association event - clear replay counter
wlp3s0: WPA: Clear old PTK
TDLS: Remove peers on association
EAPOL: External notification - portEnabled=0
EAPOL: External notification - portValid=0
EAPOL: External notification - portEnabled=1
EAPOL: SUPP_PAE entering state CONNECTING
EAPOL: enable timer tick
EAPOL: SUPP_BE entering state IDLE
EAP: EAP entering state INITIALIZE
EAP: EAP entering state IDLE
wlp3s0: Setting authentication timeout: 10 sec 0 usec
wlp3s0: Cancelling scan request
wlp3s0: Process pending EAPOL frame that was received just before association notification
wlp3s0: RX EAPOL from f0:7f:06:32:50:8c
wlp3s0: Setting authentication timeout: 70 sec 0 usec
EAPOL: Received EAP-Packet frame
EAPOL: SUPP_PAE entering state RESTART
EAP: EAP entering state INITIALIZE
EAP: EAP entering state IDLE
EAPOL: SUPP_PAE entering state AUTHENTICATING
EAPOL: SUPP_BE entering state REQUEST
EAPOL: getSuppRsp
EAP: EAP entering state RECEIVED
EAP: Received EAP-Request id=1 method=1 vendor=0 vendorMethod=0
EAP: EAP entering state IDENTITY
wlp3s0: CTRL-EVENT-EAP-STARTED EAP authentication started
EAP: Status notification: started (param=)
EAP: EAP-Request Identity data - hexdump_ascii(len=56):
     00 6e 65 74 77 6f 72 6b 69 64 3d 55 6e 69 4b 6f   _networkid=UniKo
     65 6c 6e 2d 38 30 32 2e 31 58 2c 6e 61 73 69 64   eln-802.1X,nasid
     3d 77 69 73 6d 2d 70 68 79 73 69 6b 2d 31 2c 70   =wism-physik-1,p
     6f 72 74 69 64 3d 31 33                           ortid=13        
EAP: using anonymous identity - hexdump_ascii(len=22):
     61 6e 6f 6e 79 6d 6f 75 73 40 75 6e 69 2d 6b 6f   anonymous@uni-ko
     65 6c 6e 2e 64 65                                 eln.de          
EAP: EAP entering state SEND_RESPONSE
EAP: EAP entering state IDLE
EAPOL: SUPP_BE entering state RESPONSE
EAPOL: txSuppRsp
TX EAPOL: dst=f0:7f:06:32:50:8c
EAPOL: SUPP_BE entering state RECEIVE
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
Wireless event: cmd=0x8b15 len=24
Wireless event: new AP: 00:00:00:00:00:00
wlp3s0: Event DISASSOC (1) received
wlp3s0: Disassociation notification
wlp3s0: CTRL-EVENT-DISCONNECTED bssid=f0:7f:06:32:50:8c reason=0
wlp3s0: Auto connect enabled: try to reconnect (wps=0/0 wpa_state=6)
wlp3s0: Setting scan request: 0.100000 sec
wlp3s0: Radio work 'connect'@0x55d8c57cb430 done in 0.051813 seconds
Added BSSID f0:7f:06:32:50:8c into blacklist
wlp3s0: Another BSS in this ESS has been seen; try it next
BSSID f0:7f:06:32:50:8c blacklist count incremented to 2
wlp3s0: Blacklist count 1 --> request scan in 100 ms
wlp3s0: Ignore new scan request for 0.100000 sec since an earlier request is scheduled to trigger sooner
TDLS: Remove peers on disassociation
wlp3s0: WPA: Clear old PMK and PTK
wlp3s0: Disconnect event - remove keys
wlp3s0: State: ASSOCIATED -> DISCONNECTED
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
EAPOL: External notification - portEnabled=0
EAPOL: SUPP_PAE entering state DISCONNECTED
EAPOL: Supplicant port status: Unauthorized
EAPOL: SUPP_BE entering state INITIALIZE
EAP: EAP entering state DISABLED
EAPOL: External notification - portValid=0
wlp3s0: State: DISCONNECTED -> SCANNING
Scan SSID - hexdump_ascii(len=15):
     55 6e 69 4b 6f 65 6c 6e 2d 38 30 32 2e 31 58      UniKoeln-802.1X 
wlp3s0: Starting AP scan for wildcard SSID (Interleave with specific)
wlp3s0: Optimize scan based on previously generated frequency list
wlp3s0: Add radio work 'scan'@0x55d8c57cb430
wlp3s0: First radio work item in the queue - schedule start immediately
wlp3s0: Starting radio work 'scan'@0x55d8c57cb430 after 0.000006 second wait
Scan requested (ret=0) - scan timeout 30 seconds
RTM_NEWLINK: operstate=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK, IFLA_IFNAME: Interface 'wlp3s0' added
WEXT: if_removed already cleared - ignore event
EAPOL: startWhen --> 0
EAPOL: disable timer tick
^Cwlp3s0: Removing interface wlp3s0
wlp3s0: Request to deauthenticate - bssid=00:00:00:00:00:00 pending_bssid=00:00:00:00:00:00 reason=3 state=SCANNING
TDLS: Tear down peers
wlp3s0: State: SCANNING -> DISCONNECTED
wpa_driver_wext_set_operstate: operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=3 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
EAPOL: External notification - portEnabled=0
EAPOL: External notification - portValid=0
wpa_driver_wext_set_countermeasures
wlp3s0: WPA: Clear old PMK and PTK
Removed BSSID f0:7f:06:32:50:8c from blacklist (clear)
Removed BSSID f0:7f:06:20:04:ad from blacklist (clear)
Removed BSSID f0:7f:06:2a:44:2d from blacklist (clear)
wlp3s0: BSS: Remove id 1 BSSID f0:7f:06:2a:44:2e SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 0 BSSID f0:7f:06:2a:44:2d SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 3 BSSID f0:7f:06:20:04:ad SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 2 BSSID f0:7f:06:20:04:ae SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 5 BSSID f0:7f:06:32:50:8c SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 4 BSSID f0:7f:06:32:50:8b SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 10 BSSID a4:18:75:42:6e:2d SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 7 BSSID a4:18:75:42:6e:22 SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 6 BSSID a4:18:75:42:6e:21 SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 8 BSSID f0:7f:06:2a:44:22 SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 9 BSSID f0:7f:06:2a:44:21 SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 11 BSSID a4:18:75:42:6e:2e SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 12 BSSID f0:7f:06:2a:36:1e SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 14 BSSID f0:7f:06:2a:36:1d SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 21 BSSID 2c:3f:38:58:15:ec SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 16 BSSID f0:7f:06:10:9f:0b SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 20 BSSID 2c:3f:38:58:15:eb SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 15 BSSID f0:7f:06:10:9f:0c SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 19 BSSID f0:7f:06:32:50:84 SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 13 BSSID f0:7f:06:2a:36:12 SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 18 BSSID f0:7f:06:2a:36:11 SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 41 BSSID 2c:3f:38:58:15:e3 SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 17 BSSID f0:7f:06:32:50:83 SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 37 BSSID 2c:3f:38:58:1f:7c SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 24 BSSID 2c:3f:38:58:15:e4 SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 38 BSSID 2c:3f:38:58:1f:7b SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 23 BSSID 2c:3f:38:58:1f:74 SSID 'eduroam' due to wpa_bss_flush
wlp3s0: BSS: Remove id 22 BSSID 2c:3f:38:58:1f:73 SSID 'UniKoeln-802.1X' due to wpa_bss_flush
wlp3s0: BSS: Remove id 25 BSSID f0:7f:06:2a:44:2c SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 26 BSSID f0:7f:06:20:04:ac SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 27 BSSID f0:7f:06:32:50:8a SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 30 BSSID a4:18:75:42:6e:2c SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 28 BSSID a4:18:75:42:6e:23 SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 29 BSSID f0:7f:06:2a:44:23 SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 32 BSSID f0:7f:06:2a:36:1c SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 36 BSSID 2c:3f:38:58:15:ea SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 33 BSSID f0:7f:06:10:9f:0a SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 34 BSSID f0:7f:06:32:50:85 SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 31 BSSID f0:7f:06:2a:36:13 SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 40 BSSID 2c:3f:38:58:15:e5 SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 39 BSSID 2c:3f:38:58:1f:7a SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: BSS: Remove id 35 BSSID 2c:3f:38:58:1f:75 SSID 'UniKoeln-WEB' due to wpa_bss_flush
wlp3s0: Cancelling scan request
wlp3s0: Cancelling authentication timeout
Remove interface wlp3s0 from radio phy0
wlp3s0: Remove radio work 'scan'@0x55d8c57cb430 (started)
Remove radio phy0
netlink: Operstate: ifindex=3 linkmode=0 (kernel-control), operstate=6 (IF_OPER_UP)
wlp3s0: CTRL-EVENT-TERMINATING 


--rekcebs-a7301e8c-65e8-4290-ba4e-db2f47070059
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--rekcebs-a7301e8c-65e8-4290-ba4e-db2f47070059--

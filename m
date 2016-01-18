Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aL1Fv-0007CL-HJ
 for ath10k@lists.infradead.org; Mon, 18 Jan 2016 04:17:28 +0000
Received: by mail-qg0-x22c.google.com with SMTP id 6so470603741qgy.1
 for <ath10k@lists.infradead.org>; Sun, 17 Jan 2016 20:17:07 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 18 Jan 2016 09:47:06 +0530
Message-ID: <CACS2Gtt=JB1mDVcK2Gg3CPWW_HHRSyu0k7oUca9yB7h5p_Ggsg@mail.gmail.com>
Subject: ATH10K: Firmware is crashing in AP Mode
From: Naveen S <naveensd93@gmail.com>
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

Hi All,

       I have compiled backports ATH10k driver. With this I tried
enabling  a AP using hostapd, AP is coming up. After some time I am
able see some firmware crash, Then AP is going down immediately and it
is coming up after 2 to 3 mins  and sometimes it's not coming up.
        Can anyone tell me what is cause for FW crash and how to fix this?.

[ 4348.378519] ath10k_pci 0000:01:00.0: firmware crashed! (uuid n/a)
[ 4348.384599] ath10k_pci 0000:01:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 10.2.4.70.9-2 api 5 htt 2.1 wmi 5 cal otp max_sta 128
[ 4348.396482] ath10k_pci 0000:01:00.0: debug 1 debugfs 0 tracing 0
dfs 0 testmode 0
[ 4348.405975] ath10k_pci 0000:01:00.0: firmware register dump:
[ 4348.411619] ath10k_pci 0000:01:00.0: [00]: 0x4100016C 0x000015B3
0x009B44BF 0x00955B31
[ 4348.419506] ath10k_pci 0000:01:00.0: [04]: 0x009B44BF 0x00060530
0x00000000 0x00010007
[ 4348.427385] ath10k_pci 0000:01:00.0: [08]: 0x00415068 0x00955A00
0x0040FAA4 0x00000010
[ 4348.435272] ath10k_pci 0000:01:00.0: [12]: 0x00000009 0xFFFFFFFF
0x00958360 0x0095836B
[ 4348.443159] ath10k_pci 0000:01:00.0: [16]: 0x00958080 0x0094085D
0x00000000 0x00000000
[ 4348.451045] ath10k_pci 0000:01:00.0: [20]: 0x409B44BF 0x0040ACE4
0x00000001 0x0000004A
[ 4348.458932] ath10k_pci 0000:01:00.0: [24]: 0x809B2522 0x0040AD44
0x00000000 0xC09B44BF
[ 4348.466810] ath10k_pci 0000:01:00.0: [28]: 0x809B25B0 0x0040AD94
0x0040AE04 0x00400000
[ 4348.474696] ath10k_pci 0000:01:00.0: [32]: 0x809B1CB2 0x0040ADC4
0x00000001 0x0040AE04
[ 4348.482582] ath10k_pci 0000:01:00.0: [36]: 0x809BFB39 0x0040ADE4
0x00411F38 0x00411F5C
[ 4348.490469] ath10k_pci 0000:01:00.0: [40]: 0x809BF33C 0x0040AE04
0x00000001 0x00000000
[ 4348.498356] ath10k_pci 0000:01:00.0: [44]: 0x809BF113 0x0040AEA4
0x0041F7CC 0x00412598
[ 4348.506233] ath10k_pci 0000:01:00.0: [48]: 0x809BEF99 0x0040AEC4
0x0041F7CC 0x00000001
[ 4348.514120] ath10k_pci 0000:01:00.0: [52]: 0x80940F18 0x0040AF14
0x00000011 0x00403AD4
[ 4348.522007] ath10k_pci 0000:01:00.0: [56]: 0x80940EEA 0x0040AF44
0x00400000 0x00000000
[ 4348.609835] ieee80211 phy0: Hardware restart was requested
[ 4348.615327] ------------[ cut here ]------------
[ 4348.620029] WARNING: CPU: 0 PID: 8653 at
/media/freescale/sdd1/Naveen/backports-4.2.6-1/net/mac80211/main.c:255
ieee80211_restart_work+0x38)
[ 4348.634055] ieee80211_restart_work called with hardware scan in progress
[ 4348.640843] Modules linked in: xt_conntrack ipt_MASQUERADE
bluetooth iptable_raw xt_connmark xt_tcpudp xt_mark xt_length
xt_comment xt_mult)
[ 4348.675709] CPU: 0 PID: 8653 Comm: kworker/0:0 Tainted: G
O 3.12.37-rt51+ls1+gaaa395f #1
[ 4348.684701] Workqueue: events ieee80211_restart_work [mac80211]
[ 4348.690664] [<80014948>] (unwind_backtrace+0x0/0xdc) from
[<80010e74>] (show_stack+0x10/0x14)
[ 4348.699338] [<80010e74>] (show_stack+0x10/0x14) from [<80565ecc>]
(dump_stack+0x70/0x8c)
[ 4348.707519] [<80565ecc>] (dump_stack+0x70/0x8c) from [<80020124>]
(warn_slowpath_common+0x60/0x84)
[ 4348.716492] [<80020124>] (warn_slowpath_common+0x60/0x84) from
[<80020174>] (warn_slowpath_fmt+0x2c/0x3c)
[ 4348.726092] [<80020174>] (warn_slowpath_fmt+0x2c/0x3c) from
[<7f086198>] (ieee80211_restart_work+0x38/0x84 [mac80211])
[ 4348.736812] [<7f086198>] (ieee80211_restart_work+0x38/0x84
[mac80211]) from [<800347dc>] (process_one_work+0x224/0x340)
[ 4348.747574] [<800347dc>] (process_one_work+0x224/0x340) from
[<800353c8>] (worker_thread+0x238/0x380)
[ 4348.756857] [<800353c8>] (worker_thread+0x238/0x380) from
[<8003a19c>] (kthread+0x98/0xa0)
[ 4348.765121] [<8003a19c>] (kthread+0x98/0xa0) from [<8000d8d8>]
(ret_from_fork+0x14/0x3c)
[ 4348.773192] ---[ end trace bcbe7994af837485 ]---
[ 4350.180565] ath10k_pci 0000:01:00.0: device successfully recovered


Card: Compex WLE900VX 7AA
Platform: ARM ( Freescale)
Kernel version: 3.12.19
ATH10K version: backports-4.2.6-1
ATH10k Firmwares: firmware-5.bin_10.2.4.70.15-2,
firmware-4.bin_10.2.4.48, firmware-3.bin_10.2.2.39.6-1
firmware-2.bin_10.1.467.3-1
Hostapd version: 2.4


Hostapd configuration file:

##################basic hostapd configurtions##################
country_code=US
interface=wlan1
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0
driver=nl80211
ssid=TESTING_AP
hw_mode=a
channel=36

##################wpa1 security enable############
wpa=1
wpa_passphrase=freescale321
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP TKIP

### IEEE 802.11n
ieee80211n=1
ht_capab=[HT40+][LDPC][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][DSSS_CCK-40]

### IEEE 802.11ac
ieee80211ac=1
vht_oper_chwidth=1
vht_capab=[MAX-MPDU-11454][RXLDPC][SHORT-GI-80][TX-STBC-2BY1][RX-STBC-1][MAX-A-MPDU-LEN-EXP7][RX-ANTENNA-PATTERN][TX-ANTENNA-PATTERN]

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from caladan.freestone.net ([193.5.68.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJ1Nr-0007Kn-HG
 for ath10k@lists.infradead.org; Tue, 12 Jan 2016 16:01:25 +0000
From: Matthias Cramer <cramer@freestone.net>
Subject: Unable to get a Compex WLE600NX working with hostapd
Message-ID: <56952343.5050908@freestone.net>
Date: Tue, 12 Jan 2016 17:01:07 +0100
MIME-Version: 1.0
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

Hi All

I already spent several hours trying to build an AP with hostapd and a Compex WLE600NX card.
I have found several examples which seemed to work for the author on this mailing list but all more than 1 year old.

My system runs Debian unstable with kernel 4.3.0-1-amd64 (stable and testing do not have the ath10k firmware).
hostapd v2.3

my config looks like this (is one of the configs I found here with very small changes):

----------------------------------------------------------------------------------------

### hostapd configuration file
ctrl_interface=/var/run/hostapd
interface=wlp4s0
driver=nl80211
bridge=br0

### IEEE 802.11
ssid=ath10k
hw_mode=a
channel=0
max_num_sta=128
auth_algs=1
disassoc_low_ack=1

### DFS
ieee80211h=1
ieee80211d=1
country_code=CH

### IEEE 802.11n
ieee80211n=1
ht_capab=[HT40+][LDPC][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][DSSS_CCK-40]

### IEEE 802.11ac
ieee80211ac=1
vht_oper_chwidth=1
vht_capab=[MAX-MPDU-11454][RXLDPC][SHORT-GI-80][TX-STBC-2BY1][RX-STBC-1][MAX-A-MPDU-LEN-EXP7][RX-ANTENNA-PATTERN][TX-ANTENNA-PATTERN]

### WPA/IEEE 802.11i
wpa=2
wpa_key_mgmt=WPA-PSK
wpa_passphrase=12345678
wpa_pairwise=CCMP

### Wi-Fi Protected Setup (WPS)
wps_state=2
ap_setup_locked=0
wps_pin_requests=/var/run/hostapd_wps_pin_requests
device_name=QCA Access Point
manufacturer=Qualcomm Atheros
device_type=6-0050F204-1
config_methods=virtual_push_button physical_push_button label keypad virtual_display
pbc_in_m1=1
ap_pin=12345670
upnp_iface=br-lan
eap_server=1

### hostapd event logger configuration
logger_syslog=127
logger_syslog_level=2
logger_stdout=127
logger_stdout_level=2

### WMM
wmm_enabled=1
uapsd_advertisement_enabled=1
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

----------------------------------------------------------------------------------------

This is the output if I start hostapd form the console:

Configuration file: hostapd.conf
wlp4s0: interface state UNINITIALIZED->COUNTRY_UPDATE
ACS: Automatic channel selection started, this may take a bit
wlp4s0: interface state COUNTRY_UPDATE->ACS
wlp4s0: ACS-STARTED
wlp4s0: ACS-COMPLETED freq=5260 channel=52
wlp4s0: interface state ACS->HT_SCAN
wlp4s0: interface state HT_SCAN->DFS
wlp4s0: DFS-CAC-START freq=5260 chan=52 sec_chan=1, width=1, seg0=58, seg1=0, cac_time=0s
DFS start_dfs_cac() failed, -1
Interface initialization failed
wlp4s0: interface state DFS->DISABLED
wlp4s0: AP-DISABLED
hostapd_free_hapd_data: Interface wlp4s0 wasn't started

I also tried several different configs all with no usable result.

Any guidance is very welcome.

Regards

  Matthias

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

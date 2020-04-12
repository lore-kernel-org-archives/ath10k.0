Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from forward105o.mail.yandex.net ([2a02:6b8:0:1a2d::608])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNYdH-0003sM-7p
 for ath10k@lists.infradead.org; Sun, 12 Apr 2020 09:10:30 +0000
Received: from mxback16j.mail.yandex.net (mxback16j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::92])
 by forward105o.mail.yandex.net (Yandex) with ESMTP id 894B34201236
 for <ath10k@lists.infradead.org>; Sun, 12 Apr 2020 12:10:17 +0300 (MSK)
From: svp <svpm@yandex.ru>
Subject: Compex WLE600VX AP mode 5GHz doesn't work since kernel 5.6
Message-ID: <5971a327-d11a-35e6-8295-8dfb8ae3a434@yandex.ru>
Date: Sun, 12 Apr 2020 12:10:15 +0300
MIME-Version: 1.0
Content-Language: ru-RU
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi!
I need help with my softAP installation.
Compex WLE600VX miniPCIe card can't start at 5GHz AP mode after update to kernel 
5.6 on ArchLinux
With kernel 5.5.x and LTS all is OK
Some logs and details is in this ArchLinux forum topic 
https://bbs.archlinux.org/viewtopic.php?id=254535

 >lspci -k
06:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless 
Network Adapter
         Kernel driver in use: ath10k_pci
         Kernel modules: ath10k_pci

 >iw list | grep -A 15 Frequencies:
                 Frequencies:
                         * 2412 MHz [1] (20.0 dBm)
                         * 2417 MHz [2] (20.0 dBm)
                         * 2422 MHz [3] (20.0 dBm)
                         * 2427 MHz [4] (20.0 dBm)
                         * 2432 MHz [5] (20.0 dBm)
                         * 2437 MHz [6] (20.0 dBm)
                         * 2442 MHz [7] (20.0 dBm)
                         * 2447 MHz [8] (20.0 dBm)
                         * 2452 MHz [9] (20.0 dBm)
                         * 2457 MHz [10] (20.0 dBm)
                         * 2462 MHz [11] (20.0 dBm)
                         * 2467 MHz [12] (disabled)
                         * 2472 MHz [13] (disabled)
                         * 2484 MHz [14] (disabled)
         Band 2:
--
                 Frequencies:
                         * 5180 MHz [36] (20.0 dBm) (no IR)
                         * 5200 MHz [40] (20.0 dBm) (no IR)
                         * 5220 MHz [44] (20.0 dBm) (no IR)
                         * 5240 MHz [48] (20.0 dBm) (no IR)
                         * 5260 MHz [52] (20.0 dBm) (no IR, radar detection)
                         * 5280 MHz [56] (20.0 dBm) (no IR, radar detection)
                         * 5300 MHz [60] (20.0 dBm) (no IR, radar detection)
                         * 5320 MHz [64] (20.0 dBm) (no IR, radar detection)
                         * 5500 MHz [100] (disabled)
                         * 5520 MHz [104] (disabled)
                         * 5540 MHz [108] (disabled)
                         * 5560 MHz [112] (disabled)
                         * 5580 MHz [116] (disabled)
                         * 5600 MHz [120] (disabled)
                         * 5620 MHz [124] (disabled)

 >iw reg get
global
country RU: DFS-ETSI
         (2402 - 2482 @ 40), (N/A, 20), (N/A)
         (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
         (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
         (5650 - 5730 @ 80), (N/A, 30), (0 ms), DFS
         (5735 - 5835 @ 80), (N/A, 30), (N/A)
         (57000 - 66000 @ 2160), (N/A, 40), (N/A)

 >hostapd.conf

interface=wlan0
driver=nl80211
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0
ssid=NNN
### IEEE 802.11
hw_mode=a
channel=44
max_num_sta=128
auth_algs=1
disassoc_low_ack=1
### DFS
ieee80211h=1
ieee80211d=1
country_code=RU
### IEEE 802.11n
ieee80211n=1
ht_capab=[HT40+][LDPC][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][DSSS_CCK-40]
### IEEE 802.11ac
ieee80211ac=1
vht_oper_chwidth=1
vht_oper_centr_freq_seg0_idx=42
vht_capab=[MAX-MPDU-11454][RXLDPC][SHORT-GI-80][TX-STBC-2BY1][RX-STBC-1][MAX-A-MPDU-LEN-EXP7][RX-ANTENNA-PATTERN][TX-ANTENNA-PATTERN]
### WPA/IEEE 802.11i
wpa=2
wpa_key_mgmt=SAE WPA-PSK WPA-PSK-SHA256
wpa_passphrase=xxx
wpa_pairwise=CCMP
sae_password=xxx
ieee80211w=1
macaddr_acl=1
accept_mac_file=/etc/hostapd/hostapd.accept
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


Best regards,
Sergey


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

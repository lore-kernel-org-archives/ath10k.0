Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.com ([74.208.4.201])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxynL-0007ch-0p
 for ath10k@lists.infradead.org; Tue, 11 Apr 2017 16:37:32 +0000
MIME-Version: 1.0
Message-ID: <trinity-5628db6a-0db6-4e7d-b472-985db2b06e01-1491928625793@3capp-mailcom-lxa13>
From: "Oleg Kokorin" <ole2mail@mail.com>
Subject: QCA6178 in AP configuration working stable (not just 5 seconds)
Content-Type: multipart/mixed;
 boundary=rehcsedm-0da61a72-b6ec-445d-92f4-82253fb55a66
Date: Tue, 11 Apr 2017 18:37:05 +0200
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
To: ath10k@lists.infradead.org

--rehcsedm-0da61a72-b6ec-445d-92f4-82253fb55a66
Content-Type: text/plain; charset=UTF-8

hello All

I'm working on stable configuration for QCA6178 working in AP mode.
and would be interested/appreciated to hear from somebody succeeded to make it working.

my config - 
it's linux kernel 4.8 now 
the hostapd is in use.

during continuous scanning state of the card with the 
"while true; do iw dev wlp2s0 info; sleep 2; done"
command,
mode AP appears for a few seconds only.

already tried firmware from:
- official ubuntu
apt-get install --reinstall linux-firmware
- github of Kvalo
https://github.com/kvalo/ath10k-firmware
- github of FireWalkerX
https://github.com/FireWalkerX/ath10k-firmware

AP in G mode seems to be stable
AP in A/AC modes appears only for a few seconds, then switching back to MANAGED

having all sorts of error messages:
kernel: [ 6398.064328] ath10k_pci 0000:02:00.0: failed to enable dynamic BW: -11
kernel: [ 6404.208421] ath10k_pci 0000:02:00.0: could not suspend target (-11)
OR
wpa_supplicant[1060]: nl80211: send_and_recv->nl_recvmsgs failed: -33
OR
kernel: [ 6541.408320] ath10k_pci 0000:02:00.0: firmware crashed! (uuid 4e44d616-2713-44c5-ad80-e9d2994439c5)
kernel: [ 6541.408325] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a3b:2260
kernel: [ 6541.408326] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
kernel: [ 6541.408781] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.2.0-00180-QCARMSWPZ-1 api 4 features wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
kernel: [ 6541.408787] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A crc32 ed5f849a
kernel: [ 6541.408788] ath10k_pci 0000:02:00.0: htt-ver 3.26 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
kernel: [ 6541.891697] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
kernel: [ 6541.891707] ath10k_pci 0000:02:00.0: failed to reset chip: -5
kernel: [ 6541.891708] ath10k_pci 0000:02:00.0: Could not init hif: -5
OR
kernel: [ 6672.998474] IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
sh[14393]: Error for wireless request "Set Mode" (8B06) :
sh[14393]:     SET failed on device wlp2s0 ; Invalid argument.

my attempt to pass config to get more text in syslog failed, seems like nothing passed to the ln80211 driver to let it talk louder:
### hostapd event logger configuration                                           
#logger_syslog=127                                                               
logger_syslog=-1                                                                 
logger_syslog_level=1                                                            
logger_stdout=-1                                                                 
logger_stdout_level=1

attached is hostapd config file.

thanks
Oleg
--rehcsedm-0da61a72-b6ec-445d-92f4-82253fb55a66
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=hostapd.conf

### hostapd configuration file
ctrl_interface=/var/run/hostapd
interface=wlp2s0
driver=nl80211
#bridge=br-lan

### IEEE 802.11
#ssid=SSID_QCA6174
ssid=6174
hw_mode=a
channel=0
max_num_sta=128
auth_algs=1
disassoc_low_ack=1

### DFS
ieee80211h=1
ieee80211d=1
country_code=FR

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
wpa_passphrase=passhase
wpa_pairwise=CCMP

### Wi-Fi Protected Setup (WPS)
#wps_state=2
#ap_setup_locked=0
#wps_pin_requests=/var/run/hostapd_wps_pin_requests
#device_name=QCA Access Point
#manufacturer=Qualcomm Atheros
#device_type=6-0050F204-1
#config_methods=virtual_push_button physical_push_button label keypad virtual_display
#pbc_in_m1=1
#ap_pin=12345670
#upnp_iface=br-lan
#eap_server=1

### hostapd event logger configuration
#logger_syslog=127
logger_syslog=-1
logger_syslog_level=1
logger_stdout=-1
logger_stdout_level=1

### WMM
#wmm_enabled=1
#uapsd_advertisement_enabled=1
#wmm_ac_bk_cwmin=4
#wmm_ac_bk_cwmax=10
#wmm_ac_bk_aifs=7
#wmm_ac_bk_txop_limit=0
#wmm_ac_bk_acm=0
#wmm_ac_be_aifs=3
#wmm_ac_be_cwmin=4
#wmm_ac_be_cwmax=10
#wmm_ac_be_txop_limit=0
#wmm_ac_be_acm=0
#wmm_ac_vi_aifs=2
#wmm_ac_vi_cwmin=3
#wmm_ac_vi_cwmax=4
#wmm_ac_vi_txop_limit=94
#wmm_ac_vi_acm=0
#wmm_ac_vo_aifs=2
#wmm_ac_vo_cwmin=2
#wmm_ac_vo_cwmax=3
#wmm_ac_vo_txop_limit=47
#wmm_ac_vo_acm=0

### TX queue parameters
#tx_queue_data3_aifs=7
#tx_queue_data3_cwmin=15
#tx_queue_data3_cwmax=1023
#tx_queue_data3_burst=0
#tx_queue_data2_aifs=3
#tx_queue_data2_cwmin=15
#tx_queue_data2_cwmax=63
#tx_queue_data2_burst=0
#tx_queue_data1_aifs=1
#tx_queue_data1_cwmin=7
#tx_queue_data1_cwmax=15
#tx_queue_data1_burst=3.0
#tx_queue_data0_aifs=1
#tx_queue_data0_cwmin=3
#tx_queue_data0_cwmax=7
#tx_queue_data0_burst=1.5


--rehcsedm-0da61a72-b6ec-445d-92f4-82253fb55a66
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--rehcsedm-0da61a72-b6ec-445d-92f4-82253fb55a66--

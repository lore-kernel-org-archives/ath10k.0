Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTZx4-0002UU-5y
 for ath10k@lists.infradead.org; Tue, 28 Apr 2020 23:47:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id nv1so105445ejb.0
 for <ath10k@lists.infradead.org>; Tue, 28 Apr 2020 16:47:45 -0700 (PDT)
MIME-Version: 1.0
From: Girish Mahadevan <girish_mahadevan@trimble.com>
Date: Tue, 28 Apr 2020 17:47:32 -0600
Message-ID: <CADe2dM7GrXQLOVZVzpJwMRsBwtb=o3anVdDOi5muAhPg0Cd+0Q@mail.gmail.com>
Subject: ath10k: QCA9377: wlan0 unusable after Beacon loss
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

Hi,

We have an SDIO based QCA-9377 part (Silex SDMAC) connected to a
beagleboard-x15 . We're running on 5.4 kernel with the ath10k firmware
from
https://github.com/kvalo/ath10k-firmware/tree/master/QCA9377/hw1.0/untested

ath10k related messages in dmesg:

[   10.830774] ath10k_sdio mmc0:0001:1: WARNING: ath10k SDIO support
is work-in-progress, problems may arise!
[   10.974043] ath10k_sdio mmc0:0001:1: qca9377 hw1.1 sdio target
0x05020001 chip_id 0x00000000 sub 0000:0000
[   11.026423] ath10k_sdio mmc0:0001:1: kconfig debug 1 debugfs 1
tracing 0 dfs 0 testmode 1
[   11.092972] ath10k_sdio mmc0:0001:1: firmware ver
WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32
7746e551
[   11.337277] ath10k_sdio mmc0:0001:1: board_file api 1 bmi_id N/A
crc32 544289f7
[   12.780555] ath10k_sdio mmc0:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[   12.981311] ath: EEPROM regdomain: 0x0
[   12.981315] ath: EEPROM indicates default country code should be used
[   12.981318] ath: doing EEPROM country->regdmn map search
[   12.981323] ath: country maps to regdmn code: 0x3a
[   12.981326] ath: Country alpha2 being used: US
[   12.981329] ath: Regpair used: 0x3a

I am able to connect to an AP successfully:

root@viper-x15:~# wpa_supplicant -Dnl80211 -c /etc/wpa_supplicant.conf
-i wlan0 &
[1] 481
root@viper-x15:~# Successfully initialized wpa_supplicant
[   54.700660] NOHZ: local_softirq_pending 08
[   54.704887] NOHZ: local_softirq_pending 08
[   54.709067] NOHZ: local_softirq_pending 08
[   54.730663] NOHZ: local_softirq_pending 08
[   54.750793] NOHZ: local_softirq_pending 08
[   54.760772] NOHZ: local_softirq_pending 08
[   54.780651] NOHZ: local_softirq_pending 08
[   54.800676] NOHZ: local_softirq_pending 08
[   54.804844] NOHZ: local_softirq_pending 08
[   54.809007] NOHZ: local_softirq_pending 08
wlan0: CTRL-EVENT-REGDOM-CHANGE init=BEACON_HINT type=UNKNOWN
wlan0: CTRL-EVENT-REGDOM-CHANGE init=BEACON_HINT type=UNKNOWN
wlan0: CTRL-EVENT-REGDOM-CHANGE init=BEACON_HINT type=UNKNOWN
wlan0: SME: Trying to authenticate with e8:fc:af:fa:37:db (SSID=[
57.382022] wlan0: authenticate with e8:fc:af:fa:37:db
'wcoair24G' freq=2437 MHz)
[   57.480769] wlan0: send auth to e8:fc:af:fa:37:db (try 1/3)
[   57.490835] wlan0: authenticated
wlan0: Trying to associate with e8:fc:af:fa:37:db (SSID='wcoair24G'
freq=2437 MHz)
[   57.510518] wlan0: associate with e8:fc:af:fa:37:db (try 1/3)
[   57.530659] wlan0: RX AssocResp from e8:fc:af:fa:37:db (capab=0x411
status=0 aid=1)
[   57.538362] wlan0: AP has invalid WMM params (AIFSN=1 for ACI 2), will use 2
[   57.545656] wlan0: AP has invalid WMM params (AIFSN=1 for ACI 3), will use 2
[   57.700884] wlan0: associated
wlan0: Associated with e8:fc:af:fa:37:db
wlan0: CTRL-EVENT-SUBNET-STATUS-UPDATE status=0
[   57.765046] cryptd: max_cpu_qlen set to 1000
wlan0: WPA: Key negotiation completed with e8:fc:af:fa:37:db [PT[
57.821389] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
K=CCMP GTK=CCMP]
wlan0: CTRL-EVENT-CONNECTED - Connection to e8:fc:af:fa:37:db
completed [id=1 id_str=]

However, if the AP goes away suddenly, I see these messages,

root@viper-x15:~# wlan0: CTRL-EVENT-BEACON-LOSS
root@viper-x15:~# wlan0: CTRL-EVENT-BEACON-LOSS
[  144.650538] ath10k_sdio mmc0:0001:1: wmi command 20489 timeout,
restarting hardware
[  144.658242] ath10k_sdio mmc0:0001:1: failed to install key for vdev
0 peer e8:fc:af:fa:37:db: -11
[  144.667586] wlan0: failed to remove key (0, e8:fc:af:fa:37:db) from
hardware (-11)
[  147.690529] ath10k_sdio mmc0:0001:1: sdio irq disable request timed out

After this wlan0 is unusable, a reboot is needed.

Has anyone seen this ? Is this a known issue ?

Best Regards
Girish

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

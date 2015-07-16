Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bn1bon0115.outbound.protection.outlook.com
 ([157.56.111.115] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFrNd-0005h9-N7
 for ath10k@lists.infradead.org; Thu, 16 Jul 2015 22:11:51 +0000
From: "Mercer, Karl" <karlmercer@zebra.com>
Subject: Re: AP mode firmware crash on QCA9880-BR4A
Date: Thu, 16 Jul 2015 22:11:26 +0000
Message-ID: <BLUPR03MB14096A3E181FC4869B36C8A6C1990@BLUPR03MB1409.namprd03.prod.outlook.com>
Content-Language: en-US
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Michal et al,

I am seeing the exact same problem as Martin reported.  I am using ath10k code from openwrt rev 46287 to drive a QCA9882 in AP mode.
QCA988X firmware version 10.2.4.70-2 crashes, however swapping out this for version 10.1.467.2-1 "fixes" the crash.
I set the debug_mask to 16182, which gives slightly more verbose debugging.  Unfortunately, I haven't managed to turn on tracing as it causes an unrelated kernel Oops.
You will see from the following log, there are 2 swba events which result in 2 beacons being sent out (using ath10k_wmi_beacon_send_ref_nowait).  It is after the 2nd beacon is sent that the firmware crashes - this is 100% reproducible.
I'm not sure if either beacon appears in the air, but will investigate this.
I saw your suggestion about re-implementing the old by-copy beaconing - I'll try and figure out how to do this.  Please let me know if there's any other information I can give you.

This is the log for fw version 10.2.4.70-2 - I've cut it down to a minimum to show the essential bits:
lspci
...
04:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac Wireless Network Adapter
...
root@(none):/etc/config# cat /sys/module/ath10k_core/parameters/debug_mask
16182
...
root@(none):/etc/config# dmesg -c
...
[   24.100000] ath10k_pci 0000:04:00.0: bmi get target info
[   24.100000] ath10k_pci 0000:04:00.0: Hardware name qca988x hw2.0 version 0x4100016c
[   24.130000] ath10k_pci 0000:04:00.0: trying fw api 5
[   24.130000] ath10k_pci 0000:04:00.0: found fw version 10.2.4.70-2
[   24.130000] ath10k_pci 0000:04:00.0: found fw timestamp 1433440353
[   24.130000] ath10k_pci 0000:04:00.0: found otp image ie (7205 B)
[   24.130000] ath10k_pci 0000:04:00.0: found fw image ie (237784 B)
[   24.130000] ath10k_pci 0000:04:00.0: found firmware features ie (1 B)
[   24.130000] ath10k_pci 0000:04:00.0: Enabling feature bit: 3
[   24.130000] ath10k_pci 0000:04:00.0: features
[   24.130000] ath10k_pci 0000:04:00.0: 00000000: 00 00 00 08                                      ....
[   24.130000] ath10k_pci 0000:04:00.0: found fw ie wmi op version 5
[   24.130000] ath10k_pci 0000:04:00.0: found fw ie htt op version 2
[   24.130000] ath10k_pci 0000:04:00.0: using fw api 5
...
root@(none):/etc/config# wifi up
...
root@(none):/etc/config# dmesg -c
...
[  502.970000] br-lan: port 3(wlan0) entered forwarding state
[  503.000000] br-lan: port 3(wlan0) entered forwarding state
[  503.060000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  503.060000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  503.060000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  503.060000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80ccbcc0
[  503.060000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  503.060000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  503.060000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  503.060000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80ccbc00
[  503.060000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  503.060000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  503.060000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  503.060000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80ccbcc0
[  503.060000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  503.060000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  503.060000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  503.060000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80ccbc00
[  503.190000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 80c45c80
[  503.190000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  503.190000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  503.190000] ath10k_pci 0000:04:00.0: dtim 1/2 mcast 0 pvmlen 1
[  503.190000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  503.190000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  503.190000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80ccb480
[  503.190000] ath10k_pci 0000:04:00.0: mac monitor recalc started? 0 needed? 0 allowed? 1
[  503.290000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 80c45bc0
[  503.290000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  503.290000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  503.290000] ath10k_pci 0000:04:00.0: dtim 0/2 mcast 0 pvmlen 1
[  503.290000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  503.360000] ath10k_pci 0000:04:00.0: firmware crashed! (uuid 93afcd06-9fbd-4d9a-80c0-de810c0e26c5)
[  503.410000] ath10k_pci 0000:04:00.0: qca988x hw2.0 (0x4100016c, 0x043222ff) fw 10.2.4.70-2 api 5 htt 2.1 wmi 5 cal otp max_sta 128
[  503.480000] ath10k_pci 0000:04:00.0: debug 1 debugfs 1 tracing 0 dfs 0 testmode 1
[  503.540000] ath10k_pci 0000:04:00.0: failed to read diag value at 0x1c100804: -16
[  503.570000] ath10k_pci 0000:04:00.0: failed to get memcpy hi address for firmware address 4: -16
[  503.620000] ath10k_pci 0000:04:00.0: failed to read firmware dump area: -16
[  503.690000] ath10k_pci 0000:04:00.0: boot hif stop
[  503.690000] ath10k_pci 0000:04:00.0: boot warm reset
...

And here is the log for fw version 10.1.467.2-1 - there are multiple swba events:
root@(none):/# dmesg -c
...
[   24.110000] ath10k_pci 0000:04:00.0: bmi get target info
[   24.110000] ath10k_pci 0000:04:00.0: Hardware name qca988x hw2.0 version 0x4100016c
[   24.140000] ath10k_pci 0000:04:00.0: trying fw api 5
[   24.170000] ath10k_pci 0000:04:00.0: could not fetch firmware file 'ath10k/QCA988X/hw2.0/firmware-5.bin': -2
[   24.220000] ath10k_pci 0000:04:00.0: trying fw api 4
[   24.250000] ath10k_pci 0000:04:00.0: could not fetch firmware file 'ath10k/QCA988X/hw2.0/firmware-4.bin': -2
[   24.300000] ath10k_pci 0000:04:00.0: trying fw api 3
[   24.350000] ath10k_pci 0000:04:00.0: could not fetch firmware file 'ath10k/QCA988X/hw2.0/firmware-3.bin': -2
[   24.400000] ath10k_pci 0000:04:00.0: trying fw api 2
[   24.440000] ath10k_pci 0000:04:00.0: found fw version 10.1.467.2-1
[   24.440000] ath10k_pci 0000:04:00.0: found fw timestamp 1391440175
[   24.440000] ath10k_pci 0000:04:00.0: found otp image ie (6917 B)
[   24.440000] ath10k_pci 0000:04:00.0: found fw image ie (190250 B)
[   24.440000] ath10k_pci 0000:04:00.0: found firmware features ie (1 B)
[   24.440000] ath10k_pci 0000:04:00.0: Enabling feature bit: 1
[   24.440000] ath10k_pci 0000:04:00.0: Enabling feature bit: 2
[   24.440000] ath10k_pci 0000:04:00.0: features
[   24.440000] ath10k_pci 0000:04:00.0: 00000000: 00 00 00 06                                      ....
[   24.440000] ath10k_pci 0000:04:00.0: using fw api 2
...
root@(none):/# wifi up
...
root@(none):/# dmesg -c
...
[  288.540000] br-lan: port 3(wlan0) entered forwarding state
[  288.580000] br-lan: port 3(wlan0) entered forwarding state
[  288.740000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  288.740000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  288.740000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  288.740000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80cd2bc0
[  288.740000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  288.740000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  288.740000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  288.740000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80cd2800
[  288.740000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  288.740000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  288.740000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  288.740000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80cd2bc0
[  288.740000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  288.740000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  288.740000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  288.740000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80cd2800
[  288.770000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 813f0e40
[  288.770000] ath10k_pci 0000:04:00.0: testmode event wmi cmd_id 36874 skb 813f0e40 skb->len 36
[  288.770000] ath10k_pci 0000:04:00.0: 00000000: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  288.770000] ath10k_pci 0000:04:00.0: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  288.770000] ath10k_pci 0000:04:00.0: 00000020: 00 00 00 00                                      ....
[  288.770000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  288.770000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  288.770000] ath10k_pci 0000:04:00.0: dtim 1/2 mcast 0 pvmlen 1
[  288.770000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  288.780000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  288.780000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80cd2c80
[  288.870000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 813f0d80
[  288.870000] ath10k_pci 0000:04:00.0: testmode event wmi cmd_id 36874 skb 813f0d80 skb->len 36
[  288.870000] ath10k_pci 0000:04:00.0: 00000000: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  288.870000] ath10k_pci 0000:04:00.0: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  288.870000] ath10k_pci 0000:04:00.0: 00000020: 00 00 00 00                                      ....
[  288.870000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  288.870000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  288.870000] ath10k_pci 0000:04:00.0: dtim 0/2 mcast 0 pvmlen 1
[  288.870000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  288.870000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  288.870000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80cd2800
[  288.890000] ath10k_pci 0000:04:00.0: mac monitor recalc started? 0 needed? 0 allowed? 1
[  288.970000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 813f0cc0
[  288.970000] ath10k_pci 0000:04:00.0: testmode event wmi cmd_id 36874 skb 813f0cc0 skb->len 36
[  288.970000] ath10k_pci 0000:04:00.0: 00000000: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  288.970000] ath10k_pci 0000:04:00.0: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  288.970000] ath10k_pci 0000:04:00.0: 00000020: 00 00 00 00                                      ....
[  288.970000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  288.970000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  288.970000] ath10k_pci 0000:04:00.0: dtim 1/2 mcast 0 pvmlen 1
[  288.970000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  288.970000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  288.970000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80cd25c0
[  289.070000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 813f0c00
[  289.070000] ath10k_pci 0000:04:00.0: testmode event wmi cmd_id 36874 skb 813f0c00 skb->len 36
[  289.070000] ath10k_pci 0000:04:00.0: 00000000: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  289.070000] ath10k_pci 0000:04:00.0: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  289.070000] ath10k_pci 0000:04:00.0: 00000020: 00 00 00 00                                      ....
[  289.070000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  289.070000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  289.070000] ath10k_pci 0000:04:00.0: dtim 0/2 mcast 0 pvmlen 1
[  289.070000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  289.070000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  289.070000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 85826d40
...

Regards,
Karl


________________________________
- CONFIDENTIAL-

This email and any files transmitted with it are confidential, and may also be legally privileged. If you are not the intended recipient, you may not review, use, copy, or distribute this message. If you receive this email in error, please notify the sender immediately by reply email and then delete this email.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

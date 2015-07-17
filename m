Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-by2on0730.outbound.protection.outlook.com
 ([2a01:111:f400:fc0c::730] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZG3Ai-0003ob-CV
 for ath10k@lists.infradead.org; Fri, 17 Jul 2015 10:47:27 +0000
From: "Mercer, Karl" <karlmercer@zebra.com>
Subject: RE: AP mode firmware crash on QCA9880-BR4A
Date: Fri, 17 Jul 2015 10:46:53 +0000
Message-ID: <BLUPR03MB14091A20EFBA33C61A66C321C1980@BLUPR03MB1409.namprd03.prod.outlook.com>
References: <BLUPR03MB14096A3E181FC4869B36C8A6C1990@BLUPR03MB1409.namprd03.prod.outlook.com>
 <CA+BoTQnkV9wcNMz2nYmcx8hP7XqHMNdcT3NJezejFJ0Mhddz7g@mail.gmail.com>
In-Reply-To: <CA+BoTQnkV9wcNMz2nYmcx8hP7XqHMNdcT3NJezejFJ0Mhddz7g@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Hmm.. The crash coincides with dtim beacon submission. Can you change dtim period to 1 and 10 (2 tests) and see how many SWBA events it takes before it crashes respectively, please?

The crash still occurs after the 2nd SWBA event for both dtim_period=1 and dtim_period=10.  Here are the logs:

Log for dtim_period=1:
[  179.410000] br-lan: port 3(wlan0) entered forwarding state
[  179.460000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  179.460000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  179.460000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  179.460000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 810dd740
[  179.460000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  179.460000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  179.460000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  179.460000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80ded2c0
[  179.460000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  179.460000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  179.460000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  179.460000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 810dd740
[  179.460000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  179.460000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  179.460000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  179.460000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80ded2c0
[  179.540000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 81191a80
[  179.540000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  179.540000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  179.540000] ath10k_pci 0000:04:00.0: dtim 0/1 mcast 0 pvmlen 1
[  179.540000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  179.540000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  179.540000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 810dd440
[  179.570000] ath10k_pci 0000:04:00.0: mac monitor recalc started? 0 needed? 0 allowed? 1
[  179.640000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 811919c0
[  179.640000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  179.640000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  179.640000] ath10k_pci 0000:04:00.0: dtim 0/1 mcast 0 pvmlen 1
[  179.640000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  179.710000] ath10k_pci 0000:04:00.0: firmware crashed! (uuid bf96f9b3-caa6-4090-84db-4c9cee275fca)
[  179.760000] ath10k_pci 0000:04:00.0: qca988x hw2.0 (0x4100016c, 0x043222ff) fw 10.2.4.70-2 api 5 htt 2.1 wmi 5 cal otp max_sta 128
[  179.830000] ath10k_pci 0000:04:00.0: debug 1 debugfs 1 tracing 0 dfs 0 testmode 1
[  179.890000] ath10k_pci 0000:04:00.0: failed to read diag value at 0x1c100804: -16
[  179.920000] ath10k_pci 0000:04:00.0: failed to get memcpy hi address for firmware address 4: -16
[  179.970000] ath10k_pci 0000:04:00.0: failed to read firmware dump area: -16
[  180.020000] ath10k_pci 0000:04:00.0: boot hif stop

Log for dtim_period=10:
[  344.070000] br-lan: port 3(wlan0) entered forwarding state
[  344.120000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  344.120000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  344.120000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  344.120000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 81fee320
[  344.120000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  344.120000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  344.120000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  344.120000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 81fee260
[  344.120000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  344.120000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  344.120000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  344.120000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 81fee320
[  344.120000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  344.120000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  344.120000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  344.120000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 81fee260
[  344.230000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 810dfa60
[  344.230000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  344.230000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  344.230000] ath10k_pci 0000:04:00.0: dtim 9/10 mcast 0 pvmlen 1
[  344.230000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  344.230000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  344.230000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 810897a0
[  344.290000] ath10k_pci 0000:04:00.0: mac monitor recalc started? 0 needed? 0 allowed? 1
[  344.330000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 810df9a0
[  344.330000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  344.330000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  344.330000] ath10k_pci 0000:04:00.0: dtim 8/10 mcast 0 pvmlen 1
[  344.330000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  344.410000] ath10k_pci 0000:04:00.0: firmware crashed! (uuid 7d2379f1-54ea-4419-84a7-909a1f592158)
[  344.460000] ath10k_pci 0000:04:00.0: qca988x hw2.0 (0x4100016c, 0x043222ff) fw 10.2.4.70-2 api 5 htt 2.1 wmi 5 cal otp max_sta 128
[  344.530000] ath10k_pci 0000:04:00.0: debug 1 debugfs 1 tracing 0 dfs 0 testmode 1
[  344.580000] ath10k_pci 0000:04:00.0: failed to read diag value at 0x1c100804: -16
[  344.620000] ath10k_pci 0000:04:00.0: failed to get memcpy hi address for firmware address 4: -16
[  344.670000] ath10k_pci 0000:04:00.0: failed to read firmware dump area: -16
[  344.710000] ath10k_pci 0000:04:00.0: boot hif stop

I also tried changing the beacon interval from 100ms to 500ms.  You can see that the crash is still after the 2nd SWBA event, but the spacing of SWBA events is now 500ms:
[  226.290000] br-lan: port 3(wlan0) entered forwarding state
[  226.370000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  226.370000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  226.370000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  226.370000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80e29d80
[  226.370000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  226.370000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  226.370000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  226.370000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 811a0780
[  226.370000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  226.370000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  226.370000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  226.370000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 80e29d80
[  226.370000] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  226.370000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  226.370000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  226.370000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 811a0780
[  226.510000] ath10k_pci 0000:04:00.0: mac monitor recalc started? 0 needed? 0 allowed? 1
[  227.020000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 810eea40
[  227.020000] ath10k_pci 0000:04:00.0: wmi event debug mesg len 212
[  227.560000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 810ee980
[  227.560000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  227.560000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  227.560000] ath10k_pci 0000:04:00.0: dtim 1/2 mcast 0 pvmlen 1
[  227.560000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  227.560000] ath10k_pci 0000:04:00.0: htc ep 2 got 1 credits (total 2)
[  227.560000] ath10k_pci 0000:04:00.0: ath10k_htc_notify_tx_completion: ep 2 skb 811a0780
[  228.020000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 810ee8c0
[  228.020000] ath10k_pci 0000:04:00.0: wmi event debug mesg len 48
[  228.070000] ath10k_pci 0000:04:00.0: htc rx completion ep 2 skb 810ee800
[  228.070000] ath10k_pci 0000:04:00.0: mgmt swba vdev_map 0x1
[  228.070000] ath10k_pci 0000:04:00.0: mgmt event bcn_info 0 tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap 0x00000000000000000000000000000000
[  228.070000] ath10k_pci 0000:04:00.0: dtim 0/2 mcast 0 pvmlen 1
[  228.070000] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[  228.150000] ath10k_pci 0000:04:00.0: firmware crashed! (uuid 9bf5b96c-bc00-4ef3-8f4d-b463293077e3)
[  228.190000] ath10k_pci 0000:04:00.0: qca988x hw2.0 (0x4100016c, 0x043222ff) fw 10.2.4.70-2 api 5 htt 2.1 wmi 5 cal otp max_sta 128
[  228.260000] ath10k_pci 0000:04:00.0: debug 1 debugfs 1 tracing 0 dfs 0 testmode 1
[  228.320000] ath10k_pci 0000:04:00.0: failed to read diag value at 0x1c100804: -16
[  228.350000] ath10k_pci 0000:04:00.0: failed to get memcpy hi address for firmware address 4: -16
[  228.410000] ath10k_pci 0000:04:00.0: failed to read firmware dump area: -16
[  228.450000] ath10k_pci 0000:04:00.0: boot hif stop



________________________________
- CONFIDENTIAL-

This email and any files transmitted with it are confidential, and may also be legally privileged. If you are not the intended recipient, you may not review, use, copy, or distribute this message. If you receive this email in error, please notify the sender immediately by reply email and then delete this email.
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-cys01nam02on060f.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::60f]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7O37-0001aV-Vw
 for ath10k@lists.infradead.org; Tue, 02 Oct 2018 17:02:25 +0000
From: Adam Cottrel <adam.cottrel@veea.com>
Subject: Re: ath10k kernel requirements (coherent_pool etc)
Date: Tue, 2 Oct 2018 17:01:16 +0000
Message-ID: <DM6PR04MB40592D8987BA7559D144C622F2E80@DM6PR04MB4059.namprd04.prod.outlook.com>
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

Hi,

I would like to pick up this thread as I have been doing a lot of work with the ATH10K firmware, and we are still no clearer on a workable solution on the Linux 4.14.4 kernel.

We see the firmware crash when the kernel memory starts to get fragmented - we are using a dd copy operation to simulate the clean cache becoming full. We can help to mitigate (but not stop) the crashes by forcing a cache clear (e.g. drop cache) at regular intervals, or by forcing kswapd to run more often by using the highest watermark_scale_factor (10%).

The ATH10K driver can be made to crash with legacy or MSI interrupts, and occurs with or without SMP active. Furthermore, if I enable or disable IOMMU the fault symptoms do not change - this effectively replaces the DMA ops with SWIO vs the hard IOMMU on the Arm 64-bit core.

There appear to be two types of crash - one where we seem to get an assertion in the QCA9984/QCA988X device, and an immediate crash notification via the NAPI callbacks.

The second type is more mysterious, as the firmware just hangs there after completing one of the many receive hand-shakes, and then is eventually picked up by the firmware as a crash.

To start, it is not clear what can make a remote device fail - can anyone help explain what might be causing the QCA988x and QCA9984 to fail in the first place?
Best,
Adam

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

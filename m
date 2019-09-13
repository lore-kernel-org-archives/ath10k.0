Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8cfC-0007CS-Kc
 for ath10k@lists.infradead.org; Fri, 13 Sep 2019 03:54:29 +0000
Subject: Re: [PATCH v5 0/8] ath10k: improve throughout of tcp/udp TX/RX of sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Fri, 13 Sep 2019 03:54:14 +0000
Message-ID: <1568346854209.29270@qti.qualcomm.com>
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <87tv9hikwe.fsf@kamboji.qca.qualcomm.com>,
 <87d0g5h07v.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87d0g5h07v.fsf@kamboji.qca.qualcomm.com>
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
To: "kvalo@codeaurora.org" <kvalo@codeaurora.org>, Wen Gong <wgong@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


>>> The bottleneck of throughout on sdio chip is the bus bandwidth, to the
>>>patches are all to increase the use ratio of sdio bus.

>> I tried to apply patches 2-8, patch 2 had a conflict due to my changes
>> and patch 8 didn't apply at all. Also I saw few warnings with the
>> patches I was able to test:

HI kalle,

i see some warning is from patch "ath10k: add fw coredump for sdio when firmware assert"
and this patch also have change in sdio.c, so maybe it will have conflict with the 8 patches.

patch 8 didn't apply at all, is it means each change of the patch is conflict?

I used command to check each patch.
perl ~/opensource/checkpatch.pl --strict --no-tree --max-line-length=90  --show-types --ignore CONST_STRUCT ./*

I found it not check Wunused-but-set-variable.
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

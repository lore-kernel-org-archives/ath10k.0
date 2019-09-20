Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBIHZ-0003V4-IN
 for ath10k@lists.infradead.org; Fri, 20 Sep 2019 12:45:07 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 0/8] ath10k: improve throughout of tcp/udp TX/RX of sdio
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <87tv9hikwe.fsf@kamboji.qca.qualcomm.com>
 <87d0g5h07v.fsf@kamboji.qca.qualcomm.com>
 <1568346854209.29270@qti.qualcomm.com>
Date: Fri, 20 Sep 2019 15:44:59 +0300
In-Reply-To: <1568346854209.29270@qti.qualcomm.com> (Wen Gong's message of
 "Fri, 13 Sep 2019 03:54:14 +0000")
Message-ID: <87tv97b0hg.fsf@codeaurora.org>
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
To: Wen Gong <wgong@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

Wen Gong <wgong@qti.qualcomm.com> writes:

>>>> The bottleneck of throughout on sdio chip is the bus bandwidth, to the
>>>>patches are all to increase the use ratio of sdio bus.
>
>>> I tried to apply patches 2-8, patch 2 had a conflict due to my changes
>>> and patch 8 didn't apply at all. Also I saw few warnings with the
>>> patches I was able to test:
>
> Hi kalle,
>
> i see some warning is from patch "ath10k: add fw coredump for sdio when firmware assert"
> and this patch also have change in sdio.c, so maybe it will have
> conflict with the 8 patches.
>
> patch 8 didn't apply at all, is it means each change of the patch is
> conflict?

Patches 1-7 applied fine, but patch 8 didn't apply. I didn't investigate
what was the conflict.

> I used command to check each patch.
> perl ~/opensource/checkpatch.pl --strict --no-tree
> --max-line-length=90 --show-types --ignore CONST_STRUCT ./*
>
> I found it not check Wunused-but-set-variable.

checkpatch only checks style issues, unused-but-set-variable is a
warning from GCC.

I use ath10k-check script to check all ath10k patches:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/codingstyle#checking_code

And I use latest GCC and sparse with that. crosstool is a simple way to
install a relatively new version of GCC for kernel compilation:

https://mirrors.edge.kernel.org/pub/tools/crosstool/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

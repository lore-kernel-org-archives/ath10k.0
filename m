Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1XSL-0001Rd-87
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 10:37:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: do not use coherent memory for tx buffers
References: <1448284729-98078-1-git-send-email-nbd@openwrt.org>
 <1448284729-98078-2-git-send-email-nbd@openwrt.org>
 <56534C01.8030407@codeaurora.org> <56535875.2080204@openwrt.org>
 <56536006.6030500@codeaurora.org> <56543CAE.4030803@openwrt.org>
Date: Wed, 25 Nov 2015 12:37:08 +0200
In-Reply-To: <56543CAE.4030803@openwrt.org> (Felix Fietkau's message of "Tue, 
 24 Nov 2015 11:32:14 +0100")
Message-ID: <87610qpdpn.fsf@kamboji.qca.qualcomm.com>
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
To: Felix Fietkau <nbd@openwrt.org>
Cc: Peter Oh <poh@codeaurora.org>, ath10k@lists.infradead.org

Felix Fietkau <nbd@openwrt.org> writes:

>>>   However, on the device that I'm testing on
>>> (IPQ806x based), this patch makes the difference between working and
>>> non-working wifi, fixing the regression introduced by your pre-allocated
>>> coherent memory patch.
>>
>> Thank you for the catch up and fix.
>> Btw, the regression can be fixed by using GFP_KERNEL, instead of 
>> GFP_DMA, right?
>
> I just did some timing measurements, and it seems that the DMA coherent
> variant is roughly 200 nanoseconds faster. Maybe the extra latency is
> caused by the CPU filling the cacheline from RAM first.
>
> Kalle, please only merge the first one and drop this patch.
> I will send a replacement for it.

Ok, patch 2 dropped.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

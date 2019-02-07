Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grkcB-0001y8-VO
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:25:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: FW: [PATCH] ath10k: fix return value check in wake_tx_q op
References: <20180506132500.16888-1-erik.stromdahl@gmail.com>
 <6dc00772b826410e930306891fd13ed9@euamsexm01f.eu.qualcomm.com>
 <c77a1c0961f34ee68b7266444d2207f5@aptaiexm02e.ap.qualcomm.com>
 <66a74025a23795f305de37989c1b8aa3@codeaurora.org>
Date: Thu, 07 Feb 2019 16:25:15 +0200
In-Reply-To: <66a74025a23795f305de37989c1b8aa3@codeaurora.org>
 (yiboz@codeaurora.org's message of "Mon, 28 Jan 2019 15:01:50 +0800")
Message-ID: <87sgwz8ylw.fsf@kamboji.qca.qualcomm.com>
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
To: yiboz <yiboz@codeaurora.org>
Cc: erik.stromdahl@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

(please don't top post)

yiboz <yiboz@codeaurora.org> writes:

> We have met performance issue on our two-core system after applying
> your patch. In WDS mode, we found that the peak throughput in TCP-DL
> and UDP-DL dropped more than 10% compared with previous one. And in
> some cases, though throughput stays the same, one CPU usage rises
> about 20% which leads to 10% in total CPU usage. With your change, I
> think driver will try its best to push as many packets as it can.
> During this time, the driver's queue lock will be held for too much
> time in one CPU and as a result, the other CPU will be blocked if it
> wants to acquired the same lock. Working in this way seems not
> efficiency.
>
> So I think it is better to revert the change till we come up with a
> new solution.

I don't think reverting is a clear option at this stage because that
again creates problems for SDIO. IIRC without this patch SDIO was
sending one packet a time (or something like that, can't remember all
the details right now).

Why does this happen only WDS mode? Did you test other modes, like AP or
client mode?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

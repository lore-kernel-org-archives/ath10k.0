Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fShNa-0002wx-9G
 for ath10k@lists.infradead.org; Tue, 12 Jun 2018 11:22:27 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/4] ath10k: snoc: use correct bus-specific pointer in RX
 retry
References: <20180611210946.241341-1-briannorris@chromium.org>
Date: Tue, 12 Jun 2018 14:22:08 +0300
In-Reply-To: <20180611210946.241341-1-briannorris@chromium.org> (Brian
 Norris's message of "Mon, 11 Jun 2018 14:09:43 -0700")
Message-ID: <87wov4ckrj.fsf@kamboji.qca.qualcomm.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Brian Norris <briannorris@chromium.org> writes:

> We're 'ath10k_snoc', not 'ath10k_pci'. This probably means we're
> accessing junk data in ath10k_snoc_rx_replenish_retry(), unless
> 'ath10k_snoc' and 'ath10k_pci' happen to have very similar struct
> layouts.
>
> Noticed by inspection.
>
> Fixes: d915105231ca ("ath10k: add hif rx methods for wcn3990")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> It's possible this would be a for-4.18 target, since the buggy patch is
> in the -rc1 merge. But this driver is not fully operational yet. Also,
> I'm sending some companion refactorings to help avoid this bug. They
> probably aren't 4.18 material.

Yeah, in theory this should go to 4.18 but, like you said, snoc support
does not even work on 4.18 so there would be no benefit. Actually just
more work while we add final pieces of wcn3990 support to ath10k. So
I'll queue these to 4.19.

> Let me know if I should do anything differently.

This is very good as is, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6wzC-0000pJ-Ne
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 11:35:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v1 1/1] ath10k: convert kmemdup to dma_alloc_coherent
References: <1522077122-31134-1-git-send-email-jared.bents@rockwellcollins.com>
Date: Fri, 13 Apr 2018 14:35:08 +0300
In-Reply-To: <1522077122-31134-1-git-send-email-jared.bents@rockwellcollins.com>
 (Jared Bents's message of "Mon, 26 Mar 2018 10:12:02 -0500")
Message-ID: <8736zzs5jn.fsf@kamboji.qca.qualcomm.com>
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
To: Jared Bents <jared.bents@rockwellcollins.com>
Cc: ath10k@lists.infradead.org

Jared Bents <jared.bents@rockwellcollins.com> writes:

> Update to convert the use of kmemdup to dma_alloc_coherent as
> dma_alloc_coherent will consider DMA region limits such as
> those seen with CONFIG_FSL_PCI && CONFIG_ZONE_DMA32 whereas
> kmemdup does not take those limitations into account.
>
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

Can you resend and CC linux-wireless, please? Otherwise patchwork won't
see it and hence I won't see it either as I mostly work via patchwork.

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

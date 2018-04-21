Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9mfX-0006NP-IL
 for ath10k@lists.infradead.org; Sat, 21 Apr 2018 07:10:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v1 1/1] ath10k: convert kmemdup to dma_alloc_coherent
References: <1524238793-24481-1-git-send-email-jared.bents@rockwellcollins.com>
Date: Sat, 21 Apr 2018 10:10:31 +0300
In-Reply-To: <1524238793-24481-1-git-send-email-jared.bents@rockwellcollins.com>
 (Jared Bents's message of "Fri, 20 Apr 2018 10:39:53 -0500")
Message-ID: <87in8lf314.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Jared Bents <jared.bents@rockwellcollins.com> writes:

> Update to convert the use of kmemdup to dma_alloc_coherent as
> dma_alloc_coherent will consider DMA region limits such as
> those seen with CONFIG_FSL_PCI && CONFIG_ZONE_DMA32 whereas
> kmemdup does not take those limitations into account.
>
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

Does this fix a real bug or is it just a theoretical issue you noticed
while looking at the code? If this fixes a real bug please give a
description of it.

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#guidelines

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

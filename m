Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP3nV-0006Tw-7c
 for ath10k@lists.infradead.org; Thu, 16 Apr 2020 12:39:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: improve power save performance for sdio
References: <0101016ed9241282-73dd8b35-e2e5-4f37-9b50-cf2fb6524dfc-000000@us-west-2.amazonses.com>
Date: Thu, 16 Apr 2020 15:38:48 +0300
In-Reply-To: <0101016ed9241282-73dd8b35-e2e5-4f37-9b50-cf2fb6524dfc-000000@us-west-2.amazonses.com>
 (Wen Gong's message of "Fri, 6 Dec 2019 02:57:30 +0000")
Message-ID: <877dyfr4fb.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> This patch is to set register to allow the mbox enter sleep status
> if it does not have tx traffic and wakeup it if tx traffic arrive.
> After mbox enter sleep status, the soc will enter sleep status by
> firmware, this will save power. The power consume drops from about
> 90mW to about 10mW with this patch.
>
> This patch only effect sdio chip.
>
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

[...]

> +static inline int ath10k_hif_set_mbox_sleep(struct ath10k *ar, bool enable_sleep)
> +{
> +	if (ar->hif.ops->set_mbox_sleep)
> +		return ar->hif.ops->set_mbox_sleep(ar, enable_sleep);
> +	return 0;
> +}

I don't think we need to add another hif op for this. I sent v2 which
uses existing op.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

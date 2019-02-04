Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqgWX-0002cB-HN
 for ath10k@lists.infradead.org; Mon, 04 Feb 2019 15:51:07 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix S5 power consumption issue for QCA9377
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1547533867-15131-1-git-send-email-yyuwang@codeaurora.org>
References: <1547533867-15131-1-git-send-email-yyuwang@codeaurora.org>
Message-Id: <20190204155105.44098607F5@smtp.codeaurora.org>
Date: Mon,  4 Feb 2019 15:51:05 +0000 (UTC)
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
To: Yu Wang <yyuwang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yu Wang <yyuwang@codeaurora.org> wrote:

> After system entering S5 (shut down but system still
> providing power to QCA9377) on Ubuntu platform, power
> consumption of QCA9377 is 69mA, which is too high.
> The root cause is pci_soft_reset is not set for QCA9377
> during pci probe.
> To fix this issue, set 'pci_soft_reset' to 'th10k_pci_warm_reset',
> and then the power consumption drops to a normal value(10mA).
> Verified on Dell Ubuntu platform with firmware:
> WLAN.TF.1.0-00002-QCATFSWPZ-5
> 
> Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
> Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1a86be476cfa ath10k: fix S5 power consumption issue for QCA9377

-- 
https://patchwork.kernel.org/patch/10764017/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

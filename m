Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgwJH-0002yg-SI
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 19:13:26 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: destroy sdio workqueue while remove sdio module
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561515940-13748-1-git-send-email-wgong@codeaurora.org>
References: <1561515940-13748-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190628191323.933C3608BA@smtp.codeaurora.org>
Date: Fri, 28 Jun 2019 19:13:23 +0000 (UTC)
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

Wen Gong <wgong@codeaurora.org> wrote:

> The workqueue need to flush and destory while remove sdio module,
> otherwise it will have thread which is not destory after remove
> sdio modules.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3ed39f8e747a ath10k: destroy sdio workqueue while remove sdio module

-- 
https://patchwork.kernel.org/patch/11016767/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

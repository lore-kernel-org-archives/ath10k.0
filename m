Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRTua-0002Z6-8E
 for ath10k@lists.infradead.org; Thu, 23 Apr 2020 04:56:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: drop the TX packet which size exceed credit
 size for sdio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200422084719.3479-1-wgong@codeaurora.org>
References: <20200422084719.3479-1-wgong@codeaurora.org>
Message-Id: <20200423045628.D682FC433CB@smtp.codeaurora.org>
Date: Thu, 23 Apr 2020 04:56:28 +0000 (UTC)
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

> sdio chip use DMA buffer to receive TX packet from ath10k, and it has
> limitation of each buffer, if the packet size exceed the credit size,
> it will trigger error in firmware.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

8347784d6f5f ath10k: drop the TX packet which size exceed credit size for sdio

-- 
https://patchwork.kernel.org/patch/11503309/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

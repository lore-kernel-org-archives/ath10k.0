Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMYY1-0005N5-Uy
 for ath10k@lists.infradead.org; Thu, 09 Apr 2020 14:52:58 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/4] ath10k: disable TX complete indication of htt for
 sdio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200212080415.31265-2-wgong@codeaurora.org>
References: <20200212080415.31265-2-wgong@codeaurora.org>
Message-Id: <20200409145248.B7D3AC433BA@smtp.codeaurora.org>
Date: Thu,  9 Apr 2020 14:52:48 +0000 (UTC)
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

> For sdio chip, it is high latency bus, all the TX packet's content will
> be tranferred from HOST memory to firmware memory via sdio bus, then it
> need much more memory in firmware than low latency bus chip, for low
> latency chip, such as PCI-E, it only need to transfer the TX descriptor
> via PCI-E bus to firmware memory. For sdio chip, reduce the complexity of
> TX logic will help TX efficiency since its memory is limited, and it will
> reduce the TX circle's time of each packet and then firmware will have more
> memory for TX since TX complete also need memeory.
> 
> This patch disable TX complete indication from firmware for htt data
> packet, it will not have TX complete indication from firmware to ath10k.
> It will cut the cost of bus bandwidth of TX complete and make the TX
> logic of firmware simpler, it results in significant performance
> improvement on TX path.
> 
> Udp TX throughout is 130Mbps without this patch, and it arrives
> 400Mbps with this patch.
> 
> The downside of this patch is the command "iw wlan0 station dump" will
> show 0 for "tx retries" and "tx failed" since all tx packet's status
> is success.
> 
> This patch only effect sdio chip, it will not effect PCI, SNOC etc.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWPZ-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

d81686d33356 ath10k: disable TX complete indication of htt for sdio
c61a74837043 ath10k: change ATH10K_SDIO_BUS_REQUEST_MAX_NUM from 64 to 1024

-- 
https://patchwork.kernel.org/patch/11377827/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

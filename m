Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqgV9-0001B1-IM
 for ath10k@lists.infradead.org; Mon, 04 Feb 2019 15:49:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Set DMA address mask to 35 bit for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1535992622-5074-1-git-send-email-pillair@codeaurora.org>
References: <1535992622-5074-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190204154939.242386047C@smtp.codeaurora.org>
Date: Mon,  4 Feb 2019 15:49:38 +0000 (UTC)
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> WCN3990 is a 37-bit target but can address memory range
> only upto 35 bits. The 36th bit is used to control the
> smmu/iommu translation and the 37th bit is used by the
> internal bus masters to access the wifi subsystem internal
> SRAM. With the DMA mask set to 37i-bit, the host driver
> can get 37-bit dma address, which leads to incorrect
> address access in the target.
> 
> Hence the host driver can used addresses upto 35-bit
> for WCN3990. Fix the dma mask for wcn3990 to 35-bit,
> instead of 37-bit.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5b9030cee1be ath10k: Set DMA address mask to 35 bit for WCN3990

-- 
https://patchwork.kernel.org/patch/10586127/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

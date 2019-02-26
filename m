Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gycHx-0002zM-8z
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 12:56:50 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix descriptor size in ce tx completion for
 WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1549952423-25096-1-git-send-email-pillair@codeaurora.org>
References: <1549952423-25096-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190226125648.2EFE660397@smtp.codeaurora.org>
Date: Tue, 26 Feb 2019 12:56:47 +0000 (UTC)
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

> When the driver receives the tx completion of the
> descriptor over ce, it clears the nbytes configured
> for that particular descriptor. WCN3990 uses ce
> descriptors with 64-bit address.
> 
> Currently during handling the tx completion of the
> descriptors, the nbytes are accessed from the descriptors
> using ce_desc for 32-bit targets. This will lead to clearing
> of memory at incorrect offset if DMA MASK is set to greater
> than 32 bits.
> 
> Attach different ce tx copy completed handler for targets
> using address above 32-bit address.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

02f73d3a9bdb ath10k: fix descriptor size in ce tx completion for WCN3990

-- 
https://patchwork.kernel.org/patch/10807393/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

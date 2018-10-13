Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBNgN-00013D-Jm
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 17:26:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V3] ath10k: allocate small size dma memory in
 ath10k_pci_diag_write_mem
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1539244526-31912-1-git-send-email-cjhuang@codeaurora.org>
References: <1539244526-31912-1-git-send-email-cjhuang@codeaurora.org>
Message-Id: <20181013172621.5522660C55@smtp.codeaurora.org>
Date: Sat, 13 Oct 2018 17:26:21 +0000 (UTC)
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Carl Huang <cjhuang@codeaurora.org> wrote:

> ath10k_pci_diag_write_mem may allocate big size of the dma memory
> based on the parameter nbytes. Take firmware diag download as
> example, the biggest size is about 500K. In some systems, the
> allocation is likely to fail because it can't acquire such a large
> contiguous dma memory.
> 
> The fix is to allocate a small size dma memory. In the loop,
> driver copies the data to the allocated dma memory and writes to
> the destination until all the data is written.
> 
> Tested with QCA6174 PCI with
> firmware-6.bin_WLAN.RM.4.4.1-00119-QCARMSWP-1, this also affects
> QCA9377 PCI.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Reviewed-by: Brian Norris <briannorris@chomium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

0738b4998c6d ath10k: allocate small size dma memory in ath10k_pci_diag_write_mem

-- 
https://patchwork.kernel.org/patch/10636245/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

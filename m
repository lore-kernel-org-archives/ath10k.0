Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivfFm-0005oR-RW
 for ath10k@lists.infradead.org; Sun, 26 Jan 2020 10:34:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH,
 v4] Revert "ath10k: fix DMA related firmware crashes on multiple
 devices"
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1578976521-6104-1-git-send-email-zhichen@codeaurora.org>
References: <1578976521-6104-1-git-send-email-zhichen@codeaurora.org>
Message-Id: <20200126103452.C3709C43383@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:34:52 +0000 (UTC)
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
To: Zhi Chen <zhichen@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Zhi Chen <zhichen@codeaurora.org> wrote:

> This reverts commit 76d164f582150fd0259ec0fcbc485470bcd8033e.
> PCIe hung issue was observed on multiple platforms. The issue was reproduced
> when DUT was configured as AP and associated with 50+ STAs.
> 
> For QCA9984/QCA9888, the DMA_BURST_SIZE register controls the AXI burst size
> of the RD/WR access to the HOST MEM.
> 0 - No split , RAW read/write transfer size from MAC is put out on bus
>     as burst length
> 1 - Split at 256 byte boundary
> 2,3 - Reserved
> 
> With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary when
> issue happened. It broke PCIe spec and caused PCIe stuck. So revert
> the default value from 0 to 1.
> 
> Tested:  IPQ8064 + QCA9984 with firmware 10.4-3.10-00047
>          QCS404 + QCA9984 with firmware 10.4-3.9.0.2--00044
>          Synaptics AS370 + QCA9888  with firmware 10.4-3.9.0.2--00040
> 
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a1769bb68a85 Revert "ath10k: fix DMA related firmware crashes on multiple devices"

-- 
https://patchwork.kernel.org/patch/11331293/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihvRc-00052v-R2
 for ath10k@lists.infradead.org; Thu, 19 Dec 2019 13:02:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH,
 v3] Revert "ath10k: fix DMA related firmware crashes on multiple
 devices"
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016ef916f2e7-28683312-1d0b-4c2e-b967-c13c3e45ce31-000000@us-west-2.amazonses.com>
References: <0101016ef916f2e7-28683312-1d0b-4c2e-b967-c13c3e45ce31-000000@us-west-2.amazonses.com>
Message-Id: <20191219130215.A627AC433CB@smtp.codeaurora.org>
Date: Thu, 19 Dec 2019 13:02:15 +0000 (UTC)
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
> PCIe hung issue was observed on multiple platforms. The issue was 
> reproduced
> when DUT was configured as AP and associated with 50+ STAs.
> 
> For QCA9984/QCA9888, the DMA_BURST_SIZE register controls the AXI burst 
> size
> of the RD/WR access to the HOST MEM.
> 0 - No split , RAW read/write transfer size from MAC is put out on bus
>      as burst length
> 1 - Split at 256 byte boundary
> 2,3 - Reserved
> 
> With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary 
> when
> issue happened. It broke PCIe spec and caused PCIe stuck. So revert
> the default value from 0 to 1.
> 
> Tested:  IPQ8064 + QCA9984 with firmware 10.4-3.10-00047
>           QCS404 + QCA9984 with firmware 10.4-3.9.0.2--00044
>           Synaptics AS370 + QCA9888  with firmware 10.4-3.9.0.2--00040
> 
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>

Fails to apply:

error: patch failed: drivers/net/wireless/ath/ath10k/hw.h:813
error: drivers/net/wireless/ath/ath10k/hw.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11287143/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

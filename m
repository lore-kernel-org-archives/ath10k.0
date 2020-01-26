Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivf53-0002TV-QV
 for ath10k@lists.infradead.org; Sun, 26 Jan 2020 10:23:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: pci: Only dump ATH10K_MEM_REGION_TYPE_IOREG
 when safe
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191219131539.1003793-2-bryan.odonoghue@linaro.org>
References: <20191219131539.1003793-2-bryan.odonoghue@linaro.org>
Message-Id: <20200126102344.BED86C433A2@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:23:44 +0000 (UTC)
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:

> ath10k_pci_dump_memory_reg() will try to access memory of type
> ATH10K_MEM_REGION_TYPE_IOREG however, if a hardware restart is in progress
> this can crash a system.
> 
> Individual ioread32() time has been observed to jump from 15-20 ticks to >
> 80k ticks followed by a secure-watchdog bite and a system reset.
> 
> Work around this corner case by only issuing the read transaction when the
> driver state is ATH10K_STATE_ON.
> 
> Tested-on: QCA9988 PCI 10.4-3.9.0.2-00044
> 
> Fixes: 219cc084c6706 ("ath10k: add memory dump support QCA9984")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

d239380196c4 ath10k: pci: Only dump ATH10K_MEM_REGION_TYPE_IOREG when safe
63ec5cbc31f7 ath10k: pci: Fix comment on ath10k_pci_dump_memory_sram

-- 
https://patchwork.kernel.org/patch/11303563/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

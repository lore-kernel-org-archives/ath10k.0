Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIvQ9-00008W-LR
 for ath10k@lists.infradead.org; Tue, 23 Apr 2019 13:25:15 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] ath10k: sdio: workaround firmware UART pin
 configuration bug
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
References: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
Message-Id: <20190423132512.BB8F66158B@smtp.codeaurora.org>
Date: Tue, 23 Apr 2019 13:25:12 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> On QCA6174 SDIO devices the SDIO interrupt will fail if UART is
> disabled from ath10k. SDIO firmware enables UART printouts by
> default. If ath10k will try to enable UART again the firmware
> will configure it's GPIO line incorrectly and SDIO interrupts
> won't work anymore. The workaround is to set UART pin again (19
> for QCA6174 SDIO) if uart_print is 0.
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

6 patches applied to ath-next branch of ath.git, thanks.

4504f0e5b571 ath10k: sdio: workaround firmware UART pin configuration bug
70736b9753fd ath10k: don't disable interrupts in ath10k_sdio_remove()
e2a6b711282a ath10k: htt: don't use txdone_fifo with SDIO
6d084ac27ab4 ath10k: initialise struct ath10k_bus params to zero
8ea51e409eb0 ath10k: htt: support MSDU ids with SDIO
30382dd1cf3a ath10k: fix use-after-free on SDIO data frames

-- 
https://patchwork.kernel.org/patch/10898285/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

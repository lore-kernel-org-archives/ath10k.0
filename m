Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hflKW-0003g2-4V
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 13:17:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add WMI diag fw logging support for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190401132202.29626-1-govinds@codeaurora.org>
References: <20190401132202.29626-1-govinds@codeaurora.org>
Message-Id: <20190625131747.8FDB860AD1@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 13:17:47 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> Integrated WiFi chipset ex:WCN399x supports fw logging
> using WMI copy engine and shared mem DIAG based fw logging.
> By default shared mem DIAG based fw logging is enabled.
> To support WMI copy engine based fw logging add QMI
> control message to enable WMI copy engine based fw logging.
> 
> Enable WMI based fw logging using fw_diag_log module parameter.
> 
> insmod ath10k_core.ko fw_diag_log=1
> 
> DIAG utility(https://github.com/andersson/diag) implements extraction
> of diagnostics related messages between application processor and
> various subsystems while shared mem DIAG based fw logging is enabled.
> 
> Testing: Tested on WCN3990/QCA6174 HW
> Tested FW: WLAN.HL.3.1-00959-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d9e47698965d ath10k: Add WMI diag fw logging support for WCN3990

-- 
https://patchwork.kernel.org/patch/10879943/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

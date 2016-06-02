Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8U3i-0002CL-KD
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 14:57:19 +0000
MIME-Version: 1.0
Subject: Re: [1/5] ath10k: fix operating irq mode for ahb device
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160527144559.4053-1-rmanohar@qti.qualcomm.com>
Message-ID: <cb83c96b3c154a438b0c7e90372d2984@euamsexm01a.eu.qualcomm.com>
Date: Thu, 2 Jun 2016 16:56:51 +0200
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, rmanohar@codeaurora.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> Earlier when operating irq mode is legacy, interrupts are disabled
> and re-enabled based on num_msi_intrs. commit cfe9011a05a8 ("ath10k:
> remove MSI range support") replaced num_msi_intrs by oper_irq_mode.
> Since oper_irq_mode is not initialized for ahb devices (i.e qca4019),
> device boot up is failed during probe.
> 
> Fixes: cfe9011a05a8 ("ath10k: remove MSI range support")
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Thanks, 5 patches applied to ath.git:

2e550b6d277b ath10k: fix operating irq mode for ahb device
10f8ec64a2a6 ath10k: remove unused phy_mode_to_band
b855de0f5792 ath10k: update module description
64e001f41676 ath10k: add new ATH10K_FW_FEATURE_BTCOEX_PARAM
39136248cf8d ath10k: add pdev param support to enable/disable btcoex

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9138581/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

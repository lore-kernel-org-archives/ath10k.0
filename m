Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfl39-0007Ab-DM
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 12:59:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: fix fw crash by moving chip reset after napi
 disabled
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1558667782-10998-1-git-send-email-miaoqing@codeaurora.org>
References: <1558667782-10998-1-git-send-email-miaoqing@codeaurora.org>
Message-Id: <20190625125951.1A2BA606DC@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 12:59:51 +0000 (UTC)
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
To: Miaoqing Pan <miaoqing@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Miaoqing Pan <miaoqing@codeaurora.org> wrote:

> On SMP platform, when continuously running wifi up/down, the napi
> poll can be scheduled during chip reset, which will call
> ath10k_pci_has_fw_crashed() to check the fw status. But in the reset
> period, the value from FW_INDICATOR_ADDRESS register will return
> 0xdeadbeef, which also be treated as fw crash. Fix the issue by
> moving chip reset after napi disabled.
> 
> ath10k_pci 0000:01:00.0: firmware crashed! (guid 73b30611-5b1e-4bdd-90b4-64c81eb947b6)
> ath10k_pci 0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id 0x00000000 sub 168c:cafe
> ath10k_pci 0000:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal otp max-sta 512 raw 0 hwcrypto 1
> ath10k_pci 0000:01:00.0: failed to get memcpy hi address for firmware address 4: -16
> ath10k_pci 0000:01:00.0: failed to read firmware dump area: -16
> ath10k_pci 0000:01:00.0: Copy Engine register dump:
> ath10k_pci 0000:01:00.0: [00]: 0x0004a000   0   0   0   0
> ath10k_pci 0000:01:00.0: [01]: 0x0004a400   0   0   0   0
> ath10k_pci 0000:01:00.0: [02]: 0x0004a800   0   0   0   0
> ath10k_pci 0000:01:00.0: [03]: 0x0004ac00   0   0   0   0
> ath10k_pci 0000:01:00.0: [04]: 0x0004b000   0   0   0   0
> ath10k_pci 0000:01:00.0: [05]: 0x0004b400   0   0   0   0
> ath10k_pci 0000:01:00.0: [06]: 0x0004b800   0   0   0   0
> ath10k_pci 0000:01:00.0: [07]: 0x0004bc00   1   0   1   0
> ath10k_pci 0000:01:00.0: [08]: 0x0004c000   0   0   0   0
> ath10k_pci 0000:01:00.0: [09]: 0x0004c400   0   0   0   0
> ath10k_pci 0000:01:00.0: [10]: 0x0004c800   0   0   0   0
> ath10k_pci 0000:01:00.0: [11]: 0x0004cc00   0   0   0   0
> 
> Tested HW: QCA9984,QCA9887,WCN3990
> 
> Signed-off-by: Miaoqing Pan <miaoqing@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

08d80e4cd27b ath10k: fix fw crash by moving chip reset after napi disabled

-- 
https://patchwork.kernel.org/patch/10959057/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

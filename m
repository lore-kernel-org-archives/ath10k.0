Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfl6i-0000bG-Lj
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 13:03:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix PCIE device wake up failed
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559180960-13565-1-git-send-email-miaoqing@codeaurora.org>
References: <1559180960-13565-1-git-send-email-miaoqing@codeaurora.org>
Message-Id: <20190625130332.57C5E6085C@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 13:03:32 +0000 (UTC)
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

> Observed PCIE device wake up failed after ~120 iterations of
> soft-reboot test. The error message is
> "ath10k_pci 0000:01:00.0: failed to wake up device : -110"
> 
> The call trace as below:
> ath10k_pci_probe -> ath10k_pci_force_wake -> ath10k_pci_wake_wait ->
> ath10k_pci_is_awake
> 
> Once trigger the device to wake up, we will continuously check the RTC
> state until it returns RTC_STATE_V_ON or timeout.
> 
> But for QCA99x0 chips, we use wrong value for RTC_STATE_V_ON.
> Occasionally, we get 0x7 on the fist read, we thought as a failure
> case, but actually is the right value, also verified with the spec.
> So fix the issue by changing RTC_STATE_V_ON from 0x5 to 0x7, passed
> ~2000 iterations.
> 
> Tested HW: QCA9984
> 
> Signed-off-by: Miaoqing Pan <miaoqing@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

011d4111c8c6 ath10k: fix PCIE device wake up failed

-- 
https://patchwork.kernel.org/patch/10968039/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

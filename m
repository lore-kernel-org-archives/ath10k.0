Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkCSu-0002Gi-49
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 18:00:17 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add debugfs file warm_hw_reset
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1531920860-3236-1-git-send-email-mkenna@codeaurora.org>
References: <1531920860-3236-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20180730180005.C6FE360769@smtp.codeaurora.org>
Date: Mon, 30 Jul 2018 18:00:05 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> Debugfs support to do hardware warm reset with WMI command
> WMI_PDEV_PARAM_PDEV_RESET for 10.4 and 10.2.4(if wmi
> service is enabled in the firmware for backward compatibility).
> 
> This change is purely for debugging purpose when hardware hangs/mutes.
> 
> This hardware reset won't affect the connectivity but there will be small
> pause in data traffic. Here we are doing BB/MAC level reset and hence
> whenever the BB/MAC watchdog is triggered, it does a hardware_chip_reset.
> So the target will be in the active state.
> 
> Below command used to warm reset the hardware.
> echo 1 > /sys/kernel/debug/ieee80211/phyX/ath10k/warm_hw_reset
> 
> Tested in QCA988X with firmware ver 10.2.4.70.45
> Tested in QCA4019 with firmware ver 10.4-3.2.1.1-00011
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

db251d7df457 ath10k: add debugfs file warm_hw_reset

-- 
https://patchwork.kernel.org/patch/10532465/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

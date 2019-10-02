Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFiJK-0001Px-F8
 for ath10k@lists.infradead.org; Wed, 02 Oct 2019 17:21:11 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add support for hardware rfkill
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <156985855686.10126.201242458794108566.stgit@potku.adurom.net>
References: <156985855686.10126.201242458794108566.stgit@potku.adurom.net>
Message-Id: <20191002172110.0577960ADE@smtp.codeaurora.org>
Date: Wed,  2 Oct 2019 17:21:09 +0000 (UTC)
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

> When hardware rfkill is enabled in the firmware it will report the
> capability via using WMI_TLV_SYS_CAP_INFO_RFKILL bit in the WMI_SERVICE_READY
> event to the host. ath10k will check the capability, and if it is enabled then
> ath10k will set the GPIO information to firmware using WMI_PDEV_SET_PARAM. When
> the firmware detects hardware rfkill is enabled by the user, it will report it
> via WMI_RFKILL_STATE_CHANGE_EVENTID. Once ath10k receives the event it will
> send wmi command WMI_PDEV_SET_PARAM to the firmware to enable/disable the radio
> and also notifies cfg80211.
> 
> We can't power off the device when rfkill is enabled, as otherwise the
> firmware would not be able to detect GPIO changes and report them to the
> host. So when rfkill is enabled, we need to keep the firmware running.
> 
> Tested with QCA6174 PCI with firmware
> WLAN.RM.4.4.1-00109-QCARMSWPZ-1.
> 
> Signed-off-by: Alan Liu <alanliu@codeaurora.org>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1382993f882b ath10k: add support for hardware rfkill

-- 
https://patchwork.kernel.org/patch/11166921/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

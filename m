Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2CmK-00034d-Da
 for ath10k@lists.infradead.org; Thu, 13 Feb 2020 11:35:34 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: add retry mechanism for ath10k_start
References: <20200120025609.6060-1-wgong@codeaurora.org>
Date: Thu, 13 Feb 2020 13:35:27 +0200
In-Reply-To: <20200120025609.6060-1-wgong@codeaurora.org> (Wen Gong's message
 of "Mon, 20 Jan 2020 10:56:09 +0800")
Message-ID: <87mu9mwwhs.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> When simulate random transfer fail for sdio write and read, it happened
> "Could not init core: -110" and then wlan up fail.
>
> Test steps:
> 1. Add config and update kernel:
> CONFIG_FAIL_MMC_REQUEST=y
> CONFIG_FAULT_INJECTION=y
> CONFIG_FAULT_INJECTION_DEBUG_FS=y
>
> 2. Run simulate fail:
> cd /sys/kernel/debug/mmc1/fail_mmc_request
> echo 100 > probability
> echo 1000 > interval
> echo 1 > times && enter system suspend
> press power button to wakeup system
>
> 3. It happened Could not init core: -110.
> [   66.432068] ath10k_sdio mmc1:0001:1: unable to send the bmi data to the device: -110
> [   66.440012] ath10k_sdio mmc1:0001:1: unable to write to the device
> [   66.453375] ath10k_sdio mmc1:0001:1: Could not init core: -110

[...]

> Add retry mechanism for ath10k_start to make sure wlan up success.

I'm not convinved about this. ath10k assumes that SDIO bus works
reliably and there's no data loss. In my opinion if the SDIO is not
working reliably we should fail immediately with a clear error message
for the user, instead of having an unstable connection. And I understand
from the logs that ath10k fails cleanly in this simulated failure.

So what you do here is ignore the assumption that the SDIO bus should
always work reliably and add a workaround by trying to restart the
firmware multiple times, and hope that by luck it works during one of 10
retry attempts. But then what? Isn't the WLAN connection flaky as SDIO
bus is not reliable? So if we were to follow that design logic,
shouldn't we add retries for _all_ ath10k SDIO transactions? But that
would make ath10k even more complex as it is.

Because I think this patch makes things worse for the user, so I would
like to understand the real life use case this patch is trying to fix
and how it would help the user.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

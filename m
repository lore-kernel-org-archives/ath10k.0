Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSwCz-0000Sw-1R
 for ath10k@lists.infradead.org; Mon, 27 Apr 2020 05:21:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath10k: enable firmware peer stats info for wmi tlv
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200423091856.24297-2-wgong@codeaurora.org>
References: <20200423091856.24297-2-wgong@codeaurora.org>
Message-Id: <20200427052130.EEF2BC433F2@smtp.codeaurora.org>
Date: Mon, 27 Apr 2020 05:21:30 +0000 (UTC)
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

Wen Gong <wgong@codeaurora.org> wrote:

> For wmi tlv type, firmware disable peer stats info by default, after
> enable it, firmware will report WMI_TLV_PEER_STATS_INFO_EVENTID if
> ath10k send WMI_TLV_REQUEST_PEER_STATS_INFO_CMDID to firmware.
> 
> Enable it will only set a flag in firmware, firmware will not report
> it without receive request WMI command.
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

Fails to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath10k/core.h:502
error: drivers/net/wireless/ath/ath10k/core.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath10k/mac.c:8326
error: drivers/net/wireless/ath/ath10k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

4 patches set to Changes Requested.

11505367 [1/4] ath10k: enable firmware peer stats info for wmi tlv
11505377 [2/4] ath10k: add rx bitrate report for SDIO
11505371 [3/4] ath10k: add bitrate parse for peer stats info
11505369 [4/4] ath10k: correct tx bitrate of iw for SDIO

-- 
https://patchwork.kernel.org/patch/11505367/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

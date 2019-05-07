Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0Yw-0005nu-Be
 for ath10k@lists.infradead.org; Tue, 07 May 2019 13:55:26 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix the wrong value of enums for wmi tlv stats id
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1554792193-22535-1-git-send-email-svishnoi@codeaurora.org>
References: <1554792193-22535-1-git-send-email-svishnoi@codeaurora.org>
Message-Id: <20190507135517.DC7AA61230@smtp.codeaurora.org>
Date: Tue,  7 May 2019 13:55:17 +0000 (UTC)
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
To: Surabhi Vishnoi <svishnoi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Surabhi Vishnoi <svishnoi@codeaurora.org> wrote:

> The enum value for WMI_TLV_STAT_PDEV, WMI_TLV_STAT_VDEV
> and WMI_TLV_STAT_PEER is wrong, due to which the vdev stats
> are not received from firmware in wmi_update_stats event.
> 
> Fix the enum values for above stats to receive all stats
> from firmware in WMI_TLV_UPDATE_STATS_EVENTID.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Fixes: f40a307eb92c ("ath10k: Fill rx duration for each peer in fw_stats for WCN3990)
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9280f4fc06f4 ath10k: Fix the wrong value of enums for wmi tlv stats id

-- 
https://patchwork.kernel.org/patch/10890577/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

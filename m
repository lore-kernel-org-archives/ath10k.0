Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJcku-0002GS-W9
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 11:09:18 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Fill the channel survey results for WCN3990
 correctly
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1539775203-22764-1-git-send-email-pillair@codeaurora.org>
References: <1539775203-22764-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20181105110904.4D48F60600@smtp.codeaurora.org>
Date: Mon,  5 Nov 2018 11:09:04 +0000 (UTC)
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

Rakesh Pillai <pillair@codeaurora.org> wrote:

> The host driver currently expects the channel info event to be
> received in pairs for all the channels, i.e. the first
> chan_info event for a particular channel will not have the
> COMPLETE flag set and the second chan_info event for the
> same channel will have the COMPLETE flag set.
> 
> The HL2.0 firmware sends only one channel info event per channel
> which is scanned without the COMPLETE flag set. After sending the
> chan_info_event for all the channels, the HL2.0 firmware sends a
> chan_info_event with COMPLETE flag set to indicate the completion
> of the channel info event.
> 
> The firmware does not indicate this behavior with any service bitmap
> and hence a new firmware feature flag is used to handle the modified
> parsing of the channel info events, in the host driver, for the
> firmware which sends single channel info event per scanned channel.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Co-developed-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

13104929d2ec ath10k: fill the channel survey results for WCN3990 correctly

-- 
https://patchwork.kernel.org/patch/10645331/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

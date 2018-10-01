Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6ydX-0001BW-Lo
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 13:53:26 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Fix tx status flag setting for management
 frames
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1536240447-14841-1-git-send-email-pillair@codeaurora.org>
References: <1536240447-14841-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20181001135313.3F25E60B7A@smtp.codeaurora.org>
Date: Mon,  1 Oct 2018 13:53:13 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> The tx_status for management frames is being filled
> incorrectly in the flags of skb_cb. This incorrect
> flag setting causes the upper layers to consider that
> the particular frame was not transmitted properly,
> leading to improper behavior.
> 
> Set the IEEE80211_TX_STAT_ACK flag in the info flags
> of skb_cb, to indicate the successful transmission of
> the management frame.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Fixes: dc405152bb64d4ae01c9ac669de25b2d1fb6fc2d
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

058a7eab9d9e ath10k: fix tx status flag setting for management frames

-- 
https://patchwork.kernel.org/patch/10590621/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

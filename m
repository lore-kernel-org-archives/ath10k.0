Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grl8V-00061l-Kd
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:58:45 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fill tx_duration for each peer in Tx stats per STA
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1548999390-25576-1-git-send-email-svishnoi@codeaurora.org>
References: <1548999390-25576-1-git-send-email-svishnoi@codeaurora.org>
Message-Id: <20190207145843.5A1436030D@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 14:58:43 +0000 (UTC)
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

> Firmware sends the tx_duration for each in HTT_T2H_MSG_TYPE_PEER_STATS
> msg. Fill the tx_duration sent by firmware in the tx stats information
> per STA.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1,
>            WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

056550291d98 ath10k: fill tx_duration for each peer in Tx stats per STA

-- 
https://patchwork.kernel.org/patch/10791825/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

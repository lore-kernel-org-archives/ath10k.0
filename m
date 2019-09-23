Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCIm3-0006Wz-6A
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 07:28:45 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add peer param map for tlv and non-tlv
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550556576-19803-1-git-send-email-pillair@codeaurora.org>
References: <1550556576-19803-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190923072841.9CE6761528@smtp.codeaurora.org>
Date: Mon, 23 Sep 2019 07:28:41 +0000 (UTC)
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

> The peer param id for PEER_PARAM_USE_FIXED_PWR
> is different for tlv and non-tlv firmware. This
> causes incorrect peer param to be set by the driver
> to the firmware(tlv/non-tlv).
> 
> Create seperate peer param map for tlv and non-tlv
> firmware and attach the peer param id based on the
> firmware type during the init.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c0e33fe6fb0f ath10k: Add peer param map for tlv and non-tlv

-- 
https://patchwork.kernel.org/patch/10819255/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

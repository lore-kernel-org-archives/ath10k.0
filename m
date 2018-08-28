Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fueOn-0004YM-Ez
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 13:51:15 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Limit available channels via DT
 ieee80211-freq-limit
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180730153933.3771-1-sven.eckelmann@openmesh.com>
References: <20180730153933.3771-1-sven.eckelmann@openmesh.com>
Message-Id: <20180828135103.0C74660388@smtp.codeaurora.org>
Date: Tue, 28 Aug 2018 13:51:02 +0000 (UTC)
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sven Eckelmann <sven.eckelmann@openmesh.com> wrote:

> Tri-band devices (1x 2.4GHz + 2x 5GHz) often incorporate special filters in
> the RX and TX path. These filtered channel can in theory still be used by
> the hardware but the signal strength is reduced so much that it makes no
> sense.
> 
> There is already a DT property to limit the available channels but ath10k
> has to manually call this functionality to limit the currrently set wiphy
> channels further.
> 
> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

34d5629d2ca8 ath10k: limit available channels via DT ieee80211-freq-limit

-- 
https://patchwork.kernel.org/patch/10549245/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

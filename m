Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFG9H-0006WQ-CX
 for ath10k@lists.infradead.org; Tue, 01 Oct 2019 11:16:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath10k: switch to ieee80211_tx_dequeue_ni
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190617200140.6189-2-erik.stromdahl@gmail.com>
References: <20190617200140.6189-2-erik.stromdahl@gmail.com>
Message-Id: <20191001111655.1983D6053D@smtp.codeaurora.org>
Date: Tue,  1 Oct 2019 11:16:55 +0000 (UTC)
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, johannes@sipsolutions.net, davem@davemloft.net

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:

> Since ath10k_mac_tx_push_txq() can be called from process context, we
> must explicitly disable softirqs before the call into mac80211.
> 
> By calling ieee80211_tx_dequeue_ni() instead of ieee80211_tx_dequeue()
> we make sure softirqs are always disabled even in the case when
> ath10k_mac_tx_push_txq() is called from process context.
> 
> Calling ieee80211_tx_dequeue_ni() with softirq's already disabled
> (e.g., from softirq context) should be safe as the local_bh_disable()
> and local_bh_enable() functions (called from ieee80211_tx_dequeue_ni)
> are fully reentrant.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

306547608c84 ath10k: switch to ieee80211_tx_dequeue_ni

-- 
https://patchwork.kernel.org/patch/11000363/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFGdo-0003XB-5R
 for ath10k@lists.infradead.org; Tue, 01 Oct 2019 11:48:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: switch to ieee80211_tx_dequeue_ni
References: <20190617200140.6189-1-erik.stromdahl@gmail.com>
 <20190617200140.6189-2-erik.stromdahl@gmail.com>
Date: Tue, 01 Oct 2019 14:48:20 +0300
In-Reply-To: <20190617200140.6189-2-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Mon, 17 Jun 2019 22:01:40 +0200")
Message-ID: <87eezw660r.fsf@kamboji.qca.qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, davem@davemloft.net, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

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

I already applied this, but I still want to check _why_ you are changing
this? Is it that you want to call ath10k_mac_tx_push_pending() from a
workqueue in sdio.c in a future patch, or what? Because at the moment me
and Johannes were not able to find where this is called in process
context.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

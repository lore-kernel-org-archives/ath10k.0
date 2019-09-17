Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iA7ec-0000Dj-Lo
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 07:12:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove TX lock from ath10k_htt_tx_inc_pending
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190824134857.4094-1-erik.stromdahl@gmail.com>
References: <20190824134857.4094-1-erik.stromdahl@gmail.com>
Message-Id: <20190917071202.3752F6016D@smtp.codeaurora.org>
Date: Tue, 17 Sep 2019 07:12:02 +0000 (UTC)
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
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:

> This commit removes the call to ath10k_mac_tx_lock() from
> ath10k_htt_tx_inc_pending() in case the high water mark is reached.
> 
> ath10k_mac_tx_lock() calls ieee80211_stop_queues() in order to stop
> mac80211 from pushing more TX data to the driver (this is the TX lock).
> 
> If a driver is trying to fetch an skb from a queue while the queue is
> stopped, ieee80211_tx_dequeue() will return NULL.
> 
> So, in ath10k_mac_tx_push_txq(), there is a risk that the call to
> ath10k_htt_tx_inc_pending() results in a stop of the mac80211 TX queues
> just before the skb is fetched.
> 
> This will cause ieee80211_tx_dequeue() to return NULL and
> ath10k_mac_tx_push_txq() to exit prematurely and return -ENOENT.
> Before the function returns ath10k_htt_tx_dec_pending() will be called.
> This call will re-enable the TX queues through ath10k_mac_tx_unlock().
> When ath10k_mac_tx_push_txq() has returned, the TX queue will be
> returned back to mac80211 with ieee80211_return_txq() without the skb
> being properly consumed.
> 
> Since the TX queues were re-enabled in the error exit path of
> ath10k_mac_tx_push_txq(), mac80211 can continue pushing data to the
> driver. If the hardware does not consume the data, the above mentioned
> case will be repeated over and over.
> 
> A case when the hardware is not able to transmit the data from the host
> is when a STA has been dis-associated from an AP and has not yet been
> able to re-associate. In this case there will be no TX_COMPL_INDs from
> the hardware, resulting in the TX counter not be decremented.
> 
> This phenomenon has been observed in both a real and a test setup.
> 
> In order to fix this, the actual TX locking (the call to
> ath10k_mac_tx_lock()) was removed from ath10k_htt_tx_inc_pending().
> Instead, ath10k_mac_tx_lock() is called separately after the skb has
> been fetched (after the call to ieee80211_tx_dequeue()). At this point
> it is OK to stop the queues.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

What hardware and firmware versions did you test this? Please always add that
to the commit log.

As Erik mostly works on SDIO I assume PCI is not that well tested. Has anyone
else tried this?

-- 
https://patchwork.kernel.org/patch/11112997/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

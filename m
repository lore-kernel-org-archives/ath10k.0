Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i24zu-0007lZ-Av
 for ath10k@lists.infradead.org; Mon, 26 Aug 2019 02:44:48 +0000
Subject: RE: [PATCH] ath10k: remove TX lock from ath10k_htt_tx_inc_pending
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Mon, 26 Aug 2019 02:44:37 +0000
Message-ID: <4cd30880ae754f5599e6b1a4c1ac6a74@aptaiexm02f.ap.qualcomm.com>
References: <20190824134857.4094-1-erik.stromdahl@gmail.com>
In-Reply-To: <20190824134857.4094-1-erik.stromdahl@gmail.com>
Content-Language: en-US
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>, Kalle Valo <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Erik
> Stromdahl
> Sent: Saturday, August 24, 2019 9:49 PM
> To: Kalle Valo <kvalo@qca.qualcomm.com>; linux-wireless@vger.kernel.org;
> ath10k@lists.infradead.org
> Cc: Erik Stromdahl <erik.stromdahl@gmail.com>
> Subject: [EXT] [PATCH] ath10k: remove TX lock from
> ath10k_htt_tx_inc_pending
> 
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
Is this patch will impact throughput?
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

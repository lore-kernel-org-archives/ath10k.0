Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLY8u-0001sX-3N
 for ath10k@lists.infradead.org; Wed, 23 May 2018 18:05:48 +0000
MIME-Version: 1.0
Date: Wed, 23 May 2018 11:05:32 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: transmit queued frames after waking queues
In-Reply-To: <c131da6e-6479-3a40-fbd3-9c61d6690ba8@gmail.com>
References: <20180521204359.23884-1-niklas.cassel@linaro.org>
 <8195be7603a8cd659d25a9c3d898b891@codeaurora.org>
 <20180522211521.GA26123@localhost.localdomain>
 <c131da6e-6479-3a40-fbd3-9c61d6690ba8@gmail.com>
Message-ID: <ddcd48cc8b1a77c489214a4f63c54b1a@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless-owner@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, Niklas Cassel <niklas.cassel@linaro.org>, "David S. Miller" <davem@davemloft.net>

On 2018-05-23 09:25, Erik Stromdahl wrote:
> On 05/22/2018 11:15 PM, Niklas Cassel wrote:
> 
[...]
>> 
>> Perhaps it would be possible to call ath10k_mac_tx_push_pending()
>> from the equivalent to ath10k_htt_txrx_compl_task(),
>> but from SDIO's point of view.
> An equivalent for SDIO would most likely be 
> *ath10k_htt_htc_t2h_msg_handler*
> or any of the other functions called from this function.
> 
> *ath10k_txrx_tx_unref* is actually called from 
> *ath10k_htt_htc_t2h_msg_handler*,
> so that function could be viewed as an equivalent.
> 
> If the call should be added in the bus driver (sdio.c) it should most 
> likely be
> placed in *ath10k_sdio_mbox_rx_process_packets*
> 
> 		if (!pkt->trailer_only) {
> 			ep->ep_ops.ep_rx_complete(ar_sdio->ar, pkt->skb);
> 			ath10k_mac_tx_push_pending(ar_sdio->ar);
> 		} else {
> 			kfree_skb(pkt->skb)
> 		}
> 
> The above call would of course result in lot's of calls to
> *ath10k_mac_tx_push_pending*
> Adding a htt_num_pending check here wouldn't look nice.
> 
> The HL RX path differs from the LL path in that the t2h_msg_handler 
> returns
> false indicating that it has consumed the skb.
> 
> This is because it is the HL RX indication handler that delivers the 
> skb's
> to mac80211.
> 
I also dont prefer to call *_push_pending for every HTC packets. Similar 
to
LL approach, call ath10k_mac_tx_push_pending after processing all 
pending
rx messages like calling from ath10k_sdio_mbox_rxmsg_pending_handler.

--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -807,6 +807,8 @@ static int 
ath10k_sdio_mbox_rxmsg_pending_handler(struct ath10k *ar,
                 ath10k_warn(ar, "failed to get pending recv messages: 
%d\n",
                             ret);

+       ath10k_mac_tx_push_pending(ar);
+
         return ret;
  }

> Another solution could be to add an *else-statement* as a part of the
> *if (release)*
> in *ath10k_htt_htc_t2h_msg_handler*, where
> *ath10k_mac_tx_push_pending* could be called.
> 
> Something like this perhaps:
> 
> 	/* Free the indication buffer */
> 	if (release)
> 		dev_kfree_skb_any(skb);
> 	else if (!ar->htt.num_pending_tx)
> 		ath10k_mac_tx_push_pending(ar);
> 
> I think I prefer your original patch though.
>> 

Better to do changes as HL specific path instead in common path.
The above change will impact QCA6174 based devices.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

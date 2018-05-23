Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLWbM-0000y1-P1
 for ath10k@lists.infradead.org; Wed, 23 May 2018 16:27:02 +0000
Received: by mail-wr0-x241.google.com with SMTP id 94-v6so27571267wrf.5
 for <ath10k@lists.infradead.org>; Wed, 23 May 2018 09:26:49 -0700 (PDT)
Subject: Re: [PATCH v2] ath10k: transmit queued frames after waking queues
References: <20180521204359.23884-1-niklas.cassel@linaro.org>
 <8195be7603a8cd659d25a9c3d898b891@codeaurora.org>
 <20180522211521.GA26123@localhost.localdomain>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <c131da6e-6479-3a40-fbd3-9c61d6690ba8@gmail.com>
Date: Wed, 23 May 2018 18:25:49 +0200
MIME-Version: 1.0
In-Reply-To: <20180522211521.GA26123@localhost.localdomain>
Content-Language: en-US
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
To: Niklas Cassel <niklas.cassel@linaro.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, "David S. Miller" <davem@davemloft.net>



On 05/22/2018 11:15 PM, Niklas Cassel wrote:

<snip>
>>
>> Earlier we observed performance issues in calling push_pending from each
>> tx completion. IMHO this change may introduce the same problem again.
> 
> I prefer functional TX over performance issues,
> but I agree that it is unfortunate that SDIO doesn't use
> ath10k_htt_txrx_compl_task().
> Erik, is there a reason for this?
The reason is that the SDIO code has been derived mainly from qcacld and ath6kl
and they don't implement napi.

ath10k_htt_txrx_compl_task is currently only called from the napi poll function,
and the sdio bus driver doesn't have such a function.

> 
> Perhaps it would be possible to call ath10k_mac_tx_push_pending()
> from the equivalent to ath10k_htt_txrx_compl_task(),
> but from SDIO's point of view.
An equivalent for SDIO would most likely be *ath10k_htt_htc_t2h_msg_handler*
or any of the other functions called from this function.

*ath10k_txrx_tx_unref* is actually called from *ath10k_htt_htc_t2h_msg_handler*,
so that function could be viewed as an equivalent.

If the call should be added in the bus driver (sdio.c) it should most likely be
placed in *ath10k_sdio_mbox_rx_process_packets*

		if (!pkt->trailer_only) {
			ep->ep_ops.ep_rx_complete(ar_sdio->ar, pkt->skb);
			ath10k_mac_tx_push_pending(ar_sdio->ar);
		} else {
			kfree_skb(pkt->skb)
		}

The above call would of course result in lot's of calls to *ath10k_mac_tx_push_pending*
Adding a htt_num_pending check here wouldn't look nice.

The HL RX path differs from the LL path in that the t2h_msg_handler returns
false indicating that it has consumed the skb.

This is because it is the HL RX indication handler that delivers the skb's
to mac80211.

Another solution could be to add an *else-statement* as a part of the *if (release)*
in *ath10k_htt_htc_t2h_msg_handler*, where *ath10k_mac_tx_push_pending* could be called.

Something like this perhaps:

	/* Free the indication buffer */
	if (release)
		dev_kfree_skb_any(skb);
	else if (!ar->htt.num_pending_tx)
		ath10k_mac_tx_push_pending(ar);

I think I prefer your original patch though.
> 
> Another solution might be to change so that we only call
> ath10k_mac_tx_push_pending() from ath10k_txrx_tx_unref()
> if (htt->num_pending_tx == 0). That should decrease the number
> of calls to ath10k_mac_tx_push_pending(), while still avoiding
> a "TX deadlock" scenario for SDIO.
Just out of curiosity, where did the limit of 3 come from?
If it works with a limit of 0, I think it should be used instead.

Another intersting thing that I stumbled upon when looking into the
code (while writing this email) is the *wake_up(&htt->empty_tx_wq);*

For some reason I have considered it not to be applicable for HL devices.

The queue is waited for in the flush op (*ath10k_flush*).
I am unsure what it is used for, but I don't think it affects the TX
deadlock scenario.

--
Erik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

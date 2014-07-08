Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4PY1-0008Jr-NE
 for ath10k@lists.infradead.org; Tue, 08 Jul 2014 07:10:42 +0000
Message-ID: <1404803407.4419.3.camel@jlt4.sipsolutions.net>
Subject: Re: [RFC/RFT 1/2] mac80211: add support for Rx reordering offloading
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 08 Jul 2014 09:10:07 +0200
In-Reply-To: <1403860015-31601-2-git-send-email-michal.kazior@tieto.com>
 (sfid-20140627_111730_127587_DA36C97E)
References: <1403860015-31601-1-git-send-email-michal.kazior@tieto.com>
 <1403860015-31601-2-git-send-email-michal.kazior@tieto.com>
 (sfid-20140627_111730_127587_DA36C97E)
Mime-Version: 1.0
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Denton Gentry <denton.gentry@gmail.com>

On Fri, 2014-06-27 at 11:06 +0200, Michal Kazior wrote:

> +/**
> + * ieee80211_start_rx_ba_session_offl - start a Rx BA session
> + *
> + * Some device drivers may offload part of the Rx aggregation flow including
> + * AddBa/DelBa negotiation but may otherwise be incapable of full Rx
> + * reordering.
> + *
> + * Create structures responsible for reordering so device drivers may call here
> + * when they complete AddBa negotiation.
> + *
> + * @vif: &struct ieee80211_vif pointer from the add_interface callback
> + * @addr: station mac address
> + * @dialog_token:
> + * @timeout: session timeout (in TU)

Why would you need the dialog token (and why no docs?) and timeout?

> + * @start_seq_num: starting frame sequence number
> + * @tid: the rx tid

> + * @buf_size: max number of frames in reorder buffer

The buf_size also isn't really needed, is it? We are allowed to use a
bigger buffer, I believe?

> +void ieee80211_start_rx_ba_session_offl(struct ieee80211_vif *vif,
> +					const u8 *addr, u8 dialog_token,
> +					u16 timeout, u16 start_seq_num,
> +					u16 tid, u16 buf_size)
> +{
> +	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
> +	struct ieee80211_local *local = sdata->local;
> +	struct ieee80211_rx_agg *rx_agg;
> +	struct sk_buff *skb = dev_alloc_skb(0);
> +
> +	if (unlikely(!skb))
> +		return;
> +
> +	rx_agg = (struct ieee80211_rx_agg *) &skb->cb;
> +	memcpy(&rx_agg->addr, addr, ETH_ALEN);
> +	rx_agg->dialog_token = dialog_token;
> +	rx_agg->timeout = timeout;
> +	rx_agg->start_seq_num = start_seq_num;
> +	rx_agg->ba_policy = 1;
> +	rx_agg->tid = tid;
> +	rx_agg->buf_size = buf_size;
> +
> +	skb->pkt_type = IEEE80211_SDATA_QUEUE_RX_AGG_START;
> +	skb_queue_tail(&sdata->skb_queue, skb);
> +	ieee80211_queue_work(&local->hw, &sdata->work);

This seems problematic, since packets might be received immediately.

On the teardown path it should probably also be invalidated immediately,
no?

Then again, we have the same problem already? Hmm.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

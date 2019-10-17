Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL2Kg-0003Bf-UC
 for ath10k@lists.infradead.org; Thu, 17 Oct 2019 09:44:36 +0000
Received: by mail-lj1-f197.google.com with SMTP id m8so310378ljb.3
 for <ath10k@lists.infradead.org>; Thu, 17 Oct 2019 02:44:30 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v2 4/4] mac80211: Use Airtime-based Queue Limits (AQL) on
 packet dequeue
In-Reply-To: <CA+iem5s=xbzZ5goaBO4tZWUKVQRaXb+SnB34NPCppej9mi8sAA@mail.gmail.com>
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115994190.2500430.14955682016008497593.stgit@toke.dk>
 <CA+iem5s=xbzZ5goaBO4tZWUKVQRaXb+SnB34NPCppej9mi8sAA@mail.gmail.com>
Date: Thu, 17 Oct 2019 11:44:27 +0200
Message-ID: <87o8yfg0zo.fsf@toke.dk>
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
To: Kan Yan <kyan@google.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Kan Yan <kyan@google.com> writes:

> Hi Toke,
>
> Thanks for getting this done! I will give it a try in the next few
> days.  A few comments:
>
>> The estimated airtime for each skb is stored in the tx_info, so we can
>> subtract the same amount from the running total when the skb is freed or
>> recycled.
>
> Looks like ath10k driver zero out the info->status before calling
> ieee80211_tx_status(...):
> int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
>                          const struct htt_tx_done *tx_done)
> {
>  ...
>         info = IEEE80211_SKB_CB(msdu);
>         memset(&info->status, 0, sizeof(info->status));
> ...
>         ieee80211_tx_status(htt->ar->hw, msdu);
> }

Ah, bugger; I was afraid we'd run into this. A quick grep indicates that
it's only ath10k and iwl that do this, though, so it's probably
manageable to just fix this. I think the simplest solution is just to
restore the field after clearing, no?

> We need either restore the info->status.tx_time_est or calling
> ieee80211_sta_update_pending_airtime() in ath10k before tx_time_est
> get erased.
>
>> +       if (local->airtime_flags & AIRTIME_USE_AQL) {
>> +               airtime = ieee80211_calc_expected_tx_airtime(hw, vif, txq->sta,
>> +                                                            skb->len + 38);
>
> I think it is better to put the "+  38" that takes care of the header
> overhead inside ieee80211_calc_expected_tx_airtime().

Hmm, no strong opinion about this; but yeah, since we have a dedicated
function for this use I guess there's no harm in adding it there :)

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLmfT-00049y-Of
 for ath10k@lists.infradead.org; Sat, 19 Oct 2019 11:13:09 +0000
Received: by mail-lj1-f199.google.com with SMTP id p14so1609537ljh.22
 for <ath10k@lists.infradead.org>; Sat, 19 Oct 2019 04:12:58 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v3 4/4] mac80211: Use Airtime-based Queue Limits (AQL) on
 packet dequeue
In-Reply-To: <CA+iem5sCTsPe4PW=0j20NoAratvdCvB0ss7zO3wMWLcirXsLgg@mail.gmail.com>
References: <157140962094.2866668.3383184317264069493.stgit@toke.dk>
 <157140962534.2866668.1182822483250825739.stgit@toke.dk>
 <CA+iem5sCTsPe4PW=0j20NoAratvdCvB0ss7zO3wMWLcirXsLgg@mail.gmail.com>
Date: Sat, 19 Oct 2019 13:12:55 +0200
Message-ID: <87o8ydc7k8.fsf@toke.dk>
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
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Kan Yan <kyan@google.com> writes:

>> +       if (local->airtime_flags & AIRTIME_USE_AQL) {
>> +               airtime = ieee80211_calc_expected_tx_airtime(hw, vif, txq->sta,
>> +                                                            skb->len);
>> +               if (airtime) {
>> +                       /* We only have 10 bits in tx_time_est, so store airtime
>> +                        * in increments of 4 us and clamp that to 2**10.
>> +                        */
>> +                       info->tx_time_est = min_t(u32, airtime >> 2, 1 << 10);
>> +                       ieee80211_sta_update_pending_airtime(local, tx.sta, ac,
>> +                                                            airtime, false);
>> +               }
>> +       }
>> +
>
> It should be:
>                          ieee80211_sta_update_pending_airtime(local, tx.sta, ac,
>
> info->tx_time_est << 2, false);
>
> The airtime rounded to 4us (info->tx_time_est << 2), instead of the
> original airtime should be used when registering the pending airtime,
> to keep it consistent with airtime subtracted when the skb is freed.

Yes, I realised that last night as well. The rounding is also off (max
is 2**10-1, not 2**10. Will send a v4 :)

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

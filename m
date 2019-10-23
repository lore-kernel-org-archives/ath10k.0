Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNBqk-00012M-NT
 for ath10k@lists.infradead.org; Wed, 23 Oct 2019 08:18:36 +0000
Received: by mail-lf1-f72.google.com with SMTP id l2so1757708lfk.21
 for <ath10k@lists.infradead.org>; Wed, 23 Oct 2019 01:18:29 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v4 4/4] mac80211: Use Airtime-based Queue Limits (AQL) on
 packet dequeue
In-Reply-To: <CA+iem5tZ95Jd9htLEdAJMubuFeWeUibK9MhTnTHLWNucX6_cRg@mail.gmail.com>
References: <157148503415.2989444.7391437309981941226.stgit@toke.dk>
 <157148503865.2989444.7118792679603045723.stgit@toke.dk>
 <CA+iem5sy16=xMZjJi1nKHrxP_xWHk-86G=ZLwtMMb04EOt5tQA@mail.gmail.com>
 <871rv5ovwr.fsf@toke.dk>
 <CA+iem5tZ95Jd9htLEdAJMubuFeWeUibK9MhTnTHLWNucX6_cRg@mail.gmail.com>
Date: Wed, 23 Oct 2019 10:18:26 +0200
Message-ID: <87tv7znact.fsf@toke.dk>
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

>> >> +               if (ieee80211_is_data_qos(hdr->frame_control)) {
>> >> +                       qc = ieee80211_get_qos_ctl(hdr);
>> >> +                       tid = qc[0] & 0xf;
>> >> +                       ac = ieee80211_ac_from_tid(tid);
>> >> +               } else {
>> >> +                       ac = IEEE80211_AC_BE;
>> >> +               }
>> >
>> > The tid/ac is incorrect either here or in __ieee80211_tx_status() when
>> > tested with ath10k. The ac is set to AC_BE with test done using BK
>> > class traffic, hence the pending airtime get updated for the wrong
>> > txq.
>>
>> Huh, well that won't do, obviously :)
>>
>> Any idea why it might be wrong?
>
> somehow  ieee80211_is_data_qos() returns false. Besides,  qos_control
> field doesn't seems to be set in ieee80211_build_hdr().
>
>> Hmm, I guess we could just get the ac using skb_get_queue_mapping().
>> I'll send an update with this fixed for you to try :)
> Thanks for the quick update. It is getting much better, but
> unfortunately the pending airtime accounting sometimes is still not
> correct and cause txq stuck occasionally.

OK, so that has to mean that there are packets getting dropped somewhere
without going through ieee80211_report_used_skb(). Assuming you're not
hitting the underflow warnings, just seeing the counter not get back
down to zero?

Could you see if you can find out if ath10k does that anywhere? I'll go
hunting in mac80211.

Looking for calls to kfree_skb() or kfree_skb_list() should hopefully
turn up something...

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

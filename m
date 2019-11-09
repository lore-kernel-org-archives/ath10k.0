Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTOpU-0003al-IQ
 for ath10k@lists.infradead.org; Sat, 09 Nov 2019 11:22:58 +0000
Received: by mail-lj1-f197.google.com with SMTP id p25so1753413lji.23
 for <ath10k@lists.infradead.org>; Sat, 09 Nov 2019 03:22:52 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v6 3/4] mac80211: Implement Airtime-based Queue Limit (AQL)
In-Reply-To: <CA+iem5saT0ntxnSV1ZatFuRRcaBzivkQ_MU66ZdV1kfb1dC6Qg@mail.gmail.com>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474287.150713.12867638269538730397.stgit@toke.dk>
 <1a2eb096119c9029e67caf797564d6511c8803a7.camel@sipsolutions.net>
 <87a796fxgd.fsf@toke.dk>
 <f395a9a971ca1a0d0438fca10dfb160c421caa7a.camel@sipsolutions.net>
 <874kzefwt3.fsf@toke.dk>
 <300bf0146db6c0d5890699b3911d35174d28c9c0.camel@sipsolutions.net>
 <CA+iem5saT0ntxnSV1ZatFuRRcaBzivkQ_MU66ZdV1kfb1dC6Qg@mail.gmail.com>
Date: Sat, 09 Nov 2019 12:22:49 +0100
Message-ID: <87k189qoom.fsf@toke.dk>
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
To: Kan Yan <kyan@google.com>, Johannes Berg <johannes@sipsolutions.net>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Kan Yan <kyan@google.com> writes:

> It is most likely just insufficient locking. active_txq_lock is per
> AC, can't protect local->aql_total_pending_airtime against racing
> conditions:
> void ieee80211_sta_update_pending_airtime(...)
> {
>         spin_lock_bh(&local->active_txq_lock[ac]);
>         ...
>         local->aql_total_pending_airtime -= tx_airtime;
>         ...
>         spin_unlock_bh(&local->active_txq_lock[ac]);
> }

Ohh, right; didn't even realise those were not per-AC as well...

> After changing it to atomic_t, no more aql_total_pending_airtime
> underflow so far :). Using atomic operation should also help reduce
> CPU overhead due to lock contention, as
> ieee80211_sta_update_pending_airtime() is often called from the tx
> completion routine triggered by interrupts, often in a different core
> than where __ieee80211_schedule_txq() is running.
>
> I will post a new version a bit later if the test goes well.

Awesome! :)

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

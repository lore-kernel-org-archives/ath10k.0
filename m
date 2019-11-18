Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWdzU-0002tI-SP
 for ath10k@lists.infradead.org; Mon, 18 Nov 2019 10:10:43 +0000
Received: by mail-lf1-f72.google.com with SMTP id f20so1022335lfh.7
 for <ath10k@lists.infradead.org>; Mon, 18 Nov 2019 02:10:32 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v9 4/4] mac80211: Use Airtime-based Queue Limits (AQL) on
 packet dequeue
In-Reply-To: <CA+iem5vVhwTsTvAgnC_HF0utMDSfgyLCe2M=gfUOFU2VjjCB8Q@mail.gmail.com>
References: <157382403672.580235.12525941420808058808.stgit@toke.dk>
 <157382404118.580235.14216392299709793599.stgit@toke.dk>
 <CA+iem5tF+TN-osfGxu=EU5Xt1Uq+PcKgBVaoAmZY3a3JzS5JzQ@mail.gmail.com>
 <87y2wgjas4.fsf@toke.dk>
 <CA+iem5vVhwTsTvAgnC_HF0utMDSfgyLCe2M=gfUOFU2VjjCB8Q@mail.gmail.com>
Date: Mon, 18 Nov 2019 11:10:29 +0100
Message-ID: <87muctcx62.fsf@toke.dk>
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
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Kan Yan <kyan@google.com> writes:

>> > Given the fact that AQL is only tested in very limited platforms,
>> > should we set the default to disabled by removing this change in the
>> > next update?
>> >
>> > -       local->airtime_flags = AIRTIME_USE_TX | AIRTIME_USE_RX;
>> > +
>> > +       local->airtime_flags = AIRTIME_USE_TX |
>> > +                              AIRTIME_USE_RX |
>> > +                              AIRTIME_USE_AQL;
>> > +       local->aql_threshold = IEEE80211_AQL_THRESHOLD;
>> > +       atomic_set(&local->aql_total_pending_airtime, 0);
>> Well, we have the whole -rc series to get more testing in if we merge it
>> as-is. It's up to the maintainers, of course, but I would be in favour
>> of merging as-is, then optionally backing out the default before the
>> final release if problems do turn up. But I would hope that the limits
>> are sufficiently conservative that it would not result in any problems :)
>
> Sounds good. The current default limits are reasonably conservative
> and are tunable via debugfs.
>
> I will give the v10 version of this patch serial a quick test and
> hopefully we can wrap it up soon.

Sounds good, thanks! Also, seems we got a 5.4-rc8 yesterday, so we have
another week before the merge window.

Johannes, any chance you'll get a chance to take a look at this sometime
this week? :)

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

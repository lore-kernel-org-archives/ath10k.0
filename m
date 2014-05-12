Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x233.google.com ([2607:f8b0:400c:c01::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjjd2-00069E-DU
 for ath10k@lists.infradead.org; Mon, 12 May 2014 06:22:25 +0000
Received: by mail-ve0-f179.google.com with SMTP id oy12so8308553veb.10
 for <ath10k@lists.infradead.org>; Sun, 11 May 2014 23:22:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fvkfim49.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-29WHKcUCYbPiC93mZCdJnHP3Fc+r_SHXYgKHSJvz-Pvw@mail.gmail.com>
 <87wqdriorw.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-3dREsfjYR_2rpDxjeKEy8ZwqEZ9yXXYtoB8J92AqGB9A@mail.gmail.com>
 <87fvkfim49.fsf@kamboji.qca.qualcomm.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Mon, 12 May 2014 02:21:42 -0400
Message-ID: <CAHqTa-32OAgHmHY_nLhg9yB-whJx7cmxeb9tdF2OOe7rvHbkAg@mail.gmail.com>
Subject: Re: Receiving your own wifi beacons
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Mon, May 12, 2014 at 1:47 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>> We aren't using DFS (does ath10k even support DFS yet?).
>
> Yes, ath10k supports DFS on ETSI channels but only with one BSS. Michal
> has been working on mac80211 DFS with multiple BSS support and he is
> getting close to finish that. And I'm hoping to get FCC and MKK support
> to ath.ko soon.

Oh good :)  We don't need that immediately but it'll be good to have
when it's ready.

>> If you have any other suggestions, please let us know.
>
> Do you know if interrupts are still working when the problem appears?
> What about other ath10k functionality and driver's communication to the
> firmware, is that working normally? For example, can you retrieve stats
> from firmware when the issue happens?

Not sure.  hostapd doesn't seem upset, and the driver doesn't seem to
be complaining about anything.

What's a good command to retrieve the firmware stats?  We can have
that run periodically and see if it ever starts failing.

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

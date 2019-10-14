Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKAEJ-0001Wb-9f
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 23:58:24 +0000
Received: by mail-lj1-x243.google.com with SMTP id v24so18300506ljj.3
 for <ath10k@lists.infradead.org>; Mon, 14 Oct 2019 16:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191011022413.176208-1-kyan@google.com>
 <87wod7y9ui.fsf@kamboji.qca.qualcomm.com>
 <87sgnvy9c2.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87sgnvy9c2.fsf@kamboji.qca.qualcomm.com>
From: Kan Yan <kyan@google.com>
Date: Mon, 14 Oct 2019 16:58:04 -0700
Message-ID: <CA+iem5uLYFVQjPaE1QDKc6c+eKz8Xd4LbwczYXOBKP3q+HHdBg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Implement Airtime-based Queue Limit (AQL)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: make-wifi-fast@lists.bufferbloat.net, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Yibo Zhao <yiboz@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>

Hi Kalle,

Thanks for the help and tips.  Will do that if I need to submit again.

I believe Toke will integrate this with his version and move the
estimating pending airtime part to mac80211, so maybe in the next
version, ath10k change is no longer required.

Thanks,
Kan


On Mon, Oct 14, 2019 at 2:18 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Kalle Valo <kvalo@codeaurora.org> writes:
>
> > Kan Yan <kyan@google.com> writes:
> >
> >> This patch series implements Airtime-based Queue Limit (AQL) in the
> >> mac80211 and Ath10k driver. It is based on an earlier version from
> >> the ChromiumOS tree[0].
> >>
> >> This version has been tested with QCA9884 platform with 4.14 kernel.
> >> Tests show AQL is able to reduce latency by an order of magnitude in
> >> a congested environment without negative impact on the throughput.
> >>
> >> [0]
> >> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1703105/7
> >>
> >> Kan Yan (2):
> >>   mac80211: Implement Airtime-based Queue Limit (AQL)
> >>   ath10k: Enable Airtime-based Queue Limit (AQL)
> >
> > Please always include a change log so that people know what has changed
> > since the previous version:
> >
> > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#changelog_missing
>
> Never mind, you actually had the changelog after the signature separator
> ("-- \n" line) and I automatically skip the signature :) So instead I
> recommend moving the change log up and above the signature separator.
>
> --
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

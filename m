Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMZ89-0007RN-3e
 for ath10k@lists.infradead.org; Mon, 21 Oct 2019 14:57:58 +0000
Received: by mail-wm1-f72.google.com with SMTP id a81so2491021wma.4
 for <ath10k@lists.infradead.org>; Mon, 21 Oct 2019 07:57:53 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v4 0/2] Implement Airtime-based Queue Limit (AQL)
In-Reply-To: <87r236tbgz.fsf@kamboji.qca.qualcomm.com>
References: <20191011022413.176208-1-kyan@google.com>
 <87wod7y9ui.fsf@kamboji.qca.qualcomm.com>
 <87sgnvy9c2.fsf@kamboji.qca.qualcomm.com>
 <CA+iem5uLYFVQjPaE1QDKc6c+eKz8Xd4LbwczYXOBKP3q+HHdBg@mail.gmail.com>
 <87r236tbgz.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 21 Oct 2019 16:57:50 +0200
Message-ID: <878speqh75.fsf@toke.dk>
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
To: Kalle Valo <kvalo@codeaurora.org>, Kan Yan <kyan@google.com>
Cc: make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Yibo Zhao <yiboz@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>

Kalle Valo <kvalo@codeaurora.org> writes:

> (please don't top post)
>
> Kan Yan <kyan@google.com> writes:
>
>> I believe Toke will integrate this with his version and move the
>> estimating pending airtime part to mac80211, so maybe in the next
>> version, ath10k change is no longer required.
>
> What do you mean? Are you saying that I can drop this patch:
>
> [v4,2/2] ath10k: Enable Airtime-based Queue Limit (AQL)
>
> https://patchwork.kernel.org/patch/11184783/

Yes, we're trying to do it all in mac80211. See
https://patchwork.kernel.org/project/linux-wireless/list/?series=190333

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMYkO-0002cF-0t
 for ath10k@lists.infradead.org; Mon, 21 Oct 2019 14:33:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 0/2] Implement Airtime-based Queue Limit (AQL)
References: <20191011022413.176208-1-kyan@google.com>
 <87wod7y9ui.fsf@kamboji.qca.qualcomm.com>
 <87sgnvy9c2.fsf@kamboji.qca.qualcomm.com>
 <CA+iem5uLYFVQjPaE1QDKc6c+eKz8Xd4LbwczYXOBKP3q+HHdBg@mail.gmail.com>
Date: Mon, 21 Oct 2019 17:33:16 +0300
In-Reply-To: <CA+iem5uLYFVQjPaE1QDKc6c+eKz8Xd4LbwczYXOBKP3q+HHdBg@mail.gmail.com>
 (Kan Yan's message of "Mon, 14 Oct 2019 16:58:04 -0700")
Message-ID: <87r236tbgz.fsf@kamboji.qca.qualcomm.com>
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
Cc: make-wifi-fast@lists.bufferbloat.net, Toke =?utf-8?Q?H=C3=B8iland-J?= =?utf-8?Q?=C3=B8rgensen?= <toke@redhat.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Yibo Zhao <yiboz@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>

(please don't top post)

Kan Yan <kyan@google.com> writes:

> I believe Toke will integrate this with his version and move the
> estimating pending airtime part to mac80211, so maybe in the next
> version, ath10k change is no longer required.

What do you mean? Are you saying that I can drop this patch:

[v4,2/2] ath10k: Enable Airtime-based Queue Limit (AQL)

https://patchwork.kernel.org/patch/11184783/

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

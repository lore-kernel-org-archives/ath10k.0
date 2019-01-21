Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glWF6-0004Z5-Bu
 for ath10k@lists.infradead.org; Mon, 21 Jan 2019 09:52:07 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH v4 6/6] ath10k: reporting estimated tx airtime for fairness
In-Reply-To: <1545172374-1072-7-git-send-email-rmanohar@codeaurora.org>
References: <1545172374-1072-1-git-send-email-rmanohar@codeaurora.org>
 <1545172374-1072-7-git-send-email-rmanohar@codeaurora.org>
Date: Mon, 21 Jan 2019 10:49:35 +0100
Message-ID: <8736pmmjbk.fsf@toke.dk>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Kan Yan <kyan@google.com>, make-wifi-fast@lists.bufferbloat.net

Rajkumar Manoharan <rmanohar@codeaurora.org> writes:

> From: Kan Yan <kyan@google.com>
>
> Transmit airtime will be estimated from last tx rate used.
> Firmware report tx rate by peer stats. Airtime is computed
> on tx path and the same will be reported to mac80211 upon
> tx completion.

FYI, it seems that this last patch in the series no longer applies
cleanly on top of mac80211-next. May need a refresh.

The mac80211 parts were merged into mac80211-next (thanks, Johannes!); I
guess the driver updates are waiting for drivers-next to catch up to
that?

Patches 4 and 5 in the series are fine...

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

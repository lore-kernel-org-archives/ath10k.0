Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZbf3-0004kE-AB
 for ath10k@lists.infradead.org; Wed, 19 Dec 2018 13:13:19 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH v5 0/6] Move TXQ scheduling and airtime fairness into
 mac80211
In-Reply-To: <1545181331-5288-1-git-send-email-rmanohar@codeaurora.org>
References: <1545181331-5288-1-git-send-email-rmanohar@codeaurora.org>
Date: Wed, 19 Dec 2018 14:12:27 +0100
Message-ID: <877eg5hd8k.fsf@toke.dk>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>
Cc: make-wifi-fast@lists.bufferbloat.net

Rajkumar Manoharan <rmanohar@codeaurora.org> writes:

> All,
>
> Sorry for the long delay. Here is the consolidated series of mac80211,
> ath9k and ath10k changes for moving TXQ scheduling and airtime fairness
> into mac80211 and support airtime fairness.

Thanks for taking care of the respin!

Johannes, I think it's safe for you to review this version. I have
started working on another approach for the scheduler algorithm itself,
but it is fine to do as an incremental patch on top of this as it
shouldn't impact the API. Having a separate patch also makes testing
easier anyway. I'll see if I can't get it to a working state over the
holidays...

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

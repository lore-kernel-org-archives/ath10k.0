Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEBu9-0004tE-TS
 for ath10k@lists.infradead.org; Sun, 21 Oct 2018 11:28:24 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH 0/6] Move TXQ scheduling and airtime fairness into mac80211
In-Reply-To: <1540033534-11211-1-git-send-email-rmanohar@codeaurora.org>
References: <1540033534-11211-1-git-send-email-rmanohar@codeaurora.org>
Date: Sun, 21 Oct 2018 13:27:58 +0200
Message-ID: <875zxvo7y9.fsf@toke.dk>
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

Rajkumar Manoharan <rmanohar@codeaurora.org> writes:

> Toke,
>
> It is been a while since mac80211 TXQ discussion started. Here is the consolidated
> series of mac80211, ath9k and ath10k changes to move TXQ scheduling and airtime
> fairness into mac80211. The major changes w.r.t 5th RFC version are in may_transmit()
> API. Whenever the driver checks deficit for given TXQ, the list will be
> reordered so that driver/firmware RR quickly becomes in sync with mac80211
> list. Also airtime tasklet approach cumbersome and causing regression
> in multi client performance.

Cool, thanks. I'll look at this in more detail later, but in the
meantime, do you have any test results to share? Specifically, how did
you measure that the fairness part actually works? :)

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

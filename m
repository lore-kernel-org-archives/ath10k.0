Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAWkI-0007nV-D6
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 09:59:36 +0000
Received: by mail-ed1-f71.google.com with SMTP id d7so4036149edp.23
 for <ath10k@lists.infradead.org>; Wed, 18 Sep 2019 02:59:31 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH V2 3/4] mac80211: fix low throughput in multi-clients
 situation
In-Reply-To: <1568800033-17297-3-git-send-email-yiboz@codeaurora.org>
References: <1568800033-17297-1-git-send-email-yiboz@codeaurora.org>
 <1568800033-17297-3-git-send-email-yiboz@codeaurora.org>
Date: Wed, 18 Sep 2019 11:59:28 +0200
Message-ID: <874l19j56n.fsf@toke.dk>
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
To: Yibo Zhao <yiboz@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Yibo Zhao <yiboz@codeaurora.org> writes:

> Not long after the start of multi-clients test, not a single station is
> an eligible candidate for transmission since global virtual time(g_vt) is
> smaller than the virtual airtime(s_vt) of all the stations. As a result,
> the Tx has been blocked and throughput is quite low.
>
> This may mainly due to sync mechanism and accumulative deviation from the
> devision calculation of g_vt.
>
> For example:
> Suppose we have 50 clients in first round.
> Round 1:
> STA	weight	Tx_time_round  wt_sum	s_vt	g_vt  valid_for_next_Tx
> .	.	.			.		.
> .	.	.			.		.
> .	.	.			.		.
>
> After this round, all the stations are not valid for next transmission due
> to accumulative deviation.
>
> And if we add a new #51,
> Round 2:
> STA	weight	Tx_time_round	wt_sum  s_vt	g_vt  valid_for_next_Tx
> .	.	.			.		.
> .	.	.			.		.
> .	.	.			.		.
>
> Sync is done by:
> max(g_vt of last round - grace period, s_vt)
> and s_vt of #51 = max(2000 - 500, 0) + 1024 = 2524, and it is more than the
> final g_vt of this round.
>
> After this round, no more station is valid for transmission.

I'm not sure I understand this. Was there supposed to be numbers in
those tables above?

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

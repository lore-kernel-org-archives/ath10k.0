Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCLzw-0003iw-DC
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 10:55:18 +0000
Received: by mail-lj1-f198.google.com with SMTP id y28so1510983ljn.2
 for <ath10k@lists.infradead.org>; Mon, 23 Sep 2019 03:55:09 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH V3 3/4] mac80211: fix low throughput in multi-clients
 situation
In-Reply-To: <1569223201-1490-4-git-send-email-yiboz@codeaurora.org>
References: <1569223201-1490-1-git-send-email-yiboz@codeaurora.org>
 <1569223201-1490-4-git-send-email-yiboz@codeaurora.org>
Date: Mon, 23 Sep 2019 12:55:05 +0200
Message-ID: <87impj5lkm.fsf@toke.dk>
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
To: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org

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
> 1	256	2048		12800	2048	2000	N
> 2	256	2048			2048		N
> .	.	.			.		.
> .	.	.			.		.
> .	.	.			.		.
> 50	256	2048			2048		N
>
> After this round, all the stations are not valid for next transmission due to
> accumulative deviation.
>
> And if we add a new #51,
> STA	weight	Tx_time_round  wt_sum	s_vt	g_vt  valid_for_next_Tx
> 1	256	2048		13056	2048	2020	N
> 2	256	2048			2048		N
> .	.	.			.
> .	.	.			.
> .	.	.			.
> 50	256	2048			2048		N
> 51	256	1024			2524		N

That's better :)

> Sync is done by:
> max(g_vt of last round - grace period, s_vt)
> and s_vt of #51 = max(2000 - 500, 0) + 1024 = 2524, and it is more than the final
> g_vt of this round.
>
> After this round, no more station is valid for transmission.
>
> The real situation can be more complicate, above is one of the extremely case.
>
> To avoid this situation to occur, the new proposal is:
>
> - Increase the airtime grace period a little more to reduce the
>   unexpected sync
>
> - If global virtual time is less than the virtual airtime of any station,
>   sync it to the airtime of first station in the red-black tree
>
> - Round the division result

I can see why we need the second part (basically, this happens because I
forgot to add a check for "no eligible stations" in may_transmit(), like
the one in next_txq()). And rounding up the division result doesn't
hurt, I guess. But why does it help to change the grace period if we're
doing all the other stuff?

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

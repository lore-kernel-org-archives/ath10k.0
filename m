Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCgVM-0005Xc-Ax
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 08:49:06 +0000
Received: by mail-ed1-f69.google.com with SMTP id s3so626499edr.15
 for <ath10k@lists.infradead.org>; Tue, 24 Sep 2019 01:48:56 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH V3 3/4] mac80211: fix low throughput in multi-clients
 situation
In-Reply-To: <2aab0bd944ee34751304a5f92b885113@codeaurora.org>
References: <1569223201-1490-1-git-send-email-yiboz@codeaurora.org>
 <1569223201-1490-4-git-send-email-yiboz@codeaurora.org>
 <87impj5lkm.fsf@toke.dk> <2aab0bd944ee34751304a5f92b885113@codeaurora.org>
Date: Tue, 24 Sep 2019 10:48:53 +0200
Message-ID: <87d0fq3wqy.fsf@toke.dk>
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
To: Yibo Zhao <yiboz@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yibo Zhao <yiboz@codeaurora.org> writes:

>> I can see why we need the second part (basically, this happens because 
>> I
>> forgot to add a check for "no eligible stations" in may_transmit(), 
>> like
>> the one in next_txq()). And rounding up the division result doesn't
>> hurt, I guess. But why does it help to change the grace period if we're
>> doing all the other stuff?
> In multi-clients case, it is possible a TXQ sometimes gets drained due 
> to FW has deep queue and few packets in TXQ at that time. So the TXQ is 
> removed from the rbtree after dequeuing. When it is about to added back 
> very soon after the removal, the g_vt might have gone a little far away 
> from sta vt where sync is needed. With this sync, the station is forced 
> to catch up with the g_vt, however, its chance for transmission has been 
> reduced. I think 500us is quite a short period in multi-clients case.

That's a good point, actually: Having the grace period be too small will
allow stations that leave and re-enter the queue to "skip ahead" and use
more than its share. However, I think it's a separate issue from what
this patch is about; so how about I just increase the grace period in
the next version of the base patch?

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

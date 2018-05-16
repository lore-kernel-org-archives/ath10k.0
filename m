Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIsdm-0008EJ-VX
 for ath10k@lists.infradead.org; Wed, 16 May 2018 09:22:37 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: ath10k wake_tx_queue issues
In-Reply-To: <20180515203102.GA20469@localhost.localdomain>
References: <20180515134516.GA30397@localhost.localdomain>
 <87d0xx0zxf.fsf@toke.dk> <20180515203102.GA20469@localhost.localdomain>
Date: Wed, 16 May 2018 11:22:11 +0200
Message-ID: <87tvr8ymyk.fsf@toke.dk>
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
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: erik.stromdahl@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, kvalo@qca.qualcomm.com, johannes@sipsolutions.net, Felix Fietkau <nbd@nbd.name>

Niklas Cassel <niklas.cassel@linaro.org> writes:
> [ .. snip .. ]
>> > Sure, the regular way ath10k_mac_op_wake_tx_queue is called is via
>> > ieee80211_subif_start_xmit => __ieee80211_subif_start_xmit => ieee80211_xmit_fast
>> > => ieee80211_queue_skb => drv_wake_tx_queue.
>> >
>> > But I was expecting the call to ieee80211_wake_queue to somehow trigger a call
>> > to ath10k_mac_op_wake_tx_queue, since there is still data in the send buffer/
>> > in the ieee80211_txq that needs to be sent, to allow more data to be written to
>> > the socket. But obviously the callback never comes.
>> > Or how else is this supposed to work?
>> 
>> The driver should reschedule itself before/after calling
>> ieee80211_wake_queue. mt76 does this; I'm not actually sure if ath9k
>> does the right thing either, I'm not too familiar with that part of the
>> code. There's no direct call to reschedule that I can see, but there may
>> be another reason why this is not needed for ath9k. I'm sure Felix
>> knows?
>
> Hello Toke
>
> Unfortunately, it doesn't look like mt76 uses any ieee80211_* function
> to reschedule.

It doesn't need to; it just reschedules itself.

Basically, the wake_tx_queue() callback is just a way for mac80211 to
notify the driver that new packets are available and that it should
start its scheduling function. But in this case it is the driver that is
restarting the queues, so it already knows that. And so it can just call
its internal scheduling function. This is what mt76 does in
mt76_dma_tx_cleanup() with the call to mt76_txq_schedule() before
calling ieee80211_wake_queue().

I think that what ath10k should be doing is calling
ath10k_mac_tx_push_pending() when it restarts the queues.

> I just came across a ieee80211_schedule_txq() function in e937b8da5a59
> ("mac80211: Add TXQ scheduling API"). However, this commit was
> reverted. Any plans on resubmitting this?

Yeah, I have a revised version lying around waiting for Felix to review
it. But that wouldn't help this bug; it's just an API change, it doesn't
change behaviour...

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

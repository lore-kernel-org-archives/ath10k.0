Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjfIG-0005M7-DH
 for ath10k@lists.infradead.org; Mon, 12 May 2014 01:44:41 +0000
Received: by mail-vc0-f181.google.com with SMTP id ld13so7337379vcb.26
 for <ath10k@lists.infradead.org>; Sun, 11 May 2014 18:44:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnCBn9Vp+=V4k_PoUOKVOOkkvNY_8Uottjssu=cv8KjMQ@mail.gmail.com>
References: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
 <87iorpnmlo.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1BjUQH_zQp=8NEHt7LQ1JQAG5ftzx+u4i4OqEqaG7teg@mail.gmail.com>
 <CA+BoTQnW0kFV-h1i5kU7=mC_uXWz6L5DA46wyEnPNrTs=M8nFg@mail.gmail.com>
 <CA+BoTQnCBn9Vp+=V4k_PoUOKVOOkkvNY_8Uottjssu=cv8KjMQ@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Sun, 11 May 2014 21:43:56 -0400
Message-ID: <CAHqTa-1dagzEEwUC9g1n+2DjwgB95dtao115k7C4n5Yb4Nm=Mg@mail.gmail.com>
Subject: Re: Firmware crash when sending large numbers of forwarded packets
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k <ath10k@lists.infradead.org>

On Mon, Mar 10, 2014 at 6:16 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 10 March 2014 11:10, Michal Kazior <michal.kazior@tieto.com> wrote:
>> It is highly unlikely for ath10k to pick duplicate msdu_id in the
>> first place - you'd have to assume spinlock fail which would suggest
>> your system would be pretty fun. This leaves either low level chunk
>> submission is at play or DMA goes crazy.
>>
>> The descriptor is transfered in two chunks over CE ring. The
>> ce_send_nolock is used to submit each separately (via pci_tx_sg). The
>> first contains msdu id, the other one is the msdu partial as frame
>> prefetch for FW classification engine. Once the second chunk is
>> submitted CE ringbuffer index is written to iomap.
>>
>> If I assume this is DMA coherency issue, then msdu_id the device sees
>> is the old one (that has been overwritten but hasn't been flushed from
>> CPU caches yet). Then this is a platform bug, not ath10k one.
>>
>> If I assume this is chunk submission ordering issue (CE ring item is
>> updated _after_ ring index in iomap is updated) then the device uses
>> an old tx descriptor pointer and an old (or re-used and currently used
>> msdu_id -- remember all descriptors come from dma pool which I assume
>> re-uses memory chunks). Then this is ath10k bug.
>>
>> The latter is a little more plausible because mb() fixes. udelay()
>> might implicitly do the same thing.
>
> Now that I think you can probably try placing the mb() after `*desc =
> *desc`, or better, right before ath10k_ce_src_ring_write_index_set()
> (inside the conditional). This is will make sure all prior CE items
> are ready and set before CE ring index is updated.

Sorry to take a long time to get back on this thread, but I finally
have some better test results.

First, our stability has definitely been improved a lot since my
original mb() patch.

Secondly, we still had occasional firmware crashes under certain load
types.  Thanks to Ben Greear and some helpful people at QCA, we
diagnosed this as the same problem as the original mb() was trying to
fix.  After moving the mb() as Michal suggested, this class of
firmware crash (which was much more rare after my original patch)
seems to be gone too.  So the new location of the mb() seems to indeed
be better.

We still have rare firmware crashes for I think a different reason(s),
but I have/will ask about those in other threads.

Thanks for the help!

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

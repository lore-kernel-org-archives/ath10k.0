Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYbSs-0000jv-5u
 for ath10k@lists.infradead.org; Fri, 11 Apr 2014 13:25:54 +0000
Message-ID: <5347ED46.3000406@candelatech.com>
Date: Fri, 11 Apr 2014 06:25:26 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question on ath10k_mgmt_tx_flush
References: <53469F7B.2080202@candelatech.com>
 <CA+BoTQmc=n7ifUh+8Lq_1P=t4KJyDDFjcs3Z1mW1nHFO+WR2hw@mail.gmail.com>
In-Reply-To: <CA+BoTQmc=n7ifUh+8Lq_1P=t4KJyDDFjcs3Z1mW1nHFO+WR2hw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 04/10/2014 10:21 PM, Michal Kazior wrote:
> On 10 April 2014 15:41, Ben Greear <greearb@candelatech.com> wrote:
>> Can we optimize this method to return early if the tx-credits
>> are fully replenished (ie, == 2) instead of just sleeping the
>> 2 x beacon-interval?  That would indicate all messages
>> have been flushed, right?
>
> Yeah. You're _almost_ right. Every odd mgmt frame will trigger tx
> credit replenishment, even if you set NEEDS_CREDITS htc tx flag for
> all packets. It seems that tx credits aren't replenished until you
> submit an even number of mgmt tx:
>
>   [tx credits =2]
>   vdev create [-1, =1]
>   [replenish +1, =2]
>   mgmt tx [-1, =1]
>   [frame is seen on air, means it left tx queue, but no replenishment]
>   vdev set param [-1, =0]
>   [replenish +1, =1]
>   mgmt tx [-1, =0]
>   [frame seen on air]
>   [replenish +2, =2]
>
> However once you flush peer tids you get the tx credit immediately.
> This means you don't ever reach having 2 mgmt tx consuming 2 tx
> credits (unless things go terribly terribly wrong at which point it's
> probably already beyond help).
>
> A very ugly hack would be to try and send out mgmt tx in pairs - a
> requested frame and a dummy frame (such that firmware will not buffer
> it) so that you use tx credit replenishment as tx completion
> indication.

If you ignore how firmware replenishes the tx-credits for now,
is it safe to assume that if you have 2 tx-credits while in
the flush routine, then everything is indeed flushed and
we can skip the sleep?

I imagine both I and the QCA firmware guys can make the
firmware properly replenish tx-credits one at a time instead
of the only-on-even/odd behaviour you found.

But even without that, we might be able to speed up the
flush 1/2 of the time?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

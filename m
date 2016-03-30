Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alHDv-0006A6-1S
 for ath10k@lists.infradead.org; Wed, 30 Mar 2016 14:35:55 +0000
Message-ID: <56FBE41E.5080407@candelatech.com>
Date: Wed, 30 Mar 2016 07:35:10 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: How is tx-flushing supposed to work now?
References: <56FAD6D6.9030105@candelatech.com>
 <CA+BoTQn8ptm785Dn14fT7OObFoTEeq2ym7AQFmu889P_BDt6jw@mail.gmail.com>
In-Reply-To: <CA+BoTQn8ptm785Dn14fT7OObFoTEeq2ym7AQFmu889P_BDt6jw@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>



On 03/30/2016 03:38 AM, Michal Kazior wrote:
> On 29 March 2016 at 21:26, Ben Greear <greearb@candelatech.com> wrote:
>> When we have multiple vdevs, and the 10.4.3 firmware with the tx-push logic,
>> how is flushing supposed to work?
>
> This isn't really as much about pull-push logic in 10.4.3 as it is
> about wake_tx_queue() in general, is it?

Maybe, I'm a bit confused about how it all works.

>> First, when we get a flush, should we first purge any frames not yet pushed
>> to the firmware?
>
> I would expect mac80211 to purge txqs.
>
>
>> And second, what keeps other vdevs from continuing to transmit frames while
>> one
>> vdev is trying to be flushed?
>
> Hmm.. I guess ath10k flush() implementation doesn't really do what it
> should. It should wait just for frames for given vif but it waits for
> everything.

Yes, I think so.  If mac80211 is trying to flush a single vif, then
probably it is letting other vifs on the same radio still transmit as well,
so likely ath10k tx-queues are not going to go to zero in that case.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

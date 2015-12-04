Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4jtj-00075g-Rx
 for ath10k@lists.infradead.org; Fri, 04 Dec 2015 06:31:16 +0000
Message-ID: <5661331D.3050600@candelatech.com>
Date: Thu, 03 Dec 2015 22:30:53 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Bugs in wake-queue logic.
References: <56609D8E.9010703@candelatech.com>	<CALhHN=q7HebGUxgLznBhnNWjCMfmm1cx_5t8kh_Y-TbMVZBOdQ@mail.gmail.com>
 <CALhHN=p9e4T-UhdqJ2JajcvkAfi4Huz+Oexpfzk-FdrxSzkGfA@mail.gmail.com>
In-Reply-To: <CALhHN=p9e4T-UhdqJ2JajcvkAfi4Huz+Oexpfzk-FdrxSzkGfA@mail.gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>



On 12/03/2015 10:11 PM, Janusz Dziedzic wrote:
> On 4 December 2015 at 07:06, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
>> On 3 December 2015 at 20:52, Ben Greear <greearb@candelatech.com> wrote:
>>> So, after tweaking a firmware image to actually be able to use
>>> all tx-buffers, then queues can actually be stopped on the host
>>> now.
>>>
>>> I'm now getting splats related to tx-queue being
>>> out of range.
>>>
>>> Why are we using vdev_id as the queue-id below?
>>>
>> This is comment in the code:
>>
>>          /* Using vdev_id as queue number will make it very easy to do per-vif
>>           * tx queue locking. This shouldn't wrap due to interface combinations
>>           * but do a modulo for correctness sake and prevent using offchannel tx
>>           * queues for regular vif tx.
>>           */
>>
> BTW, I think Michal will send soon "new" design for that because of
> MU-MIMO implementation.

It would be nice if ath10k could gracefully deal with 64 vdevs using only
the default 16 maximum tx-queues supported by mac80211.

I wrote a patch that extended max-queues to 65, but not sure it will
make it upstream...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

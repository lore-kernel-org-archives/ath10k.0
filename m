Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4mSZ-0006mo-I8
 for ath10k@lists.infradead.org; Fri, 04 Dec 2015 09:15:25 +0000
Received: by wmww144 with SMTP id w144so56325315wmw.0
 for <ath10k@lists.infradead.org>; Fri, 04 Dec 2015 01:15:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5661331D.3050600@candelatech.com>
References: <56609D8E.9010703@candelatech.com>
 <CALhHN=q7HebGUxgLznBhnNWjCMfmm1cx_5t8kh_Y-TbMVZBOdQ@mail.gmail.com>
 <CALhHN=p9e4T-UhdqJ2JajcvkAfi4Huz+Oexpfzk-FdrxSzkGfA@mail.gmail.com>
 <5661331D.3050600@candelatech.com>
Date: Fri, 4 Dec 2015 10:15:01 +0100
Message-ID: <CALhHN=oM4y4q9+kZ4x_867sy+v2Y9jhC3uSNcrvcgPgA3XENDA@mail.gmail.com>
Subject: Re: Bugs in wake-queue logic.
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 4 December 2015 at 07:30, Ben Greear <greearb@candelatech.com> wrote:
>
>
> On 12/03/2015 10:11 PM, Janusz Dziedzic wrote:
>>
>> On 4 December 2015 at 07:06, Janusz Dziedzic <janusz.dziedzic@tieto.com>
>> wrote:
>>>
>>> On 3 December 2015 at 20:52, Ben Greear <greearb@candelatech.com> wrote:
>>>>
>>>> So, after tweaking a firmware image to actually be able to use
>>>> all tx-buffers, then queues can actually be stopped on the host
>>>> now.
>>>>
>>>> I'm now getting splats related to tx-queue being
>>>> out of range.
>>>>
>>>> Why are we using vdev_id as the queue-id below?
>>>>
>>> This is comment in the code:
>>>
>>>          /* Using vdev_id as queue number will make it very easy to do
>>> per-vif
>>>           * tx queue locking. This shouldn't wrap due to interface
>>> combinations
>>>           * but do a modulo for correctness sake and prevent using
>>> offchannel tx
>>>           * queues for regular vif tx.
>>>           */
>>>
>> BTW, I think Michal will send soon "new" design for that because of
>> MU-MIMO implementation.
>
>
> It would be nice if ath10k could gracefully deal with 64 vdevs using only
> the default 16 maximum tx-queues supported by mac80211.
>
I think Michal changed also mac80211 (netdev) queues - that can be
used/locked per station for MU-MIMO case.
I think he will send paches soon, while now he stuck in Chennai do to
flooding ...

BR
Janusz

> I wrote a patch that extended max-queues to 65, but not sure it will
> make it upstream...
>
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

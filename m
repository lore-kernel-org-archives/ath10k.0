Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avJD0-0006ka-R2
 for ath10k@lists.infradead.org; Wed, 27 Apr 2016 06:44:27 +0000
Received: by mail-yw0-x241.google.com with SMTP id o63so8105121ywe.0
 for <ath10k@lists.infradead.org>; Tue, 26 Apr 2016 23:44:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <571FCB22.5000305@candelatech.com>
References: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com>
 <5718EE7A.4030503@candelatech.com> <1461654272.16188.4.camel@sipsolutions.net>
 <87mvogy3ux.fsf@kamboji.qca.qualcomm.com>
 <CABPxzYL=sQg=HczxM3gdERHRD-3-KaOG455wsqjpZ6YZDkybmw@mail.gmail.com>
 <571FCB22.5000305@candelatech.com>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Wed, 27 Apr 2016 12:13:46 +0530
Message-ID: <CABPxzY+UuCABUcFbV0EpdoRaSzpgGvMani_j7xvg2a=xh-Bw0g@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: remove VHT capabilities from 2.4GHz
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
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, Apr 27, 2016 at 1:40 AM, Ben Greear <greearb@candelatech.com> wrote:
> On 04/26/2016 01:07 PM, Krishna Chaitanya wrote:
>>
>> On Tue, Apr 26, 2016 at 5:33 PM, Valo, Kalle <kvalo@qca.qualcomm.com>
>> wrote:
>>>
>>> Johannes Berg <johannes@sipsolutions.net> writes:
>>>
>>>> On Thu, 2016-04-21 at 08:15 -0700, Ben Greear wrote:
>>>>
>>>>> The thing is, it actually works just fine with the patch I posted
>>>>> to fix mac80211, and at any rate, even if the mac80211 patch isn't
>>>>> applied, the ath10k driver works just fine in HT mode.
>>>>
>>>>
>>>> This patch has no implications on HT, and I wasn't planning on applying
>>>> the mac80211 patch.
>>>
>>>
>>> Yeah, makes sense. I'm planning to apply this soon.
>>>
>>>> As I said, I have no objections to doing the (Broadcom) vendor specific
>>>> IEs for "VHT" in 2.4 GHz band, but I don't think we should advertise
>>>> the spec IEs when they're explicitly specified to be used only in the
>>>> 5.2 GHz band.
>>>
>>>
>>> But we really should have this, any volunteers? :) I think it shouldn't
>>> be too hard to do so this would be a good project for someone looking
>>> for a simple, but useful, task on wireless stack.
>>
>> Are these Broadcom IEs documented somewhere? If yes,
>> then its a matter of parsing them and adding support to
>> minstrel_ht, isn't it? major work would be in minstrel.
>>
>
> For ath10k, rate-ctrl is done in the firmware, so
> no work at all in minstrel-ht.

Right, i think this might become more common.
So may we need to change minstrel_ht as well?

> The end result, as far as I can tell,
> is you would just have to tell mac80211 to allow
> VHT on 2.4Ghz, and revert this patch that Kalle is proposing.

Ideally as this is vendor specific it makes sense to implement this
at Driver/FW level rather than implementing it at a common stack
like mac80211.

> Maybe someone that actually knows about these IEs can explain why
> they are worth using?

These IE's can be parsed in the driver without any mac80211 involvement.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

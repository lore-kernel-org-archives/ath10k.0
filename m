Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1av9Ju-0002Pp-6q
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 20:10:55 +0000
Subject: Re: [PATCH v2] ath10k: remove VHT capabilities from 2.4GHz
References: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com>
 <5718EE7A.4030503@candelatech.com>
 <1461654272.16188.4.camel@sipsolutions.net>
 <87mvogy3ux.fsf@kamboji.qca.qualcomm.com>
 <CABPxzYL=sQg=HczxM3gdERHRD-3-KaOG455wsqjpZ6YZDkybmw@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <571FCB22.5000305@candelatech.com>
Date: Tue, 26 Apr 2016 13:10:10 -0700
MIME-Version: 1.0
In-Reply-To: <CABPxzYL=sQg=HczxM3gdERHRD-3-KaOG455wsqjpZ6YZDkybmw@mail.gmail.com>
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
To: Krishna Chaitanya <chaitanya.mgit@gmail.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 04/26/2016 01:07 PM, Krishna Chaitanya wrote:
> On Tue, Apr 26, 2016 at 5:33 PM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>> Johannes Berg <johannes@sipsolutions.net> writes:
>>
>>> On Thu, 2016-04-21 at 08:15 -0700, Ben Greear wrote:
>>>
>>>> The thing is, it actually works just fine with the patch I posted
>>>> to fix mac80211, and at any rate, even if the mac80211 patch isn't
>>>> applied, the ath10k driver works just fine in HT mode.
>>>
>>> This patch has no implications on HT, and I wasn't planning on applying
>>> the mac80211 patch.
>>
>> Yeah, makes sense. I'm planning to apply this soon.
>>
>>> As I said, I have no objections to doing the (Broadcom) vendor specific
>>> IEs for "VHT" in 2.4 GHz band, but I don't think we should advertise
>>> the spec IEs when they're explicitly specified to be used only in the
>>> 5.2 GHz band.
>>
>> But we really should have this, any volunteers? :) I think it shouldn't
>> be too hard to do so this would be a good project for someone looking
>> for a simple, but useful, task on wireless stack.
> Are these Broadcom IEs documented somewhere? If yes,
> then its a matter of parsing them and adding support to
> minstrel_ht, isn't it? major work would be in minstrel.
>

For ath10k, rate-ctrl is done in the firmware, so
no work at all in minstrel-ht.

The end result, as far as I can tell,
is you would just have to tell mac80211 to allow
VHT on 2.4Ghz, and revert this patch that Kalle is proposing.

Maybe someone that actually knows about these IEs can explain why
they are worth using?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

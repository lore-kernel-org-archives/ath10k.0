Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av9H6-0001sL-4t
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 20:08:00 +0000
Received: by mail-yw0-x243.google.com with SMTP id u62so4308463ywe.3
 for <ath10k@lists.infradead.org>; Tue, 26 Apr 2016 13:07:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mvogy3ux.fsf@kamboji.qca.qualcomm.com>
References: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com>
 <5718EE7A.4030503@candelatech.com> <1461654272.16188.4.camel@sipsolutions.net>
 <87mvogy3ux.fsf@kamboji.qca.qualcomm.com>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Wed, 27 Apr 2016 01:37:19 +0530
Message-ID: <CABPxzYL=sQg=HczxM3gdERHRD-3-KaOG455wsqjpZ6YZDkybmw@mail.gmail.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Apr 26, 2016 at 5:33 PM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Johannes Berg <johannes@sipsolutions.net> writes:
>
>> On Thu, 2016-04-21 at 08:15 -0700, Ben Greear wrote:
>>
>>> The thing is, it actually works just fine with the patch I posted
>>> to fix mac80211, and at any rate, even if the mac80211 patch isn't
>>> applied, the ath10k driver works just fine in HT mode.
>>
>> This patch has no implications on HT, and I wasn't planning on applying
>> the mac80211 patch.
>
> Yeah, makes sense. I'm planning to apply this soon.
>
>> As I said, I have no objections to doing the (Broadcom) vendor specific
>> IEs for "VHT" in 2.4 GHz band, but I don't think we should advertise
>> the spec IEs when they're explicitly specified to be used only in the
>> 5.2 GHz band.
>
> But we really should have this, any volunteers? :) I think it shouldn't
> be too hard to do so this would be a good project for someone looking
> for a simple, but useful, task on wireless stack.
Are these Broadcom IEs documented somewhere? If yes,
then its a matter of parsing them and adding support to
minstrel_ht, isn't it? major work would be in minstrel.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

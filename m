Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jytyW-0003yB-Qg
 for ath10k@lists.infradead.org; Fri, 24 Jul 2020 09:26:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] nl80211: vendor-cmd: qca: add dynamic SAR power limits
References: <1576684108-30177-1-git-send-email-kvalo@codeaurora.org>
 <1576684108-30177-2-git-send-email-kvalo@codeaurora.org>
 <1576748692.7758.17.camel@realtek.com> <20191219154828.GA12287@w1.fi>
 <CA+ASDXMTYLGbEkBPHSqtyitMEvY5o_MjU0s+NoWdnN_ORy1gDw@mail.gmail.com>
 <20191219185522.GA16010@w1.fi>
 <CA+ASDXNOxkrZTxL0Jo4ONR2YtL83BVc_w-rBXc6ggBLdwUpDZw@mail.gmail.com>
 <871rpqly6a.fsf@kamboji.qca.qualcomm.com>
 <e8908eafd8e6050eef8782c6a7019e318d14f65f.camel@sipsolutions.net>
 <CA+ASDXMf7iXuE9hQ-XitPPfvXP0EK5FchJLCu2+5Ag=ZC=0H0w@mail.gmail.com>
 <87lfjjx0o7.fsf@codeaurora.org>
 <CA+ASDXOAzPuOn_rMsRj4t56kC-TgoG0p5WhSTPJjB8xTTq5kfg@mail.gmail.com>
Date: Fri, 24 Jul 2020 12:26:16 +0300
In-Reply-To: <CA+ASDXOAzPuOn_rMsRj4t56kC-TgoG0p5WhSTPJjB8xTTq5kfg@mail.gmail.com>
 (Brian Norris's message of "Thu, 16 Jul 2020 11:56:39 -0700")
Message-ID: <87y2n9clhj.fsf@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Pkshih <pkshih@realtek.com>, Jouni Malinen <j@w1.fi>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>

Brian Norris <briannorris@chromium.org> writes:

> On Thu, Jul 16, 2020 at 2:35 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>> Brian Norris <briannorris@chromium.org> writes:
>> > Really, I could live with per-vendor APIs. My primary goal is to get
>> > these upstream in some form, so vendors can stop using things like
>> > this as a reason for shipping us non-upstream code, and so we can
>> > reduce the delta between upstream and Chrome OS kernels.
>> >
>> > I also think that, for the cases that warrant it (i.e., the option 2
>> > -- Realtek and Qualcomm cases, so far), it would be good to have a
>> > common API, but that's a somewhat secondary concern for me.
>>
>> So to me it feels like the best solution forward is to go with the
>> vendor API, do you agree? We can, of course, later switch to the common
>> API if we manage to create one which is usable for everyone.
>
> That's fine with me. That's pretty much what I said in my first email:
>
> "Anyway, I don't really object with starting out with a
> Qualcomm-specific and a Realtek-specific vendor command to implement
> nearly the same feature, but I'd prefer if people did engage in some
> healthy discussion about why they can't share an API, with the hopes
> that maybe they can converge someday."
>
> I think we've had some healthy (though very protracted) discussion,
> and I don't think I've seen anyone bring up anything I wasn't already
> aware of that would prevent eventual consolidation. As long as we
> acknowledge those things (item 2 at
> https://wireless.wiki.kernel.org/en/developers/documentation/nl80211#vendor-specific_api),
> I'm happy.

Good, I was just checking that we all are on the same page.

>> > Also, Kalle had some concerns about stable ABI questions: shouldn't we
>> > bake in some kind of "check for support" feature to these kinds of
>> > APIs [3]? That would help ease transition, if we do start with a
>> > vendor API and move to a common one in the future.
>>
>> Yeah, that sounds like a good idea but I don't think that should block
>> these patches.
>
> OK, well it was your concern first, IIRC :)

I was commenting about the "check for support" feature :) I think it
would be a good idea to have userspace check what vendor interface
features/commands are supported with that driver/hardware/firmware
combo. But how should that be implemented? Should there be a some kind
of generic mechanism used by all drivers or would each driver have their
own method to check the supported features? I think that needs a
separate discussion.

> So what's next? A v2 that only needs a bit of updated description
> about "why a vendor API"?

I'm busy but hopefully Wen (CCed) can submit v2. Wen?

> And Realtek can feel free to submit this [1] shortly?

> [1] Series: rtw88: Add SAR implementation
> https://patchwork.kernel.org/project/linux-wireless/list/?series=238219&state=*

Yeah, please submit that as well.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

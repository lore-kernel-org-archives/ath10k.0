Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFWaw-0007wU-H2
 for ath10k@lists.infradead.org; Tue, 08 Sep 2020 05:55:08 +0000
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
 <87y2n9clhj.fsf@codeaurora.org>
 <c3ef60c2263a6840d21f6a797ad3ffb685a728b8.camel@sipsolutions.net>
Date: Tue, 8 Sep 2020 05:55:01 +0000
In-Reply-To: <c3ef60c2263a6840d21f6a797ad3ffb685a728b8.camel@sipsolutions.net>
 (Johannes Berg's message of "Thu, 30 Jul 2020 15:24:11 +0200")
Message-ID: <010101746c48247e-7b052e84-ed99-4b4f-be90-e35555d5b314-000000@us-west-2.amazonses.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Pkshih <pkshih@realtek.com>, Jouni Malinen <j@w1.fi>, Brian Norris <briannorris@chromium.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

Johannes Berg <johannes@sipsolutions.net> writes:

> On Fri, 2020-07-24 at 12:26 +0300, Kalle Valo wrote:
>
>> > > So to me it feels like the best solution forward is to go with the
>> > > vendor API, do you agree? We can, of course, later switch to the common
>> > > API if we manage to create one which is usable for everyone.
>
> But why wouldn't we try that now, while we have it all in our heads (in
> a way ... even if this discussion drags out forever)?
>
> I mean, the range-based approach ought to work, and if we define it as a
> nested attribute list or so, we can even later add more attributes to it
> (chain limits, whatnot) without any backward compatibility concerns.
>
> So what is it that we _cannot_ do in a more common way today?
>
>> > I think we've had some healthy (though very protracted) discussion,
>> > and I don't think I've seen anyone bring up anything I wasn't already
>> > aware of that would prevent eventual consolidation. As long as we
>> > acknowledge those things (item 2 at
>> > https://wireless.wiki.kernel.org/en/developers/documentation/nl80211#vendor-specific_api),
>> > I'm happy.
>> 
>> Good, I was just checking that we all are on the same page.
>
> But are we? ;-)
>
> I don't really see anything in the new proposal [1] that really explains
> why the common API that we've sort of vaguely outlined in this thread
> couldn't work? It just speaks of technical difficulties ("need a
> reporting API too"), but should we let that stop us?
>
> [1] https://patchwork.kernel.org/patch/11686317/

I misunderstood then, I thought everyone were leaning towards the vendor
API approach. But yeah, of course a common API is much better if people
think it's doable.

So I'll now drop all the vendor API patches from patchwork and
assume/hope that we will get the common API at some point.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw0Im-0007eT-79
 for ath10k@lists.infradead.org; Thu, 16 Jul 2020 09:35:42 +0000
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
Date: Thu, 16 Jul 2020 12:35:20 +0300
In-Reply-To: <CA+ASDXMf7iXuE9hQ-XitPPfvXP0EK5FchJLCu2+5Ag=ZC=0H0w@mail.gmail.com>
 (Brian Norris's message of "Mon, 1 Jun 2020 18:32:31 -0700")
Message-ID: <87lfjjx0o7.fsf@codeaurora.org>
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
Cc: Jouni Malinen <j@w1.fi>, Johannes Berg <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Pkshih <pkshih@realtek.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Brian Norris <briannorris@chromium.org> writes:

> Really, I could live with per-vendor APIs. My primary goal is to get
> these upstream in some form, so vendors can stop using things like
> this as a reason for shipping us non-upstream code, and so we can
> reduce the delta between upstream and Chrome OS kernels.
>
> I also think that, for the cases that warrant it (i.e., the option 2
> -- Realtek and Qualcomm cases, so far), it would be good to have a
> common API, but that's a somewhat secondary concern for me.

So to me it feels like the best solution forward is to go with the
vendor API, do you agree? We can, of course, later switch to the common
API if we manage to create one which is usable for everyone.

> Also, Kalle had some concerns about stable ABI questions: shouldn't we
> bake in some kind of "check for support" feature to these kinds of
> APIs [3]? That would help ease transition, if we do start with a
> vendor API and move to a common one in the future.

Yeah, that sounds like a good idea but I don't think that should block
these patches.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

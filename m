Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFHC7-00089Y-0r
 for ath10k@lists.infradead.org; Fri, 20 Mar 2020 12:56:12 +0000
Message-ID: <e8908eafd8e6050eef8782c6a7019e318d14f65f.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] nl80211: vendor-cmd: qca: add dynamic SAR power limits
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 20 Mar 2020 13:55:58 +0100
In-Reply-To: <871rpqly6a.fsf@kamboji.qca.qualcomm.com>
 (sfid-20200317_175435_510355_7F89EC66)
References: <1576684108-30177-1-git-send-email-kvalo@codeaurora.org>
 <1576684108-30177-2-git-send-email-kvalo@codeaurora.org>
 <1576748692.7758.17.camel@realtek.com> <20191219154828.GA12287@w1.fi>
 <CA+ASDXMTYLGbEkBPHSqtyitMEvY5o_MjU0s+NoWdnN_ORy1gDw@mail.gmail.com>
 <20191219185522.GA16010@w1.fi>
 <CA+ASDXNOxkrZTxL0Jo4ONR2YtL83BVc_w-rBXc6ggBLdwUpDZw@mail.gmail.com>
 <871rpqly6a.fsf@kamboji.qca.qualcomm.com>
 (sfid-20200317_175435_510355_7F89EC66)
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
To: Kalle Valo <kvalo@codeaurora.org>, Brian Norris <briannorris@chromium.org>
Cc: Jouni Malinen <j@w1.fi>, Pkshih <pkshih@realtek.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, 2020-03-17 at 18:54 +0200, Kalle Valo wrote:

> For me either solutions are good enough, I'm not familiar enough with
> all the different SAR user space interfaces to make a good decision.

Brian probably has most insight into this :-)

I really didn't want to have to be the referee here, I was hoping you'd
figure this all out between yourselves... oh well.

But as somebody has said on one of these threads, there seem to
basically be two kinds of APIs:

 1) some kind of platform-dependent index into a table that the
    driver/device has, or perhaps the BIOS; and

 2) some kind of per-band (FSVO band) power restriction like here.


The first is like iwlwifi, and I think Marvell was mentioned? But
they're basically out - there's no information, and there's no clue as
to which indices might even be valid, I think, nor what they mean. So
there isn't really much value in a common API for that since you can't
use it in a common fashion - arguably a common API would be worse...


However, the case of 2, arguably the proposals are very similar?

Qualcomm: optional nl80211_band, 1/2 dBm units
Realtek: 2.4, four 5 GHz subbands, 1/4 dBm units

Both have some strange namespace thing where the same namespace contains
both the outer and inner attributes. Probably should think about the
policy with NLA_POLICY_NESTED and see how that works.


But it any case, these two don't seem like an insurmountable issue to
combine? Say, something like defining a list of affected frequency
ranges in the wiphy properties, and then giving a list of TX powers that
matches the list of frequency ranges? We can go to 1/4 dBm or so, that's
not such a big deal, I'd think?


On the other hand, what does that actually buy us? If you cannot have
common userspace that knows how a given platform must behave, then it's
not very worthwhile to have common API for it?

Brian, what do you think from a platform/userspace perspective - how do
you actually determine the SAR limits? I'm guessing you just have a
table of sorts, but how do you get the table? Would you actually have
common userspace and benefit from having common API?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

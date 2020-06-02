Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfvnN-0006GC-Ln
 for ath10k@lists.infradead.org; Tue, 02 Jun 2020 01:32:51 +0000
Received: by mail-lj1-x243.google.com with SMTP id o9so10574864ljj.6
 for <ath10k@lists.infradead.org>; Mon, 01 Jun 2020 18:32:48 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id x23sm303074lfe.32.2020.06.01.18.32.43
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 18:32:43 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id c21so5133182lfb.3
 for <ath10k@lists.infradead.org>; Mon, 01 Jun 2020 18:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <1576684108-30177-1-git-send-email-kvalo@codeaurora.org>
 <1576684108-30177-2-git-send-email-kvalo@codeaurora.org>
 <1576748692.7758.17.camel@realtek.com>
 <20191219154828.GA12287@w1.fi>
 <CA+ASDXMTYLGbEkBPHSqtyitMEvY5o_MjU0s+NoWdnN_ORy1gDw@mail.gmail.com>
 <20191219185522.GA16010@w1.fi>
 <CA+ASDXNOxkrZTxL0Jo4ONR2YtL83BVc_w-rBXc6ggBLdwUpDZw@mail.gmail.com>
 <871rpqly6a.fsf@kamboji.qca.qualcomm.com>
 <e8908eafd8e6050eef8782c6a7019e318d14f65f.camel@sipsolutions.net>
In-Reply-To: <e8908eafd8e6050eef8782c6a7019e318d14f65f.camel@sipsolutions.net>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 1 Jun 2020 18:32:31 -0700
Message-ID: <CA+ASDXMf7iXuE9hQ-XitPPfvXP0EK5FchJLCu2+5Ag=ZC=0H0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] nl80211: vendor-cmd: qca: add dynamic SAR power limits
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
Cc: Jouni Malinen <j@w1.fi>, Pkshih <pkshih@realtek.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Kalle Valo <kvalo@codeaurora.org>

I haven't quite reached the 3 month lag on the prior replies here :)

I do want to see this question resolved somehow, or else we'll be
dragging along out-of-tree patches for...(counts on fingers)...4
different nl80211 APIs for the same feature, and a driver-detecting
user space for it. I think I was half-hoping that we'd get to chat at
netdev about this, but that's not happening any time soon. (Topic for
another day: does a "wireless workshop" still happen at a virtual-only
conference?)

On Fri, Mar 20, 2020 at 5:56 AM Johannes Berg <johannes@sipsolutions.net> wrote:
> But as somebody has said on one of these threads, there seem to
> basically be two kinds of APIs:
>
>  1) some kind of platform-dependent index into a table that the
>     driver/device has, or perhaps the BIOS; and
>
>  2) some kind of per-band (FSVO band) power restriction like here.
>
>
> The first is like iwlwifi, and I think Marvell was mentioned? But
> they're basically out - there's no information, and there's no clue as
> to which indices might even be valid, I think, nor what they mean. So
> there isn't really much value in a common API for that since you can't
> use it in a common fashion - arguably a common API would be worse...

I think they could still be salvageable. In practice, the only way
I've seen them used is to define a "low power" and a "high power"
table. So if there were conventions (e.g., Marvell's could be
documented in Device Tree, where they store their SAR tables), we
could expose an easy high/low knob.

> However, the case of 2, arguably the proposals are very similar?
>
> Qualcomm: optional nl80211_band, 1/2 dBm units
> Realtek: 2.4, four 5 GHz subbands, 1/4 dBm units

nit: I believe it's 1/8 for Realtek. And I thought it was 1 for
Qualcomm, but apparently this changes every week I see a new
(non-upstream-facing) submission from them...which is a part of the
problem I'd like to solve. They don't have to commit to anything if
it's all downstream ;)

> Both have some strange namespace thing where the same namespace contains
> both the outer and inner attributes. Probably should think about the
> policy with NLA_POLICY_NESTED and see how that works.

Nobody really accused vendors of being good at writing netlink APIs :)
And incidentally, that's another reason why I'd rather not just keep
taking vendor command APIs downstream...

> But it any case, these two don't seem like an insurmountable issue to
> combine?

Exactly my point. And that's why I didn't feel like we really got past #2 [0]:
"The submitter shall consider a pure nl80211 implementation and
explain the reasoning against it in the commit message."

> Say, something like defining a list of affected frequency
> ranges in the wiphy properties, and then giving a list of TX powers that
> matches the list of frequency ranges? We can go to 1/4 dBm or so, that's
> not such a big deal, I'd think?

That sounds about right. We'd probably want a reporting API too, so
drivers can tell what ranges they support, so user space doesn't have
to get creative about handling EINVAL or similar.

I've also seen the Qualcomm proposal include a per-chain option
(although it's missing from QCA6174) so it might be reasonable to
account for that up-front (similar to STA_INFO_CHAIN_SIGNAL?).

One note: while I can imagine that vendors might have other
configurability parameters that aren't reflected in this proposal
(e.g., per-PHY-mode? per-chain?), I've also found that some of the
complexities that vendors offer don't *really* end up being needed by
ODMs/OEMs when building and certifying devices.

> On the other hand, what does that actually buy us? If you cannot have
> common userspace that knows how a given platform must behave, then it's
> not very worthwhile to have common API for it?
>
> Brian, what do you think from a platform/userspace perspective - how do
> you actually determine the SAR limits? I'm guessing you just have a
> table of sorts, but how do you get the table? Would you actually have
> common userspace and benefit from having common API?

This strikes at the sort of thing where Chrome OS tailors the
experience to the hardware, whereas the average Linux distro does not.
So I can describe what we do, but it's tough to say how useful this
ends up being to everyone else. But maybe that's beside the point,
because your average distro will probably not know how to hook up SAR
regardless (but much less so if there's no mainline API for it).

Anyway, the table: Chrome OS has a generalized per-SKU configuration
system, which keys off of a thing called "SKU ID." A number of
factors, including board-level straps or EEPROMs, come together to
determine which model and SKU a given system is. Once the config
system knows that, it can retrieve the data table from its database
(it's just a giant JSON blob). NB: while we currently ship separate
builds (with separate JSON configs) for separate families of systems
(think SoC families), the config system *could* work as a single table
for all Chrome OS systems.

Currently, because each vendor implements this differently enough, we
have separate schema for each of the 2 drivers [1]. But we could just
as well unify this into a range-based system to match the range
proposal above.

Common user space: today, we have a single user space; it's just ugly
[2]. Some of that ugliness is due to the unnecessary divergence in
range-based APIs, which probably would clean up a little if we
supported a common range API. (We'd still be left with our Marvell and
Intel index approaches.)

Really, I could live with per-vendor APIs. My primary goal is to get
these upstream in some form, so vendors can stop using things like
this as a reason for shipping us non-upstream code, and so we can
reduce the delta between upstream and Chrome OS kernels.

I also think that, for the cases that warrant it (i.e., the option 2
-- Realtek and Qualcomm cases, so far), it would be good to have a
common API, but that's a somewhat secondary concern for me.

Also, Kalle had some concerns about stable ABI questions: shouldn't we
bake in some kind of "check for support" feature to these kinds of
APIs [3]? That would help ease transition, if we do start with a
vendor API and move to a common one in the future. Given the nature of
this feature, I wouldn't expect there will be a large variety of users
making use of the APIs -- and I, for one, would be happy to migrate my
user space over some period of time, as needed.

Brian

[0] https://wireless.wiki.kernel.org/en/developers/documentation/nl80211#vendor-specific_api
[1] https://chromium.googlesource.com/chromiumos/platform2/+/master/chromeos-config/README.md#wifi
[2] https://chromium.googlesource.com/chromiumos/platform2/+/master/power_manager/powerd/set_wifi_transmit_power.cc
[3] e.g., we ran into the lack of such support here:
7010998c6caf nl80211: add NL80211_CMD_UPDATE_FT_IES to supported commands

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

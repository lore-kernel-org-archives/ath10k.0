Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB7AA-0000C9-TE
 for ath10k@lists.infradead.org; Fri, 20 Sep 2019 00:52:45 +0000
Received: by mail-qk1-x743.google.com with SMTP id z67so5455779qkb.12
 for <ath10k@lists.infradead.org>; Thu, 19 Sep 2019 17:52:41 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com.
 [209.85.222.179])
 by smtp.gmail.com with ESMTPSA id w11sm178350qtj.10.2019.09.19.17.52.38
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 17:52:38 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id 201so5443365qkd.13
 for <ath10k@lists.infradead.org>; Thu, 19 Sep 2019 17:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
 <20181114225910.GA220599@google.com>
 <CA+ASDXMh7vdfkA5jtJqWEU-g-4Ta5Xvy046zujyASZcESCGhAQ@mail.gmail.com>
 <87woe5aehr.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87woe5aehr.fsf@kamboji.qca.qualcomm.com>
From: Brian Norris <briannorris@chromium.org>
Date: Thu, 19 Sep 2019 17:52:26 -0700
Message-ID: <CA+ASDXPaw0womrCF98zzUinMTYSxeanK0Rc-0kn56TBEWJ__5w@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: support NET_DETECT WoWLAN feature
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

(I realize I replied to the v3, not the v4 which was merged.)

On Wed, Sep 18, 2019 at 7:03 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> Brian Norris <briannorris@chromium.org> writes:
> > Since Wen has once again suggested I use this patch in other forums,
> > I'll ping here to note:
> >
> > On Wed, Nov 14, 2018 at 2:59 PM Brian Norris <briannorris@chromium.org> wrote:
> >> You've introduced a regression in 4.20-rc1:
> >
> > This regression still survives in the latest tree. Is it fair to just
> > submit a revert?
>
> Your description about the problem from an earlier email:
>
>   "It seems like youre enabling SCHED_SCAN support? But you're not
>    adding the NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR feature flag.
>    So it puts us in a tough place on using randomization -- we either
>    can't trust the FEATURE flags, or else we can't use both SCHED_SCAN
>    and scan randomization."

Yeah, maybe I shouldn't have trimmed that context :)

> So essentially the problem is that with firmwares supporting both
> WMI_SERVICE_NLO and WMI_SERVICE_SPOOF_MAC_SUPPORT ath10k enables
> NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR, but
> NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR is not enabled which is
> inconsistent from user space point of view. Is my understanding correct?

Yes, that sounds about right.

> Wen, can you enable NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR? Does firmware
> support that?

I feel like I've asked him that privately, but asking here might not hurt :D

> If that's not possible, one workaround might to be to not enable
> NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR if firmware supports
> WMI_SERVICE_NLO, but of course that would suck big time.

Yeah, that would be strictly worse than the current situation I think.
SCAN_RANDOM_MAC_ADDRESS is a product requirement for us. At least
right now, it's possible I could teach a user space to just ignore
SCHED_SCAN if it doesn't support the appropriate randomization
features. (I don't want to have to do that, but at least it's
possible.)

Brian

> Here's the full context in case someone is interested:
>
> https://patchwork.kernel.org/patch/10567005/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

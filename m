Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAaY9-0006xH-FU
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 14:03:19 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: support NET_DETECT WoWLAN feature
References: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
 <20181114225910.GA220599@google.com>
 <CA+ASDXMh7vdfkA5jtJqWEU-g-4Ta5Xvy046zujyASZcESCGhAQ@mail.gmail.com>
Date: Wed, 18 Sep 2019 17:03:12 +0300
In-Reply-To: <CA+ASDXMh7vdfkA5jtJqWEU-g-4Ta5Xvy046zujyASZcESCGhAQ@mail.gmail.com>
 (Brian Norris's message of "Tue, 17 Sep 2019 09:32:52 -0700")
Message-ID: <87woe5aehr.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Brian Norris <briannorris@chromium.org> writes:

> Since Wen has once again suggested I use this patch in other forums,
> I'll ping here to note:
>
> On Wed, Nov 14, 2018 at 2:59 PM Brian Norris <briannorris@chromium.org> wrote:
>> You've introduced a regression in 4.20-rc1:
>
> This regression still survives in the latest tree. Is it fair to just
> submit a revert?

Your description about the problem from an earlier email:

  "It seems like youre enabling SCHED_SCAN support? But you're not
   adding the NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR feature flag.
   So it puts us in a tough place on using randomization -- we either
   can't trust the FEATURE flags, or else we can't use both SCHED_SCAN
   and scan randomization."

So essentially the problem is that with firmwares supporting both
WMI_SERVICE_NLO and WMI_SERVICE_SPOOF_MAC_SUPPORT ath10k enables
NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR, but
NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR is not enabled which is
inconsistent from user space point of view. Is my understanding correct?

Wen, can you enable NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR? Does firmware
support that?

If that's not possible, one workaround might to be to not enable
NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR if firmware supports
WMI_SERVICE_NLO, but of course that would suck big time.

Here's the full context in case someone is interested:

https://patchwork.kernel.org/patch/10567005/

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

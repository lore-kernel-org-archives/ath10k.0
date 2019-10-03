Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFpSa-0006zl-Vr
 for ath10k@lists.infradead.org; Thu, 03 Oct 2019 00:59:14 +0000
Received: by mail-qk1-x742.google.com with SMTP id p10so645788qkg.8
 for <ath10k@lists.infradead.org>; Wed, 02 Oct 2019 17:59:11 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172])
 by smtp.gmail.com with ESMTPSA id c131sm640696qke.24.2019.10.02.17.59.08
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 17:59:09 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id c3so1228184qtv.10
 for <ath10k@lists.infradead.org>; Wed, 02 Oct 2019 17:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
 <20181114225910.GA220599@google.com>
 <CA+ASDXMh7vdfkA5jtJqWEU-g-4Ta5Xvy046zujyASZcESCGhAQ@mail.gmail.com>
 <87woe5aehr.fsf@kamboji.qca.qualcomm.com>
 <40854e84bd4b4a9699b60530b1c373ad@aptaiexm02f.ap.qualcomm.com>
 <87pnjvctjh.fsf@codeaurora.org>
In-Reply-To: <87pnjvctjh.fsf@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 2 Oct 2019 17:58:56 -0700
Message-ID: <CA+ASDXNXZrBS8dZW4jmXkg7c8-sK=pcYtQtj5KPxCDCEc8XqYA@mail.gmail.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Wen Gong <wgong@qti.qualcomm.com>, Linux Kernel <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

Hi Kalle,

Sorry, I failed to follow up on some of this.

On Fri, Sep 20, 2019 at 12:32 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> But I mixed up the flags. I meant that can we enable
> NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR in ath10k? Does the firmware
> releases which have WMI_SERVICE_NLO support
> NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR as well?

I'm looking at firmware which supports WMI_SERVICE_NLO and
WMI_SERVICE_SPOOF_MAC_SUPPORT. This leads to support for
NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR and
NL80211_WOWLAN_TRIG_NET_DETECT (good!), but it also leads to
NL80211_CMD_START_SCHED_SCAN support and *not*
NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR, which is inconsistent
(bad!).

(I think a few times in here you noted the FEATURE_SCAN variant, when
you probably meant FEATURE_SCHED_SCAN.)

If I understand Wen correctly, he is working on dropping
NL80211_CMD_START_SCHED_SCAN, which would fix the inconsistency.

But I also noticed that ath10k does not support
NL80211_FEATURE_ND_RANDOM_MAC_ADDR, which is again an inconsistency:
we're going to lose randomization when in WoWLAN + NET_DETECT mode. I
don't suspect we (Chrome OS) would ever enable this feature in that
state.

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

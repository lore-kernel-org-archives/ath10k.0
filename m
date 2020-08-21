Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9EYC-00081k-4R
 for ath10k@lists.infradead.org; Fri, 21 Aug 2020 21:26:17 +0000
Received: by mail-vs1-xe43.google.com with SMTP id e14so1534015vsa.9
 for <ath10k@lists.infradead.org>; Fri, 21 Aug 2020 14:26:13 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id o16sm423578vkn.26.2020.08.21.14.26.10
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 14:26:11 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id g11so943712ual.2
 for <ath10k@lists.infradead.org>; Fri, 21 Aug 2020 14:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200709082024.v2.1.I4d2f85ffa06f38532631e864a3125691ef5ffe06@changeid>
In-Reply-To: <20200709082024.v2.1.I4d2f85ffa06f38532631e864a3125691ef5ffe06@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Aug 2020 14:25:59 -0700
Message-ID: <CAD=FV=U1WGrDDspTLJJk1jTSY-Raizm55+8szVADNLTa+tvekw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ath10k: Keep track of which interrupts fired,
 don't poll them
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
To: Kalle Valo <kvalo@codeaurora.org>, ath10k <ath10k@lists.infradead.org>
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rakesh Pillai <pillair@codeaurora.org>, netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Abhishek Kumar <kuabhs@google.com>

Kalle,

On Thu, Jul 9, 2020 at 8:22 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> If we have a per CE (Copy Engine) IRQ then we have no summary
> register.  Right now the code generates a summary register by
> iterating over all copy engines and seeing if they have an interrupt
> pending.
>
> This has a problem.  Specifically if _none_ if the Copy Engines have
> an interrupt pending then they might go into low power mode and
> reading from their address space will cause a full system crash.  This
> was seen to happen when two interrupts went off at nearly the same
> time.  Both were handled by a single call of ath10k_snoc_napi_poll()
> but, because there were two interrupts handled and thus two calls to
> napi_schedule() there was still a second call to
> ath10k_snoc_napi_poll() which ran with no interrupts pending.
>
> Instead of iterating over all the copy engines, let's just keep track
> of the IRQs that fire.  Then we can effectively generate our own
> summary without ever needing to read the Copy Engines.
>
> Tested-on: WCN3990 SNOC WLAN.HL.3.2.2-00490-QCAHLSWMTPL-1
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Rakesh Pillai <pillair@codeaurora.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> ---
> This patch continues work to try to squash all instances of the crash
> we've been seeing while reading CE registers and hopefully this patch
> addresses the true root of the issue.
>
> The first patch that attempted to address these problems landed as
> commit 8f9ed93d09a9 ("ath10k: Wait until copy complete is actually
> done before completing").  After that Rakesh Pillai posted ("ath10k:
> Add interrupt summary based CE processing") [1] and this patch is
> based atop that one.  Both of those patches significantly reduced the
> instances of problems but didn't fully eliminate them.  Crossing my
> fingers that they're all gone now.
>
> [1] https://lore.kernel.org/r/1593193967-29897-1-git-send-email-pillair@codeaurora.org
>
> Changes in v2:
> - Add bitmap_clear() in ath10k_snoc_hif_start().
>
>  drivers/net/wireless/ath/ath10k/ce.c   | 84 ++++++++++----------------
>  drivers/net/wireless/ath/ath10k/ce.h   | 14 ++---
>  drivers/net/wireless/ath/ath10k/snoc.c | 19 ++++--
>  drivers/net/wireless/ath/ath10k/snoc.h |  1 +
>  4 files changed, 52 insertions(+), 66 deletions(-)

I'm wondering if there's anything else you're looking for here.  If I
just need to sit tight that's fine, but I want to make sure this patch
isn't lost and you're not waiting for any actions on my part.  The
patch it depends on from Rakesh (see above or patchwork ID 11628289)
is also still marked as "Under Review".

We have been using this patch for the last few months and we haven't
hit a single crash like we were getting before.  At the same time, we
haven't found any regressions that have been attributed to this patch.

Anyway, just figured I'd check in.  Thanks!

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

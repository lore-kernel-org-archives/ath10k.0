Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkqcw-0000AI-Fg
 for ath10k@lists.infradead.org; Mon, 15 Jun 2020 15:02:23 +0000
Received: by mail-ua1-x943.google.com with SMTP id t26so5754403ual.13
 for <ath10k@lists.infradead.org>; Mon, 15 Jun 2020 08:02:21 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id i203sm1005983vke.7.2020.06.15.08.02.19
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 08:02:20 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id l10so9514641vsr.10
 for <ath10k@lists.infradead.org>; Mon, 15 Jun 2020 08:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200609082015.1.Ife398994e5a0a6830e4d4a16306ef36e0144e7ba@changeid>
 <20200615143237.519F3C433C8@smtp.codeaurora.org>
 <CAD=FV=VaexjLaaZJSxndTEi6KCFaPWW=sUt6hjy9=0Qn68kH1g@mail.gmail.com>
 <87zh94idik.fsf@codeaurora.org>
In-Reply-To: <87zh94idik.fsf@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jun 2020 08:02:00 -0700
Message-ID: <CAD=FV=XfUHD=vw-mvQsdHcn=zhB9-mD6ivrM93jkfHdgb+odiA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Wait until copy complete is actually done before
 completing
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Rakesh Pillai <pillair@codeaurora.org>, netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, kuabhs@google.com

Hi,

On Mon, Jun 15, 2020 at 7:56 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Doug Anderson <dianders@chromium.org> writes:
>
> > On Mon, Jun 15, 2020 at 7:32 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> >>
> >> Douglas Anderson <dianders@chromium.org> wrote:
> >>
> >> > On wcn3990 we have "per_ce_irq = true".  That makes the
> >> > ath10k_ce_interrupt_summary() function always return 0xfff. The
> >> > ath10k_ce_per_engine_service_any() function will see this and think
> >> > that _all_ copy engines have an interrupt.  Without checking, the
> >> > ath10k_ce_per_engine_service() assumes that if it's called that the
> >> > "copy complete" (cc) interrupt fired.  This combination seems bad.
> >> >
> >> > Let's add a check to make sure that the "copy complete" interrupt
> >> > actually fired in ath10k_ce_per_engine_service().
> >> >
> >> > This might fix a hard-to-reproduce failure where it appears that the
> >> > copy complete handlers run before the copy is really complete.
> >> > Specifically a symptom was that we were seeing this on a Qualcomm
> >> > sc7180 board:
> >> >   arm-smmu 15000000.iommu: Unhandled context fault:
> >> >   fsr=0x402, iova=0x7fdd45780, fsynr=0x30003, cbfrsynra=0xc1, cb=10
> >> >
> >> > Even on platforms that don't have wcn3990 this still seems like it
> >> > would be a sane thing to do.  Specifically the current IRQ handler
> >> > comments indicate that there might be other misc interrupt sources
> >> > firing that need to be cleared.  If one of those sources was the one
> >> > that caused the IRQ handler to be called it would also be important to
> >> > double-check that the interrupt we cared about actually fired.
> >> >
> >> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> > Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> >>
> >> ath10k firmwares work very differently, on what hardware and firmware did you
> >> test this? I'll add that information to the commit log.
> >
> > I am running on a Qualcomm sc7180 SoC.
>
> Sorry, I was unclear, I meant the ath10k hardware :) I guess WCN3990 but
> what firmware version?

Ah, sorry!  Yes, it appears to be wcn3990 based on my device tree:

$ git grep -A2 wifi -- arch/arm64/boot/dts/qcom/sc7180.dtsi

wifi: wifi@18800000 {
        compatible = "qcom,wcn3990-wifi";
        reg = <0 0x18800000 0 0x800000>;
        reg-names = "membase";

Firmware isn't final yet, but currently my boot log shows:

qmi fw_version 0x322a01ea
fw_build_timestamp 2020-05-20 03:47
QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2-00490-QCAHLSWMTPL-1

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

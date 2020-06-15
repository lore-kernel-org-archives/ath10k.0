Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkqXI-000542-1c
 for ath10k@lists.infradead.org; Mon, 15 Jun 2020 14:56:36 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Wait until copy complete is actually done before
 completing
References: <20200609082015.1.Ife398994e5a0a6830e4d4a16306ef36e0144e7ba@changeid>
 <20200615143237.519F3C433C8@smtp.codeaurora.org>
 <CAD=FV=VaexjLaaZJSxndTEi6KCFaPWW=sUt6hjy9=0Qn68kH1g@mail.gmail.com>
Date: Mon, 15 Jun 2020 17:56:19 +0300
In-Reply-To: <CAD=FV=VaexjLaaZJSxndTEi6KCFaPWW=sUt6hjy9=0Qn68kH1g@mail.gmail.com>
 (Doug Anderson's message of "Mon, 15 Jun 2020 07:39:33 -0700")
Message-ID: <87zh94idik.fsf@codeaurora.org>
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
To: Doug Anderson <dianders@chromium.org>
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Rakesh Pillai <pillair@codeaurora.org>, netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, kuabhs@google.com

Doug Anderson <dianders@chromium.org> writes:

> On Mon, Jun 15, 2020 at 7:32 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Douglas Anderson <dianders@chromium.org> wrote:
>>
>> > On wcn3990 we have "per_ce_irq = true".  That makes the
>> > ath10k_ce_interrupt_summary() function always return 0xfff. The
>> > ath10k_ce_per_engine_service_any() function will see this and think
>> > that _all_ copy engines have an interrupt.  Without checking, the
>> > ath10k_ce_per_engine_service() assumes that if it's called that the
>> > "copy complete" (cc) interrupt fired.  This combination seems bad.
>> >
>> > Let's add a check to make sure that the "copy complete" interrupt
>> > actually fired in ath10k_ce_per_engine_service().
>> >
>> > This might fix a hard-to-reproduce failure where it appears that the
>> > copy complete handlers run before the copy is really complete.
>> > Specifically a symptom was that we were seeing this on a Qualcomm
>> > sc7180 board:
>> >   arm-smmu 15000000.iommu: Unhandled context fault:
>> >   fsr=0x402, iova=0x7fdd45780, fsynr=0x30003, cbfrsynra=0xc1, cb=10
>> >
>> > Even on platforms that don't have wcn3990 this still seems like it
>> > would be a sane thing to do.  Specifically the current IRQ handler
>> > comments indicate that there might be other misc interrupt sources
>> > firing that need to be cleared.  If one of those sources was the one
>> > that caused the IRQ handler to be called it would also be important to
>> > double-check that the interrupt we cared about actually fired.
>> >
>> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> > Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>>
>> ath10k firmwares work very differently, on what hardware and firmware did you
>> test this? I'll add that information to the commit log.
>
> I am running on a Qualcomm sc7180 SoC.

Sorry, I was unclear, I meant the ath10k hardware :) I guess WCN3990 but
what firmware version?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

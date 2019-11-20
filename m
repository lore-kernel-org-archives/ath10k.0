Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXJTS-0005v2-Gs
 for ath10k@lists.infradead.org; Wed, 20 Nov 2019 06:28:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 3/3] mmc: core: Re-work HW reset for SDIO cards
References: <20191109103046.26445-1-ulf.hansson@linaro.org>
 <20191109103046.26445-4-ulf.hansson@linaro.org>
 <CAD=FV=VHReD5qnvcQLHvfgKHnHLbfDLZHwXtY-LV5uy_VCYpPA@mail.gmail.com>
 <CAPDyKFrCyJBz2=RzKPxqn0FSEq500=dEDsTUWYZeoFKWvSRAdA@mail.gmail.com>
Date: Wed, 20 Nov 2019 06:28:19 +0000
In-Reply-To: <CAPDyKFrCyJBz2=RzKPxqn0FSEq500=dEDsTUWYZeoFKWvSRAdA@mail.gmail.com>
 (Ulf Hansson's message of "Tue, 12 Nov 2019 13:19:55 +0100")
Message-ID: <0101016e877f56b2-1dd9e926-2170-4c9d-bb4b-0116d39e5f96-000000@us-west-2.amazonses.com>
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
To: Ulf Hansson <ulf.hansson@linaro.org>, Wen Gong <wgong@codeaurora.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-wireless <linux-wireless@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, Linux MMC List <linux-mmc@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, ath10k@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>, Erik Stromdahl <erik.stromdahl@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Eyal Reizer <eyalreizer@gmail.com>

+ wen, ath10k

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Tue, 12 Nov 2019 at 01:33, Doug Anderson <dianders@chromium.org> wrote:
>>
>> Hi,
>>
>> On Sat, Nov 9, 2019 at 2:31 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>> >
>> > diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
>> > index 6f8342702c73..abf8f5eb0a1c 100644
>> > --- a/drivers/mmc/core/core.c
>> > +++ b/drivers/mmc/core/core.c
>> > @@ -1469,8 +1469,7 @@ void mmc_detach_bus(struct mmc_host *host)
>> >         mmc_bus_put(host);
>> >  }
>> >
>> > -static void _mmc_detect_change(struct mmc_host *host, unsigned long delay,
>> > -                               bool cd_irq)
>> > +void _mmc_detect_change(struct mmc_host *host, unsigned long delay, bool cd_irq)
>> >  {
>> >         /*
>> >          * If the device is configured as wakeup, we prevent a new sleep for
>> > @@ -2129,7 +2128,7 @@ int mmc_hw_reset(struct mmc_host *host)
>> >         ret = host->bus_ops->hw_reset(host);
>> >         mmc_bus_put(host);
>> >
>> > -       if (ret)
>> > +       if (ret < 0)
>> >                 pr_warn("%s: tried to HW reset card, got error %d\n",
>> >                         mmc_hostname(host), ret);
>>
>> Other callers besides marvell need to be updated?  In theory only SDIO
>> should have positive return values so I guess we don't care about the
>> caller in drivers/mmc/core/block.c, right?
>
> Correct, but maybe I should add some more information about that in a
> function header of mmc_hw_reset(). Let me consider doing that as a
> change on top.
>
>>  What about:
>>
>> drivers/net/wireless/ath/ath10k/sdio.c
>>
>> ...I guess I don't know if there is more than one function probed
>> there.  Maybe there's not and thus we're fine here too?
>
> Well, honestly I don't know.
>
> In any case, that would mean the driver is broken anyways and needs to
> be fixed. At least that's my approach to doing this change.

Wen, does QCA6174 or QCA9377 SDIO devices have other SDIO functions, for
example bluetooth? I'm just wondering how should we handle this in
ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

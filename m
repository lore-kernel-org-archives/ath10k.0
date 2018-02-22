Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eozBr-0005Yu-5E
 for ath10k@lists.infradead.org; Thu, 22 Feb 2018 22:18:12 +0000
Received: by mail-wr0-x242.google.com with SMTP id 34so12138180wre.13
 for <ath10k@lists.infradead.org>; Thu, 22 Feb 2018 14:18:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180222111534.31047-1-s.gottschall@dd-wrt.com>
References: <20180222111534.31047-1-s.gottschall@dd-wrt.com>
From: Steve deRosier <derosier@gmail.com>
Date: Thu, 22 Feb 2018 14:17:58 -0800
Message-ID: <CALLGbRKimHh39DhnJP+mxB3=fkOzPDkXzbGrdJenLOgZUYCcCg@mail.gmail.com>
Subject: Re: [PATCH v9] ath10k: add LED and GPIO controlling support for
 various chipsets
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Thu, Feb 22, 2018 at 3:15 AM,  <s.gottschall@dd-wrt.com> wrote:
> From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
>
> Adds LED and GPIO Control support for 988x, 9887, 9888, 99x0, 9984 based chipsets with on chipset connected led's
> using WMI Firmware API.
> The LED device will get available named as "ath10k-phyX" at sysfs and can be controlled with various triggers.
> adds also debugfs interface for gpio control.
>
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>
> v2  add correct gpio count per chipset and remove IPQ4019 support since this chipset does not make use of specific gpios)
> v5  fix compiling without LED_CLASS and GPIOLIB support, fix also error by kbuild test robot which does not occur in standard builds. curious
> v6  correct return values and fix comment style
> v7  fix ath10k_unregister_led for compiling without LED_CLASS
> v8  fix various code design issues reported by reviewers
> v9  move led and led code to separate sourcefile (gpio.c)
> ---
>  drivers/net/wireless/ath/ath10k/Kconfig   |   3 +
>  drivers/net/wireless/ath/ath10k/Makefile  |   1 +
>  drivers/net/wireless/ath/ath10k/core.c    |  28 ++++-
>  drivers/net/wireless/ath/ath10k/core.h    |  33 ++++-
>  drivers/net/wireless/ath/ath10k/debug.c   | 142 ++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/gpio.c    | 196 ++++++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/hw.h      |   2 +
>  drivers/net/wireless/ath/ath10k/mac.c     |   5 +
>  drivers/net/wireless/ath/ath10k/wmi-ops.h |  36 +++++-
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c |  65 ++++++++++
>  drivers/net/wireless/ath/ath10k/wmi.c     |  46 +++++++
>  drivers/net/wireless/ath/ath10k/wmi.h     |  36 ++++++
>  12 files changed, 590 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath10k/gpio.c
>
> diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
> index deb5ae21a559..c46b7658a820 100644
> --- a/drivers/net/wireless/ath/ath10k/Kconfig
> +++ b/drivers/net/wireless/ath/ath10k/Kconfig
> @@ -2,6 +2,9 @@ config ATH10K
>          tristate "Atheros 802.11ac wireless cards support"
>          depends on MAC80211 && HAS_DMA
>         select ATH_COMMON
> +        select MAC80211_LEDS
> +        select LEDS_CLASS
> +        select NEW_LEDS
>         select CRC32
>         select WANT_DEV_COREDUMP
>          ---help---

Pure question: do we require LEDS, or is this an option? I assumed all
along it was an optional thing - ie if GPIOs and/or LEDs were
configured, we added this code. And if not optional, then what happens
if we are on a platform that can't support LEDS_CLASS or NEW_LEDS,
assuming there is such a thing?


> diff --git a/drivers/net/wireless/ath/ath10k/Makefile b/drivers/net/wireless/ath/ath10k/Makefile
> index 6739ac26fd29..bcb234f0b940 100644
> --- a/drivers/net/wireless/ath/ath10k/Makefile
> +++ b/drivers/net/wireless/ath/ath10k/Makefile
> @@ -20,6 +20,7 @@ ath10k_core-$(CONFIG_NL80211_TESTMODE) += testmode.o
>  ath10k_core-$(CONFIG_ATH10K_TRACING) += trace.o
>  ath10k_core-$(CONFIG_THERMAL) += thermal.o
>  ath10k_core-$(CONFIG_MAC80211_DEBUGFS) += debugfs_sta.o
> +ath10k_core-y += gpio.o
>  ath10k_core-$(CONFIG_PM) += wow.o
>  ath10k_core-$(CONFIG_DEV_COREDUMP) += coredump.o
>

I'd expect it would be something like `ath10k_core-$(CONFIG_GPIO) +=
gpoi.o`.  Maybe I'm mistaken.
(Note, I didn't look up the actual config option name, I'm guessing.
Assume I wrote something reasonable for my example.)

I only ask the above two questions, not because I think it's wrong,
but because I don't quite know the intention and it makes me wonder.

Other than those questions, which are optional as the code looks
correct to me, the rest of it looks fine to me.

Reviewed-by: Steve deRosier <derosier@cal-sierra.com>

- Steve

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1emixQ-0007Bj-NQ
 for ath10k@lists.infradead.org; Fri, 16 Feb 2018 16:33:58 +0000
Received: by mail-wr0-x244.google.com with SMTP id l43so3492200wrc.2
 for <ath10k@lists.infradead.org>; Fri, 16 Feb 2018 08:33:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180216103020.5009-1-s.gottschall@dd-wrt.com>
References: <20180216103020.5009-1-s.gottschall@dd-wrt.com>
From: Steve deRosier <derosier@gmail.com>
Date: Fri, 16 Feb 2018 08:33:43 -0800
Message-ID: <CALLGbRKVpXwZ12BbntX__OGhS3VLBNvRYRnuDGwTKMzu_eiK5Q@mail.gmail.com>
Subject: Re: [PATCH] v2 ath10k: add LED and GPIO controlling support for
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
To: s.gottschall@dd-wrt.com
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Fri, Feb 16, 2018 at 2:30 AM,  <s.gottschall@dd-wrt.com> wrote:
> From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
>
> Adds LED and GPIO Control support for 988x, 9887, 9888, 99x0, 9984 and ipq4019 based chipsets with on chipset connected led's
> using WMI Firmware API.
> The LED device will get available named as "ath10k-phyX" at sysfs and can be controlled with various triggers.
> adds also debugfs interface for gpio control.
>

Hi Sebastian,

First off, let me say I love this and the effort to make the gpios
hanging off the wifi chip as proper system gpios. Years ago I had to
do a hack to make some wifi-chip provided pins available to a customer
who needed more GPIOs on our SoM. It would have been nice if provided
hardware functionality had already been properly supported by the
driver.

In looking through, it looks like you're hooking into the standard
gpio-chip driver interface. Which is great. So, why are you providing
a separate out-of-band debugfs access interface for gpio control?
Seems to me to be a duplicate of the interface in sysfs that provides
gpio access (`/sys/class/gpio`). My preference is we don't duplicate
functionality and that we use the standard provided features. That way
we don't possibly confuse users, and we also reduce our maintenance
effort.

Additionally, what happens when the relevant GPIO configuration
options aren't enabled? Do we have a compilation issue? I'm more
familiar with being a _consumer_ of gpiolib in my drivers and I know
if CONFIG_GPIOLIB isn't checked I end up with problems. I'm unsure
what happens when you're presenting a gpio-chip interface without the
relevant CONFIG_ being enabled. Note that I didn't test this, I'm just
asking the question to be sure we don't forget anything.

- Steve

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

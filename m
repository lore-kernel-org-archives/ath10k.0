Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5Z3H-0005Gg-0i
 for ath10k@lists.infradead.org; Mon, 09 Apr 2018 15:49:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v13] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
 <a249fc31-18bf-96a1-27ee-deea05d2d0ff@dd-wrt.com>
Date: Mon, 09 Apr 2018 18:49:35 +0300
In-Reply-To: <a249fc31-18bf-96a1-27ee-deea05d2d0ff@dd-wrt.com> (Sebastian
 Gottschall's message of "Fri, 6 Apr 2018 20:31:16 +0200")
Message-ID: <87k1tgbcs0.fsf@kamboji.qca.qualcomm.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> you removed the call to leds_start from certain locations but you seem
> to have ignored the comment i wrote above the function call.

IIRC I moved the comment to ath10k_leds_start().

> there is a reason why i reinitialize the gpio output state in these
> locations. the firmware for 9984 and 99xx resets the gpio registers
> at certain points. this will lead to a non working led code.

What are the certain points exactly? I tried to be careful that from
firmware's point of view the functionality is the same, even if I moved
the call to a different location. Did you test the patch? Is it broken
now?

> so you must set the gpio output to high again and this is the reason
> why the function is called "reset_led_pin" and not led_start because
> it doesnt start the led in any way.

The naming refers to phases of ath10k initialisation which are:

create() - destroy()
register() - unregister()
start() - stop()

So the naming doesn't mean that every ath10k_foo_start() has to start
something, it just describes the phase of driver initialisation it's
called in.

> it just resets the output state there is only one work around you may
> do. you set the gpio out register to high on every led trigger, but
> this is what i wanted to avoid to save cpu time since a wmi call is
> more expensive than just a register write.

Is this really so frequently called that we need to think about CPU
time? How often are we expecting the LED state to change?

But I'm not really following you, from firmware point of view the
functionality should be the same as with your patch. 

> so if you want to follow this up. remove ath10k_leds_start
> and insert
>
> ath10k_wmi_gpio_config(ar, ar->hw_params.led_pin, 0,
> 			       WMI_GPIO_PULL_NONE, WMI_GPIO_INTTYPE_DISABLE);
>
> in ath10k_leds_set_brightness_blocking

Calling ath10k_wmi_gpio_config() every time sounds like quite odd to me
and your patch didn't do that either. Are you sure this is really
needed?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

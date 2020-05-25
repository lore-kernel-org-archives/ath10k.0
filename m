Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.as201155.net ([185.84.6.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd9Oa-0003uJ-FJ
 for ath10k@lists.infradead.org; Mon, 25 May 2020 09:27:48 +0000
Subject: Re: [PATCH v13] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
 <2468724.JaAZLprVu6@bentobox>
 <b23e65cf-4be7-72db-7955-32eae196953e@dd-wrt.com>
 <3608947.bSrYYtX6KI@bentobox>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <309af858-7e38-17fa-a1db-6b9ce8544ef5@dd-wrt.com>
Date: Mon, 25 May 2020 11:27:34 +0200
MIME-Version: 1.0
In-Reply-To: <3608947.bSrYYtX6KI@bentobox>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, openwrt-devel@lists.openwrt.org, Ansuel Smith <ansuelsmth@gmail.com>, Kalle Valo <kvalo@codeaurora.org>


Am 25.05.2020 um 11:22 schrieb Sven Eckelmann:
> On Wednesday, 20 May 2020 09:39:45 CEST Sebastian Gottschall wrote:
> [...]
>> could somone clarify the state here and why it was dropped?
>> the original patch i wrote does exclude the soc chipsets, but the patch
>> was later reorganized and some part have been rewritten
>> so i'm not sure if it covers the scenario mentioned here, which i did
> [...]
>>> This patch was imported to OpenWrt in commit 61d57a2f88b9 ("mac80211: ath10k
>>> add leds support") and broke the 11s support for IPQ4019 and QCA4019 (5GHz)
>>> firmware versions 10.4-3.5.3-00053, 10.4-3.5.3-00057, 10.4-3.6-00140:
> Just noticed that there was a copy and paste error in my message. The 5GHz was
> an QCA9888 [1,2] and not an QCA4019. Otherwise the _pci error wouldn't have made
> any sense.
>
> And I can only say at the moment (remember that this was observer 14 months
> ago), that it could be reproduced easily on IPQ40xx with an QCA9888 and the
> given config running OpenWrt reboot-9440-g0f89c17b57. The diffconfig (seed) of
> the installation was:
>
>      CONFIG_TARGET_ipq40xx=y
>      CONFIG_TARGET_ipq40xx_generic=y
>      CONFIG_TARGET_ipq40xx_generic_DEVICE_openmesh_a62=y
>      CONFIG_ATH10K_LEDS=y
>      CONFIG_PACKAGE_ath10k-firmware-qca4019=y
>      # CONFIG_PACKAGE_ath10k-firmware-qca4019-ct is not set
>      CONFIG_PACKAGE_ath10k-firmware-qca9888=y
>      # CONFIG_PACKAGE_ath10k-firmware-qca9888-ct is not set
>      CONFIG_PACKAGE_kmod-ath10k=y
>      # CONFIG_PACKAGE_kmod-ath10k-ct is not set
>      # CONFIG_PACKAGE_kmod-hwmon-core is not set
>
> And it still can with this OpenWrt version. But it doesn't seem to happen with
> the most recent OpenWrt reboot-13353-gb1604b744b. But there are nearly 4000
> commits inbetween. So no idea what changed (just a timing thing or an actual
> fix - no idea).
>
> Btw. the wireless config was given in the original mail [2,3]
>
> Kind regards,
> 	Sven
maybe openwrt installs a default trigger which doesnt make sense if 
nothing is connected to the cards gpio.
we can also modify the patch to exclude the 9888 from led support. you 
just need to remove the led_pin defintion from the hw definition.
this patch is mainly for wireless routers like the netgear r7800, r9000 
and some tplink archer models. it also works on mikrotik qca988x cards.
but even if the led_pin is set, it should not trigger any action until a 
led trigger is set with sysfs. such configurations should be 
architecture specific in any way

Sebastian



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

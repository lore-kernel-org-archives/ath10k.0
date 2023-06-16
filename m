Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0579EB64D8
	for <ath10k@archiver.kernel.org>; Fri, 16 Jun 2023 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCDEuUsjryA4L+4ssG6E44/dbdb638BfnlEEAnW6A1M=; b=kCtBbAFgZ+fWtU
	X4kIAsO2inmrbGFG3HDIkBOzjGANa/eOYcn8/MyESRNPCRkKSbIP2q51u7ftxknh3Qvz6SfMP0zmv
	/WHbLGsulxowq7h2wemyZXHj4mUe4h8+ycefl9nxD7i6WREF8EmLJ6/HF5MgH+Fh8x3bgqJ9vCrZD
	k5ihciLvsyVXC7c2cwfKD398RiMp4EbKJgO1gWuFTsPFpNvIN2F/20EwJfN424eCxq0iV0rHyhbPg
	5qu2sOQVBl2nAfbtXKWlzQWyslmeaM1n5/V7pxQDXjLOaxNft3mTo3FnTK0NMJ6KasvJbKdj/t7pL
	9usWxSQjjR0gYuQI5TUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qACrF-001EB3-2H;
	Fri, 16 Jun 2023 17:03:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qACrB-001E9t-17
	for ath10k@lists.infradead.org;
	Fri, 16 Jun 2023 17:03:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C79F36148F;
	Fri, 16 Jun 2023 17:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894DAC433C0;
	Fri, 16 Jun 2023 17:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686935008;
	bh=AXStpl5ukr0pjZfA+v+TDZ1tI5AAWimXjj+HdNCQLDg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OaEWLE5ZcI0HtHDX6XuKVwV19IfvKqsoJsiuqB79bClgWYcVM1WFl8pm+UuAbfu1I
	 USelhXrgNWUjYwaHjBUyu3XQdfKDkna0Js9x1R5+HwSWw88Xx477WaZ/F/xVu+YUky
	 BGo6eTBgcrma640rFZ75QHgbYRwVLb7LJGp2gMeH3nHn62Xjur+1nVnXoYcAMc4QlM
	 G76/58Qr2VvWW2KCdCJzq+XNO3+18CODgol5NHrhGsbG0YDWaiq1Xpqw/A385Xgiu6
	 9W7DeUb5HU3TrAYeao6n596/4NNUD8ImEzEZaznl50IC7qvB1FHg7MUI4EVu4JS1sv
	 WlxFpzsINcgJw==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  linux-kernel@vger.kernel.org,  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  Sebastian Gottschall <s.gottschall@dd-wrt.com>,  Steve deRosier <derosier@cal-sierra.com>,  Stefan Lippers-Hollmann <s.l-h@gmx.de>
Subject: Re: [PATCH v14] ath10k: add LED and GPIO controlling support for various chipsets
References: <20230611080505.17393-1-ansuelsmth@gmail.com>
Date: Fri, 16 Jun 2023 20:03:23 +0300
In-Reply-To: <20230611080505.17393-1-ansuelsmth@gmail.com> (Christian
	Marangi's message of "Sun, 11 Jun 2023 10:05:05 +0200")
Message-ID: <878rcjbaqs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_100329_463257_4A2FA738 
X-CRM114-Status: GOOD (  33.40  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Christian Marangi <ansuelsmth@gmail.com> writes:

> From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>
> Adds LED and GPIO Control support for 988x, 9887, 9888, 99x0, 9984
> based chipsets with on chipset connected led's using WMI Firmware API.
> The LED device will get available named as "ath10k-phyX" at sysfs and
> can be controlled with various triggers.
> Adds also debugfs interface for gpio control.
>
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> Reviewed-by: Steve deRosier <derosier@cal-sierra.com>
> [kvalo: major reorg and cleanup]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> [ansuel: rebase and small cleanup]
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Tested-by: Stefan Lippers-Hollmann <s.l-h@gmx.de>
> ---
>
> Hi,
> this is a very old patch from 2018 that somehow was talked till 2020
> with Kavlo asked to rebase and resubmit and nobody did.
> So here we are in 2023 with me trying to finally have this upstream.
>
> A summarize of the situation.
> - The patch is from years in OpenWRT. Used by anything that has ath10k
>   card and a LED connected.
> - This patch is also used by the fw variant from Candela Tech with no
>   problem reported.
> - It was pointed out that this caused some problem with ipq4019 SoC
>   but the problem was actually caused by a different bug related to
>   interrupts.
>
> I honestly hope we can have this feature merged since it's really
> funny to have something that was so near merge and jet still not
> present and with devices not supporting this simple but useful
> feature.

Indeed, we should finally get this in. Thanks for working on it.

I did some minor changes to the patch, they are in my pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=686464864538158f22842dc49eddea6fa50e59c1

My comments below, please review my changes. No need to resend because
of these.

> --- a/drivers/net/wireless/ath/ath10k/Kconfig
> +++ b/drivers/net/wireless/ath/ath10k/Kconfig
> @@ -67,6 +67,23 @@ config ATH10K_DEBUGFS
>  
>  	  If unsure, say Y to make it easier to debug problems.
>  
> +config ATH10K_LEDS
> +	bool "Atheros ath10k LED support"
> +	depends on ATH10K
> +	select MAC80211_LEDS
> +	select LEDS_CLASS
> +	select NEW_LEDS
> +	default y
> +	help
> +	  This option enables LEDs support for chipset LED pins.
> +	  Each pin is connected via GPIO and can be controlled using
> +	  WMI Firmware API.
> +
> +	  The LED device will get available named as "ath10k-phyX" at sysfs and
> +    	  can be controlled with various triggers.
> +
> +	  Say Y, if you have LED pins connected to the ath10k wireless card.

I'm not sure anymore if we should ask anything from the user, better to
enable automatically if LED support is enabled in the kernel. So I
simplified this to:

config ATH10K_LEDS
	bool
	depends on ATH10K
	depends on LEDS_CLASS=y || LEDS_CLASS=MAC80211
	default y

This follows what mt76 does:

config MT76_LEDS
	bool
	depends on MT76_CORE
	depends on LEDS_CLASS=y || MT76_CORE=LEDS_CLASS
	default y

> @@ -65,6 +66,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>  		.dev_id = QCA988X_2_0_DEVICE_ID,
>  		.bus = ATH10K_BUS_PCI,
>  		.name = "qca988x hw2.0",
> +		.led_pin = 1,
>  		.patch_load_addr = QCA988X_HW_2_0_PATCH_LOAD_ADDR,
>  		.uart_pin = 7,
>  		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_ALL,

I prefer following the field order from struct ath10k_hw_params
declaration and also setting fields explicitly to zero (even though
there are gaps still) so I changed that for every entry.

> +int ath10k_leds_register(struct ath10k *ar)
> +{
> +	int ret;
> +
> +	if (ar->hw_params.led_pin == 0)
> +		/* leds not supported */
> +		return 0;
> +
> +	snprintf(ar->leds.label, sizeof(ar->leds.label), "ath10k-%s",
> +		 wiphy_name(ar->hw->wiphy));
> +	ar->leds.wifi_led.active_low = 1;
> +	ar->leds.wifi_led.gpio = ar->hw_params.led_pin;
> +	ar->leds.wifi_led.name = ar->leds.label;
> +	ar->leds.wifi_led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
> +
> +	ar->leds.cdev.name = ar->leds.label;
> +	ar->leds.cdev.brightness_set_blocking = ath10k_leds_set_brightness_blocking;
> +
> +	/* FIXME: this assignment doesn't make sense as it's NULL, remove it? */
> +	ar->leds.cdev.default_trigger = ar->leds.wifi_led.default_trigger;

But what to do with this FIXME?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

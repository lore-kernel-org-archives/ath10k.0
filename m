Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A53FF8868
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2WSpE3XBwht464LWU4R3CIOiENba9ePuxg7hhov+hPs=; b=LThI4sqj2AdNHclkbeSMrc4GfJ
	86jRygey5NHcokAqx/rMMvXHfq6sZv7ZMsLDs4okDLhaebF+VjPnXz47R++iO4tXLQOfZ+JLy9OJl
	ti9mrZpCKsHy7C/gXFzqCCwTued6s2OvmLIK2N4iX685MpvWirt2b77T3AR9B6gxVyUIaSugfCZeE
	SWAwKDIA0Wv8MFYw/0b9vLNPrfwuoavGqdsywBagRslA8mKjaXEWhn+KHShPJE9hvPMWb6hM0i4CG
	VHEp9HBj4x0TlGYBhuHHFtuOE9doCud0GDUL1GelRDACcdZEcCUykymAzmeozA7PS0ijCXMvUO4WW
	alglk+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlJx-00000001wT1-44V2;
	Tue, 28 Apr 2026 16:30:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlJx-00000001wRu-0Yy3
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 16:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FA9C61331;
	Tue, 28 Apr 2026 16:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA81BC2BCAF;
	Tue, 28 Apr 2026 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777393799;
	bh=HiyNk8Hwo3GZNgCXjXwqJh6ftb4UrgqPS7ffEG6uOxQ=;
	h=From:To:Cc:Subject:Date:From;
	b=l/3AnJqkQsZ+QtYY4ItS2XRPnSPsV51wckgmjJbCvpOlkOUEiOqR9rSzO/YFrVHYD
	 RVJAcZhxjsKDd059IItV0ovauw+3bWsHU3KvndQagx9c7SqKku9Z3LZHqDO6h6Xj9A
	 noFA3jeYviVAsyBpYOsAB44g2HZMMAlsGnMcbvgaa/rNZ5XFu0BJTZYyNmD40mTMTm
	 BmcvLwiApz870Oke4Emg6tMkGBw7XB5s/Gdu/Ewr63UXp+6EINYLCnUKRWCa2R3Gk5
	 2xEqcv4ae/xOqq2Sfeoq0j2/MT8dISdKA+E6gddc8kqujvUoBXnNZw/mPQTiYoM9an
	 Zza4KCl2sVoQA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kang Yang <kang.yang@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath10k: drop gpio_led reference
Date: Tue, 28 Apr 2026 18:29:49 +0200
Message-Id: <20260428162955.614739-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

The driver uses a 'struct gpio_led' internally, but does not actually interact
with the gpio_led driver, in particular it does not actually use gpiolib here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/core.h | 1 -
 drivers/net/wireless/ath/ath10k/leds.c | 8 +-------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 73a9db302245..dfee432615eb 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1269,7 +1269,6 @@ struct ath10k {
 	} testmode;
 
 	struct {
-		struct gpio_led wifi_led;
 		struct led_classdev cdev;
 		char label[48];
 		u32 gpio_state_pin;
diff --git a/drivers/net/wireless/ath/ath10k/leds.c b/drivers/net/wireless/ath/ath10k/leds.c
index 3a6c8111e7c6..a3961e7760a5 100644
--- a/drivers/net/wireless/ath/ath10k/leds.c
+++ b/drivers/net/wireless/ath/ath10k/leds.c
@@ -19,15 +19,13 @@ static int ath10k_leds_set_brightness_blocking(struct led_classdev *led_cdev,
 {
 	struct ath10k *ar = container_of(led_cdev, struct ath10k,
 					 leds.cdev);
-	struct gpio_led *led = &ar->leds.wifi_led;
 
 	mutex_lock(&ar->conf_mutex);
 
 	if (ar->state != ATH10K_STATE_ON)
 		goto out;
 
-	ar->leds.gpio_state_pin = (brightness != LED_OFF) ^ led->active_low;
-	ath10k_wmi_gpio_output(ar, ar->hw_params.led_pin, ar->leds.gpio_state_pin);
+	ath10k_wmi_gpio_output(ar, ar->hw_params.led_pin, brightness == LED_OFF);
 
 out:
 	mutex_unlock(&ar->conf_mutex);
@@ -63,13 +61,9 @@ int ath10k_leds_register(struct ath10k *ar)
 
 	snprintf(ar->leds.label, sizeof(ar->leds.label), "ath10k-%s",
 		 wiphy_name(ar->hw->wiphy));
-	ar->leds.wifi_led.active_low = 1;
-	ar->leds.wifi_led.name = ar->leds.label;
-	ar->leds.wifi_led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
 
 	ar->leds.cdev.name = ar->leds.label;
 	ar->leds.cdev.brightness_set_blocking = ath10k_leds_set_brightness_blocking;
-	ar->leds.cdev.default_trigger = ar->leds.wifi_led.default_trigger;
 
 	ret = led_classdev_register(wiphy_dev(ar->hw->wiphy), &ar->leds.cdev);
 	if (ret)
-- 
2.39.5



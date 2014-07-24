Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAFLD-0007pF-2p
 for ath10k@lists.infradead.org; Thu, 24 Jul 2014 09:29:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv3-ath-resend 2/2] ath10k: add spectral scan feature
References: <87mwc0ro8i.fsf@kamboji.qca.qualcomm.com>
 <1406136773-19957-1-git-send-email-sw@simonwunderlich.de>
Date: Thu, 24 Jul 2014 12:29:07 +0300
In-Reply-To: <1406136773-19957-1-git-send-email-sw@simonwunderlich.de> (Simon
 Wunderlich's message of "Wed, 23 Jul 2014 19:32:53 +0200")
Message-ID: <871ttbrtp8.fsf@kamboji.qca.qualcomm.com>
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: mathias.kretschmer@fokus.fraunhofer.de, kgiori@qca.qualcomm.com, linux-wireless@vger.kernel.org, sven@narfation.org, ath10k@lists.infradead.org

Simon Wunderlich <sw@simonwunderlich.de> writes:

> Adds the spectral scan feature for ath10k. The spectral scan is triggered by
> configuring a mode through a debugfs control file. Samples can be gathered via
> another relay debugfs file.
>
> Essentially, to try it out:
>
> ip link set dev wlan0 up
> echo background > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> echo trigger > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> iw dev wlan0 scan
> echo disable > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> cat /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan0 > samples
>
> This feature is still experimental. Based on the original RFC patch of
> Sven Eckelmann.
>
> Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
> Signed-off-by: Mathias Kretschmer <mathias.kretschmer@fokus.fraunhofer.de>

[...]

> diff --git a/drivers/net/wireless/ath/ath10k/Makefile b/drivers/net/wireless/ath/ath10k/Makefile
> index a4179f4..3241ef9 100644
> --- a/drivers/net/wireless/ath/ath10k/Makefile
> +++ b/drivers/net/wireless/ath/ath10k/Makefile
> @@ -10,6 +10,7 @@ ath10k_core-y += mac.o \
>  		 wmi.o \
>  		 bmi.o
>  
> +ath10k_core-$(CPTCFG_ATH10K_DEBUGFS) += spectral.o

This one still uses CPTCFG_ prefix, I'll fix those.

> @@ -800,8 +800,6 @@ int ath10k_core_start(struct ath10k *ar)
>  	else
>  		ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
>  
> -	INIT_LIST_HEAD(&ar->arvifs);
> -
>  	if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags)) {
>  		ath10k_info("%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d\n",
>  			    ar->hw_params.name,
> @@ -1084,6 +1082,12 @@ struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
>  	INIT_WORK(&ar->register_work, ath10k_core_register_work);
>  	INIT_WORK(&ar->restart_work, ath10k_core_restart);
>  
> +	INIT_LIST_HEAD(&ar->arvifs);

I'm a bit suspicious about this, why is it needed?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

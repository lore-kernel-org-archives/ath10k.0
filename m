Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXkPQ-00088Z-Br
 for ath10k@lists.infradead.org; Fri, 14 Dec 2018 10:09:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Skip sending quiet mode cmd for WCN3990
References: <20181211053853.3557-1-govinds@codeaurora.org>
Date: Fri, 14 Dec 2018 12:09:13 +0200
In-Reply-To: <20181211053853.3557-1-govinds@codeaurora.org> (Govind Singh's
 message of "Tue, 11 Dec 2018 11:08:53 +0530")
Message-ID: <87k1kcxvw6.fsf@kamboji.qca.qualcomm.com>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> writes:

> From: Rakesh Pillai <pillair@codeaurora.org>
>
> HL2.0 firmware does not support setting quiet mode.
> If the host driver sends the quiet mode setting
> command to the HL2.0 firmware, it crashes with the
> below signature.
>
> fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN RT:207a:PC=b001b4f0
>
> The quiet mode command support is exposed by the firmware
> via thermal throttle wmi service. Enable ath10k thermal
> support if thermal throttle wmi service bit is set.
> 10X firmware version supports this feature by default, hence
> set this service bit by default.
>
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

So this would also need testing with QCA988X or QCA9884 family of
devices, I don't think this patch would have worked as is.

> Co-developed-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>

I had few comments below which I fixed myself. I'll send v2 soon.

> @@ -2621,6 +2621,10 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>  		goto err_hif_stop;
>  	}
>  
> +	if (test_bit(ATH10K_FW_FEATURE_WMI_10X,
> +		     ar->normal_mode_fw.fw_file.fw_features)) {
> +		set_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map);
> +	}

I don't think testing for ATH10K_FW_FEATURE_WMI_10X works, that's a
really old and deprecated flag. wmi_op_version should be more reliable.

Also I refactored this to it's own function.

>  	/* Some firmware revisions do not properly set up hardware rx filter
>  	 * registers.
>  	 *
> @@ -2919,11 +2923,13 @@ static void ath10k_core_register_work(struct work_struct *work)
>  		goto err_debug_destroy;
>  	}
>  
> -	status = ath10k_thermal_register(ar);
> -	if (status) {
> -		ath10k_err(ar, "could not register thermal device: %d\n",
> -			   status);
> -		goto err_spectral_destroy;
> +	if (test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map)) {
> +		status = ath10k_thermal_register(ar);
> +		if (status) {
> +			ath10k_err(ar, "could not register thermal device: %d\n",
> +				   status);
> +			goto err_spectral_destroy;
> +		}
>  	}

The code becomes cleaner if the test is in thermal.c so I moved it
there.

> @@ -2964,7 +2970,8 @@ void ath10k_core_unregister(struct ath10k *ar)
>  	if (!test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags))
>  		return;
>  
> -	ath10k_thermal_unregister(ar);
> +	if (test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map))
> +		ath10k_thermal_unregister(ar);

Same here.

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -4800,7 +4800,8 @@ static int ath10k_start(struct ieee80211_hw *hw)
>  	ath10k_regd_update(ar);
>  
>  	ath10k_spectral_start(ar);
> -	ath10k_thermal_set_throttling(ar);
> +	if (test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map))
> +		ath10k_thermal_set_throttling(ar);

And here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

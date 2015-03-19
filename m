Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYWC0-0003M4-Bu
 for ath10k@lists.infradead.org; Thu, 19 Mar 2015 08:52:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: allow user to toggle ani_enable via debugfs
References: <1426701700-21974-1-git-send-email-arnagara@qti.qualcomm.com>
 <1426701700-21974-2-git-send-email-arnagara@qti.qualcomm.com>
Date: Thu, 19 Mar 2015 10:52:09 +0200
In-Reply-To: <1426701700-21974-2-git-send-email-arnagara@qti.qualcomm.com>
 (Ashok Raj Nagarajan's message of "Wed, 18 Mar 2015 23:31:40 +0530")
Message-ID: <87vbhxjrnq.fsf@kamboji.qca.qualcomm.com>
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Adding also ath10k list.

Ashok Raj Nagarajan <arnagara@qti.qualcomm.com> writes:

> Now that ANI is enabled by default, allow user to disable or enable ANI feature
> from debugfs
>
> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.h  |  1 +
>  drivers/net/wireless/ath/ath10k/debug.c | 58 +++++++++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/mac.c   |  1 +
>  3 files changed, 60 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 7cba781..1359d2c 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -510,6 +510,7 @@ struct ath10k {
>  	u32 ht_cap_info;
>  	u32 vht_cap_info;
>  	u32 num_rf_chains;
> +	bool ani_enabled;

Please document the locking, "/* protected by conf_mutex */" or
something like that.

>  
>  	DECLARE_BITMAP(fw_features, ATH10K_FW_FEATURE_COUNT);
>  
> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
> index 301081d..95f2a29 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -1708,6 +1708,61 @@ static int ath10k_debug_cal_data_release(struct inode *inode,
>  	return 0;
>  }
>  
> +static ssize_t ath10k_write_ani_enable(struct file *file,
> +				       const char __user *user_buf,
> +				       size_t count, loff_t *ppos)
> +{
> +	struct ath10k *ar = file->private_data;
> +	int ret;
> +	u8 enable;
> +
> +	if (kstrtou8_from_user(user_buf, count, 0, &enable))
> +		return -EINVAL;
> +
> +	if (ar->ani_enabled == enable)
> +		return count;
> +
> +	mutex_lock(&ar->conf_mutex);

Hmm, you don't protect ar->ani_enabled? Isn't that racy?
> +
> +	ret = ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->ani_enable,
> +					enable);
> +	if (ret) {
> +		ath10k_warn(ar, "ani_enable failed from debugfs: %d\n", ret);
> +		goto exit;
> +	}
> +	ar->ani_enabled = enable;
> +
> +	ret = count;
> +
> +	ath10k_dbg(ar, ATH10K_DBG_WMI, "ANI is %s\n",
> +		   enable ? "enabled" : "disabled");

WMI debug level should not be used here. Is this debug really needed? I
would assume there's a debug print in ath10k_wmi_pdev_set_param().

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -2903,6 +2903,7 @@ static int ath10k_start(struct ieee80211_hw *hw)
>  			    ret);
>  		goto err_core_stop;
>  	}

Empty line here.

> +	ar->ani_enabled = 1;

ar->ani_enabled = true;

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

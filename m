Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsBEh-00039z-Fr
 for ath10k@lists.infradead.org; Fri, 30 Oct 2015 15:05:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH V4] ath10k: Debugfs entry to enable/disable WLAN&Blutooth
 Coexist feature
References: <1445644464-8454-1-git-send-email-yanbol@qca.qualcomm.com>
Date: Fri, 30 Oct 2015 17:04:17 +0200
In-Reply-To: <1445644464-8454-1-git-send-email-yanbol@qca.qualcomm.com> (Yanbo
 Li's message of "Fri, 23 Oct 2015 16:54:24 -0700")
Message-ID: <87h9l8mm8e.fsf@kamboji.qca.qualcomm.com>
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
To: Yanbo Li <yanbol@qca.qualcomm.com>
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yanbo Li <yanbol@qca.qualcomm.com> writes:

> As some radio have no connection with BT modules, enable the WLAN/Bluetooth
> coexist(BTC) feature will has some side effect if the radio's GPIO connect
> with any other HW modules. Add the control switcher "btc_feature" at
> debugfs and set the feature as disable by default to avoid such case.
>
> The FW support this feature since 10.2.4.54 on 2G-only board, dual band
> or 5G boards don't support the feature
>
> To enable this feature, execute:
> echo 1 > /sys/kernel/debug/ieee80211/phyX/ath10k/btc_feature
> To disable:
> echo 0 > /sys/kernel/debug/ieee80211/phyX/ath10k/btc_feature
>
> Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

You missed some of my comments from v1, especially about the file name.
Let me send v5.

https://patchwork.kernel.org/patch/6313091/

> +static ssize_t ath10k_write_btc_feature(struct file *file,
> +					const char __user *ubuf,
> +					size_t count, loff_t *ppos)
> +{
> +	struct ath10k *ar = file->private_data;
> +	char buf[32];
> +	size_t buf_size;
> +	bool val;
> +	int ret;
> +
> +	buf_size = min(count, (sizeof(buf) - 1));
> +	if (copy_from_user(buf, ubuf, buf_size))
> +		return -EFAULT;
> +
> +	buf[buf_size] = '\0';
> +	if (strtobool(buf, &val) != 0) {
> +		ath10k_warn(ar, "Wrong BTcoex feature setting\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&ar->conf_mutex);
> +
> +	if (ar->state != ATH10K_STATE_ON) {
> +		ret = -ENETDOWN;
> +		goto err_unlock;
> +	}
> +
> +	if (val != test_bit(ATH10K_FLAG_BTCOEX_ENABLE, &ar->dev_flags)) {
> +		if (val)
> +			set_bit(ATH10K_FLAG_BTCOEX_ENABLE, &ar->dev_flags);
> +		else
> +			clear_bit(ATH10K_FLAG_BTCOEX_ENABLE, &ar->dev_flags);
> +		queue_work(ar->workqueue, &ar->restart_work);
> +	}

I don't think this is a good idea, now you cannot change the value while
interface is down. I think it would be more user friendly to allow
changing the value but obviously not reboot the firmware as it's not
running.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

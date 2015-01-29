Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGoOv-0001Fi-RJ
 for ath10k@lists.infradead.org; Thu, 29 Jan 2015 12:40:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH-RESEND] ath10k: add log level configuration for fw_dbglog
References: <1422522412-10441-1-git-send-email-sjegadee@qti.qualcomm.com>
Date: Thu, 29 Jan 2015 14:40:18 +0200
In-Reply-To: <1422522412-10441-1-git-send-email-sjegadee@qti.qualcomm.com>
 (SenthilKumar Jegadeesan's message of "Thu, 29 Jan 2015 14:36:52
 +0530")
Message-ID: <87vbjp2219.fsf@kamboji.qca.qualcomm.com>
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
To: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com> writes:

> Introduce optional log level configuration for
> existing debugfs fw_dbglog.
>
> It allow users to configure desired log level
> for firmware debugs.
>
> To configure log level as WARN
>
> echo 0xffffffff  2 > /sys/kernel/debug/ieee80211/phy0/ath10k/fw_dbglog
>
> Loglevel	Value
> VERBOSE		0
> INFO		1
> WARN		2
> ERR		3
>
> Signed-off-by: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>

I did cosmetic changes to the log in the pending branch.

> @@ -1331,19 +1331,30 @@ static ssize_t ath10k_write_fw_dbglog(struct file *file,
>  				      size_t count, loff_t *ppos)
>  {
>  	struct ath10k *ar = file->private_data;
> -	unsigned long mask;
>  	int ret;
> +	char buf[64];
> +	unsigned int log_level, mask;
>
> -	ret = kstrtoul_from_user(user_buf, count, 0, &mask);
> -	if (ret)
> -		return ret;
> +	simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
> +
> +	/* make sure that buf is null terminated */
> +	buf[sizeof(buf) - 1] = 0;
> +
> +	ret = sscanf(buf, "%x %u", &mask, &log_level);
> +
> +	if (!ret)
> +		return -EINVAL;
>
>  	mutex_lock(&ar->conf_mutex);
>
>  	ar->debug.fw_dbglog_mask = mask;
> +	ar->debug.fw_dbglog_level = (ret == 1) ? ATH10K_DBGLOG_LEVEL_WARN :
> +				     log_level;

And I simplified this a bit, please review. Full patch in pending
branch.

--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1345,12 +1345,14 @@ static ssize_t ath10k_write_fw_dbglog(struct file *file,
        if (!ret)
                return -EINVAL;
 
+       if (ret == 1)
+               /* default if user did not specify */
+               log_level = ATH10K_DBGLOG_LEVEL_WARN;
+
        mutex_lock(&ar->conf_mutex);
 
        ar->debug.fw_dbglog_mask = mask;
-       ar->debug.fw_dbglog_level = (ret == 1) ? ATH10K_DBGLOG_LEVEL_WARN :
-                                    log_level;
-
+       ar->debug.fw_dbglog_level = log_level;
 
        if (ar->state == ATH10K_STATE_ON) {
                ret = ath10k_wmi_dbglog_cfg(ar, ar->debug.fw_dbglog_mask,


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

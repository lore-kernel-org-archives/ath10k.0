Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIyHd-00087S-2f
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 10:33:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add soft/hard firmware crash option to
 simulate_fw_crash
References: <1392897330-4678-1-git-send-email-marek.puzyniak@tieto.com>
Date: Thu, 27 Feb 2014 12:33:00 +0200
In-Reply-To: <1392897330-4678-1-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Thu, 20 Feb 2014 12:55:30 +0100")
Message-ID: <874n3khmlf.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> Command WMI_FORCE_FW_HANG_CMDID is not supported in firmware 10.1.
> In order to have firmware crash simulation functionality also
> in firmware 10.1 driver can force firmware crash by performing
> not allowed operation. Driver can deliberately crash firmware
> when setting vdev param for vdev id out of range.
> This patch introduces two keywords to simulate_fw_crash:
> 'soft' which will cause firmware crash that is recoverable
>        by warm firmware reset but supported only in main firmware.
> 'hard' which will cause firmware crash recoverable by cold
>        firmware reset, this option works for both firmwares.
>
> Commands to trigger firmware soft/hard crash:
> echo 'soft' > /sys/kernel/debug/ieee80211/phyX/ath10k/simulate_fw_crash
> echo 'hard' > /sys/kernel/debug/ieee80211/phyX/ath10k/simulate_fw_crash
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>

[...]

> +/* Simulate firmware crash:
> + * 'soft': Call wmi command causing firmware hang. This firmware hang is
> + * recoverable by warm firmware reset.
> + * 'hard': Force firmware crash by setting any vdev parameter for not allowed
> + * vdev id. This is hard firmware crash because it is recoverable only by cold
> + * firmware reset.
> + */
>  static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
>  					      const char __user *user_buf,
>  					      size_t count, loff_t *ppos)
> @@ -464,14 +475,11 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
>  	struct ath10k *ar = file->private_data;
>  	char buf[32] = {};
>  	int ret;
> +	const char *mode;
>  
>  	mutex_lock(&ar->conf_mutex);
>  
>  	simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
> -	if (strcmp(buf, "crash") && strcmp(buf, "crash\n")) {
> -		ret = -EINVAL;
> -		goto exit;
> -	}

Ouch, how did I miss use of strcmp() here. Is it guaranteed that buf is
properly null terminated? I don't see that. And even if it would be,
strncmp() would be much safer anyway.

> @@ -479,15 +487,22 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
>  		goto exit;
>  	}
>  
> -	ath10k_info("simulating firmware crash\n");
> -
> -	ret = ath10k_wmi_force_fw_hang(ar, WMI_FORCE_FW_HANG_ASSERT, 0);
> -	if (ret)
> -		ath10k_warn("failed to force fw hang (%d)\n", ret);
> +	if (!strcmp(buf, "soft") || !strcmp(buf, "soft\n")) {
> +		mode = "soft";
> +		ret = ath10k_wmi_force_fw_hang(ar, WMI_FORCE_FW_HANG_ASSERT, 0);
> +	} else if (!strcmp(buf, "hard") || !strcmp(buf, "hard\n")) {

It's pretty ugly to check for both "foo" and "foo\n". This
would be cleaner:

if (buf[count - 1] == '\n') {
        buf[count - 1] = 0;
        count--;
}

That way you can also get rid of the mode variable.

> +		mode = "hard";
> +		ret = ath10k_wmi_vdev_set_param(ar, TARGET_NUM_VDEVS + 1,
> +					ar->wmi.vdev_param->rts_threshold, 0);

Add a small comment here explaining that you are using too large vdev id
or something like that.

> +	} else {
> +		ret = -EINVAL;
> +		goto exit;
> +	}
>  
> -	if (ret == 0)
> +	if (ret == 0) {
>  		ret = count;
> -
> +		ath10k_info("simulating firmware %s crash\n", mode);
> +	}

The info message is too late now, it should before the we crash the
firmware.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

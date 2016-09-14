Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkApn-0006Nj-Lu
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 14:06:45 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 03/21] ath10k: Allow changing ath10k debug mask at
 runtime.
Date: Wed, 14 Sep 2016 14:06:13 +0000
Message-ID: <871t0mfuej.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-4-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462986153-16318-4-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 11 May 2016 10:02:15	-0700")
Content-Language: en-US
Content-ID: <ADCAF8FA51BDAB4092F44DB481B540F0@qualcomm.com>
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
To: "greearb@candelatech.com" <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Using debugfs.  More convenient than module options
> in some cases.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/debug.c | 62 +++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
> index e251155..d552a4a 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -870,6 +870,65 @@ static const struct file_operations fops_reg_addr = {
>  	.llseek = default_llseek,
>  };
>  
> +static ssize_t ath10k_read_debug_level(struct file *file,
> +				       char __user *user_buf,
> +				       size_t count, loff_t *ppos)
> +{
> +	int sz;
> +	const char buf[] =
> +		"To change debug level, set value adding up desired flags:\n"
> +		"PCI:                0x1\n"
> +		"WMI:                0x2\n"
> +		"HTC:                0x4\n"
> +		"HTT:                0x8\n"
> +		"MAC:               0x10\n"
> +		"BOOT:              0x20\n"
> +		"PCI-DUMP:          0x40\n"
> +		"HTT-DUMP:          0x80\n"
> +		"MGMT:             0x100\n"
> +		"DATA:             0x200\n"
> +		"BMI:              0x400\n"
> +		"REGULATORY:       0x800\n"
> +		"TESTMODE:        0x1000\n"
> +		"INFO-AS-DBG: 0x40000000\n"
> +		"FW:          0x80000000\n"
> +		"ALL:         0xFFFFFFFF\n";
> +	char wbuf[sizeof(buf) + 60];
> +	sz = snprintf(wbuf, sizeof(wbuf), "Current debug level: 0x%x\n\n%s",
> +		      ath10k_debug_mask, buf);
> +	wbuf[sizeof(wbuf) - 1] = 0;
> +
> +	return simple_read_from_buffer(user_buf, count, ppos, wbuf, sz);
> +}
> +
> +/* Set logging level.
> + */
> +static ssize_t ath10k_write_debug_level(struct file *file,
> +					const char __user *user_buf,
> +					size_t count, loff_t *ppos)
> +{
> +	struct ath10k *ar = file->private_data;
> +	int ret;
> +	unsigned long mask;
> +
> +	ret = kstrtoul_from_user(user_buf, count, 0, &mask);
> +	if (ret)
> +		return ret;
> +
> +	ath10k_warn(ar, "Setting debug-mask to: 0x%lx  old: 0x%x\n",
> +		    mask, ath10k_debug_mask);
> +	ath10k_debug_mask = mask;
> +	return count;
> +}

There are already sysfs files for module parameters which seems to work
just fine for this case:

# echo 0xffffffff > /sys/module/ath10k_core/parameters/debug_mask

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtBfs-00014D-IR
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 08:40:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/2] ath10k: add register access debugfs interface
References: <20141124164037.29422.14033.stgit@potku.adurom.net>
 <20141124164159.29422.98462.stgit@potku.adurom.net>
Date: Tue, 25 Nov 2014 10:39:55 +0200
In-Reply-To: <20141124164159.29422.98462.stgit@potku.adurom.net> (Kalle Valo's
 message of "Mon, 24 Nov 2014 18:41:59 +0200")
Message-ID: <87vbm31xno.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> +static ssize_t ath10k_reg_value_read(struct file *file,
> +				     char __user *user_buf,
> +				     size_t count, loff_t *ppos)
> +{
> +	struct ath10k *ar = file->private_data;
> +	u8 buf[48];
> +	unsigned int len;
> +	u32 reg_addr, reg_val;
> +
> +	spin_lock_bh(&ar->data_lock);
> +	reg_addr = ar->debug.reg_addr;
> +	spin_unlock_bh(&ar->data_lock);
> +
> +	reg_val = ath10k_hif_read32(ar, reg_addr);
> +	len = scnprintf(buf, sizeof(buf), "0x%08x:0x%08x\n", reg_addr, reg_val);
> +
> +	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
> +}

I just realised that we need to check ar->state to make sure that
firmware is running. Because of that I'll need to change the data_lock
to conf_mutex as well.

> +static ssize_t ath10k_reg_value_write(struct file *file,
> +				      const char __user *user_buf,
> +				      size_t count, loff_t *ppos)
> +{
> +	struct ath10k *ar = file->private_data;
> +	u32 reg_addr, reg_val;
> +	int ret;
> +
> +	spin_lock_bh(&ar->data_lock);
> +	reg_addr = ar->debug.reg_addr;
> +	spin_unlock_bh(&ar->data_lock);
> +
> +	ret = kstrtou32_from_user(user_buf, count, 0, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	ath10k_hif_write32(ar, reg_addr, reg_val);
> +
> +	return count;
> +}

And same here as well. I'll send v3.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

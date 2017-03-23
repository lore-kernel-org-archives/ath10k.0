Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cr4aQ-00060R-9y
 for ath10k@lists.infradead.org; Thu, 23 Mar 2017 15:23:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v6 10/10] ath10k: sdio support
Date: Thu, 23 Mar 2017 15:23:11 +0000
Message-ID: <87r31oyq3l.fsf@kamboji.qca.qualcomm.com>
References: <148959263520.31432.8488419244476213373.stgit@potku.adurom.net>
 <148959281831.31432.17236410281378572164.stgit@potku.adurom.net>
In-Reply-To: <148959281831.31432.17236410281378572164.stgit@potku.adurom.net>
 (Kalle Valo's message of "Wed, 15 Mar 2017 17:46:58 +0200")
Content-Language: en-US
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Erik Stromdahl <erik.stromdahl@gmail.com>
>
> sdio/mailbox HIF implementation.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

[...]

> +static int ath10k_sdio_mbox_proc_cpu_intr(struct ath10k *ar)
> +{
> +	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct ath10k_sdio_irq_data *irq_data = &ar_sdio->irq_data;
> +	u8 cpu_int_status, *reg_buf;
> +	int ret;
> +
> +	mutex_lock(&irq_data->mtx);
> +	cpu_int_status = irq_data->irq_proc_reg->cpu_int_status &
> +			 irq_data->irq_en_reg->cpu_int_status_en;
> +	if (!cpu_int_status) {
> +		ath10k_warn(ar, "CPU interrupt status is zero\n");
> +		return -EIO;
> +	}
> +
> +	/* Clear the interrupt */
> +	irq_data->irq_proc_reg->cpu_int_status &= ~cpu_int_status;
> +
> +	/* Set up the register transfer buffer to hit the register 4 times ,
> +	 * this is done to make the access 4-byte aligned to mitigate issues
> +	 * with host bus interconnects that restrict bus transfer lengths to
> +	 * be a multiple of 4-bytes.
> +	 */
> +	reg_buf = kzalloc(4, GFP_KERNEL);
> +	if (!reg_buf)
> +		return -ENOMEM;

kbuild bot reported that I failed to release the mutex in these two
return cases above, I'll fix that in v7.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

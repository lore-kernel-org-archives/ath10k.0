Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0mpU-0004Cz-Bu
 for ath10k@lists.infradead.org; Tue, 16 Dec 2014 07:46:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/5] ath10k: add thermal cooling device support
References: <1418620274-3081-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1418620274-3081-4-git-send-email-rmanohar@qti.qualcomm.com>
Date: Tue, 16 Dec 2014 09:45:32 +0200
In-Reply-To: <1418620274-3081-4-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Mon, 15 Dec 2014 10:41:12 +0530")
Message-ID: <87bnn4t4v7.fsf@kamboji.qca.qualcomm.com>
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
To: backports@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org

A heads up for the backports project:

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Thermal cooling device support is added to control the temperature
> by throttling the data transmission for the given duration. Throttling
> is done using hw MAC quiet time setting. Period, duration and offset
> from TBTT can be set up to quiet the MAC transmits for the required duty
> cycle (% of quiet duration). The thermal device allows user to configure
> duty cycle.
>
> The quiet params are derived as follows.
> 	period = max(25TU, beacon interval / number of bss)
> 	duration = period * duty cycle / 100
>
> Quiet mode can be disabled by setting the duty cycle to 0. The cooling
> device can be found under /sys/class/thermal/cooling_deviceX/.
> Corresponding soft link to this device can be found under phy folder.
>
> /sys/class/ieee80211/phy*/device/cooling_device.
>
> To set duty cycle as 40%,
>
> echo 40 >/sys/class/ieee80211/phy*/device/cooling_device/cur_state
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

[...]

> +int ath10k_thermal_register(struct ath10k *ar)
> +{
> +	struct thermal_cooling_device *cdev;
> +	int ret;
> +
> +	cdev = thermal_cooling_device_register("ath10k_thermal", ar,
> +					       &ath10k_thermal_ops);
> +
> +	if (IS_ERR(cdev)) {
> +		ath10k_err(ar, "failed to setup thermal device result: %ld\n",
> +			   PTR_ERR(cdev));
> +		return -EINVAL;
> +	}

Will this break the backports build? We have the below in Makefile, is
it enough or what's the best way to handle this?

+ath10k_core-$(CONFIG_THERMAL) += thermal.o


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

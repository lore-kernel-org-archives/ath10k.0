Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yxbql-00030a-S1
 for ath10k@lists.infradead.org; Wed, 27 May 2015 13:58:28 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: Bypass PLL setting on target init for QCA9888
References: <1430994663-30006-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Wed, 27 May 2015 16:57:49 +0300
In-Reply-To: <1430994663-30006-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Thu, 7 May 2015 16:01:03 +0530")
Message-ID: <87mw0qyvfm.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Some of of qca988x solutions are having global reset issue
> during target initialization. Bypassing PLL setting before
> downloading firmware and letting the SoC run on REF_CLK is fixing
> the problem. Corresponding firmware change is also needed to set
> the clock source once the target is initialized. Since 10.2.4
> firmware is having this ROM patch, applying skip_clock_init only
> for 10.2.4 firmware versions.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index bcccae1..cb34619 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1084,6 +1084,16 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
>  	if (status)
>  		goto err;
>  
> +	if ((ar->hw_rev == ATH10K_HW_QCA988X) &&
> +	    (ar->wmi.op_version == ATH10K_FW_WMI_OP_VERSION_10_2_4)) {
> +		status = ath10k_bmi_write32(ar, hi_skip_clock_init, 1);
> +		if (status) {
> +			ath10k_err(ar, "could not write skip_clock_init (%d)\n",
> +				   status);
> +			goto err;
> +		}
> +	}

I think it's better to use enum ath10k_fw_features for this as that
gives more flexibility how to enable this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0mtH-0004od-Cz
 for ath10k@lists.infradead.org; Tue, 16 Dec 2014 07:49:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/5] ath10k: add 10.2.4 firmware support
References: <1418620274-3081-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1418620274-3081-2-git-send-email-rmanohar@qti.qualcomm.com>
Date: Tue, 16 Dec 2014 09:49:09 +0200
In-Reply-To: <1418620274-3081-2-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Mon, 15 Dec 2014 10:41:10 +0530")
Message-ID: <877fxst4p6.fsf@kamboji.qca.qualcomm.com>
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

> 10.2.4 firmware uses bitmask in wmi_resource_config to configure
> 10.2 firmware features like airtime fairness and rx batch mode instead
> of maintaining separete bool entry. This allows new features that can be
> configure during init time without breaking backward compatibility.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Few comments. I'll deal with these and send v2.

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -387,6 +387,11 @@ enum ath10k_fw_features {
>  	 */
>  	ATH10K_FW_FEATURE_WMI_10_2 = 4,
>  
> +	/* Firmware 10.2.4 supports bitmask in resource config to configure
> +	 * Airtime fairness and rx batch mode
> +	 */
> +	ATH10K_FW_FEATURE_WMI_10_2_4 = 5,

When we add new value to enum ath10k_fw_wmi_op_version this flag is not
needed.

>  	/* keep last */
>  	ATH10K_FW_FEATURE_COUNT,
>  };
> diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
> index 809c252..892b6f0 100644
> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -72,6 +72,7 @@ enum ath10k_fw_wmi_op_version {
>  	ATH10K_FW_WMI_OP_VERSION_10_1 = 2,
>  	ATH10K_FW_WMI_OP_VERSION_10_2 = 3,
>  	ATH10K_FW_WMI_OP_VERSION_TLV = 4,
> +	ATH10K_FW_WMI_OP_VERSION_10_2_4 = 5,
>  
>  	/* keep last */
>  	ATH10K_FW_WMI_OP_VERSION_MAX,
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index fa486f6..c42382c 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -4748,6 +4748,7 @@ static const struct wmi_ops wmi_10_2_ops = {
>  int ath10k_wmi_attach(struct ath10k *ar)
>  {
>  	switch (ar->wmi.op_version) {
> +	case ATH10K_FW_WMI_OP_VERSION_10_2_4:
>  	case ATH10K_FW_WMI_OP_VERSION_10_2:
>  		ar->wmi.cmd = &wmi_10_2_cmd_map;
>  		ar->wmi.ops = &wmi_10_2_ops;

I think it's better to not share cmd_map/ops and instead create new ones
for 10_2_4.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

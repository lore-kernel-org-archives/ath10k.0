Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLxiF-0002fQ-JH
 for ath10k@lists.infradead.org; Sat, 26 Sep 2020 00:05:17 +0000
Received: by mail-ot1-x344.google.com with SMTP id y5so3964525otg.5
 for <ath10k@lists.infradead.org>; Fri, 25 Sep 2020 17:05:15 -0700 (PDT)
Date: Fri, 25 Sep 2020 17:00:39 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ath10k: Introduce a devicetree quirk to skip host cap
 QMI requests
Message-ID: <20200926000039.GA2441@builder.lan>
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
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
To: Amit Pundir <amit.pundir@linaro.org>
Cc: devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>, ath10k@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, David S Miller <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Fri 25 Sep 11:29 PDT 2020, Amit Pundir wrote:

> There are firmware versions which do not support host capability
> QMI request. We suspect either the host cap is not implemented or
> there may be firmware specific issues, but apparently there seem
> to be a generation of firmware that has this particular behavior.
> 
> For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> 
> If we do not skip the host cap QMI request on Poco F1, then we
> get a QMI_ERR_MALFORMED_MSG_V01 error message in the
> ath10k_qmi_host_cap_send_sync(). But this error message is not
> fatal to the firmware nor to the ath10k driver and we can still
> bring up the WiFi services successfully if we just ignore it.
> 
> Hence introducing this DeviceTree quirk to skip host capability
> QMI request for the firmware versions which do not support this
> feature.
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt        |  5 +++++
>  drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
>  4 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 65ee68efd574..135c7ecd4487 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -86,6 +86,11 @@ Optional properties:
>  	Value type: <empty>
>  	Definition: Quirk specifying that the firmware expects the 8bit version
>  		    of the host capability QMI request
> +- qcom,snoc-host-cap-skip-quirk:
> +	Usage: Optional
> +	Value type: <empty>
> +	Definition: Quirk specifying that the firmware wants to skip the host
> +		    capability QMI request
>  - qcom,xo-cal-data: xo cal offset to be configured in xo trim register.
>  
>  - qcom,msa-fixed-perm: Boolean context flag to disable SCM call for statically
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 5468a41e928e..5adff7695e18 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -770,6 +770,7 @@ ath10k_qmi_ind_register_send_sync_msg(struct ath10k_qmi *qmi)
>  static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
>  {
>  	struct ath10k *ar = qmi->ar;
> +	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
>  	int ret;
>  
>  	ret = ath10k_qmi_ind_register_send_sync_msg(qmi);
> @@ -781,9 +782,15 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
>  		return;
>  	}
>  
> -	ret = ath10k_qmi_host_cap_send_sync(qmi);
> -	if (ret)
> -		return;
> +	/*
> +	 * Skip the host capability request for the firmware versions which
> +	 * do not support this feature.
> +	 */
> +	if (!test_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags)) {

Could have made this an early return inside
ath10k_qmi_host_cap_send_sync(), but this works.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +		ret = ath10k_qmi_host_cap_send_sync(qmi);
> +		if (ret)
> +			return;
> +	}
>  
>  	ret = ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
>  	if (ret)
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 354d49b1cd45..4efbf1339c80 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1281,6 +1281,9 @@ static void ath10k_snoc_quirks_init(struct ath10k *ar)
>  
>  	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-8bit-quirk"))
>  		set_bit(ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK, &ar_snoc->flags);
> +
> +	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-skip-quirk"))
> +		set_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags);
>  }
>  
>  int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type)
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
> index a3dd06f6ac62..2a0045f0af7e 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.h
> +++ b/drivers/net/wireless/ath/ath10k/snoc.h
> @@ -47,6 +47,7 @@ enum ath10k_snoc_flags {
>  	ATH10K_SNOC_FLAG_UNREGISTERING,
>  	ATH10K_SNOC_FLAG_RECOVERY,
>  	ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK,
> +	ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK,
>  };
>  
>  struct clk_bulk_data;
> -- 
> 2.7.4
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <SRS0=oQud=OO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB8AC433EF
	for <ath10k@archiver.kernel.org>; Fri, 24 Sep 2021 12:44:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A38D26124C
	for <ath10k@archiver.kernel.org>; Fri, 24 Sep 2021 12:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A38D26124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDzIoVh4+q3M9M00TYutB6HQ+BmH7Tbm6ehs4vCrJJQ=; b=O9Or1EHgEQEUNeRWAT6+xB8KuO
	vaGkYQ17Blp2oOvnVS0mBQDqwMcR302/FT+1SVW+Z8BtpBLiTy1A7fNcDEk9D0ErsDbp67iYcUYBe
	VTzBPyJ/00I8qsluh51fAnsGaKI+3DRVN+Z3MbgmpnU/o/Y6l4W3hqw/GXTQ4iH6LDBOoZhBjXePU
	9YmrsEOyE4w3rUfUn4YjUvsk1qB+75kclcoL8YCmqgOaOO0wOq4V0ppHkwtC4AGqDClN6gn7tq8nl
	wASzHLZklOONOGEKFh+rRFtahwkmtzMspIKiQAw0+gFV+EBDaxfM/8RuBc0nCG6i97TNQT6X/lVfQ
	ZJWAQaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTkYW-00EK44-4G; Fri, 24 Sep 2021 12:43:56 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTkYT-00EK3i-3D
 for ath10k@lists.infradead.org; Fri, 24 Sep 2021 12:43:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632487431; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9CbCvskKuDN3LtnFmQRSEEkhEIbmeMHlb+lt1YHeMjI=;
 b=VcPGXqBoEu3VqWvJhA+SV78CNpjVbeNTodRO3axEfDNDQzSVbvBk4ndaeE2BV5xjPGuWmrrm
 ZNT1Gnocq/ZzUAVzk9Tr/8rzRU/7PehHyg7bkhS7SFAmxEp8UQPm4HK+qBWLEk3PaMH+Z6gi
 Ks4J33xByjFFBQjtphSxkcx1PKo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 614dc806bd6681d8edd48e46 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 12:43:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B9672C4360C; Fri, 24 Sep 2021 12:43:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: youghand)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9956EC4338F;
 Fri, 24 Sep 2021 12:43:48 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 24 Sep 2021 18:13:48 +0530
From: Youghandhar Chintala <youghand@codeaurora.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, Abhishek Kumar
 <kuabhs@chromium.org>, Steev Klimaszewski <steev@kali.org>, Matthias
 Kaehlcke <mka@chromium.org>, Rakesh Pillai <pillair@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: Don't always treat modem stop events as crashes
In-Reply-To: <20210922233341.182624-1-swboyd@chromium.org>
References: <20210922233341.182624-1-swboyd@chromium.org>
Message-ID: <98706efc03c88b54bfb44161566c8e4b@codeaurora.org>
X-Sender: youghand@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_054353_266259_01BB371D 
X-CRM114-Status: GOOD (  31.31  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

I pulled the latest patch changes and tested them on SC7180. Which works 
as expected.
Do not see this error message during reboot and can be seen while doing 
SSR.

Tested-By: Youghandhar Chintala <youghand@codeaurora.org>

On 2021-09-23 05:03, Stephen Boyd wrote:
> When rebooting on sc7180 Trogdor devices I see the following crash from
> the wifi driver.
> 
>  ath10k_snoc 18800000.wifi: firmware crashed! (guid
> 83493570-29a2-4e98-a83e-70048c47669c)
> 
> This is because a modem stop event looks just like a firmware crash to
> the driver, the qmi connection is closed in both cases. Use the qcom 
> ssr
> notifier block to stop treating the qmi connection close event as a
> firmware crash signal when the modem hasn't actually crashed. See
> ath10k_qmi_event_server_exit() for more details.
> 
> This silences the crash message seen during every reboot.
> 
> Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for 
> WCN3990")
> Cc: Youghandhar Chintala <youghand@codeaurora.org>
> Cc: Abhishek Kumar <kuabhs@chromium.org>
> Cc: Steev Klimaszewski <steev@kali.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> Changes since v2
> (https://lore.kernel.org/r/20210913205313.3420049-1-swboyd@chromium.org):
>  * Use a new bit instead of overloading unregistering
> 
> Changes since v1
> (https://lore.kernel.org/r/20210905210400.1157870-1-swboyd@chromium.org):
>  * Push error message into function instead of checking at callsite
> 
>  drivers/net/wireless/ath/ath10k/qmi.c  |  3 +-
>  drivers/net/wireless/ath/ath10k/snoc.c | 77 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/snoc.h |  5 ++
>  3 files changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c
> b/drivers/net/wireless/ath/ath10k/qmi.c
> index 07e478f9a808..80fcb917fe4e 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -864,7 +864,8 @@ static void ath10k_qmi_event_server_exit(struct
> ath10k_qmi *qmi)
> 
>  	ath10k_qmi_remove_msa_permission(qmi);
>  	ath10k_core_free_board_files(ar);
> -	if (!test_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags))
> +	if (!test_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags) &&
> +	    !test_bit(ATH10K_SNOC_FLAG_MODEM_STOPPED, &ar_snoc->flags))
>  		ath10k_snoc_fw_crashed_dump(ar);
> 
>  	ath10k_snoc_fw_indication(ar, ATH10K_QMI_EVENT_FW_DOWN_IND);
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c
> b/drivers/net/wireless/ath/ath10k/snoc.c
> index ea00fbb15601..9513ab696fff 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/remoteproc/qcom_rproc.h>
>  #include <linux/of_address.h>
>  #include <linux/iommu.h>
> 
> @@ -1477,6 +1478,74 @@ void ath10k_snoc_fw_crashed_dump(struct ath10k 
> *ar)
>  	mutex_unlock(&ar->dump_mutex);
>  }
> 
> +static int ath10k_snoc_modem_notify(struct notifier_block *nb,
> unsigned long action,
> +				    void *data)
> +{
> +	struct ath10k_snoc *ar_snoc = container_of(nb, struct ath10k_snoc, 
> nb);
> +	struct ath10k *ar = ar_snoc->ar;
> +	struct qcom_ssr_notify_data *notify_data = data;
> +
> +	switch (action) {
> +	case QCOM_SSR_BEFORE_POWERUP:
> +		ath10k_dbg(ar, ATH10K_DBG_SNOC, "received modem starting event\n");
> +		clear_bit(ATH10K_SNOC_FLAG_MODEM_STOPPED, &ar_snoc->flags);
> +		break;
> +
> +	case QCOM_SSR_AFTER_POWERUP:
> +		ath10k_dbg(ar, ATH10K_DBG_SNOC, "received modem running event\n");
> +		break;
> +
> +	case QCOM_SSR_BEFORE_SHUTDOWN:
> +		ath10k_dbg(ar, ATH10K_DBG_SNOC, "received modem %s event\n",
> +			   notify_data->crashed ? "crashed" : "stopping");
> +		if (!notify_data->crashed)
> +			set_bit(ATH10K_SNOC_FLAG_MODEM_STOPPED, &ar_snoc->flags);
> +		else
> +			clear_bit(ATH10K_SNOC_FLAG_MODEM_STOPPED, &ar_snoc->flags);
> +		break;
> +
> +	case QCOM_SSR_AFTER_SHUTDOWN:
> +		ath10k_dbg(ar, ATH10K_DBG_SNOC, "received modem offline event\n");
> +		break;
> +
> +	default:
> +		ath10k_err(ar, "received unrecognized event %lu\n", action);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int ath10k_modem_init(struct ath10k *ar)
> +{
> +	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
> +	void *notifier;
> +	int ret;
> +
> +	ar_snoc->nb.notifier_call = ath10k_snoc_modem_notify;
> +
> +	notifier = qcom_register_ssr_notifier("mpss", &ar_snoc->nb);
> +	if (IS_ERR(notifier)) {
> +		ret = PTR_ERR(notifier);
> +		ath10k_err(ar, "failed to initialize modem notifier: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ar_snoc->notifier = notifier;
> +
> +	return 0;
> +}
> +
> +static void ath10k_modem_deinit(struct ath10k *ar)
> +{
> +	int ret;
> +	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
> +
> +	ret = qcom_unregister_ssr_notifier(ar_snoc->notifier, &ar_snoc->nb);
> +	if (ret)
> +		ath10k_err(ar, "error %d unregistering notifier\n", ret);
> +}
> +
>  static int ath10k_setup_msa_resources(struct ath10k *ar, u32 msa_size)
>  {
>  	struct device *dev = ar->dev;
> @@ -1740,10 +1809,17 @@ static int ath10k_snoc_probe(struct
> platform_device *pdev)
>  		goto err_fw_deinit;
>  	}
> 
> +	ret = ath10k_modem_init(ar);
> +	if (ret)
> +		goto err_qmi_deinit;
> +
>  	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc probe\n");
> 
>  	return 0;
> 
> +err_qmi_deinit:
> +	ath10k_qmi_deinit(ar);
> +
>  err_fw_deinit:
>  	ath10k_fw_deinit(ar);
> 
> @@ -1771,6 +1847,7 @@ static int ath10k_snoc_free_resources(struct 
> ath10k *ar)
>  	ath10k_fw_deinit(ar);
>  	ath10k_snoc_free_irq(ar);
>  	ath10k_snoc_release_resource(ar);
> +	ath10k_modem_deinit(ar);
>  	ath10k_qmi_deinit(ar);
>  	ath10k_core_destroy(ar);
> 
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.h
> b/drivers/net/wireless/ath/ath10k/snoc.h
> index 5095d1893681..d4bce1707696 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.h
> +++ b/drivers/net/wireless/ath/ath10k/snoc.h
> @@ -6,6 +6,8 @@
>  #ifndef _SNOC_H_
>  #define _SNOC_H_
> 
> +#include <linux/notifier.h>
> +
>  #include "hw.h"
>  #include "ce.h"
>  #include "qmi.h"
> @@ -45,6 +47,7 @@ struct ath10k_snoc_ce_irq {
>  enum ath10k_snoc_flags {
>  	ATH10K_SNOC_FLAG_REGISTERED,
>  	ATH10K_SNOC_FLAG_UNREGISTERING,
> +	ATH10K_SNOC_FLAG_MODEM_STOPPED,
>  	ATH10K_SNOC_FLAG_RECOVERY,
>  	ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK,
>  };
> @@ -75,6 +78,8 @@ struct ath10k_snoc {
>  	struct clk_bulk_data *clks;
>  	size_t num_clks;
>  	struct ath10k_qmi *qmi;
> +	struct notifier_block nb;
> +	void *notifier;
>  	unsigned long flags;
>  	bool xo_cal_supported;
>  	u32 xo_cal_data;
> 
> base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82


Regards,
Youghandhar
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <SRS0=nXyc=N5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6496FC433F5
	for <ath10k@archiver.kernel.org>; Tue,  7 Sep 2021 19:33:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1192B61078
	for <ath10k@archiver.kernel.org>; Tue,  7 Sep 2021 19:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1192B61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqz6N7SswISQllbdQ6GivkjkCbax7aKWjDi3S1PBUqk=; b=dimzr8mokvc2z3
	73IcPzjNaOSAYBjYDme9AcLvZNb9lfDeQlxci0ZfCU5nsRxFw1RdXum3H3QVsxpedCz2aAlaC0YEV
	gK2vhlBQpg2p2bVWNIleT0T4/LlPLRAKNynwk7Mfwyj65CbllN/xr860G+yFQvLq+uTxL2oVasG3M
	sh4l67UrbSbtYCzjDN7Nk8NDOjdciApwEQuY9NizNkWkXtstNquGTiaOxbVp0eKs+DIiP4T0ghekC
	Z6CP+6gRcQBQVNfBBdkiyj8+yaBgmLIBwyNY918Adj43rIXT8R3R0cbUEF+/rD10HbR5cJHwM2/AH
	J+aqIfR2BlkoY4OY32cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNgq9-004a89-1G; Tue, 07 Sep 2021 19:33:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNgq6-004a7T-S3
 for ath10k@lists.infradead.org; Tue, 07 Sep 2021 19:33:04 +0000
Received: by mail-pj1-x102d.google.com with SMTP id j1so51703pjv.3
 for <ath10k@lists.infradead.org>; Tue, 07 Sep 2021 12:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kM9tVwq7irwTqrJ/Yy0JQrecGes212Y12EN0zEFuULg=;
 b=EbnF+b103gIkqqpqa+fykmOyLRTxyAdNcKeyO2HFiDbsMFAk2ahSsl++vu7qZpG7Cp
 ZC40lS2gVLJTvxEHRkJj7LkQuF8yCLE4csed/ETMsUE3QjeZKU3jd5gtgdYiSs1g3zL5
 J3Fk3wLm5lUn3141B6KqkJu4v8T/5a7nzLHLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kM9tVwq7irwTqrJ/Yy0JQrecGes212Y12EN0zEFuULg=;
 b=Kd+VFzsGq0+4Ko2u84QjmIwEE8e8LGckE816mWrnuYDEJTyBklFz6V7DmN3njkfzS8
 FcDIzfg0iPCJG7Izja3zr9xf5/YyQgg1hHN1W1Z6EgLZzJQZwSolwgUYa/eEmLdHxWao
 FlzjxuNUcoQ8eve9EkssrC5Js8EhUhL1OUHCfw0LAMs0dNiwq+HdSbw3x7KG0lyguavg
 f3Lt/Hs9am0QqRoGLYaSEFHODTBkl3lCUj75HtxEJ1+qIfneK6LZN1HGsTZBTEUL0DUh
 64zeSPDWc2dwe/2XIcsyfD9kI4wdQPfFZ3YKP2yhOthG4fHWZBdAWjK9x6RZkMHWwqkY
 5HqA==
X-Gm-Message-State: AOAM530Gk7Dx0LUETR7ZfQy+Q0NPNiP3VAVu02Oop5hxWMwtbsATmdDL
 CodZL6sUbNcqpNnipk3LWPfq/A==
X-Google-Smtp-Source: ABdhPJynKko1EY7ycMZQk/o77iyI5DtZmQyYOJZGOcArM0hicszPb0UggJr+YQkxxzDjLvwHQvTYzg==
X-Received: by 2002:a17:90a:9b13:: with SMTP id
 f19mr31127pjp.224.1631043181149; 
 Tue, 07 Sep 2021 12:33:01 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c6b2:7ae:474d:36f6])
 by smtp.gmail.com with UTF8SMTPSA id w11sm11664097pfj.65.2021.09.07.12.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 12:33:00 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:32:59 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 Govind Singh <govinds@codeaurora.org>,
 Youghandhar Chintala <youghand@codeaurora.org>,
 Abhishek Kumar <kuabhs@chromium.org>
Subject: Re: [PATCH] ath10k: Don't always treat modem stop events as crashes
Message-ID: <YTe+a0Gu7O6MEy2d@google.com>
References: <20210905210400.1157870-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210905210400.1157870-1-swboyd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_123302_975040_466C4E55 
X-CRM114-Status: GOOD (  26.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Sun, Sep 05, 2021 at 02:04:00PM -0700, Stephen Boyd wrote:
> When rebooting on sc7180 Trogdor devices I see the following crash from
> the wifi driver.
> 
>  ath10k_snoc 18800000.wifi: firmware crashed! (guid 83493570-29a2-4e98-a83e-70048c47669c)
> 
> This is because a modem stop event looks just like a firmware crash to
> the driver, the qmi connection is closed in both cases. Use the qcom ssr
> notifier block to stop treating the qmi connection close event as a
> firmware crash signal when the modem hasn't actually crashed. See
> ath10k_qmi_event_server_exit() for more details.
> 
> This silences the crash message seen during every reboot.
> 
> Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
> Cc: Govind Singh <govinds@codeaurora.org>
> Cc: Youghandhar Chintala <youghand@codeaurora.org>
> Cc: Abhishek Kumar <kuabhs@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 75 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/snoc.h |  4 ++
>  2 files changed, 79 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index ea00fbb15601..fc4970e063f8 100644
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
> @@ -1477,6 +1478,70 @@ void ath10k_snoc_fw_crashed_dump(struct ath10k *ar)
>  	mutex_unlock(&ar->dump_mutex);
>  }
>  
> +static int ath10k_snoc_modem_notify(struct notifier_block *nb, unsigned long action,
> +				    void *data)
> +{
> +	struct ath10k_snoc *ar_snoc = container_of(nb, struct ath10k_snoc, nb);
> +	struct ath10k *ar = ar_snoc->ar;
> +	struct qcom_ssr_notify_data *notify_data = data;
> +
> +	switch (action) {
> +	case QCOM_SSR_BEFORE_POWERUP:
> +		ath10k_dbg(ar, ATH10K_DBG_SNOC, "received modem starting event\n");
> +		clear_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
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
> +			set_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
> +		else
> +			clear_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
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
> +
> +	ar_snoc->nb.notifier_call = ath10k_snoc_modem_notify;
> +
> +	notifier = qcom_register_ssr_notifier("mpss", &ar_snoc->nb);
> +	if (IS_ERR(notifier))
> +		return PTR_ERR(notifier);
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
> @@ -1740,10 +1805,19 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
>  		goto err_fw_deinit;
>  	}
>  
> +	ret = ath10k_modem_init(ar);
> +	if (ret) {
> +		ath10k_err(ar, "failed to initialize modem notifier: %d\n", ret);

nit: ath10k_modem_init() encapsulates/hides the setup of the notifier,
the error message should be inside the function, as for _deinit()

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

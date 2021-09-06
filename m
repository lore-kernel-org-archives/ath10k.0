Return-Path: <SRS0=kGfY=N4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C582C433EF
	for <ath10k@archiver.kernel.org>; Mon,  6 Sep 2021 00:44:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 151F660F92
	for <ath10k@archiver.kernel.org>; Mon,  6 Sep 2021 00:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 151F660F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kali.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jCJgqIbUbSCBRSXqa+kRqyfngzqCzICQSLqnydsdr88=; b=DrdKdWzXM61sVyhxPUxWHHxSGt
	8nEkdjG0SYlv+wWAEi+KNXo3P2A4Z29c+R0VQSmePDU1uNCVrekdlA6kJdDSYFlYCYtLOQvYdEPR4
	J/S/kaX6/xo3VlX2S+hkB3duogQdSIJQ1JZKSgJRRhSGQTHxT8/hPbDLktNYhgCSSKJOA7OfjD9B+
	KZC5W5O5ErWoSS5Mv71YmOhCA6YHoAP6mS4418IiTgHv8xJTNTPPhGK9yCtj3S0vbfM4ayKCRfdra
	qPw9izdIxR8RkmA+iBOWVLBXOiPnqza10ND4gcxuOKp/e1md5IGn68Mjp2i0OqkKKvlqqlVrUH5a1
	yhmm6nTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN2jd-00GpnJ-3k; Mon, 06 Sep 2021 00:43:41 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN2jZ-00Gpmt-H9
 for ath10k@lists.infradead.org; Mon, 06 Sep 2021 00:43:39 +0000
Received: by mail-oi1-x22e.google.com with SMTP id h133so6898751oib.7
 for <ath10k@lists.infradead.org>; Sun, 05 Sep 2021 17:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VXz3E7pt4ytJZFiidta6LWpYOPkipEqLXRupmapbEkg=;
 b=hG0uEpCkucAjn2t8kIfAgSG7UwOiEnFhcQemLyHrWcRloRDLXWznn6ZN3Z9qmKEJp/
 stQb9NvQo+/tXaM8tSPvQGrrM12aGphPU9BROyJNOaVij0ZZANc7SO6fnSoH5XjHkRYE
 T0O3janIJjd11ceL5oFXFhpFsBQxu+Vcub48fzPxz3LglWw10a1DFhS0TBvElFyTBIoU
 DPg8TWiX3NbiTnM9dQQ4cPJOuJIBDnDPMfI18A5K79JANydFKd/PVjOaL48hk2hbt/qx
 jcchydaLfw0arkQ8f3IadtWggyLwbnU68bGVYTaV8QxdiYbh0IKFmAiBWPN99aq5ugw3
 xGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VXz3E7pt4ytJZFiidta6LWpYOPkipEqLXRupmapbEkg=;
 b=hav+zq5Hp48MlDQkp66ytp6EQ30u0MVWxT8iJ1Bqv/g7WCP1FKb1dWr7fHuoZ4NKVd
 wIROjf1WusCvvOUJ2MUmR7Kt2CrWGXMNAjF40Tp44cFbG8ohonCxyRqqCZKzFBX7U5C4
 EX1ik72TAR7HNWYow4I95u/KrmNyVzG21ZFhMwedvOwD2bOi7ddOidq/xL8HD+BXeX3s
 QNrlt/H8zMM+pmQ8UZmHsT+jM8wW5WaE13hRsVuc5q9LuwCJMKE1+XsPycJyfQqNpC4e
 r8TF406KQhJYMRM7h+Z44DJaCBwjgtws6bnvcCGKxpuZjyBWTn9II40KAsOXr29slPs8
 tnKQ==
X-Gm-Message-State: AOAM531PEYfj6/XwzncTLR7hNMbHdk2uzDUfjnBtk/NGWOgn9jObz9X1
 34ebrVICI1Rw1SHT9RD8wqPX9Q==
X-Google-Smtp-Source: ABdhPJxMgzd1ppDDtypbqleJZ+qHh8aZdbGzv7WtFvDErUHqWWycI0D7asw3iyPTo4fjijSD3iB68Q==
X-Received: by 2002:a05:6808:a01:: with SMTP id
 n1mr6665277oij.52.1630889014515; 
 Sun, 05 Sep 2021 17:43:34 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net
 (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id u14sm1482783oth.73.2021.09.05.17.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 17:43:34 -0700 (PDT)
Subject: Re: [PATCH] ath10k: Don't always treat modem stop events as crashes
To: Stephen Boyd <swboyd@chromium.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, Govind Singh <govinds@codeaurora.org>,
 Youghandhar Chintala <youghand@codeaurora.org>,
 Abhishek Kumar <kuabhs@chromium.org>
References: <20210905210400.1157870-1-swboyd@chromium.org>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <2ab941df-f604-59b7-28ab-d1a9a6ced2c7@kali.org>
Date: Sun, 5 Sep 2021 19:43:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210905210400.1157870-1-swboyd@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_174337_636806_F724C82E 
X-CRM114-Status: GOOD (  26.76  )
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


On 9/5/21 4:04 PM, Stephen Boyd wrote:
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
> +		goto err_qmi_deinit;
> +	}
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
> @@ -1771,6 +1845,7 @@ static int ath10k_snoc_free_resources(struct ath10k *ar)
>  	ath10k_fw_deinit(ar);
>  	ath10k_snoc_free_irq(ar);
>  	ath10k_snoc_release_resource(ar);
> +	ath10k_modem_deinit(ar);
>  	ath10k_qmi_deinit(ar);
>  	ath10k_core_destroy(ar);
>  
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
> index 5095d1893681..d986edc772f8 100644
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
> @@ -75,6 +77,8 @@ struct ath10k_snoc {
>  	struct clk_bulk_data *clks;
>  	size_t num_clks;
>  	struct ath10k_qmi *qmi;
> +	struct notifier_block nb;
> +	void *notifier;
>  	unsigned long flags;
>  	bool xo_cal_supported;
>  	u32 xo_cal_data;
>
> base-commit: 7d2a07b769330c34b4deabeed939325c77a7ec2f


I was also seeing this on the Lenovo Yoga C630, so I pulled the patch in
to test here and after testing 20 reboots, I have not seen the message once.

Tested-By: Steev Klimaszewski <steev@kali.org>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

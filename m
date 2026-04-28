Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDCAFF8868
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 16:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsaS50fJFWEgKS/X3mmwXYg/L5d5/h6qIX6nFemmP8U=; b=NHupCtC74dgS8wUevpwPcOAU9y
	PnXWobQbYLIEaF1099NcmhOOpLIVLsJv+21vb5EwZi6SlStmEYcX7NdXGIfBcWa9MYODM3TDJ+K/U
	YllIc6+SRjYrLA22sHPStefvdGF5GyOF37ew0K6HgdRd+3chPgTtjMYch+nj/USxBDCZhuakS+jUq
	W7aHsgC7zuuzW26gfMKpe5cd+RVcIyJU9vI3SkoJzwm/DXJ+6KfKfUVlUIDHHjIpwRa9V/ogBwY+1
	txMecRVgXIvr/enzGYXXSeeKQYMyuCspXyiWygd+cX8h73abOITWUtp9KkXbg9WKQGgLHDV+oxH9F
	oLbICMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlaw-00000001yLH-3uh6;
	Tue, 28 Apr 2026 16:47:34 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlat-00000001yJv-0MSL
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 16:47:33 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-40423dbe98bso5008241fac.2
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1777394849; x=1777999649; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsaS50fJFWEgKS/X3mmwXYg/L5d5/h6qIX6nFemmP8U=;
        b=QC5Qqro4mFCY1roEi2lY2Kgaup1GRLngLXzhRrvPz7Gemf45QQiApRchtV6lmDhjJe
         B6UM+RhyIKlkH/FDZ0MlAy4YScZ/u5XJlD3sfMhk6oDMP1jhJVvcl4cTJpJrSpXOuNGy
         ICcclbL0iA4uBMBePFlSrKwI0fxCIrvj57FVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394849; x=1777999649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsaS50fJFWEgKS/X3mmwXYg/L5d5/h6qIX6nFemmP8U=;
        b=Iv2dSaRD9C06KP2svnSWLXvd0LnD5YxyBt0+H+5d1WHNPdUKut4lVGfo5jsN/OvP7s
         zsyn2ht51O1dJzX31vpiYPWCTdSsfYEp93V+iq8orARSsxbglLNjTiBsyiMgWX4ugcWR
         Vth5EJXIc0CMSz0aDYHm/ldrtR1iKDkQMjfQKA9n9wQgj8F9zql+9wUrfUWqqJtcopVc
         MKXY2NdtX/Dc437vVAVQQIT+SHD7lSWuvM6dxlBdur3qeZVndTrt5/I0qwLVh7wwJ+FV
         qQdXRgkwqf2LkgiY06UnTthJ4+9fnB1jtbnItocJD6JLC3LIFePfOTkc0b2noUyDnndA
         bI3w==
X-Forwarded-Encrypted: i=1; AFNElJ9trNCj0KzGr5ywr08u0ZJdRAGSq4jEGSRlDeNmF1e+KXpzhcEbUs2l57AlgKn57EpzhfY4HII=@lists.infradead.org
X-Gm-Message-State: AOJu0YzX0FJZHTTHxpPcZdsVlA7lqnQiVNcUly9z0O89N/GQ7HKbx3qa
	dAIfScuDvtqMyLSEhYHYRR7D0sEnufrQ6Mvp6pZ6RuSzWzgjA1Y35bMqs75FivJP7w==
X-Gm-Gg: AeBDieuyw6X6JtWtyDySJUJlBtR7VmS0/m+FgCE1zYlUpA92hS2+avu1+/HAylEy90r
	i7mfmpFCOLjyKQFJD8aTswioKzTJT4PsyxWlIUHGDqlwdNzE8y+9fSK8gNqwzb7A4rD4pONux4+
	u0Zjmo0qnn5JYmkEuUHcOLX+uPebLDf+c+Myrrhw+v2YHBW8WqctgCRAEN5rnLXeVr60j7KczH8
	QZIb57LaauT4mAQhkJpoWTzcuonbbdjHh/IMagSIFnRw+HlJQGVDEBi08SsphWdreP1fDwyMkbI
	RVK0RQk0QSwoIuPPPx+X1QHFRi3flOg75DGfMl+ORtwCNlE6Ud+cFtTAspLpoSF82cDD/LhrdLt
	o04y55z2m2XuOyuQyrzU5GVd6XJcRzvLiGnF/ThSh9F3DbWeqyKgz0/3Y368fadNi73h0/LenRY
	sqAnnjjRTx8BHTY5Nn+HzBzs9wMPeathWvx+dyIt51K/vCVUS48yR9/OE+satlHnQ3qc+H
X-Received: by 2002:a05:6871:e78f:b0:42f:ba47:36f5 with SMTP id 586e51a60fabf-433f396963emr2135147fac.17.1777394849189;
        Tue, 28 Apr 2026 09:47:29 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-433efbf1d8dsm2255892fac.6.2026.04.28.09.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:47:28 -0700 (PDT)
Message-ID: <bf380b65-1513-4792-9e3c-d03bff17c141@ieee.org>
Date: Tue, 28 Apr 2026 11:47:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] net: ipa: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
 andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kees Cook <kees@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_094731_231454_FB26DC8D 
X-CRM114-Status: GOOD (  16.42  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 3/16/26 12:14 PM, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Looks good!

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_qmi.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
> index d771f3a71f94..37936ad132a2 100644
> --- a/drivers/net/ipa/ipa_qmi.c
> +++ b/drivers/net/ipa/ipa_qmi.c
> @@ -66,11 +66,9 @@
>    *   determination of when things are "ready"
>    */
>   
> -#define IPA_HOST_SERVICE_SVC_ID		0x31
>   #define IPA_HOST_SVC_VERS		1
>   #define IPA_HOST_SERVICE_INS_ID		1
>   
> -#define IPA_MODEM_SERVICE_SVC_ID	0x31
>   #define IPA_MODEM_SERVICE_INS_ID	2
>   #define IPA_MODEM_SVC_VERS		1
>   
> @@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
>   	if (ret)
>   		return ret;
>   
> -	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
> +	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
>   			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
>   	if (ret)
>   		goto err_server_handle_release;
> @@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
>   	/* We need this ready before the service lookup is added */
>   	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
>   
> -	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
> +	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
>   			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
>   	if (ret)
>   		goto err_client_handle_release;



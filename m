Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92E4FB518B
	for <ath10k@archiver.kernel.org>; Tue,  7 Apr 2026 03:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUqWdraFh569ddUKgSTTw8gCNpVCYPxYTZ+d/rwHnwM=; b=yYEZrk7GECsPhOoxlpu49DtRUV
	QqjT3X8hICOP5FbKxnkaewbvW5gqZ/lJeiXc5VRgd4NOKJA8h7d/6C7RgtPpMZDJIrvpTyVdBYQem
	OP0uHkbIYa2NjuTE+4C0BlLeHWFs6xrbWAxYkKvq+JXTbWJSraUZQKxrCPKgixYSyZmU2k4+VS6w4
	WFg1T5v58dQlVbWIFjmw2mTNwF2wV7j2/H0zUBIuSth75G0aQzV24dhIIh5PUi3sqr3bjgRHHTY42
	1FdVRHhmuu0KnJQa5OF77d0iCSkFkKyXofC50Q9KZ/9f6OqXmalKWOJsSev+6Tic5HGuuopB0lliZ
	9NZy204g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xFD-00000005q4p-1tqz;
	Tue, 07 Apr 2026 03:36:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xFB-00000005q4K-278J
	for ath10k@lists.infradead.org;
	Tue, 07 Apr 2026 03:36:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQU4r3537479
	for <ath10k@lists.infradead.org>; Tue, 7 Apr 2026 03:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUqWdraFh569ddUKgSTTw8gCNpVCYPxYTZ+d/rwHnwM=; b=DEuD2d4MzKHmn+xD
	dG3A3/CrH2hUhrmOnJbDHoeMEsmSM02VNSOtgNA59pPT7xXC+KLkWTKZbX8gZ9kC
	amCBzA9hywFTYih1deDl3RF1jEHc5AD5kg2hblAdto9xFMdNeTia/qYJjJc0TsOv
	0PpiEUnC7chhmwrSTCkiejEpz5AL4JTyNno7K1umFMriM2LKs1P4MyinxC/FBsi1
	i1Sy8YM8ihnXU65sx3tbLlQ2VNFHXZ8MyU0KkOsy3OKjyHqNCaLL2C3AR05xHN9e
	UviZRu/HTTeEWsusWmCBEK/TETddsgK4YytsY2RQjqcne5G55T1Tw0oYatoBaMOH
	fqtH7w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra0uye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 07 Apr 2026 03:36:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82d42b6f2b0so733751b3a.1
        for <ath10k@lists.infradead.org>; Mon, 06 Apr 2026 20:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775533008; x=1776137808; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUqWdraFh569ddUKgSTTw8gCNpVCYPxYTZ+d/rwHnwM=;
        b=PTnnghFXt6MnR03HJ3SlcFjco/sk4W4YsrgAHNx47MexeU1up7wlOWR96083ybO6Yr
         ebMX42Gg5nlaW90dagghwo/KSyi4QwBKvzsLJMPW0+ToEbUSqLqzSyA42NxD/JmfyQjc
         zKlefAkIGhG6SFrhyMl2BOzbmFiOc/0sM8B9eYrKo7V8k3wFA8Ydqz5KaPPcPpbRc+uB
         ZniPzasbToQpreYJvmHCm/CYLtmiXMiSFFyNq4PDaFIGoqESRgakR3UyNEX6Y0TXpjza
         YYqh1qXYcgDAMOuVwaa8POwM8NQSq7aVyUO+wnyIC75nbhhNNDIuAC/r14PUc78bMXCo
         u6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775533008; x=1776137808;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUqWdraFh569ddUKgSTTw8gCNpVCYPxYTZ+d/rwHnwM=;
        b=hmLwImjw0IudmtHsOPROAGCs8cs9RxpQ9OCL1gqnOOJenDMKJdLvzc1jyKX5VKi1ZF
         h8rFtxXBn5atTdjwDaeupaQekhaIDWmkOL26Ogm7UJ4SUmTrtY2S1Mc0oo1vBtCLhVxI
         33ThKjWjZOe42CJCWCaTBhPPDlCFPDhMZsPSmi06H3XoBTSJ3cBMbDprgzhQkePSIiwf
         ADt4KsCOf6zVPJOtKue7npzaRuZnAoWJZUCZRptRfhPbh6I0i83LzfuKtgJ6DCp+1jVJ
         7DEZwe2IeDpMLbptDanYcsyUCc50g2K+GiuUaknFyc886dCO0/KsnJnLHLNTKp++qXtl
         butA==
X-Forwarded-Encrypted: i=1; AJvYcCVuHOelt88vMmSapVw4BBLpWyOIWadpLvF1iVklkot80NZOHFqy+MbGUsatnMkaFYUB55az5bQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwObSTdEJIPfHEgt3F+NO98byy2jxkHjXFRjmM5b5KZqdiqiYe8
	zuulmzy1Mtx2uQtVX2/I8Pf+RRs+gKSXTO1D18k5xvgPUoAz/KSmhRynjuAQTU1/ApuiMxTKKmi
	NaSuxwGsenj/dpRGmrvxNJGBbwKJf1siPu7AWL6nbus3/SXtYiRNAnkFTEDkQpQvR
X-Gm-Gg: AeBDieu+lqE1fkzMqwcCnozyeCf74yLqG+RfH2za27FGNeIgVQ/YBWjlzGBGbhQYxXE
	LhuMmNVHOqUwzbAR5RpEb3n0m34zC3OdyhyVqSqDo0pL72HedhNyjU3BU76/qakKCE/YVp41pZN
	h8gIW4DbFTeHJ5Vwj9z+DjRwJJyXALkweJFxnGjw4VI66RHFW71PI9mCa9Pwhv1YtPL8CTFHD+I
	vTI0uM+uJuqwgpISzf0Q41aM8LxbOx9nq+x2tI1pYISLhvD+QeA5aloWWI1pwbdPMSivUVsDs8S
	eH2IhXbXd4lHv9jiYYbmlKb4ZpsXDmGPUE8PR66h7jJ23LYaKclnkBk1M+stESao9BNjZ/Ces91
	pU8xaD3m5gDA6gXwjd5Zi+6QMJOMw4kMyijyh8ZgdpJKcK5vckJCEigrH0XojBHXefjM3450oQI
	BnZVzSTM6SMVEOqtwHfFw=
X-Received: by 2002:a05:6a00:1805:b0:82a:1380:417d with SMTP id d2e1a72fcca58-82d0dbcfad1mr14887000b3a.52.1775533008187;
        Mon, 06 Apr 2026 20:36:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:1805:b0:82a:1380:417d with SMTP id d2e1a72fcca58-82d0dbcfad1mr14886973b3a.52.1775533007669;
        Mon, 06 Apr 2026 20:36:47 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm14351181b3a.23.2026.04.06.20.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 20:36:47 -0700 (PDT)
Message-ID: <f970b6ab-63ed-48f9-a49d-06c172656379@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:36:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap QMI
 requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AJTipBNLzlHSnfuKdm8ycVGfsRoTMXtx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzMSBTYWx0ZWRfX9qBBnbpphh+N
 up5V0c3rUhBKX5/dTUYJIWe7C7CLoqeAXYhOWKUv6WSL+AEKIq5MG2hEY59PUASmFOGOjnEuPf3
 npdCQ8gb4l/oQE6Zbd8lrS986X7UP1hlTaF7m//jzIY3f3DDk5q7bG3u29fkUkIA7l1/ozgVM9l
 pxHFV2kjxFcGNuO2BpzE++CZo8AQ4BOAmov1yYzfZTussMaq/yr4WXzbjs6xLgOBH5192f0zd3t
 D5yGG8wfUa+CeZPcZawIwUIMx1v0IL0ejZ0TlBfdywntZVMTPdHMduj36+dj9Y4A11vnnyZ19NG
 GzXKVIbNNxxWeiB2HLKMKA+mqYSxLbOVFtd/YsF2DHjVmzyB7i3M5saXt73yzXFp57s9Mc7G96i
 eP9qGFArjNNp3ulvi9SqNIYzJ3MLnsH5IXi5c6BAykY5PqaPzB1+TKlb9DRtYAc4DI8TTpgEad8
 bsvdMLFVmuQC/IyUS+Q==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d47bd0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hFweg1R52QcHjneruXIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AJTipBNLzlHSnfuKdm8ycVGfsRoTMXtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_203649_553828_470C7EE8 
X-CRM114-Status: GOOD (  26.10  )
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



On 3/26/2026 1:57 AM, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host capability QMI request.
> Since this request occurs before firmware-N.bin and board-M.bin are
> loaded, the quirk cannot be expressed in the firmware itself.
> 
> The root cause is unclear, but there appears to be a generation of
> firmware that lacks host capability support.
> 
> Without this quirk, ath10k_qmi_host_cap_send_sync() returns
> QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is not
> fatal - Wi-Fi services still come up successfully if the request is simply
> skipped.
> 
> Add a device-tree quirk to skip the host capability QMI request on devices
> whose firmware does not support it.
> 
> For example, firmware build
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> on Xiaomi Poco F1 phone requires this quirk.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h |  1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index eebd78e7ff6bc..e7f90fd9e9b83 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -808,6 +808,7 @@ ath10k_qmi_ind_register_send_sync_msg(struct ath10k_qmi *qmi)
>  static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
>  {
>  	struct ath10k *ar = qmi->ar;
> +	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
>  	int ret;
>  
>  	ret = ath10k_qmi_ind_register_send_sync_msg(qmi);
> @@ -819,9 +820,15 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
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
> +		ret = ath10k_qmi_host_cap_send_sync(qmi);
> +		if (ret)
> +			return;
> +	}
>  
>  	ret = ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
>  	if (ret)
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index f72f236fb9eb3..3106502275781 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1362,6 +1362,9 @@ static void ath10k_snoc_quirks_init(struct ath10k *ar)
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
> index 1ecae34687c21..46574fd8f84ee 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.h
> +++ b/drivers/net/wireless/ath/ath10k/snoc.h
> @@ -51,6 +51,7 @@ enum ath10k_snoc_flags {
>  	ATH10K_SNOC_FLAG_MODEM_STOPPED,
>  	ATH10K_SNOC_FLAG_RECOVERY,
>  	ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK,
> +	ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK,
>  };
>  
>  struct clk_bulk_data;
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



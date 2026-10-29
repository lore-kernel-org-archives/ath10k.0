Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CD2606A31A
	for <ath10k@archiver.kernel.org>; Thu, 29 Oct 2026 19:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vFgOISWk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S18MoNtY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a/StEVU7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pFFb3xRbTkC9aLT6iKW9nx0TecH0j9KTJlyuglwJlq0=; b=vFgOISWkgKb4kB
	XjqDfvxlcy4V5yAYudDNeXrYYOIsdpx4fGNsDVpMy5WOk/w5uLHGQbggU1KAWgXHeOGR8igKK6uZ3
	l4Tz821qGw8X/FIfrp3Om2xzwt9dNAU9OZMWMaD9Zl1Nw3xiBb2c1Ck5K9DWMJPvzWEsm3osBKbHn
	KW6VbE6WKsHlqenpNCnyHdXr0rQ2yowrr20cvO2Vy07cM0E/ShEzXpT6tiv4DFeK0oBb3Osz0EVzs
	aW0UH250aFUo2/wmBkkmKw+wuw6PheRx3x5bxVn3hb1IOaitYXSjcOi0m40UcyqxKuGio02DkY8vO
	8H1U/tij0F20kgsJ7drA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMWCZ-0000000AIBJ-1W7W;
	Thu, 29 Oct 2026 19:54:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMWCV-0000000AIAB-3e4K
	for ath10k@lists.infradead.org;
	Thu, 29 Oct 2026 19:54:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjVJR1078317
	for <ath10k@lists.infradead.org>; Thu, 29 Oct 2026 19:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pFFb3xRbTkC9aLT6iKW9nx0TecH0j9KTJlyuglwJlq0=; b=S18MoNtYnF0DPxYH
	rt5TeDF+t4EFOtcw2oVcG692OF78JHQ31g+KQP7jsWAj/fYVZQs3TDUAgFC3HsmK
	sFrSg0U+AXPFZM0ZV2JxC4QwePMfagvvxOBsxwzmb9omBGMxNMzW+FifxMxt37RH
	HmPWCgEC4iede7vrSCOqsmObxp6zaQMZ8NkU7LqwppStpPdB3lA6dvgoVOziXtr4
	tMF6FTMsDl07BcK49MJSjQDo+2nKh+2v2ywnzYpKUCXZK+sVzkOaRwQfAL/eB02M
	l/9gbHloF/lf4y06GZ/ZLTJpAPNHWNVk39i7GeVG6YusllkWBI1wpo7ikpjwjaw/
	yb0f8Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmba4reqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 29 Oct 2026 19:54:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so7031660c88.0
        for <ath10k@lists.infradead.org>; Thu, 29 Oct 2026 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793303654; x=1793908454; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pFFb3xRbTkC9aLT6iKW9nx0TecH0j9KTJlyuglwJlq0=;
        b=a/StEVU785YvVaAWbCDmc/RJTPlCjC9Xzcg4xULHThU/ONqj77fUpBRKOCG1WU7PSi
         92UHm+6wr698yfiH/GlRXlLVfVOTDwYBhVrSkyEiojvTwnAmnipjfXUjvKnAtGxT31MV
         05ZSr77omYFTXu3z3S49GoyWggKSc/52Ei4CgeRYj/z1mnaHpNGOA7BTrF6cfxiKt4Cg
         QxYvkUu+Se75B7HMM2eKSqHbpcJLGz+pRxR2ZnbenME32W8dYrPRvMtsWQB8utSJGj85
         AH9tnVFwNNF/+kbiZQ13o0o9mRnE1EkNb2I4jdaWUsmPqPuiij4xZu9w1nYQkHIP6O9G
         jMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793303654; x=1793908454;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFFb3xRbTkC9aLT6iKW9nx0TecH0j9KTJlyuglwJlq0=;
        b=ZTcYhNFhqAzJFTBvc47cfTOmMZ5S02YkCPulcGubWoONVc7XKEmyr4WI+3o4wifuBg
         +d8Wf3lnm2podYc+vT8eL2O/dugR7nUrw5HMq0DEJGFed4lQ6G5yB9bPnRPnzQkaQtj7
         UpmNdj1iyfi3OpmKD/yJNDJY67zjuRnZCevCQlVtDXLV7Msas4QOUluW9B00rqiP4fhE
         EHzLKXxMCLU4CB1A/gGQZb499Liq+KS6QiUm9abjyWAB7zyzYOTWVjP8qID/ofxbawgS
         lGLSlGfUDUjz+8VWDGkny5hQuoK5SD9YTtXw0dZCutLVdv7atC+zAqRCjYvxrcHEqHN7
         SzYw==
X-Forwarded-Encrypted: i=1; AKwUvBzQBY5Hb5ObBU48ISx90jvjoUU+UQXrV7tS2Yzh43HS75Sp2IyV87+IcW1D4GJ49MOiaJtn0Wo=@lists.infradead.org
X-Gm-Message-State: AFq9FYIZA0W5Ks+YmFbLnrsJxFqeFJchoRfm/ufR9cw+d6fwdReYneqE
	qZ9zqlWNXJW1iPgMK+PGs83sn2dGq3/rApTshXP1pfJ2PIQhHaiQofMbA30tN1uiLh/Z9bgxuMa
	YppO7eaOe7A+8OnT2+KC7Co5FfRCIWqA9Rjx95QcfrID4QgT6JtEuG3vzWS9j5JwCOLnrwvPd
X-Gm-Gg: AYBFou2Kmps96jPwGO/6fBnJpLlJ740Hke3XA0ahhWnum8nloXOulirSj3d+jR1/p75
	+3Rud3w0fRtrLpZgEngYKUs57g5vYZFAOXNIMN1J0r7lsnQu0Z7NyjxVySMhWLrGfflqznCt4hW
	62qs/OdH8Nd+xv7LNszKrEJ37FVnrDX3dmvlcF7Ge9RCzO5Zq1h+tBj6NhjlWOX+0qsMoOvPges
	pneCT6nRbjV7dZBoGJXJIsVa6nAjs3Uhi1y4S4F6X6nMdsswQCMRk879c4qAAx67s5dnuTly0Sh
	HHzZdK/2wp7x7pWmDUCvCEdS3/OuZEuJrca9ywH9kg3N+/+bQ3/DRW2HRpuwrhdZUpjBcgC8TPZ
	jnNbh9nsvV6Sj2fxdsewPJJP5hLbfTWj0FP/5p1w9u9e+9oWRDMFeNCQwkMwU1j3UEH/qvymly5
	HNAkBxhCuydc8doTWcDnAYi42j68VRGi0=
X-Received: by 2002:a05:701b:420d:10b0:184:d593:2897 with SMTP id a92af1059eb24-1ac5d5aa2aemr43876c88.29.1793303653318;
        Thu, 29 Oct 2026 12:54:13 -0700 (PDT)
X-Received: by 2002:a05:701b:420d:10b0:184:d593:2897 with SMTP id a92af1059eb24-1ac5d5aa2aemr43822c88.29.1793303652436;
        Thu, 29 Oct 2026 12:54:12 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm762056c88.20.2026.10.29.12.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 12:54:11 -0700 (PDT)
Message-ID: <65a1e88d-6b9e-4aa8-9ee9-7b0b7892b59e@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 12:54:10 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20261029111127.85147-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261029111127.85147-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HK8YHhYE3Oa-2f2EY10R3nNPGHy_4UB6
X-Authority-Analysis: v=2.4 cv=X8PHu2Te c=1 sm=1 tr=0 ts=6ae3a466 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=_EWzUorPW55NH7C-jDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OCBTYWx0ZWRfX6sFLAcUosFK1
 zlGpE3kjebYRrkgsTVn5pn9kcSL71KDJjGavrhNR8WJrjvjfqCtig3QRDjZ9JNIA1z3yH1fCTs+
 vAooQVM78qp+Bgiwpwl3Qs8Euwllkto4BbFdrbR9jnKMllpN9l0SC1hz5DmvddeJboG/EMFzW1q
 ZkW8n76WmSoh0VMnW+SMOk6c1ePzbyRy+8DDCbUBJDJ3PtDLT/cYBwLPem2XhsVZu82Z+XS0Q0x
 ROf475/nTXMR8z30vxBUFxgy2+8y14Ir6g8Y3zvi+EzRoSZN0rIT2K5vQq2Cq4rCMSv5X5KRudz
 MfDLkSn9GknaTbAd8LPrIFV6lNDFw6Afst+BBuvKG0CvPDqPxptbsRQh3Ms5uVrivSRy4cy/SD/
 V5D8lCbPmmE0zjjAqmiln5ELSOIP7C04DpREneaErucyfFHvAK0/yq77tJ8/gLUGVETXaB6WeyI
 eVeetHY+afiJdwg3g6g==
X-Proofpoint-ORIG-GUID: HK8YHhYE3Oa-2f2EY10R3nNPGHy_4UB6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OCBTYWx0ZWRfX2Ik7Q+Sakfwd
 GDSXYpt7OQBoSAKf7FuHxPNV5bZdDlALQotDkRLSMxw+L+187N0mebBfi1ZDluXVrRPMkluGJX+
 KN1FK5nznxp3tC6/BhsW6XTC2oCQvE4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_125415_936783_3C0362AA 
X-CRM114-Status: GOOD (  15.41  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/2026 4:11 AM, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 'wlfw_pin_connect_result_ind_msg_v01_ei' and
> 'wlfw_initiate_cal_download_ind_msg_v01_ei' are not used anywhere.
> Dropping them allows to remove bunch of other code referenced purely by
> these ararys.

s/ararys/arrays/

this removes a lot of stuff, by review agent says there is more that can be
removed...

  qmi_wlfw_v01.c
  - static const … wlfw_mem_seg_s_v01_ei[] — line 188
  - static const … wlfw_mem_seg_resp_s_v01_ei[] — line 229

  qmi_wlfw_v01.h (removable once the two .c arrays above are gone)
  - struct wlfw_mem_seg_s_v01 — line 161
  - struct wlfw_mem_seg_resp_s_v01 — line 168

  qmi_wlfw_v01.h — now-orphaned size constants (0 refs)
  - #define QMI_WLFW_MAX_NUM_MEM_SEG_V01 — line 64
  - #define QMI_WLFW_FUNCTION_NAME_LEN_V01 — line 67
  - #define QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01 — line 70
  - #define QMI_WLFW_MAC_ADDR_SIZE_V01 — line 76


> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.c    | 826 ------------------
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.h    | 249 ------
>  2 files changed, 1075 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
> index 279aeb2a7dbc..dc0f7e353349 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
> @@ -569,64 +569,6 @@ const struct qmi_elem_info wlfw_msa_ready_ind_msg_v01_ei[] = {
>  	{}
>  };
>  
> -const struct qmi_elem_info wlfw_pin_connect_result_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   pwr_pin_result_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   pwr_pin_result),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   phy_io_pin_result_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   phy_io_pin_result),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   rf_pin_result_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   rf_pin_result),
> -	},
> -	{}
> -};
> -
>  const struct qmi_elem_info wlfw_wlan_mode_req_msg_v01_ei[] = {
>  	{
>  		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> @@ -1148,302 +1090,6 @@ const struct qmi_elem_info wlfw_cal_report_resp_msg_v01_ei[] = {
>  	{}
>  };
>  
> -const struct qmi_elem_info wlfw_initiate_cal_download_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_initiate_cal_download_ind_msg_v01,
> -					   cal_id),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_cal_download_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   valid),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   file_id_valid),
> -	},
> -	{
> -		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   file_id),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   total_size_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   total_size),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   seg_id_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   seg_id),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   data_valid),
> -	},
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u16),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   data_len),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = QMI_WLFW_MAX_DATA_SIZE_V01,
> -		.elem_size      = sizeof(u8),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   data),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x14,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   end_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x14,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   end),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_cal_download_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_cal_download_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_initiate_cal_update_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_initiate_cal_update_ind_msg_v01,
> -					   cal_id),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_initiate_cal_update_ind_msg_v01,
> -					   total_size),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_cal_update_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_cal_update_req_msg_v01,
> -					   cal_id),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_cal_update_req_msg_v01,
> -					   seg_id),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_cal_update_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   file_id_valid),
> -	},
> -	{
> -		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   file_id),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   total_size_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   total_size),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   seg_id_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   seg_id),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   data_valid),
> -	},
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u16),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   data_len),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = QMI_WLFW_MAX_DATA_SIZE_V01,
> -		.elem_size      = sizeof(u8),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   data),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x14,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   end_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x14,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   end),
> -	},
> -	{}
> -};
> -
>  const struct qmi_elem_info wlfw_msa_info_req_msg_v01_ei[] = {
>  	{
>  		.data_type      = QMI_UNSIGNED_8_BYTE,
> @@ -1553,195 +1199,6 @@ const struct qmi_elem_info wlfw_ini_resp_msg_v01_ei[] = {
>  	{}
>  };
>  
> -const struct qmi_elem_info wlfw_athdiag_read_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
> -					   offset),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
> -					   mem_type),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x03,
> -		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
> -					   data_len),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_athdiag_read_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
> -					   data_valid),
> -	},
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u16),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
> -					   data_len),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01,
> -		.elem_size      = sizeof(u8),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
> -					   data),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_athdiag_write_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
> -					   offset),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
> -					   mem_type),
> -	},
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u16),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x03,
> -		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
> -					   data_len),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01,
> -		.elem_size      = sizeof(u8),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x03,
> -		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
> -					   data),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_athdiag_write_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_athdiag_write_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_vbatt_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_8_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u64),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_vbatt_req_msg_v01,
> -					   voltage_uv),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_vbatt_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_vbatt_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_mac_addr_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_mac_addr_req_msg_v01,
> -					   mac_addr_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = QMI_WLFW_MAC_ADDR_SIZE_V01,
> -		.elem_size      = sizeof(u8),
> -		.array_type       = STATIC_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_mac_addr_req_msg_v01,
> -					   mac_addr),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_mac_addr_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_mac_addr_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
>  const struct qmi_elem_info wlfw_host_cap_req_msg_v01_ei[] = {
>  	{
>  		.data_type      = QMI_OPT_FLAG,
> @@ -2024,286 +1481,3 @@ const struct qmi_elem_info wlfw_host_cap_resp_msg_v01_ei[] = {
>  	},
>  	{}
>  };
> -
> -const struct qmi_elem_info wlfw_request_mem_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_request_mem_ind_msg_v01,
> -					   mem_seg_len),
> -	},
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = QMI_WLFW_MAX_NUM_MEM_SEG_V01,
> -		.elem_size      = sizeof(struct wlfw_mem_seg_s_v01),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_request_mem_ind_msg_v01,
> -					   mem_seg),
> -		.ei_array      = wlfw_mem_seg_s_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_respond_mem_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_respond_mem_req_msg_v01,
> -					   mem_seg_len),
> -	},
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = QMI_WLFW_MAX_NUM_MEM_SEG_V01,
> -		.elem_size      = sizeof(struct wlfw_mem_seg_resp_s_v01),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_respond_mem_req_msg_v01,
> -					   mem_seg),
> -		.ei_array      = wlfw_mem_seg_resp_s_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_respond_mem_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_respond_mem_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_mem_ready_ind_msg_v01_ei[] = {
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_fw_init_done_ind_msg_v01_ei[] = {
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_rejuvenate_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   cause_for_rejuvenation_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   cause_for_rejuvenation),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   requesting_sub_system_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   requesting_sub_system),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   line_number_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_2_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u16),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   line_number),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   function_name_valid),
> -	},
> -	{
> -		.data_type      = QMI_STRING,
> -		.elem_len       = QMI_WLFW_FUNCTION_NAME_LEN_V01 + 1,
> -		.elem_size      = sizeof(char),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   function_name),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_rejuvenate_ack_req_msg_v01_ei[] = {
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_rejuvenate_ack_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ack_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_dynamic_feature_mask_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_req_msg_v01,
> -					   mask_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_8_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u64),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_req_msg_v01,
> -					   mask),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_dynamic_feature_mask_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
> -					   prev_mask_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_8_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u64),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
> -					   prev_mask),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
> -					   curr_mask_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_8_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u64),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
> -					   curr_mask),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_m3_info_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_8_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u64),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_m3_info_req_msg_v01,
> -					   addr),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_m3_info_req_msg_v01,
> -					   size),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_m3_info_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_m3_info_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_xo_cal_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_xo_cal_ind_msg_v01,
> -					   xo_cal_data),
> -	},
> -	{}
> -};
> diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
> index 8d4b929e8437..c0b2eaea4dbc 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
> +++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
> @@ -240,18 +240,6 @@ struct wlfw_msa_ready_ind_msg_v01 {
>  #define WLFW_MSA_READY_IND_MSG_V01_MAX_MSG_LEN 0
>  extern const struct qmi_elem_info wlfw_msa_ready_ind_msg_v01_ei[];
>  
> -struct wlfw_pin_connect_result_ind_msg_v01 {
> -	u8 pwr_pin_result_valid;
> -	u32 pwr_pin_result;
> -	u8 phy_io_pin_result_valid;
> -	u32 phy_io_pin_result;
> -	u8 rf_pin_result_valid;
> -	u32 rf_pin_result;
> -};
> -
> -#define WLFW_PIN_CONNECT_RESULT_IND_MSG_V01_MAX_MSG_LEN 21
> -extern const struct qmi_elem_info wlfw_pin_connect_result_ind_msg_v01_ei[];
> -
>  struct wlfw_wlan_mode_req_msg_v01 {
>  	enum wlfw_driver_mode_enum_v01 mode;
>  	u8 hw_debug_valid;
> @@ -365,72 +353,6 @@ struct wlfw_cal_report_resp_msg_v01 {
>  #define WLFW_CAL_REPORT_RESP_MSG_V01_MAX_MSG_LEN 7
>  extern const struct qmi_elem_info wlfw_cal_report_resp_msg_v01_ei[];
>  
> -struct wlfw_initiate_cal_download_ind_msg_v01 {
> -	enum wlfw_cal_temp_id_enum_v01 cal_id;
> -};
> -
> -#define WLFW_INITIATE_CAL_DOWNLOAD_IND_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_initiate_cal_download_ind_msg_v01_ei[];
> -
> -struct wlfw_cal_download_req_msg_v01 {
> -	u8 valid;
> -	u8 file_id_valid;
> -	enum wlfw_cal_temp_id_enum_v01 file_id;
> -	u8 total_size_valid;
> -	u32 total_size;
> -	u8 seg_id_valid;
> -	u32 seg_id;
> -	u8 data_valid;
> -	u32 data_len;
> -	u8 data[QMI_WLFW_MAX_DATA_SIZE_V01];
> -	u8 end_valid;
> -	u8 end;
> -};
> -
> -#define WLFW_CAL_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN 6178
> -extern const struct qmi_elem_info wlfw_cal_download_req_msg_v01_ei[];
> -
> -struct wlfw_cal_download_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_CAL_DOWNLOAD_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_cal_download_resp_msg_v01_ei[];
> -
> -struct wlfw_initiate_cal_update_ind_msg_v01 {
> -	enum wlfw_cal_temp_id_enum_v01 cal_id;
> -	u32 total_size;
> -};
> -
> -#define WLFW_INITIATE_CAL_UPDATE_IND_MSG_V01_MAX_MSG_LEN 14
> -extern const struct qmi_elem_info wlfw_initiate_cal_update_ind_msg_v01_ei[];
> -
> -struct wlfw_cal_update_req_msg_v01 {
> -	enum wlfw_cal_temp_id_enum_v01 cal_id;
> -	u32 seg_id;
> -};
> -
> -#define WLFW_CAL_UPDATE_REQ_MSG_V01_MAX_MSG_LEN 14
> -extern const struct qmi_elem_info wlfw_cal_update_req_msg_v01_ei[];
> -
> -struct wlfw_cal_update_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -	u8 file_id_valid;
> -	enum wlfw_cal_temp_id_enum_v01 file_id;
> -	u8 total_size_valid;
> -	u32 total_size;
> -	u8 seg_id_valid;
> -	u32 seg_id;
> -	u8 data_valid;
> -	u32 data_len;
> -	u8 data[QMI_WLFW_MAX_DATA_SIZE_V01];
> -	u8 end_valid;
> -	u8 end;
> -};
> -
> -#define WLFW_CAL_UPDATE_RESP_MSG_V01_MAX_MSG_LEN 6181
> -extern const struct qmi_elem_info wlfw_cal_update_resp_msg_v01_ei[];
> -
>  struct wlfw_msa_info_req_msg_v01 {
>  	u64 msa_addr;
>  	u32 size;
> @@ -477,71 +399,6 @@ struct wlfw_ini_resp_msg_v01 {
>  #define WLFW_INI_RESP_MSG_V01_MAX_MSG_LEN 7
>  extern const struct qmi_elem_info wlfw_ini_resp_msg_v01_ei[];
>  
> -struct wlfw_athdiag_read_req_msg_v01 {
> -	u32 offset;
> -	u32 mem_type;
> -	u32 data_len;
> -};
> -
> -#define WLFW_ATHDIAG_READ_REQ_MSG_V01_MAX_MSG_LEN 21
> -extern const struct qmi_elem_info wlfw_athdiag_read_req_msg_v01_ei[];
> -
> -struct wlfw_athdiag_read_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -	u8 data_valid;
> -	u32 data_len;
> -	u8 data[QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01];
> -};
> -
> -#define WLFW_ATHDIAG_READ_RESP_MSG_V01_MAX_MSG_LEN 6156
> -extern const struct qmi_elem_info wlfw_athdiag_read_resp_msg_v01_ei[];
> -
> -struct wlfw_athdiag_write_req_msg_v01 {
> -	u32 offset;
> -	u32 mem_type;
> -	u32 data_len;
> -	u8 data[QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01];
> -};
> -
> -#define WLFW_ATHDIAG_WRITE_REQ_MSG_V01_MAX_MSG_LEN 6163
> -extern const struct qmi_elem_info wlfw_athdiag_write_req_msg_v01_ei[];
> -
> -struct wlfw_athdiag_write_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_ATHDIAG_WRITE_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_athdiag_write_resp_msg_v01_ei[];
> -
> -struct wlfw_vbatt_req_msg_v01 {
> -	u64 voltage_uv;
> -};
> -
> -#define WLFW_VBATT_REQ_MSG_V01_MAX_MSG_LEN 11
> -extern const struct qmi_elem_info wlfw_vbatt_req_msg_v01_ei[];
> -
> -struct wlfw_vbatt_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_VBATT_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_vbatt_resp_msg_v01_ei[];
> -
> -struct wlfw_mac_addr_req_msg_v01 {
> -	u8 mac_addr_valid;
> -	u8 mac_addr[QMI_WLFW_MAC_ADDR_SIZE_V01];
> -};
> -
> -#define WLFW_MAC_ADDR_REQ_MSG_V01_MAX_MSG_LEN 9
> -extern const struct qmi_elem_info wlfw_mac_addr_req_msg_v01_ei[];
> -
> -struct wlfw_mac_addr_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_MAC_ADDR_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_mac_addr_resp_msg_v01_ei[];
> -
>  #define QMI_WLFW_MAX_NUM_GPIO_V01 32
>  struct wlfw_host_cap_req_msg_v01 {
>  	u8 daemon_support_valid;
> @@ -584,110 +441,4 @@ struct wlfw_host_cap_resp_msg_v01 {
>  #define WLFW_HOST_CAP_RESP_MSG_V01_MAX_MSG_LEN 7
>  extern const struct qmi_elem_info wlfw_host_cap_resp_msg_v01_ei[];
>  
> -struct wlfw_request_mem_ind_msg_v01 {
> -	u32 mem_seg_len;
> -	struct wlfw_mem_seg_s_v01 mem_seg[QMI_WLFW_MAX_NUM_MEM_SEG_V01];
> -};
> -
> -#define WLFW_REQUEST_MEM_IND_MSG_V01_MAX_MSG_LEN 564
> -extern const struct qmi_elem_info wlfw_request_mem_ind_msg_v01_ei[];
> -
> -struct wlfw_respond_mem_req_msg_v01 {
> -	u32 mem_seg_len;
> -	struct wlfw_mem_seg_resp_s_v01 mem_seg[QMI_WLFW_MAX_NUM_MEM_SEG_V01];
> -};
> -
> -#define WLFW_RESPOND_MEM_REQ_MSG_V01_MAX_MSG_LEN 260
> -extern const struct qmi_elem_info wlfw_respond_mem_req_msg_v01_ei[];
> -
> -struct wlfw_respond_mem_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_RESPOND_MEM_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_respond_mem_resp_msg_v01_ei[];
> -
> -struct wlfw_mem_ready_ind_msg_v01 {
> -	char placeholder;
> -};
> -
> -#define WLFW_MEM_READY_IND_MSG_V01_MAX_MSG_LEN 0
> -extern const struct qmi_elem_info wlfw_mem_ready_ind_msg_v01_ei[];
> -
> -struct wlfw_fw_init_done_ind_msg_v01 {
> -	char placeholder;
> -};
> -
> -#define WLFW_FW_INIT_DONE_IND_MSG_V01_MAX_MSG_LEN 0
> -extern const struct qmi_elem_info wlfw_fw_init_done_ind_msg_v01_ei[];
> -
> -struct wlfw_rejuvenate_ind_msg_v01 {
> -	u8 cause_for_rejuvenation_valid;
> -	u8 cause_for_rejuvenation;
> -	u8 requesting_sub_system_valid;
> -	u8 requesting_sub_system;
> -	u8 line_number_valid;
> -	u16 line_number;
> -	u8 function_name_valid;
> -	char function_name[QMI_WLFW_FUNCTION_NAME_LEN_V01 + 1];
> -};
> -
> -#define WLFW_REJUVENATE_IND_MSG_V01_MAX_MSG_LEN 144
> -extern const struct qmi_elem_info wlfw_rejuvenate_ind_msg_v01_ei[];
> -
> -struct wlfw_rejuvenate_ack_req_msg_v01 {
> -	char placeholder;
> -};
> -
> -#define WLFW_REJUVENATE_ACK_REQ_MSG_V01_MAX_MSG_LEN 0
> -extern const struct qmi_elem_info wlfw_rejuvenate_ack_req_msg_v01_ei[];
> -
> -struct wlfw_rejuvenate_ack_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_REJUVENATE_ACK_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_rejuvenate_ack_resp_msg_v01_ei[];
> -
> -struct wlfw_dynamic_feature_mask_req_msg_v01 {
> -	u8 mask_valid;
> -	u64 mask;
> -};
> -
> -#define WLFW_DYNAMIC_FEATURE_MASK_REQ_MSG_V01_MAX_MSG_LEN 11
> -extern const struct qmi_elem_info wlfw_dynamic_feature_mask_req_msg_v01_ei[];
> -
> -struct wlfw_dynamic_feature_mask_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -	u8 prev_mask_valid;
> -	u64 prev_mask;
> -	u8 curr_mask_valid;
> -	u64 curr_mask;
> -};
> -
> -#define WLFW_DYNAMIC_FEATURE_MASK_RESP_MSG_V01_MAX_MSG_LEN 29
> -extern const struct qmi_elem_info wlfw_dynamic_feature_mask_resp_msg_v01_ei[];
> -
> -struct wlfw_m3_info_req_msg_v01 {
> -	u64 addr;
> -	u32 size;
> -};
> -
> -#define WLFW_M3_INFO_REQ_MSG_V01_MAX_MSG_LEN 18
> -extern const struct qmi_elem_info wlfw_m3_info_req_msg_v01_ei[];
> -
> -struct wlfw_m3_info_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_M3_INFO_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_m3_info_resp_msg_v01_ei[];
> -
> -struct wlfw_xo_cal_ind_msg_v01 {
> -	u8 xo_cal_data;
> -};
> -
> -#define WLFW_XO_CAL_IND_MSG_V01_MAX_MSG_LEN 4
> -extern const struct qmi_elem_info wlfw_xo_cal_ind_msg_v01_ei[];
> -
>  #endif



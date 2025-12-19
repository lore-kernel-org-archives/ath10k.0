Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7D8D767C8
	for <ath10k@archiver.kernel.org>; Fri, 19 Dec 2025 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWleTC0SGDLpFTiZtflst/tiPXLuIo+DturFwt6W6+o=; b=yIIGH7xglPoLwrFe9LAKZunQIm
	a4KlHAbMkXTfll7JkYvn+H5EtKO/e642UyiFgY65q7MS10NmdKSx3vEEVtIhANerPm9Vyz6t2N55I
	+fV06kwvAbvn83W+jzPDgVjU1URN45lSCPZ8fPy2TH02jvfZ7H0OBn967B5WP1T3BCrY3nj8sb5aT
	10ColmKNHuvhvMIU7/+N+MpmW9uVbcuXQyxbwqXvH/MPiEAYA0mkOk16JQnYBo7BUwnFnS7FggVph
	nOpvRjGiwUokH2/PCdjZSqNmWEDxMszodUSZNRehfFb8Xrh5JAkip2Vta9DMU+/68nNPVWcAcdTcJ
	0nxYrB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXmp-0000000A4tl-257V;
	Fri, 19 Dec 2025 10:32:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXml-0000000A4tP-1IkM
	for ath10k@lists.infradead.org;
	Fri, 19 Dec 2025 10:32:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cNX1091969
	for <ath10k@lists.infradead.org>; Fri, 19 Dec 2025 10:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWleTC0SGDLpFTiZtflst/tiPXLuIo+DturFwt6W6+o=; b=GzgvHOiQDgxPZ0fm
	MyZBTObyeQ3UtmtPfR3TGHN+xksPNt2qDdjIKreeQelw7Sky6VOhTNN0UIpc/PI+
	ObUMjIAYa2N4yFLf8oudbOczpYM2I27UQo/sStf7RxFgmUF9sbI4atWXs6duS0Wo
	M8BCIEnE3fQ2ZbJK9UORb+Vyx9u63gQYCfzjic3WridaA9zQpuI0uHEWKOff8wTQ
	Psh2IIdEiBzM3T7xKhTdeeVdCHYkxdOBWHaiJJMOKfPkGFEP8KEPirgu19bf1a6U
	MCHkdt4lbKRAhBai1VT6Fw4cx0xaWb5l9ZFqsnJdFcWsZbtyD9Scqzn/O7shd7uq
	Gh9+2g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eaagb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 19 Dec 2025 10:32:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b993eb2701bso1760985a12.0
        for <ath10k@lists.infradead.org>; Fri, 19 Dec 2025 02:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766140353; x=1766745153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWleTC0SGDLpFTiZtflst/tiPXLuIo+DturFwt6W6+o=;
        b=fOkXJB68gVVCqBhXAPqD9L3Ah1Hgb5OHz+bq2Afg6UQ2q3tQz2waX7QwZ2+rp7OsQ+
         HGyOLunXvrl4ntVnrFADmn6g/CY47ZV3UsUnTQ5DuTGZ8egi5iHNb2HniIWCVtps3khK
         0HC0ztkwFRXy4lOCJTXiNNx6zEGQzx48cDNSuM2/aayxWKu9XKaD5ggDXJy81OVyhQDZ
         VdFEU2Gv3Xk/hmxyfXUsBt4RSxu/IfPajGzpEydsFjJLXv/3+xN8kcQnJdx//vVtHK+v
         w2KtFeWgODJdpBP49miUaWZLU50rKqXr5f1y1wTC0x5HNRdPcIBTlXPcXrCmUnCJVRpW
         w8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766140353; x=1766745153;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWleTC0SGDLpFTiZtflst/tiPXLuIo+DturFwt6W6+o=;
        b=KcTq8Gh1M4HMAJ2XOjMNEwSQwqUJ8DtB1Q2tIauzTguEz0frNXD8hZJ8XZPV8bDttg
         LCOIj6aVbAdYzauK59z/MwPqcioMNG0I3zBI+I5UbAuT2YbnL/X9Cc025QMORGL/WHju
         fVqRl83D/juDlEzG1UkGGEr5MeBGweSc8rJ1rmETDUVqyu2zcY8SeZ5owoBqu0wJ7NKS
         sRbbPrtUP+zbSrX0xOItyFcLXPpLxEND5w7I6sdQbd2UB7S80RbeighFaRE2TxVzLLC8
         OtdfFMP5nuCYWpaNf8P8VnOB1/mn1zTLB2noakc00S1G/O9yhaEiqLMP3aQSIUiO/5Ro
         LpbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuonb9QrE5p1uJ9kwibPaFikEs6Qr8l3NzBIqgTn52vdMTeAUhvZxzHWG2shBkB6cfnvpYCnY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqrAg8h24MErGuaHgHJ0IrtjEtf3nV6Gcg3ZVVYUjhq+xni5ER
	+8A0SQfx1nwgsJ19z1t+OuBuT2NehdTn9fZshEujDf8wg3WwtmZkfeHP5u2PGEFMGRhEIaQMkWX
	Bwe0IhaoF/OTdGLkfGc7xG37CLpVLH8kPg9LW+IsMuVV7ftA5DeC+ASTiCbZewstl
X-Gm-Gg: AY/fxX5KRaEHhkPQAk1mvgx+Y91zli57GjG8fTgNc5pWhg6bQZHONIxzW7Oy4SOfeq7
	o32Z08KyW/EP4oH7uO/OYwwnKx1ElR33aAsMTcrUOWSzLz4qeVpNudCY/sTBCFILo51oJxKsbu6
	WZJyng+0dMd46yJ6vebIKdBPz+Auahb8Oy3qhNI8286jh1Q49qCdLYbxxHVWGnUqd3vSHmqnDqY
	fiDg/Xa2gvUsX9J0mg+Q1hdV90nzFyp8iFURxvVc3JOUIVYMbVZCi47zosn3irRnueonFxt9+dl
	8QDPtVDY9+O7sQXTZlo+E4oXLdSTOs0WK/L4RruYWz9386nhjzoZWiIlyEt1jN7VdOkySE8YA1g
	jj4KwDirOutbvwtuN20u1xiXPY02E9mDQG6DKs8Z1Wi/q3UiiNDqI3dhY2YIt7e7OcZjx
X-Received: by 2002:a05:693c:40cf:b0:2b0:4cdd:61e4 with SMTP id 5a478bee46e88-2b05ec6d76emr2455952eec.24.1766140352988;
        Fri, 19 Dec 2025 02:32:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEJpp6nS5U1Dmv2MmJFxSnn22dIa+I/p3lLdNUxfL0SS2K9A+EKkd4Dg1ZKQFBc1ygPpUNqQ==
X-Received: by 2002:a05:693c:40cf:b0:2b0:4cdd:61e4 with SMTP id 5a478bee46e88-2b05ec6d76emr2455917eec.24.1766140352304;
        Fri, 19 Dec 2025 02:32:32 -0800 (PST)
Received: from [10.110.90.237] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffd5f86sm3884842eec.5.2025.12.19.02.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 02:32:31 -0800 (PST)
Message-ID: <dcd0c9e1-66ae-473b-ad37-5d028dc1bc16@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 18:32:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wifi-next] wifi: ath10k: sdio: Use pm_sleep_ptr instead of
 #ifdef CONFIG_PM_SLEEP
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20251217111951.3309170-4-u.kleine-koenig@baylibre.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251217111951.3309170-4-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NiBTYWx0ZWRfX5X1LMsHf458i
 Gp+D5qbTrqNVhVxf+GdGJ4zZo+e73YnnR/G0Fs/xpY1GIX4tb/i5jQkCViXxEFCFUNTW7ZLI2wH
 0wu1sFTavvl71StmOPGUiypqy8b4LEWmdnPIqoxpfU9g04/iTNUBpG5nrTMNbCKS+jiRS+sLQw4
 +n7cEZDcMlnDKO4aRJRrB4EVSjYi+zNws+PX+Q1BMIDPZz8mEajhk7Q2qZAvAhIoKQXtlvjLKMn
 wbBIzR/u6bmOlQgy4xQeOovV0dvrLMZiwe8oNHfzON0gmLuKilZezJ4h+PjynqHaUPrQVLA7kLX
 UysvR5P3xjKNugYCN1eOQMlgNmQfv1egTQv+snQnMYr6RcilNlczrThDl39VslAbL5tIgmaZIv8
 zS5kMBiQip9BQQXGLDl+zHC8AxqdvgEASzdeLJNDXWbzT+0jzFdDfYjc/bE78MTijR0RHOORtOx
 SQGfj/EghNvBoxsC1gg==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=694529c2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=IpJZQVW2AAAA:8 a=htMSyHTI8o9V6KcsH7EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: iDJadz0bWysaLH33eKleiaEEG4TbVYig
X-Proofpoint-GUID: iDJadz0bWysaLH33eKleiaEEG4TbVYig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_023235_468023_ABBCACC1 
X-CRM114-Status: GOOD (  19.79  )
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



On 12/17/2025 7:19 PM, Uwe Kleine-König wrote:
> This increases build coverage and removes an ugly #ifdef block.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I found the patch opportunity while looking in this driver for a different
> reason.
> 
> Best regards
> Uwe
> 
>  drivers/net/wireless/ath/ath10k/sdio.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index c06d50db40b8..3efe744c0c96 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -2136,8 +2136,6 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
>  #endif
>  };
>  
> -#ifdef CONFIG_PM_SLEEP
> -
>  /* Empty handlers so that mmc subsystem doesn't remove us entirely during
>   * suspend. We instead follow cfg80211 suspend/resume handlers.
>   */
> @@ -2175,14 +2173,6 @@ static int ath10k_sdio_pm_resume(struct device *device)
>  static SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
>  			 ath10k_sdio_pm_resume);
>  
> -#define ATH10K_SDIO_PM_OPS (&ath10k_sdio_pm_ops)
> -
> -#else
> -
> -#define ATH10K_SDIO_PM_OPS NULL
> -
> -#endif /* CONFIG_PM_SLEEP */
> -
>  static int ath10k_sdio_napi_poll(struct napi_struct *ctx, int budget)
>  {
>  	struct ath10k *ar = container_of(ctx, struct ath10k, napi);
> @@ -2668,7 +2658,7 @@ static struct sdio_driver ath10k_sdio_driver = {
>  	.probe = ath10k_sdio_probe,
>  	.remove = ath10k_sdio_remove,
>  	.drv = {
> -		.pm = ATH10K_SDIO_PM_OPS,
> +		.pm = pm_sleep_ptr(&ath10k_sdio_pm_ops),
>  	},
>  };
>  module_sdio_driver(ath10k_sdio_driver);
> 

won't this cause defined-but-not-used warnings if CONFIG_PM_SLEEP not enabled?


> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8



Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC695CCA462
	for <ath10k@archiver.kernel.org>; Fri, 16 Oct 2026 01:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9t2E1tG+/yq96vLRIrCHKLd20qHLgPkf+0SwH6Uv5s=; b=D1mVhqy3WFJ/7vDBRQCsm4Q4z/
	n1qEe7t2pODEvAw+mKJKKvZJJWsfPK5N3N6Icujv7w8x88Gxqkb56g9gyibirBLjw1fu7zC3xpLVJ
	6f4WWNddY4h0yvWV0xwazCmOjaEl5I4DmnyzZi7PfxE94xeBo5vcbuCqGyy53mtQ+c0poKVtXiU0q
	rh9mLTAy9CEw8wTAylOB07cWbLQvYx7BrIPlFPKcDadSFQsEUXmzd5u1MieETJP9q1yiC0+Fds/4a
	o045fk3RW1OyLU4PL43AxBXF6jaHYhW+mE5M1Jmj3QssHFFS7CELVuVme3rVoNFUcgzQlMM1FHjLf
	QR//aQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWQ2-00000001fRP-3wmv;
	Fri, 16 Oct 2026 01:07:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWQ1-00000001fR5-0T8v
	for ath10k@lists.infradead.org;
	Fri, 16 Oct 2026 01:07:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FK42o23462832
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 01:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9t2E1tG+/yq96vLRIrCHKLd20qHLgPkf+0SwH6Uv5s=; b=dTYrczBOAQ74XM8C
	8cSZK0fVUOzmRm63L/+AdluXZf42ZyAOOmbHc6HWiTzpw+WvCveKJ1e3fWwDUQ/k
	8t4NueRakGpjunQoAEpyCS2y+/G8dmsRatJM7QwQqSRLjxjtONS5Ve1cTExm+29e
	1hYJ2N4Vx1VvVj9ZhSPGO4jKhVDcxUyhzSXyAjvzjHzHlUoZfPOfKVDIppCynokS
	2lf6k7o9ABxhHP/j9JLjlmswBrXii13QCQ+byDRx0h1WG+iADumu2gQEcgxKmhRD
	xeso0geZ+uppVtBLnDy3aq1GbLK8jog8x5i8NKTKI4fr6t77m+39Ig5JShfvWXDV
	gd37fg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6aj07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 01:07:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso8486821eec.0
        for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 18:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792112851; x=1792717651; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9t2E1tG+/yq96vLRIrCHKLd20qHLgPkf+0SwH6Uv5s=;
        b=QRp6Iuc7Zq34Oer6Rm1/gauxO2MO5e8a/iN6IoYPelRkVuMlARqxlPTMKGPOS4S2Tb
         oRYNfrZbt1tkqd59C0m6H7rmV1AzMSaFKcn+yMykMl16c5xD1r4l6L34i3E876PbPXVl
         Vs8pnzlaelE7eEbfNoSQuJ+btxIc4aQQFD3T8+UcRJlwAqKP1Oi4MnCN2JKqUPQLEBvt
         vz+z7elR6UAZ4low34mzl56EtTTVu0a3iexa4NKDA2SM4sFConjtA0G3ArPI0KmVtC8H
         irqnSo6WmX4IsyS2z8UUogZ+KI+iOoVOsgi+0R+PR3puG/ILWw11zEEmGVs6ID/0mOFU
         kyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112851; x=1792717651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9t2E1tG+/yq96vLRIrCHKLd20qHLgPkf+0SwH6Uv5s=;
        b=JNZfifDOW7tdyNiQabKZUK0JATEKF3Vej3yz6NLFl5E56ClrDLm9kNsShT6iHg+r+r
         AmUz0Q08IwxOH2QOhOByo+mPjDZUxIbo6y6f3ODfbnX9SdYZczbmWNeQ8PZaWe1yCTJO
         zYYakT4VvU2Br9KmnCvrnu1eunAHvIyH+TtN68wlogmRcOgXQdqCFSpPyYWIaV8h1Ki5
         +lYnH9Hy+NldKXddHwMounkyvpVwE0uIuzCn8pNrIkVoDRVwh3GATSPSFO0ptMJ8WWGJ
         NzKk3F+w4pNUNRL3gmLu2wFyeJ3RkuDdr+oIvdRyk6TUMkWU1F8XNnN9upz2p5TxBtcd
         LC8w==
X-Forwarded-Encrypted: i=1; AKwUvBybDDjDadCE0PCUNDP9v4DFBqjuPVOk3gQ829C3b4xl5bEdgkdtOoz4nrW5ng9YgZoqlaquPM4=@lists.infradead.org
X-Gm-Message-State: AFq9FYL/x5fiNOE6Eu1LFG3mGdr+m+LfwMIlXJ/ZCx49BlNTIIXKvGVm
	xPZgPwAPaDZfZSIlZ9WVbbRzozckclEG+r64bZAcRq/0v25OxmufYsSyyVCTrCYVHGVRCFYBcu1
	pFaHcuQULhG2+XuqOJL/wtEyXeCfqld2gen57cC949gj0u8o8LiAAStwM3+n1tSUlqmYiG6Iz
X-Gm-Gg: AYBFou0OUHvT9IOBe3me6RIsLkLYdE0wDRHp6WUdzDDXStBQonUFTzSJ2GyR2zuc9NU
	K2HTHUcGaDf8zNZeVDSqHJw7ue7i2CCR/GBnTy6xsyL7dp3taNdTvnBJvDSYRchG71s5OgiAE/f
	3Xe5o30zi+Jnqf1EKNQjcefMX5oychrVcG58ffUFu/lnHt+owQ3ChqlmQAKumqfnMJuaipjeWrh
	Hv/GgPxzxtEBuEKyEncsVYTzaacrB9m93yHqlpgrA/NTaT55140YZTpL+8/kiMXaUwyOdg56QPa
	9+1XNbw/a575oU7uahfX/7O3EYRAn2ziyGIbl+1M0Zls2x/+rKk58JC5XpW0+7MWoJiHxLnByBJ
	iEp3ip4liUBtixzWsXKfoq0nuZPn/gHDWCGTYTrUsjAQdI9ZXJy8Uy7+nMg==
X-Received: by 2002:a05:693c:88c7:10b0:359:2729:1797 with SMTP id 5a478bee46e88-35927292f58mr21499972eec.30.1792112850732;
        Thu, 15 Oct 2026 18:07:30 -0700 (PDT)
X-Received: by 2002:a05:693c:88c7:10b0:359:2729:1797 with SMTP id 5a478bee46e88-35927292f58mr21499932eec.30.1792112850011;
        Thu, 15 Oct 2026 18:07:30 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0e5e6sm1618856eec.1.2026.10.15.18.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 18:07:28 -0700 (PDT)
Message-ID: <ceaf2db8-3796-40c2-830e-998af8c88b0f@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:07:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 5/8] wifi: ath10k: check the recovery deadline on
 its own timeline
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
 <20260925-10k-sdio-crash-v1-5-14baf913df94@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-5-14baf913df94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: azRx1BgyLrzLNMi82vVqDZY8v0Km4V-9
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad178d4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=5Td3zqSP5pV7lwFrebEA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: azRx1BgyLrzLNMi82vVqDZY8v0Km4V-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAwNCBTYWx0ZWRfXymG8bmhYS2DV
 5yQHV09niTCGTV/wIGvgr2BBQe+XrC2/GkH0cOjR23+Ir8S0ZlYyR0G/f9DB2qECydhd+gFlyxp
 RYgY+FSJLZ2OgPTxpEf1jX5BvE/aZ4uOXTT7v4DKWEQoY21WI6Dra9st8IsOv49D5Rpdgxnaz7D
 tkRzZEKJ/iAcfqPOmbf8eQ05X8R9vDbKwy/MbZLcM7729iGU3oxfPBzpEFA+lVVETeocqrbvNtR
 bwtQ4/YBjyYcKzXgHza25vAjSgrS2bFwqFnfvw1QnXEpp79hdxIZA8KS7t3yz/Mu3aJexq9jMlC
 IpzzZiNpWEotPtdj0WiNU3oMMeAyLHVN1x1M14YkFfJ31C+NIj0Uvm65z5PdI/bI2/xvDDN/N/f
 BmPJLJZ01H6s9nlEPEf3OMnS8u9LgODoXzHDsBqXeIOo8ht4s1CCC8i38cMh8fwBLUSqU4Ga6o6
 PzxL/nvJSPwfL6+dSiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAwNCBTYWx0ZWRfX3eClDD3V3ZRO
 sSJkfEQJQ5jc2YLN4/rliBnF31Mh9l9EUkcx0grQ16CgphfBYUhfg4+S3Uyg9KcclBakU2ZOKfR
 yEvfyaVdzJ1vvaOU6x2XEbqryTWu9oQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_180733_294181_152234F7 
X-CRM114-Status: GOOD (  10.17  )
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

On 9/25/2026 5:26 AM, Kang Yang wrote:
> @@ -8175,6 +8175,9 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>  		atomic_set(&ar->fail_cont_count, 0);
>  		atomic_set(&ar->pending_recovery, 0);
>  
> +		/* Stop the self-rearming monitor after recovery succeeds. */
> +		cancel_delayed_work(&ar->recovery_check_work);

My review agent thinks this should be cancel_delayed_work_sync():
Confirmed safe: ath10k_core_recovery_check_work() never acquires conf_mutex
(neither does ath10k_core_enter_wedged()), so calling
cancel_delayed_work_sync() from inside ath10k_reconfig_complete() which holds
conf_mutex cannot deadlock.

The real problem with the non-_sync variant: if the work is currently running
when cancel_delayed_work() is called (which returns 0 and does nothing), the
work may call queue_delayed_work() to re-arm itself before checking
pending_recovery == 0. That re-arm succeeds and the work fires again
unnecessarily. cancel_delayed_work_sync() waits for the running instance to
finish and prevents the spurious re-arm.

> +
>  		if (ar->hw_params.hw_restart_disconnect) {
>  			list_for_each_entry(arvif, &ar->arvifs, list) {
>  				if (arvif->is_up && arvif->vdev_type == WMI_VDEV_TYPE_STA)
> 



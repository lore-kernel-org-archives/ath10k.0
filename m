Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0DACC6B38
	for <ath10k@archiver.kernel.org>; Fri, 16 Oct 2026 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfBEOOFg191OMsndyNa58lw23vjInq1gbAbNsF9qyQc=; b=LbBtfAKfa7CpsBlH62fQMOqRPH
	UIvvqaoLp3n3zbFK/C36MYPW4+jkzhBHTpUd/jMlv3vCCC26uhI7Is0t8WkT8hbY8HIJVjQyjUGmr
	JaV2JXXwpX1u01ubcxK59z+zVcDYdEVkNxMzGlMoJQeoUXnsb29oV5IYBSIdkVKra2WXRABVLNEJr
	ge4XYEELmlcTT/6YZcKJGC4g06ulE7I/om5k2eIf/P5N5QjjzKJEkEGwkabCq9PHXHguCmknkDgYB
	ocVOGYPtcJPZGNYvzfZitQfRjiI1WSpgKVZfn/V8Si/TWROIRVrOpuaqzSuIP7oyuwBiQyOXym0qV
	17yLnDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd6X-00000002JE8-2L2t;
	Fri, 16 Oct 2026 08:15:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd6V-00000002JDg-0dSi
	for ath10k@lists.infradead.org;
	Fri, 16 Oct 2026 08:15:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G65DfR2678136
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 08:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfBEOOFg191OMsndyNa58lw23vjInq1gbAbNsF9qyQc=; b=hov+2geuWD+xPnYo
	aLzRLMRYZ/QAVymtFl5SIZG3Nl0WnjrGQ41yI+HrdNdg0qRC/swa1Bs48VRKbeI0
	rclDPZg04BQKtUjxenMV8OdCBqlKEUZflj8NaAJNlwUX8rcUx5z6x/KKSVT3HCTh
	njOqtQHPVljI/NFYdRNpfINTqO4wi6cc6DSznvIa25corCC9Nhb86Bs6M4p1g6Jq
	Ip4WhfG3gpgeXVClJIRIp1mmeHdYaXTwEZPhEkqrruuFW6APeAABd5RQj7xSAjT+
	5g2e3v/Hair1NMpkuzeItyGedBiFrZqmmFBh5GJtpb2jqm/ZmGBt30o1RNqcSA66
	ccBlxQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tbgre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 08:15:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7036470eec.1
        for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792138548; x=1792743348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfBEOOFg191OMsndyNa58lw23vjInq1gbAbNsF9qyQc=;
        b=OoKgYbia/OnyU8KsTCL4+W4Fa4GVmNg2vT37wYtQtX/v2ArycEFFSLjajoYPeQ3lmD
         SUGIHup2e+2x4dgdZyzdhXXv+6q9dsKXUiNip9cLsKVZa2YhgoLrkMcW9/+GCy9WwnFK
         vtKP/Lre4fxMmYG+FgXXBz6UvRXFqjtbh6VoPhk5E5BhKvQnp+Ykwt66YLml0Lu6O4Sh
         oOkYOxkMqhBuA3gX5UtVOUum0K1Di+x31Gei7J7ZpO+nBQ0M7F+yYqmrkMEttFFF0FQB
         92v2RS2uszB0nxY5C1WnHAlRoxi64xIQyZK/yA0QPqhJmsJ45Zwkeq2jUzxTp9xxT4Ni
         6QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138548; x=1792743348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfBEOOFg191OMsndyNa58lw23vjInq1gbAbNsF9qyQc=;
        b=PgFVc9xrrITuG+niXajvcOG1qIH/5EnxshRRxksp+nLt2C9Ozn/HMRqCOzykAGHRiX
         +Jgga//fe6wmMQ/f6cHNmiRUzgPCe5SPOlTtENQ1uSmXbqef1ucTcxN9f9YUr/T1lHjJ
         Y0V4m3krR2yxFaC50wPjjOS4AjQIQf84Xe1OdqQtAeZpUVH1x9VnsGRM4OK6PRAOkwyq
         naPGjpdhH5sCqnYLaAp80KY6wEJTWVS7muD/yKNTvjSdPYi/S1A16pGz1rcvb0htu2li
         epVz8ZbXamQjn/Qc3E/HB8/lJeDXlcTJ9qNWHzLUPOwc8cgtgAphorroJIFhhSp4Bgsr
         PSAw==
X-Forwarded-Encrypted: i=1; AKwUvBwAxDjcW0g0W8OvwD69W67s28Lsi84e68eA1N8xR9gCtISwN+BpW+xi+Dh9kmGtXJTFBrsgE7s=@lists.infradead.org
X-Gm-Message-State: AFq9FYI4WS0fQ8uwJ+PqmbK/NRdf6OyCYblBnCRkiwGtL6SuZm842C0Y
	Y4POpDjUYiwk3Y8Ev2aH8YGp1/oee802ooRDTaWE2tv13tpMCO1zL470so74sYNe9Mhq5GlnZLF
	w2r6S9Y1lM/zbmxhBoZEbzFOwZezmyeAmxcEvxlXvfyRBv/cnVwNs/x+Ms21cUp2I
X-Gm-Gg: AYBFou2QkDufiZYd5xuuQzogpCtTdOhGYtG4jHoFlbzqq8AnLXeAzZ/1ZZef3kM6Elb
	KLmDiOQfb8nVBfnYRuX7qYb1fLzxAe1c12GFj7fomp9XFuTo9p9afGdNssmKbvwAdr9uB9Miew7
	MOhqU54eK+lDKuabbOpzJcPnJAFac1nVLwy8slo/1wtR73NdKFZqzIbUx5mkuOuHfad1kbUsAY2
	DTZy/EwV+AdDMIMXyqULCooRvwfFVrmU9xMLaXqqXRh0V7NZGog6TMc7ZjNZQSx9UcagC00OubQ
	Zbkl3riyJVF7TZXHTgl84ZfvQ3NHtX6qi5HAza4DlUh8jbzEZGLN37KQwmSumcEaguet4j3a3XI
	+piA+Kk/evSS2fOLBVvd+KmwuanRn2A1z8INhDm52J3DssylcXQ==
X-Received: by 2002:a05:693c:88c8:20b0:359:9302:a526 with SMTP id 5a478bee46e88-3599302a70cmr23138216eec.7.1792138548126;
        Fri, 16 Oct 2026 01:15:48 -0700 (PDT)
X-Received: by 2002:a05:693c:88c8:20b0:359:9302:a526 with SMTP id 5a478bee46e88-3599302a70cmr23138171eec.7.1792138547309;
        Fri, 16 Oct 2026 01:15:47 -0700 (PDT)
Received: from [10.235.81.133] ([223.181.200.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm5780124eec.3.2026.10.16.01.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:15:46 -0700 (PDT)
Message-ID: <cd1e5824-18da-42f3-acc1-512372237abf@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 13:45:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/8] wifi: ath10k: also wake peer_delete_done and
 target_suspend waiters
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
 <20260925-10k-sdio-crash-v1-3-14baf913df94@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-3-14baf913df94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pGPGFnJ8ug5JnG5jItUpSIAh_hCxEjKH
X-Proofpoint-ORIG-GUID: pGPGFnJ8ug5JnG5jItUpSIAh_hCxEjKH
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1dd35 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=mU9158tKupmGQ1871ypv3Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6JssVo0HlxIPen7dyesA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfXyRdj4vmu+DPy
 fqWsI99ug8d6PR5+atfgzWpExI9ZcWMx//x/d4hvD1ZD/85umxQHywIX645YMHi54u+Ppo+Zsdq
 m09dLLL9acleueCzogA2Y2aZOwWMDru+mSMVo9vCwb5OKIkpNW+TrDqUzNtxoyt+pMMqvS4EcRS
 3Lb2h6dAV5NKL468xs9o8k8w14a2vUM4ml+LPEzuMPrUGWMxP7FxQDBoVthw4/XaGnQETH50GSi
 XmQmaZmUHDJ1WCUQI2b8YN39hnMWHLI1PffgD4hbLI1tm5C7rpQiSN8s63pyMfHDUCfgIbNGTxl
 b4Om6ob8yH/p1yYo1T2YR1q+NdpO3H0saRiv+jCuhcFnLcKJ1Ac5xnTdyAbnAF53hefK59VALfN
 YQ6da7eIeXRNsGgyO28terrpqluY3efR7K1LA7m1q/ZvkWoEkITUAPWHqnZCl9OBt473P4qRnMm
 7L5qrVIRodS33rGBQdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfX8blIyvX0kjOT
 a313DuPJxjdWDzB+MYeYtbX+pV3Fs95kH0L2ALm1u8biHbnmpO8ZaRutR7t98a8C+/L4ydpM4LO
 QWoVbISqfOg+MhlYbzditNw83I1fUKM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_011551_307036_C8D12576 
X-CRM114-Status: GOOD (  15.17  )
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


On 25-09-2026 17:56, Kang Yang wrote:
> ath10k_core_wake_all_waiters() releases callers that would
> otherwise remain blocked after the driver has given up on the
> device.
>
> However, peer_delete_done and target_suspend are not included
> in that list. Callers waiting on either completion therefore
> continue sleeping until their individual timeouts expire,
> even though no further progress can be made.
>
> Add both completions to ath10k_core_wake_all_waiters() so
> blocked callers are released immediately instead of waiting
> for unnecessary timeout delays.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath10k/core.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index be516dc32c1d..f2e457a0fcbe 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2500,6 +2500,8 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
>   	complete(&ar->install_key_done);
>   	complete(&ar->vdev_setup_done);
>   	complete(&ar->vdev_delete_done);
> +	complete(&ar->peer_delete_done);
> +	complete(&ar->target_suspend);
>   	complete(&ar->thermal.wmi_sync);
>   	complete(&ar->bss_survey_done);
>   	wake_up(&ar->htt.empty_tx_wq);

How about other waiters such as radar confirmation (radar_confirm) and  
peer_stats (peer_stats_info_complete)?


Vasanth



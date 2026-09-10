Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A1EC79FB9
	for <ath10k@archiver.kernel.org>; Thu, 10 Sep 2026 15:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opUYukIe/FPNtsIS7kDh9vfDAQXoVQv5BN4rJ4BTz6s=; b=U64Elun72P35qU48pbeIIJDTlB
	ZImfywubINLSedDJA7PwwTdFAcILQi/q0hglAm7w+Jo/3W0B12EW3Y/Eh+cdv6AaFmZsMRWSZC3R5
	IF8xmotoElmyWPYk+4T+MIEApE7k9VvZO8xYyuEptS+6n/dpU96ljav/n5xPiYQ5WHDwlWb8MB+1r
	W856ebXhijEgpun/LrbZWPbqnlfW9u+s5KrBjOof+/FPZyb/WrHIoPR0Sb+xoIgkUw7l9Xlszhgob
	KmOAZ+MJLBIBJbloi1ZfRlsau7nlukl2w7cGyZBJQDmKpbYE97+OL+OOUo/0cAg8MKA7npccTJNrw
	l2+Yhhbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gN2-0000000Eipo-1VmK;
	Thu, 10 Sep 2026 15:07:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gMz-0000000EipP-0jBj
	for ath10k@lists.infradead.org;
	Thu, 10 Sep 2026 15:07:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF55ef650816
	for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 15:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	opUYukIe/FPNtsIS7kDh9vfDAQXoVQv5BN4rJ4BTz6s=; b=eDiQ3rGNS4YBBL+L
	O0FT8h0/0VKHl3cwb6mEW5AZZLOiTV0k/iy36CkbPyuhVDvlwmszbyxyKWoyHl9x
	7YMqUu5acqbPPG4T/QS9ei1cdPeOsPUWABIghiSzlmfjmntIFXSB4dZqwzAuEx6R
	HZe414Lge4JmOhYwSstGvBcii2jl6UF1iycphMr7I95dYDSvJ1zrJCycpvFF1KEj
	ZZS8lPvar09XW7Nlit7KuYWy/21B+YyN/u7QLYYF/rD78i0Gx+cuHMAR/A89P84q
	YlrSSVzflNrXyMXHkh3X7pSTBk0eDYj51X1jHVLhCNBFpUTbCD6Pg5m6HDj0HM+6
	I0r8dA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxv7817a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 15:07:19 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-881a45f96bbso28444017b3.2
        for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052839; x=1789657639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opUYukIe/FPNtsIS7kDh9vfDAQXoVQv5BN4rJ4BTz6s=;
        b=BJip27NPaFc01Gz5jv59vWJ+UhyIUcIthBn+Re/1AQ9OGpxKAZBElnsZraoYsiucRO
         5oi+htfcHewHX2jAOev1rFM/7m3i5FUoSl6V+JeIYJLQHLXUlN2yCK2OpBBxX3MISAxO
         ae6duoao3QTaZJ6QF6TzxIai0wG8suHhe8jVsnirg4TeD61Rb2cQDrxN2JDEqSs8ERRC
         DWguCmOSLWQHbdJzMI6fAPwsqmFyBxRwfZAwDXEVNVEK8GapzbQ+E16UtHgquNiMOTC0
         ke3rpsT3GW+plGDK4o7pJeIZlJEuRvhUtuz4IlqInmxJKezkegwf2IOOqncTsLdZM4z2
         TDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052839; x=1789657639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opUYukIe/FPNtsIS7kDh9vfDAQXoVQv5BN4rJ4BTz6s=;
        b=IVbHHc8v57ApJzxHrfN3UaF1Wvy3nYM9WYpF5TrUu5I4fi03FuNctOUxhRupqQyeao
         09entLVQYQLK9Mlk0+VHhNK1Zsb0r3IL6S8sNqZ5YdDaY6tnZZdA41G/MtHfplRKOQVZ
         San/VMULSqUjWVXwokGHLrIvz3u3cVbN9ENRQQdC8kStYc1J+N48vSJkHNjXnmklNJ1j
         0gOZY5Neppbmh++HPn2AReU/RBdkV3TnCUg0gP2Veh9Oo+h5/t9GT0tTjNefmb+uOSBR
         U3g1u62Aodg5b7TM9cDQ/e48Ukgs8kE7OkadYee1DGcxqM/Y8qvwyTmmjVohirbVJR1G
         4plw==
X-Forwarded-Encrypted: i=1; AKwUvBx1gdry12CZuZvkjpldke2aw/wwtyTl/RQf+hx+gRcrgtbvn53fauxAOloiM83MTSVXAAdxMXA=@lists.infradead.org
X-Gm-Message-State: AFuF++nZwjNcQ3cPBgSTpenxcBA64kNoKL7OunZHlMXdMUs/YCI5eQPL
	zn3Uutymar91JNIXbnt6mxZK+oOeMLI1erq3CcMBsnMWzA17uMonVlzSV0BFP8Gu1b896OXuIcV
	wQ36isMCOzW/lHHQWIEkPNTAAkDZST06o8vTmmL02g6Bm+1k8ZJoqACeJuH2jMWQm
X-Gm-Gg: AYBFou3czE7gGDpfvfgT2BhLlJlTd9h72O3HxurC0d986SxhYBiUaek8Z89JZb1HGkG
	VlcriTB/V0lg76nwpNsrQYpSHxaqEfQJXU0ywYvjgonIDENVWLnCkF3koHGm41D3EtTAMMbrZ1E
	L0x9y1pgn9uGAzNtMTvY3kaAGrmFVpIU3ArWmqnjbkmOdNaQJnU3+cNHZODJE0SVrubhO7/MU9x
	B3omN9nDoA8JwBcwpJl+r4i16TWatRCmkE4fr23yJMilCTGHqmcLEKF6J51rcn+NoGhn7V35El5
	JVRHOziCuc1DlQCG0SHAokHLI8pJhtkAWjGSqRjjDrqaCMYcDVWDXWGl0mwVQu3PIG7Par2sInx
	XgT7qXbQiJXESb4cHuCh4qP+jwT4i5R8ArRCMaXc0NDpqlm1KlGG/+iE=
X-Received: by 2002:a05:690c:7:b0:85e:688f:3c52 with SMTP id 00721157ae682-871290a4c74mr157112717b3.33.1789052839144;
        Thu, 10 Sep 2026 08:07:19 -0700 (PDT)
X-Received: by 2002:a05:690c:7:b0:85e:688f:3c52 with SMTP id 00721157ae682-871290a4c74mr157112047b3.33.1789052838568;
        Thu, 10 Sep 2026 08:07:18 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88486e2da28sm173237b3.20.2026.09.10.08.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 08:07:18 -0700 (PDT)
Message-ID: <2fbf61e9-d6f1-4033-b42f-c10811b85880@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 08:07:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath10k: Add missing validation in debugfs
 mem_value and reg_value
To: Rivaldi Hormat <rivaldihormat@gmail.com>, linux-wireless@vger.kernel.org
Cc: kvalo@kernel.org, ath10k@lists.infradead.org
References: <20260910080659.20831-1-rivaldihormat@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260910080659.20831-1-rivaldihormat@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfXx2kwePR1ZXBW
 p1yXQfXjr2QK35PCXlDPUJe8zNcOxDSxSNq8TWlL5ubmtJdjwjy682hZ9kO+b+6pVcRiwcmbLlX
 A5D46z4KgIT5RUTzQIw20c3/+SriYYU=
X-Proofpoint-GUID: FWoqZseq3fsf19syI3LV_Z9fCYyK3QXE
X-Authority-Analysis: v=2.4 cv=FPSOVOos c=1 sm=1 tr=0 ts=6aa2c7a7 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=J-SKrIC2Fr2eh99-tBcA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfXzlOwJYaaV5CB
 eSYEva7gHbmE4NViM3vIcxK3CEdW2V2gtSuMxoJNCITVC7jTPeEgEMTnVBEeiJjVzv/raQoH+/o
 bd0TZOiq4XOrm73yfbHqyApksPps7zW/iPuSPDeUQSVWWRIec9/fb+CmOyQSM6DY4+qfAENhgId
 9VAhySYp3tQpd50GQDAZlXjirn/9reoi/6HfvMdqFNwgnwH+rE8G4bmbfVppnaI383RBjVdnPPa
 rXMZ8VPaLX3ZGqNxPvNG7Oq5X4S8GmjIeNiG2jOlLATpVEsZz8/Jjsx9yHy6MO5KY4EZfEpQlFD
 nvaBtz2bGnV8e5xe7laVsrRXxwKSlN1hNUG1CCYT2LSckMsjTV3FkB8nrSPzumbdt3GXn19DhBO
 eUJS6cQs4Q+PbEswEXZb8/TPslhD2fvjySHF9G2Iz8zYrz1DUAPVDgIzPmZRkhqUyyxB77QR23i
 n/zWifqZgWeK6TlThrA==
X-Proofpoint-ORIG-GUID: FWoqZseq3fsf19syI3LV_Z9fCYyK3QXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_080721_334842_00DD0804 
X-CRM114-Status: GOOD (  15.97  )
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

On 9/10/2026 1:06 AM, Rivaldi Hormat wrote:

where is your commit text?

please review all of:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/submittingpatches.html

> Signed-off-by: Rivaldi Hormat <rivaldihormat@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/debug.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
> index fb61e53ff..50e017021 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -729,6 +729,13 @@ static ssize_t ath10k_reg_value_write(struct file *file,
>  
>  	reg_addr = ar->debug.reg_addr;
>  
> +	/* FIX: Validate register address */

avoid comments that just restate code

> +	if (reg_addr > ar->hw_params.reg_size) {
> +		ath10k_warn(ar, "Invalid register address 0x%08x\n", reg_addr);
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
>  	ret = kstrtou32_from_user(user_buf, count, 0, &reg_val);
>  	if (ret)
>  		goto exit;
> @@ -819,6 +826,19 @@ static ssize_t ath10k_mem_value_write(struct file *file,
>  
>  	mutex_lock(&ar->conf_mutex);
>  
> +	/* FIX: Validate address against memory size */
> +	if (*ppos > ar->hw_params.mem_size) {
> +		ath10k_warn(ar, "Invalid address 0x%08x for mem_value\n", (u32)*ppos);
> +		return -EINVAL;
> +	}
> +
> +	/* FIX: Validate size against remaining memory */
> +	if (count > ar->hw_params.mem_size - *ppos) {
> +		ath10k_warn(ar, "Invalid size %zu for mem_value at 0x%08x\n",
> +			    count, (u32)*ppos);
> +		return -EINVAL;
> +	}
> +
>  	buf = vmalloc(count);
>  	if (!buf) {
>  		ret = -ENOMEM;



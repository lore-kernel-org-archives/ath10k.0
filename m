Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D56CC6B38
	for <ath10k@archiver.kernel.org>; Fri, 16 Oct 2026 06:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7a0GMMLbsBLkNks08KISmu7g9oBBEyBrrD5fOAJxteY=; b=DB8d4EQJlemsS/lhfTjI4kJO1T
	dSctaFmMNedAdQJC6b/uaNhtTcrNusFRFbG4WEayUIRpk/THjMS7IRQJYnaPvtnjznUTJjhTzyU8O
	pkRYpWjNvks72+Sz1geYZdEYvZJDnvNKSPdRwJ2bb7whHQeb58bHd7Rw0pHpK2hnAlPiltf8rC7VL
	1O00kkt/XjZCazyeuzxGUdUk0xt10D66Pp/Wv1FU7oyLYKHiBl9meHG8NCunbx66b3kuOIuD95itg
	XKL7uA3VU4/1m94fd2sjYo7pZkY3Q0aaJzek5+ah2bhtXr+4Oqhu2y18ZVpHtQjQxBcEsBM0yuhuA
	CzQrdutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbJa-0000000271W-2cKm;
	Fri, 16 Oct 2026 06:21:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbJY-0000000271N-3cnB
	for ath10k@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7a0GMMLbsBLkNks08KISmu7g9oBBEyBrrD5fOAJxteY=; b=fdZfWfkzM6XYNTX6/NerSjkqbP
	aiMSJUBLaIw5Xus467k9u/MoqjHBdI1hp5hd00g/Wlsgoyw4ifEfh8r7ox5HJSPEYe/IjemTTQB4y
	RHA0gsiugNkJXHmz6Y+kf4Tko9P4h/Z+qLFuzaPk5f9T0rCYaHjo0hadciq7SpO5/6/IGNFNZp9n1
	2XLON75Nbq02hBI70HzHNWsZ4UfU5cntkzJgSx3sJv9gyq0Wu50oXP3hoj3Rp1BuYRgwjVgNQ/exC
	pmQNulUBu4ZiJqiuWu53fb985XWQ+2ODB57jAxfaRVCEwS5zBjyRLCSY3DO2KzQ8PpLspP/rM1a+R
	5/c76c9w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbJU-00000001AAa-3zrq
	for ath10k@lists.infradead.org;
	Fri, 16 Oct 2026 06:21:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G43w9K3874874
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 06:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7a0GMMLbsBLkNks08KISmu7g9oBBEyBrrD5fOAJxteY=; b=cHSVDLykoJlP9wB2
	0oAp2zhEU0yAmraCrontwzwmP009/W2FJe6dMApwVIemTgRM6HiwQ/gIC7ltf1hu
	wsRlBYQZ/XnBeAVd5wD5YGeT5bz2IkI38BhUipQazO+BP1oDJb8+mFh+iQI1L8Py
	fk8Ib3jd1lYvnUA7A/K4DwWqqcabgBpQH06DeovVoBStfWZTjJfXdz7St3cs2qJ2
	fQhjfb3J1+0VIEERjyLjVNoYnYd1dCxMy77HAagERk5bgH0BD/LhYb//EPhIJmgu
	PZtGObO86mEcGl6+TpCNFMNso47huCRwxRifrP6D1VlEK1h9BK8lT7MOt8gBhfnX
	k/iDYw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt8dpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 06:21:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-890a9a4e168so1530438b3a.2
        for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 23:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792131664; x=1792736464; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a0GMMLbsBLkNks08KISmu7g9oBBEyBrrD5fOAJxteY=;
        b=HI49mHP9xdhbw2qMU2EbgIybUvsHwo9od4V6zL2EuL6Yv2bLOhnlLHgMFINAB+iK1Y
         Rm6+PhIvFKJ2UPOhoivRm8x/J2MN5Yh+bU9AIfLQqGHGp6b7mJqvBxauhWhCjurbIcGK
         oivjA/BFzpj0im/aL4TrFqnkX22y5f8TdXbXuqOd+MjXCb97HmmVxdIYut9MQvdSnLM5
         uj45ypx4yFVe9iyQNl2uQ9L9agta/7f2s3VeZT7PGJ+dlcvCK6vUHM3w2IOMoXyP1/62
         Q/H/h2DFmcfyFpzmdwXjv/OQst0+yupYwSoobdLUYglEjkQFWCZ2ym25f7Vj7L8YcI8/
         whEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131664; x=1792736464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a0GMMLbsBLkNks08KISmu7g9oBBEyBrrD5fOAJxteY=;
        b=IYyEzCT62X+0c9VKPw63rnaubQVzvc4HO9Jl1hwmqg65YFsOVEGzYEkEFZCOkqUVMo
         OPs3i+zzYsg/blbo7JQOuWBlULAeG0zNWA7cfr+l/eMaKsB/AFHDotjrPhM+uNtAzL1u
         SqwjKtIbcj5bdIlu/3ZF/miEKn2FLV04YMFQP3oar5CS3P6y18thWSnujQxJtL46jkWv
         663bvV4W7Y2cNz9LaMO1n+lYOFqer5HJuF1mXUdhGBdABlX+ZJaBXwVVfv4Qto3P3+67
         NXn7XuO1eVOdLWS81FOEk35nFgpFZyLqzqV0eAVRf4poDLAG0SFg+u7Ycadmqk+tnczf
         2CyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzr2YAku0VEOUZnHXCROUiQ0kZ404v+4jSTDvMs6ZeQTbZsgSkIQOMTJmiBhMeY15DSV0O7tQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKw9qpttEtRE0doxZ1We+5GqH83YqyMzrfqWKUDhMdiB9dX/PAN
	5a78G4LW+fXf8wCyhXlDxEeTzHTx32o/NyVhVL52kXIBoE2Nawzn4nDgM9rbT+v6fJwhmX7YHKe
	65vBs8VP+tKiyka3L4vgdXszg9fAACe3v9Gu+alxeJvC9YUD+K717RfWmbv7VrBjE
X-Gm-Gg: AYBFou2IUXG6P6UNkrWfmNPQAKxt8zkdRRoCpPU551g0hoT+WGWTSws3031pul+bRfX
	rORtn+lmt6VX17df/lKzDrRKPdjJimxTzXEJHVNhYYS6Oz5f0GUlqaojG3ZIcBkhAaGWqVWJ/Lc
	vmAmg1HkDlgF9Fn74PirrZ1RUCCLoG18DbmCGKAgwEKN/2MruhP9K4ztanR7rtN09TbI+m8NxMP
	IiY7ul93MzoYJF12MNvzph/aiTaI+0zbNVzJLzO36omryC3by1oacGhcuP47quOemYzokkUDElp
	fhRD9gSXNYQWiaTTXZm5DI88iUcUFKJy798P0k3F7VMy33h/kASaV6VIeuh3vFV1fZaQ0VE2Ulh
	dXHq73DYg71XfFfJEwhDG4n2nttgdHsc15Lc4ugHSIc51pKpZdBbdb6s5ba9oLa0rir6b
X-Received: by 2002:a05:6a00:801a:b0:893:1336:4816 with SMTP id d2e1a72fcca58-897c7ec5a53mr18165152b3a.57.1792131663975;
        Thu, 15 Oct 2026 23:21:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:801a:b0:893:1336:4816 with SMTP id d2e1a72fcca58-897c7ec5a53mr18165130b3a.57.1792131663430;
        Thu, 15 Oct 2026 23:21:03 -0700 (PDT)
Received: from [10.133.33.246] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8a118sm610209b3a.19.2026.10.15.23.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 23:21:02 -0700 (PDT)
Message-ID: <fbc43e9b-563e-4240-ac78-5e81ddb01712@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:20:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 5/8] wifi: ath10k: check the recovery deadline on
 its own timeline
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
 <20260925-10k-sdio-crash-v1-5-14baf913df94@oss.qualcomm.com>
 <ceaf2db8-3796-40c2-830e-998af8c88b0f@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <ceaf2db8-3796-40c2-830e-998af8c88b0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNSBTYWx0ZWRfX+xcStadaHwN8
 D8ZsfMzxMte9jGVprg4cofDpkby+lXgYNDQwF8/jhupyFgqfanporCM9tSixDUmXTpu6qnp6KRK
 72prMBKj4lfTUqbVW68OzVzqFkBu477U76huZG56UB+uDlayL/bdvWxO9pW6cVWo/47aZcHs4Of
 KT55ygLbd+sqqVhzLAgC3uA3Jq7tZYNMPRGrPFK+Xye7Ciy57L3u0mzHqV5Tq8Tnmm8S+y3F0V7
 mE+BBHv6AQ/R6YTOqKxWl1b6fW6m3pY3MhPbE+Nh5hza9M+A60g2laLy/EzlQ4SSkVP55xd4yad
 q3Lpo7Q6EPrefDPXUJ8N3VzOAccVnRPRyqbSyNn09GfnIuOy5X8wg/tGA+3Cr7P+A9D5eReBuj0
 cgeFG3Z/nWgYbpqUFhWaRe/I1n8VUo7RMe1xvvCfH8YGd85Vqlo9YYNeEvNvOH0/F7MNF5RVeig
 KS50P5o2eFFFljJK8AQ==
X-Proofpoint-ORIG-GUID: pto2ymwiEN_u9oHPmBJTc05rZLwzRfFN
X-Proofpoint-GUID: pto2ymwiEN_u9oHPmBJTc05rZLwzRfFN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNSBTYWx0ZWRfX1R0HdnHaq/x/
 tebGK3iVznl5hHBBYM97uuC1T0A/iSFFy4gLOSDMwt/PK8kfZGf4msyQsB5QJwl/tG7byKn/ye/
 0ZPX27O0Daw8pbrMe3NDjEjLD73fw+E=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1c250 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=sMPgGdaneUjR03wAo3sA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_072109_699888_E86D6018 
X-CRM114-Status: GOOD (  14.08  )
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



On 10/16/2026 9:07 AM, Jeff Johnson wrote:
> On 9/25/2026 5:26 AM, Kang Yang wrote:
>> @@ -8175,6 +8175,9 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>>   		atomic_set(&ar->fail_cont_count, 0);
>>   		atomic_set(&ar->pending_recovery, 0);
>>   
>> +		/* Stop the self-rearming monitor after recovery succeeds. */
>> +		cancel_delayed_work(&ar->recovery_check_work);
> 
> My review agent thinks this should be cancel_delayed_work_sync():
> Confirmed safe: ath10k_core_recovery_check_work() never acquires conf_mutex
> (neither does ath10k_core_enter_wedged()), so calling
> cancel_delayed_work_sync() from inside ath10k_reconfig_complete() which holds
> conf_mutex cannot deadlock.
> 
> The real problem with the non-_sync variant: if the work is currently running
> when cancel_delayed_work() is called (which returns 0 and does nothing), the
> work may call queue_delayed_work() to re-arm itself before checking
> pending_recovery == 0. That re-arm succeeds and the work fires again
> unnecessarily. cancel_delayed_work_sync() waits for the running instance to
> finish and prevents the spurious re-arm.


Agreed, will address this in next version.


> 
>> +
>>   		if (ar->hw_params.hw_restart_disconnect) {
>>   			list_for_each_entry(arvif, &ar->arvifs, list) {
>>   				if (arvif->is_up && arvif->vdev_type == WMI_VDEV_TYPE_STA)
>>
> 



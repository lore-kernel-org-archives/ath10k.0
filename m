Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66331606A32A
	for <ath10k@archiver.kernel.org>; Tue, 20 Oct 2026 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vgjX/v9q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Be8i14al;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CCecqKF/;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ihiCelql
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEHc6iDxyYLlDmAzsBo5o5KHEION2Y+pQgLNUDYY3Y8=; b=vgjX/v9q+dlMp8hpaGAykZhjYf
	BWoe/MiCHv0amx0s5j86kb2+BspEx6MCAOeUVFIDtLUhwsBGs6WEROdytsivkPpyUagd7g47ni5gB
	SSpZpgG8qUzzQ8SrKmqNDp0phrjXhW+fmlIqWWZldONElUVuMf/yRR13xY7Kg5igo9zTfzabCDf19
	+ZeprMIrNsamflThjBpiiPbYSQAbIbQcPt6uMnR8wCMmWzPl/Cz/UyKWTNfGEzMzH7CBrFfTDmPvL
	vt7jiDKRp6Wn3Na81eub2pUD00QggUjxIAV8V4vyIUAzkjjJqZU8hfvZLswSJ3VGiPTg5QaNM7L5X
	qXcvMbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ57C-00000009AYo-1IrX;
	Tue, 20 Oct 2026 08:22:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ57B-00000009AYS-0MzY
	for ath10k@bombadil.infradead.org;
	Tue, 20 Oct 2026 08:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YEHc6iDxyYLlDmAzsBo5o5KHEION2Y+pQgLNUDYY3Y8=; b=Be8i14alEI53k0Blcgz0xp59FZ
	fYi8dZe992wWNXnZScgWkjz0hT5ZliFH1s7rLY3b8aRlfuep0neLSh+6SaZz5K5nYhWcn71SJ1DXu
	jAJLbL2cT/Mb6WAFKIv1ESsEHCZZ+httBz/GBQZBl9MYkIvWseLQRFDju0qGJdbjvs/2qWXnhd+iH
	mA14nK6P0FCQE/mr0RhDxjqWG99J8KgymQBYOK/cJokaWpCz3DNIq3+JEHOpvr/bwpkEN1rSm1nM0
	dEaX4EyDzacxLqbCqvlaV9+izzeEexBL1Fun8sJUoJ/0V/Mjil29Jj1jQ5AWGxtPeelC4UJy9FA4b
	RA7e3rJg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJ575-00000004T6v-1WdF
	for ath10k@lists.infradead.org;
	Tue, 20 Oct 2026 08:22:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K6DdRO1385432
	for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 08:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YEHc6iDxyYLlDmAzsBo5o5KHEION2Y+pQgLNUDYY3Y8=; b=CCecqKF/koHsu7wt
	oCu8RIYOM78A1MWI5uDEoj/WrzFfFg4eNgBQBlTFpDgeqTydBGkPihU0uHOmZQt2
	iOGP65YGA5j5AGzzEoS4bigfpFB/rW3vu3Jm8dbuY+qHEuf166MACnrD8Ns60Z46
	uoOBN9tMex6Cw5Jhd6YYO4BjwuxPjkLq2jr6k0EmBFkMfBRKHcK3EfMQ5HvoqTVy
	gzhMU66z0nj4B/Dp92S4BVkjIzK+umtDs1KQd/Llpa2i6M/W+sl0eoAyBZzqICbj
	hHpEfjK9Bsyf1OQAxm+VcPh99bSKBsehuZEAghkFUCcaHNekUY57HnqlwepqO7EC
	mj3T+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phmcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 08:22:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso6226888a91.1
        for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792484542; x=1793089342; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEHc6iDxyYLlDmAzsBo5o5KHEION2Y+pQgLNUDYY3Y8=;
        b=ihiCelqlgI7+xRN61LECkFeCDGO4mhLEXSYSdKBKd8LKuAKGw/unPS1/pqVjCBTWcB
         GxkcXEpBl4D3AZ3j33mzReHS5H8wnFzTfHpkIbw9LbrbI6DGH8FZMZ0UK+1VMdEf8j9o
         koONVYLBfbhh9mHbEOLI4y8PCND41a/UNmj8WPOtb75YrXqlmnawOqcA9Yi1q7aX0fT9
         sF4nQoXeCRbLuHy6sFn3UwNbSDHjCVbVtntKQ7pWpia34FSYRl8vzmpCClJ5DXm/BZyK
         pbX3J8P+vK5xVmOUROnS4Owe5SUoAitOsBEuz9a+5j0q0a7P5DN6UKxppEie34sed+if
         QHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484542; x=1793089342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEHc6iDxyYLlDmAzsBo5o5KHEION2Y+pQgLNUDYY3Y8=;
        b=QVNYxbXQnrx3nUMcFjq/jdGStB2a2E8T2ZtCZsvESvV+gQffL0+9UPYXB93LkWNe2M
         x+30R7obGtpjXnWUxSSQGHjVEjZXVH7wbkRJW4qCFSqEcBUZQkd1anSeCScXlCdjFN+p
         kdB8XKsb4O6Wju1+seAiaBT/w7lBsudnPVKYwlBkqvfX62Y/OMdnXScqiPzpuEgexisQ
         uscZmfYA2vOZ6HUK+2bnYigi/Us/NRoA0W0jwmspNk7O5FxYv/ush+hLBc3RpiE7C6ob
         K3N0k80zF7kxdaFjXP/IlV8tYYdhIjOrk2qITzqN+lgPlB7XOF6n86CYfygVSse9CF2X
         aaeA==
X-Gm-Message-State: AFq9FYKTciCCQuhZggoeMgUeVXEtzIU++A8V/sCAPt2dg++rhnewliFs
	74fGixVAw6+TtBBuOEZbIdBOuSAIBfqbRms4MCaR5bvg5CtckhL2uCB20lY2HjHcfhcnUQv9c/d
	Msm/gxsKO37pNoj/6lDL8fi3tRQLuUybN0ojlFg3o0SUS3AbItsx98Gmr7np+amop
X-Gm-Gg: AYBFou1ErL0/tOdj9UW5NRX/IPuFdo8wq+D9zMOvshkADeGN8zIjTuQXrclwBU/DOGY
	XhS8xxW9Qfzc23xUlQNO0A2szM4uhqNGvWyzK+bvQtszQTFSDH3pHD7iyV/s8hFCbuwV0pluOGL
	zjOfohmLxsa4Ux2zuA9lPzpw5NvX5NNmL6jUOhmyUdp5WdeR/y7n8AZ/RGbxZnzaWjfBqgxlI3P
	sMQPGwZSqEfgB9M1N6bJiPTisks5A0soimiSrlvomSx+lNnWCCCAcOd5SoGxYp5Lw6Em9N2FvUs
	9aU4DqVgx2tNPyIguZ8fhU5wFxMazr4C7/U4oi11i4cdvmolRC4AI5WLEE7fSAUCjw9iuh/Y/Ac
	sV3u5gxDgPRAu0lMRG6QwIkLqg6RNfu14Jo4omh8p+RcWpMk4oD8Vv+0P001vj6UrkQ==
X-Received: by 2002:a17:90b:2e46:b0:3ac:9e76:aa9e with SMTP id 98e67ed59e1d1-3acee276f13mr9186227a91.3.1792484541975;
        Tue, 20 Oct 2026 01:22:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2e46:b0:3ac:9e76:aa9e with SMTP id 98e67ed59e1d1-3acee276f13mr9186205a91.3.1792484541413;
        Tue, 20 Oct 2026 01:22:21 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d6df937sm2776327a91.12.2026.10.20.01.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:22:20 -0700 (PDT)
Message-ID: <5a65491d-5fc6-42a8-b2c7-acebe5e23324@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:21:57 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 5/8] wifi: ath10k: check the recovery deadline on
 its own timeline
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
 <20260925-10k-sdio-crash-v1-5-14baf913df94@oss.qualcomm.com>
 <CAFEp6-1t7s9zX5GMyiZ_PP09Zz1qRZ_tRRTmo2m_vBqOBj-Mhw@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1t7s9zX5GMyiZ_PP09Zz1qRZ_tRRTmo2m_vBqOBj-Mhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad724bf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VoPCmNj33lMcq5cueVEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: mvRwvHKAsNZKl2dCPKM6tTeyH2rH1hUD
X-Proofpoint-GUID: mvRwvHKAsNZKl2dCPKM6tTeyH2rH1hUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX5F6a5mcZbPyy
 doZdwmFXYRFoETi304pBoCr7BwP9kasKPE96A01A0rAaenrm5zt4OslgVEp2JFrPjG88Qd1H6+y
 dOKkw72E5nsPfp7lpi+3BRmkIG77lJzWiMWmCIAAjQK0RT/4EcjoUjc6H+NgDnPiO+Nat32HB02
 0nFR36iW6DowWJDvEOBFSIgqsgO9WuwWoj3chTxpk1WqXmX2pU/t+MW4mhnOQk/xkDEAZDWo05T
 kOxbrjwpOheT1DJSQgATTSUmhPN2Jb783O3oBJ8Fj2qQUcNfI62n5l84GgNyZi7yYxeHo2X40Jb
 f6lIvlg2gQjzPL5iSFDeZ3PU4D+Rji1Pb/GlQF/z6+nWkc4qAdVm4Ec7at8LxpgXnoQEIxsHZB9
 Xp7giZ7kiwXANi2wGY/ZSvPQPoFFSyy4sYAT5Lv6EppHfUCcyyrG8RCkkwpHaDC5WyZVrh1dryN
 4YH9+GjUWCmzxTZBYZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX7A4nND1bJMv4
 0eJe3C9/37WTTfOY+IjastIHln5GVCHHZc0Qupqhb8wH2O9C+07amSVUms8spYTtyargobaEuJJ
 M7X+UT4oKOvjdErhUbQCmbeXUNCdAy0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_092227_906075_9B02DF6F 
X-CRM114-Status: GOOD (  23.68  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/20/2026 3:36 PM, Loic Poulain wrote:
> On Fri, Sep 25, 2026 at 2:27 PM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> Recovery timeout enforcement currently advances only when
>> new recovery triggers arrive.
>>
>> In practice, the interval between triggers is not bounded.
>> Additional timeout handling, workqueue congestion, or other
>> recovery-related activities may delay subsequent triggers,
>> causing the effective recovery timeout to extend well beyond
>> the intended ATH10K_RECOVERY_DEADLINE_HZ limit.
>>
>> If recovery becomes stuck and no further trigger is generated,
>> deadline enforcement may stop progressing entirely.
>>
>> Convert recovery_check_work() into self-rearming delayed_work
>> so timeout monitoring follows its own timeline while recovery
>> is in progress, independent of future recovery triggers.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> 
> Are you using b4 (or ./scripts/get_maintainer.pl) for this series? It
> looks like a lot of relevant To: and Cc: recipients are missing, which
> makes it harder to get proper review coverage.

I didn't use "b4 prep --auto-to-cc", will use it in next version.


> 
>>
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 20 ++++++++++++++------
>>   drivers/net/wireless/ath/ath10k/core.h |  2 +-
>>   drivers/net/wireless/ath/ath10k/mac.c  |  5 ++++-
>>   3 files changed, 19 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 29ca34a643ed..93dc7332c759 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2522,7 +2522,8 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
>>
>>   static void ath10k_core_recovery_check_work(struct work_struct *work)
>>   {
>> -       struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
>> +       struct ath10k *ar = container_of(work, struct ath10k,
>> +                                        recovery_check_work.work);
>>          unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
>>          int fail_count;
>>
>> @@ -2536,8 +2537,11 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
>>          if (!atomic_read(&ar->pending_recovery))
>>                  return;
>>
>> -       if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ))
>> +       if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ)) {
>> +               queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
>> +                                  ATH10K_RECOVERY_TIMEOUT_HZ);
>>                  return;
>> +       }
>>
>>          /* Record the continuous recovery fail count when recovery is late. */
>>          fail_count = atomic_inc_return(&ar->fail_cont_count);
>> @@ -2547,7 +2551,12 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
>>                  ath10k_err(ar, "recovery timeout %ums, fail count %d, shutting down driver!",
>>                             jiffies_to_msecs(jiffies - recovery_start), fail_count);
>>                  ath10k_core_enter_wedged(ar);
>> +               return;
>>          }
>> +
>> +       /* Keep checking on our own even if no further trigger arrives. */
>> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
>> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>>   }
>>
>>   void ath10k_core_start_recovery(struct ath10k *ar)
>> @@ -2574,9 +2583,8 @@ void ath10k_core_start_recovery(struct ath10k *ar)
>>          atomic_set(&ar->fail_cont_count, 0);
>>          WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
>>          queue_work(ar->workqueue, &ar->restart_work);
>> -
>> -       /* Start monitoring after publishing the recovery timestamp. */
>> -       queue_work(ar->workqueue_aux, &ar->recovery_check_work);
>> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
>> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>>   }
>>   EXPORT_SYMBOL(ath10k_core_start_recovery);
>>
>> @@ -3758,7 +3766,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>>
>>          INIT_WORK(&ar->register_work, ath10k_core_register_work);
>>          INIT_WORK(&ar->restart_work, ath10k_core_restart);
>> -       INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
>> +       INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
>>          INIT_WORK(&ar->set_coverage_class_work,
>>                    ath10k_core_set_coverage_class_work);
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
>> index 0319da3ec022..a1ded2cba103 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.h
>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>> @@ -1213,7 +1213,7 @@ struct ath10k {
>>
>>          struct work_struct register_work;
>>          struct work_struct restart_work;
>> -       struct work_struct recovery_check_work;
>> +       struct delayed_work recovery_check_work;
>>          struct work_struct bundle_tx_work;
>>          struct work_struct tx_complete_work;
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 8e604697d6c2..d10126351fce 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -5427,7 +5427,7 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
>>          cancel_work_sync(&ar->set_coverage_class_work);
>>          cancel_delayed_work_sync(&ar->scan.timeout);
>>          cancel_work_sync(&ar->restart_work);
>> -       cancel_work_sync(&ar->recovery_check_work);
>> +       cancel_delayed_work_sync(&ar->recovery_check_work);
>>   }
>>
>>   static int ath10k_config_ps(struct ath10k *ar)
>> @@ -8175,6 +8175,9 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>>                  atomic_set(&ar->fail_cont_count, 0);
>>                  atomic_set(&ar->pending_recovery, 0);
>>
>> +               /* Stop the self-rearming monitor after recovery succeeds. */
>> +               cancel_delayed_work(&ar->recovery_check_work);
>> +
>>                  if (ar->hw_params.hw_restart_disconnect) {
>>                          list_for_each_entry(arvif, &ar->arvifs, list) {
>>                                  if (arvif->is_up && arvif->vdev_type == WMI_VDEV_TYPE_STA)
>>
>> --
>> 2.34.1
>>
>>



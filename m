Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DFF606A319
	for <ath10k@archiver.kernel.org>; Thu, 22 Oct 2026 02:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=01HXEJX7;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VmtBHypc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=byf1lfrQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEiB+TPrI9w/nNl1unn+ZcBh8ZZfQSBY03uSVOM3OX0=; b=01HXEJX72o6tJvTMf/ElqguwD5
	Rg/nBnXf03AHjBlDddVJcwE6rxlAlP7pD1aZ3L5oq/paXsT+RFZxi7w/vXRUBDVXlkSEs1dCFDKTg
	/RfsgbraZu0/e0JO7Tcj+hq+VZwfDMlakR5cwYzgYUNE1AbzrHvp4LQj2shQcoZH59u2mg+txjrYa
	bTLzP6WP9/rh76x5QDJ1ksEerra6hSZxH5aoE57FsWx3TYtxBUYaYmILJfNSgizaqa5Tce6+qS6k9
	f09b/mYV8JUM36MFx4wx606WkEGQZqiGOd89MbkYG5aUoamIkCs43W5Vz22wz5aay7vrboXDIkKMm
	hDPCGk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiC9-0000000DB9R-07p1;
	Thu, 22 Oct 2026 02:06:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiC6-0000000DB8j-0oNf
	for ath10k@lists.infradead.org;
	Thu, 22 Oct 2026 02:06:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1jE1P2822780
	for <ath10k@lists.infradead.org>; Thu, 22 Oct 2026 02:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEiB+TPrI9w/nNl1unn+ZcBh8ZZfQSBY03uSVOM3OX0=; b=VmtBHypc4uu9hwSV
	0DB7NKDL9viWUojKSSjPlkDII2y4HoEof6MVC21i74+z5x7uJ6Wfe0sRQe5j9Zuf
	ayJ5vqyDrcyvlrMLpJmI7uRvXl/3RyQCVwDInznl9AUwGeKDECDXtcT2q7HKeco0
	jOiOSIMG7k3BI7MCmUKdOE1HtFyz/8Ak67XshNZMSQnP2r5yL2AaWLJOu1QCYKJm
	fYGozBQq1OL3oPD9/yNIlnZYWPsXK7PyrGITCJWlCYYoL0UoKxICyBHSExsB9FkA
	oNd/WJLa6kIAFxtg+5X+HHYEW+iCKYOBIpoAfxcfhbsrmeCqyni93+3yXDnKpc9y
	pJUPfQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bg4mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 22 Oct 2026 02:06:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89ff475a0deso1250334b3a.2
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 19:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792634772; x=1793239572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEiB+TPrI9w/nNl1unn+ZcBh8ZZfQSBY03uSVOM3OX0=;
        b=byf1lfrQ131g/wyaCzElpKHM0/zD9cLQ0AGn2f84vltdbeLevpPfzwXm19dxwxMTTe
         T2Oh++urdSUguuOBYu6YQHtu8ofuf3BCq24x+D4QbZlMVPJ8Qose1oeyasCfXkHOEtsm
         mpQmi2h7to05Q8ipI1V2N5pc0ZwXGqZLvpD8JT2NpIEb0/7jQs+UD9itNKCeJj5W1rJ5
         mhEH8yuu+2ptHGAUaQ3sIk+rhPgbIvm0njj12zrAVkPb/PFiRWk70r9Z+olE8TtxKb8/
         RTlPEgkDWc/S7qF6JNpOOFKuZI/Psp8DxKX6Ltjj26xnqAW1l0mddxGvauQZhFmXFiFz
         AfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634772; x=1793239572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEiB+TPrI9w/nNl1unn+ZcBh8ZZfQSBY03uSVOM3OX0=;
        b=od1xAHIu6zwtVKmOAX4UOzNzFia8nTgR0Wp8+vJ9I4OsPCRw1rPhvhyXBoDCCzdxRI
         YluEr6rfQLsRoRHePUUWevVXTiBuoWCv2Wmm/dZiuLr7kcUJRbT5NT8J4/5+TYIzLXm9
         jPFJwhRJ4Nkx1+dRqhpW4HZNPOROieGfVWMWZVT19fn7baEVDrQxeEDS4aLaFCyC9ytB
         uzfspBjZFTcow5l6pSCE1ILxQMGy8zuojSzKtSF8f6EitBHsE1wHEyTKmi9utacx23lH
         rJlkz6ai65nZg8vdYtHx+5YMRO/ISeYbqzhSMM/dy6v6ou8wPrsiJ8voVISp9201pVdT
         Q8SQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRyPBNuwtbLj1bVv5+AXz8l6OSe0pd6N21JkX/g74xqiX1rm1iCanlSzUpbqQs6yJc1fhC3rw=@lists.infradead.org
X-Gm-Message-State: AFq9FYJySN+jfNvZiGV54pVe87oAQ8iMhh6lp8Ws4hekx++IMt4NSIc2
	eppX+K4w73c8Zf+rASQ53jSoqNL4a38bub2MAeWmB+Pz3leltzsOHQsXXw/tjjApxT08hITU5og
	99ZtvCAB8gLSWEEwtMK+WR9NWuzUedmj1WKvSf7Vqg+n5sDZt1SV0JoY/Urjvr7rf
X-Gm-Gg: AYBFou3lAMte/dxrqhlRUc5lbgiXZgmbcOhmxxjPqxRxtj25K7kUsookOO3s+DJS+hD
	AxD4fFWPRnzyCzs30pggHFeTxHbMMqsFrXtWP/850h7eYhhqn+K7xezirs4Aoq+wtlJEwD67APc
	CY+Tbck/RcqstZlrPqGA6moVeXuW4f5hvT9ReEG6BYWs2jLN1n8IPi2VscF2tzbO+ROBAhT17Kc
	2Bb3UAojo8ERfuz2DD2GqcZiOxHndyYI58zoO0s8/WckQXnSlfS8Dpmw98HlfRuNFuOHMbIKvd7
	fy+IeB+uou0tFALGlezSpjRX513kN6txVFf5t6nBx7+RY3o9iHd+Ys3eumtLxlG40554n6TOKlR
	D4yjQ0VgFVDSHezSN5VwzYbSK+nVNrAu/W2K9tdhtcssKDOYo09PYVV8AJsN4sYsZk4g=
X-Received: by 2002:a05:6a21:a247:b0:3e2:a9cc:3ecd with SMTP id adf61e73a8af0-3e2a9cc4222mr20188637.7.1792634771848;
        Wed, 21 Oct 2026 19:06:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:a247:b0:3e2:a9cc:3ecd with SMTP id adf61e73a8af0-3e2a9cc4222mr20158637.7.1792634771252;
        Wed, 21 Oct 2026 19:06:11 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b8482207sm594009a12.9.2026.10.21.19.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:06:10 -0700 (PDT)
Message-ID: <c49d0198-7207-4439-9be4-22d35e741ac9@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:07 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 1/8] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
 <20261021-10k-sdio-crash-v2-1-5df80bf16e86@oss.qualcomm.com>
 <CAFEp6-3UB=U16NkQNM_H4gUA71XWvYLcmcO_mJhFpX=9yC=HiQ@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3UB=U16NkQNM_H4gUA71XWvYLcmcO_mJhFpX=9yC=HiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAwOCBTYWx0ZWRfX6kubrYn8WvHJ
 nSoPxztXpL+lmYgN7J2i0+RenqRMZRxC/RV5s4CWJf3OfjEoGZD6boUZWj56QbNDop39digJaLZ
 7h7A7ZLbI9XyL6xEfkMlDfexzaqebFR8IyHk2ON42ObJE4vh3oNWbw5/G4+J+n2GtHy3aNKgiek
 X9ZFz3RP7tqFb1FDhmpkU7QC46sIaoVrwfNAlr9DA6J6VNWIe/tpyEDKAP8Mk6UZXpnWuhJuMod
 UIe+C1a28DGfxbuZklr6PrCJlBlVrDQdhAIjnp5PkBB/fiMB8wk4HRcTWiTtuAmHrLweCVMfMQa
 wDN3FAAgfAgdF6dPj/BQgyut1/AFZHvxjCrmaE6uBAOsRCLOuGfTj61+ve+8vVF1OEiI947OPkb
 CoN81AmIE9zYwb9odwo6t0hDBU0kPNElYOgVo16cfP1wNA6ZGqvmkAiYC2bzNnYL8gfuUiKq720
 5FVawYh8CIJxTvqxggQ==
X-Proofpoint-GUID: tw_4c_d0IPH6OGP90kEB4z35FrzzxZ74
X-Proofpoint-ORIG-GUID: tw_4c_d0IPH6OGP90kEB4z35FrzzxZ74
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad96f94 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ryoBpbmvVPDUnakTGygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAwOCBTYWx0ZWRfX1HUKzJYx3k0w
 PxI32ZaXlDr6H8cAeXk0xelZuy3WlzQrKpWDziyO2oeK6+cz0sOMdvrGZy7MfZnNs3Y83cGQUuB
 IQLMqG1dfOzgdpdPDhRWbTMwXFs8dQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_190614_363212_9DB627C6 
X-CRM114-Status: GOOD (  29.96  )
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



On 10/21/2026 9:33 PM, Loic Poulain wrote:
> On Wed, Oct 21, 2026 at 11:09 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> Recovery monitoring runs on workqueue_aux, which is also
>> used by SDIO RX dispatch and WMI SERVICE_READY handling.
>>
>> A single firmware crash may generate multiple recovery
>> triggers. Recovery detection currently handles each one by
>> waiting for recovery completion on workqueue_aux. On SDIO,
>> this blocks the same workqueue needed to deliver recovery
>> traffic, preventing recovery from completing.
>>
>> As a result, otherwise recoverable firmware crashes fail
>> with:
>>    ctl_resp never came in (-110)
>>
>> Treat duplicate recovery triggers as part of a single
>> recovery attempt by gating recovery startup in
>> ath10k_core_start_recovery() with an atomic_cmpxchg() on
>> pending_recovery, and by making the monitor path check the
>> elapsed time since the attempt started instead of blocking
>> on a completion.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new work")
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 64 +++++++++++++++++++---------------
>>   drivers/net/wireless/ath/ath10k/core.h |  2 ++
>>   2 files changed, 37 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 7c2939cbde5f..07beefa06c4c 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2494,46 +2494,52 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>   static void ath10k_core_recovery_check_work(struct work_struct *work)
>>   {
>>          struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
>> -       long time_left;
>> +       unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
>> +       int fail_count;
>>
>> -       /* Sometimes the recovery will fail and then the next all recovery fail,
>> -        * so avoid infinite recovery.
>> -        */
>> -       if (atomic_read(&ar->fail_cont_count) >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
>> -               ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>> -                          atomic_read(&ar->fail_cont_count));
>> -               ar->state = ATH10K_STATE_WEDGED;
>> +       if (ar->state == ATH10K_STATE_WEDGED)
>>                  return;
>> -       }
>>
>> -       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
>> +       /*
>> +        * Pure monitor: only ath10k_core_start_recovery() starts a fresh
>> +        * cycle. Bail if there is nothing in flight.
>> +        */
>> +       if (!atomic_read(&ar->pending_recovery))
>> +               return;
>>
>> -       if (atomic_read(&ar->pending_recovery)) {
>> -               /* Sometimes it happened another recovery work before the previous one
>> -                * completed, then the second recovery work will destroy the previous
>> -                * one, thus below is to avoid that.
>> -                */
>> -               time_left = wait_for_completion_timeout(&ar->driver_recovery,
>> -                                                       ATH10K_RECOVERY_TIMEOUT_HZ);
>> -               if (time_left) {
>> -                       ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
>> -                       return;
>> -               }
>> +       if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ))
> 
> You can use time_is_after_jiffies() for this.
> 
>> +               return;
>>
>> -               /* Record the continuous recovery fail count when recovery failed. */
>> -               atomic_inc(&ar->fail_cont_count);
>> +       /* Record the continuous recovery fail count when recovery is late. */
>> +       fail_count = atomic_inc_return(&ar->fail_cont_count);
>>
>> -               /* Avoid having multiple recoveries at the same time. */
>> -               return;
>> +       if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
>> +               ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>> +                          fail_count);
>> +               ar->state = ATH10K_STATE_WEDGED;
>>          }
>> -
>> -       atomic_inc(&ar->pending_recovery);
>> -       queue_work(ar->workqueue, &ar->restart_work);
> 
> So we are not re-arming anymore for additional tries? or I miss something.
> 
>>   }
>>
>>   void ath10k_core_start_recovery(struct ath10k *ar)
>>   {
>> -       /* Use workqueue_aux to avoid blocking recovery tracking */
>> +       if (ar->state == ATH10K_STATE_WEDGED)
>> +               return;
>> +
>> +       /*
>> +        * SDIO raises several triggers within microseconds of one crash;
>> +        * only the first winner starts a fresh cycle and stamps the
>> +        * deadline. Losers do nothing while the owner runs recovery.
>> +        */
>> +       if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) != 0)
>> +               return;
>> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
>> +                  ++ar->recovery_count);
>> +       /* Start a fresh failure budget; the last cycle may not have completed. */
>> +       atomic_set(&ar->fail_cont_count, 0);
>> +       WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
>> +       queue_work(ar->workqueue, &ar->restart_work);
>> +
>> +       /* Start monitoring after publishing the recovery timestamp. */
>>          queue_work(ar->workqueue_aux, &ar->recovery_check_work);
> 
> So now that the recovery check is no longer blocking, it seems to me
> that this could be implemented as a simple timer (alternatively, a
> delayed work) as it would avoid having to perform the timeout
> calculation...
> 

Patch 5 will change it into delayed work, let me think if i need to 
merge patch 5 into patch 1.


>>   }
>>   EXPORT_SYMBOL(ath10k_core_start_recovery);
>> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
>> index dfee432615eb..c739fbadc8bb 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.h
>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>> @@ -1215,6 +1215,8 @@ struct ath10k {
>>          unsigned int recovery_count;
>>          /* continuous recovery fail count */
>>          atomic_t fail_cont_count;
>> +       /* jiffies when the current recovery attempt started */
>> +       unsigned long recovery_start_jiffies;
>>
>>          /* cycle count is reported twice for each visited channel during scan.
>>           * access protected by data_lock
>>
>> --
>> 2.34.1
>>



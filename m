Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078D2606A319
	for <ath10k@archiver.kernel.org>; Thu, 22 Oct 2026 01:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lSaaFhqn;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXu1HsDp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hz2YRhVB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kyJHXtwMquLIO/WZE44AGG8CwDkp2gKhuwbsZ0JjBo=; b=lSaaFhqnADymn26gi31o5AJP9s
	nZkVBmyaIK10zAFpuKksSmm11IuA32TOsOMXdeDmHAZ6X9aqRx9EKTQPkVhkX/Jr91sCekDqOT+fi
	o/ZpJ1v5CP/U6DUL2OslsQPtIcox2xhJcJ4d2vSUpGah5Cw8MDi5IrqnKOJk/p9w5WfIguFYjAvMg
	c6rcCGbHZAi9S8Th/FPZthz8Qk4KvZ/xKyHm684yEUHgkTVW3t5H7CvbjbJ/ja/96jbw1Zyq9wqU2
	jdDx91IlBtazVTuRFLsbgfh/sNlMRxEK79uoBXY5lRqQPDoqE+CsIaH39mYnYpWeJSmQGsKty55/w
	xMloSqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJi1W-0000000DAAA-0uyi;
	Thu, 22 Oct 2026 01:55:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJi1T-0000000DA9q-3HSx
	for ath10k@lists.infradead.org;
	Thu, 22 Oct 2026 01:55:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1jPI31307663
	for <ath10k@lists.infradead.org>; Thu, 22 Oct 2026 01:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kyJHXtwMquLIO/WZE44AGG8CwDkp2gKhuwbsZ0JjBo=; b=VXu1HsDpxucSwKvA
	oXY86BlMf3HXMDHeoADE6kXGfdLmNrGr1md8hQTvOjKrkJ6nlsd5WnFWz1m/EOwY
	lebxhpOH6H1qDT6rcTNLSWIyjEfZUkHbClGqh7zHeGM0ugETxJtW6zRcCmoVC7+Q
	YZxiL/Piuselb1g05ggxVZMDtQxlywOnGFnDdhXYs2yHs/4LHa9YCRbiQpCVoDmA
	NuzTcQGhD9XRXOGI/Fv4NKPB52MoX6/KjvjEWmMzxp56NHSFlSSpiESA1PzhR/pR
	Uu9LbMROjg9CsZuR9e074ZUrN/Rf5wbaUOy7MABD8vdjy+jt+mwc/wO9I+T395f6
	fvuXJw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93br27u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 22 Oct 2026 01:55:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad436a9d00so1306468a91.0
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 18:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792634113; x=1793238913; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kyJHXtwMquLIO/WZE44AGG8CwDkp2gKhuwbsZ0JjBo=;
        b=hz2YRhVB3vSGM1fE8hlAtalpFYU7YQjQoLmWWb8VRRePOYpVTrLFgL+sjzdSEL6bO6
         YlzM6ZGZAl+SDPxB2dqAxi5GJB7+pZp/M1hX7jcLGbhfQPZLc/0wRXfxoXzJ55jG5AlY
         oQLuDC3kSEcpz2fkN+7EXP3gDnu1Qc/j6NvawhQCjbepXQdkpqvbO3lNsRl454NT6T1V
         KflyWBcP8ah7VJIMCfpIa9Qf8Q4Z4f6GvEyu3lqUMJyMV+luj4ItHmMbN8N89CDKeyw+
         rLN5iTz77zH3ZaYs70KBIoU+YGwyDw72Za9ZcYB/fHPlDzc4afg9B6WvXejxm+BjEEcd
         Bb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634113; x=1793238913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kyJHXtwMquLIO/WZE44AGG8CwDkp2gKhuwbsZ0JjBo=;
        b=S3CaMGBBunglX1qSdgmZCdt917pgSZrqSj6NbY/6yV9z77oJuDTCx2entzsgYjpErP
         xXfnuQQRlvgYiEsSgyXrsWLqajiaVzgPectvUimYHl/Q6ra+dsUAdyUKzqeNoHDnFcgI
         8pASLxBtdgpvT+OuzoJdSFABn7EdnwmUs0zA/ArEhUxuYzaeTDpMNGU3C7ENpVhLYjmJ
         f9gqyPGC8mw8vIdZAfwRaafjq+Gu+XGxPygWAGhFPiPbdJzm04tDtV3GvYiP+xQljESw
         3IdCsXUlzNcnXzVlSdaeaSHhm3nreAqCv8OqaWUyAHa+/8AfrpVJUMet2uieiZrvR561
         KurQ==
X-Forwarded-Encrypted: i=1; AKwUvByedG9T5hyw9IgqTSX9MKnet9hZ7uOsupSRsM4Pn/Cycm00MCVhrZziALFW1TCnKu2ag5cNvP0=@lists.infradead.org
X-Gm-Message-State: AFq9FYKphAcOObhZ6Do56ZqpzosIbsIIq07yDkTPe/+wInv2r+wCtH/F
	8ShAj3lnt4nF1nADgX0VTrTRft31KFSlzaGPzyFpoN5loBrIHOHjOKYaj+q8Hqwm1RRhKlnGfGn
	XRZoJZcIun9M67eNpAhMw1mU9B8hDbfmpgZfHWuoFcQWkqzcodo+bLCXZ0vw6+i3f
X-Gm-Gg: AYBFou3TvkFL9fiCK3mkBHWKm2TJ+qgJC6hauEeRYl336dAFPHGaeYDdlBI8Ms0iyV6
	0UBm5TBCq6wFzyD1XyJH4mBaGRdvabmbqp8o+OdvYAVCGshDFEIb3xbPkN7idQGSLkDiyCQMEKi
	Ac0jaSfMB9jHKDS12XbMtWIIM00MnJ+wAgPzzceOZpigP4kQzV7dOKlhiM33+dXWerZdQlHqxGR
	1Vl5YEWs/zMtEeE4IIEHII58e8VQXLny+ac+6gd8GXV9ALL/RKVMVcD3T5nNPM+usBQJ4cnR+yH
	OS2UBB8ADxHOBSC3VnDxnbQBCXsDWwxN4b7Cc/vTH87BkzmrqdV4AG+MbTk47ATp1MUbA5xS2uv
	YqXt48IYeACtLd5JiSz7YGiDp9BsnWvdh368CFTPcZQZQuD+cJf+X1bedaTq8GADIAKQ=
X-Received: by 2002:a17:90b:548e:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ad86f23619mr3099483a91.57.1792634113347;
        Wed, 21 Oct 2026 18:55:13 -0700 (PDT)
X-Received: by 2002:a17:90b:548e:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ad86f23619mr3099454a91.57.1792634112731;
        Wed, 21 Oct 2026 18:55:12 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f9e392sm2529254a91.2.2026.10.21.18.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 18:55:12 -0700 (PDT)
Message-ID: <25cac2ee-7696-4da0-abb5-cde8a21dff15@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:55:08 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 6/8] wifi: ath10k: hard-block the radio when
 entering WEDGED state
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
 <20261021-10k-sdio-crash-v2-6-5df80bf16e86@oss.qualcomm.com>
 <CAFEp6-0WLtOCGQbhybo21WWX_ZbE6_nRVQLq-Hqddc-+Vvvafw@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0WLtOCGQbhybo21WWX_ZbE6_nRVQLq-Hqddc-+Vvvafw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B_wzpyU4-c5QJnY2jH8J1nzjReeCOCo9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAwNyBTYWx0ZWRfXz/OTOEi2Fd5M
 EdfUfJc+3r4RuadpmYe3nP5k41o8wodj0gGwjFH97gBVGrjXHbSNcYfIx8PIR/zWdtWo1+krNs4
 bwAmz5L7t0i7ds4eFYgKL6Gndcmg6x4=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad96d02 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ygjDnIpqFwOlN7mGrjAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: B_wzpyU4-c5QJnY2jH8J1nzjReeCOCo9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAwNyBTYWx0ZWRfX83vJPNZE5Vop
 9APx2FDFFVF5ZxLXApWQjFecm9NRQ//60F1Beub/rbPOWILms8vMkf7NXMk7BuVi+PagEXsxdOK
 KRrJMkc180R6B3pZC9qP+MVUc3PNKSWuJlsJ07GEx+y7FdBNngBRj7FFkQbdtrC+j0ZjXqa1Dp5
 lUsMAHzuWaPD5Vv7NAPvbrJO/vOVF4HtCQuA5kuGTgRlaoSJzIFP6XoNNt60fsl3W/H8Sw4r5m8
 SzPFwP8g3xB7V1gvlWJfCrp4276KxNvFDzjFAP6P8jeBGWcPXEir5rzAgQ630InyCUzIpuTfsNA
 X4xV5OY9xjzvbY4YIJYx+j+kVTRwqKSrnlGjjSQy4hrXx02onbFbOr28fUefawzozTKjvQHCEM4
 qJGqkXKvXKzgn2a0AZvc+kBAI7kJgVbJQ4rOXhrVAr++ZRlmSnEShxwCosu318PhB8cIXvbDtKF
 8fP61ntyDjLfkd9pzmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_185515_947749_44F69420 
X-CRM114-Status: GOOD (  20.12  )
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



On 10/21/2026 9:54 PM, Loic Poulain wrote:
> On Wed, Oct 21, 2026 at 11:10 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
>> longer recover and remains unusable until the driver is
>> reloaded.
>>
>> Userspace daemons may continue issuing scan and connect
>> requests, which the driver can only reject individually.
>>
>> Mark the radio as hardware-blocked through rfkill when
>> entering the WEDGED state so userspace stops retrying
>> operations against a device that can no longer operate.
>>
>> Both WEDGED transitions already route through
>> ath10k_core_enter_wedged(), so adding the call there is
>> enough to cover them consistently.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 6b6b80242cd1..66585cfa6d96 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2521,6 +2521,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
>>
>>          ieee80211_stop_queues(ar->hw);
>>          ath10k_core_wake_all_waiters(ar);
>> +
>> +       /*
>> +        * Signal the radio as hard-blocked so userspace (e.g.
>> +        * wpa_supplicant, NetworkManager) stops looping scan and connect
>> +        * requests at a device the driver has already given up on. The
>> +        * state is cleared only when the driver is reloaded.
>> +        */
>> +       wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);
> 
> Using rfkill to signal the wedged state feels like an abuse of the
> interface. Have you seen similar handling in other wireless drivers?
> Wouldn't wiphy_unregister() be more appropriate here?

You can grep with 'wiphy_rfkill_set_hw_state' under 
'drivers/net/wireless' and you will see dozens of related calls.

We have tried wiphy_unregister() during internal review, which will 
generate a lot of call stacks(more than 20). wiphy_unregister() will 
call into ath10k to perform many operations, but at this point, the 
ath10k driver is no longer able to perform any behavior properly.



> 
>>   }
>>
>>   static void ath10k_core_recovery_check_work(struct work_struct *work)
>>
>> --
>> 2.34.1
>>



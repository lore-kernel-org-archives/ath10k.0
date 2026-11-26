Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13296606A31C
	for <ath10k@archiver.kernel.org>; Thu, 26 Nov 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EaPOI1hD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIqrv1xi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O1CV4V6H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qCeVeR1v3tRG+6HG8mO/Yh755lPb9lEu3E7k4tsScJU=; b=EaPOI1hDTtEN6x
	3xHNWtL+zyZpE1dadQqN0GyW/vlQ6Ukfd7/G9i7pN2tQQ4wUZ8YU7K/JLOjcK38xPM9sM4WujRQc8
	on0TrtMhgNZGyPbY9vdS1BhE1n9b87Z9pvL/Es2IODcf0eP/zevY59P4N5/vHBqQLuOIR1xNXg1Vd
	4tleKFug6WxKE44h2EhIe0nfnrZo3sN58N8U5MZmEY/sTgW3Tyz+dZ7JWLYOwU5lt3OOJpLnrvoHZ
	9nsEbg7Rxr69K6JjQVJO6nYR2X+yVvzMwwjdmmez5bg7aQAm1xSph2dGzpzRIs3QLJDE/fDqzNOtH
	OD6ARawxllhef9OrkcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWIz-0000000ChMG-0DPq;
	Thu, 26 Nov 2026 10:02:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWIj-0000000ChGG-2jYP
	for ath10k@lists.infradead.org;
	Thu, 26 Nov 2026 10:02:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B9IP2886602
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 10:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCeVeR1v3tRG+6HG8mO/Yh755lPb9lEu3E7k4tsScJU=; b=kIqrv1xiKm1lATnb
	V3fIs0LfKN1tWvpn+Rzju90yECmLYbecKJ2+6MwC6tPyzshP4iadV83QlBK3JWkA
	PUYDegmrQaMzgaUGIvh0nUqpUT2RtUg3FuGgYKIMayuoRCNmhw7H8yarU1/TogEB
	f5fSGSYPZhDS1NosH774tDGlEgAhFYTcd+01I1WGapWjETTrArTzy93VwqsrWYd+
	HWfg9tItIPomUiOuIrS5ITSC4ZoRhi1CP1B3ecT87ie7OdeYw/xjcirAIJoFRzfa
	e6ItWlW0vA90G89BgyIp/1Glhrq6mZNaPnL60mSyd68xgXw4/eHdGZsJem3DgXi8
	HmuV/w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgw97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 10:02:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so5891449a91.0
        for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 02:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687320; x=1796292120; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCeVeR1v3tRG+6HG8mO/Yh755lPb9lEu3E7k4tsScJU=;
        b=O1CV4V6HHomzfhJiqBId1Lebe/k/iCQmgV8/oKiB88+4npCbD2p1FVFzVNM/Hqv69s
         F4J+zvIE5pP7oF2zcFW5UhteQUwBvjNPzuvpQI2lriuAtvDCxDwvRuiY0iD3aqFITwJy
         LHyZm8wkDkjMiUY77B3XlGboKcJk15CySibDUO7TNgpl+Qu1yrkuQGbiZqWnR/Rre0+8
         jpvW/tOotUJXiyMjjV1D8cGPsrIYcbBerLasveyar2WLDUyFuk4NUOmjGDSKM5plIy6H
         rhoAZt1ZPj89Kj4QoJ6nc+P32VWLihsPXbTNEG99gcdmQFhMWvIZ78UsGtWxMfO8n//Z
         a70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687320; x=1796292120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCeVeR1v3tRG+6HG8mO/Yh755lPb9lEu3E7k4tsScJU=;
        b=obBrMq3eRkQ+cW3guVCeJUV8IQOnqn5I37CbSBl0pTJiR9fecwk7Gg6mThBz8QbN2U
         Yld0y72pcA2Jo8DKVXHJxNn9kUBuoi87TCOU4gQ5LWTKUSJMNrWErYZRMiZaV8yMNctn
         F0jvql3Ulg+/GpgJL7dnKq6kIfiHeiiZ9oxjZ2xrBjls/pTIMc1sKq8zdqT7VfCbd3PB
         q68r0ni633r3qDvlOtjuRU8QsM4vgFd4IDc75u61Ztpf7X76a7MnPaiblNCeW+j5YpPp
         VuxFSueR0H9EtWpbI3LJMYstg4GoYZ4Uz4AEp969aNvUeskadejYRP8Dfb6JLkrTp0bI
         0Oxg==
X-Forwarded-Encrypted: i=1; AL+hErHHFDYRbUH+lP8SgwPr0tYB8SyaxmFbbgyhSWsFxqKfUZYe0su953bX4BW1i+M82dH5Jo/idfw=@lists.infradead.org
X-Gm-Message-State: APuU4Z9GKMJypBh7Qe75ohDktCMhtKIcBtFRc6lq6YOM31C+fEOmQREC
	orPSN3yb721yx63s2vDlKQy8ErRG4hKD2IKGX9bS/DFWcOi+cwemz9388EdDJg6TY+YOu3WIi8m
	QKPgt3FiHObVCdQ+9JS2r88z6ep1eQYUV5JuX9WnRYhYIRGz9aO70rZj0hmxNqFZl
X-Gm-Gg: AZFdTZdSUxILLSE7Hbd5ogTwSYCMnO+7MCbzZIPryNV9x+Kg74Uu/VQEFh9XTkGI3hP
	0jgLuX2smFUsiDpIgvzLYG+Pq6HgH7qJ/+df7dTNNYh1uAo1hWg25MNt5/iheb24nfX43FGJjZV
	WJyAv8/zPTerJ+j8nf7AmdvF+jkufBwTW2/rRl/ktRjy5Jiwp5aWkfAqCMlaT2OiT7wzqxEv/Zu
	XfadJ6YwqH84f6blRmJNqF+rJOLt46dILP82V0+uYomfyWPiWpTuqIxiNEkcxf6/Aweu19Bun2M
	ypcFeLco5CusXCYIGRa0yPseslNOXm9gX1ZSFGloc2Qcu0QmCnrI/0hZAyJbOttExqmsepg9vxM
	pHKXVuRuuhFiXdnby8+b8AXJ2LMIWeDa1u/rHZWKViOdCHQv9fGPn/2i5wnhJrSZNN42Makcehq
	T0RmOq29/FREviucTN+nIRoa1YzkwGzH6ijYmcRFX4
X-Received: by 2002:a17:90b:1dcd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b41cb3e4b9mr15845862a91.58.1795687320309;
        Thu, 26 Nov 2026 02:02:00 -0800 (PST)
X-Received: by 2002:a17:90b:1dcd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b41cb3e4b9mr15845831a91.58.1795687319727;
        Thu, 26 Nov 2026 02:01:59 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d002a77sm10286301a12.16.2026.11.26.02.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:01:59 -0800 (PST)
Message-ID: <5a38be6e-09a5-4955-bc96-190a9ae33c2a@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:01:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 10/10] wifi: ath10k: drop async writes and
 sleep timer across power cycles
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
 <6dbec0cb-ac36-41b6-9a8b-12da800222ab@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <6dbec0cb-ac36-41b6-9a8b-12da800222ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX9TuxBpg8v/Cp
 pfwYKNNsCWeBlylfcGqW3U6iPLXvbmw5qcY8RK21j253qy9w2WqUfRat6GwM5EbnkM1wixTKMqf
 Gl9MWM0AT2CvNeh3EwUH5nlAlmEO3fnHchN8kyJiEP/J0VxhHjh7quOhP6ROiFMAXhHxuNPcdG4
 x29F4UGVGgGCKHMq1vfkJaeAYUWiqUcrFeVI4iJRpEkdKUhRBkMrREFonSvmsKic6B92Euu8r5W
 mRBhghTQhZYFLNyRcw1E1VOzuWKZp1OX/zOBBYC253PTqkDBLmVhCc0HyCFh1SKiblr2q4BhmSz
 au0TJWd/nqPkgLfpWAmc/TxC0kPpZqgFqBsTquw1jnYCzFy4XukeKJ4qCwddP0VPJ+GGBFa8OBU
 g09Gr8DG3/rk3IUfy0lHQWowEWsqXaL/OthPdCaCb5kCENBAUUkEEPRfBOLXJP2jK4y8PerRrDE
 LCjOnAP+p9mAANJ47Bw==
X-Proofpoint-GUID: 0CTgzN3v5BF9AynD_gtanSeOTO1s9nhQ
X-Proofpoint-ORIG-GUID: 0CTgzN3v5BF9AynD_gtanSeOTO1s9nhQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXx8dOh6i2mOeX
 2Fi+05HJ4vBJVD8MQEQH+vYIPoV/1XfOnIx0ZS1l7PZJpm6gWi8wCiZgs1r2QujUAljbHEuX7FS
 L7yvCueAQN4SSFWp0X7DvlNwn3ChhZo=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b080399 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2bedrVyz5QLRwlh5c10A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_020208_487734_95439143 
X-CRM114-Status: GOOD (  24.45  )
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



On 11/26/2026 4:37 PM, Baochen Qiang wrote:
> 
> 
> On 11/20/2026 4:41 PM, Kang Yang wrote:
>> ath10k_sdio_hif_tx_sg() queues writes on ar_sdio->wr_asyncq and
>> schedules wr_async_work. The SDIO sleep timer also schedules this
>> work, and the work may re-arm the timer.
>>
>> The current shutdown sequence does not prevent this activity from
>> surviving an SDIO power cycle:
>>
>>    - ath10k_sdio_hif_stop() drains wr_asyncq once, but new writes may
>>      still be queued before the card is marked disabled.
>>
>>    - ath10k_sdio_hif_power_down() deletes the sleep timer but does not
>>      cancel wr_async_work.
>>
>>    - ath10k_sdio_hif_power_up() does not clear work or requests left
>>      from the previous power cycle.
>>
>> As a result, stale work may access the SDIO bus while the device is
>> being reinitialized in BMI mode, causing errors such as:
>>
>>        failed to read from address 0x868: -110
>>        failed to read fifo/chip control register: -110
>>        bmi communication timeout
>>        could not write board data (-110)
>>
>> Mark the card disabled before power-down begins so new asynchronous
>> transfers are rejected. Make wr_async_work drop requests that raced
>> with the state change instead of accessing the bus.
>>
>> Synchronize the sleep timer and wr_async_work, then drain wr_asyncq
>> during both power-down and power-up so no request from an earlier
>> power cycle can run during BMI initialization. Factor the queue
>> cleanup into a helper shared with ath10k_sdio_hif_stop().
>>
>> A dropped request is completed the same way as a written one, only
>> without the bus access. HTC messages go through
>> ath10k_htc_notify_tx_completion(), which lets the endpoint release the
>> skb. The IRQ disable request signals its completion and leaves the skb
>> to the waiter, which frees it. Every bus request is returned to the
>> free pool, so nothing is leaked.
>>
>> As a result, ath10k_sdio_hif_stop() no longer frees the skb of a
>> non-HTC request itself. The IRQ disable request is the only such
>> request, and its skb is owned by its waiter.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/sdio.c | 78 ++++++++++++++++++++++++----------
>>   1 file changed, 56 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
>> index fdf19ce4b55b..f0e1feacb629 100644
>> --- a/drivers/net/wireless/ath/ath10k/sdio.c
>> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
>> @@ -1461,6 +1461,33 @@ static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
>>   	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
>>   }
>>   
>> +/* Drop any requests still queued on wr_asyncq without touching the bus.
>> + * Caller must ensure wr_async_work is not running concurrently.
>> + */
>> +static void ath10k_sdio_drop_wr_async_reqs(struct ath10k *ar)
>> +{
>> +	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
>> +	struct ath10k_sdio_bus_request *req, *tmp_req;
>> +
>> +	spin_lock_bh(&ar_sdio->wr_async_lock);
>> +
>> +	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
>> +		struct ath10k_htc_ep *ep;
>> +
>> +		list_del(&req->list);
>> +
>> +		if (req->htc_msg) {
>> +			ep = &ar->htc.endpoint[req->eid];
>> +			ath10k_htc_notify_tx_completion(ep, req->skb);
>> +		} else if (req->comp) {
>> +			complete(req->comp);
> 
> In ath10k_sdio_irq_disable(), irqs_disabled_comp is on the stack. If
> wait_for_completion_timeout() expires, the function frees the skb and returns while the
> request may still be on wr_asyncq. ath10k_sdio_hif_stop() then reaches this branch and
> calls complete() on a dead stack frame.

This seems to be a pre-exist issue.
Got it, will add a check/clean for this case.




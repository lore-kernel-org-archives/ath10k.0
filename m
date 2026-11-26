Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAB5606A338
	for <ath10k@archiver.kernel.org>; Thu, 26 Nov 2026 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GFaauVP4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IYh90MYQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e84OYwAg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=; b=GFaauVP4GKA7s0
	jfQVlRWNEp/H+MCXGGUbIb4hfcNv+v2NbCYN0Wzn1uVKLhwPw9SkdYnpFZ8JY4yys/jB+P7zAzpgs
	eXdAwcYSPdPC6RxBTuPyHHBQ8qt3EMoHt+g3B0ItJYaT3mR0mri1QN4vR5siNUCyAX1Slf5T/O21W
	MVza4TQd8xp/7JkkCQKvo/+opH1E21UHaHmHM8B7X8SvMa1Zj+p/LoWxLOMQMmCBWT6+v36sQJ/dm
	vxrl0UeQl/c984crMyC+0eJ1YnVEV1UMxMpCOQs6XzdqsQh6B9wmGY49hadFnATAAo6UH1p19DE9W
	0t7VYuJHNnqz55QXMHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUzT-0000000CPrD-16Jp;
	Thu, 26 Nov 2026 08:38:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUzQ-0000000CPqt-2d76
	for ath10k@lists.infradead.org;
	Thu, 26 Nov 2026 08:38:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BFVZ3315181
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 08:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=; b=IYh90MYQ3BooydPj
	lmmICp9sjXDYkua6k/s54aDqw+LTxDcRg6AthdPfGBeBxL4bb/fragqUeC9pXY5y
	q2FSXB7rRA/jLI08D+1qaw52bMEV6YeYEzA5Gl1jp9hwjzJV2FcsWnlizajRcpAa
	eNgzdTV6NYp9V8OQAVYp3ro8tmrrlNiVyJUjeZOR6nGyfIpqCLVFHf5O9EXmW/SR
	urSHgK63WakQeerxufqly3AxOWF+C59i22XIOTF6fvExOqecSVF3scELaNHrmsIt
	dLGl94V4yDJFrm01BGUr7UzhXn9kkdjPokYedGIT/L1WuMUtFr2TBxorERYe4QAP
	fkQRIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnvnv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 08:37:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b44bcdb096so4854670a91.2
        for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 00:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795682278; x=1796287078; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=;
        b=e84OYwAgAwBX9dS9QStptATb7he8R1B5+GXbRoRMAXfq3WukCa9xqhIHm5Ku/G/Ybk
         vIEwxl7LBvrH7mH+QtPx26FiVXzE3PtdCWE0NmMgKeCKcjcNF/mNxXy6eT+PWM26OcAW
         6hqSx76KiQCVl5NhPfGtzUrLnUChpElLb1uvQ89aBbwjN+WHqK1JqVZFdDQ9k/KhjIpg
         d0rZgQz19HA3pl5wUCmTwOReDB264f7GIzjNsL3KAjlGaigeXjrsgOjocMZ6yxXU68Iw
         eDn5tSq9FaQP8V0U6UImVM39zoJxTmSeWAvJAhZJlBbYBkvN92GvPr+wJjNdqhj8cJCd
         ZllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682278; x=1796287078;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=;
        b=t4uQVwbwTC+ytDDAo3Fccmi1TzUmoKWIjim1Q4Dt02Gg+6Xa7HPEbbr5LaP1HCq0Jb
         89zfQaP0uz8+mgmMZ1AmnQhF9xF5s2rSXNWVhsmSFKeEO6UIozLeXHDc2MP4r21aQdvU
         as537yzkBQ8X84NMXiQHIXPLavfteT0HKCE0W5KwSdYUDuKO5gksOfSlNcI+BGltwdnq
         h2WMU9DNbPqyLOPTpr5U73M3FZ+Qd5Eirs7B6Ys/Rr5VoDP6LWUrKIZUzBnVRny5xaqt
         OJn8lPTZ9eIrBVFd/jpo+lEyWvzBb3fQECL5X8Y51d7BARXCbTYUpO8KBcFCqqXykxFS
         vPUQ==
X-Forwarded-Encrypted: i=1; AL+hErGEJ8ClS+NWX2vrWt00jA4M6wHnBUtLyBrXbL5keQ/VVBOyuU/jKEFpIfpIf4zv5jmBQLktw8Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z/n3kF66N69I2DPyiAz4RmBtqlcXkDLZ+xZ00SgzOHGJ2fIAh+b
	yRQgTfcsgg7KATSBkNuu5qGCM7QWKk3VH41Pk1ieCAsRaO8IGfWzftiX661lYi+B2VVq+Uhj1z1
	tbZo9LQ+lEkUyMFdJHa32ENxpH/tyU5A6CkiogCZD3PZu9fvXeHvXGEhfpCUiA6XW
X-Gm-Gg: AZFdTZed/C2D0km19zc3YSeLem32uzmxwyGlwKUwVr8qJx8XbX0PpXq7400Gu/gHFtx
	hhFGI7wMwEU41wHb/PDS/Xy0BdqrmfuM/u/NYQQpr0JT5n64jCk/jCPSwepieXZ7f05LEv1Ws+Y
	s2fsSseL1CQXn3OqhWSdmDPfYYzGLO2oFBs/IfyCq9I7XhldbmguI1zEM8iM+KoDHzyDdFdDemJ
	TZSh9li1lgkD9hO0E6VxOFweDTMmAiiJEBIqoKlQ5W4B3Pydgh8FXunufI8tJXenrkR3GrVCW37
	Eg1mYPOvIY0q9/IM811Qj2ZXrn5wszTYow4X77PtkRgRDFaDD5t+7i/Cp47Mxo56CtulGv/qpUs
	DvI7c7abKtX8C5crrKKTj0Gxqg57ttXHbMCat3xdt3Jtlle6yY3Jm+2ocEj/ux8SKiWeUm4IuE7
	vbkCuB
X-Received: by 2002:a17:90b:5289:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3b41c92c416mr21023351a91.42.1795682278161;
        Thu, 26 Nov 2026 00:37:58 -0800 (PST)
X-Received: by 2002:a17:90b:5289:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3b41c92c416mr21023325a91.42.1795682277617;
        Thu, 26 Nov 2026 00:37:57 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm4170993a91.4.2026.11.26.00.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:37:57 -0800 (PST)
Message-ID: <6dbec0cb-ac36-41b6-9a8b-12da800222ab@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:37:53 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 10/10] wifi: ath10k: drop async writes and
 sleep timer across power cycles
To: Kang Yang <kang.yang@oss.qualcomm.com>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfXwEiQKuzWFHne
 Z+KwOAgH3mQapXHtsbieT06g5IJbXaXorMtUVlx6Ieln/lrIwmHCFdcXWXu/sfw3L4Mnn8HQqU9
 Of84GwD3cj5MSNHay3nvXcjMA27Kn+wwcDF7FnzJ5/yeas+Vd/BA9i2kPOr9FeLGAtcBnHooSOr
 Q3NC9sS+0y/0PPOGDSOYJF5iTcwJIwBTca/GukZpEliEcuIKvQODxHwneSxJfukYHQbv7fBxcYq
 8n8MOnw8naLDzzsxZIT2Mcf0ZEvkfFIE7/O/Ik4Vx4TdwiLCVt2JrNcls7eVChF5sGE8Q1lgZFn
 SMwyF6jxCodqV4GtMyhcuYDuojPVKbyW5Uy+xAvwu6pg2PGaDTWEJOZJMVWYefIhgyXlyB6bYrA
 S2MSyzQJ1yvvfRzgekTKZaPAj3LntnKcasuQNHSMXMpuFmu6N1Vh8GaoDjDg4WbLy8jUGdBRgoe
 6WdskJvjiP9nPyk0DIA==
X-Proofpoint-ORIG-GUID: 8mvB_uYaIUx5-B3iJlzL0rAQ302ayR-K
X-Proofpoint-GUID: 8mvB_uYaIUx5-B3iJlzL0rAQ302ayR-K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX+tI10prltit2
 T4/dz0UytZl+at3dsKN26m4xX94rO0smDxD5Pn6y931yrT6p4EFEqB53RcKB9cbTGq1AX7MxuiY
 fpbIa7uY0zdDpstuN8Lu/ahGvgzWTbs=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07efe7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QFfjU7qKHf57nAPH7roA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_003800_797393_B578578F 
X-CRM114-Status: GOOD (  28.39  )
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



On 11/20/2026 4:41 PM, Kang Yang wrote:
> ath10k_sdio_hif_tx_sg() queues writes on ar_sdio->wr_asyncq and
> schedules wr_async_work. The SDIO sleep timer also schedules this
> work, and the work may re-arm the timer.
> 
> The current shutdown sequence does not prevent this activity from
> surviving an SDIO power cycle:
> 
>   - ath10k_sdio_hif_stop() drains wr_asyncq once, but new writes may
>     still be queued before the card is marked disabled.
> 
>   - ath10k_sdio_hif_power_down() deletes the sleep timer but does not
>     cancel wr_async_work.
> 
>   - ath10k_sdio_hif_power_up() does not clear work or requests left
>     from the previous power cycle.
> 
> As a result, stale work may access the SDIO bus while the device is
> being reinitialized in BMI mode, causing errors such as:
> 
>       failed to read from address 0x868: -110
>       failed to read fifo/chip control register: -110
>       bmi communication timeout
>       could not write board data (-110)
> 
> Mark the card disabled before power-down begins so new asynchronous
> transfers are rejected. Make wr_async_work drop requests that raced
> with the state change instead of accessing the bus.
> 
> Synchronize the sleep timer and wr_async_work, then drain wr_asyncq
> during both power-down and power-up so no request from an earlier
> power cycle can run during BMI initialization. Factor the queue
> cleanup into a helper shared with ath10k_sdio_hif_stop().
> 
> A dropped request is completed the same way as a written one, only
> without the bus access. HTC messages go through
> ath10k_htc_notify_tx_completion(), which lets the endpoint release the
> skb. The IRQ disable request signals its completion and leaves the skb
> to the waiter, which frees it. Every bus request is returned to the
> free pool, so nothing is leaked.
> 
> As a result, ath10k_sdio_hif_stop() no longer frees the skb of a
> non-HTC request itself. The IRQ disable request is the only such
> request, and its skb is owned by its waiter.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 78 ++++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index fdf19ce4b55b..f0e1feacb629 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -1461,6 +1461,33 @@ static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
>  	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
>  }
>  
> +/* Drop any requests still queued on wr_asyncq without touching the bus.
> + * Caller must ensure wr_async_work is not running concurrently.
> + */
> +static void ath10k_sdio_drop_wr_async_reqs(struct ath10k *ar)
> +{
> +	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct ath10k_sdio_bus_request *req, *tmp_req;
> +
> +	spin_lock_bh(&ar_sdio->wr_async_lock);
> +
> +	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
> +		struct ath10k_htc_ep *ep;
> +
> +		list_del(&req->list);
> +
> +		if (req->htc_msg) {
> +			ep = &ar->htc.endpoint[req->eid];
> +			ath10k_htc_notify_tx_completion(ep, req->skb);
> +		} else if (req->comp) {
> +			complete(req->comp);

In ath10k_sdio_irq_disable(), irqs_disabled_comp is on the stack. If
wait_for_completion_timeout() expires, the function frees the skb and returns while the
request may still be on wr_asyncq. ath10k_sdio_hif_stop() then reaches this branch and
calls complete() on a dead stack frame.


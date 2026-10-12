Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F3ACA9ED0
	for <ath10k@archiver.kernel.org>; Mon, 12 Oct 2026 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=; b=d/KIJJdvjGWwnFdNdPQ6Df22My
	TbaDWFqozn7sfB/NS6gEioubqC3rH9IOhcsK1LLmIYVKIOwAWckDUPklDPOm2uPRDTR0En+oUx8VV
	oDWSFe4P6wLnSqrmUEDtbPJqr0OBlGm2N6qWXON6T9XoQnUjvEU6hppI12qsYYvbnPVeyLLHZMayI
	Uz58KRuOy8oIGNTBV3dODnORG/HiWxGO7LzlvxFLEinIZxjveZZRxcvLcb06XtozbW2LMdkgzavxK
	Df+WTr6nVyidgKu5zMTl9s99+Gl3O+O0PW2Gxh/JsO65PF8DSdM3pc55LvNpzCccq5gWRIb8iiXDM
	lwcBqedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIOm-0000000Atui-10qT;
	Mon, 12 Oct 2026 15:57:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIOi-0000000Atsf-1V15
	for ath10k@lists.infradead.org;
	Mon, 12 Oct 2026 15:57:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFetkY2575515
	for <ath10k@lists.infradead.org>; Mon, 12 Oct 2026 15:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=; b=k61Izvj09J1i+SqK
	8HOyPyrhPWM5o48Xpp6VeHi1PN1kYW5jrd0j+Jkikj6pN32BBLCcAaT28WenGhpv
	x0xr9UvGcaQesmhxzHOo9bD+hWqAjJqOAjoPJFkN+E1XvfPw0AjopP2Lih5l1O+m
	o+g76c78MrXjaQq7X4K7ap6iIL21bjJ7nZtDLfIx8LF4XU6e/UVAw5uhuwNHLRM2
	8ISjJNCceqoWLDqgZr22Vio9NZuJG+CLfKSRDG7Si4ENxvye0oHL5c8vCvVUshC4
	N60mgs+dUv7Nesz4+tZBOE8oE/FYAmCLjjBPktR/52wEEqGCYNo73tDU2r4/n4Fz
	JDrxnA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2r79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 12 Oct 2026 15:57:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so5788497eec.1
        for <ath10k@lists.infradead.org>; Mon, 12 Oct 2026 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820626; x=1792425426; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=;
        b=DDNpmw6gZF9xXVUGG+CoaeHsvEyEtMQ+V9cRaT3zYM7SPMyaOaNCWfBDshp48REvi8
         Px679jsVDxtqDPCdIDOzWAPHgy8y30qQjss+8A0bC5F4Rx59jecfO9c54Igk/b1hVrpK
         pGNzp3u319wEPQcC+WAkpQHCNnczPOTLjJ6zdxRz+cPxiE0cpwGPCY374jWXx78P6yxl
         32IizfqkiyRVmAeK2WGWHFihrLq1uVBSnUKksSek/qsJ3kmQrApijBHDGQnans7sHb/Y
         7nI1YPFm9gE0RnsZS3jQ/mXMVlmtjveQ5FmtvhqFuDO3QZoeR9Saf0qqcK/Cb23d4ftJ
         Z+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820626; x=1792425426;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=;
        b=oOBk6Z2/heNTunCy3ofop+2Rlde/x9CYExAkBP1EJCqJg1nJ3xWBIHQF8y4GlC9d3Y
         FUocBA1b92YFUughoQtOCJxoyFavrwFcyMYnguy9TArSmJ7UlteNUTX8JwLy+O2U+myZ
         7fvOCMZtAuvnk3X22x/nzcP/r5affI7oXUzam9YQtWfyMyXvsXe8tUw3aaUBjioWr+c+
         dMaySvWRj050gOjW6gpmE8mhblIAkUACnBfnfTDXBl5U7V61ghvlN7t/FmXTxizc5wtY
         mUdbXA5yfSZ/1vb4YIzjrqcqA5XF+fvkGZ0Q/T+b6RXOfvS9Gdj2wYgZR+qrU7jgOkDT
         EgMw==
X-Forwarded-Encrypted: i=1; AKwUvByCxYozgNeu7IAd9gw5ACCxdJFd5tPUs5ZTt9DMB3iV2Oln5UG5FdxaDCDlSZRH5rgoCqoGE8s=@lists.infradead.org
X-Gm-Message-State: AFq9FYLCV5XgPi2UEA1LQusVQayVMOgzUuHUNhWH/tfzhYx+CnmrYdtF
	j7DmU5ttZBU0Lpmmx6Wtj8q2soOS3rLyDTyokdvlAQuKIhfFSEU5B2/WcH9Kb4MI2DQdWip4bee
	vT2NdCQ1EmM33vXR/rDh9k8tAHNpoO5vgObWsRPmAF6hgMlIthtFzQaAYbIRvFhB4
X-Gm-Gg: AYBFou0bG3PucOgnU2JHu18+aG8ennpc4FTwpd2DPXajb7S8BN6xfKYjk11BfodGVMm
	AwWM9WX0SNVs7Pa++j/WizFnI7dkVu1T6DD3+aISacdPX0qxqxtSWAAEcKAhapFvl2nXQMt2Fai
	8eRXZ0M9hZw2BxGb2LiifTlLFFwKNiI6MdBKGJCfzg4JS+0HXougVsTueh0/ZMBCB6wQJUIjMPs
	lsXeb0xV2nlW3dx27+pn+lCMRoIXvs44QSoMLBlUabH8WHJD0FzabI5LSHgURq5fOo8YB199OdT
	uwdkR7lBJ4asMUvoqmosZUACcLIG7EWlz6GZfcAT+d3w/gn8Zvf21NgIDMakJjBrz545VMAVyM5
	bdxEBNNR+gNtKC3ydDdMYN8VtFxXgLCCi9PVTR99SiJA=
X-Received: by 2002:a05:7301:4546:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-3537e033fd4mr12292577eec.9.1791820626067;
        Mon, 12 Oct 2026 08:57:06 -0700 (PDT)
X-Received: by 2002:a05:7301:4546:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-3537e033fd4mr12292555eec.9.1791820625436;
        Mon, 12 Oct 2026 08:57:05 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm39386183eec.18.2026.10.12.08.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:57:05 -0700 (PDT)
Message-ID: <193ecf72-5e41-4106-9cd7-8ba287642148@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 21:26:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior
 <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acd0353 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2dOy96dDxX5ttOVY4VAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX9C+eI/0I0b5H
 qSPXWt7FI67ujdDH8XHc3NqH4guOF0+oImGgQQEgsO3y2UfPbpKTPHy7QG1DVhNKgjrw4EsPATL
 JJIIwKsh5G4wSRnzulrCZ0FF/6vy3Y+NDy0K0w19D4i0YeiFZIufpJ00xuMSTp1ZkVXrQG09qgA
 rUDnj+YZ156Fbqq3zqs/ymI0H9+8hoGdiJkbVYK6lBG8n6c9VcDxlTPQZNSopkfMA4CksLMWrv7
 wu6kTqEOvwCaxpqTFzHBUox5FX5czR0DP/x568Ym6SnpyvihtwDJw8QMGbYC4geyYf6qiZjH8/6
 2rnGU3qIwdclFWhe0BnQKpzqRUk5zbJLTXmYCNj+tro5purn0RrCWv8Z8lDg+gzHOiOEL3EoBLB
 tJ534r8aQNg+kt5gPB8xn5ZgczyxWpa7VkOmyzYSfjo9ENZjlJdsVIfX8cn+wKCpHyqnlH0+rLp
 J8AkHJ4OHNSwsqGnD1g==
X-Proofpoint-ORIG-GUID: DAuvjg0R7ppc3fs8nTKQbV_vPx9NZw2H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX9ln2FBJZgQk1
 DigKRA2TO3I5GVjlVjxtcupBmAPOMt05WmY8jrUn72iJlYN2+9pZZQEwQ/ASFppcU/+jH5sk0JG
 2tP6vv7pNqlW9wM09C19fRdQ0ykoOU8=
X-Proofpoint-GUID: DAuvjg0R7ppc3fs8nTKQbV_vPx9NZw2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_085708_507762_5714B470 
X-CRM114-Status: GOOD (  13.69  )
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

On 10/3/2026 2:50 PM, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> Changes in v2:
> - Rework the ath11k and ath12k pending management TX cleanup patches to
>    remove each IDR entry before freeing its skb, as pointed out by
>    Rameshkumar and Jeff.
> - Use idr_for_each_entry() for the pending cleanup callers instead of
>    leaving freed skb pointers in the IDR until idr_destroy().
> 
> Jiale Yao (5):
>    wifi: ath10k: avoid IDR mutation during TX cleanup
>    wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>    wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>    wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>    wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
> 
>   drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>   drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>   drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>   drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>   drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>   drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>   drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>   7 files changed, 44 insertions(+), 39 deletions(-)
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


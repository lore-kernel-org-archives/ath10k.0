Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F78C43327
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URtox8zEzP/untTK+3HtClYPfjcDlUxDwjjp/zQVHfE=; b=pO0ejemC0pQJnm3PlraPrRSULh
	hhoINpuP5zSBXOQty+FmyJqgxRBsvzkrO441h6v8DPg7qNTE2CiVgS339YMe5tvPR/mQUuVf65+DV
	KDNmMloUvF6lsVLCIZE9i7pOReBWV6c+HSiK+FHzlQn9OwQ1SygWROvQZiAFbxQLgjNShwsAF6P17
	iLGTBsxZer22R3I1apZZC6byN1SocpLCX/QsQimOq5ftxVWS0eMO47UsBPGPLL6EdqzRJtTRh7woz
	pUnOc6DOdrsaVMcfFybu7x0duth0Jcn061V7fvBjmAvvy6FRNgM2woh+EmHNAaUi1QplI7h2QwS9F
	CYbFE2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesyh-00000001RhD-2LwA;
	Wed, 01 Jul 2026 11:19:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesyg-00000001Rh6-2kNz
	for ath10k@bombadil.infradead.org;
	Wed, 01 Jul 2026 11:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=URtox8zEzP/untTK+3HtClYPfjcDlUxDwjjp/zQVHfE=; b=mL710aXYLmXfTghpIt+o5wynuJ
	tjPgkMp16kKP5GbbA+J12d9/xBEiV/l5KAWRrhEV62HgxPJ0ouSmCVpl90k7awusDltXkeQr+uLD3
	w2CudR1EEyt6oIhOJPwtON2IXQemqWyS7N86hEp/45jChXO1ctfLeFpxMtmAG9KvaRH/uyq2UUiBv
	Yzz1KDWZnnnjC381f8wjvPKIAuz/Opnshup0PcabjzNkGIEGiq4W/nSBb4n9osCyk+IIqsDLqCZ4x
	0Wag7t0CXXfnkE8T56Zwdis8l1ktlVPNk2OBM94KRJrILJKikEzIuL7D+r+hpvpcdwOR06G58T1ts
	LGzU6Zng==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wesyd-00000002g0e-1pwZ
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 11:19:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8v5r753558
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 11:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URtox8zEzP/untTK+3HtClYPfjcDlUxDwjjp/zQVHfE=; b=gwxZyeylLOdVJC5D
	nuiZH2uaPci7Kc/y5/kYSdu7RKfA7lOmveWJy1VW4oLWcuH5fgjB1NchLw0Ke0dB
	UTygydJC/Obd+YoZgeo7oAUK8CXqIFKcX/nwHed63IOvth5hm1ULhYCZe82PI5BZ
	RlRRg5A//oin8Om9NSrqlkktK7tKPHQLLLKipvVr3iYaXvt6uAtRMLVGRPINW8fk
	pBCYjpq/e/ILwtMuiDELUSRDXVl0dBy4raERAUgi8GDprDV+Hvmv7CyPETGSejji
	0A8KVrbPAPM7jw/ECj54GWkVvVpLsbR6U2kaDO/345lDmguhzCoiTY5cEcdMXOzn
	t/WJSA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy2dc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 11:19:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c08e9c344so1500361cf.3
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 04:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782904772; x=1783509572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URtox8zEzP/untTK+3HtClYPfjcDlUxDwjjp/zQVHfE=;
        b=kUpqkoaCwNdLnLTgbfzZfHAMjAc+jGyH2OGJMWr4d038ZAxQUgfYRiytC1l5W0deV/
         ptC8PYwCr3KbLJVti4V/JvIo8HMQ5ykYsNnihecuvqE/m7NS+hRN2EnKRiWMxCzO1Kmm
         JY12ITfTZgb/uH5Q5HOsacTY0PO16sJYqku3/UyRVHW65lGti/Bycw4+uPfeHgRD0aZR
         Wy9PbEfpaBCYc7VR4bSHb8T3knA1284N1kupG5I+mGzg3vSdcxtRP+SmDe7wq965sBoI
         04SQX4mdP8Vyx7Kri6QKIvOyYfeKPZ79aUOgHn6j4pPtAYQPuY0Q6X06jTXj43TLUtv8
         45Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904772; x=1783509572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URtox8zEzP/untTK+3HtClYPfjcDlUxDwjjp/zQVHfE=;
        b=VxBMoXW8emszBPYRxWtuPlfQEiF0E9p5+chbjnKMm0whqb182IAz1RwtzzIbHAGiqq
         feXB7AtOv9OiQmu/2tYzOKYnG8NIsW8GmFwb/4T1crcXM/6zKgTYi+SMnueRWraLLvpb
         R+f8huXN3nOZ5e17ZA4ks8VTiVTK2RLey7ybKCx0TE7qn021EAGsvie+i/df8Rv0Ih4M
         dxgnMweGbrO6kej2IfnjtmnBngLFFMiX+64J7kTYr5r/efIEAqpJrStv+JcjqGrnti4s
         vp0w27TKDXmKxLObTxwyRxnl6ogo/2WaT6y8COd2X3Yx4EcYUWwY5pfa0fpzhBh5dR18
         ZtaA==
X-Forwarded-Encrypted: i=1; AFNElJ+lBn3qKIX1XraPqqcdDqdQseYzVMSYzxH6qVFiXgv1v3iaUm0hMAxP7ZBrQiL8IP8o7clakl4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxE/zhjcqJ2oYe6XstDksWCzdQem97RRTrsPq5SYDcaC1SLcYuY
	h5H50VCJty5vrGB5gbsy5189mEEpHD8Qx0gH3Y+gAAu5x4LYvMMAXElKgnP32ZIzVb2OqwhfY2w
	ETXPOcq6GB276jERQndZtIEjrYIg7bR2Aak0Pr/X72O+tW6/JXcVxUdYibpMfK6Uz
X-Gm-Gg: AfdE7cm8bl0mvwjkqYd1ErSZTypCpAwVFP0tjA5od+qJXSNxfo6rZP/uciaCs/hSQD8
	x4QJQusZUUuZRV01cHQgnNknGGgFzZd3O4vqRL4vil43NcRjuEAG9SOUUG3fLGfbgtwnBntLMfS
	NAxrMVX0kxN6IBw8qE9rgjIWHCxSOZwjpEfoCUXAtlnEMmly/+miwliD7quHOlDJrJq7UM4fRL3
	4UrBXNKa+jhOhE3V5Oggu/QwRpSxNEsaPfQn+V+xQ2KSTHrBv6RMB1J8Rkd4YLWtEm2xjHdV4PI
	LOgm+G/z15/ah6UmWueWfbEioIwK7Q6Z4zSV7cg+hw2mcf6e1WgE1QocMww0f+FZKZQYquJJ+Z/
	smd3rynw8FKSmbTaKEraErDTrPtCgt99dyuE=
X-Received: by 2002:a05:622a:14d1:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c26b42202mr8376101cf.11.1782904772050;
        Wed, 01 Jul 2026 04:19:32 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c26b42202mr8375671cf.11.1782904771316;
        Wed, 01 Jul 2026 04:19:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6b068sm261505466b.25.2026.07.01.04.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:19:30 -0700 (PDT)
Message-ID: <597fac9c-8522-449a-891c-2935382c0cd6@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based
 HCI driver
To: george.moussalem@outlook.com, Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Saravana Kannan
 <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-4-02770f03b6bb@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-ipq5018-bluetooth-v2-4-02770f03b6bb@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L2IfXfMxXfeN33T2-hElA_JaC9Ac85pY
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44f7c4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=ZNUA0hKuP8YIc2uBTmcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExOSBTYWx0ZWRfX1HghD+MdbW42
 2+mvkF7CJ70d4cBPlbCrrjk3bLx6GO9J+AfT7UUc3RsuqIFPP0axsUl8vQmG+ahQNSn++arK9RU
 ctRnm405hXSvZtoKQwvsyCBGeixXGkangZ1Euc86utdRM7g6QqUFaFPknJ0ASL1aloS8JLBr8Zt
 nwoO1rEOrF2fwDrq4jBt0PPqVKeR8mnv1l/1S2+kxIa9IutADWy/3lIDCEIJUgIrz2E/lVIRKFU
 94TxlPBLnEPOj48aFMpCwBS3c7VsYMwtOYNWfQryDtqZhEPsBuP5q9GoPfA6Sbpl8gJbRKo7zhY
 5wp1bVWPs0svPxG6yqmSZg3j78TkfM91bVRr/9/yTkOqXOZc+Rf/SfmH4//PpIUC+7Koki0ubQx
 PzCxI/au7409aeyQmPCXM9Y3NkmJPMOWDHHw+2vNeWw981bEEmz0bLL5xWqor627UVe2uE0dlhC
 sAskw8B5iu3F6NWPX4A==
X-Proofpoint-ORIG-GUID: L2IfXfMxXfeN33T2-hElA_JaC9Ac85pY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExOSBTYWx0ZWRfX808cX+G0w/eM
 gXzxsDpGnN8vNzZNyywMmCDdz6B0gjARRvVD1fwOevpdcerX8MrTQQbgbtWzrWGxFAM1Y9vtL3s
 QsHfiEtGikxOmBnSBduRKaSdB9BpuPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_121935_803419_8AF3E51C 
X-CRM114-Status: GOOD (  19.36  )
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

On 6/29/26 3:01 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the Bluetooth controller found in the IPQ5018 SoC.
> This driver implements firmware loading and the transport layer between
> the HCI core and the Bluetooth controller.
> 
> The firmware is loaded by the host into the dedicated reserved memory
> carveout and authenticated by TrustZone. A Secure Channel Manager (SCM)
> call safely brings the peripheral core out of reset.
> 
> A shared memory ring buffer topology handles runtime data frame
> transport between the host APSS and the controller.
> 
> An outgoing APCS IPC bit and an incoming GIC interrupt handle host/guest
> signaling.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/elf.h>
> +#include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/skbuff.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>

I don't know for sure, but the amount of the includes suggests some may
be unnecessary

[...]

> +static void btqcomipc_update_stats(struct hci_dev *hdev, struct sk_buff *skb);

I don't think the forward-declaration is necessary


> +static struct ring_buffer_info *btss_get_tx_rbuf(struct qcom_btss *desc,
> +						 bool *is_sbuf_full)
> +{
> +	u8 idx;
> +	struct ring_buffer_info *rinfo;
> +
> +	for (rinfo = &(desc->tx_ctxt->sring_buf_info);	rinfo != NULL;
> +		rinfo = (struct ring_buffer_info *)(uintptr_t)(rinfo->next)) {
> +		idx = (rinfo->widx + 1) % (desc->tx_ctxt->smsg_buf_cnt);

That's one complex for-loop! Maybe move the assignments into the loop body

[...]

> +	/* Account for HCI packet type as it's not included in the skb payload */
> +	len = (skb) ? skb->len + 1 : 0;

Unnecessary parentheses, also in some other places

> +	memset(&aux_ptr, 0, sizeof(struct ipc_aux_ptr));

You can do aux_ptr = { } at declaration

Konrad


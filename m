Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF42C83F07
	for <ath10k@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=; b=dDfVMcWqmWE+7U8vPqO9HbRpl/
	fnFEOOC+NUIUwCwdB497cQciVBSGfsTFnPE0H4CA26pevWBtTIv9cyXts/+eAx6QWUNOUUpz42iCR
	2Uh1xretZfY7Zg/Y0BKl5NbC0Nb4+rPeipSYrWTCDV094L4R36bd79xvVhEvDVcj6DM1tKL14gz3J
	wqxgqHkjs64xppHqNR3hegB3mO5JnjNsDsqfUUvhYOPnXSGdg04+L2OqCgxcH3AvYSfbXFXLTjBH0
	bvIVSmGvBjqcFUG4lNFj6Um1oZjc+ZkJnM4Mb4/D2S4cXO6jnJRj89R82IPzceZXW3TuWVg0Oe3Hq
	00RKKsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXp-0000000Cqlf-2XUO;
	Thu, 03 Jul 2025 23:40:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSZX-0000000CkBL-05R5
	for ath10k@lists.infradead.org;
	Thu, 03 Jul 2025 22:38:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563IjtDS028624
	for <ath10k@lists.infradead.org>; Thu, 3 Jul 2025 22:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=; b=CWyUayD+8Bux6HrS
	CXSgMVfZdWOYL4PH1XzrD0XHMeNGifHqaXcXt3dSsVnScByMnmAkiQRTpL7Rwruf
	tkl+NV8VC8/mMl2p2UjTD6e/32uJajCEkw9ysfYert8V9Qs/l9Ij2Ztb0TW1zjn5
	Hi5Oic5NDb728rQvotIGsYRtInx+ZUoxbHQzTnOu6VLUFqldf0wY3+3zwsg3/53O
	Lo5F93pr4Ihri0ZI6Ija+X6iZ3R4XVvTn4UsbN3CVm08y+Uu9OMdOivvlHPYHQXM
	tOvQgY66FqQkZzZ4bdZCQZoEqnGrWWIdG2uJQViBPXBP5PK93LOpeYC5y4lbZmMJ
	w9OG2Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw20vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 03 Jul 2025 22:38:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b34ca003f1cso179773a12.2
        for <ath10k@lists.infradead.org>; Thu, 03 Jul 2025 15:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751582304; x=1752187104;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=;
        b=rgyiffD69c2P4wODpbmWJFtzytTRSUgS5GM82IHguebkIGJt8TAwYc9ZqNEC8l/pA5
         LmoQEy/lX9jl4U94g2D5ydwBbnmZhxmLBU50p/gq+8deDDV5F6aNMEysq17nbDHm9f8q
         dim6///9jzDohAz8D0V2fybxcyy85O0RNi0y5iPnq7Y6pPuK6/qfsFkWShRasHRYIYGR
         qCVAMGhMXGFBoU41pV3j1WRZEGOY2uyu265LPVriuD27jGpdE1FoOpLb2wQgUoPO522e
         riuDY+CUjBZarn7Az0AB+Xjq7U/1TLo7oC84NCcbBfOXk3kXBPafgFltzirqvtlRBG9u
         6hkA==
X-Forwarded-Encrypted: i=1; AJvYcCVtxuzMEbdDkHQaa9/yEZKMuuy6T4Z2bQcuPdLG50avZcOeL/4tgEAWkv9ew0unZtwfckimG70=@lists.infradead.org
X-Gm-Message-State: AOJu0YxS3zAq+gI1oNSa5cpZYy1rUnVd60zKUIOFjGcRwS+XTHyYT/RI
	6OrA0KUhLxm8BJXMPfcbFIGWm/6FWSbf4DAVv3A56fHUKU0xKQdSGzSdTMa/7GP3Hv5fMUtqutd
	ldFRJ0UJZflHEfwxwSQgjX5DGYZdvB0L+lkxP6KCfKrlA11c4TaeL7GN5evc2nNBY
X-Gm-Gg: ASbGncunRRhNc0vHbBN/hybXu68iDj0NfAQkpwzglU31lbKPbCdzvcEEV1XRJBpqo8M
	MhglgEojlOrqwPgwRJsKC2w/P3q3in7PflPECoqxGsz5wu4mqrQzlHfdBOLdKW/SJ5UdvXYpa5a
	cydCzSPi642pguRw+msHWlW4p6X/jDkbxqtilzzmn3FQwWd8Nfs68BJ7TSmUsWg0khbWqecR1Gx
	L4T1DaUPTVTLpUZsiEYoGzrexNK/uG0vQKrAP36HgAeJbjQ6fUdCB9FRBnPS8FRUJdS8FUxP9Mx
	YbonPniUqixKHqJDC5gXj5P/Z1h5JiA6a1M1PsqDnp791B0Gi6DLk+6RPwToVHMb6m2+w/rynON
	BDMMt6L4Eq+r1zro=
X-Received: by 2002:a05:6a21:9989:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-225b9a84143mr678868637.23.1751582304174;
        Thu, 03 Jul 2025 15:38:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpT4Lpx7Qr7u2DGYV2UWbI8VMttTXhwYx8YoVd9mUgEjIMP8UGVB0SwmR2RW7RvDWCQB5IHA==
X-Received: by 2002:a05:6a21:9989:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-225b9a84143mr678833637.23.1751582303769;
        Thu, 03 Jul 2025 15:38:23 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4a40c2sm559085a12.33.2025.07.03.15.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 15:38:23 -0700 (PDT)
Message-ID: <339f0d83-a28a-41f2-99ce-3fde0b5ef95e@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 15:38:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wireless: Use of_reserved_mem_region_to_resource() for
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Jeff Johnson
 <jjohnson@kernel.org>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20250703183502.2074538-1-robh@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250703183502.2074538-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TSBX4cmXHSk-f3Dh-jOhC2sXje_w493r
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68670661 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=iqVkCsNWeGCx9g_Yh1UA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: TSBX4cmXHSk-f3Dh-jOhC2sXje_w493r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE4NiBTYWx0ZWRfX5Bq1+FQdtifO
 ZiS2rm81a13iWsn5V7lsk0dQ9o3CszcqIL07bNJEPw8FqX0JI44N1nPG5ip5qnT7sPUFr5wRJ/Z
 s/kIfIEi32cbeoYlwnKxh0eFS3JHvEhkh0ADc4Y+b1NfdtyXCfRyHsOqHq2ggMOZVuQcQJeLUae
 o/n56JXN/xTz1LOFdYc72WjbF8nVTBjqQYSWZyaIHAO52gYYNZxMJpiG4nnDlUFK9+JKiUM7y7Y
 SL1XhPwZW8MnR3azYhF6RJroX+Bx4DI0D/Z/sb3g74NSlqlKzjYgIbnmP9EjF7SKg8VvL+Uw8dh
 IaiTUJ4ED7QdJgWkOO+Bn3sxbzOrFpUYJrlYgJyWh4Ct+EhnyNdKlKBetu0Xxh+uy311tFIiuqe
 HhStpJLcOQfRa267yUGUgXVVy7aWlxgfOPj6aENuKgJYQrRCO7CvSwcbf2JmfyKxyfVewdDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=698 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_153827_068334_225D7394 
X-CRM114-Status: GOOD (  15.35  )
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

On 7/3/2025 11:35 AM, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different for ath10k. "memory-region" is
> optional, so failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c        | 14 +++----------
>  drivers/net/wireless/ath/ath11k/ahb.c         | 17 +++------------
>  drivers/net/wireless/ath/ath11k/qmi.c         | 17 ++++-----------
>  .../net/wireless/mediatek/mt76/mt7915/soc.c   | 21 +++++++------------
>  4 files changed, 18 insertions(+), 51 deletions(-)

Can you split the patch into 'ath' and 'mediatek' since those drivers go
through different trees.

/jeff


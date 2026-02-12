Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21FBEE36AE
	for <ath10k@archiver.kernel.org>; Thu, 12 Feb 2026 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWNyAKfL5ECn59F0e4cQzPnaqUDLfSewL8EhYtYIGrY=; b=ORX+5hq7ytXVvF2n8HGRP1R8Oo
	5KmTGJ4qE7W94X6DONVobIg/C7azSKlddG/KuNaDfPqbNCepwyrZx4Nj0Xw3L9RY1/NxeFvicbsb0
	kImnbI1O/zfNSfMjb1cxfWMHOAAvgKptZW1GnudJLhI8Pzr31I6HuIyGIb0FRDjq06g37mLGE+h8Q
	r/ylDoTgKisZGxyxK7UGh+L+vD8K72y0vD8RZsclTD5y2FB1/NMsKg8ZZuWv7BtP5z7RCI7Tw/Wlw
	PkpXLVfLO3qVCKaboN+7I40qc5aH2ZNro4ooNl2P6k2SlXmZbARXr/kJBlrthaCr+pgMLjBFvNCmq
	l7pSRgZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqadr-00000002SfT-112h;
	Thu, 12 Feb 2026 17:38:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqado-00000002Sf3-1IvA
	for ath10k@lists.infradead.org;
	Thu, 12 Feb 2026 17:38:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CHMCE72093820
	for <ath10k@lists.infradead.org>; Thu, 12 Feb 2026 17:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWNyAKfL5ECn59F0e4cQzPnaqUDLfSewL8EhYtYIGrY=; b=Scf1JHL+OxWgYAFq
	73sOkzEFvAeBxnj/75iK4MKquSWdj+lFybBt8Ggnc0dqsw6yWJNiJDrX4GSwxSaC
	a+V6G7NHRWs5E02E6o28rYSCmbYoyMp9jT9oyxItRfvhrhrgi54bEL3e66j7vqXM
	xTJjvz0K/fNtto3ivbDysIF+KCMakc4he3gL13F+KnJ8n5pIIpQf/R9r79YbpgBc
	mSjwqP68DzIpBQ78TTNT319OcWYE7IvOAnQO2oXULghYvJ6Hg3glNEx56bTMlZJ3
	/wQICn/Ins+sXW+Lv7ogjul5K1X4HjIvZkl79x1e9IAEQ6e8OwbxPcKSdNsjU9hl
	8vIc6g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k6y0285-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Feb 2026 17:38:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b9ea5408fbso63237eec.1
        for <ath10k@lists.infradead.org>; Thu, 12 Feb 2026 09:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770917889; x=1771522689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWNyAKfL5ECn59F0e4cQzPnaqUDLfSewL8EhYtYIGrY=;
        b=LW1XC5/J1wcwJb4GtaM4mc0X/fn5NOYLOdLsEX83nrQu3oBuqjoP/LAOAaC8GsYlB9
         dWzwh9b7vWScxByB6y8mYt4N2Tw+JPWl2RXwSfElYp5l1ybYAWmGAbFniuABkvEPYYF/
         Vxeb2mTeyypBmwP39o0hUH+QwM20UK+xEwLzinB7sUEn69l4nYj2fFqAqsCbEBi+uaYQ
         s3dYb0MMnLbQ9WkCCvMFDF9ewKj9Qj1el/8lvmtxY/GMVaIq+Q15nZBcu1fO6t/PbOnD
         5TPOkEdAvkAuio0OikYR8btph/PNN71YmgOQkH0dC84OFgtlwd4ZSNx2F3L73yhBdIWX
         Ir4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770917889; x=1771522689;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWNyAKfL5ECn59F0e4cQzPnaqUDLfSewL8EhYtYIGrY=;
        b=NKxjyxIjdJt3TCjK+H3t41DCuAH1BPZEA0I4KmkiGp2AdeZiO0zTgRx++Za6b19MDa
         E+NfiY6s4OjD/oHMga5W3GGnidYeauEBYXXv9a6yQdwhB6MvcLSPiPllgy0EPTGBzg7T
         jz5IZBOC87me1VWva/hxzZNFR7RVqSBVETozIXgoNR/+Flyul6FUA0tBbSwRGFoUXzXG
         2PGrBQOm5ZIB9UYCje5pVmPuAHuQB3TUUQM413h4fbLw5Vx4YRMbGmu4meoO22weXHa/
         Rrg8nujg9TOYX7JCfd5wXJMkbqkfxKTXZ+qITNy3rSH5DQoVazQLx6pxqew5yQEU4tpM
         u5fw==
X-Forwarded-Encrypted: i=1; AJvYcCW/GoR77EYJvqU4lKCnC9H1LV9RUvgri5yijuVRVcphG062troxT1fDHjRiWIzVEpe5So4S5Yg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9ZSthoPwGAqLz3xDie8GX4v/w+De2YDZRmGviqj1Xr6wRs48M
	hMifiqfsRNkqaGkXNolcS/hwapMpqdRdAFoNUriHzAIBcDZbY9IBmPqjxuyp7oxVwiONJer+ewC
	wk009nYSp71wL2GH7yiUSnD+Ho9YA8CSbqhpvU9gGqjPLTsxizRD1cHmCOc81zXet
X-Gm-Gg: AZuq6aJy/9CUYEcsTR40/lVoy2xrEzgriqe1myCybdmhLdZtHUiSkQqh7sghN7vfq7f
	dsmWmJkbgWjkZD4reAppjv0KVG8BuBGMqaT0HfemrfXg6fktX88NO+4xoWbZHd6N+Wa03on0gOU
	EL56A0Mof3ga1iix1lZJdPDBBtBbPR6Gly+VRwIn9xiS2D4mfWrY+luIQcwfw38H7ScbXPWvgTA
	d6oZQJFmGoxm77gC0HDKJ/NnBhDARdxMdUB8IKfryyXJ1sstHjRkDAITKRq5zFSE38UdWuybsw+
	CIAUOWBPneWB/sxbpXjuitsVz7WFwHCoT5Ba2R5ChMNEj30F7+z8wzs351qyLs52hwCW2GK4dys
	a9WVsuIAm8v0pCVkghmE0CAcK4c/fPsSbsjD+9oKV3Q1ExakyyzBT+Lxf4tNdjzhRBuUNpPT8I6
	6FTZORN6VkNBWIBg==
X-Received: by 2002:a05:693c:3117:b0:2b7:f44a:a6ad with SMTP id 5a478bee46e88-2baac6d34c1mr1344146eec.42.1770917889282;
        Thu, 12 Feb 2026 09:38:09 -0800 (PST)
X-Received: by 2002:a05:693c:3117:b0:2b7:f44a:a6ad with SMTP id 5a478bee46e88-2baac6d34c1mr1344132eec.42.1770917888630;
        Thu, 12 Feb 2026 09:38:08 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dba2aadsm3921980eec.1.2026.02.12.09.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 09:38:08 -0800 (PST)
Message-ID: <c7646164-134d-49c4-a1dc-0396876455e4@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 09:38:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] wifi: ath10k: make in-order rx amsdu buffers
 persistent
To: Richard Acayan <mailingradian@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org
References: <20260210021249.12132-1-mailingradian@gmail.com>
 <20260210021249.12132-2-mailingradian@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260210021249.12132-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NsTcssdJ c=1 sm=1 tr=0 ts=698e1002 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Vb7B9NVO3itwN6NV7FUA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzNiBTYWx0ZWRfX2jLrBYoyYFRw
 HnaMRxymw8y4EDqFz4f5oFOU/HU0IGxffR9RGsOnAwLFgotvMGNEeYmD1lRb0JtYGIYHuuRsqtd
 swkfKc/UAA6ND7mNiWNdW+FM8TOWt9yfszflfSWh/0v0dE6Tw+TeIJbww+uXB2lFZiUAgrmQDwX
 p134JEXyfr5ZYZtSS5cCr4sJyYsQ2QvV0n7TKlwOcuXX0JTcMVD0IUMMMXAq39PFnpKRF4SQuzq
 3bD1EXbcWVhv/nN3FLS6Dso74HscZTpl0EdiOT40+w8AAqHlg3Z9CFccV3PH+wKDARjxAx3Wxfn
 cIaZl0VXlFbIvg5FGdOqoUxpfQ5/NCB/S9QuSlOOCo5uHuxuGcWsmht/Puv2M39DzvxJlunwdbp
 CV9Ffx7lCm+/bW54/voSn4uA2Ixg+nLx3laPHOZ+u6MKSeDl0kJZiAnv8fNOWTVcLgPBteavUVq
 jUqdiNZYPLuMBZZCj7Q==
X-Proofpoint-GUID: ObBBi5RNONWGkwZiYVE47Q8GoAJCzT-h
X-Proofpoint-ORIG-GUID: ObBBi5RNONWGkwZiYVE47Q8GoAJCzT-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_093812_476358_F4ED8B3F 
X-CRM114-Status: GOOD (  16.42  )
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

On 2/9/2026 6:12 PM, Richard Acayan wrote:

some nits from my tooling...

> @@ -3299,16 +3302,32 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
>  		return -EINVAL;
>  	}
>  
> +	if (!skb_queue_empty(&htt->rx_in_ord_split)) {
> +		/* It might still be possible to handle this case if there is

note that networking code no longer has a special block comment style, so all
new block comments should use the standard style which has the opening "/*" on
a line by itself.

> +		 * only one peer that splits at each given moment. We are
> +		 * bailing out because we should have a test case for this
> +		 * before trying to fix it.
> +		 */
> +		if (tid != htt->rx_in_ord_split_tid
> +		 || peer_id != htt->rx_in_ord_split_peer_id
> +		 || offload) {

checkpatch complains:
LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line

> +			ath10k_warn(ar, "split amsdu did not resume immediately\n");
> +			htt->rx_confused = true;
> +			return -EIO;
> +		}
> +	}
> +
Just wanted to get those out of the way before I look at the real content of
the patch.

/jeff


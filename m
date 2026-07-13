Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4F0C43458
	for <ath10k@archiver.kernel.org>; Mon, 13 Jul 2026 06:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aL8fQaBr5pkH/x+K54EqWRL10v6bvtWBm9i1HH4dNZ8=; b=BUr8eGsY5oK/tqr1fCspOAoPcy
	3NSmG3aBq17V8p6h6/2bUy4YH10y9DTnfbuVagPfnCF6PDVdhvUuamr13MKmzPDoOJqN7lQ/HoHEC
	0ic6w347qIsVeUAb55wgO+X9U+KA0PSzzMciZwBH9byczEyFBLR/jb/D3Z5TU+cceLjLCtsOBw5Gz
	l2zLj6vfeu8gR+iyg4nTM+3hOSPQ79afjNIU6iYdT1oZ2Tk3EGzfZ5sTKXDYa9sZgJUdX7uj7+0MV
	SBy/zFXMIQJ/nMhw84FnX3uz6nlsPfraiZhPoHNxhplBta8dpiWNXVIfAlBP1rblk+pib5IsRwn1R
	QWJN2qNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9w0-00000008DAA-0LHq;
	Mon, 13 Jul 2026 06:14:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9vx-00000008D8j-2PFB
	for ath10k@lists.infradead.org;
	Mon, 13 Jul 2026 06:14:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3A2dl169718
	for <ath10k@lists.infradead.org>; Mon, 13 Jul 2026 06:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aL8fQaBr5pkH/x+K54EqWRL10v6bvtWBm9i1HH4dNZ8=; b=PFxEaQYlTkUjUAQg
	3JPDJtw5fNEodhtHU+IDYJGNsKSznfHTgrknz7WjTLveynv2o/jReEmtZpvx7J7c
	dFFiRBoRhb97XbY+m2ysigsrYFoyGroK+8oavZJFlQM2V/dYMDKZ6L9ZpzeSkeVm
	zvrHm07rcA0ZyfLQ5wzu7E2VVDHLIGash+MLnyFbRr0Biq+fXGtfSPRms36PGaKt
	SNSimFC+w+u0idPwSPpawccXE9oFRhhnAAY7TT2pShcvtlG9k/8mE/CtT+vR5iUK
	Da8UnyE0QGaCZmlPT6EzJAUbZKpV7ZMHtbVH0uY+MShTKDjKRAMjZV6cQaUwk14M
	P/8yKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehmmuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 13 Jul 2026 06:14:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so60602845ad.3
        for <ath10k@lists.infradead.org>; Sun, 12 Jul 2026 23:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783923267; x=1784528067; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aL8fQaBr5pkH/x+K54EqWRL10v6bvtWBm9i1HH4dNZ8=;
        b=f8F3URTq1wwE+MTq07+gjjCkR0LJvS1ZHAzqBqClwF+ncSHPJDgmdDGqsQdO+2pnCt
         +R261EYMw+NjTccfqJS5hVvhFgZk4SqV0+yxFhL6gez7YB304C+VPAxzCLbdonm1i3Ss
         YJ9WGGOLV8zvhC+6WX+JXQM3KXVSyLGp2+7VPd6K1U88k9uJvzVz2/zFqlyWmx500Ofb
         n7QZ+/fYGv+NjNFC5Gb10iXMF4nXlEVCVF2HrUtdHNo7cMWCazHh1H09sNJDzLxgbRKs
         aAFux+IteHw7DC5r/USUtL+PS4Rvyu3p2pPVer0s0Uim2s47AtEBfrsrSIkcpEYwR2QU
         2yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783923267; x=1784528067;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL8fQaBr5pkH/x+K54EqWRL10v6bvtWBm9i1HH4dNZ8=;
        b=MYiJK8Q7vlzL3otq8dHLMHFhiwqofwS57chZFEPQWeqCzi+qSmopJmnnWjUACE35Xb
         51e6Z9c/R+lx7bUTDj4h/EzIBBZC58j0t+dUOjvmKxdkplgxJTtV8JlD+hcEFpgkn/aI
         YZ2BUN2oLp96e1Ys2jPqYpJmTPH0dd0iESRZHAmjZXy6DMi5Mv4aFS3igJb3+3MrByCZ
         Rt3hnt54ZGZnQnxT4bcaFQXuvXiyImq3OSBmuTgwEbETIkG+mqyR1EjPJtuAaO+xa6Fz
         Vw0c0p8n6xLRLMuIqC1+QHkI1c7PN3YGSpMIcDbnsOrDLy/306x8QWmIRQjpbXCsR1eV
         WOtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsqkO467YTN+aa88K/e3W1CLI8j9ldx6EGvlb6oyHGzUWFv/0RKFXOayxxFIomEZWIn+QqkmY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwexgY+V+8a7m9ambrYCGGQQxn7T5eO6AwZtKAsouP2FfFk7p+y
	lnwi+HkbYsD2yBGDMfwEhfCDsyUnXrhoUxmC6qmEHYzvv/h5DZvNTqeCp5h1KoNoQc1M2yB/I6M
	A7sJvu/aGDSbGO4rJz4y8MOn8g/mnjreqjMhTYLs/02e8/Y2td3pRb/mm93GQ8hhjQphuKfiiAc
	U=
X-Gm-Gg: AfdE7ckgfYkf8yX6FoFf/XiOM9p/FmhhUbrrwn8jQZIHpAisRpyBYZfQ3vha4Pfn6jH
	h/OWcnsLovPJHVuZWssCpAIIwBEMcucxt+dXzCPazZnTzJGFCCtLWXaCP5AmXlWVqjXOOUzDEUz
	uqk9ZELbepkKfBSPmZDYbV0KUVzrY/h6kRc9dbfnBwWV5qY1NUUkDRdqROy/QrI1BO6yJFJfwDQ
	fPq+exmS0EuFSdlgtoCw+CelQvAr+iIu5m/OyqCCMQWF9YOUaliaBoeLn9Dpe4o4/KRnCrok6nd
	OK8pIzYpbw0mBJgKvk9ztItY/GGCDTNjjfTsOlmAKS3hgl9EJDktTFzC4AI/7eWfwpkDhSBXPm9
	tGrpsJpP0SihahP1RBL3nrL/PiOx+M6ETCDeNnioPrTKxrs6fNZUMywRBgumYj8/AVHJi66yRBQ
	yfKN+SrMY=
X-Received: by 2002:a17:902:f687:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2ce9ef186e0mr74358345ad.23.1783923267589;
        Sun, 12 Jul 2026 23:14:27 -0700 (PDT)
X-Received: by 2002:a17:902:f687:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2ce9ef186e0mr74358045ad.23.1783923267158;
        Sun, 12 Jul 2026 23:14:27 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3da55sm94247995ad.71.2026.07.12.23.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 23:14:26 -0700 (PDT)
Message-ID: <98f32ddc-49d1-4b1b-9c5b-3c180f284ef9@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:14:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ath-next] wifi: ath10k: trigger hardware recovery upon rx
 failures
To: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
        ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260710060406.3323260-1-manikanta.pubbisetty@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260710060406.3323260-1-manikanta.pubbisetty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2MSBTYWx0ZWRfX9EZTtJE1oF0K
 yP3x/gzS/WCP8ika+HTNkzpMijIf3/xeds8S1lyqhp4d3Zaxr2V1jd+7WwmuOhz4eaUg2boJDZ3
 Iyju+5VN1iMF2xUvtcTh0dl9dWYVpCA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2MSBTYWx0ZWRfXwMv5+oFux4tK
 n3yIwPzNjSmXVYMBqGOgsUZRpFZ1Awe3HwlXLP2tXRnhAlPuuHef5Jh38kOka93OUhdvO1++N08
 l8xrfsFdCWiVeipgXc7ArqPYGum0edxJpGdhqM7CaPqMf8Nr83Wopy/eJdO1PNQeYMJWf/blP2N
 544pDo9CFUIeOw7zmjI1+KbsTU+nikjAjQttgevHAJEB4lusqv3SOxXb8QPCZglv+zBGYjuxcbp
 8RE/AYQlmcEqhQ9im1wEQ8t0l1fU5N/moOcwm69rdVrqddG3NuOd6SjmwZyhI7Pws7rd27h9aYY
 4fVDqN7lBpQG7DUTeq4XACp0rlhgCCQZ5okTB6Ry+7TIeGjXhWLPC95qo2+SmHFRHSFyIWwcg8K
 qCungFzVKUehf2cRZYYUGrfYibOW688FUYMcVLsoo4bvwP4k40NazQyq5ioG9qhLEXdceOgi4Pw
 QcMjmvWUy/YosgbGGUg==
X-Proofpoint-GUID: TBoMKvg2NwRZjp-L1pJu7fjC-bLYBYwG
X-Proofpoint-ORIG-GUID: TBoMKvg2NwRZjp-L1pJu7fjC-bLYBYwG
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a548244 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=D6bBqopfn0aMulu9HN0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_231429_730764_B2BB8F5F 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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



On 7/10/2026 2:04 PM, Manikanta Pubbisetty wrote:
> When an error occurs during RX packet processing (e.g., MSDU done
> failure), the driver sets rx_confused and drops all subsequent RX
> packets until a Wi-Fi ON/OFF cycle clears the flag. This can leave
> the device in a bad state where it cannot process RX data traffic.
> 
> Instead of leaving the device in such a state, trigger hardware
> recovery so that such an error state can be reset and the device
> can function again normally.
> 
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


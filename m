Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213AEC7EE30
	for <ath10k@archiver.kernel.org>; Thu, 26 Jun 2025 18:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGWJ1Sswd47PGcB2x/iOZY6omMkR+LwiTigIHQ5o8VI=; b=aF52A8zxx1N5TxwmeA+TgsQ0DL
	N3BLfjcBQv3+aIl8wXMIiVAZ/4FSK+RXNpIpSqFfKVjjxye87k7jaEdP20OU3Q1i3zy9gEmkDeefZ
	dTo+R+QUk9We1vImrdM3UpQ16ueEuY1Okaoi5PsqnC/y7Aewh6vahK5pIJ10xHceFurlzN96B1iXb
	SKB8hhm+FjoXoQY7UpEx4BXlMZ1hMIAAiIvqW4FAtzwfwxBAYtsGi195Ef4W+K+pVgCWX4/mnEg2Z
	HtTGYruNtwRnqGbOYkmvBAZTSkuQvxf8uz5YxsuwiSn8FjEiJWBWj/n4Z9+cGtre+Eiu/6PYm7JaA
	Bsc6uSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrGU-0000000CS6n-3MQv;
	Thu, 26 Jun 2025 18:24:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUo7q-0000000C2bH-11rI
	for ath10k@lists.infradead.org;
	Thu, 26 Jun 2025 15:02:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9pAQc031202
	for <ath10k@lists.infradead.org>; Thu, 26 Jun 2025 15:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wGWJ1Sswd47PGcB2x/iOZY6omMkR+LwiTigIHQ5o8VI=; b=MLsyhEPS0AYQuE/q
	0ZLQ6k+sCoYnDpqCYEoTp2zl0ZzzcUeT9AivWKJNd7XNPQ1YShEn8p5Wy19AeSc4
	1jhl4WVeHB9lOSVr56avIcBvdRUMwGG7lM/TTgYCfwYDpGALy/gi5ezbd+qnKeP1
	hzRxWpq5SzOiQOueWdA1gsOn2rpYgkJNNquG4wUYoU7JtoLkRU9FcRitf9Rga0gS
	VKGj5P4jwtn783sQrxHFkhIcmA3NgQf3/hAPn/CVRPxD7z18yFLtgUyPOVljzGRy
	rDh3hfcmMReJoms0UkcZBGRfogfAHKAEJlMGmIDssaHjffFXLvjc8v44sqFVYSue
	Y+OW5g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b43mxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Jun 2025 15:02:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so1774674a91.1
        for <ath10k@lists.infradead.org>; Thu, 26 Jun 2025 08:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950171; x=1751554971;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGWJ1Sswd47PGcB2x/iOZY6omMkR+LwiTigIHQ5o8VI=;
        b=A+ha/8T2IFMZHmE2o+ebLJ8yHdr3X6JN/6El4hT2pw8/qjdUgRBRlTJ3E/+SlWYBls
         nTnw7op56j2XqUYDjQZhAf3A4eKS/a9no7aKqZjXp4zlKMDi8QIZk0iffhu1z9ZSPshH
         UlGDWEGTqSyaLYgQFH+WL/HiWtrQCa73RVRXIseBqaandIdvuFXAh0ki5rqIUAGWAOCR
         YrXjlW5UpPjnFrdDjQMUjgz+TeB3jtZvJYTUAuVQp8eHoHtiI2Sq4f88zcIRcQkX6iY2
         I/NIbyFoyerId4hJBS/kZXE2rjkYJy7G6oJTctyd4hUcOPE4H0pVVXrzcEZjVQQ4tnBB
         WSPA==
X-Forwarded-Encrypted: i=1; AJvYcCVTCxPeSuW6Ryv85qpcCsHQGs3gJAK6qzULaLATb44UhfN+8HrMo7Av6eadDC9Rr9nokqMyYko=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuEV+l2jH2BSWZmp3VNaQJSjN6fdTTkq0pvVHSYwda1MSloiXi
	UTHylyQPaueqQcjsEGXCcFsACmbD34sp2m5QBYgW/VIYNbZZyAAuaogot5qihiyBWs0GuQZF/cn
	uYAnVnCvP3+pSR9HBDvE0zLWruYYko/cXDVJqMOrgelHCAx0/BSYkX5v1lTZpNw4DApv3JyOS
X-Gm-Gg: ASbGncvncdKu0YIPaaAkCv4mOmqBUXB9UJI6qfDtrEsJVGsinfWbwIdJE/bz39C7xlP
	dFoEl6H29ttaqs3h+ps/46JMn2msTaBDhOYK9YGYxHZUDzN3ZEkWA3R5zD3wXjXYPcynsiF2UaX
	WYyZTYrJeQEfCyL4G5WtN/kKWk7zM9gfvwSCq7oaMfqtg64KVUCYdpGKsJp9N2ltlUWv61Ypzn7
	JWHfcHpnqlIFid3IRv92bLs3hJfyoDmarhDjN9qWEKj6fYAEvLRKmXVXoRBj/vwn2hbncenKE6U
	DKfY2IwI2F+L2RX7YTawdtR70AnbiJq2QNrWIYmYGTKRotCQE8tmN01sPYuofZtGsd/lLWOnCUd
	InQ==
X-Received: by 2002:a17:90b:3b8f:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-315f26d29ffmr11663518a91.33.1750950170808;
        Thu, 26 Jun 2025 08:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdptXbuCusOcSSm1v4l2+op7oqmsQT4Ib4rFlDAj00T7SkOzlBe2kguaZuOM+pV5f/S3t6xw==
X-Received: by 2002:a17:90b:3b8f:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-315f26d29ffmr11663420a91.33.1750950169970;
        Thu, 26 Jun 2025 08:02:49 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e6aasm4593623a91.15.2025.06.26.08.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 08:02:48 -0700 (PDT)
Message-ID: <3f6c106f-cbd3-4f9a-8e7c-e43b51457bfb@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 08:02:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [question, bug] regularly disconnecting wifi on RB1 and RB2
 boards, ath10
To: Alexey Klimov <alexey.klimov@linaro.org>, jjohnson@kernel.org,
        ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyNyBTYWx0ZWRfX9YnIVBquACrT
 mAuLZu8G9bIJhhwWWcrhq/bVrEHhN3Fic35w6xf0icMQCTdIDOXv/1Eqvll9hKTsk8yBMm7Ec2V
 53yXz7+YtRQlI38qxBpcHbDM8Nu08RmR0AlBLh0QoBCb84jTcYVM8aDsbaBt6M7h9ZRQaXfjhzK
 PYhwjExZr//15h2Kr5ljk+tPcxXhQn9cAFGKGCH0Z6QkibgPiueCtAyca/AtYzgw6WADV2zfNBX
 +w9U8gMbhB6vs1Rv6x84GwcrDBdlSNOxqG7BTYgwyM8BfXpZ3qLkvhKjvYwLrJ6Sy9o66Gh1H+t
 /p8/j8qpt7tunjeEFxp/Jdx1wcmNl1QqNyyOquO/vda1fZHzaqhxzhlOVD5LU/HZY5/9Tqvdh/z
 1hs2O+cCXd8a4aKHMOhvE+PFjoSw017NTIGBihU8N29EbJ2J44qTmmyaZGP/Vlfzqa4kmtWx
X-Proofpoint-ORIG-GUID: A1SvhUOs1lT9q4L3KEI1sg94hcE_VP-c
X-Proofpoint-GUID: A1SvhUOs1lT9q4L3KEI1sg94hcE_VP-c
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685d611d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=sXrhvLzian3437fu5cAA:9
 a=QEXdDO2ut3YA:10 a=B0GORZ8-IyoA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=811 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_080254_383196_677F3370 
X-CRM114-Status: UNSURE (   7.85  )
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

On 6/26/2025 7:48 AM, Alexey Klimov wrote:
...
> Any hints on how to debug this? Any debug switches I can toggle to debug this?
> I am happy to provide more info or test changes/patches if any.

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/debug.html



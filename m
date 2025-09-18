Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01EECAC59A
	for <ath10k@archiver.kernel.org>; Thu, 18 Sep 2025 05:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5LOYhtajDzTqhlpHd5ftqJpHde0crMjZzmyN2Y+aG0=; b=Om3Kq4JOJutbvJ/yudreyEMkit
	F2//6Fz6YD73It19WCbAa+FbTXNQFS9p6RU7ciMp1WSkEHS/ZijZwjKTMtg0bUlCYjHg6D/KjTEBJ
	lR/x4xwV0ubQb55JDXP/PI2ekhBhDVFUkfGY2pkydFYkxva46By8wQOBDcZW8amILLx2KlvzqGuVF
	46CqPp+UxAG9RiAhQi3bA8DXy9tw9vqsJVVYN9ZVdx2acqtYuiJPJDlP59jUDQTi5OiSXa3W4Gn+Z
	7iBN53U7bYPhUdaR8U6eunVCTAzqC+SkSpOcy2IQjYA1qIUPd/b4Mjr8oU7mnNlr67DYVSunBMkI8
	GuoFojtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7CB-0000000GK4q-3Cyr;
	Thu, 18 Sep 2025 05:28:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7C9-0000000GK49-3MMR
	for ath10k@lists.infradead.org;
	Thu, 18 Sep 2025 05:28:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I2xcQW020577
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 05:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5LOYhtajDzTqhlpHd5ftqJpHde0crMjZzmyN2Y+aG0=; b=BmIDrlxbbEn7qjmQ
	BL3e+01YQiRFskMUE22idYzoB8K6Myy1nnACcJ9cawIdtXiOvH0NPOmIJAL7jMoR
	qmCp0JZZsfEE6GZnk6BcD8aGBxUI9Z9wDSRUgzHtoPVRmjTAH8SWlLz+nw7jR0vt
	oU4ppJ0NWTC8p2lcKO0FV8vVDAJiYhuDdkXNZwXs5HPeZjbBYGnjnSAdvTAi02w/
	kNOp3Y288sgD518g6zQlvSAviY2KEI/4mnFa6ZWC/xu3Bd2C60oJ2CpaJ0Mpnvvn
	WsZEKsFjppSS538yfzDCrplH04CSngd5ZghlWhb0LwvfO1QQQSAts8t2VP71z4l8
	QE8Alw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1w4gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 05:28:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so540079a91.2
        for <ath10k@lists.infradead.org>; Wed, 17 Sep 2025 22:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758173315; x=1758778115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5LOYhtajDzTqhlpHd5ftqJpHde0crMjZzmyN2Y+aG0=;
        b=u4yzr3PfyCqRgAB01d3bxGBl50tJC5gAwNmOxpTtOt3Cc03SgpQjBoKdCBjjJ3McdG
         y8o9VXOaWseePr+XN0b8ayWMh9sW3jCwir05EjYs1fSvNuhJpAB5uoZ2qV7pi7feX6pP
         Xz3Mss7LOU/AEf1Q6gktAkuIEFa9ekblFtnem2r2UPidoFVb6mMGlPqs4+4SgX/Xkyq9
         gpsbOFmtcCAeuPhEwcHouisNO/V8jJvGzACdmyw9glMV7YJthyYmuIzSH3SjHng2cUz2
         A7jvauVj4yMEZZig6yqbhBuxXZkpv9ExPIvQqc+7MIO+/nX2I3D0x8x05dWqP6Aymsp3
         MLSg==
X-Forwarded-Encrypted: i=1; AJvYcCVxmDPi25WM+Q/9qru/mkTZJA7KUbYaGNrdFVBsxH6Gs5Qch8EzxKphK6NVtap3PYxQ/jWwcLs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhXxdghnCn/AcdzsRsPG1QQ5jTKQ9ysbyb+tSmBVR4wrqRtvYa
	LsZ/wTYeZq6EO2xV4lZsK5D620k+vDodIC+Q7fRCUHHDX4ANS4LxmkHVhbZKu1kmhIN8Ao46Sma
	pd7cXA+vP7uPCybV9Laf/8RPA8gVjffdAn2iC0lqA9JbsSvHuZ7JQ2cWyoMFYD25J
X-Gm-Gg: ASbGncsxczwmpbOl4biwUrkJGBb5PLW2gyOGGS3mIHduY+I2H5Fk6QS87Y86mERmzAz
	Gv46PsKsrNd0MXnhuYUolwo+8cXgiAIT2d2Gsbjrg6PPwkzv2/fR/6zgFr2NqPYgA2g658iL1N2
	FkQHaMq9VaL/5GpHL7agBWrejup3s1g7qpw3hNo6W6Xf+FW8xUlmxrlGBDCh2vIbZNI20EfkoRM
	ePQgGB0DJ79BYp/rGQ2k01SsFZ8RVT4XC0a5i2xJB+jgXFZ1QW6X2CKg4Qp9vDphG+qVBadE3Me
	/lHsnTFlRdKjut18gvMN69W+lYAlaiYqN7vMkHzJgfluH2GIW9unEXr82PmppdcsSprgkq2d5No
	o6HQ6WA==
X-Received: by 2002:a17:90b:50:b0:327:b2a1:2964 with SMTP id 98e67ed59e1d1-32ee3f008e8mr6458151a91.15.1758173315357;
        Wed, 17 Sep 2025 22:28:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHswibhztsG1BwP2eDesVpF91dnsj/pntyJeZMSn3QPhFedll694Gp7MkUFWnZw6wUWst4YEw==
X-Received: by 2002:a17:90b:50:b0:327:b2a1:2964 with SMTP id 98e67ed59e1d1-32ee3f008e8mr6458123a91.15.1758173314878;
        Wed, 17 Sep 2025 22:28:34 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330606509e9sm1263171a91.9.2025.09.17.22.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 22:28:34 -0700 (PDT)
Message-ID: <d97cd03e-293d-91e3-ba30-a7015e14fed2@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 10:58:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-current v2] wifi: ath10k: Fix connection after GTK
 rekeying
Content-Language: en-US
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        alexey.klimov@linaro.org, johannes@sipsolutions.net
References: <20250902143225.837487-1-loic.poulain@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250902143225.837487-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k0XHkCmjlKYUItK8BiP0Jn5_NkS-XZhF
X-Proofpoint-ORIG-GUID: k0XHkCmjlKYUItK8BiP0Jn5_NkS-XZhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXzF7och7gyIJW
 aeVMg41DseFTuPQP4kL0dND9y8eA5PsmV2FJ/lXGhl27cqhsn67jJem457BVUaybAroG3ldjEaZ
 nRgaAXOuegnTP8AsLsVZrqDGtqo+lXtAHiyt2DFMnORZlj+b3eAb7QEfN1MhFBAf1pePffvkR2P
 z9DnGPe0X2EO1W+o+sk6pCDrPO0/8X/+KSVbrxb4CfKSF7f3g7VlOPRmOeSusPDhTRSDnMCfT3b
 6xbNI0SkAaDv5QT9MOCzgOqcMo7JcA6BHMKoSyVleMryYebH5YBcHVB/NgWlTL39pm29f508S5D
 M1QZlsdHLGX9ctn6sVu21tMoTGilSekDaBtsEAviCHrnYUEcnbonr6p2FIyZah7uGOIUAop/xdV
 oQYnnEDm
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cb9884 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=JSNtCRjb9TMmkz79QN4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_222837_959725_E939DC26 
X-CRM114-Status: GOOD (  10.30  )
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



On 9/2/2025 8:02 PM, Loic Poulain wrote:
> It appears that not all hardware/firmware implementations support
> group key deletion correctly, which can lead to connection hangs
> and deauthentication following GTK rekeying (delete and install).
> 
> To avoid this issue, instead of attempting to delete the key using
> the special WMI_CIPHER_NONE value, we now replace the key with an
> invalid (random) value.
> 
> This behavior has been observed with WCN39xx chipsets.
> 
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
> Reported-by: "Alexey Klimov" <alexey.klimov@linaro.org>
> Closes: https://lore.kernel.org/all/DAWJQ2NIKY28.1XOG35E4A682G@linaro.org
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


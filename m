Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7AFE6BF39
	for <ath10k@archiver.kernel.org>; Fri, 30 Jan 2026 20:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=; b=lpGtT7ctFpCBcwPI8wmF5WxwaP
	FasZJ/bX64YhgfubuDuUlxzMUSuMqkj9TWYCU66WQ6y2PYCAEPp8HvqqvmX0Aq9iFViIyoyyz5oOr
	1qECjzcGzrAL8hXDCNaMYZMj0nNz8FPMDv3sIat9ZHTA2uZ1A1rywvC7EGsiJoxG4M5wa4zsckW1q
	oRx2ahO2BA5phhTCTO4nwcv9tEGrw3PsDZo++sjuAo+xsN2o/WvypQxaP6lhW5t76PCJnxS2D805I
	sBv0wJjni9V2ND7sxUmb7jPFsMgPNYe7keFr8JMY89YKXOaM9PlT4pMPlr/s2+LjYYVpcntQCbOaF
	tC7aFFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlufx-00000001uRC-3iZd;
	Fri, 30 Jan 2026 20:01:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlufv-00000001uOt-2WMo
	for ath10k@lists.infradead.org;
	Fri, 30 Jan 2026 20:01:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UHVWBQ3296882
	for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 20:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=; b=bDrwHOQZYvNzAECP
	RAruACmted87t9FtA4Z3d82HJ2nKgE+X84dkK2fQNVyiSTsvrVRbVGQIbSqYzXLa
	z+7RSj3OJsdh/do/aiM6RMVh0BLcSKgHolYY2eK445CCx2jFHUl4ULb0KhmBiPRY
	BjhTZyuTbbEXgg0J5TsD8HoJw5uXml211zxyGSc6JZyZikicX2Wwd2MJZMbhaG04
	88EG1uIKUJ5jFVXRJkbOP8mIlk41YcEhjM294+Uu5Zsi9i4O8j1cuNTzBPsSLXT5
	eB/4LjIVM4FW4ukmmQGiH47B1iCtCrwRzQbxsp659Zt2P2AuNthFIgFG1iicOBp+
	x6SMlQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c114c0ev2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 20:01:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12337114f3fso3648560c88.0
        for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 12:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769803262; x=1770408062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=;
        b=Pl8Fsz8Mnqs80yAeqsICjpZMYuw0YVjsI5MoC2nEkEYmPCIh64uuF4DCe3E7B7epVp
         C2Xw9I3g+grDIdRKu2Bmq9LZMbHxZ3m+ahmfAPyc+ryJa/jko8fuOX9IvUTNjoKRIdK+
         mxoWENl3XjFAjD/EWcouza+OZLHVS9N140MYZrurLxaQzs64PvWkYzzgc7bV4gFXflxr
         oT3SgLDjQSk/FRYhSMakWZYDtJ0HL4z15hi2yumpn5Cnk7cfB+DCZIVij/zpwSkUJmMw
         0/CJLzmZZdnYGpa843AQA/zE3Z4K+2+2KpSffYbEuExCy9Y+UwUwFR9yr1KQjb0pqLov
         ao/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803262; x=1770408062;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=;
        b=qaUrhpZWnBCxxtzy9XZLblWxmZD/owB3400UUgo+CvXvdZqEDzvpgiM9QzlcjeEiyu
         5t8XtSi8aL6Ap18EIm8UN9USX7QAU3cHJ0f6o/ZfJqaeRy6EUzAt4Hi/Ia6XQ+MrxV9f
         5Ka+kx6KxagI6+m9TxjpfZv0mnWAJ9fF8v/6cwP9OrNblqn5JhpVKTgsyuCu4cfwFFnl
         ZFLnSF8ZhsgM7h6jue/L3gb70As4OWiKZuVe8KCVICpIxCJM8GZbrCKGEEhviNgIBL6N
         bO0s3ZPl1N7tN8U3EhubsfUJV48NRu881LPWU4Ej9bHlufTd79lh0wDVSQL198OsehRD
         G7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXq9NR59GTIQswvuJGjzUDzegDUzSQT0XMjIKOOeugEt+6yK2pEoXPJy8cytnU+rEneru7W/DQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YywVhhF+unNP9+RSEorakyLw0CDT6tbuZAKRTuZpcdmKw1XsQRJ
	QG2yc7kbzizzBdxVrYVFAPA/QuLeH8LpVh1yFrW9K4drUxzua1/PwaM4HIzlvxHxE6PiX417rFX
	cjsNVxr7+cOUU5LTP3+dauRJpYiq6uiuIdLH3RIWIiKoVy4/gNTsJn2oZ5YvIhri2
X-Gm-Gg: AZuq6aKB00aFwepYKlp5J/U1T9+KUga59U9/LSNW1gxRkEC77mw30K8CvVP65SXQkMK
	1qshKOKm6NkFASz6+ZCvZqr337aD0AJMULNGpcPFmHxfBG7nzgQZLIeOnT17mLPOt6H0/v9hpL7
	YFgZjpFWAl0SQHyuDRL6WgH9GrIZSR6wu+RvK91MH/kHvFGj1nro0ELIq/ZB+Ptma2f2m1dat/h
	9p81yl76upTDZGwNe+u8Rfdfhl3jzWRCWHDgB/drL6jGKeDrmgDsAnCvnjfGFqWM5nkfM//H9dy
	m1EACTlOue5zGHQslKh6hChs8Bs2Es0E4ew2+/PDPXrMVfOb+Fm6WJJrsvhRD86RUDLa6csEvqB
	desRbMVEwcNu9wtt1faEthxRomGRK0LMed0QtzU51mx9muP7rqujBsAdQSkQO2YfmJy8qIrqYvG
	wo
X-Received: by 2002:a05:7022:6082:b0:119:e56c:18b1 with SMTP id a92af1059eb24-125c1000e70mr1983167c88.25.1769803262326;
        Fri, 30 Jan 2026 12:01:02 -0800 (PST)
X-Received: by 2002:a05:7022:6082:b0:119:e56c:18b1 with SMTP id a92af1059eb24-125c1000e70mr1983143c88.25.1769803261707;
        Fri, 30 Jan 2026 12:01:01 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm11546699c88.16.2026.01.30.12.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 12:01:01 -0800 (PST)
Message-ID: <7a763739-8acb-4bc2-92e5-3ff8a3fa2bf6@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:00:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260127
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
 <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE2NCBTYWx0ZWRfX5EcWQR3RCuHP
 XTpJ50d42j4CPHhp/0NY/VuOTY+DB3w/oDkkwWcmGPLdkcK4OoWDn8eC7FIgwgcjHN7e4CXmBlY
 icKitVdNR7kAFjRcNysxR694y2d+GwGND1bLIm73rKPZkaCm2Qhq/t6jak13Z9SjyJ+3krP+ftk
 ohwqEfL4D55BiQX8dlME3OBs+ufsKDP1i25mwFxri/3npoVzJ8uZHwH2coSDrCb0eXwhM3zSOAH
 /gHSIWZ2RffdLCbcpqj0ywmUgAYeY/n0GVz/t21Fxvj5TLJtlCAT5HQlUctt+ohLL4wgI3KzmtI
 IY1Fc2Os4/F0RqvWlg0dfOMyDAVnAJWkQ4u8OUOhMGthV7NpnI77Kr9kMCXraLlDWDoMGOejt/H
 dL+bKPs2iNPQoBn2B2vkwR6mnKQIkmP3NxZ7KO4JzLRIkOjddepwJ1wcolqqtIJzH8sjIam0F9R
 yz5xm7XO1qY66RCDJrA==
X-Proofpoint-GUID: W0_gho8rL7jPC6P3bNPy-lkm4c7Tiw5-
X-Proofpoint-ORIG-GUID: W0_gho8rL7jPC6P3bNPy-lkm4c7Tiw5-
X-Authority-Analysis: v=2.4 cv=YZuwJgRf c=1 sm=1 tr=0 ts=697d0dff cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RcOUi4Ga9jvAjSuFGeUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_120103_655225_4BDB0DDB 
X-CRM114-Status: GOOD (  12.08  )
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

On 1/27/2026 10:36 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 10:04:46AM -0800, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k.
>>
>> No updates for ath10k.
>>
>> For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255
> 
> Don't we need the variant for this one? Otherwise it's too easy to clash
> with another unprogrammed board.
> 
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
>>
>> For ath12k update firmware for QCN9274/hw2.0.
>>
>> Please let me know if there are any problems.
>>
>> Thanks,
>> /jeff

Please drop this PR.

We've spun a new board file that addresses your concern and I will be issuing
a new PR.

/jeff


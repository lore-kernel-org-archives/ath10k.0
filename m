Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7DD109B492
	for <ath10k@archiver.kernel.org>; Tue, 31 Mar 2026 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=; b=PilkBOjjncydbukpkWaTK59F2S
	hUuUXAqzT9/8wuQ1chzZ+Ort5QL89CC7AjaqofggKEMRJfdYt8ijO5g/Evmo0h0AJPLpoFUemLoPT
	NbL327gyBNV1YKtEsYISxo8SZVq1NUaNg0ANCuhfyzClIReX7W+a8ljmkJYZXOH+eOKsKZEjqEZGk
	4kt7XQ35Ta8dX5VBI1ilyb2TYdceKOoevZKAlp25e7+B8ylNQWvUeT//aJ2YeviCDfxoVNgrJHRlc
	IN1q8GeI2U1lEy6knKVDks+fPVU+TwaqrHGW5Rh6XIQRZwQcUN/+Oush16TwBIBdhn74xEFyMNKiQ
	77jEQ8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bc3-0000000DEQT-3SzX;
	Tue, 31 Mar 2026 16:06:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bc0-0000000DEQ4-1NV9
	for ath10k@lists.infradead.org;
	Tue, 31 Mar 2026 16:06:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VF843R4053783
	for <ath10k@lists.infradead.org>; Tue, 31 Mar 2026 16:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=; b=anS9yjmUXJ5FvfR4
	6JeklTNPPU5LPXvy3e3FMSrPqN9si7uIUzTuBAMNeK40EZSeR/Z/0ajVMn+ioIWE
	PjSAePKV5018ajkbs+LMRLuudMch+v7uWIFchBf74zrymrStIqCRqc+wj/F7VH0V
	5j3yVgKltiFxio1cxRX0iifjFEdZ7ZOnZdlkSb7j7XJg3W/4Ns9dNcQ8T/xf45PM
	3/JhFFKV2dU3qr60NR5wgzuvtgGq5aOaI8zlD6+DN9HoXDl/x4ajnlgugx0AHS/l
	EJdEw0ZkSbL3cdJ7UBBzYrTbleWZbDE6n7Tl6U033LpsIXxQlTR9l9cBL5SvmXBY
	iaWmhQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3cpk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 31 Mar 2026 16:06:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso3704480a91.0
        for <ath10k@lists.infradead.org>; Tue, 31 Mar 2026 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774973198; x=1775577998; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=;
        b=i8ZrsnqC9sisMG/7BGtCiUOCMPrK7E8LNViswze01vxMxl+fXLGmAmJQZjVG8Aqelm
         5O8NgXawQ/X9rwL6z+9Ks8bphWR/mBd95ZwDRwpN7wEvFlRPe/VErTqhH704DUOKiGkl
         Ag+kUXcAjjxsrEWmLXVwV3hQwrb65/n46Ghg4kD0oSmnbhI0bcoU8t6TpWM3Yj3qhKCw
         newpuskPmkJgDTNvrxZh6beNQ8WbkBm4JE7B29WioSa6BYFDGczmHE3P+WTG/but7tCu
         aLoZcDqajcO+QD+HDmC7/Dqd9buXUh5BQBt6cwyOw5lFBU6OjFcuH4tvfZg6ZyFsHS9K
         d3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973198; x=1775577998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=;
        b=jhYBXfFs7eOC3utP3DmuMiuRDG3uKUUCMOkf2vIgxAw78dzTRX5XFVE1HNjz/u8jRk
         Jc5d6j+2E1prrJLa9dtwOdh2TicnACQH6R5n088u0TSNb5tBZBX78Aw9QoDfPRmlqXeI
         tzx7LtrcBqq2dQJPNp4lv0HqMCd/l8nHT8BgTjP2uV9RXlrgzF+jRlUnWTb3IwoYWwSw
         Ncy3h8UBLbb6dkSfmNXGMZz7naP/eax49V8t7pvqiZyJtQo7wvJ3PCKbFcwgqJO0i5NY
         2r2cTBNGPoNUVMIiH7PMtL/y7kkCI3nt9a3zPWWe4jGhRDrzfgK1n0MANoCsSSGGmhKy
         s9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXntErbQKbC6q49gNZuWHG7JCB3j6UQ2HWGMNOIkD1C8nBlQFAzxB0Z0/KROMVedEx3cgHCfs4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCKqrkCvndsMajcbkgqNxVnfc52E0rQmaNLwkHyUjqWxqNgdGg
	mQAdjHq5vCsM5NmhkzfD4rA3W0naIIr0WYhOoNgiCa67piOoIJtRnxS5nCmGkn9K8ixFlVmBHts
	gLs7a6YLVpeF+JmfkSSDnNNc8eOkUPEPcWdLCeuLLGbu34URMteDzWSWcg3KjtgNr
X-Gm-Gg: ATEYQzxmTw53mEALZ2Va40/+mZq+GAcCaKKIG6aFszZ47s7fHmkhnizpvw1PDfhhLbK
	BZTGWY4w3Rt3yXRC3iSqDiL+dwzOFbvWBQFvJCzrLDbtmWbSLmIU8YMWzb2/ZhyJTTtfo58Y4u0
	vPgT1lbrrPVM+Bzc33W4cSqXWlKtM1C+PxGEU6FqLtSghszi3KylLZvgcluT3oe7cctdX/+B5lO
	ZG2pQWa9KXyQbkOaRI+uDu3rfhSiyfitXT7Tw9/pCoioX7ygZ0x57xScQ1kCy/bcDAavGlKqrXW
	K0Q8ce6VdeiaJBc0nAKtG2JXhb+QNt4edZS5uncceyyDT6ctwXHsnuNc2ZlVckog6OT3axqJUSy
	pGY5fAF191MPhXq16VTZC8ks6BODwIWhy/4fUysmJMYPSyLn97vH6CrQHNVShoiTnOOQeI0Bg
X-Received: by 2002:a17:90a:d404:b0:35d:9d6b:9d8a with SMTP id 98e67ed59e1d1-35d9d6b9fbemr9871488a91.15.1774973197869;
        Tue, 31 Mar 2026 09:06:37 -0700 (PDT)
X-Received: by 2002:a17:90a:d404:b0:35d:9d6b:9d8a with SMTP id 98e67ed59e1d1-35d9d6b9fbemr9871430a91.15.1774973197319;
        Tue, 31 Mar 2026 09:06:37 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.193.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe66f7b7sm2094541a91.10.2026.03.31.09.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 09:06:36 -0700 (PDT)
Message-ID: <1dc85067-df11-4236-bfdc-e2117da493c9@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 21:36:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap QMI
 requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cbf10e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fHzH9zTiDFanLkNeTzv53w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jr6ivFuIO4VC9FIHmAQA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0Ib18DO-yd__jCD8Wk-oOgMEK1FYZ5r_
X-Proofpoint-GUID: 0Ib18DO-yd__jCD8Wk-oOgMEK1FYZ5r_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1NCBTYWx0ZWRfXywZkCwHe/YQ3
 SY1gIcUkRO7nA91Mf5kgGDi8wje1o82cNKQPsNLjTNJQB9fywexDYSryCuWO2MXKOpb39Lf7HW8
 EcHvZ9MJPcKCJmYH8qqe6rgF6WHHFNojfdKqQcFofxwanXv3awuEEPEbY0aVhvMKA5hHKYoQaF3
 +TJePExMrzT+2xnn05Ol9FmrcpkLYRdw1eCvcc/OrS83pff6rW0cN+pDRhFnki6QDnzYh6cSE7Y
 NE2dgTtIXI+T1jjI1sCYAqaGfKcZsLhkgOkvFYbyaTC/6Ve/laCKMqbHdaA3qbwcWSawtO3FP9u
 CDWcFbc0le4WiE+iyM7kFfe0OZY4WzFQ94zzRp65RHNxPxhWLckleozwMyKxUyayBTY1t7MR2ai
 vaEWCmC489yyjaFoA6UaOwrsX0e/2y0Xsn7WRY2QbkXkeSwxZrLf4iZvSEwLqqORsiKbDkYeJQm
 bVRmUczoX84db0WUSxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_090640_376171_321C59E5 
X-CRM114-Status: GOOD (  15.58  )
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



On 3/25/2026 11:27 PM, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host capability QMI request.
> Since this request occurs before firmware-N.bin and board-M.bin are
> loaded, the quirk cannot be expressed in the firmware itself.
> 
> The root cause is unclear, but there appears to be a generation of
> firmware that lacks host capability support.
> 
> Without this quirk, ath10k_qmi_host_cap_send_sync() returns
> QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is not
> fatal - Wi-Fi services still come up successfully if the request is simply
> skipped.
> 
> Add a device-tree quirk to skip the host capability QMI request on devices
> whose firmware does not support it.
> 
> For example, firmware build
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> on Xiaomi Poco F1 phone requires this quirk.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


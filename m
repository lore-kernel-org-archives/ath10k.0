Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62A6C982CD
	for <ath10k@archiver.kernel.org>; Fri, 16 Jan 2026 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRcRwBypFQShmuN0jEyzBJtIwf6t2aDrIBCTyHNhTLs=; b=YSQjVfo0MCNVd8g8w4x7TJC6NC
	F7U1e+BqFfn0vjxcTtNkul6rGqypO5WH4ZSjLEZB7KsYh6Gr7xz8SpMa6iS5UZfBkz5wSV0dmd6Fw
	mB5ULIaCSb2jkDXGC6R6pbzcJXoNwZy5v3+pATHiIByxa2Fgy9esSHaw/3w7yJvxWQUZlUTaX9Uz+
	DYrsn2wQMzFzVn+PjockiGl7s5ZvbuQdIMze19VSat82ep+dPMNE/W5dEv+uT9Ic9IyH0VtCEGSxr
	cy+dO9XT7m/XIljm5leIf3vlEDTOcZ/B+N4IgYwmoOQXuyxnU8S7Ard1C2jorcXu4/U2kOOOTyCUN
	05Sy5Yeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglbF-0000000ELRY-32kP;
	Fri, 16 Jan 2026 15:18:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglbD-0000000ELRB-0jcV
	for ath10k@lists.infradead.org;
	Fri, 16 Jan 2026 15:18:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G9iTSR007060
	for <ath10k@lists.infradead.org>; Fri, 16 Jan 2026 15:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRcRwBypFQShmuN0jEyzBJtIwf6t2aDrIBCTyHNhTLs=; b=cVJjBioSxB1YM+YY
	RD/27+OD87cRm4c4XZ/ogHSNFlOO8viEL7BYEuV7xyqP8RUVuydBEEiazoWosaUe
	9Abv8bYRdOhVrWCtF2SAgUfncEMV50B+RqA/TYTk7TPa2nncozkQjPgWi8bsgHWK
	GA/kB4+nGUz9VhuXS5IMarQHEA9f122rrrTy15vq4f/B1+/bF4zzDmwil/je60Gq
	Y2+HNvObXdlUfEpGAE3gA/TMANX1D/GWoQZ3pc5xOXrBgtUID1NGIp5GmV8CjGrE
	XvjYFnBZikD5fE4uSa11axV1i05KIGI6xwQCtNXpddTFis2V4APEtLy+qNe0opXt
	1+j1oA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqjy9rwe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 Jan 2026 15:18:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b21d136010so3492373eec.1
        for <ath10k@lists.infradead.org>; Fri, 16 Jan 2026 07:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768576733; x=1769181533; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRcRwBypFQShmuN0jEyzBJtIwf6t2aDrIBCTyHNhTLs=;
        b=W7+1ru5sc8qgig7FQfL0lVAYCGVrNGwMIYHhogBx864gWUg2IlNXlxFERYGXll/EUP
         I7SzHUFFV2kuH/c+L5YP5oR4nnV6DRasbeBHHeqOe/ml1LGCs7Ek0MlZnCby6Wde3W9x
         DJCk8M0lp3ayn/7cn+P9Y0DIClSLI464xRVwHeLYVNqHbop9yNX58/52yi0wRIeZigrf
         R1A035fz5+Tmw9u0dDU67lBTzufV2uBoi3mZpawHnw+Tiblt34lzK6+4TpfB5vzbnbZL
         /nYrGg78kTNvDprUbNQhLL4c/GoZWz0Z95IiOhe705nCHj2Is/gfvjO4Fvx54fzloz7/
         9YGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576733; x=1769181533;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRcRwBypFQShmuN0jEyzBJtIwf6t2aDrIBCTyHNhTLs=;
        b=MvWdHKaq+E+585++yy9GKQWb+iSdeylD9HN1WbbAhhVhtdFMTKT4gCIueVeqLE+b9G
         H4CyUauQWPa4H/8wKhSzWvaPTCUKAx/ccuIEmH4vZbyAFzphuyuIJLKBIYc7+NyHRAnY
         +sCobMAAGGB3CjEyqFFbDvVC5ccVla2Cjkte5vhxu8v0D7nRfODBPGRQeL6n3hQyX8ot
         xk7MHvrwNEa842hQLc/i+bNhbRsGShqcEHNegzOMKjygjpX9EnrapwTPR0QCmn173jpj
         vtunpiDL4vQmY7PBnhIq3kCyGKlaWQfIBhEbMy4kwfo+YuQzB496AjiubwrFjA75BsNR
         eQPA==
X-Forwarded-Encrypted: i=1; AJvYcCXDC3Js5GePaWsAxPDIQLqzsnKUNy554LLe3aCqDp5bBzqM4SW0Ll3+rpnxJI3EUEQAw8jzw0A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/bk93jlLyfP9QNYO3FJ/8o/4+0WLllROGpePmCqJ+A+iTHLBa
	KhBJChyrumTXeWYJ+8hoWf1uahXsUX9mZDnWn4GFXnMec0vPOcpvqun9HBBbZeBtQEmrfoBmAO5
	3F7ABtXxA+wtjob7Yc1zxkYTHQ7APAZIRrEe/Msy0Y8MzatafZ2DvcXfv+r2RT0yn
X-Gm-Gg: AY/fxX5qFGD4/rl0JrtxuvpRKKVVyRk+NY77O37Ljw0jnwDmU0eKBJsWZbnnDiY8cxl
	iacl0mV0DOE0cw0II/oQgY/cSqSYVH2vdTKXbFsji35JfJylFNaFVbVrwgX/SiCILvVv+rDiCEf
	udkBuhFRyeQwPFUQsZ4DFmzz65kGV9MKJMVNhywEnOEB7O8Lmz8GsZU3LYfsVmCB2qN5j0XJ9HG
	P9yucOl9RPa1NGXjTTbfuoWqpvPp/Mzv/nLt8UsYads2RXBamW3A4NB0lZPCOoctCoNDpIyElqU
	l3qKN3v+q4Gam0ki7qutUaPcGUlWMb6aJ4nxik9aEgoPVyMFsspgrH3ONych/qiHY+MnhJEzGvF
	uTQJuCI2DZEZqIUSZqyc2+oUBRx8BWgr2T0TSr6CymRSXjCAy1FYn2wo8Se2j+RAEqLY5CMtPl1
	3/
X-Received: by 2002:a05:7022:4185:b0:119:e56b:98a4 with SMTP id a92af1059eb24-1244a6e070amr2977267c88.11.1768576732800;
        Fri, 16 Jan 2026 07:18:52 -0800 (PST)
X-Received: by 2002:a05:7022:4185:b0:119:e56b:98a4 with SMTP id a92af1059eb24-1244a6e070amr2977248c88.11.1768576732230;
        Fri, 16 Jan 2026 07:18:52 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac5842csm2773177c88.1.2026.01.16.07.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 07:18:51 -0800 (PST)
Message-ID: <132c34db-07c6-491b-bfda-f3c51462a184@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 07:18:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] wifi: ath10k: snoc: support powering on the
 device via pwrseq
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
 <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
 <52b2b799-09e6-40a4-bea8-c7e8bf21cf51@oss.qualcomm.com>
 <15470b51-d398-449d-9017-304df5ad7cef@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <15470b51-d398-449d-9017-304df5ad7cef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mDjS3dxSrfebdwYvuvFKWXhtLRTB8UKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwOSBTYWx0ZWRfX0ECxeHsak4RH
 uTM3kh8DImAFwVnTueIzoDMKfVJ8CofVMq8OP4Rl4IHwis0iftsmFD7TKdHBYqfR0IlUwLLnIoR
 pjv2rCTP/kpH7ghcrgxO5WGYZ3feTZjNjj9WE8O8VwOqRzPvuzqxWEPGo7iUGIEB9YL4r2+OGu+
 G5jjjZnQH6hAVDxkm5Ke+mGOYs9yVBN0m7UQzYCo6/FByZOAekccV9/5DaKJFRrs+gDqES1wG0a
 gHttYYnw5tFoAfR9OZydpPO6hGycu0xxWFrFz1tVwhexG2cqBQuPaBcu33njO3sfhLApUtjAW9e
 0T46tpzWgUqoF5WloetBk+3QeyAFc/HVIaeenKE7yg7a4nA93Qj/YlJEWcylz+Tg5XzqFStEpG2
 28UM2MyN9/BIopBBQi1e91FwZJOztaxGU8jiVRfrtaY9Ebj9y27SDGq/k9d8p8W8NpDzEw5miEq
 k17tIb5mWXKxNvf6ZxA==
X-Authority-Analysis: v=2.4 cv=OJIqHCaB c=1 sm=1 tr=0 ts=696a56dd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fl7gpmSGIpyIZsR_3woA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: mDjS3dxSrfebdwYvuvFKWXhtLRTB8UKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_071855_361137_DE86906A 
X-CRM114-Status: GOOD (  11.03  )
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

On 1/15/2026 11:48 PM, Krzysztof Kozlowski wrote:
> On 15/01/2026 23:30, Jeff Johnson wrote:
>> On 1/5/2026 5:01 PM, Dmitry Baryshkov wrote:
>>> The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
>>> voltages over internal rails. Implement support for using powersequencer
>>> for this family of ATH10k devices in addition to using regulators.
>>>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/net/wireless/ath/ath10k/snoc.c | 54 ++++++++++++++++++++++++++++++++--
>>>  drivers/net/wireless/ath/ath10k/snoc.h |  2 ++
>>
>> My automation flagged:
>> * drivers/net/wireless/ath/ath10k/snoc.c has no QTI copyright
>> * drivers/net/wireless/ath/ath10k/snoc.h has no QTI copyright
>> * 2 copyright issues
>>
>> I'll add these manually in my 'pending' branch
>>
> 
> And why is this a problem? You are not here to impose Qualcomm rules, bu
> care about Linux kernel. You cannot add copyrights based on what exactly?

I am a maintainer that is paid by Qualcomm to perform that role, and hence I
have a duty to enforce the legal guidance from Qualcomm when it comes to
contributions from other Qualcomm employees.

/jeff


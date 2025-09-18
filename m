Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C8ACAC59A
	for <ath10k@archiver.kernel.org>; Thu, 18 Sep 2025 15:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhSX98HuJMkyrMaoMiSuQu57olFpyJn5Wru3dPmWuJo=; b=jrb+zItCr6yku0SB5nkLxgwg60
	AM9XRH38ON9e4MEywDZB/R6zIGj21TwZvS3CpXj0IF+wrmfmepOKePHSulWUmjBYL2L1Ud9K9LK/K
	X67ObwnyzuSEdyy8aBknVLkALLpS8hYUeocyEihTEeFGXYxI7EvwQvcHipl47gyBeAefHd0WX23R0
	ouNKCP91UE3UYVVIQMSww1wZvh1XWgnpRju3DpobZx2fF3+BIBRqMElDIV6cc5EjXXj8sNcBQ9jWj
	oHKlHtP0lIWtERd4evI0isdYsrVlHGKNgpC0w2pHstXqUXV/mZPwoI6uEUq7oanlLSuzFC7qwhleb
	U6WLybSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGar-00000000O0a-0j54;
	Thu, 18 Sep 2025 15:30:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGao-00000000NyG-0Xqm
	for ath10k@lists.infradead.org;
	Thu, 18 Sep 2025 15:30:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBPY2L018269
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 15:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bhSX98HuJMkyrMaoMiSuQu57olFpyJn5Wru3dPmWuJo=; b=dFi9e74jPDRlKBq9
	wyuv/FewfFCifXgDzVQNKatQxQ/gGqnQVf0D51B/j4e0LDOgDPm6FB9Pf1wHg26Y
	7XtX047T9jmYvLYORZjmXPWzDIuvE/WEAptzPhFj+lxn2J6av7XgMAtof0ThpoSR
	XUC/dPUpYXnV5hI+wCoHNetm43pcvQOKHH/9obHjSYCi+pCBUKFpR+JT73vW85TR
	Vy3XQOpFCKmRxk+ZwVjxLsP58ib2qr8yMc8F98JVXGTvEYNXleDneff21Bv+w9EP
	tQf0BueKnMnV4owOWYel4dgxDEqxKZUGfe+BDnBSscIFwOTFJrkRjXPe1u+NAngh
	Rn26sA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwew73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 15:30:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3305c08d975so1076581a91.3
        for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 08:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209441; x=1758814241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhSX98HuJMkyrMaoMiSuQu57olFpyJn5Wru3dPmWuJo=;
        b=ttNI5OyWVFHAyEDnga1Mf9tp3QdoIc8KrWG3gVPAxb/tEz7FAPSa3c4XTa7QUF20RU
         y8Grfue5tjW/YB4SY7Rsl24EmHnZLg6Q2+n0aPIq00nQhHRB0PWIRP34chQ1zOvv5pz9
         447MSkf4ix9bEiqVoO+o5vBnjzZYJEyRh9RFE0RT56n1OIJhz7DmwSPUZYkm+FRHHJYr
         My+S9/uzz1zoim/TgxcYra/GUkTZQI4+USre//ePsF5LFUr+xvXr0Wz60L9/AB/Hcep1
         aFsR0FJPA4oERHpc9qMH2LDG++TIlWQWymaRln48Kvsfh4k1AhMh+mDJVb6xOvbs/A/k
         FO2w==
X-Forwarded-Encrypted: i=1; AJvYcCUc2szQQf4T8pnezfklaBHGe+oz+9WfwwnZsbyYWAnAIj5EKa3NBdoW8xv9Q0ItSlB9F5A6twk=@lists.infradead.org
X-Gm-Message-State: AOJu0YytrlWVns9qWawJdZirwOsgJsOcbUnlgRpsZLh3Ne6ApQ8hkZ7H
	OsvMjnUGEKEp0Z8Cf5+cfMxoF3rmQUo1dy/f4+ewnGGctmQr9wcDBTOkygYVK14s0g++9YFUvsQ
	rUu1FJnCv4EOUsSCjdTAHQsoNhXaHD4ZEEwsUBxTPM7NTXy0Zt+o7fAzU890vh6Lb
X-Gm-Gg: ASbGncuA3E95cUQQC7gFytTJWVYvk9vlxleEHtwXHhCFEk8WIdpgPpX9ej3RX5aJEGQ
	Oco+i6Ze9+R4+tJXuft9AQKSeoWIBWYWkcIqYSpMyVd0MSidJQ3MLXrmWFnpdtpereRz8EqMHCS
	faeLT7vHr4Vp8nZUp3qyEWpjWl4yxWfyqcdYGmsFpWCc/Pygbw2cwxNc/i2kdorIAjsLZ8Yjyv9
	MhjedIVrkiJRYoLHcCEAaIOBUJAsWvIp/v6cayAui49pdgAvpnBANENxiLT8a34kUrCS7A91zpy
	ORscVTLdWtMipMYs75RtKj+waQHSDgiN+X/DS5Ff8d+Ijt6DQ5lMVzJZjyoCQGAdve7RiX1ZJkR
	ak3r4ynY1NAk=
X-Received: by 2002:a17:90b:5590:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-32ee3f68353mr7443674a91.23.1758209440717;
        Thu, 18 Sep 2025 08:30:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJtZalFVe+kGAbPWvX/SFNLY4dbFllQVIHjbFGW3Gqec+5jAn3kcNmX6T2JYXIMtSPBWimIQ==
X-Received: by 2002:a17:90b:5590:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-32ee3f68353mr7443610a91.23.1758209440202;
        Thu, 18 Sep 2025 08:30:40 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.98.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306061925esm2937000a91.2.2025.09.18.08.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:30:39 -0700 (PDT)
Message-ID: <3ecf5010-7480-c780-1bf7-b0e762bf293d@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 21:00:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] wifi: ath: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
References: <20250813214933.897486-1-robh@kernel.org>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250813214933.897486-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cc25a1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=31WDjHDmXr0yx5AvGNnQTg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VjuCZWrZiTeoWwOd-AYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8K3N5avnPn0P
 B7pT35tl+2SsmgoTRjvoQFSH3TBXm7m/S9Le7u85xm0iFTAIiUGk1nDh2Y2lSAXeXjJSLso/AtV
 GLwlGnTPo1DrBHn9vY+nPq5EfUGNLPmK8xijx86NQb4NlZcNYWMiDNrtI50vjgZLhqtasKIMaJE
 OIcVPu3rQGpXMeShBklzh6F6980oz9bUkfOnowiADijmv9Zf+sayoMUS+qe8FqfiEtbLWWcAWWG
 wAqLChd8R5dcd+1fDhl/PxFXR7DD13x9BWOjGdDe5IXtUAnvUKrO14MNdeeT8Wv5mtTFwxJDOQS
 TB00sFl7m5almt0dRooUf2HL9sQEw2WrNLxJgQGtxPjYPW5zAhGRbYx1pNvXYmmeqDx1JNqcUNq
 NX9AbSNY
X-Proofpoint-GUID: UAnf1snuP2rrPrpjhama4YULQZEmXW7o
X-Proofpoint-ORIG-GUID: UAnf1snuP2rrPrpjhama4YULQZEmXW7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083042_188608_BF07BFBA 
X-CRM114-Status: GOOD (  12.03  )
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



On 8/14/2025 3:19 AM, Rob Herring (Arm) wrote:
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

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


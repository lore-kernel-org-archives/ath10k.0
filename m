Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDE3CAC59A
	for <ath10k@archiver.kernel.org>; Thu, 18 Sep 2025 18:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nF1fA0zbp7Djqf2UTk7dkerj+IhERcStYJUK4pvZ96Y=; b=RRyeBVU+TB6ryptQbQkmndkQCW
	uj1vFB7lV/3fzePcqlOEfXc7lFWJd1fYwDVVCQfjUavSoDl20uSdVpUMxjTLOp4ZzEXfuD4WiLYA9
	ev8SFqEXFsVpQuNdfCfehiMDBotEQtouc6tfyZAl4mQr07MvtNOSY6E/dkHG5AoJQvC08W6lRyHNC
	HkO0t0gf6naCY77djwNm7Hj7DE0sUa4RhBo0RZgN+9nYRGOYGOqFF3d5vTHGMGqrgyOWlQaoZ9MMo
	FjftvHaODcZOObgBLXJYkXsk8l6443/yW+IXUIIdSvajok5tfQllh8ZVxNg2MWZETIgLxGbkXIlYd
	TPF1rSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJaD-00000000snM-138C;
	Thu, 18 Sep 2025 18:42:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJaA-00000000smW-1lhM
	for ath10k@lists.infradead.org;
	Thu, 18 Sep 2025 18:42:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58II58wv018237
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 18:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nF1fA0zbp7Djqf2UTk7dkerj+IhERcStYJUK4pvZ96Y=; b=KH28pdFFlHijuxsQ
	Tkqdw1reTQqEDndBc+MUD9qCFuM2XNpbvqD4c2uEhhH2V4OCR919S5v1UB7AQEy5
	3RlVlVzpTBlZBZONRaTU+84KuVpp9SAY40yGm11mLbRM+bgbzopewjHgb0LbM7Ya
	FGdvtXNzsSTxKCxYO6qfrRFKwN8VwBRaNcPsdcqePqFsn1WGtNZVRw5MqexVIaE/
	iARYmzkEdCwMMREiX/9LTzrhlVHScA/zUXa9hLhVecVVL/hE33NyS+UkgoQRZ4Lw
	tdQryztVonOH63nY8jL4OttMdwwXTOVb/VIThGwyw36RIhVMGDrER0/sPyJn89d8
	9H/keQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwfjst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 18:42:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77e5a77a25aso77668b3a.3
        for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 11:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758220933; x=1758825733;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nF1fA0zbp7Djqf2UTk7dkerj+IhERcStYJUK4pvZ96Y=;
        b=Qjt22S0ewfRCPl78VxHbO2mIj6I50hYWhOWD13EM4Mjpbxiq2VHPFlHBn6Ao76TUGj
         BW4OR+nqKSaME4lvxhfoaDQRDj50jEupjVfSVDucV617VCMMvEphzE3UTDrAqTWuJjez
         7BrlwpEIRY3FDsQFqXOpFEQ1iMjFbBueTkKZU99QVs78+op/jiAJyxz0JO21gyLRj28u
         WEDUOPTC8M4ODe+t1ALhwehtTFJ3p2r+7ipuTSjsP/8GUMQtfo7SfUHKrDbLnfU9/bAm
         h023DHsJVAXkH0Gv35rSBrjyiaGbS/lgPoHGCkoXXuFkHP6SCUdXsFWL23isXI3SVF0o
         Rufw==
X-Forwarded-Encrypted: i=1; AJvYcCUHpfhHUgi0Goobl7ihU/PJWOgxRsXkVyrrIGSoKlrkpiyDfYzn4yYBkN0RMKZvRTbCmIjLkvw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPy52iE0LEjX+Kdeq6gpHwHhDPzwjgUqMJWAH3VUsJq4pL5kZ2
	28AZjfZRoyvrwWVsHqWet0bYHOToJjuUxf5FwWKb/g6M2u+0q24Tb51722hY/uhu0+1od+aabhj
	7w2A/FCnCruImwu7OXlM38Q1fXur15PZEKRCxrFFs7DFRcAVWvrg+Ym8Anm1AZ4GU
X-Gm-Gg: ASbGncvudsO1/eBtSpdXC71tBdz+C7jMwcEg2+vqnmFr5IkExgmMJVHMCz/fDl99Bkn
	wemgARa2REQG5DPfj5tI/v/xLczNQ/seiA+kXf6cMUJL98bQHcW152Q9U9jOfvUiVK/rZ+1hjFw
	5ktgR6syvOKZIlx8vgh+dFlEaWcJk0FFJI7UV7k5c+DyPz+Qgb3UP6HhCh1B8kbCg0fLEewx6iZ
	DWIFQ6Pludhmidu6yFuB9Q8Cv+WdZ467aG1CAMlQDYjwxwj23Q5zjGeiqYGJFDIOHdyX/Dr9Xmw
	fZkSRTASiQvlsWLIIaGA0TziKctAT/auJkaUA7nN7nLC90hJ+fqfvntQX6Du9yJcHHwqr3T75SM
	JcYLF58KzT9T/l2hnnVs1gamOiDLHiD1s+RCn
X-Received: by 2002:a05:6a00:3cc9:b0:776:8b9d:85ad with SMTP id d2e1a72fcca58-77e4e8ae21dmr394525b3a.19.1758220932889;
        Thu, 18 Sep 2025 11:42:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzBPxPNDF/BcchRmyd2ICCvlhe8W1SbwWFUAF0xA+HbKxZJwRAh+LwrobiAdxKNso5yJHRKQ==
X-Received: by 2002:a05:6a00:3cc9:b0:776:8b9d:85ad with SMTP id d2e1a72fcca58-77e4e8ae21dmr394497b3a.19.1758220932404;
        Thu, 18 Sep 2025 11:42:12 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec40601sm3020533b3a.87.2025.09.18.11.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 11:42:12 -0700 (PDT)
Message-ID: <eb3a2ef9-3f93-48be-b6d4-28eeeba84f04@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 11:42:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] ath10k: remove gpio number assignment
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-17-arnd@kernel.org>
 <27c1274c-e021-ba69-175d-a1271c33498b@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <27c1274c-e021-ba69-175d-a1271c33498b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cc5285 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=FtxLtjK2MU5K6IsP0WQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXy0AHaZWSnppG
 eWe4DJxxF9BWCa1nW3fbtTfpxy5q9kSH08FSQsaak5nuVjaJyvutBMkCn1Zavf61/NgLEsxZYQc
 JzgLAjRYcWFUy929zdn0ilMHofLkJHnjQUQ6jfkEXvEkQvTGh2NK/CeBA2S9p7Uc4wu8Zi3zQFl
 3IEdRe9HnBlxsmcciZk8FMpcShvbGsuvsCEFCD7+MdU0hzn00oaB8tBkpM6JTg1+d7oC/tiOx8n
 8tbVvMLhzlphAXa4BKlpyt7zysj4rR+/lvL0IxEo2+WCzgxlstnnd9ZNSg2TKkZ5HwBwAYuixgw
 u2at4ZZHec7LP4WBiVJlw1lRWlR8n4yvw+eQ6DEL8Xo1a9Bhi0NANTKfj1NiJgIOhOMRF8TWToi
 Fo9hMddf
X-Proofpoint-GUID: KqSAF6gxIgiF3qJZ6X4fY-0NoVztpbUm
X-Proofpoint-ORIG-GUID: KqSAF6gxIgiF3qJZ6X4fY-0NoVztpbUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_114214_473896_A20B48FF 
X-CRM114-Status: GOOD (  16.16  )
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

On 9/17/2025 10:22 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 8/8/2025 8:48 PM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The leds-gpio traditionally takes a global gpio number in its platform
>> data, but the number assigned here is not actually such a number but
>> only meant to be used internally to this driver.
>>
>> As part of the kernel-wide cleanup of the old gpiolib interfaces, the
>> 'gpio' number field is going away, so to keep ath10k building, move
>> the assignment into a private structure instead.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/net/wireless/ath/ath10k/leds.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> wifi tag is missing in the patch title.
> 

I'll fix this when I apply the patch


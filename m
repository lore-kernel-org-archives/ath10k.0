Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521E6CCF9E3
	for <ath10k@archiver.kernel.org>; Wed, 12 Nov 2025 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=; b=hpCrmfDq1HBAQChrMRT6HwxIED
	z5LoqUTvP7624a+T714clDZfclePOgc3LO9PtT1FK3kpajaJk+m8t6cXS+4Nm3PpO+b+Lilec0pse
	ccZdOmCCDkCKOfS7u8Vl6Y/g1FrTPvkwFIuxPOMxuV5/aPSxxT2DHxc9yTK//THzD4mMAKiACo90l
	3bp9SvFMVuACb07HgcnMPJ9IrM5VAnsE7ARb4k6Lm1O9MiGMAFhc1uTu3XjNPXseDLR5H2PEGhNhG
	2Y3s3KFK64+wJw2R6IMGLxeqWYTsAlVt0iwttX3sj3yibcs2mZebwWDjNxprTN0kApyoRVuqONX1f
	0Lp0+JKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCIV-00000008zro-2Oq1;
	Wed, 12 Nov 2025 14:58:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCIS-00000008zqI-2hJQ
	for ath10k@lists.infradead.org;
	Wed, 12 Nov 2025 14:58:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACEJ7mg1382181
	for <ath10k@lists.infradead.org>; Wed, 12 Nov 2025 14:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=; b=DA9iyE4n3zka01QN
	OUIbgpHWWC9iG4I8kOUZbbUvhgtSBxBsSBJCx/7kBKprUT91XYewhio0qTE7TUDS
	tiMPYsG2UOPLpqOHZAywGnB4VGLq9uFS/RxRYMJOkGcxa18lxGjuQTxTV74fJtJ9
	6vqXeJ/E/TWZCj2pckwiWAvGG/HKn/XYeb15f1FYlfZrXu84aAYzL6S5wWl9t406
	NZSuYzjgmNjdBVzYLXvaoFKUbpZCXAh9Txh5hiwFbuux18W+u2tP6T27QhL+uO5y
	gEexHJEe+6oW3HkRS41icujvflfOWgqoU5XD4f0Y+0cSzLcqH7GDIP1yQ+YOD4mE
	c9DZEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw483rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 12 Nov 2025 14:58:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f48e81b8so16264135ad.0
        for <ath10k@lists.infradead.org>; Wed, 12 Nov 2025 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762959487; x=1763564287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=;
        b=NWeyIj8F6eC6RGAddsgQa/R7hSAipfs6L1J78WA9jQaG/FPBJ/v6m4ulBSD/PJuGWB
         VfgsnlSmKXTgBXNEMT9iDYFOVog+nPI600TW2ZrHkF/6bnOPFyQN9JYno6cSIDXCEkVh
         PwCEm3dVOj5kGJ7xXOHKhFe9Hm9GmVXwOE+6bM+3xY+QGmw8PCxcI0WuFVpoTnAHYP7o
         qhlRn9KZE7XLCwpVc70lPaYfuhPJz8UG6+OhHgwhvN+XU4KYr5uPblO1S1RESKhcyFfK
         HuQVNIXtpiGLB6bPEoCsO6zKLuaDIFRwgSArSleC0OTvPrOLshEA+SQLnSN3bBJvIR3O
         6Ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959487; x=1763564287;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=;
        b=snsz8QRVc80iivuK+BjeR5jzObJ8cSWuOHny5DHEpPI40cCVp2Yxtrq95L6p4kbj3e
         5S60PeAS92V/e/ZL4sT10haKqrrOFzSQWY9OLksW9rS8dCB6cGnNcdBq7JJLDnIrzGQi
         Bif/KqiJA87py6h7DPXG870I5O2YTjZRH2N+IudqR8ONwFbCFzJqYwtGT6rm6Q3FXK5d
         oj3vDQ1ybH51t/yJTefdoSkVvEAtPKOjLGsQGrekTrJaHlV9MtI5x9uNBi1Y1oJakh7j
         Vkzj1t8KLK61Sogh4jIyQeUrgvrBwHtAwG+2D0cXqRpQbi7wqR6JUabcOvK+Ez+Nljdg
         w8Yw==
X-Gm-Message-State: AOJu0YwzosWpaFt8/QhWFP5QjvazPvFVo+FoxB0JEDRZUBpS4gYFgp/I
	Nj293s9Civ6JzcwpeodvkvsSViWapfeHy49s1Vx6e4qJw+/W+vIxtlzUAgT4/fCONcwMlobqt+4
	FbmFSOPtJRGtE31pZ7UnmRdNEEDjMF7wrHb5PXFe0DI++hVhH4Y/+CUziBFpgob8GTqR8Pkxx
X-Gm-Gg: ASbGncu6BQlPG/clDxwhiOUZRYqVp85UcSArGtsBbN2tTHhS1hfc0A6Z+9gyyus0QQ8
	KjSGHBSN3TKM9xZqXANlOD2HuZLM+K2l/ChltZZT8g7kn1BuYolkiu8hITZLaBzcsBm/J9Bh2RY
	S9w8zv0r78UIzBEtIr2Ov4YQlW2c49Gz7wKgtHCmiLJaQs2ee4AbD3VZTpr1JoR0GubQQQI5U9P
	g+owYm8+DtxfcxUi7jggWF00fFJgIeKFj0goJB+OPynjgkebzheMgv14lmHhjEujkqxy3YJN44F
	cs4CmVHX6mFtM4dcsvSD49HeQmqW8A/lEVtxSHZWfZRsHiY3mE3Bnb/ZRMCfmUIvAwHOtVCPuzF
	ynunuKTg13VMltNuBIlybOB0uJP22oNriFJYtlAf8KI9NMXBfoQ6djJqXK18=
X-Received: by 2002:a17:902:da91:b0:297:c079:4c32 with SMTP id d9443c01a7336-298407db038mr93804025ad.11.1762959486792;
        Wed, 12 Nov 2025 06:58:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrpn0fT+xmTQ2KE3jNXQxBgiCrfh9f+Cowdb1Z+6u8BAS8ehhTTnn4URI8fzcTRIFNufHZHQ==
X-Received: by 2002:a17:902:da91:b0:297:c079:4c32 with SMTP id d9443c01a7336-298407db038mr93803555ad.11.1762959486231;
        Wed, 12 Nov 2025 06:58:06 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc10c573b3fsm1834473a12.34.2025.11.12.06.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:58:05 -0800 (PST)
Message-ID: <c18877f0-1b48-466b-aa20-6207661030fe@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 06:58:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-next-20251111
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <15a98cae-0274-45f4-9b8e-be6fa9720884@oss.qualcomm.com>
 <7d445736914f971bfbf89b3480cd6552434eaf7f.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7d445736914f971bfbf89b3480cd6552434eaf7f.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lOuKyc1S_49xtAVDGgqDMvbWDRp5zsF-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMSBTYWx0ZWRfXxgcf2kUhaOL5
 UqsYVmIY63ZKsaoZhD+FcFEtJIl/ZyYfardWH15wWXiwR4nb/Un3AmWIfYW8NOgyT/d6xk7OsVj
 X7pudvyBugDIs1OD+A+kHAWeA2l0rg6yRzlxLdw48p7rw8N7Ed9c4CW9/Bf0bwsmEFo/h+/aqaL
 Tr3jOTI5Y0mphPuktTMCbH0n96lELtE0E68VHK0aBg7OwONmgJ/zQVL8pTbvPVungeSj35eoDz0
 VmdWW6tTjkYGpAVPZwMS6EeQyc7TidUbfxZVUAXPgLDIOYdpjxewO+THRiO8eQBYmtVw5BAKCQM
 IFR2AML3VUWvzq0LErVccQ3rZ/AnwDAtmngTAJ1oa2XkjZZsgpUpgf3xmdPfseUCgVThK9rwPoH
 2C/yDfl+CURRD3jmEt4c+4hbHS7E+Q==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=6914a080 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7SW9FmOQa233CxgTmL4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: lOuKyc1S_49xtAVDGgqDMvbWDRp5zsF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_065808_676962_630F0D09 
X-CRM114-Status: UNSURE (   8.66  )
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

On 11/12/2025 3:51 AM, Johannes Berg wrote:
> On Tue, 2025-11-11 at 09:28 -0800, Jeff Johnson wrote:
>>
>> Once pulled into wireless-next, ath-next will fast-forward, and that
>> will provide the baseline for merging ath12k-ng into ath-next.
> 
> I just sent a PR to net-next with this, so you might want to wait until
> that's merged and I pull net-next back, to have all the current net
> content as well.

Will do, thanks!

/jeff


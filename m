Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA325D12690
	for <ath10k@archiver.kernel.org>; Wed,  3 Dec 2025 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BglDfO/jIdr7zKm/ioYfkrsNZzEauMUZERszALN1y6I=; b=Ru+LCteb6xcTt96PGCXJvnBRgp
	DmrdVc7+iW3W2YtI7BWqp3RvLsLsJuz4ehlQTxXYs8kMtwH9qqRGPzOk76wOMzcAU2RRwS1JN06+Y
	lzsrPzCHcxCdTCkv1Q6ZgRVxoCSdhi00mKchDc7ZulsxKQTVVyRtxNo/yNsf7Hq5fcQA0VqTzS0GV
	xXFtSwThYqdE1tCbEelMKqRaz5lq3fXV6eu4+MenpYQz5NNyBv3uj3yMjsSLveG1lD9cR7RAjtNJ+
	C9EuLsqoPLTb4TlMPmTjif62Ig6FR31bn9tbPb3TXRPio5gQ292G6o1IssmZg6HCA+HMeTf3aby86
	Q9zDrWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQoqg-00000006hna-2MMj;
	Wed, 03 Dec 2025 15:32:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQoqd-00000006hmh-2ste
	for ath10k@lists.infradead.org;
	Wed, 03 Dec 2025 15:32:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B399L6d805897
	for <ath10k@lists.infradead.org>; Wed, 3 Dec 2025 15:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BglDfO/jIdr7zKm/ioYfkrsNZzEauMUZERszALN1y6I=; b=FZVKGFqCXhrQALri
	U5sKbqW9t99Lp5fTXBTpbTpPWnOq+SmO6stMm6Ql6sLMijxpqpgSybJxagpa6Zci
	cddnQ8SEvcIbGkGYerWrQFJKkPRUjeafCXmFwPNOtKircF+k5kzb25DOOqA2Df6p
	HfYXTBfg/FASHByKZ7GRqWxNG4OHKZIRWuloD1OKvjnwPoLqKWwfR4CJOe0Z9ppe
	0K2BxjbclJCrBDtgnMrc/OaZAaU2CYxLGz6uJaYYhsi1YkbQXocPOOvT5PPQWYWw
	L9n9wa2gct8ExmyflhEgFFAofC5We55LiFws5kTOMSdFYNuYvyQRESgudRPOJ0gB
	DMEA6Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atbmmjegw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 03 Dec 2025 15:32:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2982b47ce35so79279765ad.2
        for <ath10k@lists.infradead.org>; Wed, 03 Dec 2025 07:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764775974; x=1765380774; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BglDfO/jIdr7zKm/ioYfkrsNZzEauMUZERszALN1y6I=;
        b=OkobUH2d+toLIwnhYqC24t6LtfAGWmM691d/vPYFNg/C13QK/fXwdXJQ54RudTzjIj
         QieLM0dg0k5/9aMUjzfl2uCpz94aBTdMrLVvYrBdPf05IRWUdpuSo2cGbUiaYInMb34E
         PON5jdWm1nLbNK0NLHEsPtsHFOKJNOOQoKi+XvYbataVobxOmVu2GtC7PtZAQAMmLPjw
         mjj8Eat0sABMTN55qwIcX/ppFjQYkIBmwnaYmnYZ4WX3knQEWAisUS59674wczdacvfB
         wd31wqUYgFUja7uDaeGrqGzehYtPH+ajpiG9WTcxWGUG6xuv5Kw80VjrZFXOXrTrj6Bt
         3Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764775974; x=1765380774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BglDfO/jIdr7zKm/ioYfkrsNZzEauMUZERszALN1y6I=;
        b=ZZchUVcw2QdzLvK+XuwI4025waO1tg8SaAmYFj2jDduJhf3DvO9aaeunW9PZ5eZqyP
         V0jxujwf0h9LQ4hvJaO5OELW3tkjyvvuCKphBdbm7HwMZ1Y3A7lkaNiV1hH0PU/PWHay
         T0QJYce3i19GR5/De6zjT8VUe9vJM3fx5zyjrdnDKiadyYIq0YM+aMuxCbZz+E+tV7wz
         RecsE8Z76d/+tHYHKK2ccM86mRG1mlPd6hbWxNveIbwE/h5hwI3Loy9nPgSOkuPDvpm2
         1MVbsQdDMIGIhNi0MudBP2rGoBQc0/bnRepMOVfDQ0SLrYMTq79FLBFsYGxC3Ue0AtNm
         SmUg==
X-Forwarded-Encrypted: i=1; AJvYcCW9nfXlzqreCKhRSB7vB5EOq57R5cmQK01UgL9Y/hkcs65ZnGR/iMWqmzYWYQ41FMA6XuEmON8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWrr0yndwvwEg1B9PpmgRxS1bQ01WHhXbzP6AjlUKvhWndTGau
	ijJ1PyPnxaPyh0mauzDUY8alodLVD7r5vGm06mgmqMBwlx/1pJ8atp5Sx/RXRathb0tXKOMOfOt
	C4WDSew7UMQto6GXcc7LOXffvfBA9iEAjODycG5TtGaqoGh7rYwWBUL0HnhiVGzaN+dL5OEVZ
X-Gm-Gg: ASbGncu4vti+UYfkWJ3LAQobMlJoGTxh7zdUY3iMhqiqGup+J3FWzBdNzoY2cWpNRPY
	5gaKkPsWNR4Us6MtynGxsv1KwtR2Eer0zVQf/b12Sr8q6Gq/LZNd6Ome1L1s4pKYPRqLKDVM5tF
	KTrmAkFM9Q43slXx5US1WNQAAmzPICuZtXZPRVRkSSyGOV6rkizAAF0iyVMYRyc4bhRiCYwT9Co
	GtDRRUur0wx+6HtCqIrc9WUL7GLALgaLR3dgNkCkjJWfEizaeGdy9l4ToQFIrEuc2VJmM7ofokX
	EpcCXccmuDVtQUu5GNM7qEWW9/sS2+51FjxRg6tup9NymvQDxuImtkawuncksX+6hdI42HcNzpa
	pVZn0S3ZGZuzB5E2ZR3Ovqh0FJyq4hvA4P7LTsRccadbbhOqAnlVK2GDkH/guy5/PDSK24w==
X-Received: by 2002:a17:903:34c4:b0:295:94e1:91da with SMTP id d9443c01a7336-29d683978bamr25971735ad.33.1764775973829;
        Wed, 03 Dec 2025 07:32:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEktEKz0WBui1MUXo2EzqlKx7YCEkek/vt4DuThatDS1+1BhHgYviHzyHiUrruJu3S6YlCbzQ==
X-Received: by 2002:a17:903:34c4:b0:295:94e1:91da with SMTP id d9443c01a7336-29d683978bamr25971405ad.33.1764775973142;
        Wed, 03 Dec 2025 07:32:53 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb4af8bsm188509065ad.81.2025.12.03.07.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 07:32:52 -0800 (PST)
Message-ID: <cdfab2bd-c83c-46a3-9619-7b129c4a4d91@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 07:32:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k-firmware: WCN3990 hw1.0: Add Xiaomi Redmi K20 Pro/ Xiaomi
 Mi 9T Pro specific BDFs
To: Piyush Raj Chouhan <pc1598@mainlining.org>, ath10k@lists.infradead.org
References: <5530ec0d-75be-4c48-8d59-a76acc219ff7@mainlining.org>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <5530ec0d-75be-4c48-8d59-a76acc219ff7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rQBSu9W9HroCeyBfTG3tikDuQ1xVzHhA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEyMyBTYWx0ZWRfX3rlabzj3UAyq
 ogHrgh9SRrff6IUZPLr+r7N0To3wRbjlKIFg1Zy/fA4YpAUTny1kjd/5vD2ohnGFb6IDnmAODGy
 egpPm0dSx6CmVEoLMlo/1YFNd5vl9JgS8bo9+OpgzfcQUIQjanU2z2jT9qm7D1zQw4LykTpLWsa
 vLVFf06OM7apBGfIOJtlgzFOVD9rMw4K9vCJ1bvolLMWHMBVay3elcG01wIqAdjiyqgYucMyiLv
 8pEAu5IQOgTjbtlsO4bIkubDmbaQmNm8Z3seZUEzorFcJpKwBiZtOYZU06hTmPZMtMwnIS+uHPS
 theTaNX1I8e6nephF2yN/Pg9rD43hQdYBhQUotn+DtaR1e1PsvWKQ7Y8cXCGWS3yXUQ35VSjsHw
 BqwZuK6aPYbJSnh1G8vMq09kxgjogQ==
X-Proofpoint-ORIG-GUID: rQBSu9W9HroCeyBfTG3tikDuQ1xVzHhA
X-Authority-Analysis: v=2.4 cv=ApjjHe9P c=1 sm=1 tr=0 ts=69305826 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=qC_FGOx9AAAA:8
 a=BlDlm8z60NLfc8-Mm6wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_073255_780723_C5C5A3D8 
X-CRM114-Status: GOOD (  17.60  )
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

On 12/3/2025 5:56 AM, Piyush Raj Chouhan wrote:
> Hi,
> 
> I would like to include the board files for Xiaomi Redmi K20 Pro/ Xiaomi 
> Mi 9T Pro.
> These are smartphone manufactured by Xiaomi and uses the sm8150 SoC.
> They use WCN3998 Chip for WiFi and BT radio.
> I am running mainline kernel on PostmarketOS on this phone so this board 
> file from upstream would great addition.
> Here is a link to mainline device tree:
> https://lore.kernel.org/all/20251104221657.51580-2-pc1598@mainlining.org/T/#m3e211f141937bd6c8e1aacc0ef7f033ed3157c63
> 
> 
> Below, the questions from wiki:
> 
> * description for what hardware this is:
>      - Smartphone with a sm8150 soc and a WCN3998 Bluetooth/WiFi chip.
>      - For reference:
> [   11.173230] ath10k_snoc 18800000.wifi: qmi chip_id 0x30224 
> chip_family 0x4001 board_id 0xff soc_id 0x40060000
> [   11.173266] ath10k_snoc 18800000.wifi: qmi fw_version 0x30098158 
> fw_build_timestamp 2021-05-19 02:47 fw_build_id 
> QC_IMAGE_VERSION_STRING=WLAN.HL.3.0.c2-00344-QCAHLSWMTPLZ-1.395356.1
> [   16.091446] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 
> 0x00000008 chip_id 0x00000000 sub 0000:0000
> [   16.091469] ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 
> tracing 0 dfs 0 testmode 0
> [   16.091476] ath10k_snoc 18800000.wifi: firmware ver  api 5 features 
> wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> [   16.123590] ath10k_snoc 18800000.wifi: htt-ver 3.70 wmi-op 4 htt-op 3 
> cal file max-sta 32 raw 0 hwcrypto 1
> 
> * origin of the board file:
>      - Extracted from the stock firmware.
> 
> * ids to be used with the board files:
>      - WCN3990 hw1.0
>          + 
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30224,variant=Xiaomi_raphael
> 
> * md5sum:
>      - e0b0689de053d99b56455de3b6b97794
> 
> * attach the actual board file (board.bin)
> The name of files are equal to the id string in the board-2.bin (minus 
> the ".bin")

Thanks, added to board-2.bin:
https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/5005042e6418335955a928dd3b9ed5a548b4b059

I'm processing the ath10k backlog and will issue a pull request to
linux-firmware when all the pending requests have been pushed to ath10k-firmware.

/jeff


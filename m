Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4A1C83F1A
	for <ath10k@archiver.kernel.org>; Thu, 17 Jul 2025 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9m1vcYVumY1HNbRTAgr3tsYxKmOeN38kHcJutqp6GcY=; b=BLn8dal2RO5zVozvYZO+7XrZcX
	9aGigF9phIjaWocLQOnE5bDFrJkgubJivuuUH6dAf/uLLsJf2sO3HDwoITpqsQT/8AjcE/4XlU+J2
	N1rm1YANUKWh4UKksiXWnQQzGixATG38WCXq8r4NZBLO13oeYcjrmcqEPvEbikcnR86GhoL08XWnr
	oDI5+7rEtYT4h5qOz8qYcPeeFWkVDjK7gtHp9f3F4DrlhReaHSyoDyqr5XABV66a5iDVnL0gUnGNU
	qVIYDOwWpjh6LSbpl5xXewbkuz/vxmIy9HWVaPUZfP8Egt5zYDtCiijBaYgSGXDuicqEIYapqylyQ
	wsHPgnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNmd-0000000A7ZD-4AcO;
	Thu, 17 Jul 2025 12:32:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucML1-00000009vvh-2yEi
	for ath10k@bombadil.infradead.org;
	Thu, 17 Jul 2025 10:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9m1vcYVumY1HNbRTAgr3tsYxKmOeN38kHcJutqp6GcY=; b=LASZ1nWUfdsIRjExedVW3jQW8R
	jYfoQmEHnY4uZoA1Jm2e5kZV7lts3GEjdHXVIPefC5YvP41omWt9M3ow8EuI+yy/XRILM3S28Yb7H
	hJsjgY51Si8LhkLaQ1PyNI62PebPHEXzTrrzRYq1XHaoQdPFAofKKsPp43PQ7gbxAVt8p8hKZwrG4
	JJ9+XMSaXDDJ4TTWfNjQszzVIffvRFN+t3Se2PKnnoLDBOTyIu2SMXmQgsSy/hnBlklHjVG4oBaMG
	OlHG50/qkSB3f0i0/fd2pSKXOwDYfHY7wKCDOipkIfke4Kg7ZKUPBwa+Q/YC3IlpNJRya39HPTI0o
	IKL6VYsQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMKy-0000000AGV8-1Y2a
	for ath10k@lists.infradead.org;
	Thu, 17 Jul 2025 10:59:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H46iWr004564
	for <ath10k@lists.infradead.org>; Thu, 17 Jul 2025 10:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9m1vcYVumY1HNbRTAgr3tsYxKmOeN38kHcJutqp6GcY=; b=lcCN/7ii+6ET6bQm
	W5JrOXTbbJCbkNfiX90VFzbFNdnsU89a6yKqCm+gzmQQAopy7HKsInmt/7b0KfCW
	CrMJ+zifO1sCVrSDy2XozNYjbi2J1RrZD/ID8aWW3uY+Yd/mej6t901aSHQC/j0F
	UQVMGzHYRRhRkB50lYLjBjKGsdM3r2zolpzCtpWu2vIKhMRg3ygMb6tMGgPLnPUT
	Kddr/9vO2X9atuwi3AJDBKWHI1nTjf9QNJKiwKSu7jUyfAZ/t/DKBmj+D0D5TFeS
	QkXd6PAw4KKQ0oK/6itX5Et1huo/K4b0ul9qLoOi47OgldpKY93VtU5mbagw3LDY
	OUQgOg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xsuks4hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 17 Jul 2025 10:59:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ad608d60aso890458b3a.1
        for <ath10k@lists.infradead.org>; Thu, 17 Jul 2025 03:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752749974; x=1753354774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9m1vcYVumY1HNbRTAgr3tsYxKmOeN38kHcJutqp6GcY=;
        b=gqSEf0Gcu+/FgMl1YZ4k92qJRZ7BQN0M+Q/TNJLBgtjb6CANMbwit57Vhza+mh48T0
         x4RO8g2aHPyJj+ZSBaVJiAwUMQvgpOVpCj0bNmFXyJcp7KZTfwp7OZAynldfT+nxSz6F
         AVJHVQsYsstpESaj7tGYT2dfphy8X8l48A0oPtns6MKURShmnekbGwYzkY0Y0oYZuQGX
         /rfrNISAt42X8jRwskva81UlQ/xbb+hJ6TbOpxjc/UKsFP34A9D0dQFBFijeR5TEC8g1
         NWdUL2kkvhUB3+Pq2buv7CiLKQ29Kbd8+fQ1v+9ize/GB3itlF53nrCb5eP7mWB2EFcK
         GLbw==
X-Forwarded-Encrypted: i=1; AJvYcCVDlpWiT97YiY5l3m5ubEQZe0QanudRvc/uEU8qM9amYiaDkITDw67ZC9lpUYkxvhQyhQp/nb4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZx0H55UCuh1QCsYQS//rvESSLhPeYxB8INzsGI/Lq8Vqk0LtT
	zA6khnQuj1V76+SnZ3xyMSLjL6brhiHNrsIlF1YyUGSBRKDnnUucuJni33IFa0JcIv3OvmswKhO
	JMiDdbHO8qIwj+R5OWjHj2i5MxD7ChY23YJ5GFkCnvkYtA7L8EdmNd1XyWBEFAzqN
X-Gm-Gg: ASbGncs1MNGv0i5y1jD3yDWnrAZcmlqUFjKqDVuHeVK0ajSGylh6aRRIMKEVRQ3Pdei
	THlr27+Vp1lZx5YuC1RJKpen9gPLbzh80C/+tlvrvTk68PchpK5+Ij/Zti1ByzgLv6wTt/tCAes
	sUXzGOi4EdP4btaJ3udKFcjvfNi3ubmGyhkrvLTciytD1am7gS1fFXuZMcqTeDYBHDzNfcv4DKK
	P3Mpwe/SMHvbVQiuM7iwY0+XbfPnxfdnr9yEsf/NXtLdUd/ZsYX1jwGVEjm/ryv8gDCwd2CgnlE
	P6l5c2HC35OriAxY1jCwPDX+A6qswOTX+Zi1YFsaNn0DE5kvNmfUr90PrYcRc1jSXx5iHhDtYqj
	pDo9Eb7adJvZVEWWfFD0x4wdoSKNhf/Dl
X-Received: by 2002:a05:6a00:1945:b0:748:ed51:1300 with SMTP id d2e1a72fcca58-75722869e2dmr8491721b3a.9.1752749974369;
        Thu, 17 Jul 2025 03:59:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS/1Q6FwFVvJNpwEqbklIvf1jeMXGBNVBGHmlE5Rp/k57dq0BzAzgcVPz3GfhsuMeAZ0ucYA==
X-Received: by 2002:a05:6a00:1945:b0:748:ed51:1300 with SMTP id d2e1a72fcca58-75722869e2dmr8491687b3a.9.1752749973872;
        Thu, 17 Jul 2025 03:59:33 -0700 (PDT)
Received: from [10.133.33.245] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-75914e6f81asm309433b3a.152.2025.07.17.03.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 03:59:33 -0700 (PDT)
Message-ID: <c4a4d594-a705-4de1-af08-42a72ec44023@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:59:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
 <5502b2eb-f6d1-4ece-b918-1c8561a92607@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <5502b2eb-f6d1-4ece-b918-1c8561a92607@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 44gEQYxTkKWJwjWwuA-aSyvYC8NORIRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA5NiBTYWx0ZWRfX1r1LEmnnZGsP
 Nn4OwT5U6wdKWyulopGWTRD//EEESsTFsB7Ja2Bh02L/oIZC9xwDSbyNEOxS7QyoYOsXmeUUWZy
 bQg9MigxLS6cZw6n5tu6GGOBEGAnhyOMhnscY7jGhGhZr91LCglNVjLOVQL0+SFROV9fLrtJ+uG
 7PBiXtF06IwKa14g83AuqmmqxuJ+B3V8MMT09nAEM9rSu78VAicM8M2+BZWpCCWMzzwHlysXgwk
 9puynvHydYrMpXZY9a+G/ydiaBJFyfCU+4VW5zyEoBUOKt5EcFiszN8+J6JuIJROgJldNwHasAz
 Fxdi8X221JyT2R2rfnA9RtqY7oNZ9HWkxYWGj2cYKGqcDMp1vhpYzZ35cMXMFfOqZp5TQqBQ2pf
 nfr+MS5wGFI8AayN0bcslBvj+IdFUSFgjGJuAIpngwiqV2jnEaDxwSCq+jIZhSyGZXp0AQga
X-Proofpoint-GUID: 44gEQYxTkKWJwjWwuA-aSyvYC8NORIRq
X-Authority-Analysis: v=2.4 cv=JJk7s9Kb c=1 sm=1 tr=0 ts=6878d797 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=Ghoe0wLkBCzmZIYDIaAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_115940_789069_1D11D1FB 
X-CRM114-Status: GOOD (  12.32  )
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



On 7/17/2025 6:55 PM, Konrad Dybcio wrote:
> On 7/17/25 12:46 PM, Baochen Qiang wrote:
>>
>>
>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>>
> 
> [...]
> 
>>>> In addition, frequently I can see below AER warnings:
>>>>
>>>> [  280.383143] aer_ratelimit: 30 callbacks suppressed
>>>> [  280.383151] pcieport 0000:00:1c.0: AER: Correctable error message received from
>>>> 0000:00:1c.0
>>>> [  280.383177] pcieport 0000:00:1c.0: PCIe Bus Error: severity=Correctable, type=Data Link
>>>> Layer, (Transmitter ID)
>>>> [  280.383184] pcieport 0000:00:1c.0:   device [8086:7ab8] error status/mask=00001000/00002000
>>>> [  280.383193] pcieport 0000:00:1c.0:    [12] Timeout
>>>>
>>>
>>> I don't see any AER errors either.
>>
>> My WLAN chip is attached via a PCIe-to-M.2 adapter, maybe some hardware issue? However I
>> never saw them until your changes applied.
> 
> It'd be useful to know whether that's a Qualcomm platform running
> an upstream-ish kernel, or some other host - we've had platform-
> specific issues in the past and the necessary margining/tuning presets
> were only introduced recently

It is an Intel based desktop, so not a Qualcomm platform. But it is indeed an upstream
kernel:

	https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git

> 
> Konrad



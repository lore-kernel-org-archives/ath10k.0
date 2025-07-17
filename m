Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75296C83F34
	for <ath10k@archiver.kernel.org>; Thu, 17 Jul 2025 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=; b=KNG+AlWr80+OysRVOvrOwYuY8O
	VcugQx8PJn1AtBVrdSYT3sqzTcAkeLY4ydZNVfe1bEEoWhtDpgiPNWYngbtE1Q9eaSvrnFg9CmwBw
	TFHtEZZ3xKmeuLO3PrTc5BD86pZnVfwnMObR1C1AS86eVkQS/CL9DWsCkCUeiwGlTk8+g8V6vxYri
	yTjfPh/G1O6+UcW7eJHONODtOqXdRqzK5n0JVh4Q3I1KyPliOYSoKgSkRSbnXIXmgkylld/bvOnUH
	g9A5j3iXgTBRBu3dSilBmoAIgE0s9moPuhCkDGR/Ky0OQ3dRvqUneqUnN444nHemjaDBqcv1RwsPW
	QBesQOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNmc-0000000A7Xa-1rwI;
	Thu, 17 Jul 2025 12:32:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMHN-00000009vHe-1dkA
	for ath10k@bombadil.infradead.org;
	Thu, 17 Jul 2025 10:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=; b=FmXjleccE/Sg9w8JvYWWnDIsKR
	Gq8ASt01gAb86ylMG2f7fRGdFt/6MTn+bLayvle9sGFwVIAtXq9yS+Qi6xwk2A7E0+EOC8ds00M1C
	eyYy3m8bHjNU4oKKswfBH1M3WaZjPK06l+TTmEGyCb8jcAKUw1JSVCmRe0FEz2Y9epE5awcjzIEQN
	CA1pUjHlfDvq0X8bB6nB5O3hFt445YIvWPRVqoMSl6cDnP7pECmJq+Ex2lTtiT+QUgrxmikU+vqc0
	2NCYXPOEhOAC+mV//EAEgfhSOsPYqVFtdFxHuWrdWGK6BRnCiM8sw2yuMR9qg9HPH1YNLEOtq/6qN
	1vRPoKCg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMHK-0000000AGHl-0mzf
	for ath10k@lists.infradead.org;
	Thu, 17 Jul 2025 10:55:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5KqBT021699
	for <ath10k@lists.infradead.org>; Thu, 17 Jul 2025 10:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=; b=IZDJwHd6XDcNhEnd
	3yf4+K38F3BML7mfcVVvbjH/f2Qlf0RdNFFggnIMqcGgv+5Tx0PZmXfho42t04C1
	pKsN6fTlZYmh5W077iGc97meCjX52xm4sbvx7+NN855CHSby5S6C3cW9gvHayI+Z
	YRFiQEnF8EnHazbc9mgiPOtVsjKT0rYYbVwRpSNlRztyM7kDY9kwqbSqqIlesG3O
	SN+Em2culeXThD9nnqxvOn5WH211W6FBvPA2gpI3RRHyQm6TZvSyboWXkhGEd+fp
	wjMTQulwOHt3I/Esw85vMa4xMcnyuWecMgFQosNTBD/xy+gDyhKdfxfukzSBjAZR
	oo3vHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8f6ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 17 Jul 2025 10:55:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab3ab7f74bso2021031cf.2
        for <ath10k@lists.infradead.org>; Thu, 17 Jul 2025 03:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752749749; x=1753354549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=;
        b=swpeG/JAjZLdByb4k9I2MvBmpzsekjpjaNTb8ZjrC6RXJdPp3B5PuKSzvh6kpv5ofZ
         sA3jX2FUvDXrBATdWpoJQ6mQN3xy6g+s9Fo+RjCAKFfmcKO2ioxT+8dlCM2vAnCxcFm4
         0pngqcw2aIubK6OhKs2zTqVN4xuoAcXs8214oHkZl2plTbqSVlDNn1dgisz3N4F9HxZe
         LAu+puPPfZoDFaONszacNy0dza6dPDq16fGhmqHGrj+gUiEVaMhBiQw0YYkPWCjiI70k
         Gm9tU6C/6iAViB2nj69YKp1iNBTV1yteRHd1ktuxixS3BJlji+DOt24/J4uznNOoOZ5S
         JgEA==
X-Forwarded-Encrypted: i=1; AJvYcCXrdYjTQ4ujl5OeyrU8OCq3DvTcZkY+ajVded1EEGikzoT2F/s02Y6FzIOEEV3wcIVCiAUTePo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsDd8OHZX5/PD4+iUC+0wihL8iobg7sHXzzKZqWijdwqZ22qJt
	JOEcaS87trjRSWRSCFOH4ut2ReV8r8yeNF0CtQFwoOcW2p4JUoWF1EgZIJ499obMaRr9f+DiwxD
	qmsULlA7cFmqqDXJZw0rmPARzxxMhCbnQz6gkxfBri9Vy2RotZFs1+itD4NflvswA
X-Gm-Gg: ASbGncv5RiZJh7n6HLrc7U+Sg/2ndeg0Bv3HL/aZwOYBwyEWZzhZH6OSrmdvnq8o3Ra
	PSsoDCmPon28CNhfqgokohjpco78VzsZBnGp2G/UyQdcyKd0UnTC7b5t2YfsQkSrSrx8fWBfmcc
	+ShvDi1PpnAAqR9ift78BOCI5WEfkKWzdWpARl79iuLVNJ7g6en0L9xDjZRP+eqxxAXETUQ4cZ9
	qzBIfEXd1HiyOc+34NQHm+0EXp+hwBY0TAQquC0IwujVBZMCKWX+DnxN0HVTB14nKgwssiWJZ+i
	rJfp9KrQcXr8jsKADGvvhSl4xjaBPYeTRABr3sy+eZxujsWfQ4eKNunChY/cPdBkw/3rJoqLNRM
	eYwIq6UBEg4g/LfaQZTrG
X-Received: by 2002:ac8:7e89:0:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4ab90cb3599mr37973991cf.13.1752749748786;
        Thu, 17 Jul 2025 03:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIXtaAbwds9yIaxYyNO5vMi4lC/pKMkm1pehCrB0BGO1mpogQimYGvbA/xUnAXMGKXn/lD6Q==
X-Received: by 2002:ac8:7e89:0:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4ab90cb3599mr37973741cf.13.1752749748206;
        Thu, 17 Jul 2025 03:55:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9733935sm10034847a12.46.2025.07.17.03.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 03:55:47 -0700 (PDT)
Message-ID: <5502b2eb-f6d1-4ece-b918-1c8561a92607@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 12:55:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA5NiBTYWx0ZWRfX6LuC+RBs/WUe
 4HCuon1THVCvRU/C8tbqKxpJ9a1VUj91ObWqYPRqG58oQE28/f2xls1n4p7qkVzp/4re4Ia5zHt
 1ftWyyGxq+LR2fhvaylb/y4WbsWG/BLMemqZKKo7PufSLbQwKd/NFcoI++61Gwbx0XBLe24AzyY
 MEU8EJYDf5osc3tvRwA/dzFHHsHU6a6iBJbdGJLGf7TKCU3VH70KLnfpb5BBJaWnAfA3MUlnhEE
 HbxoIsAA575giAZaIKaUrGepcTFSGN+W3A8xl6WbmjuFa1hzRQnCrj2sZpeOeS93JaBcMeO+RZL
 hepzDn6dJNyV22uh7WR++Cqb/8xYxajbWfhMFyw9yMCHWHirO648mAqBRsOgfyqMxLjiujLAJwZ
 iSlO7XpmfGaowEQ2/WAeC4nUtnSzPIXMdYqF/OL5uUsvYMWnWAd/Y78nInw1wFjoOCzFgEYm
X-Proofpoint-ORIG-GUID: RYG0kmIhUwLdhZdkA-aTRwa-wQIeWS-3
X-Proofpoint-GUID: RYG0kmIhUwLdhZdkA-aTRwa-wQIeWS-3
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6878d6b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=a0K6PxZnllCBz7J7qkkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_115554_537789_3EF0E797 
X-CRM114-Status: GOOD (  10.43  )
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

On 7/17/25 12:46 PM, Baochen Qiang wrote:
> 
> 
> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>

[...]

>>> In addition, frequently I can see below AER warnings:
>>>
>>> [  280.383143] aer_ratelimit: 30 callbacks suppressed
>>> [  280.383151] pcieport 0000:00:1c.0: AER: Correctable error message received from
>>> 0000:00:1c.0
>>> [  280.383177] pcieport 0000:00:1c.0: PCIe Bus Error: severity=Correctable, type=Data Link
>>> Layer, (Transmitter ID)
>>> [  280.383184] pcieport 0000:00:1c.0:   device [8086:7ab8] error status/mask=00001000/00002000
>>> [  280.383193] pcieport 0000:00:1c.0:    [12] Timeout
>>>
>>
>> I don't see any AER errors either.
> 
> My WLAN chip is attached via a PCIe-to-M.2 adapter, maybe some hardware issue? However I
> never saw them until your changes applied.

It'd be useful to know whether that's a Qualcomm platform running
an upstream-ish kernel, or some other host - we've had platform-
specific issues in the past and the necessary margining/tuning presets
were only introduced recently

Konrad


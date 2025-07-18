Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31250C83F34
	for <ath10k@archiver.kernel.org>; Fri, 18 Jul 2025 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxueihSNUT2gvfRCYLszVQxvKLpm8BbA2TEvBIULlTw=; b=of2ufd/VOgvYZMWsIwqs7KMVJp
	Y47ZBrJByyBXexlo1cIrdcL1wcsTjiElcCUA+KtPN7N+PHKVF816GeLuHrNUkmYd7WXOnCdFDilPD
	NXDmfYKeBvLL2abLoUZZ+oLpoYR2MGp157E7JThp5AozGjdcomweJ4fCToocb+pxg/3j1lcYy4jEF
	OretBmLuX9gzL0Up+jNm+MyKZrpbMVvt5kHkOeDUKmXiYSbTQzCDrkDSDR/IPOb6/WTVAuLq0EjPo
	Uj6ppPR/EY9N6j6kswnteYL3rntjAG6F0uqgD598X468pyxi3BixaxGRmsJGTbvBRoi9z2+t6tkrw
	NOz5gWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg9K-0000000Byat-3ons;
	Fri, 18 Jul 2025 08:08:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg4S-0000000By0e-35HT
	for ath10k@lists.infradead.org;
	Fri, 18 Jul 2025 08:03:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7u4jX015616
	for <ath10k@lists.infradead.org>; Fri, 18 Jul 2025 08:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxueihSNUT2gvfRCYLszVQxvKLpm8BbA2TEvBIULlTw=; b=R6hI3PNgaBmb/wKU
	275ikXLUpWvTan0VU9GJXpxejQRUnNmYjnz3Mjm+JRaQKEbHtpKcco40BPvput0d
	puOMJKcwtKqrsuQ2OHqbMBHdCuUtebky9mT1WZcjzgj6uVfCu43dqDULfuW08Q5/
	TtBicGgbRW/EQqxyOxhIi3MVKKDq0IzmdayJQEuVIYc7BoEfF38Rpmd2RW9WKmmU
	ipF0/rUS1BDPZsI0gy3p11dQvPviH3W/C03bxuszcW/qEluvI0XXHe79F2wP3dqx
	M/fBzMbRZjT0jGgnqMTSTD6nfLu3AgAAkJq3SDOWiAKKqhS0vdPHRr2JjTJwPs7N
	RhZIUw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dywmau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 18 Jul 2025 08:03:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso1818548a91.1
        for <ath10k@lists.infradead.org>; Fri, 18 Jul 2025 01:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825835; x=1753430635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxueihSNUT2gvfRCYLszVQxvKLpm8BbA2TEvBIULlTw=;
        b=ar20lI/XHuL+1JgSspaYyMhUoygny3M9W+Ds8rt+A5b5TpzM86T45NAK8qTuMWN5E3
         72FyIAweAktE1NYOs+GwNhNfwMtN99GXUOUMna5kJmfZmDh4x4ZWInHINhZjizXwaciE
         79mbYQFGSTccafyETZORzbsA6GUcqUdNr27Yp38rJh2EGmfsSe7EPuSkYlrV3la4C2Qu
         M4p2pWNZOfkdym3GcaekIhbiKgSv2OSBJ+Ci2UjHqFmnFe3c23/m5UYUiuZUoPOMnQ4s
         kJaOiLaI/jM76BN/S+Y30hbsC6ea+cTd6DIe9CpR4XrNBEG6LXSOxfLqnRbaiBEHfqkl
         pIzg==
X-Forwarded-Encrypted: i=1; AJvYcCWizyFiJLlZKk9CX08jdl8+UINpAmfPuDLPM3EOwAClafwWV8Rv0CoaMDQ4wT7QXb1hkf7m95k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRA5PzcWTDuVbG+z5dMNDDhoiA07cGKLtzIjTmexZSMx5fc20K
	Nz1nuMN0te9iGxe/bsvLvvzYyFo6Jhy8XndvDnEitrAiPRBArh1qjrYS3T8BZwXzdeTk3qvyBWn
	S7vl1AStc+QKQV1nBMp7mAZ30QWyzM1gAsg48wnQ1zWw83TkLwrXtuHDilEqBd0Q2nILBqIXE
X-Gm-Gg: ASbGnctHSuYRZOKwv/+DtY10P8JATiprjvO423MukuNTsLUvKD+axC8A1QGfXOpga9T
	+QC2EklTarf8XsIlJX2lziqEae5cPwtuwRqk2+2KqRB0s5MVW21mpuV7CiALva5boiTcJPS85/l
	bsRvwiuV00fMD7xIJrFJxGBQB09TeBPyQBbDaAgArbW/6cx4uvsvOs5FM15/YQE2EOS5vguVsK1
	fkoE1wvz70GYNxNZHN9InLSsNHg0gcJ+T2WFPFOaXuNmojHmpYav+2Y+iO52XU6QHWhoMLtRx8+
	LJYf3CSAZ1haarUCF74cFrdsZrzNKLIqEabUqDrgZY/SnDcboWTp9ApkAOnVx0lYgfeEXg==
X-Received: by 2002:a17:90b:38c8:b0:313:287c:74bd with SMTP id 98e67ed59e1d1-31c9f4c46d3mr14699041a91.33.1752825834927;
        Fri, 18 Jul 2025 01:03:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxPYhZgCck07MGmNFAvaF85ucZQYS+3cPmHxVMPoQhjM4CsqlXubj80zgLzii9a5VFOEcvWQ==
X-Received: by 2002:a17:90b:38c8:b0:313:287c:74bd with SMTP id 98e67ed59e1d1-31c9f4c46d3mr14698992a91.33.1752825834371;
        Fri, 18 Jul 2025 01:03:54 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc0be8975sm737350a91.1.2025.07.18.01.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:03:54 -0700 (PDT)
Message-ID: <aa2f6350-3235-422b-be04-a03bd3a1010d@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 13:33:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Manivannan Sadhasivam <mani@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
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
        linux-pci@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
 <o2gqqty6lakc4iw7vems2dejh6prjyl746gnq4gny4sxdxl65v@zmqse3244afv>
 <1db7c119-882f-4184-9ca4-9dbe5a49cb16@oss.qualcomm.com>
 <gx5gruyhrhwhvwkiqlkp2bggqd4oqe4quvqiiphfzolhjtzun6@okogvabkqah3>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <gx5gruyhrhwhvwkiqlkp2bggqd4oqe4quvqiiphfzolhjtzun6@okogvabkqah3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aVW7Q8YnGLBw4BwlFJACE_glf3fPLTpZ
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6879ffec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=bhzlIsU2D2yyHOt3_ukA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA2MiBTYWx0ZWRfX8FRzVo64wQHd
 KrKdQi164tLlSD07GY5NFChYkjwWVHWcdgTIwTNRbNWXzJaKYlCEh3i0bPxSyqkIVvDaF//U/mC
 d0697Y8q3ianKTYlxCRG6+es50C/Xguf6X0KY05PqCAQTW5nJ7c8u4jB/YfA5SaI6TecyKn15UG
 Dluxad58GlCXN2uEcz/hdkcWg2jMZoyQX3c0ZCUgyBnTxmon8zQ8Qw9szMuedz3JMIZ9yXsf5ET
 zmmEwiMgQULbw0iIndDAu+pr3iFaxksKQWcaoS5HNmOK4Ft8RszO8PYLTQ+113A14zqV6mlmJHt
 ptutGHRFxEgYsiSoq2R2fhnYXHHcWKFPqpJncD2Wdwd3fxjHZkKYjzV9/Kk2Q3rpzJ+jiDbvdJQ
 rDCjRS1KAPx1lPUiY2RhTA9wAHAO5g7MRjXg+rCZagsaKqrq5MizHdKmBt+2AtzHLmAforUn
X-Proofpoint-GUID: aVW7Q8YnGLBw4BwlFJACE_glf3fPLTpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_010356_781233_2D9B585F 
X-CRM114-Status: GOOD (  21.58  )
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



On 7/18/2025 1:27 PM, Manivannan Sadhasivam wrote:
> On Fri, Jul 18, 2025 at 10:05:02AM GMT, Baochen Qiang wrote:
>>
>>
>> On 7/17/2025 7:29 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>>>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>>>>
>>>>> [...]
>>>>>
>>>>>>> @@ -16,6 +16,8 @@
>>>>>>>   #include "mhi.h"
>>>>>>>   #include "debug.h"
>>>>>>>   
>>>>>>> +#include "../ath.h"
>>>>>>> +
>>>>>>>   #define ATH12K_PCI_BAR_NUM		0
>>>>>>>   #define ATH12K_PCI_DMA_MASK		36
>>>>>>>   
>>>>>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>>>>>>>   		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>>>>>>>   
>>>>>>>   	/* disable L0s and L1 */
>>>>>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>> -				   PCI_EXP_LNKCTL_ASPMC);
>>>>>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
>>>>>>
>>>>>> Not always, but sometimes seems the 'disable' does not work:
>>>>>>
>>>>>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
>>>>>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
>>>>>>
>>>>>>
>>>>>>>   
>>>>>>>   	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>>>>>>>   }
>>>>>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>>>>>>>   {
>>>>>>>   	if (ab_pci->ab->hw_params->supports_aspm &&
>>>>>>>   	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>>>>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC,
>>>>>>> -						   ab_pci->link_ctl &
>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC);
>>>>>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>>>>>>
>>>>>> always, the 'enable' is not working:
>>>>>>
>>>>>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
>>>>>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
>>>>>>
>>>>>
>>>>> Interesting! I applied your diff and I never see this issue so far (across 10+
>>>>> reboots):
>>>>
>>>> I was not testing reboot. Here is what I am doing:
>>>>
>>>> step1: rmmod ath12k
>>>> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
>>>> the issue)
>>>>
>>>> 	sudo setpci -s 02:00.0 0x80.B=0x43
>>>>
>>>> step3: insmod ath12k and check linkctrl
>>>>
>>>
>>> So I did the same and got:
>>>
>>> [ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
>>> [ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
>>> [ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
>>> [ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42
>>>
>>> My host machine is Qcom based Thinkpad T14s and it doesn't support L0s. So
>>> that's why the lnkctl value once enabled becomes 0x42. This is exactly the
>>> reason why the drivers should not muck around LNKCTL register manually.
>>
>> Thanks, then the 0x43 -> 0x40 -> 0x40 -> 0x42 sequence should not be a concern. But still
>> the random 0x43 -> 0x43 -> 0x43 -> 0x42 sequence seems problematic.
>>
>> How many iterations have you done with above steps? From my side it seems random so better
>> to do some stress test.
>>
> 
> So I ran the modprobe for about 50 times on the Intel NUC that has QCA6390, but
> didn't spot the disparity. This is the script I used:
> 
> for i in {1..50} ;do echo "Loop $i"; sudo setpci -s 01:00.0 0x80.B=0x43;\
> sudo modprobe -r ath11k_pci; sleep 1; sudo modprobe ath11k_pci; sleep 1;done
> 
> And I always got:
> 
> [ 5862.388083] ath11k_pci_aspm_disable: 609 lnkctrl: 0x43
> [ 5862.388124] ath11k_pci_aspm_disable: 614 lnkctrl: 0x40
> [ 5862.876291] ath11k_pci_start: 880 lnkctrl: 0x40
> [ 5862.876346] ath11k_pci_start: 886 lnkctrl: 0x42
> 
> Also no AER messages. TBH, I'm not sure how you were able to see the random
> issues with these APIs. That looks like a race, which is scary.
> 
How about using locked variants pci_disable_link_state_locked &
pci_enable_link_state_locked give it a try?

- Krishna Chaitanya
> I do not want to ignore your scenario, but would like to reproduce and get to
> the bottom of it.
> 
> - Mani
> 


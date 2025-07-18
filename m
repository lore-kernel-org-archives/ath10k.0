Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C1CC83F34
	for <ath10k@archiver.kernel.org>; Fri, 18 Jul 2025 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F31vlSMyXbjYusWa7M3cQemIFdIPlrkmW7eRg+7tqFY=; b=qgFNhp1KlusRIfWdjo8QSvvEKY
	rBBWZEa/lmhrZaSREpjEZLyW1bQE8fhx0QwA/cEDqrMcqLYBycXJPq1Y3J9ihkResGGekcyBC3jLt
	22P/iJOcDhcIibHKLdffFDhdZCjglfujX8rfA+hzClbkw2+4TK/rtpi0is64JqhCdTPMJ/nQPpXMc
	fL6pfueZS8z2uQMAd3ydqea2Rr0RKKi5LA+U2AQTwbkFSOj9lyQjLWzFos20/p7kcTpwL8G3pRIrg
	zEEsKDahVViw7nhbElseigxJw44b5kPtKLJzwgnpdTnZZSe/1lYYD2bm3JT1R9bUuU9p3KHU/dD7B
	ECiEW4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjGN-0000000CRaP-3M07;
	Fri, 18 Jul 2025 11:28:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucits-0000000COSr-47QT
	for ath10k@lists.infradead.org;
	Fri, 18 Jul 2025 11:05:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7cZVT022401
	for <ath10k@lists.infradead.org>; Fri, 18 Jul 2025 11:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F31vlSMyXbjYusWa7M3cQemIFdIPlrkmW7eRg+7tqFY=; b=STGkbIFqpf7zTrXV
	3k9c8VBN2Vxpfg90hCJg59eGHhVaQ2irgJ+ndSuWZq9yR+qNUbRvlCDC+4s+Q31q
	33sK8izSNBd4tA5Q3Wu9+36EF4Halh8iT1Db5PSAScGolBt03WyZ/qgDpd2AWueA
	rcRComGwDeP6rEaYJBbebtHZhzSK9gCIa7g95XGtA+uwDSXU6LC4rUN2FovrrTp8
	BzenXqoi256UGUUL8Kj6W3nfVxgUa6UNQH5DUcg5ixhMi8SK0kVnrlTViFts1N3f
	yIjk+OVswiyY6fgYbs3j1L8Q6cC3gQ1FAHDqDo9g8Bq7AQ/18af1Z0Vt9S8MF7O+
	Szj//Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyb89v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 18 Jul 2025 11:05:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23536f7c2d7so34098455ad.2
        for <ath10k@lists.infradead.org>; Fri, 18 Jul 2025 04:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752836710; x=1753441510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F31vlSMyXbjYusWa7M3cQemIFdIPlrkmW7eRg+7tqFY=;
        b=ofDaFDGvzXNsKPVaOCvlpiC2kN3A2uLUbJsia1O6UP3KrlBwN1wEbA2BPxQwSY0TJ0
         JGpb6/e854R723XnO3RebRqE6O/gQFmgF4UpMX7mQPjUIZA0FMd3hi6w4hFsl12mhh+5
         03SsUSGFaE/5O5MdqoaOrObPt1VhsVljX1+THvb65LzrnwuEEgv5f/f0fuXRH816iney
         QAhtjfOjkR7Fn155UGZVdwpCjkTITxCBY+JDtj5bLWoGYQwhCj2Zmo3xNALHCc8gtC2a
         MmfsfQGvV/2DKe50CPdKAKEAQWRV0JYVqTupLdXrplJ4NGddQ+JogYGjXULc0AjYGs4Q
         /eUw==
X-Forwarded-Encrypted: i=1; AJvYcCVZZZivBYpZh5TWTVvuUMRx6DKj5O/cO59eCgiSLjKxk5vxHpXZOlne8EQs3ILJRkwbpqcaSo8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1nvIRwVPQzBuTz36dHQ+o47XP3jySZdO8eeNhqPQ+D+oqF990
	AbLVEygkBMsEEX4lhFRda0XWkw9W7TF7hAF6wVZLaXg0l0XmXbOOyX8WxB4ry6ukDj+/EErj8/z
	nS4IjmPG6HYwJYr454oYXi4Oakd2goXh4BFZYFCtrBe+bh3MgUY0wRuNo2thTKnif
X-Gm-Gg: ASbGncvDjf+voYeUO4piCIfUWDschUzBDIrRJ2f7kahg9xTBxzZUEvdLB33eXb/1Wl9
	Y9RsywFg0Uvxx+OPv7hWHoLF48ZD5xqOB1b7XLQ5IPL0Luy3OKtMyuqfuGulIxnn7/nFXQNTp2h
	tR0JCh7b7liIRDOohcrD12OsnB6WBL9ajwWUtx/O7xn42qwE6ITLFaENa/8Qa3klKpWTG6NPUZc
	ZOUQYbskVUWC7olMKiJOVE69m3YTYhquXrfApyt0MVGV0bo8DvqW6eIBwwgqY0GrXdBo7OqlhK2
	9kvdQluZGblDHfm8xEMQfgJzuQvABXvHDlxBVFiwj3Skjce7WYMZdASmeUumOWwN5/Nk1Snyb/K
	hix+vANr38H3jY/peM358cRPjxqfAN4pb
X-Received: by 2002:a17:903:320b:b0:234:d292:be83 with SMTP id d9443c01a7336-23e25693897mr152371765ad.10.1752836710181;
        Fri, 18 Jul 2025 04:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrxaqDfHtW8KZ3Yog7NNdzKoptJfo76jyLrkhxmzJHeTOo+hCR8UOXByV7C/6RTEySc+0X7Q==
X-Received: by 2002:a17:903:320b:b0:234:d292:be83 with SMTP id d9443c01a7336-23e25693897mr152370645ad.10.1752836709041;
        Fri, 18 Jul 2025 04:05:09 -0700 (PDT)
Received: from [10.133.33.245] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6cfe05sm11056385ad.143.2025.07.18.04.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 04:05:08 -0700 (PDT)
Message-ID: <30fe1325-16d6-4621-a7d2-811d9c958e04@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:05:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Manivannan Sadhasivam <mani@kernel.org>
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
 <o2gqqty6lakc4iw7vems2dejh6prjyl746gnq4gny4sxdxl65v@zmqse3244afv>
 <1db7c119-882f-4184-9ca4-9dbe5a49cb16@oss.qualcomm.com>
 <gx5gruyhrhwhvwkiqlkp2bggqd4oqe4quvqiiphfzolhjtzun6@okogvabkqah3>
 <otdgyzdymraa3f33vyb445kmssi3mqf5z2mw7w5pib4q4sb7vz@qbrzvrojqji3>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <otdgyzdymraa3f33vyb445kmssi3mqf5z2mw7w5pib4q4sb7vz@qbrzvrojqji3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NiBTYWx0ZWRfX4KVABtfRXGUd
 XlrIr5jYVehJ/auDJPiOPZmmv1ulldr8I/Dy5UnbL8kMzCj146Y0sK2DKMvjLf9yvf1iPfsofwc
 dBhx/hY1rODnsUfdxF8c4qPaSB0eZgFAa7tgZUsprwr17aKmewXYjRFi4RglgxYpnLFQVRf+A78
 zx47SQhL+9+YuE1REON2hAdA8unXQU5fg+QU6btsF6up/iIr8EqHfGJq1VsmoEqP2RdTMnXKSee
 qngIdKq2HznzcuXdmUjVz4+pfkVCtqydKz+JenqbUUkLGuHT8IuwtJqnsTSbXABky0ruwvUBsK5
 3Zp3e02ZqExAtQ+b9tIMkNM3J0Uxra9MwH2mVWLbDBCIZQejbT2EdGG/ul+x7M7VhXroMXVx1E0
 u0L2c1xkjR1bajTBQvEfA1fb81O94frnFD0VleXwZh9EOfCRx84PDq737iKWVrJEYXY/xRSo
X-Proofpoint-GUID: cB_Zb14bv-FAhoIULMz1SK4Ml7ukS8SB
X-Proofpoint-ORIG-GUID: cB_Zb14bv-FAhoIULMz1SK4Ml7ukS8SB
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a2a67 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=_ABfaSfIuMkMDhf_T8wA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_040513_037622_9B9765E2 
X-CRM114-Status: GOOD (  28.24  )
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



On 7/18/2025 6:20 PM, Manivannan Sadhasivam wrote:
> On Fri, Jul 18, 2025 at 01:27:27PM GMT, Manivannan Sadhasivam wrote:
>> On Fri, Jul 18, 2025 at 10:05:02AM GMT, Baochen Qiang wrote:
>>>
>>>
>>> On 7/17/2025 7:29 PM, Manivannan Sadhasivam wrote:
>>>> On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
>>>>>
>>>>>
>>>>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>>>>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>> @@ -16,6 +16,8 @@
>>>>>>>>  #include "mhi.h"
>>>>>>>>  #include "debug.h"
>>>>>>>>  
>>>>>>>> +#include "../ath.h"
>>>>>>>> +
>>>>>>>>  #define ATH12K_PCI_BAR_NUM		0
>>>>>>>>  #define ATH12K_PCI_DMA_MASK		36
>>>>>>>>  
>>>>>>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>>>>>>>>  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>>>>>>>>  
>>>>>>>>  	/* disable L0s and L1 */
>>>>>>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>>> -				   PCI_EXP_LNKCTL_ASPMC);
>>>>>>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
>>>>>>>
>>>>>>> Not always, but sometimes seems the 'disable' does not work:
>>>>>>>
>>>>>>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
>>>>>>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
>>>>>>>
>>>>>>>
>>>>>>>>  
>>>>>>>>  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>>>>>>>>  }
>>>>>>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>>>>>>>>  {
>>>>>>>>  	if (ab_pci->ab->hw_params->supports_aspm &&
>>>>>>>>  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>>>>>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC,
>>>>>>>> -						   ab_pci->link_ctl &
>>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC);
>>>>>>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>>>>>>>
>>>>>>> always, the 'enable' is not working:
>>>>>>>
>>>>>>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
>>>>>>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
>>>>>>>
>>>>>>
>>>>>> Interesting! I applied your diff and I never see this issue so far (across 10+
>>>>>> reboots):
>>>>>
>>>>> I was not testing reboot. Here is what I am doing:
>>>>>
>>>>> step1: rmmod ath12k
>>>>> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
>>>>> the issue)
>>>>>
>>>>> 	sudo setpci -s 02:00.0 0x80.B=0x43
>>>>>
>>>>> step3: insmod ath12k and check linkctrl
>>>>>
>>>>
>>>> So I did the same and got:
>>>>
>>>> [ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
>>>> [ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
>>>> [ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
>>>> [ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42
>>>>
>>>> My host machine is Qcom based Thinkpad T14s and it doesn't support L0s. So
>>>> that's why the lnkctl value once enabled becomes 0x42. This is exactly the
>>>> reason why the drivers should not muck around LNKCTL register manually.
>>>
>>> Thanks, then the 0x43 -> 0x40 -> 0x40 -> 0x42 sequence should not be a concern. But still
>>> the random 0x43 -> 0x43 -> 0x43 -> 0x42 sequence seems problematic.
>>>
>>> How many iterations have you done with above steps? From my side it seems random so better
>>> to do some stress test.
>>>
>>
>> So I ran the modprobe for about 50 times on the Intel NUC that has QCA6390, but
>> didn't spot the disparity. This is the script I used:
>>
>> for i in {1..50} ;do echo "Loop $i"; sudo setpci -s 01:00.0 0x80.B=0x43;\
>> sudo modprobe -r ath11k_pci; sleep 1; sudo modprobe ath11k_pci; sleep 1;done
>>
>> And I always got:
>>
>> [ 5862.388083] ath11k_pci_aspm_disable: 609 lnkctrl: 0x43
>> [ 5862.388124] ath11k_pci_aspm_disable: 614 lnkctrl: 0x40
>> [ 5862.876291] ath11k_pci_start: 880 lnkctrl: 0x40
>> [ 5862.876346] ath11k_pci_start: 886 lnkctrl: 0x42
>>
>> Also no AER messages. TBH, I'm not sure how you were able to see the random
>> issues with these APIs. That looks like a race, which is scary.
>>
>> I do not want to ignore your scenario, but would like to reproduce and get to
>> the bottom of it.
>>
> 
> I synced with Baochen internally and able to repro the issue. Ths issue is due
> to hand modifying the LNKCTL register from userspace. The PCI core maintains
> the ASPM state internally and uses it to change the state when the
> pci_{enable/disable}_link_state*() APIs are called.
> 
> So if the userspace or a client driver modifies the LNKCTL register manually, it
> makes the PCI cached ASPM states invalid. So while this series fixes the driver
> from doing that, nothing prevents userspace from doing so using 'setpci' and
> other tools. Userspace should only use sysfs attributes to change the state and
> avoid modifying the PCI registers when the PCI core is controlling the device.
> So this is the reason behind the errantic behavior of the API and it is not due
> to the issue with the API or the PCI core.

IMO we can not rely on userspace doing what or not doing what, or on how it is doing,
right? So can we fix PCI core to avoid this?

> 
> - Mani
> 



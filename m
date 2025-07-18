Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB965C83F34
	for <ath10k@archiver.kernel.org>; Fri, 18 Jul 2025 08:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Sz6UouOYzYap4GYepp/i96AYC8KEzgfVubsa4OTvKg=; b=B2PcVSTg3edmwQBb38Q4nc03ab
	JtQ6fQ8bDyvXc87tipZ9i+5LgdlYzlBgrA+ryrklWa5wgvJZzn/UF5xwH/TXk5e1rc//Z5YBih9E0
	+Vf9J3GvKKApxtyWnKdM+rIv1nsI8gJvLA1+9+LIZVZNGKWMJ76sUJMCIrFDSjxmahFPXMIDGoNkc
	RdZHHDGsV8cqA5nC5J/EncpTNCKRvD1sfSY5QNDTXj7YVL/yp52qOumENJ/U1coGqMYP6Addl83+P
	wuyqXSf485VPx2KJQhpEEk8D+jJGYmzGXQtvO2YCx/J9M0r5PXnpJmKz5FfibUthCJUWqDMMdCN0s
	7GPOEEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgT1-0000000C296-2uGj;
	Fri, 18 Jul 2025 08:29:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgHG-0000000C07v-309g
	for ath10k@lists.infradead.org;
	Fri, 18 Jul 2025 08:17:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HNkIjX016011
	for <ath10k@lists.infradead.org>; Fri, 18 Jul 2025 08:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Sz6UouOYzYap4GYepp/i96AYC8KEzgfVubsa4OTvKg=; b=YS6d4pEWNQ86kyze
	B3uKrZ6/ciQRyaccGTChUVg0jamBZrUYwPUhJNunx8nOA6Rc8Hy9Dh1TLmubbPPD
	M7hOEZxmAoCjybdFStKqwHaGOEflvdyjZOEVi2vGVbjx7F1UntJ9P2mNfyPj51CH
	wHTiVWtJA/Y0HR+gwbtwsZGTz/OqQUDAA2J4Rgmkb2BdbljzYnaur4blmMYLC9Ua
	FPX1pIsu149aJ+XJYKXTDbBd1zQzVR5/BzFJBjlVEVdtojT5MFcs3mteqTJaXTPU
	4nzsIBjxnFHeVVXhvFFSw3VpF/xzzjJmAOihDB9YpkPPQdjAlx8F+JKaWmRtYPsN
	TTeg5A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc2j9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 18 Jul 2025 08:17:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3928ad6176so1713736a12.3
        for <ath10k@lists.infradead.org>; Fri, 18 Jul 2025 01:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752826629; x=1753431429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Sz6UouOYzYap4GYepp/i96AYC8KEzgfVubsa4OTvKg=;
        b=c+Z2gcWPV+utWvtwncPKtqOIKnvJ8D+AVTDjP8nBESht+NOBhCvW6Rz5hOYfM+yD5D
         nqe9RWscNSVmzZVHF5lDHXfLhegt9eBBH5KC04scxW/aPSN6SSS6Kcqp3zVLI+W85VX0
         2iNeUDhwCSoHgbYP8sFnHJ0j5EtPCnDQMR+vycGqIszNFFR5Eg8GFo+crf5nutiPhm/P
         D1GuTGskZ0Y7QaOvjW7qeEgQHqrtCe/LhL9sqR7Ge0CElh4Rfn2z91gWLV4OCW/Fs8+z
         Vk/Cz054CYhZAu1IMriKcawRhXqtkQ7D8/IJnN9bQlcR8cGMi+MvfhqKJvK6h8M1l/5s
         +KAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO9GKTveGVkP0CN2yhh6kbtZZJRMZ4e0LKqTwx8CuGtzc7Cisz11tQk7+9ovgtmRC/LsaoBgU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1SnZzajKWFrRhuE0aFVr4enhQgNaR+SqDUQ9eavZiZLPTv4iq
	BoKQCZsUMT1v/LBYiIs35kkGY/SdJrIkHsTzTQgv9VJJ+69gmyS4b8CrEkFxLBqhJ8pNR0zV4+/
	tqYcYrqaFPcD/h0OIr8h0wZlz8mbMe1+TgofnvdcWDPDgx/YG/twNmcLJaocY/k0F
X-Gm-Gg: ASbGncuK5jCMsv38Y3SiNvnknu6FYOReAe3YeK2ZkVrRM9rlqNYjY++/nD97bLf8Nfb
	QH1AsRIBW/xbPq+SM21Ou7zzMRNrGIaqrEAJpJPzd+iJmfCTo2eWEgr1bCqENbn+JpX4nOVhheZ
	JnGNZt7OvMNsHp+gtVtdcqW0KLrSyt+NjJlijO+vGJwIBqRmTQydQshBk91U+scdPc3Coov4FNH
	QqbrpoavlaeFiY3EBhUYFcCy1O/QiYITz/Hjn5VMm9mjNjGVOfn98f9e/OzjYPQUOK2VaD/MnCU
	UasptFepMUVzV5DDyqhI4LQ16O/YxkF6rLfJAByP74ebhvLUpglA5KAEjWb+es/8sRPWTQ==
X-Received: by 2002:a17:903:182:b0:237:e696:3d56 with SMTP id d9443c01a7336-23e24fbef08mr150794795ad.32.1752826628990;
        Fri, 18 Jul 2025 01:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTX0ICCMvqiCRiHCtB0fXgHKCePe7G4D1Ocxr/5VJZponrjW4cuIj/Sc2rud59/D0HbeHIPQ==
X-Received: by 2002:a17:903:182:b0:237:e696:3d56 with SMTP id d9443c01a7336-23e24fbef08mr150794305ad.32.1752826628462;
        Fri, 18 Jul 2025 01:17:08 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e400esm8408515ad.47.2025.07.18.01.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:17:08 -0700 (PDT)
Message-ID: <94944e2f-545d-4185-8679-65404cd01951@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 13:47:01 +0530
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
 <aa2f6350-3235-422b-be04-a03bd3a1010d@oss.qualcomm.com>
 <wbmxxpmcjhsxbracfpvaoishnfz5foqy2rdbp3syqrd377koon@t56m44jvdyft>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <wbmxxpmcjhsxbracfpvaoishnfz5foqy2rdbp3syqrd377koon@t56m44jvdyft>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=687a0305 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Dy8vuA9QIKNjNhFCyMYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: nqa4YTrTTke3COF1xPus2mnoc0y3NhgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA2NCBTYWx0ZWRfX7tEOzU+rN3fV
 MLFvGPiWP2hmxZpEpcuiXLhpVZznYBWvq12EZCGXU+CPQp1fz1lf5mVG3AumJixrnzo2iT9/Eno
 HnyBVH/RrwG5k9s0n1JHmCC7fPOfXQBIBlSnA96uL0JCrBNgO62Idyy+vOmu7UuZ/d7uNv71cCu
 31auNoOBACJ9lyXc6Z3WZKFvEqYGY6Fw8rpPz2mPsk4ZpAd9pziEoIxrQbhmSmj364KmqKLD/sg
 a3Fzt9caralQKDCk3WX0BePtPwboGlKoct9NsuihhwHze37c/Gdtha9ddFOwIQOhA3/guOrl7us
 JjiZJ2hSfxg9enbgbAKbOavgF0+/JhThSZZsis0lAY63f22383EbbqShQIqOhrx4cwDx5nZbWLf
 KjKVY4XxPpg+n3tV3j7tb730QnqJDNdOi4+svcdVS2QDklKU/8gC3aMxZFWI6lWs/Kesm4r4
X-Proofpoint-GUID: nqa4YTrTTke3COF1xPus2mnoc0y3NhgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_011710_798923_42F62B7A 
X-CRM114-Status: GOOD (  21.26  )
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



On 7/18/2025 1:42 PM, Manivannan Sadhasivam wrote:
> On Fri, Jul 18, 2025 at 01:33:46PM GMT, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/18/2025 1:27 PM, Manivannan Sadhasivam wrote:
>>> On Fri, Jul 18, 2025 at 10:05:02AM GMT, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 7/17/2025 7:29 PM, Manivannan Sadhasivam wrote:
>>>>> On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
>>>>>>
>>>>>>
>>>>>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>>>>>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>>> @@ -16,6 +16,8 @@
>>>>>>>>>    #include "mhi.h"
>>>>>>>>>    #include "debug.h"
>>>>>>>>> +#include "../ath.h"
>>>>>>>>> +
>>>>>>>>>    #define ATH12K_PCI_BAR_NUM		0
>>>>>>>>>    #define ATH12K_PCI_DMA_MASK		36
>>>>>>>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>>>>>>>>>    		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>>>>>>>>>    	/* disable L0s and L1 */
>>>>>>>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>>>> -				   PCI_EXP_LNKCTL_ASPMC);
>>>>>>>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
>>>>>>>>
>>>>>>>> Not always, but sometimes seems the 'disable' does not work:
>>>>>>>>
>>>>>>>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
>>>>>>>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
>>>>>>>>
>>>>>>>>
>>>>>>>>>    	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>>>>>>>>>    }
>>>>>>>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>>>>>>>>>    {
>>>>>>>>>    	if (ab_pci->ab->hw_params->supports_aspm &&
>>>>>>>>>    	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>>>>>>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC,
>>>>>>>>> -						   ab_pci->link_ctl &
>>>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC);
>>>>>>>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>>>>>>>>
>>>>>>>> always, the 'enable' is not working:
>>>>>>>>
>>>>>>>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
>>>>>>>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
>>>>>>>>
>>>>>>>
>>>>>>> Interesting! I applied your diff and I never see this issue so far (across 10+
>>>>>>> reboots):
>>>>>>
>>>>>> I was not testing reboot. Here is what I am doing:
>>>>>>
>>>>>> step1: rmmod ath12k
>>>>>> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
>>>>>> the issue)
>>>>>>
>>>>>> 	sudo setpci -s 02:00.0 0x80.B=0x43
>>>>>>
>>>>>> step3: insmod ath12k and check linkctrl
>>>>>>
>>>>>
>>>>> So I did the same and got:
>>>>>
>>>>> [ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
>>>>> [ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
>>>>> [ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
>>>>> [ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42
>>>>>
>>>>> My host machine is Qcom based Thinkpad T14s and it doesn't support L0s. So
>>>>> that's why the lnkctl value once enabled becomes 0x42. This is exactly the
>>>>> reason why the drivers should not muck around LNKCTL register manually.
>>>>
>>>> Thanks, then the 0x43 -> 0x40 -> 0x40 -> 0x42 sequence should not be a concern. But still
>>>> the random 0x43 -> 0x43 -> 0x43 -> 0x42 sequence seems problematic.
>>>>
>>>> How many iterations have you done with above steps? From my side it seems random so better
>>>> to do some stress test.
>>>>
>>>
>>> So I ran the modprobe for about 50 times on the Intel NUC that has QCA6390, but
>>> didn't spot the disparity. This is the script I used:
>>>
>>> for i in {1..50} ;do echo "Loop $i"; sudo setpci -s 01:00.0 0x80.B=0x43;\
>>> sudo modprobe -r ath11k_pci; sleep 1; sudo modprobe ath11k_pci; sleep 1;done
>>>
>>> And I always got:
>>>
>>> [ 5862.388083] ath11k_pci_aspm_disable: 609 lnkctrl: 0x43
>>> [ 5862.388124] ath11k_pci_aspm_disable: 614 lnkctrl: 0x40
>>> [ 5862.876291] ath11k_pci_start: 880 lnkctrl: 0x40
>>> [ 5862.876346] ath11k_pci_start: 886 lnkctrl: 0x42
>>>
>>> Also no AER messages. TBH, I'm not sure how you were able to see the random
>>> issues with these APIs. That looks like a race, which is scary.
>>>
>> How about using locked variants pci_disable_link_state_locked &
>> pci_enable_link_state_locked give it a try?
>>
> 
> Locked variants should only be used when the caller is holding the pci_bus_sem
> lock, which in this case it is not. Unlike the name sounds, it doesn't provide
> any extra locking.
> 
Got it. Thanks for the info.

Qiang,

Can you narrow down AER issue if it is coming always while enabling ASPM 
only. And can you share us lspci o/p of the endpoint and the port to
which it is connected before and after.

- Krishna Chaitanya.
> - Mani
> 


Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40D3CE8D6B
	for <ath10k@archiver.kernel.org>; Mon, 17 Nov 2025 17:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/0skEami5ruCiAE/IK+mq+8/OKgh1FsdYkgBHL+f2A=; b=QQN+tvwCDH/t0j96EszxA3M1+5
	KwfxK57NiAfpLn87n4Ij4nRs4rgmA/JDGCi9bj2YCSA03xMv7+wg43CjXXPegHRF+m7t2VFqKuIYu
	T3KLWK/adUfq9BSV5B8jvxbVIo+xTdo0dJtJ8fIstJvrWoBXRuAUs74H8f0ab9MpdrbdXSyVhQnJv
	3niRxaFXH0hLUXA6pvPsXsGIyKvKFdusw1Jol/THzmqSqMvoYvgxEEWO2N5JYxO/++RarHDcZBJLg
	najHwVmSK2bYk47tNBbsuVrHQAFXFU+vly0Low4fIeI5TydLs2BIPJR5SOwqt/4AG6rl3PK+D1jUZ
	wiNUCozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2mx-0000000GVrj-3LdH;
	Mon, 17 Nov 2025 17:13:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2mt-0000000GVqR-0GZh
	for ath10k@lists.infradead.org;
	Mon, 17 Nov 2025 17:13:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB65ki4107474
	for <ath10k@lists.infradead.org>; Mon, 17 Nov 2025 17:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/0skEami5ruCiAE/IK+mq+8/OKgh1FsdYkgBHL+f2A=; b=C7XIowE7CqFAg7jL
	gOVi782I/DXeZEo7tFffIC/G6XYPRfzYKR7s70SEIaSgAAY4yAzjGp7Kky2P1W75
	Ssi1FO1zyRM9oj3IoK6uE12gAFX9PXgZ6yd6//+8iEl6K+F7bgCMgOnPAmSZQ33A
	FZ7KaLXn+CRsI2POf7bn0ROuJYUtsLa+/HXHvEMmuzzzmVe8/uwIlBFgq9xObQPo
	45PMGvV4p+hE8GvTGd+uSl183wxiSE7TTLBgEs2EvxVGXkfzhBd7v6DpwL8/o52e
	IoyvPVK2wWRtxJl1FaB4x7YllpDXNmZwILYVKsLIKmiEBEY9xeDF2FmsBzcuw2XJ
	4oz5sQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp92g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 17 Nov 2025 17:13:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so3446269b3a.3
        for <ath10k@lists.infradead.org>; Mon, 17 Nov 2025 09:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763399589; x=1764004389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/0skEami5ruCiAE/IK+mq+8/OKgh1FsdYkgBHL+f2A=;
        b=Lcy75jGJkbZqJ9YVNsAh/We33qBTempur2uWGFdTvp7/a2byOSX246MTePaQ/vUmM+
         DDmZzGD0oI6tYts6vquKMGCwL8PHJQLxnLng6/EgIS8Rqtz+YrBzSVKa8LxVQDmmjzvn
         x6R6xrg9nhzEf2UhUALHbTUElLneqOtKbINeudjaQ8Azy7TuhgKCYInNQ65moTOEOFX4
         dY4KWzJ5W8APsxEbS60pn4ZONg/jFLkZmFBqTT0s8Qx4w66CXOrZZU3T3WQfAslYKT5s
         A7gFcE8Ox1N6dLSbJgpcYoc78PiX7KMotn/Unv8AxRAZgSfyzbfusIygl3TNKPSedtKs
         PRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763399589; x=1764004389;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/0skEami5ruCiAE/IK+mq+8/OKgh1FsdYkgBHL+f2A=;
        b=Ld1IWftWDJGKrkwnq/O6U9EkWh4ftHysBxEc/ZUTHWwin8JmxGGRU9bTXfYKRJI9xK
         EkDhh1IoRM/nsjinuhtZzHPpm2ZKBufTmtpWflVN0DHwppgBhOtcsRE8QUXPNK6kxFen
         BRjWOvJw/KmItHT7NQAgD0P45szPZjYFqziJoeoU5fvaNKgENZADWGZx2B5AuYNwPNDo
         ZDuq2qVr8i5BHV+lnTbA2nQChB5q+WKm1qCA1hjGn+IRqOhkP1K2y2HJn2oRtps11pcc
         2vm3m91Wv6ohgbWxbXGMQ0FbHvjeMTExlQK40x+30xHitjLbMkA2seiq5Pm2XKbl0ZvE
         AVew==
X-Forwarded-Encrypted: i=1; AJvYcCX0lOXa7AbSRtLmvO8KOFOtQT8/r74wLK37WMJlnZmZm3ofkNdndSHdR3IQ2bRCWdX5o732Qv8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwH2s7pqrGy4Q7myyeMKTRI+eilXcAxU0hSQUMIDFGhL+/Sp3WX
	0rHbZFFJ7LfvWt0JAuYp336TyUH6nxIuFF5NejByMFokJuaKUIzwtDjTMI5HtKqW9qY9on7w5Pj
	tx+eTzTRbIbYhWFHBi0VGtDsToXZgqulZUX00dOLRQ6ivYM8CgOtvWGD7mqdqfSSf
X-Gm-Gg: ASbGncsXbW8lvy0SKaFsu2tTZCv5dLOV69k7rtd87rHPo5jLRN8HXkPwwudGAw/1idE
	NKQ8bhVEP33yXKoYF6X6j81QLu2NxT+u2relEIPGtxb8/2GVYRCpzpyJYPtXqX3Cjs27v8ualQM
	sL++89TLJRgnHnn5k+nRlv15q0XiOx/reZ0ucz6OXRBQl34ljQtESxnInL7ZeSI4TZcNclK6rBw
	kNj1CiDJ8b+oPh73TCvvTvYltUJ8DeJ70mqHCBWOLnEeTUVMI8iu/n9tE848OkimaQoE16x+jxK
	fbkkfxe3eSzcJT2Xhnfl6EPuAP251jeYN4ULGPUNeOd6OgRPJGbbTDvGG5PQ9XDxN5GIiq2eo6q
	gDZgV+cG+I4rNtdlgf0reWgnY7qnqDd6gEko1ZlU8M2b5pJtEUvwgZiLYLkX0eOfbSDweQk2F8X
	zU
X-Received: by 2002:aa7:8885:0:b0:7b9:d2ad:bebf with SMTP id d2e1a72fcca58-7ba3c478736mr14829473b3a.22.1763399588639;
        Mon, 17 Nov 2025 09:13:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXwUwPLWo7AJoocw7BW6CSXi/Qe1/n+JtC2PtqJDxbVtQW440K/74J4a2w0JSqqv+hvkmGBQ==
X-Received: by 2002:aa7:8885:0:b0:7b9:d2ad:bebf with SMTP id d2e1a72fcca58-7ba3c478736mr14829425b3a.22.1763399588141;
        Mon, 17 Nov 2025 09:13:08 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d332asm13915017b3a.25.2025.11.17.09.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 09:13:05 -0800 (PST)
Message-ID: <f853d9b2-47f8-47b5-a02d-6aa8f12a4283@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 09:13:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
 <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jvbOgAAQNQNBYecwnbBNKXumBIQygAoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0NiBTYWx0ZWRfX722+4dHzCbfL
 p7mDuWHvHARTJW7VUAbKwtVoX7sD74qkLRxC+GGsDqZoFGkDLZ/+r7TsQcsJBOWd9BPw4q8hheC
 1wQ/WAmwHtqPZ55U/+oOYzjEwIoA8tssX0df9GoGK1e59aD401QV1XFTfDz5LdVEx3xlU0lyK3Z
 yzp9mLPWigtqHnARDK4HVSnw+BNvKrUI18TqUt4QqYWjZv2VgAP5rF+yIdJMH9C7V/5C00cF7JR
 9yj5rRUhQK1vJE58FYBvKIZNYmkUn5EFg/c3hR2P2PUdcU56/AG7FkRNTzXk3IEt3Hu20K9yWgg
 Hc124fH4V1Mm0omUxTZBZilVZVgsrTUQzQztCSH9RAViMR0EOIFth205DzmHce/5ZsIEznF8zMJ
 9t0z9mgHtMrs14fg7Kd4sVzAHLT9SA==
X-Proofpoint-ORIG-GUID: jvbOgAAQNQNBYecwnbBNKXumBIQygAoz
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b57a5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=prETkiTXWOWpwK33hF0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_091311_213496_421E16E1 
X-CRM114-Status: GOOD (  22.73  )
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

On 11/17/2025 4:45 AM, Manivannan Sadhasivam wrote:
> On Mon, Nov 17, 2025 at 05:40:06PM +0800, Baochen Qiang wrote:
>> On 11/17/2025 5:00 PM, Manivannan Sadhasivam wrote:
>>> On Mon, Nov 17, 2025 at 10:36:39AM +0800, Baochen Qiang wrote:
>>>> On 11/14/2025 6:22 PM, Manivannan Sadhasivam wrote:
>>>>> Hi,
>>>>>
>>>>> This series aims to deprecate the usage of "qcom,*calibration-variant"
>>>>> devicetree property to select the calibration variant for the WLAN devices. This
>>>>> is necessary for WLAN devices connected using PCI bus, as hardcoding the device
>>>>> specific information in PCI devicetree node causes the node to be updated every
>>>>> time when a new device variant is attached to the PCI slot. This approach is not
>>>>> scalable and causes bad user experience.
>>>>
>>>> I am not very clear about the problem here: is calibration variant device/module specific,
>>>> or platform specific? If it is module specific, why the lookup is based on the machine
>>>> 'model' property? While if it is platform specific, why do we need to update devicetree
>>>> node whenever a new device is attached?
>>>>
>>>
>>> I think I mixed the usecase of the 'firmware-name' property in the above
>>> description.
>>>
>>> But nevertheless, the calibration info platform specific, and hardcoding the DT
>>> property fixes the location of the WLAN card with a specific slot. For instance,
>>> if the board has a couple of M.2 slots, users should be free to plug the WLAN in
>>> any slot, not just a single slot where the property was defined in DT.
>>>
>>> Also, if the users plug-in the WLAN card of another vendor, not Qcom, this
>>> property is irrelevant/wrong.
>>>
>>> PCIe slots should be plug and play i.e., users should plug-in any M.2 card and
>>> expect it to work.
>>>
>>
>> correct
>>
>>> However, as I learned from Jeff, calibration variant property is also going to
>>> be required in cases like router boards where each slot is dedicated to a fixed
>>> band and the calibration variant is going to be different for each band for the
>>> platform. So unlike I thought, this DT property cannot be deprecated. But going
>>> forward, I'd like it to be used only in these special usecases. Most of the
>>> upstream DTS have a single calibration variant for the platform and for those
>>> generic usecases, this static table should be used.
>>
>> If that property is not going to be deprecated, should it take precedence?
>>
> 
> If you mean 'it' by this static table, yes, it is going to take precedence as it
> should cover the generic usecases. For special cases like the multi-band
> routers, existing DT node fallback will cover.
Does there need to be a PCI Vendor ID & Device ID as part of this lookup?

For example, start with a device that has an ath11k chipset with calibration
data for that chipset. If the end user replaces that chipset with an ath12k
chipset then with the current proposal the same calibration variant will
attempt to be used. But there will not be any calibration data with that
variant for that chipset.

/jeff


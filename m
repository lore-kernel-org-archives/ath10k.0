Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FC3C30653
	for <ath10k@archiver.kernel.org>; Fri, 28 Jun 2024 01:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPqn4DxZJhJDlUwH0EtgcnI6DHlwDxBK7PtrA09Ja4U=; b=rlFtqx6uoWCBZxLjd8FFuWuwJU
	u11vW7QqGiYqc+HVRqKy0XjlDKlz/GVAhLG74bTqd+yT0Y0Qj6jsy3rQlsFHJ4hEx+48n74y1p1t7
	FwuuM885Weh2HxERYlkMOuj451bXEeABqyqLt7wcPS0JQusVhPADzVTcSzBBSSP1GipD71oIp55go
	/rfmAGuxA1Oq8ySc4mYZ8BwJhaX1K39mKnByAfG3VzCMxdDNz3mUTqCiVLL/jpHRSSHNNpHy+trjs
	5mNmGVU83bGQo8CJKTSaW0J9fOB4LgUYtIJr0L0ZDEJyNlACPqL52bB8oWsf6eh1fTyYX1HGPzP4D
	8ZjgjhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN0NF-0000000CD6u-1N7v;
	Fri, 28 Jun 2024 01:26:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN0NB-0000000CD5O-2gkf
	for ath10k@lists.infradead.org;
	Fri, 28 Jun 2024 01:25:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RKUuAN015311;
	Fri, 28 Jun 2024 01:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPqn4DxZJhJDlUwH0EtgcnI6DHlwDxBK7PtrA09Ja4U=; b=KGZ1U/czbct2I68f
	siCeZnIJEDsCM/nMiYN2kTXVpgKcvtzg+0S+hMPJQpCTn68mXOON8Ym6xfwyRbC3
	Wvg3SQEk1JEzttNhIE/T7s81R6mCFQ1Dp28Vc0UKkd1b+6vyc7T6BBi5P2nB0Lxf
	7zSrWHvtWJFKZmW7Ro8YHmWqLFgmc5HqCc4IR/Zhs/S88OJUTjNtJfHf1ui9b1PV
	X7qpmF6oOyIW/Ql9LN9+S24ic4A0PxVUs3+9Si9C1VTUPlnHNFnq/HaOFKxNErWQ
	kE/wrXyXoKuW3rc0W8c4GMYgs3PQ2mcx3+6shsxF8CqDFQV3RJSoBq72kSVX8Rb1
	tVeuow==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400gcmd2nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 01:25:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45S1Pcrd026347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 01:25:38 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 18:25:36 -0700
Message-ID: <f362d96f-0926-4d91-811a-c6e71b2d3d0b@quicinc.com>
Date: Fri, 28 Jun 2024 09:25:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
To: Kalle Valo <kvalo@kernel.org>, James Prestwood <prestwoj@gmail.com>
CC: Paul Menzel <pmenzel@molgen.mpg.de>, <linux-wireless@vger.kernel.org>,
        <ath10k@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
 <1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com> <87iky7mvxt.fsf@kernel.org>
 <37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com> <875xu6mtgh.fsf@kernel.org>
 <f7faff80-864a-4411-ad28-4f1151bc1e51@quicinc.com>
 <d9f95dcc-6343-4af3-8acc-a150fb4e5923@gmail.com> <87a5j6gs4e.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87a5j6gs4e.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AYay9ZVt-vjvdcfv9DPIuge6HtEQW6E2
X-Proofpoint-ORIG-GUID: AYay9ZVt-vjvdcfv9DPIuge6HtEQW6E2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_16,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_182557_714528_705AF542 
X-CRM114-Status: GOOD (  22.71  )
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



On 6/28/2024 2:25 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
> 
>> HI Baochen,
>>
>> On 6/26/24 1:53 AM, Baochen Qiang wrote:
>>>
>>> On 6/18/2024 6:33 PM, Kalle Valo wrote:
>>>> + baochen
>>>>
>>>> James Prestwood <prestwoj@gmail.com> writes:
>>>>
>>>>> Hi Kalle,
>>>>>
>>>>> On 6/17/24 8:27 AM, Kalle Valo wrote:
>>>>>> James Prestwood <prestwoj@gmail.com> writes:
>>>>>>
>>>>>>> Hi Paul,
>>>>>>>
>>>>>>> On 6/16/24 6:10 AM, Paul Menzel wrote:
>>>>>>>> Dear Linux folks,
>>>>>>>>
>>>>>>>>
>>>>>>>> Linux 6.10-rc3 (commit a3e18a540541) logged the warning below when
>>>>>>>> connecting to a public WiFi:
>>>>>>>>
>>>>>>>>       ath10k_pci 0000:3a:00.0: invalid vht params rate 1920 100kbps
>>>>>>>> nss 2 mcs 9
>>>>>>> This has been reported/discussed [1]. It was hinted that there was a
>>>>>>> firmware fix for this, but none that I tried got rid of it. I got fed
>>>>>>> up enough with the logs filling up with this I patched our kernel to
>>>>>>> remove the warning. AFAICT it appears benign (?). Removing the warning
>>>>>>> was purely "cosmetic" so other devs stopped complaining about it :)
>>>>>>>
>>>>>>> [1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg13406.html
>>>>>> More reliable link to the discussion:
>>>>>>
>>>>>> https://lore.kernel.org/ath10k/76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org/
>>>>>>
>>>>>> I think we should add this workaround I mentioned in 2021:
>>>>>>
>>>>>>      "If the firmware still keeps sending invalid rates we should add a
>>>>>>       specific check to ignore the known invalid values, but not all of
>>>>>>       them."
>>>>>>
>>>>>>      https://lore.kernel.org/ath10k/87h7mktjgi.fsf@codeaurora.org/
>>>>>>
>>>>>> I guess that would be mcs == 7 and rate == 1440?
>>>>> I think its more than this combination (Paul's are different).
>>>> Good point.
>>>>
>>>>> So how many combinations are we willing to add here? Seems like that
>>>>> could get out of hand if there are more than a few invalid
>>>>> combinations.
>>>> Yeah, but there haven't been that many different values reported yet,
>>>> right? And I expect that ath10k user base will just get smaller in the
>>>> future so the chances are that we will get less reports.
>>>>
>>>>> Would we also want to restrict the workaround to specific
>>>>> hardware/firmware?
>>>> Good idea, limiting per hardware would be simple to implement using
>>>> hw_params. Of course we could even limit this per firmware version using
>>>> enum ath10k_fw_features, but not sure if that's worth all the extra work.
>>>>
>>>> Baochen, do you know more about this firmware bug? Any suggestions?
>>>
>>> OK, there are two issues here:
>>>
>>> 1. invalid HT rate: "ath10k_pci 0000:02:00.0: invalid ht params rate
>>> 1440 100kbps nss 2 mcs 7".
>>>
>>> As commented by Wen quite some time ago, this has been fixed from
>>> firmware side, and firmware newer than [ver:241] has the fix
>>> included.
>>
>> Thanks for pointing this out, I guess I didn't look close enough at
>> the log and missed "ht" vs "vht" when I brought it up on that older
>> thread. I thought i was seeing the same problem even with newer
>> firmware.
>>>
>>> 2. invaid VHT rate: "ath10k_pci 0000:3a:00.0: invalid vht params
>>> rate 1920 100kbps nss 2 mcs 9".
>>>
>>> After checking with firmware team, I thought this is because there
>>> is a mismatch in rate definition between host and firmware: In host,
>>> the rate for 'nss 2 mcs 9' is defined as {1560, 1733}, see
>>> supported_vht_mcs_rate_nss2[]. While in firmware this is defined as
>>> {1730, 1920}. So seems we can update host definition to avoid this
>>> issue.
>>
>> That would be great!
> 
> Indeed! Baochen, can you work on a patch for ath10k to fix this?
Sure, Kalle.

> 


Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ED5CD4F4E
	for <ath10k@archiver.kernel.org>; Thu,  5 Sep 2024 01:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/RwYRmOMmQcWlVM9kRYbKtqlwrmBph4nhg9C97KGvw=; b=TsjyEPaYwEpcMz0bWzGD2x2A5k
	5mojrpPb7Y3DPqXM1v556cdQhGk6pvCOgOeUkxBq6g8b6mOkqcUvu/BPXqA83BfPP80sbbYRt6zJc
	k8z89Ca4tNTNKnuxjmDjyBeW/jdUOspIM3FUDW0SNqKjfLUQNjyD725AO7d0wKe78g0OLm5qsHyaP
	h4PHQIXNvGl4jO53MFmzlROSzYNL9IHYU4vBCEVAZPXGA005KK+NCVcL0UQWk8vZCQgS4UGRwG+fc
	A10Gnj9bTbpOojK57jUymhP3lqVz6f5Pn/TstVOiVtfIBt6BFnzM+3W3CjcnU/aZLOm0B0pNZIKgp
	eDgKbZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm1Zd-00000006dD9-2eDg;
	Thu, 05 Sep 2024 01:46:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm1Za-00000006dCi-1dKK
	for ath10k@lists.infradead.org;
	Thu, 05 Sep 2024 01:46:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484HF77o010438;
	Thu, 5 Sep 2024 01:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/RwYRmOMmQcWlVM9kRYbKtqlwrmBph4nhg9C97KGvw=; b=IoFFljiQcpMqqAq6
	8FlxIWKclYwQRZHAUCNY2DR+sxtCQyCmsnGPBgDM+k7KqpmrYGEDX2ifUWvSdbdo
	9fE29fnK0O2S8P3iq1bKD6xZuQJPWkl4g+xX9TEEzv5u6Bj8fk4VD6SU+vF56f0a
	YVrGD+6/WK7taQwa6e5drlKooCkJgb6lXhRxBjhsekgZlVey9eamYYAvpvLKKf+3
	mYjkrEuJsyCO43XhNH37r+DzTQqrxFM+rIgilPlSLkE2K9Kw6vMZ7S//EbuLsffs
	eTGfuhQ2NcoD4AceQj+fENrqOIkamG0snSmxP0MpgiyHs4leOe3Dnkrz6SleO+sl
	lCZ7NA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41e0bhnq79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 01:46:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4851k7Rn008205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 01:46:07 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 18:46:05 -0700
Message-ID: <dda85730-3f19-490e-bb0f-99b13511c062@quicinc.com>
Date: Thu, 5 Sep 2024 09:46:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
        James Prestwood
	<prestwoj@gmail.com>,
        <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
 <54fac081-7d70-4d31-9f2a-07f5d75d675d@quicinc.com>
 <ea2e7c62-f6e9-4cba-ae81-19fc9abed8b7@gmail.com>
 <22978701-ca79-4e90-8ceb-16bdaf230e8f@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <22978701-ca79-4e90-8ceb-16bdaf230e8f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ai_R2xX_xuaCRiuux9B6R4ps1s270Yrf
X-Proofpoint-GUID: ai_R2xX_xuaCRiuux9B6R4ps1s270Yrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_22,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_184610_579195_84124230 
X-CRM114-Status: GOOD (  19.73  )
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



On 9/5/2024 2:03 AM, Jeff Johnson wrote:
> On 8/16/2024 5:04 AM, James Prestwood wrote:
>> Hi Baochen,
>>
>> On 8/16/24 3:19 AM, Baochen Qiang wrote:
>>>
>>> On 7/12/2024 9:11 PM, James Prestwood wrote:
>>>> Hi,
>>>>
>>>> I've seen this error mentioned on random forum posts, but its always associated with a kernel crash/warning or some very obvious negative behavior. I've noticed this occasionally and at one location very frequently during FT roaming, specifically just after CMD_ASSOCIATE is issued. For our company run networks I'm not seeing any negative behavior apart from a 3 second delay in sending the re-association frame since the kernel waits for this timeout. But we have some networks our clients run on that we do not own (different vendor), and we are seeing association timeouts after this error occurs and in some cases the AP is sending a deauthentication with reason code 8 instead of replying with a reassociation reply and an error status, which is quite odd.
>>>>
>>>> We are chasing down this with the vendor of these APs as well, but the behavior always happens after we see this key removal failure/timeout on the client side. So it would appear there is potentially a problem on both the client and AP. My guess is _something_ about the re-association frame changes when this error is encountered, but I cannot see how that would be the case. We are working to get PCAPs now, but its through a 3rd party, so that timing is out of my control.
>>>>
>>>>  From the kernel code this error would appear innocuous, the old key is failing to be removed but it gets immediately replaced by the new key. And we don't see that addition failing. Am I understanding that logic correctly? I.e. this logic:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/mac80211/key.c#n503
>>>>
>>>> Below are a few kernel logs of the issue happening, some with the deauth being sent by the AP, some with just timeouts:
>>>>
>>>> --- No deauth frame sent, just association timeouts after the error ---
>>>>
>>>> Jul 11 00:05:30 kernel: wlan0: disconnect from AP <previous BSS> for new assoc to <new BSS>
>>>> Jul 11 00:05:33 kernel: ath10k_pci 0000:02:00.0: failed to install key for vdev 0 peer <previous BSS>: -110
>>>> Jul 11 00:05:33 kernel: wlan0: failed to remove key (0, <previous BSS>) from hardware (-110)
>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 2/3)
>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 3/3)
>>>> Jul 11 00:05:33 kernel: wlan0: association with <new BSS> timed out
>>>> Jul 11 00:05:36 kernel: wlan0: authenticate with <new BSS>
>>>> Jul 11 00:05:36 kernel: wlan0: send auth to <new BSS>a (try 1/3)
>>>> Jul 11 00:05:36 kernel: wlan0: authenticated
>>>> Jul 11 00:05:36 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>> Jul 11 00:05:36 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 status=0 aid=16)
>>>> Jul 11 00:05:36 kernel: wlan0: associated
>>>>
>>>> --- Deauth frame sent amidst the association timeouts ---
>>>>
>>>> Jul 11 00:43:18 kernel: wlan0: disconnect from AP <previous BSS> for new assoc to <new BSS>
>>>> Jul 11 00:43:21 kernel: ath10k_pci 0000:02:00.0: failed to install key for vdev 0 peer <previous BSS>: -110
>>>> Jul 11 00:43:21 kernel: wlan0: failed to remove key (0, <previous BSS>) from hardware (-110)
>>>> Jul 11 00:43:21 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>> Jul 11 00:43:21 kernel: wlan0: deauthenticated from <new BSS> while associating (Reason: 8=DISASSOC_STA_HAS_LEFT)
>>>> Jul 11 00:43:24 kernel: wlan0: authenticate with <new BSS>
>>>> Jul 11 00:43:24 kernel: wlan0: send auth to <new BSS> (try 1/3)
>>>> Jul 11 00:43:24 kernel: wlan0: authenticated
>>>> Jul 11 00:43:24 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>> Jul 11 00:43:24 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 status=0 aid=101)
>>>> Jul 11 00:43:24 kernel: wlan0: associated
>>>>
>>> Hi James, this is QCA6174, right? could you also share firmware version?
>>
>> Yep, using:
>>
>> qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1dac:0261
>> firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp 
>> crc32 bf907c7c
>>
>> I did try in one instance the latest firmware, 309, and still saw the 
>> same behavior but 288 is what all our devices are running.
>>
>> Thanks,
>>
>> James
> 
> Baochen, are you looking more into this? Would prefer to fix the root cause
> rather than take "[RFC 0/1] wifi: ath10k: improvement on key removal failure"
I asked CST team to try to reproduce this issue such that we can get firmware dump for debug further. What I got is that CST team is currently busy at other critical schedules and they are planning to debug this ath10k issue after those schedules get finished.



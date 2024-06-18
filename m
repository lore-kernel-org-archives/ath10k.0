Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4D9C27C4F
	for <ath10k@archiver.kernel.org>; Tue, 18 Jun 2024 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+1G6ctf3dEufzv8hnxv/2f/+ildfxpX9w/HVKI85qk=; b=t8H7CKutyYd4FVVbgw74pMSKRh
	5LB2aFe+X8HDLgEmg46QhPGq/Woj5D8sv+SC1aofPI4sltEV3cb9jlafxmo45b0IqGtKzUkAaIKY9
	B/wHpNHiaPiPLDp1FN1tyt6SLTPOdxgck6YMdzfGohshOgI4YQSmFKf/hiMAONgUnag3yFj9cM8VS
	XlbkZ4UjmDzXbqlUvNscUD14tDjWlRi5hNwFQufmQ+jMYu9hGwG69dNS0aqiHmPy/Aqz5Nmxpj6f7
	22xRlq8L+1l2pIKX7DoCrrmi3R8uhTPeZEarT48QNea7FePxqCZ8HyAYvJBMKzJhJzlUZu++K2WIM
	HopM/oxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWO5-0000000ERbW-2Tpx;
	Tue, 18 Jun 2024 10:48:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWO2-0000000ERZG-1few
	for ath10k@lists.infradead.org;
	Tue, 18 Jun 2024 10:48:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IAYuEr013981;
	Tue, 18 Jun 2024 10:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W+1G6ctf3dEufzv8hnxv/2f/+ildfxpX9w/HVKI85qk=; b=nyjzN/2Cz/gucEpP
	hkKGqS3w1g+QMD6bAzZnGDklU3wtLTNu5e0ga+I60e19OQ32FF6nfgJWUEI+ZhIF
	rmRddjcinT4a5z/q8L76zmyU+nQLyXRH4ZGjrXqt+iXxa2G7g+/3Ktpcuw59eMr0
	SyrnwQWm6shrCZE5MsKqRJ+vI8ioQbjNLfMY3uqaMc98DpS4qFNsAeKfO9f8EW/U
	sQCUcHMpeG9FM9y2W14EW44Hz7v6QN7P5tVOHjl3EbKuKYvKMxzv/NyMT9uXgb9M
	cgh7WBp908nU1paxNyhfuheqFJJ2AgEW1/2ozI415SgvgoiUI1JodpnmmHXvGKzt
	y19gAQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu8m1g0u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 10:48:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IAmE2S026366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 10:48:14 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 03:48:13 -0700
Message-ID: <4613abff-5718-4250-a37e-127dd5a4cce6@quicinc.com>
Date: Tue, 18 Jun 2024 18:48:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
To: Kalle Valo <kvalo@kernel.org>, James Prestwood <prestwoj@gmail.com>
CC: Paul Menzel <pmenzel@molgen.mpg.de>, <linux-wireless@vger.kernel.org>,
        <ath10k@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
 <1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com> <87iky7mvxt.fsf@kernel.org>
 <37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com> <875xu6mtgh.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <875xu6mtgh.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JGUi_qz77y87ErCxy18sxHu4Yl-3AGTP
X-Proofpoint-GUID: JGUi_qz77y87ErCxy18sxHu4Yl-3AGTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=980 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_034826_465595_CE29C263 
X-CRM114-Status: GOOD (  19.59  )
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



On 6/18/2024 6:33 PM, Kalle Valo wrote:
> + baochen
> 
> James Prestwood <prestwoj@gmail.com> writes:
> 
>> Hi Kalle,
>>
>> On 6/17/24 8:27 AM, Kalle Valo wrote:
>>> James Prestwood <prestwoj@gmail.com> writes:
>>>
>>>> Hi Paul,
>>>>
>>>> On 6/16/24 6:10 AM, Paul Menzel wrote:
>>>>> Dear Linux folks,
>>>>>
>>>>>
>>>>> Linux 6.10-rc3 (commit a3e18a540541) logged the warning below when
>>>>> connecting to a public WiFi:
>>>>>
>>>>>      ath10k_pci 0000:3a:00.0: invalid vht params rate 1920 100kbps
>>>>> nss 2 mcs 9
>>>> This has been reported/discussed [1]. It was hinted that there was a
>>>> firmware fix for this, but none that I tried got rid of it. I got fed
>>>> up enough with the logs filling up with this I patched our kernel to
>>>> remove the warning. AFAICT it appears benign (?). Removing the warning
>>>> was purely "cosmetic" so other devs stopped complaining about it :)
>>>>
>>>> [1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg13406.html
>>> More reliable link to the discussion:
>>>
>>> https://lore.kernel.org/ath10k/76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org/
>>>
>>> I think we should add this workaround I mentioned in 2021:
>>>
>>>     "If the firmware still keeps sending invalid rates we should add a
>>>      specific check to ignore the known invalid values, but not all of
>>>      them."
>>>
>>>     https://lore.kernel.org/ath10k/87h7mktjgi.fsf@codeaurora.org/
>>>
>>> I guess that would be mcs == 7 and rate == 1440?
>>
>> I think its more than this combination (Paul's are different). 
> 
> Good point.
> 
>> So how many combinations are we willing to add here? Seems like that
>> could get out of hand if there are more than a few invalid
>> combinations. 
> 
> Yeah, but there haven't been that many different values reported yet,
> right? And I expect that ath10k user base will just get smaller in the
> future so the chances are that we will get less reports.
> 
>> Would we also want to restrict the workaround to specific
>> hardware/firmware?
> 
> Good idea, limiting per hardware would be simple to implement using
> hw_params. Of course we could even limit this per firmware version using
> enum ath10k_fw_features, but not sure if that's worth all the extra work.
> 
> Baochen, do you know more about this firmware bug? Any suggestions?
will check with firmware team first.

> 


Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABBAEB5967
	for <ath10k@archiver.kernel.org>; Wed, 11 Feb 2026 05:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xaWScmkE2/GPwlOezPX08W6gzrXt1tL77aq5PNLWnQ=; b=JNVPuQu8vUHb6+gHkG/lhX4Db7
	7brcDNs30hLUj8DocelTW00sQtcJgA/+4sMtef6k7OmP3tWr9REpudN9JunNjPThJssVZjhRZewWN
	oQZrgqgESnkQU/MekGIWUxlYLFYSv+O7QBzyxxWYF+t33j9s0lBg/TtHsGIu/8pF2d2dJ2gOGxhjy
	AOL56c+sCmAtYSSpV2n6kHFJebeIqZwtpd3Tt3DXCQnzVGoprEfj8gV+mT6l0siYkJg83zGrt2hpB
	QQxKpm17jdxFZO/YUOEnrffz2nTa15PLrHxPQ2JHrXyNEqc7VZY6NdwYuQ4/5BsfYWRPBbx2xu6Cs
	/HK5bOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq30s-00000000GGL-3i6g;
	Wed, 11 Feb 2026 05:43:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq30r-00000000GEI-0B70
	for ath10k@bombadil.infradead.org;
	Wed, 11 Feb 2026 05:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=7xaWScmkE2/GPwlOezPX08W6gzrXt1tL77aq5PNLWnQ=; b=JpDOBtRK1WkOrcPvYT7sdC5qhf
	HJx3tfqBmIpAvJerdhyZ3luBFeLIPKusMpQBbBXljb5F9NXZypWuLKIv+YUqa/sno1yM6vuxe3Tnp
	VqFvDYyk9M3pds301LqiEyZVPCr0hVqCZzQglbaor+K7Ls+vag6CLHkq6CUmHlD1/Es6fKyEa6CJ2
	slNx5nzU1xJIvW05eM0+veqMOQikbi5xqMXn9fAdShqyi/AFWxp2kQ4Vr4PvSzBwq8BW0hBdGwh0B
	4NNI9NMGgGPqWW2YaK/t1lmw8klWopDk37X0t1QC5LPklqax9KUeM6UKPdRmkdUun0H6nUGr+OzyV
	nSiiYKHA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq30k-0000000CAtT-0SPJ
	for ath10k@lists.infradead.org;
	Wed, 11 Feb 2026 05:43:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ANAtOa3919396
	for <ath10k@lists.infradead.org>; Wed, 11 Feb 2026 05:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xaWScmkE2/GPwlOezPX08W6gzrXt1tL77aq5PNLWnQ=; b=VMHpELkT4iqagep7
	YdozS7l70bC/XT0HgFA+NpozBWsZ5/Ppf3ggGHahYgZIzILG+BOf5rm0kqYCszgv
	9/egTBMBm/EwhpHh8VB0uTsmS7vLzfk/FXMcOVRrsEEXJ258/38XUFTLexJ5HBJP
	Fx3LG0lE6c7iLFmwu+AntH3HEeacwhHstVkiIK+Nn5vz/4q7rzp93Vz9viregNOk
	Er5wPH5DpaGkUKbhsQW+gxc+9D2lg7XVQ7K8vuMgo2q4nGIfZIrEmeEyPR2H5STD
	gEGc8A3xxAER7XAs7ihq1liOzND2wO0ue5V5zudds/EpilkQpXBzMtFF467LpmR4
	iRDl6w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c86akjnt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 11 Feb 2026 05:43:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3562692068aso366369a91.1
        for <ath10k@lists.infradead.org>; Tue, 10 Feb 2026 21:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770788613; x=1771393413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7xaWScmkE2/GPwlOezPX08W6gzrXt1tL77aq5PNLWnQ=;
        b=egMbNh9bv06EpEz/2HuEieT5IWn7QTEs9DvHlFBWLbNypNr2Cx0UqFI2jhWnLfFSP2
         bJNS14+BHUTyw4GO1hRZuSMDLmnbQ57Q+e7jH1m72ykjo7n1Q0V1ndaGaRivKDHuy+zg
         FFD1cGCq9txuJhAhaRNOxPg+lbKkWw0xw5URApP6E7UqD/sAnmViHn14s6/THO4y71BI
         o81w9F8YOXAy++vTdpWP5NkaJqjRqU6THZ4fcWbVuWHz+5Xq5bCbpAGYZOrTk1TkvpS5
         gK6FOBlpLUwEtJTewfHw3MF/A6Aq2Eo4KVUkH7a8AALCpuPuPSJVb/EQvHdscBYDAOQI
         notg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770788613; x=1771393413;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xaWScmkE2/GPwlOezPX08W6gzrXt1tL77aq5PNLWnQ=;
        b=wn7AD9brZC7rU30UP4Wg00cjWR3jV6iotZqQGmYt981mq5yBZ/0O2anBpVndxqLSSR
         Fl/pTwbu5lCB4UiFRnBxG01KJI9ONlSTzzNXVyv/wGojzdLzElJc4chtUqvPQFLmdmCN
         UrHY1W+1CSbvPnWJl22Oc7S+pAbkJcLA+IzTlT4rGvpqo6SXd7addTG4Ymjow07CmRl7
         4ak/QOCvzv+z5W8jv7eswNkJzZ7XUqj5lMLJbxbfwT7DcXhbBFQpgW9yaoeANSyWZ/4f
         8uif7n8UpsHGfyIld1STFQIiiNqWR4WKpzqkhNUdVr6x4yIfF5Vwu390sGXe37Dr775D
         DLbw==
X-Forwarded-Encrypted: i=1; AJvYcCXVka8wfE7wnoMfar9qynQEO6oJ5GENKTN1uflK2sVWXOSyfJ/+xDo4VyZlCPLMxP2c/tosXqs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCoL72gNMqV0WJe6LnULIuVigaeNJ7uzLnoBuNBRZLXdLLWVJs
	LQT0gSJQyDyEJMZ0OyHrXopfduoqODUctIaOGiaHYQc8mUEQWZevdF55r2RhbJMnIlPep8IrWqh
	vzLXepNsFynsAuTYsaFxVGc059AZHRDa0cQn5riaWeSwMrU36wjRXnHxCXYUZlsRh
X-Gm-Gg: AZuq6aLg5tk9fD980+Jf0U45GX7iL1wWDLvTULFwggHX3ZH3eHheYld7aj8qOAqUgyr
	5vdSSwxCsGiiDKSqEaKO73R/j8BVQuPmWwuTxjkJcL0FDicE/Vu5prLD6yy5djoWByW/5VnexXt
	coohBnfvYAavvefEI4NjtoVpRpzr8IJ7U9Hi+QiPd4aAUR3bjeJf+LhjCIWC4J5UdBM4zpa9J9t
	duKOEE9ixy68pxnWUSo59hdLWaSb3EpgO5t7pGRkdqo/xt6qXlxOcJfKsiSSxJZxkRu0LM+zcnk
	n++Np0FfSZzTP/PJhqYly5DRCjlpYdt9EOyFi6Vctf8wS0NZxHbTNsbnp34X8vXrNPQ8JgWzZP1
	rtuoyrOj60d4xI1OJJFzfXhhoM+GRwakYpCwDTaas76QM1zmHvjZGXJzfCi/7cvOTzYZSl/I59m
	KwIHUfsEAWY+KZ6LGu4g==
X-Received: by 2002:a05:6a21:6194:b0:38e:cac8:f997 with SMTP id adf61e73a8af0-39415c9330emr4244345637.25.1770788612889;
        Tue, 10 Feb 2026 21:43:32 -0800 (PST)
X-Received: by 2002:a05:6a21:6194:b0:38e:cac8:f997 with SMTP id adf61e73a8af0-39415c9330emr4244317637.25.1770788612397;
        Tue, 10 Feb 2026 21:43:32 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567eba9b2esm890465a91.9.2026.02.10.21.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 21:43:32 -0800 (PST)
Message-ID: <badaf39e-6ab7-4be7-944a-cfc9d6757db2@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 13:43:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New warning `ath10k_pci 0000:3a:00.0: not found station for peer
 stats`
To: Paul Menzel <pmenzel@molgen.mpg.de>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de>
 <6a83fd12-edd8-4559-b7ba-75b074fa889f@molgen.mpg.de>
 <5c152304-853d-4142-8553-55cd8907f271@oss.qualcomm.com>
 <2c722676-98c6-4162-96cb-9bea06672153@molgen.mpg.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2c722676-98c6-4162-96cb-9bea06672153@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=698c1705 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=cYQjjqCy0I3-0vQ9vjcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: N3RInN2SKT8EMaXZ29-9yxv94N6WKRXa
X-Proofpoint-ORIG-GUID: N3RInN2SKT8EMaXZ29-9yxv94N6WKRXa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA0NCBTYWx0ZWRfX7NifLFt63Jxm
 NCRMkiQ0HiGNdfjntlPfdHGRpmS48lT30hdh1npLH51g3mVNP0XC6JiO5XmKIPUlNUjFDBxRChe
 4dkrGuaI1GVw738NCXVeeLpHYgZE3D+QqdFWj/zVqkkix62Tr5z+/ufULJQ0CzG2J6j9qoKSZP2
 cTgoUDzdvFRGRVZTNTCgIPKll3Lya42oWYxlCFG1rJzCa+/iLSxIHn5r7C3M012nKEO/ElfSYz7
 93ZZ9ENPyRU+29b/iE9XjyDu8w1eN/NbCiYZBdRWsfpOR2+LzEzj1fvQG/o7wDX16pPO/dDs0VQ
 A3aOI6xLRJ7LnIS4zag1vuAvmzhjmwuvxXFgxFqseIYzGVN5aGD+FOV9olC6inpj3LK6s8M9VdR
 z81NNbNgTx21hIGWda1NSPD3vK8Jj7msxEYzqGn0Yh9k31dX8gpKRTI/x0C537Y8mcGTdy5IKml
 TmoN8RkfYQgewPbofhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_054338_368565_8CFC50C5 
X-CRM114-Status: GOOD (  16.65  )
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



On 2/10/2026 6:31 AM, Paul Menzel wrote:
> Dear Baochen,
> 
> 
> Am 09.02.26 um 03:44 schrieb Baochen Qiang:
> 
>> On 2/7/2026 1:55 PM, Paul Menzel wrote:
> 
>>> Am 19.01.26 um 17:41 schrieb Paul Menzel:
>>>
>>>> Since January 10th, I have started seeing the warning below in
>>>> my Linux logs, that reach back to September 24th, 2025:
>>>>
>>>>       [   37.108902] ath10k_pci 0000:3a:00.0: not found station for peer stats
>>>>       [   37.108906] ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
>>>>
>>>> It started appearing with 6.19.0-rc4-00282-gb6151c4e60e5, the
>>>> version running before is 6.19.0-rc4-00003-g3609fa95fb0f, but I
>>>> do not see anything related in the commit list:>>>
>>>>       git log --oneline 3609fa95fb0f...b6151c4e60e5
>>>>
>>>> The warning log from `drivers/net/wireless/ath/ath10k/wmi-tlv.c` has also been there
>>>> since 2021.
>>>>
>>>> Do you have an idea? Please find the output of `dmesg` attached.
>>>
>>> Looking through the commit list from above again, commit
>>> a203dbeeca15 (wifi: mac80211: collect station statistics earlier
>>> when disconnect) probably introduced the new behavior.
>>
>> is this error seen when disconnecting from AP?
> 
> I attached the logs in my first message. But yes, it looks like this:

sorry, didn't notice there was an attachment.

> 
>     Feb 07 06:32:52 abreu kernel: wlp58s0: deauthenticating from 74:1a:e0:e7:b4:c8 by
> local choice (Reason: 3=DEAUTH_LEAVING)
>     Feb 07 06:32:52 abreu kernel: ath10k_pci 0000:3a:00.0: not found station for peer stats
>     Feb 07 06:32:52 abreu kernel: ath10k_pci 0000:3a:00.0: failed to parse stats info tlv:
> -22
>     Feb 07 06:32:52 abreu wpa_supplicant[846]: wlp58s0: CTRL-EVENT-DISCONNECTED
> bssid=74:1a:e0:e7:b4:c8 reason=3 locally_generated=1
>     Feb 07 06:32:52 abreu wpa_supplicant[846]: BSSID 74:1a:e0:e7:b4:c8 ignore list count
> incremented to 2, ignoring for 10 seconds
> 
>> did you try with that commit reverted?
> Yes, I tried it now with Linux 6.19 and reverting the commit. The warnings are gone now.
> 
> Are you able to reproduce the issue? What devices are you testing with?

I managed to reproduce this issue locally. Will submit a patch fixing it.

> 
> 
> Kind regards,
> 
> Paul



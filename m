Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD5AEDEBFD
	for <ath10k@archiver.kernel.org>; Wed,  4 Mar 2026 01:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJB3nh3QvnyF/JIRZHSDJxC1oPX+zuLkSeYi0HOUoM4=; b=UekWzNXohyUrrb5WUQxAeuiyHj
	O2HL3zk74JYG8sZcBpjOhN8vRQ/iAZ+VBrBvm5vWk2Zi8U2C+jF2DZkHahhmHrZoqwfIooVJD+CVm
	Ri8NGfF6qbi0SePqDJBKitQYmQAqipan2LuNu6F7E+IKqcUaznUfMpxC08rfR49rP1LR/viJfB2j/
	moV/Fl0o9UwyB2OBCp11pCEuP+noaXAgxIbCxFS4SCcRJi/E/lY1dRN5wIqkqO4AiWDdd8i2U0Vxc
	sJGS6dxbihOpFYvEy4vsJ8PUUgKWwAwyElGTf9tKN0LoXSCFl5Tp7CnJLpe0i7HZVENgOybqb+BqR
	cxaEGBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxbKT-0000000GH9d-192I;
	Wed, 04 Mar 2026 01:47:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxbKR-0000000GH9F-1hHr
	for ath10k@lists.infradead.org;
	Wed, 04 Mar 2026 01:47:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0MVK3238365
	for <ath10k@lists.infradead.org>; Wed, 4 Mar 2026 01:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJB3nh3QvnyF/JIRZHSDJxC1oPX+zuLkSeYi0HOUoM4=; b=jHbyVs414p9fqRJ2
	ij4n0DwQkrt+ZYd7P4gVDROgfbiNfXtppEbW1wCXB/XxMBQ6hq42IAg9JdH5jrvr
	OyZsEKHE0NcNW0piwjTsMWzyecLEx9MIFDHtR/DpdnNoIQW+3Fg9TiunkuTqckR2
	jDqsND8Yv2wuxLaijaMR3ZP6X3bpkhKTdHs3srCKanNOa2A97RGQjC4zESeFaaO5
	hSrH6jbhiZwk5XGcEoHUok7wB2NoSumsaspN4efg+zylwu1N50lrofkDK6LbERib
	CQDO0uJ3r6vwsMQZzTLOWpBp5x7imlkSfHUrniEwbRMMxmuUPPrPStdlp0kCaAGQ
	IkRyDw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtub1s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 04 Mar 2026 01:47:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae405e95f5so36994325ad.2
        for <ath10k@lists.infradead.org>; Tue, 03 Mar 2026 17:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772588828; x=1773193628; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJB3nh3QvnyF/JIRZHSDJxC1oPX+zuLkSeYi0HOUoM4=;
        b=D9oHRHeRQtcUah9ORRqoahXmMaBElmv0WLefJOfLGf6RaZQbiuuMMNlkdzCjOqSFSb
         0U1AjP8RtYuV7dcQW/fWl/ngpg+cG6FZ4oefeRubfRciGYI3IWTWMT7nmKnYtuS4BTDZ
         9UCwcavyh27D8PtpkKrRMqQjosEuYC2TUSUxC33v+AuiJCHro8/yNZrUWNJvkyzbae4N
         Aoc8ZvgwXVs6KtlSL4XKzTSlJOW7dy3RZ4CRQJE388obrZZkLLWULlVi113vV0QhcpQi
         0UOdpt0ta17A72vWBfdmCqPAXeLfZaLJ6prLp/JSREegN7+tlDI7m7EN195zv4WTxp4e
         qcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772588828; x=1773193628;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJB3nh3QvnyF/JIRZHSDJxC1oPX+zuLkSeYi0HOUoM4=;
        b=aP4A9EFYQjFZj1CrxoRLInUHkCGDy7n0NAhaXBYubqd46nUtH0Y7ElpY3uX2yWmIC3
         fRrNwkx6Tnc52BWk0lUBCBJQXBbzoVnKBGF1qwCNnOzv/z4iBEfZQxRajPdBA9h5YVx5
         /LEcTs5s6phGjU2sCPdgxYM8pf/calt1aJsxoSfovnMSHOnZbIBlU6riPAF0T7KfEzOt
         RsHQ6ri3WwPFL7ruGLhLzVjGnGyWzLsOiQMl/Njk0RTTPJKye5LMRvCM4Rv7B4gB+dHM
         Wgc8JaGurD0gS7qjKfz6YTIH3VpMo2ZCE44ECsxMjB0s+2wD9CGKF+mYZ7j6enTdejCr
         IvGA==
X-Forwarded-Encrypted: i=1; AJvYcCWvdqfNb5KX8v67k05pHk8ZNJDFzOnZmwHtVIIY1aTgy+ybONCmU21fmEVivKbsOPBOQtB7vYU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyIabPxGm63BYnFQHK0DLLjme0hNxuQNDeuvxukMOTGcKSUySx
	c7mQrlxkXZedvTocSN7QCwC7aPVFOXQvT9049XiUt+d9PkgNtv1/j8hObhfRW5oY5r/s3+1UsB2
	fotLmfk4Cp5kmb9zQqhiW6lAu8GEvcuUtJRSoamKbjABXMB+DfprGL47ZgugP6mqH
X-Gm-Gg: ATEYQzwZ8G3Xq2nEd7n++bGxqsSlh79plYRtCIn3dj+UWbgA2kZFxaq2/AoKtbaK/5J
	CnxzFMPKYjbkifEx0QDJ9absv/7HGmjRczGmwvVh+NvgRMhyqiQcbadDyM3kspx45+Ew8kc9UX5
	c7tAsDds3M2Y/5fo0xCUJhQLCd+JkRd0po0S2UNfHx953lKJ8Ic1wdMVrJzqKNkYb2/xpyI/2KB
	wUGmOgoTMHF6FDlkpt0K3+TQAAkV/CgphEHSXFxCX18NNlD1MAr0KFwzRA/88KgCcAjSzaiJgOn
	+FfKSGpuDsBgfu8EwgsI+gZGvSsKVjrGEWwjPI9ZrvWXpRUHO1FfY7cRYGpfj38yEpj4GzUmATi
	DsiGqtGFPDjoGO94ZKm2LuuX8Su0j/t2gB2GwzEiSlb+2LImlFfNX2JmsncM52AUMgf+JOFZGhe
	mu+kESUM2ZL4xm1c8OCdw=
X-Received: by 2002:a17:902:f546:b0:2ae:5763:99cd with SMTP id d9443c01a7336-2ae6ab9fa3fmr4208465ad.49.1772588828322;
        Tue, 03 Mar 2026 17:47:08 -0800 (PST)
X-Received: by 2002:a17:902:f546:b0:2ae:5763:99cd with SMTP id d9443c01a7336-2ae6ab9fa3fmr4208245ad.49.1772588827750;
        Tue, 03 Mar 2026 17:47:07 -0800 (PST)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3a9dd3e7sm115610065ad.40.2026.03.03.17.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 17:47:07 -0800 (PST)
Message-ID: <80231e1b-fc6f-488f-97f7-92e792954022@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 09:47:02 +0800
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
 <badaf39e-6ab7-4be7-944a-cfc9d6757db2@oss.qualcomm.com>
 <e71b2039-0478-4775-b221-753dc25647d5@molgen.mpg.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e71b2039-0478-4775-b221-753dc25647d5@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w9NuXg1HnXnn5p8a3H5L6lxGELwSR9XE
X-Proofpoint-ORIG-GUID: w9NuXg1HnXnn5p8a3H5L6lxGELwSR9XE
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a78f1d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=exyQ1seZzitSerPTUx4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAxMyBTYWx0ZWRfX9k/igPgNSi3f
 4Vf1YNYplt7gBYd5sUr43AnT7TV1+J/8GwREIvOmCTVhXCGoDfuLHFJWQJd8Yv+cDR/IEPaa8CU
 F48Hq6HDkqqUhTfytimGMnraTJb7isJfqps6OzLik8YJJQitfht6EGE439y/0X+3bhB6jURZkve
 //m5Ef5dugcQTiO1rePIo1Fac/92ghcsbLxArtAJ18xAQpL2uK1ZcUpsenxql+hVwGd3lTgCz9V
 wIpxuoYk3rZldGRBCfWYwSoM7Adv2TJ08DOKTqv+QEpiDc8td71bxZTdi9uKWlAxnPfPZG1JSeo
 yYs3ArJ9/QlI1nQXPlIUjFSdhx6PJcDytrRWJSWFUhlhCQnEiwx8nYCxqokjvzQD86sZKVBlihZ
 QgUMlsH2Uno2nKVyRVuHcrksVlLdZGGGRaaSe79/dluKOl5PK7mMfHUfXLSvxl2+ZYsFZd5i+/2
 1IGMnuHREYfrpBJETMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_174711_600206_24E7CFAE 
X-CRM114-Status: GOOD (  15.92  )
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



On 3/4/2026 4:01 AM, Paul Menzel wrote:
> Dear Baochen,
> 
> 
> Am 11.02.26 um 06:43 schrieb Baochen Qiang:
> 
>> On 2/10/2026 6:31 AM, Paul Menzel wrote:
> 
>>> Am 09.02.26 um 03:44 schrieb Baochen Qiang:
>>>
>>>> On 2/7/2026 1:55 PM, Paul Menzel wrote:
>>>
>>>>> Am 19.01.26 um 17:41 schrieb Paul Menzel:
>>>>>
>>>>>> Since January 10th, I have started seeing the warning below in
>>>>>> my Linux logs, that reach back to September 24th, 2025:
>>>>>>
>>>>>>        [   37.108902] ath10k_pci 0000:3a:00.0: not found station for peer stats
>>>>>>        [   37.108906] ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
>>>>>>
>>>>>> It started appearing with 6.19.0-rc4-00282-gb6151c4e60e5, the
>>>>>> version running before is 6.19.0-rc4-00003-g3609fa95fb0f, but I
>>>>>> do not see anything related in the commit list:
>>>>>>
>>>>>>        git log --oneline 3609fa95fb0f...b6151c4e60e5
>>>>>>
>>>>>> The warning log from `drivers/net/wireless/ath/ath10k/wmi-tlv.c` has also been there
>>>>>> since 2021.
>>>>>>
>>>>>> Do you have an idea? Please find the output of `dmesg` attached.
>>>>>
>>>>> Looking through the commit list from above again, commit
>>>>> a203dbeeca15 (wifi: mac80211: collect station statistics earlier
>>>>> when disconnect) probably introduced the new behavior.
>>>>
>>>> is this error seen when disconnecting from AP?
>>>
>>> I attached the logs in my first message. But yes, it looks like this:
>>
>> sorry, didn't notice there was an attachment.
>>
>>>
>>>      Feb 07 06:32:52 abreu kernel: wlp58s0: deauthenticating from 74:1a:e0:e7:b4:c8 by
>>> local choice (Reason: 3=DEAUTH_LEAVING)
>>>      Feb 07 06:32:52 abreu kernel: ath10k_pci 0000:3a:00.0: not found station for peer
>>> stats
>>>      Feb 07 06:32:52 abreu kernel: ath10k_pci 0000:3a:00.0: failed to parse stats info
>>> tlv: -22
>>>      Feb 07 06:32:52 abreu wpa_supplicant[846]: wlp58s0: CTRL-EVENT-DISCONNECTED
>>> bssid=74:1a:e0:e7:b4:c8 reason=3 locally_generated=1
>>>      Feb 07 06:32:52 abreu wpa_supplicant[846]: BSSID 74:1a:e0:e7:b4:c8 ignore list
>>> count incremented to 2, ignoring for 10 seconds
>>>
>>>> did you try with that commit reverted?
>>>
>>> Yes, I tried it now with Linux 6.19 and reverting the commit. The warnings are gone now.
>>>
>>> Are you able to reproduce the issue? What devices are you testing with?
>>
>> I managed to reproduce this issue locally. Will submit a patch fixing it.
> Sorry for being impatient, but as Linux 7.0-rc2 was tagged, were you able to come up with
> a patch, or should the commit be reverted for now to have more time to analyze this?

The patch is under internal review now, will submit once it is approved.

> 
> 
> Kind regards,
> 
> Paul



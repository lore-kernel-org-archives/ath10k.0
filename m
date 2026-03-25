Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B89109C02F
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNu/oNFvJ4yY5PKefhD2ZpTBxLo9FCQs91M6mIqi41s=; b=TcFYBe4ql7FqPItukrCe2L+U7q
	pJ0AS4I2tFzbhm1L5Wq8Bi1QfC14+swVLg4NeJyVJwew1sMe7pbtg7J+iD5D3U+CTs1RNXxUSqHv/
	E0Ot4zS/BV93ZhcaCWZ+CClaH15WB3APOgSmJP5MJVkzu9H4xbnaXmyJH8qjs6Qq+TspA1gRK1ddF
	eH0fSXTljyDqb3x/Bbu8AUfmC1rvFBPdK+forz/nyS74l0NfEOW0fIBA9W55kLYDYl3pbyLThVQtG
	j3O9Qqd3suKpSH1G76fdUxaFfM2Xspj16IGaTchpT763EYSA9lj9+jNpxvg4ECk2LwLQQkzLqWBpH
	okT0ZgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QZL-00000003pWq-25YW;
	Wed, 25 Mar 2026 15:54:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QZI-00000003pWU-3bSq
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 15:54:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHEYq2161842
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 15:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNu/oNFvJ4yY5PKefhD2ZpTBxLo9FCQs91M6mIqi41s=; b=aVFOsaBK3aXYntQk
	twmk48Sg4Bbr/4rPWrmaKB4AixBdXMPTVFRiE9W26iT4UNbzRpLBj5TTB2NxRM26
	3gGEWyzes4Ez8drMvRq7krt8kirbfeY6bSEq6oXtLgRm52twyCv6y8qAfXkJKLCC
	G+OcHoq0IqY59UzP9HHMwZQBzCS3Go5wcDeauofmX58zuPKMHtzqHbFP/eY/44p5
	+nu4eo7NO0w5/z1d53c0x+5Urttf1VQ9BLEu6X4Y0aBpUHT+zFyaouhxqXTXCJ3w
	070DRbYEm1WZDplePWbDYaPQuTo2ccdIWuR5G6A4qTnnlVaPfFgJ31O062EvLqFw
	CXXtXw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489wjfeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 15:54:51 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12711ec96fbso9052175c88.0
        for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 08:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774454090; x=1775058890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNu/oNFvJ4yY5PKefhD2ZpTBxLo9FCQs91M6mIqi41s=;
        b=cEVwJPajQs/heTF/tjSSW9uj2WJu75tVBcWCT0v7KlQMcvhYdxOaVwNpluQRDhKnOQ
         qjBIAqpJZUDMThfwwFHze4RCu7M84+tBPiF5tJrJNsVfgEay02wwRRmUx7oU6uKL29J1
         cPYpLDT3SL1N/Bx84R0UCT4dNqBb9DTMRdMfGR+9KKeFfkCs8R7g7tcMW1K3ecraEDii
         WBFfuI7m1CSXA2a++XSvSJPDhSfHlZ3lZCHCETQqr1ACx4BypAg8JbxNd0WRYKw8Zn5R
         sqwa+J9dFhamycG6x8W9FYYi095+KdT0Ys+xY6D5Z2Tt7u9ruSFuU9u6kOp/XagDxxcZ
         y6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454090; x=1775058890;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNu/oNFvJ4yY5PKefhD2ZpTBxLo9FCQs91M6mIqi41s=;
        b=N95fYYfqOoeGkBdULOcsZncG+/YkK9mMHNkb89RBB3K8hO6PnWTwnAG/JA05a6tfkP
         +O7MkNmkymNoRFVnETizHLqN1BR24ASwu5/DNXx/2k7n+Wmf9+eL0vwRMH9+iR1tclnu
         h3D+HXvSlPtvLHaQwmXFRp8iNjJ9ABE3yNx5qo2uAeZqlhXDas40lAZZZkgqmKP1KhUj
         5eTpcmIACKxQpO7DnGqOpZVZziDIcOd+h0Tfvx7ZDXjI77wZP/zTZG9EPce/sdwnpJrh
         zPVhvDKobTQkXf/7OM+i27K7ZDRkpMYq9QfW/8Px5IBCKQdsrMrO4WDZWtUQ/w575FUR
         +zHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWxpd7zl8CM+yuYgQKZycUwyQxGGv2EVL+LQ08iVkyKoGuQm3oPqqxj6ojeIKVlx0mZ/lsxO0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/yQVRIa7HFp4FYdTfArzEUDtBldkRJVmvYUg75hoKVfaHb070
	QJ6UWhQYSwj6BAtc5GKy2fVXCyYbrOcGPytaG4EISp+O8TSyOpkEkhJwfhiB8DDCHPjcYnZZ2yq
	Uz05pdI3fFYXZrwiibUYwoBcU7dcj1OXG8ct2Qw6zN6aLKZwLhZoFeS+LNMfDzOKO
X-Gm-Gg: ATEYQzxNu0YHj+qh1Gnp0ZVo5z/OyxrpgtMvH1T0R/lU9gGxs1w2hjub6LF7oeJaEVm
	jMLt8Pu7jcgSGk7+UsxtopQGRI46yFyMGMjMFhjXJUPUby7+w06GRMQCIuRoPfs25KIo2dNtH77
	b8IsEau0V5071Qgf8CX35qeeJky4cezemQ5pasI/aKQJLbB2RoOK84ew54wjxb8n1cwoDD1M2hb
	pJTwZd+uezeGfZczvuboCJCdsu5rmzLvn0x46t9y8iD+0+acc1Sy6D5jE20o2En/V3iiuI8Ztn1
	ztdr1ur/BCNYrWxK68c/8rhhKHwzoERgVexCZRn5f6zZVj2xKbPjAgy0WiuByO2ZV39/R5j7t+Y
	TgvOspd6tn2g7Z+IujdsI8E+UzRwCr0r8C21CW/kdO7D2W+8bXu1ZOlp39QJejmKZx4AyrbrxEN
	UDeJU0sQ==
X-Received: by 2002:a05:7022:6191:b0:127:1492:e370 with SMTP id a92af1059eb24-12a96e42235mr1847751c88.5.1774454090431;
        Wed, 25 Mar 2026 08:54:50 -0700 (PDT)
X-Received: by 2002:a05:7022:6191:b0:127:1492:e370 with SMTP id a92af1059eb24-12a96e42235mr1847728c88.5.1774454089844;
        Wed, 25 Mar 2026 08:54:49 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7827e02sm175255c88.12.2026.03.25.08.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:54:49 -0700 (PDT)
Message-ID: <e799a763-125b-4a5f-af5d-2a3437dbf1a6@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 08:54:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ath10k: WCN3990 firmware workarounds for WLAN.HL.3.2
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Malte Schababerle <m.schababerle@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20260322124822.230492-1-m.schababerle@gmail.com>
 <CAFEp6-0xShGtpWEhmYmqs0156GHZDsF4Q7E5HOrMbnGSAb56wA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEp6-0xShGtpWEhmYmqs0156GHZDsF4Q7E5HOrMbnGSAb56wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tH9OH2UgnPxALc2uQZCqPyMKbRbv0kvJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExNCBTYWx0ZWRfXzZJ5Ti+4IDx3
 49ZDbpe7E/hfR6T5gi47Fck8xxpKap1MVJAvryBp+H+n7PShOWVtKsttdBwXGXqDepr5ub5CrW+
 1waHthqaATnAw5pUaqfxxml2n5e7dBmgaIxWplGeuOKm41Sv/xbRVL7BH/iNmYylv9Ed6/BxJlU
 7ZMqQEyZb+VdK5yRT/WyXES3b+lod92N8JVWX2CnklWY7RVEyV7R/A9HN8yReynKVqq9UPVDtUo
 c1OLBvVu215jgIUARTW+tisPuUJu8aJHQW91+NqOE1TjTim196GuntNeO0VoViBUEApCA56oRLK
 d9O74DaGvkXd50gxggAg6I3FuyCxowOjWQ/KJp6AMzQAv0lT9q4fwnAoexyY7ilSYYmpmWMZVOV
 GK9w8y3xrrdPF/DxK5XoVSu2EI66SMGwXQXVGs6wjVRlc7sXDNZjvbK9Stg1aOovMkXOTGKcKAT
 7Dwb0igSlZuB+EOvJAA==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c4054b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=B4GIT9JVp03-19iSf3EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: tH9OH2UgnPxALc2uQZCqPyMKbRbv0kvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_085453_033372_E47C9494 
X-CRM114-Status: GOOD (  14.28  )
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

On 3/25/2026 1:41 AM, Loic Poulain wrote:
> Hi Jeff, Malte.
> 
> On Sun, Mar 22, 2026 at 2:49 PM Malte Schababerle
> <m.schababerle@gmail.com> wrote:
>>
>> Two firmware workarounds for WCN3990 (QCA6174 integrated variant on
>> Qualcomm SM8150/SDM845 platforms) running WLAN.HL.3.2 firmware.
>>
>> Both issues are firmware bugs where WCN3990 advertises capabilities it
>> cannot handle correctly. Tested on OnePlus 7T (SM8150) with
>> WLAN.HL.3.2.0.c2-00006 and WLAN.HL.3.2.0.c2-00011.
>>
>> Patch 1 fixes a deterministic firmware crash caused by the quiet mode
>> WMI command. The existing guard from commit 53884577fbcef relied on
>> THERM_THROT not being advertised, but HL3.2 now advertises it despite
>> still crashing on the command.
>>
>> Patch 2 works around a bug where active scan does not tune the radio
>> on 5GHz non-DFS channels, making 5GHz networks invisible. Forcing
>> passive scan mode restores 5GHz discovery.
>>
>> Malte Schababerle (2):
>>   ath10k: skip quiet mode for WCN3990 to prevent firmware crash
>>   ath10k: force passive scan on 5GHz for WCN3990
> 
> Jeff, is this something that could be addressed or worked around
> through the firmware or NV configuration? Applying this workaround to
> all WCN3990 devices feels a bit excessive if the issue is limited to
> specific variants.

+Baochen, can you look at this with the firmware team?


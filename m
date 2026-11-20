Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB2C606A320
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 01:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TNWAqo0R;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S8pEx7W3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGEFlWeO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c/mFO/PVVkL9MEFeV3KCV40iBjqN7JJ79N9Bxo44vSI=; b=TNWAqo0RdkN+S8
	ezRM9/N6dTtdb0gDTpOaZzqIJ5abSUvxOwMf4PDlk9E2JZ26I1JJQ6Za7uVufCDSqPM0O17hXwPeM
	/c8tByBuq2a9MgsMOgaeOhVcSz5+Z+X3HDT4pox1zeVyZa8lTjyxuZxupg5h3IgNTjavS7004Vb1T
	uiqJFJ8V0WQFUG64tuf+qoVrpZqbKfgbA+GRRudHfHlK1BlxYQJSXQ7SAJvj8siXPP3HFJaI+aix0
	L/93bZFkaxWB2oIdtDKD0Ir4sI6J5hKSBq07Gsujnp0Nr09FsrMJ1RTqCIjJNBtWE1rpREftC+kQ4
	voHes/u1YxvB0XNVmJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDbG-0000000DqcM-2JGp;
	Fri, 20 Nov 2026 01:39:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDbD-0000000Dqby-3NVK
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 01:39:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK1Fx0k424485
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 01:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/mFO/PVVkL9MEFeV3KCV40iBjqN7JJ79N9Bxo44vSI=; b=S8pEx7W3GnOmBu3d
	jhtypC2AWFYJ6Ef6V8U27B7+QYMrnYJ2WzGN4KsA5G2jbo6GVeN/HS7aA2tNItO5
	h+HpS2vO/wS6bTBPWzpTrrnsYQV7cmQUGmhlvlJKLB0rBJ9HZFTkWlRbVKL8odZv
	pywiFPpN0OGU/ZCqK2CkKcNzBdC8vtuzIZ3SuVOLsqtjxzQQ5K2xDO+f/DcOtU7z
	vlTSFOzYKNyqkNH9JRR2jGRtisjAKchoLyMhpdpRqPUc5rg6vZboG/B+j/w05xbz
	o73i6c48Uw9OuP36EP15DLOQPgFgTuPPdAbOKiHQsqFZvP/57xGHGtnoRcLcY1bS
	HiuTgw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1r2b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 01:39:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso447843eec.0
        for <ath10k@lists.infradead.org>; Thu, 19 Nov 2026 17:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795138775; x=1795743575; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/mFO/PVVkL9MEFeV3KCV40iBjqN7JJ79N9Bxo44vSI=;
        b=WGEFlWeO+nrbKgav2AX+uP46UsD8TRfyRv2FDBGG1xzSfxok4do50WmmeBpPL6g8+b
         iC7I1uk4wJ/ytyhq/XvXjFSGDdztzwvfOKcLf8QBWtf4zJIMSz53ymXE8mgVGoDSZunB
         ARSbuA5nn/3Fxcs+jXB8fCCFUNCVJfHyGhjNa1tcHCXNxkBz1BZ/88Bn8pE8rZhSO1yQ
         HkRENuo6L0H+eOdS9Yu6wVPCvWqbpkg5O6j3Ux7NKhet4gvr6VE4ug3q98Uh3avzMxkJ
         02y7idYa+TheQCgSl1C+89N2miu1o2l1exBoKogTZvnGqWyux6mVR9CFIRkFYsRCRyxN
         rOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138775; x=1795743575;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/mFO/PVVkL9MEFeV3KCV40iBjqN7JJ79N9Bxo44vSI=;
        b=KqXA8EHi1I1S33PICkUo4ZFmgiao3DZ482AOaexB+eHd1nICiP+yB2VBMXJkD44HS2
         5+nCnHVLY0tFNBU0ooTelXHaRBbmeMswuiXJvqCwrMppE0RTeBlo3sG9lpKHC4ZqL7ZU
         ftAhZ/hhMoJ4O9rMaZHEO4Cqft77hggO9TjRKcC+YQZph/ln/4sAxokbdZ0Cgx+qv1d2
         RQjeOksIItPhIs3h26zHh9z4rBpZVkCRKi6M3OsMqIG1KRQh37bUSVXwhkc8j253iKbw
         b89h35R00sXdLnkpjIzD2yQ/UzEzJOlbUtuQjub8PsAqP0Y7z3tbTZzkf6H2bZmm2Eui
         xwdQ==
X-Forwarded-Encrypted: i=1; AL+hErEQwldVIFIe3DehSgt93GouAETx8oN/3MVBayZM6P2tRExvTheYp3FDisBQHMiIrW5aQ/oPj5w=@lists.infradead.org
X-Gm-Message-State: APuU4Z9EcNoI5S4S0f14S1vXCffMlczPRLZIuWtXzOGI1eoRaMbW6hNK
	XX0yzENUybM91qM0FD5UsFYVx2kkEZNyr/PcIn9dcFW+LDd9aFyar4L/CmxJ4qGYLuK3ljXQ2pC
	c3R6faLOjUuUfDmK1BPKrJi+ohuBTi7/lkdrwbzMI5cr6h5IFQIAjyq3/PaNpnewv
X-Gm-Gg: AZFdTZdVpf/ljuRLhlF2ZAA5dEiL/F33Mb8+GxhgRrh74WvEchlzz2QP6iESkE5a5+k
	6cp5/f2FUZXoEwqEg4V5ELLCjnrWH9BI31IZJmxa0YtLKD8u/YvJWIZGUSXGvzrbbpyWLzWuOQj
	VlKylN2oJ+JUxWNDnizVkp4ut0SH2sEukLCMjq3jkW4Iesv6Lqm22XijEzKSA3vxepNPsvoowxD
	1FQcnHcvxr9G2amCPLbdcG3Te9y2ErNqalW19v2YsSa9SGyklotTz9Twa7bxBGFzYdbRddNmXWe
	xcTHgHa62w07/t+V3kNz9DqvJMBFhu+EZH0mXuZGuvngsRam71+uhmo2aYe8F3OZH9vxME/idKS
	MfC3M3IwG+qMGjQQPgr2I/X6L9klQlMY4ESa4zek5LnUDwrtU0ubA4HZrp8KzLlC24wI8Owpvir
	L6MaUoF5WRslodwsVY9yNZuK6NWiMD
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr1035497eec.31.1795138774716;
        Thu, 19 Nov 2026 17:39:34 -0800 (PST)
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr1035470eec.31.1795138774025;
        Thu, 19 Nov 2026 17:39:34 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646632b9sm2577799eec.1.2026.11.19.17.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:39:33 -0800 (PST)
Message-ID: <c1a6694e-9be8-46d5-8cf0-d70f8757bd05@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:39:32 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza
 <effeffe99@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
 <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
 <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
 <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
 <DMWL0GJF8W4F.LOVVKMQHF9R@gmail.com>
 <CAFEp6-0Bh2DtKsqGPpAoMarWh97nH-TE8SkQDGtSYydPf5=Agw@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEp6-0Bh2DtKsqGPpAoMarWh97nH-TE8SkQDGtSYydPf5=Agw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6affa4d7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=Ru5VwsRgSRo5wvMXhNIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: jtFQ_Tbo7umXy-JpGHnWhrhqCZluw35m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwNiBTYWx0ZWRfX6F5fK3Ga1LYP
 dKFltw7vy58ox2FIBgrFIy0a3+dykqzSm+MqnHKS8UrClp/W+jmbCyX7srVFhseOH67zTwiX2GK
 GjibsctIuhg+n6YUMAKx106g6swLUnTfkYyNkGZBmHTXUYX0/s08t771qicLY65ZAipxrq1wKnV
 yk+HKdbdhl4kE/3HPCRL+z0OIz3uvquIyYqZgd9WzOROEJCDXCCLVceH+xPMn/6CT6gSqS1JY9x
 nvZMQEciJL19Iv18E9bMpyLGaNS8O9InvHwwVZSe65/9/xCUQYlOj+wMLi4CW3ah0OA1b86xxv1
 6uJ5hOs55l9wzERGdU7LKJPFXjdLFtAFh9YtltNyzZ2dnz3dUZFDjsTKw2K/Z60EXzA4SLjjH5q
 8dOQ/tvog5xhQcfF4ymtZ1pfD/VYM1eLo2YJZdsVx+DACtA+jAmwkqV3odCdci4zJTVxKX5c9bG
 hG9jCqTdM0KsTv8IbKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwNiBTYWx0ZWRfXxex5/Lk+BqQC
 3GThvyznuNk8chPKUPVvd/BrT3nU05KDdgeg3tDfim2ym6Fd0W64ZtTsdj6qELGeyo8mX5MuuDS
 D8YGLBTxxSEleHchlv6rlZITp2HUhlo=
X-Proofpoint-ORIG-GUID: jtFQ_Tbo7umXy-JpGHnWhrhqCZluw35m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_173935_876584_56E55664 
X-CRM114-Status: GOOD (  15.73  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/2026 6:46 AM, Loic Poulain wrote:
> On Mon, Nov 16, 2026 at 12:00 PM Nicolas Escande <nico.escande@gmail.com> wrote:
>>
>> On Thu Nov 12, 2026 at 5:56 PM CET, Loic Poulain wrote:
>> [...]
>>>
>>> The 100 ms timeout seems reasonable. However, will it actually help in
>>> your case? You mentioned that the failures are sporadic. If we happen
>>> to read the temperature at the "wrong" moment, is it likely that all
>>> three retry attempts will fail as well, or would it be better to wait
>>> a little longer before retrying the read?
>>>
>>> In other words, do we expect a short retry loop to be sufficient, or
>>> is the failure window long enough that spacing out the retries would
>>> improve the chances of success?
>>
>> So from my POV I believe the driver should not do any kind ok retry by itself.
>> No need to add complexity. We (ath10k thermal users) already had to cope with
>> read failures.
>>
>> So what I would do would is something along the lines:
>>   - if we fail the first 3 times we read the temperature, disable it permanently
>>   - past the first success, don't disable and report errors like before
>>   - lower timeout value as this holds a lock for a longtime to no gain
> 
> Sounds good.
> 
>>>
>>> Regards,
>>> Loic
>>
>>

Since the original was already sent up to Linus via the normal -rc process, I
submitted a revert that is making its way up (already in the wireless tree).
So a new implementation should be on top of the revert.

/jeff


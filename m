Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20409CCD199
	for <ath10k@archiver.kernel.org>; Fri, 17 Oct 2025 15:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA/XjYdGjZ7tzpUjYOV5X8f91ozwneXQxXQ9c7C3ybg=; b=sw4sKA2UCIpx7DcElhGRB9Pgbt
	2vdEAyxc/3hLC406uvw5CEIk7inGN1SLLUipIhrYby0yP86IbqTVYngjaSeGG8T2bpzrxYgyvcXkq
	E/NZBs8GOCTB131Ps+xsYL594k3CusQDZeagh2fyesicQhxSG++ewfcLY85/wbYMb5Y+RJ27CdVb4
	akX9cm8P2Dylu/wx++cflSoJ23EuYgYzgGcHfZviK+Zsu8TCATHpq/xtKB9HldJro9kYrqAwiZGTo
	GcgRDqshik0yQPvxuTHaF20VE+C2EvvyCSVge59FFBE10tlq/6UeB9HzGtlTrLN8SD4B5uRkNZKSI
	UYgQB9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mq1-00000008LND-2mWg;
	Fri, 17 Oct 2025 15:57:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mq0-00000008LMt-0qyp
	for ath10k@bombadil.infradead.org;
	Fri, 17 Oct 2025 15:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GA/XjYdGjZ7tzpUjYOV5X8f91ozwneXQxXQ9c7C3ybg=; b=LD6TSVuW2qYl9cJcQVt0abMZ7e
	fiww1xdqjDBrGqVmBWvur1Li4MQkjts38AWM+0GErqc9b17a4b7iWu60dtycQS65IWzoTPro+1pmh
	a+utiQZgeofXw7LWw85537ZjMjbCerv7ty+MfzUqYHn+4Ees+uE5vHKyjRCKWyzDfr/0SSddUASvw
	OcwGTE8KUHgLBn0S56wiXwD4RU1ZcxNp+oWb+UkJrTb5HTP5TBSnGKlArrA+Mlo6N/EZDfmwHU+8Y
	kANQ5urI0EmrcVrfvPccgKXLben4Bnsjh2/NEyVMHjy+3QAxg5dmnXDPOiXatReGn6Nu11cx+DTtq
	kSPOYChw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mpw-00000007iIG-37Pw
	for ath10k@lists.infradead.org;
	Fri, 17 Oct 2025 15:57:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7rgo8001686
	for <ath10k@lists.infradead.org>; Fri, 17 Oct 2025 15:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GA/XjYdGjZ7tzpUjYOV5X8f91ozwneXQxXQ9c7C3ybg=; b=GtAt1Kefag9lGI6W
	Y7+UMD4gK2sEnhYr4bxvc50x/7GdpfhBWJqZjlL7CfGPoBbYAwm7RSpgwFnMjIYl
	Ab4kHiP0EsQ64P0MhXtRlMruwvJtIWGwdhjd/i0PIyDfsAVjT6v7BUuF44cadJbF
	MRIVfkZPqc7bM85sydhJQYSHkzFoukZNkV3pnuycXnI2nUPrgGLM9Zjikwxl0rY+
	BuWr/dB1u5c9XJaoMAArJbhcFbn+g4MznrbP2GYckqiRmpEvzzxZWl8tlUfckHTd
	c2HOMxquKS7xKDaJOpRwS0whJ51DGiEo+JUpoY6Fdtx+v4yySGJxQHXjBzwfOBAr
	pe0dTA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9cwab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 17 Oct 2025 15:57:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78106e63bc9so2355850b3a.0
        for <ath10k@lists.infradead.org>; Fri, 17 Oct 2025 08:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716662; x=1761321462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GA/XjYdGjZ7tzpUjYOV5X8f91ozwneXQxXQ9c7C3ybg=;
        b=PMEZzcuTzK3Iuaq0kkymXMMryg7Zq0F86lxiKamZkj+qp+CtkQWxXiA2azEF31ZGQP
         9a2LF6Df82fw/N26luoZmuar6WbozlrLHPD67s6oa2WYcrJhftjAyHOMHTujRMa/79WO
         3/EK/DNjg6lY3+VCf8hedfanrugoT4Ka1ul+0bjFc/1cbmwk3T0BpgZ9Mm0tDtQKg3t8
         uQOM4aNmBhkuzGShukehWLY3rQeNz1ZlXVT43moV9MoOSr62r6WWshfgcJM4PasSI+jF
         Luim1mgpdn1093vw5uglrXZDRjWhe7O4zs8AQJRAcDATmY2QCurZtswycwFNwq7OVmoZ
         Q5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD9NBVgn7FeVlI65+ZO/EkbHCaP1RZlLtW+14MJUJZd2dcPVXkQ45qRvGBk1i9mciRr1jvt8Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2ZCWBztiSgiS7ji4gRYsCRZyYgAbC58ql3fHCeATzIATuwsfU
	h1o5cqevbfGuBkDw9XoBLjDJSDwTo0ZObqTQ8Ot3ESQlYkvT6yMHF/ZGlyK93qydHQiec4W/UpE
	lKF0NGPWf5JFHFDR7C033nsXfzf4wRPlXWLgbWg2zX2ih6k3qeNFtY0VNeic0ddU1
X-Gm-Gg: ASbGncviWmGXLtO+1RJxsi4pYOqACj+kXEt3slXTiozgVwEkibiDHSQk08iVngN/h/K
	UMYFDmz5Ty5BbecXznq2Q/KWumxnaIangwUf6/n5fRqCJE+TtlZ7AgFA5meVuZkXHlNh3VdjDY1
	Z/00W6lDH3c4xj9Mc6UldyjKNfg7lKLNaQVOhctMWKf1XuW3aycUx9Ya0+uRuf24Enyt2Uds0sq
	xy93z3HkXl6gVgQl1k3XXT9F7bovf8IEdwgtQIWoZY74eJj+UzJAQ3vaRWL4TmAEectEKz5WMRJ
	kqBc7DEsdPzTADcosxIU3cH1irQUC6AjtSEqbZObZlbIzWeiHSzi8YDRXgEZWZ/50l5uSCAMnSL
	lXfxEgjK/hDgc2tmt4Y/to4JWDOOn/ok4q196eWjLrric9+CQDEIPNugwDBYmxBCgL7O4qFw=
X-Received: by 2002:a05:6a00:3a05:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-7a220a83474mr4870548b3a.11.1760716662324;
        Fri, 17 Oct 2025 08:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEG0kQQyBJokWPqPUpBDr+VClTQlOa2zZV29zqtuleUAhDclL+l5xJ+z+cpPiams7RTcEdAg==
X-Received: by 2002:a05:6a00:3a05:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-7a220a83474mr4870521b3a.11.1760716661866;
        Fri, 17 Oct 2025 08:57:41 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b065ac2sm26007964b3a.16.2025.10.17.08.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 08:57:41 -0700 (PDT)
Message-ID: <76d4235d-db4e-40f4-9ede-8cb536b82fbd@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 08:57:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ath10k fails initialization, bisected to "wifi:
 ath10k: avoid unnecessary wait for service ready message"
To: Klaus Kudielka <klaus.kudielka@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        regressions@lists.linux.dev
References: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
 <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
 <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8EF7Jl0dTX7cctik9dwnRycDuZRir96A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzj/C+3x17eOf
 qRxcSa34VEjMimciV5T5ljihB/zHDwfWw2bPnezlxXHWhLRi9Au3TwryU3UiTyFbtKfYdvcLhyX
 /4VkLlAF5O60WHnVO2+yGCQ8yVKJ6ethNUb/wEcPjBM+U6xCEMXhKJYlJCgzdAHqkacGq4ZCmg8
 mWuCDMywBWnsvIXzy7ZB9BJyTzNMyC7jOIvocBWdVoTwODJtrWT2LpWZwMIEeZeXD+Kh5KOTnXQ
 hR8pmxgfWhvTzNH8F5+i9EJPIvBrwW/ZdtA/sSSilFmeBbExySyyeLzsX2LgXZqE66TG133tZgD
 Abaud7J3Vn6Dhi9q4+1TgTAONo55adujKYl1+fbIaY8O6WBBxg2Xsi5AkVKLUBTgfQVENDP6FT9
 1jCgUvTax09O182g7WmcwHZMnMjQsg==
X-Proofpoint-GUID: 8EF7Jl0dTX7cctik9dwnRycDuZRir96A
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f26777 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=CbrLfc9WufdjtirxkE8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_165749_203938_FDCE521B 
X-CRM114-Status: GOOD (  13.17  )
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

On 10/17/2025 8:37 AM, Klaus Kudielka wrote:
> On Thu, 2025-09-18 at 16:47 -0700, Jeff Johnson wrote:
>>
>> On Mon, 11 Aug 2025 17:26:45 +0800, Baochen Qiang wrote:
>>> Commit e57b7d62a1b2 ("wifi: ath10k: poll service ready message before
>>> failing") works around the failure in waiting for the service ready
>>> message by active polling. Note the polling is triggered after initial
>>> wait timeout, which means that the wait-till-timeout can not be avoided
>>> even the message is ready.
>>>
>>> A possible fix is to do polling once before wait as well, however this
>>> can not handle the race that the message arrives right after polling.
>>> So the solution is to do periodic polling until timeout.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] wifi: ath10k: avoid unnecessary wait for service ready message
>>       commit: 51a73f1b2e56b0324b4a3bb8cebc4221b5be4c7a
>>
>> Best regards,
> 
> 
> Unfortunately, this particular commit completely breaks the ath10k driver in my setup.
> 
> 
> Hardware:
> - Turris Omnia (arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts)
> - Wifi card (output from lspci): Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter

This issue was previously reported with that particular chipset.
This is currently being tracked at:
https://bugzilla.kernel.org/show_bug.cgi?id=220671

It may be useful to supply your information as a separate record to that bug.

/jeff



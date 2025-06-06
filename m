Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B50C61CE7
	for <ath10k@archiver.kernel.org>; Fri,  6 Jun 2025 22:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sl3cJSO556t99BKg1aWFVJRWy81EW91Y2ANloEryh/U=; b=kvxze2rjTMpNs9gNvbsFlAogSl
	JkCpBHl7JhBSuIVRwOk++x7NN/NRIuYOM7phYZbcvS2PRkj34ooVZ/UmvTcBon4RnO83Va9d0SWYr
	rHggMd3CPHcnz8NWuSTLMVf9WSXzCow63+lgPy+p87xNb6HH80TfAWXiPek7ny/NqdciSWOCjMBgb
	xLxLLFGuww5ZFYzPTz5Vh/A3ij/s8+rsiGTf6S2To7Mv9VT7uaY3vj7kyTF+kHsGnHeLJcYyu2K26
	xk+xznoimp+PyH9+eSLScWIO1qrmTpFCk/E6DAhOckS5aXCmdUVQ4w7CqODvuzr1oVvMnp/MYVxYC
	NfikwKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNfx3-000000015nT-3HLw;
	Fri, 06 Jun 2025 22:54:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNfx1-000000015n5-1y93
	for ath10k@lists.infradead.org;
	Fri, 06 Jun 2025 22:54:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9PVq008400
	for <ath10k@lists.infradead.org>; Fri, 6 Jun 2025 22:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sl3cJSO556t99BKg1aWFVJRWy81EW91Y2ANloEryh/U=; b=d7oNf6tqRPCPZ5h+
	6JSl4y0FSo/SCQSZnfTpcWbvmwrNfFeod4jaTGg9jB+m9rQ7CQvPKp/arz4ws1gr
	vBmSn6kg3kmUoXyw56Z2VtwGNyi9OB7et6U2RxaXiCyfPbD2WEEppR0SqUP4P8CN
	gCauUOLA/rQ8ilCsLmWdElhUnM2nAFQyL7lkJiUcFDNsUjdPI6aoL9e5+jhyDY2R
	5FRBCT+dUya7wZxo9hG6o3YM7RbVYRAyOqJ3mlfiE24uokwPvdRBNgMZla0tmDjN
	7n72ZYBMe0/MCdDKvcguaxIt2kPTYoqeKYNsD5iE5HK78smknvuaJTqp54iBM6Bm
	uKNEcg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 473nphtx7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 06 Jun 2025 22:54:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b1442e039eeso1585775a12.0
        for <ath10k@lists.infradead.org>; Fri, 06 Jun 2025 15:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749250453; x=1749855253;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sl3cJSO556t99BKg1aWFVJRWy81EW91Y2ANloEryh/U=;
        b=J4/sISvCjVnCTFhk4W4b47M36zrH4mvQcrMLWI2TDaWt9fppMbGNXTLUK/1Usvh0Np
         H2Nw6yUHtk70djWcbc0q7AHb5Ax2te+nHDFFo0psNC0j+z4Owy/XoagUTpgv1uJzDeY5
         q1Wx1mg34lhlniKCEct3Bwggg8X7YQscgjVZ0E9hVzVujHqgH0msTsMm7Ac/Vbhc3XWK
         kHWRRmYplqzemowL3p9S0FjcgFEeK7dxV0HHs4Z591y3S1h6qC8g6I9PDZurY0qvNIZv
         YUHq7Q+8WTEbELB7AMihMNrnqhfKGx/p3hNz4xqHYDVx3FRhpHQBYRe82beTAhHmjwtz
         15GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZzURGiaXrgKVEIKHuFJSxK2VszC8m3YH+yc/8ncdz2ACrDuUvmOQPH/bMoAbXdel+6ajmtLI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzayLxbOb9EbJx/PIWYSC3GTFarWvi+dBdsZcooUgCja72Jyuw+
	mID5Q2Jp9JxLqS5WTDO37Ag7tdcnCCQmNIIeiOUWMEsnHNQ2abRZ7wqraRdrsa8BbkXyvwukMk2
	xYiJ9S0Z3x3JzQOkd/XzXLeZJCoKvsFjodxkKzB/hixMeksTfHxWbBCSLeoIN4Rx2
X-Gm-Gg: ASbGncvD3uSDzJNXcZHWHLmKaYdP4/qEzB84+m5Sfgew2Fn2I3z7bhdjwtqHlC9cNL/
	bfeXRa4DY9EJNRi8GH5lzSWPmO7KWj8/NW6iu/Ywv+DyxlhBinVkd1mhrFrbHr+/VZiXlo3PFpn
	ENa669sEJGs+XSERQ09tLnVO5dOySUdZ8tyDQWNT9vyD0TRhLSGOJHrEQ46pc4CG4LmEeMZSU1g
	BNLXqp4HUomj6TKb2WjQtf49O2V6WaHKKPsBs5X+PWghcVEAMMNs3HrENgqz7h+nihn5Bl34Q00
	IMi8LDwPT5EFun5apkqGEAO442WzTOwEi3+KvOJtms5ywwczPCozC32taUfZ43Ggha7pX4y2+Zv
	0k2Ei4CbHRAtl7Ww=
X-Received: by 2002:a05:6a20:1604:b0:1f5:6b36:f57a with SMTP id adf61e73a8af0-21ee2618e34mr6041675637.39.1749250452896;
        Fri, 06 Jun 2025 15:54:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLmDC7Od/6RiuEM3cH00xevyfsgBqjmx7Yt3RaJn9wcOt1rzlfEJKJ1gY2ysIYP5uLwPQOXA==
X-Received: by 2002:a05:6a20:1604:b0:1f5:6b36:f57a with SMTP id adf61e73a8af0-21ee2618e34mr6041652637.39.1749250452524;
        Fri, 06 Jun 2025 15:54:12 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b10c05esm1781855b3a.180.2025.06.06.15.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 15:54:12 -0700 (PDT)
Message-ID: <9ab0e15e-c85c-435b-9dba-c78d958d37a7@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 15:54:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: Drop of_get_property() call
To: Rob Herring <robh@kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250314233831.2535170-1-robh@kernel.org>
 <CAOiHx=mr+MFE_7Krue4BPrtvtyJW0pWUBXCrqbViVH5oOTT2Hw@mail.gmail.com>
 <CAL_Jsq+L2W-=4m2c2zAKNAP9vsrbZkOBHUYqPevcdM9L_3xHtA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAL_Jsq+L2W-=4m2c2zAKNAP9vsrbZkOBHUYqPevcdM9L_3xHtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fXQ1RSiRcLRyBM811rv3d3oJrSX1fKrN
X-Authority-Analysis: v=2.4 cv=N8QpF39B c=1 sm=1 tr=0 ts=68437196 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=rT-OEoWXBDPQ62C3PGIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE5MiBTYWx0ZWRfX5p74CjUlGRKI
 VcKUfBep1Io8mTfkuvel1ZwwiWHuC4AmfjiFAq0U5R3DW9AlE777p1eY8kqODh3rQ0UleUx0b/A
 Bq/V/L9qUpY72DiuLwjNIpf2HAndA3EHrKD5jPTHlIHL33HUMC4E327KN5ksZU+NjW8RhMwF2Oj
 MFQ5F1xfv67TLuiWL4xUHcdD1wDMVq1xUndNv8sFFQnVqWnR8z2kXGjkJij9cpShlUkbr1mPON9
 GQfa8qjpSd7AOe+ZZK0LUjwpkRJm7X8zO1lhzRZxjUSrJiwtxPk/5P9N8X+pMbWQzI2JP8EeWBn
 EDQBn2r0TjOTfU2gt+ehpymE0bOGLKa+D7ujJyp+YlYlCWD64yzgAveFJH21+kqWrn/eb5P7LQs
 TCXr6TIu+6oZm5vdDLepxrvnKSgkyom4g0AKbaqYLHmGSha4X4fER8AxIA1LQkmtuZuYyGRI
X-Proofpoint-GUID: fXQ1RSiRcLRyBM811rv3d3oJrSX1fKrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=875 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_155415_632371_53808840 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

On 3/17/2025 10:19 AM, Rob Herring wrote:
> On Sat, Mar 15, 2025 at 5:07 AM Jonas Gorski <jonas.gorski@gmail.com> wrote:
>> of_property_read_u8_array() returns 0 on success, but
>> of_property_read_variable_u8_array() returns the number of elements
>> read on success, so this check needs to be ret < 0 now.
> 
> Indeed. Thanks for catching that.

cleaning up patchwork. was there ever a v3?


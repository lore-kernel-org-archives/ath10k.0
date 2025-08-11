Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1870FCA0EDB
	for <ath10k@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LyObyJu5M8r8WD3EJOUXcSgt7esHUFIRa8rhjMc6H8=; b=vO5OagQ8BT+iQw7zzn0mlehGCf
	1hjjVW9Kd8LiLM5UNdONfFBliV4Lxi7sD4hVfGpHgorCVWiBrbpgEFV2X2qlgrjH81e/CkqEAaFi3
	qdSwjh5RRijrWikJ0jdPSrLopj4ctLrpFtcLKMJlVk2arOlMM6fhDxHYTB/WUeUd1vpmqBdb7+Nlx
	RoTz8I/wthsBRVDdQB2wJjyTd4rtuGIGqvvV6N+/iceLz9cWS0zMgxELTmTUDqQOyJJmx14D+8PuF
	rZYjv+1lRD6Cs3fI55V04qLfWdlBcv2jM34oqaK0gZBSkEs01TDPUiTBQ9PHKXtBaJGte8Fk/VS10
	FB3ijDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uladH-00000009Dkg-1uM8;
	Mon, 11 Aug 2025 22:04:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYcT-00000008ysA-0FoB
	for ath10k@bombadil.infradead.org;
	Mon, 11 Aug 2025 19:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0LyObyJu5M8r8WD3EJOUXcSgt7esHUFIRa8rhjMc6H8=; b=WwtHHO4mWv5BuRhge7wT1lEm79
	P8tJ6jGMIAK1g1Oaofu6Qfij9N2hUU/j14V3wkWTuUPCCIxSJIo82qToC9852kM/qTYKJUGhrgfy8
	XABcneuT1Z1Eo3B9CG9n5wr7TsfwtFIfe8KZb28R0uvagABxI9cQAvwzs39gOrBC5ziul6/cd2z5u
	ZLFRazLjZNFrT1ApLPSIP2yWzdrVKYuN0IeTxETh1Qebbdxxksd4uDbQnPj/s8EcyIhUpU777NyeM
	AZ/JmDuzmn8bO05nrrNWrt35g+Sm0CxrHjAxOp5Um5BXaxdb5zTq6JHFQaeg4NMDKoxM1/4ZsRNE+
	xdbGrlvQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYcC-0000000FVbX-38Ea
	for ath10k@lists.infradead.org;
	Mon, 11 Aug 2025 19:55:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFVDJd019150
	for <ath10k@lists.infradead.org>; Mon, 11 Aug 2025 19:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LyObyJu5M8r8WD3EJOUXcSgt7esHUFIRa8rhjMc6H8=; b=C0X5jfK9p5DHUYm2
	jERnPVuiMH8ir+xFmkZAalINrfa0PH+uP7P+Xj5n9d2mTZ+TFG4NvXTQHfoQ0S6t
	lcNpvo3VpmOOUxIri+LPgWjgkBfgIHckjLXw8f1A2Y+hgoXBU7X1y3HpQa6monZJ
	IUg57JIhZx0bfmD686tRAO7OTqPOjUrtJYoaeUMdlyvjjcES+BeKPA7fe4DPTUed
	m+Bb62BcByoyeOLGWtQAC7xj7p6MrmXgtDfPXl06muu15wLsKSTK8Pg5rznLZxdy
	5e70ce2+E0nW7UsecUOMjHxK+T2khM39RNsdT48aYeQg4efG07dOkFt8lk1thnMA
	P8fb4g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduwndn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 11 Aug 2025 19:55:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b42a097bbb1so3127459a12.2
        for <ath10k@lists.infradead.org>; Mon, 11 Aug 2025 12:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754942123; x=1755546923;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LyObyJu5M8r8WD3EJOUXcSgt7esHUFIRa8rhjMc6H8=;
        b=DSsri23jvbhdFJdJqwK5GIc0W2svin+cUHu5W+Tqhl0OAWlrvFw5wbBBLDBwD+GTPY
         8nje8JavsMJyg+iBYYHCLyjUR2lOBK4EWw4+pyRy/+0E/rDa25mN9mZvEGSOk4hYizen
         J7Ve/jkDKHnQRW7hO/HYOiTGx0AEGkn9+Edr9sQJoiocGbE5Ggb0QX6diHU9NMgCQib4
         lW/sQOx6y/dkeZhkrZ9Tw26Kkd2Lck0SfLZ+2qhUiBqh+HQKVljizriZwWkuwgB1Lty7
         DaHRE2bsrbKxqkGXfTwlQ2AucTNdhBr5QpXlpynOxFlMIL1m6QGtoDOfMiVp/umOQoNz
         haPA==
X-Forwarded-Encrypted: i=1; AJvYcCWJU8kWksQlsyGGGiGC/mOaMmPdzaLRO5nMgBu3MzSh5Ka00DvFeFT2e3SWW/41kj+Jb6Osy/U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwE/jZfj+CNa229tQHwZZqumWHeCeEK2Fm0e1G5mnKasm5+TW/d
	NZWFPoOtIcZdo7QE2Tlkv125UJ6HCoksnsebpHRGmocWy1bOHVoCPAsdI929EYWDNRPPKSkK4aF
	YYbEIrME/pwzy8vcot3RCnWAQnGntRzcnY2SB+vcbyWukP7hFS2GadJpiCmIhZquFIE8z5owb
X-Gm-Gg: ASbGnctuFyI+a7HdjTPUhmTbtCX9wvBUCL+tuEzmnilGgWXSqgZgk7ElPUS0a6Glb21
	EShG/wavHxRtBFsoYE7ZHJKUbFVhFw06mv+bo7Cf3RDPHme1oj+jaUAv7RmyEywUhQtdtODOSBj
	uONAj5r5zik7uIINeC8oV0AKUuzzX/B4RXG2PxTQoMcCQQhK6DGljZt4c4Fl8iKcWwSkF1q3M3t
	MnADvP22wmCe9eSYr68EBxK/k2tY6KVTgndijLqIF9BIONqydTV/ZBOcRZx16IBBsbjimE9MwCs
	s7Q0YjsTtYOk8j0NqSgpv60b1acs8kGPvPhMN4FlVcQxk95UycG9NNUIN0Wh3VhCYklAYDG6qy0
	rPOkLSKNxC+yWaDrluWR3tvjq1wnH8bLS
X-Received: by 2002:a17:902:ec91:b0:240:4d5b:29b4 with SMTP id d9443c01a7336-242fc1063f7mr12498775ad.0.1754942122702;
        Mon, 11 Aug 2025 12:55:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Qx8bYK+rncQZ56MU1IG7eUy3lnzmit6zpPxPUFBpmw94BfCZtlGwBUH68DnPgSdEAGBLeQ==
X-Received: by 2002:a17:902:ec91:b0:240:4d5b:29b4 with SMTP id d9443c01a7336-242fc1063f7mr12498525ad.0.1754942122260;
        Mon, 11 Aug 2025 12:55:22 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bac12d4sm23720118a12.32.2025.08.11.12.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 12:55:21 -0700 (PDT)
Message-ID: <adf6d126-1f80-4590-a9f6-171b7feaf656@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:55:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: switch to of_get_mac_address
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER"
 <ath10k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250809031517.5535-1-rosenp@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250809031517.5535-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689a4aac cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=3-rGAEJhA9dDIXXEWvYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: pYDnuv9R0xrWN5HIkhqDIWiJtlLFH2QZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX95/Si0SwNpV7
 3aOHVdZMAPJiLPQ1arPb6mxQcYXOJYMdYWioEKnxyoTBFoA+ZRPykslDxP5W7ZIXLRiLqITCMqW
 DhIWo6dSbvWF6j2gITlfopnI3TEjZ9eJEqnjFHkCsqWF+y4P1ResvRtSFlCBa5zo0P/zx+Nsi2r
 RdB/7Z01jMDkTypruFViRJfsnjVYsY5/vGeSszdHkaUsEpQv3V5E2SdouptwX0kKZBw9g9ujxDt
 rXl0nkc8Q/ppyfzA0zrk3G6HuugKg59ym5L/GwkcUkjkyxdCfEvTptZ95pgOTfX01hPT2J4u2gX
 ZUitkFNq38r6zc2zlnkM3D7FqNHRwhPQE9J+1GyqLHt4k3WqcW5ZKUuPCpg/c93o82UbTtYSUCu
 2O51cG/6
X-Proofpoint-GUID: pYDnuv9R0xrWN5HIkhqDIWiJtlLFH2QZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_205529_197165_F88A74EC 
X-CRM114-Status: GOOD (  25.71  )
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

On 8/8/2025 8:15 PM, Rosen Penev wrote:
> In 9d5804662ce1f9bdde0a14c3c40940acbbf09538 , device_get_mac_address was

see
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

specifically: If you want to refer to a specific commit, don’t just refer to
the SHA-1 ID of the commit. Please also include the oneline summary of the
commit, to make it easier for reviewers to know what it is about.

So in this case:
9d5804662ce1 ("ath10k: retrieve MAC address from system firmware if provided")

> introduced as a generic way to get MAC addresses from anywhere.
> Unfortunately since then, the landscape has changed and the OF version

when did the landscape change? if using device_get_mac_address() is breaking
folks, it would be nice to know which versions of the kernel have the bad
behavior so that the patch can be backported to any broken LTS kernels.

> is required for NVMEM support. The second problem is that with NVMEM
> it's possible that it loads after ath10k. For that reason, check for
> deferred errors and exit out of probe in such a case.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 6f78f1752cd6..76747eb0925b 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/firmware.h>
>  #include <linux/of.h>
> +#include <linux/of_net.h>
>  #include <linux/property.h>
>  #include <linux/dmi.h>
>  #include <linux/ctype.h>
> @@ -3456,7 +3457,9 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
>  		ath10k_debug_print_board_info(ar);
>  	}
>  
> -	device_get_mac_address(ar->dev, ar->mac_addr);
> +	ret = of_get_mac_address(ar->dev->of_node, ar->mac_addr);
> +	if (ret == -EPROBE_DEFER)
> +		goto err_free_firmware_files;

Note a similar proposal for ath11k was deferred since it seems to break x86
attachment when there isn't a device tree node:
https://msgid.link/ec974dc0-962b-f611-7bbb-c07a3872f70f@oss.qualcomm.com

I'd have the same concerns here.
(but I didn't dig into how the fwnode items are set if there isn't a DT)

>  
>  	ret = ath10k_core_init_firmware_features(ar);
>  	if (ret) {



Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB5FCCF9EB
	for <ath10k@archiver.kernel.org>; Thu, 30 Oct 2025 01:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uplEjRjXn6n3hOHodOMA23ldjJzjv7AtZodGTNnhxNU=; b=fNGyJsInkyntd6dptlaXJ0IlNj
	+04GQzH6QjElVvQ938iiEth/HcIyAVGniqDtuEeP5Xbxg/NgZGBc9cuQm9e6ytuH8vuEP6/Bp1mMg
	eS8wcJlheU8iW7G6aQKJHuKP96ucFijuog1s3iVhvo36AN2BkCbQ5Q/zicASkVGIJK15fk/j2uunt
	b5LlX+HFJ+PF7CVtlmOL+fui7ziZ5nLoTUKyIKhNtwWgMFM6zVqormwFlDqbkkMlQaO7L0tRehL+M
	zPKHzWf6fdL3W4g/U2CH02jl4jix5PQjai/hqksMfu8t95fRUWPW89V8BH7TpHs7666DuMHdQtm6d
	6xZL58XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHFn-00000003KEa-0jwW;
	Thu, 30 Oct 2025 01:15:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHFk-00000003KDw-0V5e
	for ath10k@lists.infradead.org;
	Thu, 30 Oct 2025 01:15:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TMU4Je569340
	for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 01:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uplEjRjXn6n3hOHodOMA23ldjJzjv7AtZodGTNnhxNU=; b=UNhLPD3ifF4rVwn0
	U14gbgxpacljiEatqxFgv7arZ1DtzgLkh+a772vfZu4Do0s/WPan7dRUGMxSNIWn
	kFahZe39OKUl+e4t6CUcctsUdzjEAWcmK+vUjR/wSvCCFPFMAWOr25/UtwSu1aDI
	Ty/eCetrIlJ1wsF+NRhkJekDfb6Cv114Y8Akrqa7mKAvsHKIsV/rhDYBH8d+0cnt
	n9sTvpyejez7NVUkmYgitTPYWGmC3nvB3A/aemlTfHulZhfyZxILkLKHsvBrmQC8
	/kroevwpUQMeisdshqJ97Akby2ITYjQWOuouHrEzRO5gZpRYqOCQF5hRIHRneTfU
	jCkLug==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3m0bj1kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 01:14:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a4c4eeeef2so918125b3a.0
        for <ath10k@lists.infradead.org>; Wed, 29 Oct 2025 18:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761786898; x=1762391698; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uplEjRjXn6n3hOHodOMA23ldjJzjv7AtZodGTNnhxNU=;
        b=jWcIeYnM6DxrdMCIwjVMc5m67clkqqWkSDMuVb/Wlzq9UK5LzcFRbvaxKUqaJGqfBv
         4S9dZd2lK9zR1K5D1tFDQpqF+nzZddu1qYaWxi8XcVWXzDCOZPSGsW0oX2jPy+5rY0mX
         2+uxg7lKfdTg5FuLgyrYTG64fhN0SUTuEmMhrAWpxtD5RC0WbnC08ZEfuNyhtMsIddI+
         cqKGWLmzkii3Hnna5JszDYh+mkwLU5+eEw4t8FvMP8o+xij6wLf1px8ckibgt/dYt4w8
         2mjzjnPSizcMowRWjjFSdrk0RIN9RmvBut4mmKUXuwEEmWfCXAjXMgvQpdJ7ot6Bijib
         twHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761786898; x=1762391698;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uplEjRjXn6n3hOHodOMA23ldjJzjv7AtZodGTNnhxNU=;
        b=YFUMvrctrCx3gkWovk7OCjYqQM828Yx08cC6ZCbrl6GvQF5czUa9QqgYcNHVHX4fb+
         Ag7h/7fHM8oSTNqJEBPQr8W1cP0WMn43qhcri0Ltv7/gGiGsCbB+sXWt20intcGSyu0f
         WHLTyma/NWz1NV7kTEY4K1ppGQVzpozJYG8mjkO3aebtvkMvsCNqXb17KCIKeWSrnDfP
         XaSbij1vQYhNjtma93sZxzhimh5Bh76hH0Mo/XZ1iFEGUugmQXrPpgJX9zqj36U1vYDq
         s33f3TlP0/AbSzd0oMIDiIuoKUMpyZlhT7ZZwh0hVPimRGgMf4PJBtnA3xlphbND2aY+
         lsHA==
X-Forwarded-Encrypted: i=1; AJvYcCWaq26QqCq6U/eTalvYHOGl5zl04Kya9g1EUPS5edoEikfU/kxpcvJwA4rzuOLREzgHeBN2AKQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFBwXyQq0hqEQS8fNm7SSF8gbYHlFLznDkMtW5rDQw1VNau+yf
	Ap5SoYpqsz594pxSaJZJ0swjc+qe5CA9TM924QamZMVdZ5H32GTAZmRYszAkg9/RygSl8gHj25w
	OLA+Buc4rk87jR++OsHCUIGkp0JrscSSmvNfS1LbInXVVvZkn+baq+UNka5OPF3nW
X-Gm-Gg: ASbGnctlDr0xGgC6s7u0ltZ7h+kTsjZ/qBzoLCQSvplF/qGCoA27ew4JnU7CFOFhH67
	0BRwp+b6js3H4rZ3H7PxRxHvmhpdFwyfC+nlxhlJBNlYqXm9+bjOrxPABejS/ewYkQp47aKP+jO
	6K6Zb+BFLr4SiKXVdKEmwf3Fwvsl1vItEZ9OFqFQzmctSUSHx4WgkV2XFohFQ4bAt0ywCPnQQKt
	i/vGS5JpCviaAAldlyWrT9PSPVvMej1EV3SAGV2FGjOMIzlEC0q491mh2hSVDucfoSQz24N/RvI
	+ryoq/QV40nBcfK3LZInU8J9ICCFlt18H0lkUbmI/gCB0/AycKqeT8JTi7HTYniWzOl1v5wgvm3
	kpCcGs7iB2ADdugpPTjmKvRWgTWJqpvZ7o4kUdfoe2W7hdRIGobPiB+C9L+KvEgWtcHGBu44=
X-Received: by 2002:a05:6a00:4f8b:b0:7a4:f552:b507 with SMTP id d2e1a72fcca58-7a62c6948aemr1423126b3a.25.1761786897935;
        Wed, 29 Oct 2025 18:14:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxg/gaMbHhmdQxq/ivXimd6Kc2sCy+uCcSh3cAwCWaFK2lzCgf5JPs9bcpzB5W6omR/iGAbQ==
X-Received: by 2002:a05:6a00:4f8b:b0:7a4:f552:b507 with SMTP id d2e1a72fcca58-7a62c6948aemr1423099b3a.25.1761786897435;
        Wed, 29 Oct 2025 18:14:57 -0700 (PDT)
Received: from [192.168.1.118] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41409e456sm16519817b3a.71.2025.10.29.18.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 18:14:57 -0700 (PDT)
Message-ID: <83c8504d-3159-4a87-a1ea-0fef46bf6762@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 18:14:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the ath-next tree with the ath tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Ath10k List <ath10k@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251030113037.1932c6d2@canb.auug.org.au>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251030113037.1932c6d2@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AdCf79HmHMZkrLFPykWaIvwSiR1vXoGG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAwNyBTYWx0ZWRfX9NsRDTnE1zSU
 2oV94Nqi3Y2ymagCjCMZwz3cBSGvxAYUO3b9/VXeB9JTmCAsHE1dDE6VhBd9Piof2cP2bO+PvWm
 tlAzS+cZVURzt9mqUOGV/vQKKTKQxbUZ26i3M5LG68apslFRfif7+QneR8Z63oal9Vm2tO70KUj
 z54CN2oKuVBAfThxzuS1OWpbavTXJ0IuN9XuPEf5rzr8eiZdv+t1xtkjHdBlef2jfUFpil1m4RN
 XPaocEhjgIz32/jYoAV6DPIT35QQ2jjThyk+KSdpS131nKjkmgcFtMcIlFQ38HRi+Fj9ZjxNF9S
 p/X/4Jjzk/dhZWPXkaJgpHryHo9/TyOb3DXVLELi5/GWXRiJyCRsaTEOJoa2rzWKiMLSxeaFUfI
 uf0Mj4GOETgSgIRyP/5l0QeOCNDihQ==
X-Proofpoint-GUID: AdCf79HmHMZkrLFPykWaIvwSiR1vXoGG
X-Authority-Analysis: v=2.4 cv=YLySCBGx c=1 sm=1 tr=0 ts=6902bc12 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3sE9uRzZUefYBai0eU4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_181500_320771_32059AAF 
X-CRM114-Status: GOOD (  18.40  )
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

On 10/29/2025 5:30 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the ath-next tree got a conflict in:
> 
>   drivers/net/wireless/ath/ath12k/mac.c
> 
> between commit:
> 
>   9222582ec524 ("Revert "wifi: ath12k: Fix missing station power save configuration"")
> 
> from the ath tree and commit:
> 
>   6917e268c433 ("wifi: ath12k: Defer vdev bring-up until CSA finalize to avoid stale beacon")
> 
> from the ath-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks, Stephen

That resolution matches the text I've prepared for my upcoming pull request:

Note to maintainers:

There is a trivial conflict between two patches:

In ath/ath-current:
9222582ec524 ("Revert "wifi: ath12k: Fix missing station power save configuration"")

In ath/ath-next:
6917e268c433 ("wifi: ath12k: Defer vdev bring-up until CSA finalize to avoid stale beacon")

The resolution is to take both hunks, ordering them in reverse xmas tree style.




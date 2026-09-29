Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BF9CA5FA5
	for <ath10k@archiver.kernel.org>; Tue, 29 Sep 2026 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=; b=rpjTc+p3FOxv5XcuuDisc8rCiw
	rvkCQh3WfusQWyFgT78uKvPzwefB7h1akgExPxBh3ByLUvvtsQH5i/Fk/9ElrSlCxa91LewOLLYxb
	OuJBepg3ctQn2wnTSlzEwrD85UE8wajMWMva3Ba1XHTlMohFfzPYt/0ce9Ul1lVZaaHU7sBMMh8HS
	5GMTbR+aAcTneqA9MGB44VVUxbHcNzZAGtpv4WG8HXXOH3rjGM4op2/n6//oF9nsSJDoAHcrYFlUC
	/HJ5MWKcqoBkt7xtZ2CTAwSreQP1hXy65b86hotI7GeSztbeDOsbg/R+W1773orul8XuE977IGE0o
	KGBno3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBa1O-00000003y6I-1nOP;
	Tue, 29 Sep 2026 15:45:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBa1M-00000003y5G-1054
	for ath10k@lists.infradead.org;
	Tue, 29 Sep 2026 15:45:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFG23r942020
	for <ath10k@lists.infradead.org>; Tue, 29 Sep 2026 15:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=; b=c5p1Xxt8KVBYsUB3
	xYluUR9MR5BVI493p1dU7/qRA7p3Uab0QfpbuGPl4N7oKSR8l/nO6hA2fqIjGBCf
	lvewgeoehd5GZNJK/lICVdtyuyjkIpE4jzq3RvlpAkpahR//80oo7pR5g/ksFoCi
	UGreQx3HnzzIuscV34pdjmOX8gTk6s/0fB2XZQDTg7C4EfXkk4pV0Oo8j5wKQfQg
	576fzBwEUJ3HAeozSCxYT80VGGTz6FzSq81y+kgVCC30AL6SALJ3fNuLVIOXL3ie
	cj3O4c06VkMJUqBJBWT/FSuT1/DbOWAhYasaT3O+s7pFUalgy2oCl180yEf085uH
	FR9wTg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0ftug4jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 29 Sep 2026 15:45:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a0f55a3941so3535284a91.3
        for <ath10k@lists.infradead.org>; Tue, 29 Sep 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790696731; x=1791301531; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=;
        b=hK+cO3bpUCV2n3+fI85aic9JWmdamZSIgHoYZc+bV7D95TuXRTRpe6buEV7XX44N5G
         Nib3dPmxM0sEkBgLCl0PHQHQkUG6IQ1uCFsw8FWSzeZgqCGp0f5DhG8X4o0w80hzOild
         fpt23+Tzq2l4jiOx83oaIn0T7VaJaqyIFYOtEwYxRpkq0MJktpYJ4JZ+ZMxZp48UlCmz
         ihA962od8I6Cv6hY4CMCUQu2WL0RSigz/78EE0eroMkdg03OIPu9QlkmcbxToPoRNRBI
         YWJ3JtZ/W4v0+ZaDhSQORpNF5ipEFCMjB6hK+/2/95wOnRDNYdiDKPlueK1nqlmdoHTz
         iFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696731; x=1791301531;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=;
        b=aCHbpmxXSHVj4ZRZtXihQt6B279yWVOdM/o8l2qKDwoo4DpBLpEr0f54JWr1KOds0t
         BuNAn+7BUSwIAV1of5HXRPuXZwuRWcoXvvlWJD1InMEN/9rwnCey2RdFCduKD1EvbdTr
         4J3UYN6SWvuIwWzBdKrAblXlJVqGfsLVtlYQsDD8UD+EGAacA/z8rl4hUiMOXCwJm1SX
         /rYqXhGup01bH5w2VMJlLoNLBAKRP+/xkEkmwhiVBu3vpM+mScYn4KWw3XiigW3OQcbe
         1zBkfF3IqWw2YUQ9M8WDqiM17q4Qt0U3vtWynhreFjOE6Srq+OkBpsYsD+XkepmFZmXt
         udsw==
X-Gm-Message-State: AFq9FYKc3+yqFs7Sf1gj3qG1iUA9JtAcZVp5KMg8uwyZ9F3B+BxzrSXe
	RQtLXsVc4i3SKQ3EubgA2qHAWMAVJMoBl3AJX03JZzkWlBxqJVwaExtajd9v3Vy1n7Ck88bfFKq
	Mg+iQee6IVMvLwFd+J6xOYmeOYguAgi6LB3EsF1J8pClhptzo73aTN2nlihy7JZS3R514GMcA
X-Gm-Gg: AYBFou0aeLpiSY2l5NVNmxPMOA4XepeCZlMyleTzGD+CyZRwSxzok3yae2tsSdtWr15
	0wMUy2354dnUYlIUxqTT0HYEIitvuZzGsc5/4h5Krh04iE8ZBznpXYYwtLtCEy2Pn+1JihW3Fan
	m6bOYl/nUmpb89jqYhvlyVvG70LxSFIG0OUnc9VrXL7B4kJpWC/ux2Q6WXDaSAhAZk6n++KYiqn
	KgjSlKOMhgbRs3EhJNwhc6aNDNFzufZ+zotpY01gharQD4Xx4w3GRsDfyGRKgQEUzK20/f42pRC
	hbYYQ1aZ5gDr/zyAHEkGs9SbrgZod0UHqGejpe8EhXZivzgKzaXtNnM04pkXeNxhZJFzUN6bERT
	clGaLl/KmRwvm5WMkmL3eNTsxgDOHGBZ0Nrq9CDmWmj/yGjtAWEYgKP1cfrXY
X-Received: by 2002:a17:90b:1e47:b0:3a0:c72e:46d2 with SMTP id 98e67ed59e1d1-3a0c72e521fmr11145144a91.6.1790696730249;
        Tue, 29 Sep 2026 08:45:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1e47:b0:3a0:c72e:46d2 with SMTP id 98e67ed59e1d1-3a0c72e521fmr11145110a91.6.1790696729652;
        Tue, 29 Sep 2026 08:45:29 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91458e3bsm59366315ad.68.2026.09.29.08.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:45:28 -0700 (PDT)
Message-ID: <fd24a99d-e8f6-492e-a71f-d35188cf41d3@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 08:45:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260929
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfXxGxWXQBf+Z0B
 BWXYALD9NhmwgLUKaT0IZoigN/gIsOJzjmiwOPi5CQAVLPV7VIPcgeX0KAtvBu3UzmXzVmlCOjx
 SM0aeqsR32m0kTAYztv45eWzdN5DKW7V5B8PzkOvw60NCjrAIF2NKXW6jux4lowwJKdwMmxl24V
 Mx7kytNNePugdQrPOm3ae1dh5phMJtPVFVy1DoTC5f/dUIC1tDEt7TPs8x9sbsIDWbytpdKmIKk
 KrvTpcwbABZ2f3QbN7vGgFcIMXwjPB/KxR52nFoviF/5vsZWAJRcw4TdAt59y5k5ptpWdx03Np6
 +sZuHZDwtOWRLZmnepETMx27pNL2n6xlu9u/96hT0kJBkc9UI/AKbS1Ft5pRehmEyeYcZF0KZmQ
 5XcrxiPzghaomzpsvlEg2Qy8CnReCrzSJPgoHw4TPDxFcZ6rk4pzfbeype/dnu6noVXR4daiol7
 QkPd7TSVEWLVoBxCjrQ==
X-Authority-Analysis: v=2.4 cv=AoB7T+9P c=1 sm=1 tr=0 ts=6abbdd1b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=m8tp9wjG45yvVgdVl1oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfX+FYZjeboQ8j/
 pWP554vM7RQodfJGgA1cZek86th8rkOFM9eXVlwlz0M4Pk/L0uIrbmVgxxOA3SAaRWO8gAHYrV9
 o5icSjcFRbL3u9eCckxINBt0xCOU8M0=
X-Proofpoint-GUID: llUMWSGfliE_i61de7LPhnd-yFntnwHH
X-Proofpoint-ORIG-GUID: llUMWSGfliE_i61de7LPhnd-yFntnwHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_084532_273547_099C73A7 
X-CRM114-Status: GOOD (  14.08  )
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

On 9/29/2026 7:58 AM, Jeff Johnson wrote:
> The following changes since commit 6f63e919fe1e335b8abcb3a28bfd4804a98d875a:
> 
>   wifi: mac80211: fix slab-out-of-bounds read in ieee80211_monitor_select_queue() (2026-09-28 11:11:19 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260929
> 
> for you to fetch changes up to d52302171b61dbba6c9c15e80e9a5f02f1e9f95c:
> 
>   wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume (2026-09-29 07:03:58 -0700)
> 
> ----------------------------------------------------------------
> ath.git update for v7.3-rc6
> 
> In ath11k, fix an IRQ imbalance during suspend/resume.
> 
> ----------------------------------------------------------------
> Baochen Qiang (1):
>       wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume
> 
>  drivers/net/wireless/ath/ath11k/core.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Please drop this. As you pointed out this fixes a patch that is only in the
next tree and hence the fix must go through the next tree as well.

/jeff


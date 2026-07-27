Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF18EC531D0
	for <ath10k@archiver.kernel.org>; Mon, 27 Jul 2026 08:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBJODevipv2/JNQZQkU3PGD4+im0nIr+wKclPG5CiQo=; b=zeKrU57zeYEcdMTUZGY4Y9x761
	OUnI5OkcCEd88AzXMi5Id2n6k+VUZX/rdOOKM1NQqzfrOGo+zzpjaRDV1wI3l5qLN2p5Q8OFUCxdD
	Irh66rct7GUNPNvqmsd8XfNQ0ZOACOAARuSy16+WNyD4n7uQHVK7yARMI3cB7MwSyiclZeCUUzNyO
	LRfI2U44Jd+IsLbD267+ve5m1BNwgEM2QpxF4snlH5jrFZbR0LzffJ/Lqeb55ZJdOqKtw8FMkkY/z
	Mwr6c5N/vCzRvYVGoKVTLlWEAmFEqjznF1QpCRL+yi34vRuKJ8q9S72FXcs8C7TWk/qMDY9T8jjlT
	JEKCKpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGqt-00000002FUX-1MQb;
	Mon, 27 Jul 2026 08:38:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGqr-00000002FUC-2UYV
	for ath10k@lists.infradead.org;
	Mon, 27 Jul 2026 08:38:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7SFuK3339673
	for <ath10k@lists.infradead.org>; Mon, 27 Jul 2026 08:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JBJODevipv2/JNQZQkU3PGD4+im0nIr+wKclPG5CiQo=; b=b3uBcf+871dDTxsg
	Cd53dTDUPYOBlWM5czBnT1pNS+T44MP4K3yA02G1/YsoptygrNVtEbaOgIzhJR6f
	MN1ajTwymI1pPBr0je5MUw71/U8bH2rX9ksjlrUNmnJ1DZ0hmNiBLvdi8Y001vqT
	29WnQPjkcnjY35P5qPc7Gvs8aGVB0RSrFiIYd3ui8kSW47xG8kWsRGk6mXHsNrkH
	s7/nsxK7RVR1e4qXqofricb9HmQB176l5Ux55pLknXe69kMF+CJAX3F/ArpMJJau
	sxgZhfc5CW77D+c5lT1daa08q5kPaxDcOgVrcSUlziWGmnHcuc9ah5aG4STNTasZ
	A3hyxg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3sdf43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 27 Jul 2026 08:38:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so31440725ad.3
        for <ath10k@lists.infradead.org>; Mon, 27 Jul 2026 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785141500; x=1785746300; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBJODevipv2/JNQZQkU3PGD4+im0nIr+wKclPG5CiQo=;
        b=IXsb9QsQqlkKo7iG6a5ARWJ2tLzAGLS8C0jpqkMLtQojoV7PL3oEGBqdkvk7Axb6+6
         I99d+IGeJJrrljslqS2lcIV7rh7+K/V3gX2Avfr4xyogVjQeXy45nkHCVIImtZ6HuAvu
         AatySm/6P9ELJNpKsbla7Fjw64VFfhfnWuv1LYAU5aWwZb9z5+BKAqqt44DigC6c3k+C
         H+++MUfXm/4U1WKtfX+0kD5XbaHqegGA461ruQquTmbxxkn8U/+/m5Yy6PGXgugRQD6V
         B7tTFeQiU2XJeAdNtiR3WQfgZE71FiW79UF1Mhfla264sZ5QfzBrdTTAgBcRFWsEGMD3
         5Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141500; x=1785746300;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBJODevipv2/JNQZQkU3PGD4+im0nIr+wKclPG5CiQo=;
        b=MtpcS1bIWQQFXxSeh045WvvJk2j35RbOyzvlzgPUBeU+AAx7BK9BxI4wGRCM3LtX2L
         NRwgsNyxsFfQS8axId6IIVFGk00RThOEk5MkBf6CnTzHXWo7gPjy1jM6kqkw4Jekyf8N
         jBpYfhYzzu+l8bbG2Z1uXYB7ynICWZacFLWHCortZOGzRtViQ9jdBkt32Dbn1L8fjgSk
         4PRPsmKFrCmYlxBgbhMll3NUytCJR9RNURHwboOQ5ZVakSqmcDo0oU7tOTQCqSeMkrzI
         4qLvN7Z8yJdYEWrffpz6DC1UTfn8jOXE20C7jpPm6CgOYsdUhWHMRLw1P8sVIN6rqU5N
         NwrA==
X-Forwarded-Encrypted: i=1; AHgh+RrfB7d6iokuq2yPEDy01A7Qc8doN7j6qiYYbW6OL+wI9UhNUSjNEqr7v2/X37HGTvdtNJtX7KM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyby2P8We7Mw2dnNPB2Tu2O0+PPaX6W4lF8vWz6SaofGyc8NeHP
	hqGSJy8cpYFwGy+NBcs930l6vv2cT+TfEUvunu6BEpGZvszATlPebf9Ym2tZApvaU8bIkfOsdKE
	j++isVjign47V84qxGWJ+tsNrNtwtqGIqSyK2TtwA0KExmTN7NcxZBqCsnkDZclckmJZNKkLn
X-Gm-Gg: AR+sD11eESrsTBcXxPnxTyNTERA9fNkNwqb2Nb3oUtI75UxCA60kB99SR7nU1py58go
	gxFsC3dnE5m5VBYHdK0A1n7fMzMUPqOBY/RX4Xl3Hrtn073Y/qcMgGkloW6S0aig0QyTU5//v7R
	i/wMyLmDtmxtZ26NWkbFUtihEHpoCLVH0XusHV0PLXLTEFmmlQqHMnrBBtVdk+uke6RZtBhm2Vf
	ueU6m98WhQsATiIOBMJL1J5jkjo4Z6UomA5+fJSp+15HDwzbF96elHlk27+iEXCW3n2AkzzG8Nu
	p+4wzAZ82SOwq+fB5XEpyGMosRVbAhvLWBNQWSDtqYU4wqqHgH7eK11u001U+OCV3OZxM9EBB4I
	/p7LvLYtqTgdXlkA4fqeupXcx5EfE9A8=
X-Received: by 2002:a17:903:2446:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2cfde83038amr68156855ad.29.1785141500304;
        Mon, 27 Jul 2026 01:38:20 -0700 (PDT)
X-Received: by 2002:a17:903:2446:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2cfde83038amr68156635ad.29.1785141499842;
        Mon, 27 Jul 2026 01:38:19 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm31703235ad.4.2026.07.27.01.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 01:38:19 -0700 (PDT)
Message-ID: <4f08e6f6-29bf-4653-899f-e0b6cf806675@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:38:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: snoc: use memcpy_fromio() for MSA
 ramdump
To: Linghui Wu <linghui.wu@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727072629.2297208-1-linghui.wu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727072629.2297208-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA4NSBTYWx0ZWRfX+aYo8OhyrIrp
 Tzw9BFH6jy03sFoPFvPj7pZ4poOO4rnKzkpFcD4ZbuY2Lr3itmhzpXb90ZWydD44QJyZp0whPSM
 2Cg5efzbxKUZnv4xGfSHvEW4o0f8bxLUVTvQNJNv3vZ8iD6dxmJqcEg+DDli1pOVulGFqCEJ4Sk
 V/NCiJB66MObR0BYE0J1AWlmrYsq1xR/UcGEbUPS5ofmpMA+4atawsZZp3870+Tovyu6eyoAVwn
 djA4HBEHw7MRaSsCyaNZUPegHlHQ4cYFgkWX1cHGf4vUhYqmVr8rBA+uPmNFcOd9qkBZeREj3nT
 TSZn19bL9pQXyFvn4ec4biDRlEhv7wX9Kr5E7bQk54Toblta83bYA22hMTS3vazLJzm/vT4CeKx
 c8DuENkDnVH5IZM4Wrw+ReCYcGJeoYOHoUFubYkXQn7HVzHgp4LEmKSMkM9SjpKOOhR+Wwcri6s
 TeRHNb1cmqafbrg5mCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA4NSBTYWx0ZWRfX+ILwGmh7bJyI
 Oq6eLczokx5L+Bw2cLcc4Grtw3lt+SR1xJu6u0pJyqDiLlIiHgXaGmJcDa6pyidMj0B1K1lx5ag
 uw/LZ3Vnh4fu7ci/IlhZkz07hY8oagQ=
X-Proofpoint-ORIG-GUID: qAUWzwaSIVczEW9Qjl3XVlrN034TKVkx
X-Proofpoint-GUID: qAUWzwaSIVczEW9Qjl3XVlrN034TKVkx
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a6718fd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EMxFUL3Ltl7gSd1fbyIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_013821_669305_DF6E2D11 
X-CRM114-Status: GOOD (  15.23  )
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



On 7/27/2026 3:26 PM, Linghui Wu wrote:
> On WCN3990/SNOC the MSA region is mapped with devm_memremap(MEMREMAP_WT).
> On arm64 such a mapping is not Normal-cacheable, so unaligned accesses to
> it are not permitted. ath10k_msa_dump_memory() copies the region with a
> plain memcpy(), whose optimized __pi_memcpy_generic implementation issues
> wide/unaligned loads. This triggers an alignment fault (FSC=0x21) Oops in
> ath10k_snoc_fw_crashed_dump() while collecting the devcoredump:
> 
>   Unable to handle kernel paging request ... FSC=0x21: alignment fault
>   pc : __pi_memcpy_generic
>   lr : ath10k_snoc_fw_crashed_dump [ath10k_snoc]
> 
> The Oops both leaves the firmware RAM dump buffer zeroed (no dump is
> captured) and crashes the kernel, which in turn breaks modem SSR
> recovery.
> 
> Use memcpy_fromio(), which only performs accesses that are valid for such
> a device-memory mapping. The generic memcpy_fromio() implementation aligns
> the source before issuing word-sized reads and stores the destination with
> put_unaligned(), so it is also safe for the coherent DMA allocation used on
> the non-reserved-memory path. ath11k and ath12k use the same pattern
> when copying target memory into crash dumps, so call it unconditionally
> here too.
> The MEMREMAP_WT pointer is a plain void *, so an explicit __iomem cast is
> needed; use __force to keep sparse happy.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.3.7.c5-00107-QCAHLSWMTPL-1
> 
> Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96972C55172
	for <ath10k@archiver.kernel.org>; Sat,  1 Aug 2026 15:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCu7aUSRdclcGJwFqNfq0oOCaCdjqcE/IxeaapxTTOQ=; b=OYtlrm5o1Xw8rtWu9az1cTxvNd
	1viY10VNe7ulRQQEg8RW516zTXWD54RMoJYxVDkwRw+QPbk7D79Zm/ayoS9bEES71kO/znIR1zzGf
	PKF7iSsJx9UqaK8a2UG2n8DS5GCDukCM/VSlprq8suaKIFOtKu5YrcVp2PmgSiznN/MlsiVfFhxLH
	JcIDtyIPhR2dhumIgaFKVlSClZ2v6e1ekzn6mapzb1WwFRscZWeavVJ1hz+UvBHefJn51JPXzBF+b
	h9827fNaVek5rUYxatoGBnUKn5u632yxqbFyv/RISCjxv0tFphp1+JCx5ui4MWYLnR13HaFX0UwUK
	eqD25sow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqC3s-0000000EpmT-1fNm;
	Sat, 01 Aug 2026 15:55:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqC3q-0000000EplU-0zLv
	for ath10k@lists.infradead.org;
	Sat, 01 Aug 2026 15:55:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671FahDc2762756
	for <ath10k@lists.infradead.org>; Sat, 1 Aug 2026 15:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCu7aUSRdclcGJwFqNfq0oOCaCdjqcE/IxeaapxTTOQ=; b=VVwvU/d69V4MTpzh
	xMr0XCHveHrzI5nBCgLlzDrC9X8Lmdyot5eWWJRTps0BvQp72WB0FZe1NwaEkXDs
	G/e8FKm3pmoinyfbVLA/hdvslBaa28tZLkOgxXAWQu7pEANzjAY8W5JgpNFL3/2O
	JQy/a0iVxaUE2tSg33krCclDm7AMBgqUtcl9YiygAaMqj+OFCDU/BGs7JF6XbaiA
	LGlGZMpMn+MeF2bc0xNe//S6kUpgc6VYH3AGrJAjafg0grfX3mpvjw+Hc3oJ3cVO
	hY/pYSdg5iEzxaR/ThmiTYaIcdQgFgq23ZL62rDpPVbE9neEYxqIP5jqFSd4R24v
	NlSr6A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9ygh19n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 01 Aug 2026 15:55:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cea6a46766so34527115ad.0
        for <ath10k@lists.infradead.org>; Sat, 01 Aug 2026 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785599738; x=1786204538; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCu7aUSRdclcGJwFqNfq0oOCaCdjqcE/IxeaapxTTOQ=;
        b=Bd9NGDBd5c5AVLP1L//O0WZI4nuCJx1QznwSicLAa4RcorqNDPL1krsl8LAqRTu79o
         ABWxvnw1fop2m+KuHiRNs8Iot3CyRIyhB8QhHqs0rDlhqfYQUu6MScR7Um0+dKxrZECS
         oaIbFuw2pe5ofXjS+7knmLcR1UsiJZrkU4bEoXMqtAT1QdaTZBgnaHiSTTT1sPUwhQGO
         DlfdqWnTdwDVSJR3xOUJ64BKmJHocXBbdmYqTLlaTwzRUxJOXbXYRKaPvmdi4hZrp31n
         dh370uWH1yicnZ2QYso8ANAKHVt4oppKqH/3QM5pTP4G9nmwjQ0dGYE0Yr4GxYAT579l
         NMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785599738; x=1786204538;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCu7aUSRdclcGJwFqNfq0oOCaCdjqcE/IxeaapxTTOQ=;
        b=pWzYW25BX2Y6TAaQu9XnCa6dn78MF55RDU04QtuQUK0wBj7EmODDU7vOaD1U2MlMjo
         gaTzq2aCvF9lZpRmcjO9MQNsmQvQvlw6nK6dfQjCuFhEbX8JdIY5OQyAAIXUPz8G5JnN
         buOKR3ZXnjc7S5vkWf1zEQjK9/9/muHXhAT4X5uqLFT0bUy1eUM/621q85ddxagxaG2f
         QsOvHilXdNJIigWQT7gPwfwWcCaQv8Lc2WLA8rKQ+kr37eDZ0xqwL82Ph/Gy8XpOfBAr
         0d1nj4b5YzXmn3u1lyS7jJ/ClfCjPAN+/ff19vnIZHy7yfvwwHKcat6+tztCi6iAmTOI
         1SoQ==
X-Gm-Message-State: AOJu0YxsPc+vZbXkYLxDVvSkfF7ZQJPZgpNIOMEW1oU7FG1ij5A/YPkX
	FZe+/wbcEYFcBGdbkI2RLvJ3/otTvQllmzZHy3AByvMntAU5L/o2Rp/u8D6N6pUQn7asFEFoeyS
	sMYhPVlzS6IDoZFp4mnWXeaAC/mfNMbRyFUBaXtmQahSPYNWveTDU2yWclMCHzjQL
X-Gm-Gg: AR+sD11WHuvRWfl3bKDdImkQ9NcHb2RY3nwPVnTDIgmT8E4yNKu4aYrj6yhqRJwF9P1
	6C/xZKYdB1spY6BHWqDZDs4B3ivVvfRQYdMPI7dHsiwffBoEd5j+nLEeq7hnqSm/Bq+DpHGw2WP
	5pFAhW0mRsMR2/2MqwzgAop2occxzjkKq+WeIKr4m73Q2/f5AHD96KtKRivrgC2lhqXyOwm89dw
	IXM36CXQiYP957cK3QTYlnkDO00HL48c8erIrXLRks3KS8dEckAXRzxTyJ1AVIZ0lGwT7MHzYI+
	6ocCjX74Vo5psBQDwDUNLXkKYx59lnMi9IDO5LfRdAaM2dl1w0g6q/RFxw4sATf1mk7gQyKI/tg
	952x6ALW/X6HDW5fgJEaUT/bgWzM/jAGL5n/ImdAPYzNdfkrHE/7gnTE=
X-Received: by 2002:a17:902:f542:b0:2ce:88d7:a233 with SMTP id d9443c01a7336-2d052428c82mr36192845ad.33.1785599737834;
        Sat, 01 Aug 2026 08:55:37 -0700 (PDT)
X-Received: by 2002:a17:902:f542:b0:2ce:88d7:a233 with SMTP id d9443c01a7336-2d052428c82mr36192665ad.33.1785599737383;
        Sat, 01 Aug 2026 08:55:37 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm17110636eec.1.2026.08.01.08.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:55:36 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath10k@lists.infradead.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260727072629.2297208-1-linghui.wu@oss.qualcomm.com>
References: <20260727072629.2297208-1-linghui.wu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: snoc: use memcpy_fromio() for
 MSA ramdump
Message-Id: <178559973596.3865089.1821995582192910761.b4-ty@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 08:55:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyOCBTYWx0ZWRfXz48eLOOikJph
 ObRPPEL/o1l9xhB6/SOHn3a1aHFVtN3kzUoryN+ylZmPqoOudfPdwBkiBcWbEyPIrxiAv+uG+uU
 gDKxuBQNMVMdMeGX8tBdSTPLus3ctMo=
X-Proofpoint-GUID: coZijU9bcYC1zD7MZIey8HwImtCJGzFC
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e16fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=js4kd28HrUIP1rAYZOcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: coZijU9bcYC1zD7MZIey8HwImtCJGzFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyOCBTYWx0ZWRfX1JbUGYE4KQ8Q
 5mr6QIXBzpqRL5cjIczTyCJDefZpVNKipasZFTR9fLJBt1DvxkuevQyEmUYDXL8GAz7B6G6EsWm
 cP2c3YJEh5XqB6tricUjiugw6gR3hyrz37hmcWncuTRDkKaJNeWUKgN9MjMOG7TeRtmxbPNxVY7
 RfYKVwb43vZZJsodx1kkhE5R3Gb6MezxRdjxW3Nv60M8o/ijbwsGURx/Hs3Ggq0eKBhUrbVXXXJ
 wIXscpwg/PYaF9ruUK/XoCK1mdfdTsPacTaOXGkg9H3PNZvxvDk3s6K+K/ZskVjxYMnFpf92Wgo
 4yW/EOkIcBhN6SjIvrV7eegIgsnzzonBPg4caV7JsYiBgTWdfjXREb4LrXyRhCwNfj26azdB/Yq
 nZHdPaXWHnIwYgLZz6PYJCE/efaQihCz/bZGS+FfHYP8ERsqCUveb7okR9YEYgOzdY6z3DhKySR
 gSwEh00+jiLwvmiY84A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_085542_312261_D5658F9D 
X-CRM114-Status: UNSURE (   8.97  )
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


On Mon, 27 Jul 2026 12:56:29 +0530, Linghui Wu wrote:
> On WCN3990/SNOC the MSA region is mapped with devm_memremap(MEMREMAP_WT).
> On arm64 such a mapping is not Normal-cacheable, so unaligned accesses to
> it are not permitted. ath10k_msa_dump_memory() copies the region with a
> plain memcpy(), whose optimized __pi_memcpy_generic implementation issues
> wide/unaligned loads. This triggers an alignment fault (FSC=0x21) Oops in
> ath10k_snoc_fw_crashed_dump() while collecting the devcoredump:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump
      commit: 4f25071afe9218aaae1c63fbf75e229aa6405319

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



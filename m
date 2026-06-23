Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3003CD4F26
	for <ath10k@archiver.kernel.org>; Tue, 23 Jun 2026 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X96xsOqsCkbxYiEhQpEjf0D0dIK3FoXdZ+rFU3Qe7Z8=; b=ZLF8aesxEGleRuVqCmudX8TnHK
	EAQfu41UvF/GrEhETNS8Sfy+E1qR/as1bmdrmtXRJdj77xYd5tP9tm8RHtKaChE9+GMjanCJC2jhM
	MlGOR4eG0vV7PV0PeMs/yuzmI2zENDo3ca/N4GayNclEg/OFe30h6/+bp+HGQRxGNcf+dKoQk2nNJ
	5xOlUY5N4QBgdU/KnSrm9zIcMF/MIkAv+sOkMlrj/F+VBaembYfc6KggJ7SZl6QsKkLbd/qIQj0F+
	aUwHch73m+cab7YmSnUdVjivo2tEyOEV+PWst1eUZDarw5mmpQxhS/VmpBDell6s6XW2Q9ER+K1Mg
	nMYCtKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbx8d-00000005yaK-1Ut0;
	Tue, 23 Jun 2026 09:09:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbx8b-00000005yZw-0h9Z
	for ath10k@lists.infradead.org;
	Tue, 23 Jun 2026 09:09:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7kqUn3228495
	for <ath10k@lists.infradead.org>; Tue, 23 Jun 2026 09:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X96xsOqsCkbxYiEhQpEjf0D0dIK3FoXdZ+rFU3Qe7Z8=; b=TeKFsrNmVHzNt4pj
	tiQTNQpBmUuybMW2JMaV+GK9v2G3AXAF2Jo9MmSXoVENPVf+JDDUWkom0v9+q2Fk
	9pQQBrGnNqeTBlSC4rjRA8rozmGKvyfUP9dJ1V59Vyj6To1GGs84hyMLrRK3NezQ
	ekbEiFjWkEn3Lrwy/6rFezZmgg72UJgrypA0IRa0z5f99fjvP+gY3gidM+wPZaPc
	iEUT1TqlYracOmSV/D0AmZvdfF74NF4PcKzQpXYGIz+bwUXk/bbhqvAuZLNgNxVI
	xe7t2DxnlKaHaP1YOWfKwcuD7fm3rLUpvcQc12E+7Kt4kQAk15PLRx3GQY4efnFY
	TvYn1w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29gae3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 23 Jun 2026 09:09:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8ab01bc3d3so617043a12.1
        for <ath10k@lists.infradead.org>; Tue, 23 Jun 2026 02:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205784; x=1782810584; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X96xsOqsCkbxYiEhQpEjf0D0dIK3FoXdZ+rFU3Qe7Z8=;
        b=JGuQtSdn/iHVJSK5lrEGwrtO7CxbT0U7iH+VvEVwLmYHv32wMd2AiTGISvraMwTnqr
         xwG/TOoLBe3fYPsu1xstbqeWj33Aydo22+Cea3m/EIesawjOZzFv8iW237L40ml+szaq
         plB/vCHmurmHAGg5Rg+m835BLVt2WK5Rq5JMHM45Lzw37qSFV1yKywc8O9sz6ku2ZEsK
         czrZhkIJb6O0DdAhPRA7OVDr3xgdQfvwknpbkXUjlol2WQeaqTMc6nCX/ctmlDtpt6sS
         oMmlQ+JYEyHRqhE72eBGGfxi+JG2z/xUqi53HYHjfBUFVRvdUD0IigiKh+eD5Ty5nnE4
         Xneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205784; x=1782810584;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X96xsOqsCkbxYiEhQpEjf0D0dIK3FoXdZ+rFU3Qe7Z8=;
        b=pmgoA/YhY98WKOKiPR3zhf/HvbsKnhIf4HvyeooLs1yAGI41ZkTya9tzoooIxv48oZ
         fL5+5PpPqvZhPvWNv9GNIQOQqDy4OUsNclKrMSKZlRjj0Rw8M2pNGusQMG5DQmNNdNDJ
         dLap4BCCgaJOvblMqdKOjO/6Q1gF2tlGisgZlEBIdMx/y90v8j2bAX0RWC3XwwislFrz
         c0Nyi5O07ksijXwClfrnvYDFx1acxLm1yqpBY/z5UTkKO9aUfdZX23e4LXjvzhURL7Ww
         N6spV7bPp7YQfi6YCWnJ1J5n6KulLmbLBfTziDAswFV8qvuNPWlD27nabPDQ8P6JHpG/
         2+Aw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1BkF3d9eB1Dl92mogAeAweKDmrprsyBRAbPYw+WQlaSvWQj0uaepeEkWGtzYwp1cvfHNQPZo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbOh3eu8H30LsL/flDzVfKbTJNggreP+ll+s46DCoxNV6E2YIP
	30fXKW9lSm+//rQyqdALtqaqdNmfmbxKanBTg2y+2QcSGSRLuSMMembfh6Idb9e2JHS4tnl1XA7
	oUABHB/ogK/DXBlYsjeTdieSlSOyPzR9YRDJBsG39cp81LE9PJQJkpJR1BEITiglS
X-Gm-Gg: AfdE7clEpMFzLotVtETqVhkplvN47k64An9fw4w6w5mzYDvho00PfwSfqB1LYQC7AnV
	lXGxHHzoYivHZefLNvTLvYkrNBWNoLl6zzLHN8PCQISGSC5tBrnwPmscEvtlNxcE3hluaT58aQF
	y59IkPyDKczgnKu+BrknRVfO1T82cw5JWS/DlDzE/1ebzvmZNZApKX6VQmOPDu8qh/IR+VYbHOo
	e/K/DlmHLDW6pfu6OxfFB/dPxhEYckjC5SaUX1N/Q+ONxermKuCdAcr07z9zRirtyyhHx3o04xR
	NdbvTW+9F3Tot+/9dAXXGXVw4FumZUgUeBoGdQ4N/rmf4G7BHWKgG7JM+PN08iiGFCrS+a0hc3X
	bMtrVAF/Hv1m2mm+dJIyp9IZm6BAyvnVzujfTifPDPHdnfSIwMNUMql6jYY8zbr0RCbgKU4mmck
	dleTPLNDrt
X-Received: by 2002:a17:90b:1dc3:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-37dcd66b178mr2487148a91.4.1782205783971;
        Tue, 23 Jun 2026 02:09:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc3:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-37dcd66b178mr2487121a91.4.1782205783542;
        Tue, 23 Jun 2026 02:09:43 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4eff2387sm9439796a91.5.2026.06.23.02.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:09:43 -0700 (PDT)
Message-ID: <8e80b697-e359-4970-b823-5d7e9a86b3d3@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:09:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: fix skb leak on incomplete msdu
 during rx pop
To: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
        ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260623064355.1876743-1-manikanta.pubbisetty@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623064355.1876743-1-manikanta.pubbisetty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a4d58 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PSAErUXHYyYb-UPQJNEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Yc59aAclBSkFxNZEgZR8mZCcxANi1n0i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MyBTYWx0ZWRfX6anh9TN0ePHe
 8Etbq3vfBbXXfToMw4alBcPscLhb8tDnZvJjwAL+LVYC4UM4x303qwB7yB1GTdAVZM77qq1uoGE
 xltV18311v9ETkeQpyA+Sr4HoLigNNY=
X-Proofpoint-ORIG-GUID: Yc59aAclBSkFxNZEgZR8mZCcxANi1n0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MyBTYWx0ZWRfX+wUuG8UlufjJ
 Lln+dPAa+cVThfxmItNYBvXhqZk0w7AIA+Bk6hTeKbW81ODcIwO24iisX1WYg2SjdQmBv1coOLS
 sShDUHUh8TpGOrsmIgYdju6BO/LgjuA4mNtz7781syh6nhUogMWPjqEB8H6b9N4OFS8S1gTxPfx
 4fY9VvDj20z+PMyGLFF511qLuBNXYK1ut7tz+rEw7CDRYLGc6UABPhWfQUB85PySKiojjpGXUJ+
 UQv2GTcPKSDk0Evq2+aYxaftkK2po8+SWIkujiA60mlqqH/7QywCpgg3exG0T6IP/mP+uZrZw9n
 DnV1APkwtK55dvMDDUG+1RsaI9uyHD/OCYFCOvRHRkTKunsouM/+aDQokr1avpnPZwFfFcvsozQ
 NjcThRCg/cbVD0lT6z3d9VvQPnFatBaZzd1TWXqmYubv2PlLCuo35eL5OVDAHzgVZZPzrPhsv8+
 tT+Gs03WvW9oOnR4hrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_020945_219216_3E008063 
X-CRM114-Status: UNSURE (   9.82  )
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



On 6/23/2026 2:43 PM, Manikanta Pubbisetty wrote:
> When ath10k_htt_rx_pop_paddr32_list() or
> ath10k_htt_rx_pop_paddr64_list() encounters an incomplete frame
> (RX_ATTENTION_FLAGS_MSDU_DONE not set), it returns -EIO without
> purging the skb list built up so far, leaking any skbs already
> queued in the list.
> 
> Other early-exit paths within these same functions already call
> __skb_queue_purge() before returning an error. Add it before the
> -EIO return as well to be consistent and prevent the leak.
> 
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Fixes: c545070e404b ("ath10k: implement rx reorder support")
> Fixes: 3b0b55b19d1d ("ath10k: Add support for 64 bit HTT in-order indication msg")
> Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


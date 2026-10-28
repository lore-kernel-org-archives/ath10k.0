Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C529606A31C
	for <ath10k@archiver.kernel.org>; Wed, 28 Oct 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OJShwDiy;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzAcC31k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYYWtZc3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mVhCdDkhAXJ5S102mixnITdimIHOTHoGKH57O2P0pYk=; b=OJShwDiyG9AGu+
	g2erBQQK5Ifw+KoInlVwEefS69vLkQ6OoxENNccY5z0xPKIMmf3uagpH7Umh0H0VYzZdPPytGgvVm
	9gYvNVxvlx3eRb13ynF3C7w72HdrplCrMmxiSEcnWK8a/rR0oNJKXXREQYGLqfKlTSmqiw0bWhFyG
	CbqmPlUwVZXOAYdJz76JRWmQJpl0mdCLjsO9dzQvXcbgQ7DOqoxyX4skPQlmLKfDzEw3SCDLgdKHf
	DijoCPcsV/MRXo3AUG6/wrkWpEJAccUcOFpEU2SkodVPYzFFx/VU/36/AXzJb5bekqllE2LUiPwgw
	8NXLWwIY6xfxyTsrPAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM59z-00000007HuF-2hEw;
	Wed, 28 Oct 2026 15:01:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM59w-00000007Hrn-0yFF
	for ath10k@lists.infradead.org;
	Wed, 28 Oct 2026 15:01:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDI5oO718079
	for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 15:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVhCdDkhAXJ5S102mixnITdimIHOTHoGKH57O2P0pYk=; b=QzAcC31ktlmC2cCS
	LDO9UhLMk1H9E+JsuvEJv90SGUuvR0kWdzBFd1N55Vb24qADIf7fO2YSfkhikI/n
	nxYoIzBAJ8kk/mBrOS7zHyz3FZQdaReG04rLsVn1rjqhuZtgP+5gnOgEmD+yqkHg
	oxq/5E6o7WSEf2GgW/vqS/Aiw2Hl6I9UKBOEgS7BawkO+4qzhtuu6ZauV8oXHuQJ
	2ImL7ZP/cVrLBQwYGAwanwzJOnRbK8qOFEFKpsABU5J+EbsrkUf27tNh+uY2XNPt
	h/seLmU0kxBFcJ/VbJmDkJVJkTsnDPrCW5Fynxag64BjuXE12UaCuQ97zXxXfJyj
	qbvvAA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgexd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 15:01:46 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-7051c542f0cso1210350eaf.1
        for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199706; x=1793804506; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVhCdDkhAXJ5S102mixnITdimIHOTHoGKH57O2P0pYk=;
        b=cYYWtZc383Y6iQ/QK5yfraACezFb4jvGXJptYMfCpZNipnm+CQbegedG8Dxw66HLKF
         2y9j916rGdSQfrqhPDX7KOjHivbGI+KPFwT+lKJorWDmOFlM47BoUDf2xAnuVNmKUiLr
         tRocDdZ1byDL2qWUV7JNow2AAA+bx4Anye1OrDsrU8MIdu7lki0qQN/2YT7rVHDMlNYO
         3E5cAVBgj4wTEqr9jfagwTXIJxlkhwt4DEzdFEC6KPt/cDl6Oaeqq7dThbiSaUaP5XXR
         ly/8llw9NYu96OhH1utgnRLsDEJeU9zxUk5uVULQS4nf3ZWdM2WwTCUua5ycvRqgaOKd
         PSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199706; x=1793804506;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mVhCdDkhAXJ5S102mixnITdimIHOTHoGKH57O2P0pYk=;
        b=DhqcnNsmBrfcI4/amMGYNFUuQXw3nXOngrgS+i2LavPi8bbmFGs/eRJtlQh6KrrXqi
         KUaGT328ww/vtA3eX7TPJ2lqPF5ZOVoEDgzNdm2Sjtk18rEGX8ic/L/GRop7t699I0Wr
         rxvrxEVniGFsNDcF5/GaJ40uZtR73RNtbjt6uCcimp2DmXw7xcp/Tt+zDfvjCI9KhnEk
         061hVzz5ubKMIfz/5Hbj4iAxuYjhsUPZVFb2oaIukcquFBnVGkh8IZzZrLfMNXqCS7Rt
         eVKoa2d7kD3X8eH2DPsyIFDuKDfaZbyWTTy84O2Qpx9ioBOz9mRpvmBdSL3+2zeI2gAT
         dBtg==
X-Forwarded-Encrypted: i=1; AKwUvByR/bY02assgWB/8vDKllKaWWaMiGlMQ7wNfvrxEf11yCGAs007RypWJ67CT4x9RZBDE8FFxRk=@lists.infradead.org
X-Gm-Message-State: AFq9FYJBz7vzNiNhM3kPJvrqZ63EIF5WsZd8EXVyVEZu2glGn7D/nv2+
	i5WBrrpcwDyDSRdwKcPB4Hy7cxVTflpEFbUN33w+tQn0ndsJ2jHi8dFUnZHa5nKLO26SCiE25H4
	PcZBkyaW3yyJsCKaqJmooj16vap2OnYLOeiHU97+q7r/X7y6HAs31QPlcTlGZF/pK
X-Gm-Gg: AYBFou3eWEjEF6dtyqHjxVMQiDuwsC0UUZHUx277W+d/tHOjN5fgRRCMS5WpxsqlmEF
	JRyBG19P/HLiiVbmwwElFfhL75V3sZOW0rPaSWEmE2ouhCY2HlyvFRhqrJbO7gFiATlyd0X2+XV
	MGktb49t/ck4cHjM6F9cf2ZeMWcciZTnpujhjV+zN//SN7xFKzmYkpPIr+5JQUr0SY4ZFewK7mK
	h9vH3B8DAycQQ9tIdbsqpzGY1lVnGr9JbOZsmY7E0xKOcbA3MpY0uI8FktZWZ4rnAoahIsYKLzh
	7SACOsitKvoHC4et8LW4f/1mavwIcdJkkGWKRG1OM833T4DeOokRCMCQ8bfiULP7lKubZom08sL
	vUbey7VFI6qnMwe4Vz+/qC7cfllZ+Kz0XiQaet7Vi6qyF0oLVV06Q3JNJVcuYufRnkoW2OPsAbz
	lPdAspuYbu2KVtNTkAbaRbnvaXxLSlF2VehA==
X-Received: by 2002:a05:6820:a65e:20b0:6fd:4277:16e8 with SMTP id 006d021491bc7-713f01edbd4mr1002293eaf.80.1793199705267;
        Wed, 28 Oct 2026 08:01:45 -0700 (PDT)
X-Received: by 2002:a05:6820:a65e:20b0:6fd:4277:16e8 with SMTP id 006d021491bc7-713f01edbd4mr1002259eaf.80.1793199704670;
        Wed, 28 Oct 2026 08:01:44 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142d317adasm1606578eaf.14.2026.10.28.08.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:01:44 -0700 (PDT)
Message-ID: <d094dc46-760d-4ee5-9404-9fa73a16a6bf@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:01:40 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] wifi: unwind failed interface setup and recovery
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ilan Peer <ilan.peer@intel.com>,
        Gregory Greenman <gregory.greenman@intel.com>,
        Deren Wu <deren.wu@mediatek.com>,
        Ming Yen Hsieh
 <mingyen.hsieh@mediatek.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261028050337.127464-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028050337.127464-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfXx+kN7Knx3WXY
 b+eA+HVuDc1lz4cscAXgSlILm0tOMkfCysu92Kz4pn3/3dYQtVALg0Tm5RqL+7KfkHbj0Vrz6G6
 KGzG9SzOn5tRBH0GpPvg9Hn85bAAKwtaJedvt+Ja2hBQs9bZYvX4LB9J9pxTxF44vZRSp3Vw8Ew
 Zvyk6Pwi6KzjvIMt3u5p09nvsWBFfAmNwW4rZJS8sS7GD+RpyIocduYEO85wwom2eAj6IKAibk3
 2erB2h7UQzrKExkbhNDCQMUsE9l6aresAx4pzJII6zoz6Etuwd1dHcRu+AMF7RlYYbUkDAJoqhU
 Wi/0ia4UAUeN/gfrhz78IpHZQtCTlf9XaB8zNwyoO2FmYSte+4wtmtaguj3Z+d7yF65G0NJO2bI
 8rmb7z5R36fagH2sLN9iCHHk0yRX6DlaBRU6vEuzCPKY6bOSFOCzc4wifNfkfTytDwXkSB3LSgD
 BEcNiZw+djXcJ3fagaA==
X-Proofpoint-GUID: pmqqNQv2NdluQHvoANOdXs0Qvk0tKeyL
X-Proofpoint-ORIG-GUID: pmqqNQv2NdluQHvoANOdXs0Qvk0tKeyL
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae20e5a cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JmONO2TMLgSK87zk2EoA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfXz5pMD2q10NyW
 RT+EYM+ZfNomoQTd8FqU72/r/GBnHbINOtgzs4Lpi1NwWXu0CKkrnsyDreWg4yaFS5uoTdc8zgN
 Dm078gqFk5/XAFa3ZUbBKSpHcbV3JhA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_080148_316094_33234955 
X-CRM114-Status: GOOD (  11.50  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 10:03 PM, Jiale Yao wrote:
> Several wireless interface setup and reset recovery paths publish host
> pointers or create firmware state before later operations which can fail.
> Their error paths either retain pointers to vifs that mac80211 will free
> or continue after firmware interface restoration has failed.
> 
> Clear the published ath10k and iwlwifi pointers on add failure. Check the
> mt7921 and mt7925 firmware restore results, remove partial state and stop
> configuring the affected interface. Each patch fixes an independent
> driver path and can be applied separately.
> 
> Jiale Yao (4):
>   wifi: ath10k: clear monitor interface after add failure
>   wifi: iwlwifi: mvm: clear P2P device pointer on add failure
>   wifi: mt76: mt7921: unwind interface restore failures
>   wifi: mt76: mt7925: unwind link restore failures
> 
>  drivers/net/wireless/ath/ath10k/mac.c         |  1 +
>  .../wireless/intel/iwlwifi/mvm/mld-mac80211.c |  5 +++-
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 16 +++++++++---
>  .../net/wireless/mediatek/mt76/mt7925/mac.c   | 26 ++++++++++++++++---
>  4 files changed, 41 insertions(+), 7 deletions(-)
> 

You are sending patches that fall into 3 different maintainer trees in one series.

It is much easier for us maintainers if you split your patches by maintainer.

/jeff


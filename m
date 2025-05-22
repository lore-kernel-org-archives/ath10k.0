Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572A6C54ED0
	for <ath10k@archiver.kernel.org>; Thu, 22 May 2025 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPXSpIv7YTXq4UKK33NocN3UXDChQ1jQOWq2fHTsrgM=; b=vC+Zt7ceK+0Bd2I+xbil+++dzq
	TbBPIvv34D7ceVOkmTTgsYqUz33GtgiU029Thpc1aB+TJ1l+/qhvQkuhf+9ZSjL1aRXoS7okYj5Tz
	1uDDAqMBZZ/04yUQ8eRgTzbCAtNmsd1ac3Xm61tIgYbhNvBJRrYYN0fgUnseImB7VDlYgs4fwKrWq
	WLm1w5cFbYH/zsXzpPxF1Rxd13luX9qLbcjE5iFXwRpvg6Vy+/J4fsXwZtQrUQ8YULuCSUC30kFFz
	avZETHpsl/Fvi/4Gd3EcayEkAfDB7nGPqn0GtB1JEKFALsLspXF9pivFOvGhNFHcSMWn6B6zrUjFz
	sOUGt1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8w9-00000001cBy-1Qb0;
	Thu, 22 May 2025 16:38:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8v2-00000001bqX-10FC
	for ath10k@lists.infradead.org;
	Thu, 22 May 2025 16:37:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFSxfi021016
	for <ath10k@lists.infradead.org>; Thu, 22 May 2025 16:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pPXSpIv7YTXq4UKK33NocN3UXDChQ1jQOWq2fHTsrgM=; b=Jvq9q66RUo67qC07
	ryS+1o8dC2/ro8o4vZhiN73oSBTg1pgKYE5kek6/SmVMrvraQFxp7GBL1IgLG7XQ
	j+eEkbGPZ/bZG365cbzzjH7SSMlMOEzVtNm/NAspuqTlyIB1DZQz5Iu5fUllbN/8
	VFDKUKCE4r7IyEONZmnVdGYZsPYtCIAuWmXmF/I1y0rVCi3s5l7rxcxBfRHdGqRF
	h6xBrEc/ZUavPEeiycaqUth3JivHIJy4S8gy6AkFYHNNMJsBMUIyUu58Nkcx6a1q
	0MC5TIhj9+UjmhPlakA7Sji9KAB+knogICidNlQDrxIxDGsQ/ldi6ZydNsymt0bJ
	4lgm5w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf077hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 22 May 2025 16:37:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7394772635dso6032673b3a.0
        for <ath10k@lists.infradead.org>; Thu, 22 May 2025 09:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747931838; x=1748536638;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPXSpIv7YTXq4UKK33NocN3UXDChQ1jQOWq2fHTsrgM=;
        b=CkwNtOpEDBCnTy/gV8ssrGZtuw3N9hSTUe8vOdVYClWQERZEo+ZVnFfkFCaVkj5usG
         yxa9LLWBfrukJ7Tw1yCx3OpVFTKpBYmFu3cRDe3zYvfl2tVVnqZ4R+5hL8dmEJxEmByz
         rKeBwkPdWoTApOd58XuShYrsJvW9qt0nMyDlfzFdGIFf3Bax1480eU5S7r+UtPUm8Gyh
         haT5cKEvT4qaIFitq5fSNbPk83dFj1DGKnb2fqeWi3PUSl1UlR5LfPqHbnaEdZSvEjDK
         Rd/KPAo74B67guBEmDx0XFx2MnZ+EFdj6c5b1cX76whOKyyD4BmcPMi8uu4njsHyjp1W
         yhuw==
X-Forwarded-Encrypted: i=1; AJvYcCWjSBsZCKAoB1DU2DTV0aBXp92qarODYjpacDcwPLQDI1BxWZNp6S0nrjk3ywBeDv2XEqYa120=@lists.infradead.org
X-Gm-Message-State: AOJu0Yydpuj9at9fqY3/75YV4LMpU+RLLLM1Ag2clyx0ID1saRgoMSHd
	X4bj+Q1KX3Tn2C3ckuUV6Pqat6f+H3nKUveeNSQMb/+jw2d1rHlQEnHchsAM8yOexj6KydpNsWd
	wTHaKg+wcrVf2ydao0bfkU2OIHEaq3sI+6Lwqjj1Xqx5fnJDIkOJh+2WJSKghhAKI
X-Gm-Gg: ASbGncsbQGFdvtWNAVzAij059xxtUeJtWAQZLHmeC3C/lGTb1LC2rFQVBRyS51CZoXP
	JRP4zlo9flywBTNnLgf2uTSEsdr4rNKoC2aKOYxGyvtZwu0toecjjNN9lH+Pd9ShzdG8broqmlG
	qAMtA06w1GBWwnSxupuCr5Kv0iBWv+Cg7OQHS5R2L31ODU8ST1naxXp7bAnC4ACJRFdNQJlrbdr
	1xjFymKNTqZSU7iqS5kUFiktMLj/Eae6rNHYJNfahLcnX3wUsgnVq5vwE2KXQTtIrgj2itFePAF
	QsFUmBJGPFovGZnmkEUjz0rIV3txzqDwWztNZUVLCxx3rN4EckHRQRW42oFZfxGRiGc6Z2EEVYK
	Ig1vz
X-Received: by 2002:a05:6a00:399e:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-742acd726demr35664310b3a.21.1747931838518;
        Thu, 22 May 2025 09:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxwkiq8zt00dFf7bFQdPSpNOeWI8h9dPVQQSNE8HY5yd7nKGEFquaXLZuaUL3ohi1T4E/g0Q==
X-Received: by 2002:a05:6a00:399e:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-742acd726demr35664260b3a.21.1747931838049;
        Thu, 22 May 2025 09:37:18 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970b6a1sm11446277b3a.40.2025.05.22.09.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:37:17 -0700 (PDT)
Message-ID: <ed75531b-b518-4543-a4c9-84726718f813@oss.qualcomm.com>
Date: Thu, 22 May 2025 09:37:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: Fix unbalanced IRQ enabling
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, jjohnson@kernel.org
Cc: kvalo@kernel.org, quic_svishnoi@quicinc.com, quic_pillair@quicinc.com,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20250522120954.605722-1-loic.poulain@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250522120954.605722-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: me2SCJagxOri88HhGHUfC7KhkB7ymV74
X-Proofpoint-ORIG-GUID: me2SCJagxOri88HhGHUfC7KhkB7ymV74
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f52bf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=B8ldSb-O8b6Fn9ZPg28A:9 a=QEXdDO2ut3YA:10 a=biA1LTKiNYMA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2OSBTYWx0ZWRfX+43f+Zy1vOx6
 rbKs5Yw6qRP8Ug0fnGuNSN7GVU+zjI0/z4P2H6U2WaS/Eh7+662p4kPOAyVFLYliWCMa71kAMJu
 5MaC/yx7ZWh+slgoSNisAZxP48XRrtUspqJh7r3KTLp6EoeMji30ISuzoSuQiNezYus2EAVuXlK
 Z4hpuF87vwd/cXJSDXjynQmjNpYYtnfAn3eqh7279P2mII1vwtsGji0NgIlP6BQ8a4JWpdm4HHw
 5LGxocFd+cdWW/0CUuq5F6He2HilB90ntUuxdmOkn8hp+wd/24ajnFFLdVCs/u+z7Va65VZQNkW
 rvE5nApO7XpH3oVpu1UxxR6awDmAWwYmd+bdAJhaL/zJrc+4FoOMrmD9pap2F1/fH+YRQ1jYcFL
 KpGA2zWya3xsD/MNuZoGHMrF84No/sE4/mgtUuAHBmRL/ln+XMWieyPSDBYc95/Lwew3/tcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=518 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_093720_306392_9A2D9953 
X-CRM114-Status: UNSURE (   7.05  )
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

There is already a fix posted for this issue:

ath10k: snoc: fix unbalanced IRQ enable in crash recovery
https://lore.kernel.org/linux-wireless/20250318205043.1043148-1-caleb.connolly@linaro.org/

Can you supply Reviewed-by/Tested-by for that?

/jeff


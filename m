Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330FFC54FB3
	for <ath10k@archiver.kernel.org>; Fri, 23 May 2025 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgFxOOp1Kvo22UysdNlp5gMubOZ8ViIW1KGQp4hqvrM=; b=FQ9xN+LKTtgTPKq3xtc4hK4aFJ
	kfJDdCPB5lh6us9efbKzaVRYjx0dxQcg/j0jQR50ZhJWgY8k59X1DDyU3Jqo3QN+p7Vw8eO/oDj1K
	1PM9cQZnU5gXGzeYlfOti+p+bCgK7y9+r79wgRkVOgrlVTHnXjl59z3aTad/3Ef4d365+rvm/eCv2
	tO+TFi+Idw4AV3YC2zUgSO2R6v+wJqDEIo1lZmIuqs3tS256kXp8cgYTvZyqTtDa+QOLh4xPEXchs
	ttjTW3O+iOZ8VzqZ3uBg1KF9gjl2q9eheFue110d67ZpPYbXqLyGu+Eh8tU+MV35erSfxaBwZ6giP
	wymi3fhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIS1p-00000003slV-02oB;
	Fri, 23 May 2025 13:01:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRq6-00000003quu-27mR
	for ath10k@lists.infradead.org;
	Fri, 23 May 2025 12:49:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N5s0OR000862
	for <ath10k@lists.infradead.org>; Fri, 23 May 2025 12:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgFxOOp1Kvo22UysdNlp5gMubOZ8ViIW1KGQp4hqvrM=; b=k+kiSQETgwbIszXQ
	P2yUuAEOPMW3pX6aNqjRdMmSkaEAgD9p/AKj3CcpuMgpoYKJTCJCq1+yZ7axe+wG
	I4hCyEv5INYqcMFk/iOTunNDFH+kvNEU8qe1v202nO89BssvvuLtHonzOrtaup94
	j9lV01CZUTzTr5GJYjP2C0+5bnHYgcZRsOrKGsgj2bFcSJ7iDgYo89VNorIoRSiO
	V2rZgV2pPxCftZrp2o9AmJHEX4bipk2xIGfrjqUpFfUIiS7303okXLGxya4PQb1D
	sDBUREeBhFMwVzY8yLBWBZbu6DxFvRt6Rkh2Sq3hJYIChPqPU+hT54YxCGEH4hUH
	psSrkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf71vw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 23 May 2025 12:49:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4768656f608so173061921cf.1
        for <ath10k@lists.infradead.org>; Fri, 23 May 2025 05:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748004568; x=1748609368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgFxOOp1Kvo22UysdNlp5gMubOZ8ViIW1KGQp4hqvrM=;
        b=Tf06vDEH6IcOpIKIXGeMxN+4seH6ghPDo9xcJO5OcBoIymWStO+S7sCtSAIGxGhPmP
         Ury6+AoFQSxYB3TKXqrWtSQ9TUmCZV81KDyYkLLCmj8tCGrYyX1b15v0/n+2/JPL+e68
         eIEZHvVe9aCcpE2M04hg75rY1jmnEnOZDcdtkf9hqoQP3CGlKpbf+lxzeseIUaoYxnPG
         8fGjZ8rHwrzUDrmt+oK+WkckdWzMXpgic86Hiw6d6489+YBY25xduhu0EpSWuS/Sconb
         n7nE4qp4x1oYzx4WU2SOm6/1bz/cCvKUet6rzZWusGvpCshP5kmZjT+S+upHehFX8ft2
         Lm5A==
X-Forwarded-Encrypted: i=1; AJvYcCUrSeXse6foBjOjm5b0gFRYG9mUv9ZfWqJ4MpCRWU8WbuwRHo0WRUCxIuoq4XYb7d2zII8tnF4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdXb3mXFsXViNtK9T1lW5im5I73FEyODb/NBKkDjTcM2CfrO4R
	WJyJZaZ1saMve99+C++rEEnrgZyojghnSI5S6LfC4bG/K2uTt0o0PxjfsJ6DxK9QHsXXcBWVNrN
	gdRkt4WOMj6/8tSfKVEcZuDnLZIv47iebqhq58dcQdROl0BHItttA7q3Ru0z6fs9aVfBuDVvGZF
	gkh7Ujrx7GQPL/p76GU6PpVttld0oLEhS/96iNuog=
X-Gm-Gg: ASbGncujXqxhodkHi0cklKGjDpTl4LcuoYs3k7Y/8yik+bqER30ly6zOStPnmRFBiGU
	RGEME4KzK+Mw/2nXKAv00P4rNSo4/wg1CenCab4thB4suoYSkXPl74BIQiJR5fqz/3CiJgA==
X-Received: by 2002:a05:622a:4a17:b0:477:e78:5a14 with SMTP id d75a77b69052e-49e1dc36fddmr40528671cf.3.1748004567755;
        Fri, 23 May 2025 05:49:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOYfVGlPcg0kq1o0aMk0VZhsCjk7+njJSLhAj6B+WSC6XoeTnWcKWXbqKcZwH95XyV+O8GF6ttYKZgbiRb4jU=
X-Received: by 2002:a05:622a:4a17:b0:477:e78:5a14 with SMTP id
 d75a77b69052e-49e1dc36fddmr40528331cf.3.1748004567438; Fri, 23 May 2025
 05:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250318205043.1043148-1-caleb.connolly@linaro.org>
In-Reply-To: <20250318205043.1043148-1-caleb.connolly@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 May 2025 14:49:15 +0200
X-Gm-Features: AX0GCFueYDukQWzrF388GReybur_0Qe2ipD7caCEPE6ktOPoIjHKF-T_UP6Rh2Q
Message-ID: <CAFEp6-3cF+Fj_f7+PqmPVy1oz0OHkpRMPQsKUTf2rhDRZrEwRg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: snoc: fix unbalanced IRQ enable in crash recovery
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@kernel.org>,
        Rakesh Pillai <quic_pillair@quicinc.com>,
        Surabhi Vishnoi <quic_svishnoi@quicinc.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: WKcxT1OKQQp61nyCdlmSVb-r79JujH5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDExMyBTYWx0ZWRfX+gN2PitjAgGL
 cEYbi4acTcIqyhzlddZGDXf2mEvYo3ArtFh9j6TYIkZukUvVZO9za7GlH+MXsrfFq8jJwcXMMoe
 HWrCQDdzYt9Fvi4YilX6ovrjDoHdpsCyJ1IVmvLetW1YyY45vDzjO7O0qm/kvmiD0eZ7LAg7BAH
 QBFarnE9dr9N3UyXAZ5a6OcUe7rfv4xusXRcNxDN34pHA8yaNiQ53AngV3j8x2qJM9q+gEGwkpY
 avp6xAbeLLoa2jGdUJC0oKDPqT5UAkJRGAfd4ALzbkBn5ukAN5omaS3nr9t/8Fciez2YAw9sTnA
 wj+V8v0SKTo/RiRdbqif2QjKivpM5ybpgn/6FF/A6aAYoaDZuVHVeN5Z8wABtOcdVqNqKf2NTbi
 u3BDUyXVZvelNGY/SP3vB9tKdaTSYxmAC6k+rQvlJMNeEqItBK1ZXB7DpYWMVTNVtB98weGS
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=68306ed8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CibMM-rouZFaIluxMbMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WKcxT1OKQQp61nyCdlmSVb-r79JujH5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=571
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_054930_676855_371A8D5B 
X-CRM114-Status: GOOD (  12.51  )
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

On Tue, Mar 18, 2025 at 8:50=E2=80=AFPM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
> In ath10k_snoc_hif_stop() we skip disabling the IRQs in the crash
> recovery flow, but we still unconditionally call enable again in
> ath10k_snoc_hif_start().
>
> We can't check the ATH10K_FLAG_CRASH_FLUSH bit since it is cleared
> before hif_start() is called, so instead check the
> ATH10K_SNOC_FLAG_RECOVERY flag and skip enabling the IRQs during crash
> recovery.
>
> This fixes unbalanced IRQ enable splats that happen after recovering from
> a crash.
>
> Fixes: 0e622f67e041 ("ath10k: add support for WCN3990 firmware crash reco=
very")
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


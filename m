Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B217CA1013
	for <ath10k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7BUL5WFGP2YT/N3fY2hMgyQNzXJsvjtuAs66ZMXNm0=; b=HDIz9ZMPZlLb705FEjF5A08tml
	Byhso3L1sx94fGDwszEswdC6NmIovI60GL4P1XEZ4wEVY/Qk2qspsGZXZ74yj2Dfx4NUTzdsxU/g0
	zXKc6E8y2UhAMDLvZQCNGtXZM5+c7j3Y+8bdzc4YNdDiMcsofboVewiWE2+YIpp746sNzkuLJP9jI
	0NxiNZNPtZvKnPFMI0Zl6gCC7b+CdJ/v4N3MEMAD76skMzHGsxsJPwxa++PqG3jv+46FtUn5bO3Oe
	uY2OpGk3e2Sh/deADLD2+aaM0hObWnuEohBAPyrisHhcNY5jg19Ibk8NvnXirxByw1GRaAeyPKm6m
	aKsFmwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLe-00000001Rtv-0yyc;
	Thu, 18 Sep 2025 23:47:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLb-00000001Rps-39Go
	for ath10k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIL1bA018234
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7BUL5WFGP2YT/N3fY2hMgyQNzXJsvjtuAs66ZMXNm0=; b=Bvjwd8I85dPXOiIu
	/gbVvDC4mNGSSCNLAzSv8Zb0yaTXCyiN++J+zuTcGN60FdO/CMbjrl77LW/5tifu
	K+K7CwSRksKKKsozWy0Va0aaRhtAaQtn1EvQmo1wehP+0WcwBAoPcBXgunjuRasq
	Cq1HQddTtZcAGvRKEhV99fb3FmPLgkillJR37dOYtKU8s9kYXg9IvoHsrs0+SDJe
	+6Zy5necO5wTiWzgHzhzzwVcuQRAoWJ2EGbPS4pMNkD8E/GkpNZrYwopKRPpeTe8
	nxqytdRq8oEEOLKiqnE+48wNuXJCMzgbyWGkxjbAe0SIXy9KRtqq+Uc+xSBoBM59
	07uLBg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwgccy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5512bffc0dso572479a12.0
        for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239250; x=1758844050;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7BUL5WFGP2YT/N3fY2hMgyQNzXJsvjtuAs66ZMXNm0=;
        b=iHn3AwPkQtyu+4gJgyR9lI3Y+WSJWgUU8HtnTr2HG8guNEharbV5Fb7IJdCXNL3VPU
         IDcq92cd9IR9OATMuxl8M/LY0u3RaJc8QROmgxH2sWAK1jFCIca56WZF6Wz9L1LiCaaa
         kkWn72/VI2bPmyoo39rLx1lGQLRrNZlaT7XGhj9hzTVYBJ2JAQ1fYf3CyCXRgV3ocPFe
         yNyYqYx0DG3CVh014yOy4TQXHIbm+wFqSW9fgq0Nbq69K0IzZLy7GOgG4zJiYc7CUIle
         kLJjqoXjWUpow3FsEeX5vfOnam0WPY+WJFQ9g7+lWSMrIfn1ksitEO2fuZ5dZhUsG3vb
         7q6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXsyoMu3mJqQQa0QhQpv+RHtZ5rTno4ZHtuZTm5JDRXgzfpYjW5HDsHGZu30vRvTy0Ceifqgo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKLQ9xy9cLgE7RwjkdEvndOO5MdXPahsA0+dh0DDk9rgiqOdYg
	+5DetygBWW1p9kIl7lSzrzC6+SlmifyncooIVrFw5wG6xxgqqe/hrl2ABEdG9GZU6tIkexZenBu
	Crdc4Td5mE+HNRwe75Qp6uQkyEM/HaGHT7J/Gtx7JPlsgwhbjuIIqTDFnafFi4t18
X-Gm-Gg: ASbGnctU0ff9wN9yg2ih5YWcEPAdjB+5HR64dKqHK1cXvLgBU0WdGo25h4KNz+go6qd
	rge/yJuP9Q4YHqwQcCTtafxdI9o2NmKLpdWhR3WLS5Uiu9mLJfxO8iFzeePTTfd+EQ7QIekJ61f
	/TEuQRccATHDTLijLbiJ+eUBg7J4UKvlKQaWtmdT+N6tq6ukB1ZBGDn13kaS3GvANCnNSlUlkcW
	Xu+YBR9P3//0MnUkOMxnHEXSHPs07xLLOaPty5WslPNYgGIEcN8i89S8Q6gPYbBzINLTCv3co8n
	B5LCLkl+TVsVmGzEAb8JevZGDN+Mn+ZRAe/wIJjDXh68m30yZ/yeJbJdVYO+sxk/H9SaYP7Mjf/
	6
X-Received: by 2002:a17:902:ccca:b0:269:9ee8:c266 with SMTP id d9443c01a7336-269ba42f618mr16652575ad.15.1758239250587;
        Thu, 18 Sep 2025 16:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6/OxCokP2hr0JAvIxfPj6tiliayLQbpd7ErGdUGe3FDYwtIAUDI8h4QWedI7XAZp9jBX0QA==
X-Received: by 2002:a17:902:ccca:b0:269:9ee8:c266 with SMTP id d9443c01a7336-269ba42f618mr16652315ad.15.1758239250124;
        Thu, 18 Sep 2025 16:47:30 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        alexey.klimov@linaro.org, johannes@sipsolutions.net
In-Reply-To: <20250902143225.837487-1-loic.poulain@oss.qualcomm.com>
References: <20250902143225.837487-1-loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH ath-current v2] wifi: ath10k: Fix connection after GTK
 rekeying
Message-Id: <175823924944.3217488.582935299158112582.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cc9a13 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7VOeSdthuVJ_qekzPdAA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1cbtWKbPQL4X
 cVTSXarWf5H4CB+2pSBhDCDhrTc0b6G2+DJxwF7ADON81juypVMpOQmVx3acR592qSPOyWh5K/e
 zj2Vo648eQqB+dENSJbCgw5DJmECedDE9zA6azgdFez/Sn8CaMJgk9yKonnTa7icxOZVFNX9uAh
 YnUXpXhc959xJ/0LOlivVofHHcietjMpctgK6wMN+M8UWD2w4CHY31/MtKVoD2fRdPIqq6ZcMsW
 js3LVIdKH71E2PWUg/9gcFp9WoDuSs/IfVqhcoSKtYONqJ8XvpzB2LI/N2CrdHp9o2z6WKsRM3H
 uoTCxh6Gjt1HAccFkSHqeprkzQ+Nk9dJ+g3SY3340AcgTe1oQ01ifcJXc7xjw514IdTp4hma6rO
 DZHPrr12
X-Proofpoint-GUID: Aunb_K4Qn-MQmJxenHJQ1jPGPfH9nNLl
X-Proofpoint-ORIG-GUID: Aunb_K4Qn-MQmJxenHJQ1jPGPfH9nNLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164731_796558_56341989 
X-CRM114-Status: GOOD (  10.09  )
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


On Tue, 02 Sep 2025 16:32:25 +0200, Loic Poulain wrote:
> It appears that not all hardware/firmware implementations support
> group key deletion correctly, which can lead to connection hangs
> and deauthentication following GTK rekeying (delete and install).
> 
> To avoid this issue, instead of attempting to delete the key using
> the special WMI_CIPHER_NONE value, we now replace the key with an
> invalid (random) value.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Fix connection after GTK rekeying
      commit: 487e8a8c3421df0af3707e54c7e069f1d89cbda7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



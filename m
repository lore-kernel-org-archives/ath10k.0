Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03053CD8CB9
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=; b=s5Q2HN83nRtiOL1kDdLYCwN/6F
	Q9q9BeCNxCxtKUQi2+I5C1TR6IV8TfVh2MFFEE9yQE93bT7qa9qb6E9DD6XCNTZv8vW89tPhqiBPb
	VTy5EgXsGKwL76iayt0XlxdwLt2UxKfUGmiFJ80dg+0lvJI64W81t/8vWBvAwvoEVd8b4MtEa6IPw
	hl/pkQZCwYAEel+PT0qEvbjtpJEFh9TNign0/wWJ1d2morHBGpPySoJvmNaVgRGKrVA0g0h8yyrLg
	V0yiHfCQCzpYcZXcxDdzZ92cGGIkzbyhYBalUknq9G766TEMFnCtV2+eAJBhPYjzLOJjxBSk+ubx/
	2bZSRCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwvD-00000005iFE-2mfW;
	Tue, 09 Jun 2026 13:55:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwvA-00000005iDa-13fx
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 13:55:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClL6X2251636
	for <ath10k@lists.infradead.org>; Tue, 9 Jun 2026 13:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=; b=psIJa4hwrjT/9RRi
	WMl+IQdnpcyeDVvI/i5tCQ18DZxeWQr8JXXopWK1ZjzLlO/wcQzcsWkOk838yIPa
	QBSVvMQKdUt/BhPJPwTIni1WewXMwj+yGTCAE+lTMS4JjyQGNCVSskgfif6OmnNh
	SuyoNtAXpfR02A4TnNXrFJAiEom9YzABCttS4NvB86pNx3sPbftTcTalcQNNcH1F
	WIbRgtPFtVjYCrKeir2EdvRPtNlIO4O8LDQDjk9LeI8B0UxFFN4dkFisdYM+4dWN
	BMTE/L6NRIfi5bsl8fD/Uc/PI8Ma5gIhUYPt3I4RQVU40iG0myViCpdWQPIOt5mk
	e8373A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqghkbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 13:55:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13815e0e6baso3346003c88.0
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781013310; x=1781618110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=;
        b=F2DbvnWk/0ghEawstCY8D0WWhGA3feN4Tui5fRbfTZUwzGpfGC92z8nB5ITbXQSouf
         d8/6FobBuBhI7J0g/ZRTjKQkk9m70HOYnmo6p05gOVGiu7REKpa7s3qiLHy7ocqookga
         pD2v4vcoQByAFVL5K1KOeKG3lGTq1+fDPERdxjPdj2iNWfrH9YP4m0t+v1yD9Mu89Mk7
         vzX6R+mvp9yKOwnV8+AvfHUpI5J7rb1ESrp5JomUAakshou6APNeib6/bmLBEddUp4of
         3G6L+goF41g7HNlorFOyD/BUAJj3IBwhmVrs4BxtoiHQBJ1Qs5g9g5uKPNsWAs4Y9fRV
         zJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013310; x=1781618110;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=;
        b=At2PTPzrK2imTbO9xbByjt3adlPjIr5uQ17rgFWJMsV3KVWuGQW3AtWpj4qviTvJ5u
         D5hgDlzIw/D5r3J61VjOQsVDoWWu6VKe/59fm7zerNJkrWnAYB1aMbB6Nn+rO2zb0e5K
         ZP99evM6GME/3ic4QD9e/o3RIh4fejDNrkbas4YliaMAYbtGgaB4MzCWAz8sSr9vV60S
         6EkQxBhA1jsd4piObQ2REDCGXapZG7Sh+P14mLipai4gjSDMuEcoyrNfmFlwUVK7tv+T
         tWUtF+ehrA52Xf0QAIPqi+LIFwymhbY1OvZAC/u7Vn2VBSYTMgNo+D3dgGPqxet41usu
         HuTg==
X-Forwarded-Encrypted: i=1; AFNElJ97NmF7QoB7A+Qc7j3C5lehClmcWLqMZmuOAoj+fwWpWsDjOaVVyajcp4YYJofwEKDbJjpFcUs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Rlm6OPln7AO86kARya1saTOPa2E3ctS/vy2SysCuKezAez13
	tMN/2Dk8YbFvWgfx5X+w1txWoTIxjjw9WjJvj0S/XkBRzQOhF9g4nnIndRzlky/E5slIYb62zgq
	irD0SaNr+fFnq4aaFRZFy2G9OPceTqsfZ16E/EUrBK/u+2Lav9Ufhr4lSPe3rKMQdpuyoGtWS
X-Gm-Gg: Acq92OHFEVXULC2wnPpwyxqrFx7qU8S5JbhnKbqreHEE8xi/7nIc4tMh/19sgiffn1a
	+04DR1fPiaVFwU398Z0DVqgRg6nDSvpqKjkXxPlZcLRT30jTTWV78NNdywpLrsf/tglv0Hiobk6
	EDNf0nqkep+HiWazkn9gF6or0Yx8MKU8WDY5zrdqYFaezv0rYUz/qLdx8IWcdhV2RtJcmBUefKo
	p3tzaXjLsE8HrLwyYeo2IJiaroXUzejNR17MHzpVWcdc05pOxIkPnplHrvIzQANFrCoP72FsYwv
	aaZerqq8AE5NomlTlZe7RdZ/MPSfINzB042VZ7vhf8I9PQ2/Q5IkYlqoBz/Af/8FBYqdciE75uk
	rVw55aOOawUHPlUa9vSVfWK0YaJtAH4RgF1P4zuHg0+KEl2jkPWoYcp4zRXsildpTpgtSwNYC5l
	hkLBdBKGWh1LY=
X-Received: by 2002:a05:7022:485:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-1380671c90amr10859160c88.28.1781013310229;
        Tue, 09 Jun 2026 06:55:10 -0700 (PDT)
X-Received: by 2002:a05:7022:485:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-1380671c90amr10859126c88.28.1781013309570;
        Tue, 09 Jun 2026 06:55:09 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54c9c12sm15289555c88.6.2026.06.09.06.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:55:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org
In-Reply-To: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/4] wifi: ath: Update copyrights
Message-Id: <178101330879.3249128.7536641999721220001.b4-ty@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 06:55:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMiBTYWx0ZWRfXwxqKtMXJHmhU
 DfEoVxCezIrBHIAPHRfUdv20rUtF91dJvGAwYuqWgsgxeTz5AQMb1qJeH/V+3GV72bjMCisEO3t
 2XSqpBsJx6aQVmIGm60+Iaj7nk0dzbDkKwR+Z/efLF2GQnaD3IJnFow9jIIDl5vHeh5OjEe3I0S
 zhPsSOeqzS/p4saOSG+pGzkbq9UWtwaknnHTqZZJJskAShvPUxd/qOukLjrnQFbqLXFMU24/OrE
 EFrp3Pko8KiNTOHz+619uQK2t6gnnOAKmLu6PurfbQhjeEDq260M9kAsR+mjtssU00DK5WXLRoK
 k0jagTwz9rWJVdp6o8h+uYG6nuDbBhFo6yTEeXl+TSp+SXopQWN3qwU6xFE43J7MzugMnLFwHep
 Ht2CxivtoGu/ne+S2IXMuA8/Yz1i5fe47lAz8bpA7LndYOOlry9Pzq4Cel267OHfw7fS/r1/9j0
 A/vGLiq9NFfygTo4mig==
X-Proofpoint-ORIG-GUID: Wkw3bYHAPlOllSvKg1Z6MKUSEpo4ahLK
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a281b3f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=p5YVH5xWJpdpfVUbqF8A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: Wkw3bYHAPlOllSvKg1Z6MKUSEpo4ahLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_065512_313597_337FFEA6 
X-CRM114-Status: UNSURE (   7.78  )
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


On Mon, 08 Jun 2026 06:21:31 -0700, Jeff Johnson wrote:
> Update the Qualcomm copyrights in the ath wireless drivers that were
> substantially contributed by Qualcomm using the current guidance from
> the legal team.
> 

Applied, thanks!

[1/4] wifi: ath12k: Update Qualcomm copyrights
      commit: 1c316d02c399e5efb1279666c078f99b3f72b0ca
[2/4] wifi: ath11k: Update Qualcomm copyrights
      commit: 053a93808d4654fae18633b01a747caa7a281aaa
[3/4] wifi: ath10k: Update Qualcomm copyrights
      commit: ae667b0f98b80146ea22830a1b53c5758ad742f1
[4/4] wifi: ath: Update copyright in testmode_i.h
      commit: 21d83c6e9e45156f4cad8c7cd6fc2d5bbc76f73e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



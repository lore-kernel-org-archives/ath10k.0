Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E48CA1013
	for <ath10k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWQsi9VmAY5hiqVKebmic+3ASrWfi4KXkGubaITn6fM=; b=mj6qksWFtmRRj90h+mGramGGG8
	0/Ut7hF7t4ADL7jVRyGlHmCc9/oQAuNy94Zmrs8bFt8rm66+fBtVHoDrJQ0yBPEbwP/dvnyAlorS/
	AeAu90CcFPGdI5FK5j0BzGq4xeExJ5oAkJLUI0t8hPMQoc/tFkH/pekApAFfbzdZAkR1h9NXRC0lD
	eCYM3zFJlJbDKpyFBTIkSWFKsUM15Dpn5msZN206A0COStqdMo7boG5ShJXo6n1geiZBhV3ABs/fA
	j8iTq0LzH4cy3YzHUanbKlLnOQbAxhIq3oKC58L52tcZDdZFhqU5P5EbsKH+TUGfriQonT72URgNF
	47Cs2fqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLb-00000001RpS-1DK9;
	Thu, 18 Sep 2025 23:47:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLY-00000001Rky-1kBc
	for ath10k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IFCbgh007410
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWQsi9VmAY5hiqVKebmic+3ASrWfi4KXkGubaITn6fM=; b=EJ01flzCwkFtMRZK
	T/RYwcGfQh7mf8XXddL0Ui0VcOZz2A6flttG5M7XQbCwjYNGmdBMK63qKLAvnowG
	AYDOSC4X8F+SnZBDp8eL1GBkozGVZqG1UzVQoe/U5YKYE0CMHYDxkSYP2mWPCife
	0lQv5Gjv7kVzbyV9gy2kxQywJd0GQu432WTzTPrMBWdTZS28FI0Y9EVbJgq3rFQL
	lL00fHz6EZuDpLilei9elg++fCHtsyykO2niHyB1kXtvkGe3oXahPU+wQiWOBHYP
	A8UC62HJEnJCthXzU5wRLl5cbKyET4MD8aE5PwbU+0T17BfzBSjWMq3OWM/19PTe
	KqdWZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebetwfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-265e92cc3aeso15654455ad.3
        for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239247; x=1758844047;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWQsi9VmAY5hiqVKebmic+3ASrWfi4KXkGubaITn6fM=;
        b=fgW2esHQ/A/mUVhWnht3WYkRo0hEQ24OVcug0++wDOCV8kKQJjdN74Ug+SNshPucDo
         KhmbRxML4sfjDjX0VdVj2fBOkGNiHyqMjEF6Ee0puEGl/5dUmxIllrWki4QKgJt9dFZv
         ND/LfITYZKRQZ2MAJ44DmkeLiYfXuMm/3ZwQfcxKGibI9jgNBfCkFIcSU9N8n20lPoBp
         X3xUEfHa0snk5YLOO0YHQm7aBFKIfGq73h/+TvC2jF3HUS7u87dIQvK6aXbcz5HunEfj
         +3x3BuH0A0Mw1bOhhVDe6SH7W5e+/AH6C/GrHpwRtPGpPpuP1WLPPZ4Ow2D+N3VWJrUO
         qd7A==
X-Forwarded-Encrypted: i=1; AJvYcCWBByZhUXtLDg870eK65xXJVRDm9BLtMqGqwQmNEEB83kQvvsmhFI/fuvaGTTlnykzi7SBx2YI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4qKsgjTQHg/9Ofn1vcQ8MKnG7A70UO64m3U43MdPedPeF0kKA
	GSFb6c/kQHeLPtSSPUmpKqIHpCA/vWquH7+g5LaONjqRgd7RiXomxhhYU9hPHVGbLj8pm1IpnuM
	O/NVZTM+qF3PbuM/dBMzgqHTcN1ePQW+pFCywid6NhwaSAhsNp5rdvYBHucw3vhs0pnDPGai4
X-Gm-Gg: ASbGncsqV5j5dMCsDWwsrKsa0YF3xgLCSZdLvyN1INxgYem4T5KHbDJdMe8yVWGtJ5I
	XBwit2kBiYQjA7Ncah/dy7oUxXEbptY6A/fmGy9NHtaAr0FV0U2vv0FqrTbYvnnhfbISy7Ncume
	zHeQxyN97RzH9XNw0suZlrQ3EtV84r6pLBE7HfsmvFBS3X5NNkDNKBrzgzo1yY2S6fFggAqwZwT
	pTG6DTHoDLgCOyBtLDFcK+ayS/KmfSTyJjX6z7/NtLnnGrp3Qp+NCoLskh7DzmzxyTBF2+QocTu
	hHPK/4Q1ooidoVCVC7zxxUedfWXXE7Jo7as5QIVfzAobiI7bwP9qxaa/1ks1UgOyy7ocx2lqClN
	k
X-Received: by 2002:a17:902:ccc9:b0:267:b2fc:8a2 with SMTP id d9443c01a7336-269ba46f141mr18837365ad.23.1758239246984;
        Thu, 18 Sep 2025 16:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGUIIqhflA5H84k2bWq7ZhzyXkWqR8j08pCl2uE7f7Dhq9Ex2ocDiHIw+vHMRY0ZZmX+EKrQ==
X-Received: by 2002:a17:902:ccc9:b0:267:b2fc:8a2 with SMTP id d9443c01a7336-269ba46f141mr18837115ad.23.1758239246537;
        Thu, 18 Sep 2025 16:47:26 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250808151822.536879-17-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-17-arnd@kernel.org>
Subject: Re: [PATCH 16/21] ath10k: remove gpio number assignment
Message-Id: <175823924545.3217488.14660135878915431565.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:25 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: GB427pp10NPth6pJ3j6vm4yGR1L5QYNv
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cc9a10 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0JjSHZ6I5lEitlysoQ8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GB427pp10NPth6pJ3j6vm4yGR1L5QYNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX0LFX0+qHPNZJ
 DhlkhwAMu+IueJWLYeCzmK0EC4nHzP0PxV8qVJCFDSljqPCEgtEWc9UUZ5YMA2a5czLas5tP3uy
 0NW1uZmUwNfPvl/We9HADBiya1pLlEejj4RunEGrJ4DHBNFlp9mPpEKTxpmemnQ/hPEWlkwIJ+p
 3Ftg533kToP8pT8y5bwzBOSWwtzOwAWmDdebes+wYliFYOW834ZGIt/oDsCKWBQkRoeIuoMqYu/
 AoXXAhK5/puO0k+4dpFrjSqxFTJdvIByUjZiWbCP/+894cHUfiocVwte/kRdingXsgNw/d/TYCY
 ohM11umrJwkXUS5goP1OMK1ZQoaDQl+V7R1d9IM6Vx0bAvD21XEHzPvXzCIoA2iEUFR6djhtxYJ
 BzyIe/8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164728_466686_581EB1B1 
X-CRM114-Status: GOOD (  12.98  )
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


On Fri, 08 Aug 2025 17:18:00 +0200, Arnd Bergmann wrote:
> The leds-gpio traditionally takes a global gpio number in its platform
> data, but the number assigned here is not actually such a number but
> only meant to be used internally to this driver.
> 
> As part of the kernel-wide cleanup of the old gpiolib interfaces, the
> 'gpio' number field is going away, so to keep ath10k building, move
> the assignment into a private structure instead.
> 
> [...]

Applied, thanks!

[16/21] ath10k: remove gpio number assignment
        commit: 5b345471752701ccfcfa6e86e15d2cebc6e17343

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



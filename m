Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55546C55ABF
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 08:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IO5BjtLwolVVWGPuthMC0L545oHTgrgv0T514NGc5jM=; b=LcNLcRBzG7Nccw1VRA19BfdTLZ
	NGW35Yhok9GYR1GGG5uTk9YicnxqyFrDhiIvSwfiyASPSCGP5BxC7LvCcxeTz7VA+mLBHaL9lqKMN
	Bn1+dlrmsGYpk4XHyoXVJTCijJPR+AG66vS/Dr3Z6tAHj6G2adEVbmnve84v7JVrGNN0lOjzInq29
	F0f0l+afqak5iH/DXG8C3ASesIHbyDLZ8JCoqPzgvUCINaZsdX93/J8w7+MjOC68WfY/gsiYFNmKj
	2mG4bBgiXJiv59tsxUF8LPc2vHzc0nsJdVhgbkohX7u6SawZrSwvSqmY8Hf6e+5SDsyWO4z0pY9JZ
	0Z5fXPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtZo-00000005FkR-3GmC;
	Thu, 06 Aug 2026 08:35:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtZm-00000005Fjs-0GCw
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 08:35:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767f2dW4063409
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 08:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IO5BjtLwolVVWGPuthMC0L545oHTgrgv0T514NGc5jM=; b=knNYuJzwMETlbVQq
	5tzrVBeRTrcQ7s791gy3Mm03rctd8+8OWYzsTd7anzKam5atqAbaN9X99a0RFh5X
	UyTgUQCJEvyziraHMOdDe8ZMGDUEtwHj0rdfl5936m1cPmiu6V+dNw1nBdmVL6Nl
	APzUNDDfo5sbWl7sTMGTOPNQ6a+u5iGduvLbhdVN/AmzuzWoVx3h+omU3C6OiNxx
	3gUqZ43gke7QWYZaQhsHf/ZJkVMvbBIemgyZ5nG+hMUgjOx45msQYUIevxr3PYa7
	W/kCCULdfo2ccMRkiRgt9vVpYa6yx0WuMbxSOWzu8pjjQm5HdLWaXobCmosw62qK
	1KW60w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5mf2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 08:35:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so70070585a.1
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 01:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786005340; cv=none;
        d=google.com; s=arc-20260327;
        b=YU2c58oAPP8xGTqN+eqh5i9HakNIDw3z6N7NWcOs9DnySiIyvXtLu5n4mVxfM5T7A3
         sPZnVklr31p8imwUQvVt2TBmstUDUXvXgxAaBzz5Zegwy6IWZ3X1ZzPzPBLdDsKkS7E5
         KaMmRMD5/hYwpxnAe73GRK2Jq74JT2n+qhAIbjq13mCM0mXPSCX/vJk3Nf9YEAMIfxE0
         6iCTrdOhzN2y46Le1psacZoipKL11GPRPd6TKsunVsptHKMtQivAM5pEC8MiKFXGSF5K
         vwVKcxILmObxIQk/3vvYnHxFYKGokGgSWBJgom9WPy+Y3/ulzHHul9hn7VugUfJ/cU//
         2I5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IO5BjtLwolVVWGPuthMC0L545oHTgrgv0T514NGc5jM=;
        fh=k7PAmdrN2Ykv6HTwkFRqPMI8QKWUCAHVysSJLS3swxc=;
        b=lrx5tD4VU2+z89NbEiQKwDhxutab83mQg/9k2D28gF2C7Kmj2yfB8wxPLKro8QvJqy
         uNOC4S+T8dlTaK2iPIiaX1+5BdwBKrUT9ussQx2vpDM58UisuFC97nX8utDLf5Kbp2x1
         tlxr09O6eXQH43aaiW3ReJ/yoAujry3NFDXtJL6fNe8BnX5cSYkUjmMare3LX/PLC+0t
         nfvb9zjpeS2EXKEVKT0xaAbuJy5ZsRvAQxct6PaFpAsGrVIzORzEgC6D5TzqY8UwYHBG
         EW8km+6bLvEdC9ZnRV9BmF6LJCvZCdPDgPwJwC3lKLnHqxFWYe9v91G1byiRFglB0fbT
         2XwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786005340; x=1786610140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IO5BjtLwolVVWGPuthMC0L545oHTgrgv0T514NGc5jM=;
        b=a1O1z2VRvSSL+Zv/2AxU2o8iDoIXqf4AxgMlWfeKQ/zU6h+iFsxILexh2gjvnoUTut
         GVpUHM8cZVKe/oZHYvZCGFb0z6Eg38xVrPYL8dYCg7uqOuhicZuwHWUy5AOrFO+V4xaf
         YKlqAxu4B9lEOIxDMXZK+hLDtJZp7Oi4GP54S1vZCxx2Z6hKlpwmFC3tR7soNpA/S4Ny
         5+35J6NztOWYV6TCaduay7qNgX7M/AkxRixDo4/vWvIT9D/UXEu6f1XRWnAsjNehhsrk
         SvGsOpgOE+n8B3CdhCzv19C3rIal5E5hiXgX/JjQOURO1Ip+UcbHih5fbwUOo3L2/EUw
         Lh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786005340; x=1786610140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IO5BjtLwolVVWGPuthMC0L545oHTgrgv0T514NGc5jM=;
        b=IHRcvcYm8eaBu1CHSowwaoxlIlRKN67Lm00UXlY/lfBoLwFWySj/TQak3e9agv2K5C
         YFj6PcJhD7/oadwNl1FPbCnWwMyaEAx75U2SkppLtI7L8QTz0bKXYuabvyM9WroC3lvn
         Wx+O2UWJ+DNezZ9oh8KJ+5LNlw2ykEkSOCB2LPBDQi9p90ewokXMngaTAjWNJGAUrpzv
         rZmTnbV6kYqTo7SskgEXIlgU2u83N+oCz0A8aLpI47Hq+zxI3M8rWBMvfq3AkKmbIegE
         41cfe8bBwlJclZXYRdOexk6fInID227Dm3a0IAaD9ZNOtUjZ0+wU4nBma1nS4lDmnLd8
         bnpA==
X-Forwarded-Encrypted: i=1; AHgh+Ro29LQqp2b3xGWB64G7K9Z3eu/b44mzS1XXL2y+Ln1kgQo+tIpKPfkA+HF7UBpsZrJ+D73odxk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhzt5g94E2BC4QW6G8LKvtPfJuUfyA/A6Zo4d3TB916AKLDlj4
	hzFKc7v7Dxii1Ysd+Ez+F8nlfDbLmnS4c/gWJW6BBbv1iedEUfoDuVa6Knt54ZSWbVAgsM/lm6t
	sruck1mgjK8fwkA1T7dHOFzo5Nsbp7J9WSj7JFqS47seowrU9zwC0Z9WGGm9DEln5m47kTlHJko
	ypcwGwyU2l/mukRSkP/wsI14BGB19LvWbxBzkSFLU=
X-Gm-Gg: AR+sD110aVEiTjpC51g4YUL9hP64VQIyHt76RUiRkODCbJeGqcFhw+9XaA4Eh/w9qJz
	+gXcZLg65XFgDVF8W5fI4k4zoED1VGIKPpac7o5OhftLNCxKGGmFeW0bzanKGMVH+mRA/lEKgMa
	9iKfjkod0YWy/DeE90Bgxm41tC3qy9t4TzUyPB8MpCLxnLNTFsRKTvXV8kOVM5r4I2largVZiW+
	WVdxRPiHeeJA6f/z3KAINAxGNk/5iqs2D8PI091h+4hf332rbrMuKcSX8nC1xcjOmzIgNW7Imo=
X-Received: by 2002:a05:620a:2715:b0:92e:eed7:91a9 with SMTP id af79cd13be357-9365de921b1mr229153485a.7.1786005340153;
        Thu, 06 Aug 2026 01:35:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2715:b0:92e:eed7:91a9 with SMTP id
 af79cd13be357-9365de921b1mr229147485a.7.1786005339701; Thu, 06 Aug 2026
 01:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
 <20260730-block-as-nvmem-v9-6-f72935817dbf@oss.qualcomm.com> <anIU7FSBT6VMzsf3@infradead.org>
In-Reply-To: <anIU7FSBT6VMzsf3@infradead.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 10:35:27 +0200
X-Gm-Features: AUfX_mymqcS50Qq-y2dDzlxCgZvzowjJtigqHjeUXKY3p0hh0LvfQj0GIbG90FQ
Message-ID: <CAFEp6-2kOsFcvBYk9Ow-ua7KAzdRgPD4Ky009O0Hgm-MXhJAMA@mail.gmail.com>
Subject: Re: [PATCH v9 06/10] block: implement NVMEM provider
To: Christoph Hellwig <hch@infradead.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2NSBTYWx0ZWRfX76KX+82iAIpP
 iEgXVZnWxIc9QCkPKrlqRZCktHfL7RHzHHOR/ET1e3kGs/PV/UqiywFMtW9t26lYSNISyY2fF6r
 vcm5qPppxZxxPaIwB9JNBufw7QpirRsuDFh9HtTUJaUGL0WilXBn6JydlSoC0yYS1gG13n/qsaa
 upvGCI5jG2LgtLkx26A6Z8PLYmxLKa0dC4kIDNKoC/shNGkJM6qqUehgre5TrzmeiPPiJ2FUY5w
 BpPSqAKMfFdsfbedKjsFP49Uoel3iyjAl8tA9C9W6kovBN3D9pIHu8JbWs9WZRY91enGXrxD6ep
 M6JbYLEPTSWMdYNUqt9xJp0c9Iko56HF3H57ie81XrZosJsyZxv2H+1hWZiAWxDJ4qpJocHTqUQ
 eCmCfRkkkEfd/fHe/HuaomzYAOqnrafUnDAD25wrv31nzi+kZIwawuSm8KM86jBveM/vaiA7zaV
 ua0mg3AxRd3ar1jBI7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2NSBTYWx0ZWRfXxmmZ5I1aRu4x
 9pEOBSzGdZWCRzOEdnh3sK3aw+BFQ/RFU3Nz42Krf+B+UWZShMVdVPzjTaznM1O/AMCTzPuB9Vd
 C8HIM9Ug35XXR7QP9u3ZpK31MJK7PsY=
X-Proofpoint-GUID: hxpxMTOSDbmquNDvcbaIf1GAd8u66Pgo
X-Authority-Analysis: v=2.4 cv=cIbQdFeN c=1 sm=1 tr=0 ts=6a74475d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=VT4XjZGOAAAA:8
 a=nTbZda4seY50gyMA9OkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: hxpxMTOSDbmquNDvcbaIf1GAd8u66Pgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_013542_109294_61BFFE63 
X-CRM114-Status: GOOD (  42.22  )
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

Hi Christoph,

On Tue, Aug 4, 2026 at 6:35=E2=80=AFPM Christoph Hellwig <hch@infradead.org=
> wrote:
>
> On Thu, Jul 30, 2026 at 06:00:36PM +0200, Loic Poulain wrote:
> > On embedded devices using an eMMC it is common that one or more partiti=
ons
> > on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPRO=
M
> > data. Allow referencing the partition in device tree for the kernel and
> > Wi-Fi drivers accessing it via the NVMEM layer.
> >
> > NVMEM is registered for a block device whose OF node describes an NVMEM
> > layout, either via an "nvmem-layout" child or by being a "fixed-layout"
> > node itself (e.g. an eMMC boot partition associated through its mmc-car=
d
> > node).
> >
> > The NVMEM device is a read-only side channel: the block device stays
> > fully usable, reads are performed with a non-exclusive BLK_OPEN_READ
> > open, and no synchronization is done against concurrent writes to the
> > same region. This is acceptable for the intended use case of write-once=
,
> > factory-provisioned data.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > ---
> >  block/Kconfig             |  11 +++++
> >  block/Makefile            |   1 +
> >  block/blk-nvmem.c         | 104 ++++++++++++++++++++++++++++++++++++++=
++++++++
> >  block/blk.h               |   8 ++++
> >  block/genhd.c             |   4 ++
> >  block/partitions/core.c   |   5 +++
> >  include/linux/blk_types.h |   4 ++
> >  7 files changed, 137 insertions(+)
> >
> > diff --git a/block/Kconfig b/block/Kconfig
> > index 70e4a66d941ff66ecb0ec34f4f7eff7fd1e4be40..4899ad572c71ffdbb62460d=
57623216254893ddc 100644
> > --- a/block/Kconfig
> > +++ b/block/Kconfig
> > @@ -209,6 +209,17 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
> >         by falling back to the kernel crypto API when inline
> >         encryption hardware is not present.
> >
> > +config BLK_NVMEM
> > +     bool "Block device NVMEM provider"
> > +     depends on OF
> > +     depends on NVMEM
> > +     help
> > +       Allow block devices (or partitions) to act as NVMEM providers,
> > +       exposing factory-provisioned data such as MAC addresses or Wi-F=
i
> > +       calibration blobs to the drivers that consume them. This is
> > +       typically used on embedded devices where such data is stored in=
 a
> > +       dedicated area of an eMMC, instead of a separate EEPROM or OTP.
> > +
> >  source "block/partitions/Kconfig"
> >
> >  config BLK_PM
> > diff --git a/block/Makefile b/block/Makefile
> > index e7bd320e3d6971a8abf584f5de42776bb54e8216..8200297fbcbab304beb4239=
d0c33da07011c3ed9 100644
> > --- a/block/Makefile
> > +++ b/block/Makefile
> > @@ -39,3 +39,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION) +=3D blk-crypto.o=
 blk-crypto-profile.o \
> >                                          blk-crypto-sysfs.o
> >  obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) +=3D blk-crypto-fallback.=
o
> >  obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)        +=3D holder.o
> > +obj-$(CONFIG_BLK_NVMEM)                +=3D blk-nvmem.o
> > diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..05bc35b9b8f373ccb606bdc=
a35d211c41d2764fe
> > --- /dev/null
> > +++ b/block/blk-nvmem.c
> > @@ -0,0 +1,104 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * block device NVMEM provider
> > + *
> > + * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * Useful on devices using a whole disk or a partition (e.g. an eMMC b=
oot
> > + * partition) to store MAC addresses, Bluetooth addresses or Wi-Fi
> > + * calibration EEPROM data.
> > + *
> > + * The NVMEM device is a side channel onto a block device that stays f=
ully
> > + * usable. This is somewhat mitigated by opening the device exclusivel=
y.
> > + */
> > +
> > +#include <linux/cleanup.h>
> > +#include <linux/device.h>
> > +#include <linux/file.h>
> > +#include <linux/fs.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/of.h>
> > +#include <linux/property.h>
> > +
> > +#include "blk.h"
> > +
> > +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> > +                           void *val, size_t bytes)
> > +{
> > +     struct block_device *bdev =3D priv;
> > +     struct file *bdev_file;
> > +     loff_t pos =3D from;
> > +     ssize_t ret;
> > +
> > +     /* open and prevent other exclusive openers */
> > +     bdev_file =3D bdev_file_open_by_dev(bdev->bd_dev,
> > +                                       BLK_OPEN_READ | BLK_OPEN_EXCL,
> > +                                       blk_nvmem_reg_read, NULL);
> > +     if (IS_ERR(bdev_file))
> > +             return PTR_ERR(bdev_file);
> > +
> > +     ret =3D kernel_read(bdev_file, val, bytes, &pos);
> > +     if (ret >=3D 0 && ret !=3D bytes)
> > +             ret =3D -EIO;
> > +
> > +     fput(bdev_file);
> > +
> > +     return ret < 0 ? ret : 0;
>
> The error handling here is a bit weird as you seem to handle the
> positive/negative values twice.  What about something like this instead?
>
>         bdev_file =3D bdev_file_open_by_dev(bdev->bd_dev,
>                                           BLK_OPEN_READ | BLK_OPEN_EXCL,
>                                           blk_nvmem_reg_read, NULL);
>         if (IS_ERR(bdev_file))
>                 return PTR_ERR(bdev_file);
>         ret =3D kernel_read(bdev_file, val, bytes, &pos);
>         fput(bdev_file);
>
>         if (ret < 0)
>                 return ret;
>         if (ret !=3D bytes)
>                 return -EIO;
>         return 0;
>
> ?

Yes, that actually makes things clearer

>
> > +     struct device_node *child __free(device_node) =3D
> > +                     of_get_child_by_name(np, "nvmem-layout");
>
> Please avoid the __cleanups stuff as it doesn't interact well with
> the goto basd cleanups usually used in block drivers.

Ack, will remove.

>
> > +     config.id =3D NVMEM_DEVID_NONE;
> > +     config.dev =3D dev;
> > +     config.name =3D dev_name(dev);
> > +     config.owner =3D THIS_MODULE;
> > +     config.priv =3D bdev;
> > +     config.reg_read =3D blk_nvmem_reg_read;
> > +     config.size =3D bdev_nr_bytes(bdev);
> > +     config.word_size =3D 1;
> > +     config.stride =3D 1;
> > +     config.read_only =3D true;
> > +     config.root_only =3D true;
> > +     config.ignore_wp =3D true;
> > +     config.of_node =3D np;
>
> Maybe initialize all the static information at declaration time
> here?

Ok.

>
> > +     bdev->bd_nvmem =3D nvmem;
>
> What guards access to this pointer?

bd_nvmem is only ever assigned in blk_nvmem_add() and cleared in
blk_nvmem_del(), and those are only called from the block device
add/remove lifecycle, So registration and unregistration of the NVMEM
device are serialized against each other by the same lock that
serializes partition/disk creation and teardown, there is no window
where blk_nvmem_add() and blk_nvmem_del() can race on the same bdev.

Additionally, recent fixes in the nvmem framework have made it robust
against concurrent access (for example, consumer reads) during or
after nvmem unregistration.

Thanks,
Loic


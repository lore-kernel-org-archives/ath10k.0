Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42531CD8C9D
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 13:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xsUP1loZg3jYdsBk6X4zW9T5zMq3W/iPnEHzKVjyxY=; b=sN12nQuguIGpbKqJznPaF95xAg
	GC1eizVigoMNFTpiITrMOeQQLdf0fd/ibs9VxDmT2CaeEn+uiV8a6pXj1uHKdYwE/dPfLl085zYFq
	FWGnlVjB4SlYU9Sugnr7AcDUCkvoFbbVSYsWwbRc9e8gUrGyaVIN8c8eMKPdISbR/ScqIevfC1XY+
	r085y6K/IUoM1YZjZy1tjpxgDky2ZDzMtN1xTPKqfwHQ3blvdXs/AaGce/zMRR+857MmRLXfWBge9
	Tf1HrJiK8I483vKNWYt6log5sAsQS0hnkxFgxGjq2XCnvanuhLJzHjCpqll50Ynubi3A8wq7N+f4j
	hokkTTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZce-00000003Yx2-2qLH;
	Mon, 08 Jun 2026 13:02:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZcb-00000003Ywb-1WPk
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 13:02:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9Stw3029594
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 13:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1xsUP1loZg3jYdsBk6X4zW9T5zMq3W/iPnEHzKVjyxY=; b=j+rUH7yNKShbdNZr
	MqPeI10vwdoPUpfzUXM9yE67URwfG9f0JDVVLUsjGLRvD/v/a5wWvZlAOk53MIGY
	LjIAmHuiq0Y7nQzBPMV/sLmmLpmTz4Z2Fhhe/9VKFllEevVNCvaKfs8Deh5mgVbP
	XZUGYjS4x+joNYUOgYpqmjey1ARbnX7M9WqpEK2EfdQcRxxz5b4N181GIbqfv7uu
	AHI36YCPoIxY5nEoCxDPPjX9+bOXKPxuxWB9fJL6ElDeMVwZj8kFrxTqi+vtPS6B
	0U4A2fZclkQlc0vqe0jegAp6NKsUhWozFi7CmVerYMI7Q+oOXk65aSmTgo/iXTPD
	nmpo6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun40q8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 13:02:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9159bc52211so145661285a.2
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 06:02:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780923747; cv=none;
        d=google.com; s=arc-20240605;
        b=Ie38Q9jnnd120ZFS6sfpG5Tn/gIYcANPhKsjsXGOnsnKe9XAWe+XPxMrYN5gUg76/v
         L7DPi1jeLuxgMtcaUt+neLJLQ1b1PZBSguKCxl6R9BNLTBXz7NyJs1xcIE1MwiKeInj3
         yBikevnL2HIINPPaTqukeDWgprZsu92sCbTS1sktoaBVQJ30LQK11QX7onlPCE3hgw9T
         rfvu9usvGwwGIcuaTJv6rp6vOpM0ih3dDsNfuOQ4cEdd6ftMx156N99ymBttV+MTmmke
         aZBOYX8BzAKgSH4AYUEAIMbFOYPmm2Uu6kVb34ssdceGcUBHENX7+qZFje5ZeZYEV75B
         IFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1xsUP1loZg3jYdsBk6X4zW9T5zMq3W/iPnEHzKVjyxY=;
        fh=Etk3KBXes3tb3DU4hHXUA20OviXGURoftDh0acQvrds=;
        b=An0I3i0ygq9G1u+sqs9vCSK+tFfu0zrK9KiPgyugHRJXCD9pu1XgvGFbz0TRFf7et+
         SEyXuR0npiffLOgNVPlqlNVauGjEgW40R1eQRbAqfZhUQnhhf9IWfI7vdO3iA1MDimsx
         N2msEOxt33aEdHR6A95U/NRkCE5Eptlqha7i8+fzdYeuFYaL9Bteu4ZPL5R1RKX++fFd
         erorN/nmDTIuecYBp1FrUhjU7yxsxz6hbmKqMEyQIdH/I0tcTUtQCkbb8F1vJRp/G8Xk
         /qHL/LuenGYf3nFRY3yTWcS5+1YakDs2vUbzYjpP+JD1vYYl0RGebMOkj+mGm1kbqN65
         LaGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780923747; x=1781528547; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xsUP1loZg3jYdsBk6X4zW9T5zMq3W/iPnEHzKVjyxY=;
        b=fbL7kjSFwcuNlqktErVJlSwyQ7ncBFlD9pWmWnkZSQvZcP0z1+U4cwQ+BNrv+TXgFR
         O99VKrBm/RX3mtK4awidavAQMF6FJCGCKC6msQWe00PqnF3RXdW8fwng5kbThpiacFOy
         l6rkQct+vs4ehL4pGQQ1WFR+yjVuq31/BI1QvKHuasX0nhdKoVkuRL8o6mWcmp3MM8lY
         k6IZ88oDozHXRjmpp/+SA/XCC/Vobt6GYpZRymN39y3gj2t32fKDQSKFIuA8FWxV4zcy
         4b95Y/lgc4ifX+dGG16ygNRB83mB7idDjoO8RAZC6w9udBcwFeUHKE/tD425Onngo5nK
         p0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923747; x=1781528547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1xsUP1loZg3jYdsBk6X4zW9T5zMq3W/iPnEHzKVjyxY=;
        b=eY6NCQqBZIrHWAMZFojdREO1NEmSgM//JcO/yRxf6V5+bnHXpnm2jow0AkuMrE6ZoB
         eKgAU5v7n1PpDuljrOjyOxXy/4fw5+HtXPm8wXAqpJmbbleQu9zcFbSv7uYi/FZV20A7
         jR6hdhRyHGPMjQyeDlbqFM66uddrsedni/3ZQjd7m9XrcP/Ojhx9AARnc1Kl5cZbEES/
         mO+S96r8sWF1XbK1soxVIf0smLI9xhS3IpTGfF90FFmwEW2iB+9cHrTS0pvHOnXWhfPh
         3nGzwvmOz92p7geaeZZhUy17MC3vtrricUGWtqp8gycVmK7PsVe2UvzEdwZc0FHPyEku
         sN3g==
X-Forwarded-Encrypted: i=1; AFNElJ/vMwQ+ReiU45VN2TyY+FmFN3Fi5Mahl2Wcjbxk8lX1uE12fCX6TRpV6nvmcQf8RuWUMxffwjI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuBFb5l2I2j1XkmFZMcHQoxHI63yDU6u5q3dr/K6FKKnEXQxSt
	6XoMY/qt8YrOqFoWh9yweiIrL75uWbghDVIn4dG/WZT23XNVVadTMgYDvta6pFC2FpM4NGeohR5
	Opv3DeKGhgDz+nfezbdxPdwcHzo+AI1YW/+1m/ikiKTemCano/KjQldnGPMWBnC27UcoVaaIHfx
	S2NDeH5Gfq6bmaUKIcbhzV+9fa/R+aA8u1WM9NNMk=
X-Gm-Gg: Acq92OFrkwbORoMN2CPSqiTrviwFBPzwNfZKF23G23Yk9bEewxhZPtfe8j03CEjLO43
	115XySFXySrrDAHEFof4QgpCWga1lSx4/ADLRRgaSrkiojdLgjYtgAWpgLfnkrDl0yeGdFrdnrG
	NRKNAPrD5J0fQ88nWfqR9sE6+N1MRxGFNprbB6Vm73RjOixjNJnT+I5j23fssDy2xd1rXWPINzD
	kahcYz4P3bNL5qjfYi+VhlfuGOJdOtHLDT49dDwn+hiqxXfCs/8x9FAgWjAVa8yr8ADrzjvecJD
	SwYNjcZL/peMyjaXbLCAszTc8xVZ911c
X-Received: by 2002:a05:620a:454b:b0:915:2404:bfe9 with SMTP id af79cd13be357-915a9c35852mr2536194585a.9.1780923724670;
        Mon, 08 Jun 2026 06:02:04 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:915:2404:bfe9 with SMTP id
 af79cd13be357-915a9c35852mr2535551485a.9.1780923662522; Mon, 08 Jun 2026
 06:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
 <20260608-block-as-nvmem-v3-4-82681f50aa35@oss.qualcomm.com> <CAMRc=McmoWvezeH05_5AR7ZbAyg1L567HsKWbuD7711LwnjV0Q@mail.gmail.com>
In-Reply-To: <CAMRc=McmoWvezeH05_5AR7ZbAyg1L567HsKWbuD7711LwnjV0Q@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 15:00:51 +0200
X-Gm-Features: AVVi8Cc-wgzw5gsLbwZHUHPYEgpxejd9uRTmITt11-0eb6tOd2NzMwDpPGAFaCc
Message-ID: <CAFEp6-0JaOd8PpqMY_21BEDyDyYx1kDfskOS4VSd8nxP4KBXZw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] block: implement NVMEM provider
To: Bartosz Golaszewski <brgl@kernel.org>, daniel@makrotopia.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
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
        Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyMyBTYWx0ZWRfX4oP2f5NEvgVV
 vuI+rrFbPcmUuqISZL8hJoArJhdGp0PBDHJ4HXXUYyv2/FNTzpe84vlPSkFEOTWsTlqLJS09hmo
 b0TVCZtXkvQQu8mUNlNXEIxnFmBD9JYq+MBlhTZg+sOcsrhqj525nrouYjiOHTZGSYnBgZGdUJb
 i9Yl6UIX9b1kfhwdsVH3/c5/xRANwitlSo3tvi2c5lXQEGQv4cTDjCy2aLqCUj6a+huwUKOKXAe
 b8o2VZ1UQDiKXCDTR6p3HTwOYVYZ4RmrDAvwUGhmOVMP6f0GqMFwcsROhZpi1IUFlh6Im2kTM2A
 efvnTE125PI68uBkTFLS+EiMQ7SjIg4pLidB6k83wzTdsLLC7WrOtR/wsmK0BKX98b5D/SmNrBx
 xFTZm2tD5bwsyQosHdTdpQuDPTAaMOftMOQnabslUu1HDoMZ3pepCKMl7FBDd5nLrOj3Q/FTbo0
 bQVnSrAIlR328IjBojg==
X-Proofpoint-ORIG-GUID: 3KRnUOXuTlD3WVPvkrR-FD7UptHZsrsg
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26bd64 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VT4XjZGOAAAA:8
 a=IjnKPMcg25KrRLxKrC4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: 3KRnUOXuTlD3WVPvkrR-FD7UptHZsrsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_060229_412364_A4A6FBE1 
X-CRM114-Status: GOOD (  39.23  )
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

On Mon, Jun 8, 2026 at 1:17=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Mon, 8 Jun 2026 12:50:41 +0200, Loic Poulain
> <loic.poulain@oss.qualcomm.com> said:
> > From: Daniel Golle <daniel@makrotopia.org>
> >
> > On embedded devices using an eMMC it is common that one or more partiti=
ons
> > on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPRO=
M
> > data. Allow referencing the partition in device tree for the kernel and
> > Wi-Fi drivers accessing it via the NVMEM layer.
> >
> > To safely defer the freeing of the provider private data until all
> > consumers have released their cells, a nvmem_dev() accessor is added to
> > the NVMEM core to expose the struct device embedded in struct nvmem_dev=
ice.
> > This allows registering a devm action on the nvmem device itself, ensur=
ing
> > the private data outlives any active cell references.
> >
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  block/Kconfig                  |   9 +++
> >  block/Makefile                 |   1 +
> >  block/blk-nvmem.c              | 171 +++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/nvmem/core.c           |  13 ++++
> >  include/linux/nvmem-consumer.h |   6 ++
> >  5 files changed, 200 insertions(+)
> >
> > diff --git a/block/Kconfig b/block/Kconfig
> > index 15027963472d7b40e27b9097a5993c457b5b3054..0b33747e16dc33473683706=
f75c92bdf8b648f7c 100644
> > --- a/block/Kconfig
> > +++ b/block/Kconfig
> > @@ -209,6 +209,15 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
> >         by falling back to the kernel crypto API when inline
> >         encryption hardware is not present.
> >
> > +config BLK_NVMEM
> > +     bool "Block device NVMEM provider"
> > +     depends on OF
> > +     depends on NVMEM
> > +     help
> > +       Allow block devices (or partitions) to act as NVMEM providers,
> > +       typically used with eMMC to store MAC addresses or Wi-Fi
> > +       calibration data on embedded devices.
> > +
> >  source "block/partitions/Kconfig"
> >
> >  config BLK_PM
> > diff --git a/block/Makefile b/block/Makefile
> > index 7dce2e44276c4274c11a0a61121c83d9c43d6e0c..d7ac389e71902bc091a8800=
ea266190a43b3e63d 100644
> > --- a/block/Makefile
> > +++ b/block/Makefile
> > @@ -36,3 +36,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION) +=3D blk-crypto.o=
 blk-crypto-profile.o \
> >                                          blk-crypto-sysfs.o
> >  obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) +=3D blk-crypto-fallback.=
o
> >  obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)        +=3D holder.o
> > +obj-$(CONFIG_BLK_NVMEM)                +=3D blk-nvmem.o
> > diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..99c7728fb7bccdc2216780a=
73a89a9210f925049
> > --- /dev/null
> > +++ b/block/blk-nvmem.c
> > @@ -0,0 +1,171 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * block device NVMEM provider
> > + *
> > + * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * Useful on devices using a partition on an eMMC for MAC addresses or
> > + * Wi-Fi calibration EEPROM data.
> > + */
> > +
> > +#include <linux/cleanup.h>
> > +#include <linux/mutex.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/of.h>
> > +#include <linux/pagemap.h>
> > +#include <linux/property.h>
> > +
> > +#include "blk.h"
> > +
> > +
>
> Stray newline?
>
> > +/* List of all NVMEM devices */
> > +static LIST_HEAD(nvmem_devices);
> > +static DEFINE_MUTEX(devices_mutex);
> > +
> > +struct blk_nvmem {
> > +     struct nvmem_device     *nvmem;
> > +     dev_t                   devt;
> > +     struct list_head        list;
> > +};
> > +
> > +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> > +                           void *val, size_t bytes)
> > +{
> > +     blk_mode_t mode =3D BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
> > +     struct blk_nvmem *bnv =3D priv;
> > +     size_t bytes_left =3D bytes;
> > +     struct file *bdev_file;
> > +     loff_t pos =3D from;
> > +     int ret =3D 0;
> > +
> > +     bdev_file =3D bdev_file_open_by_dev(bnv->devt, mode, priv, NULL);
> > +     if (!bdev_file)
> > +             return -ENODEV;
> > +
> > +     if (IS_ERR(bdev_file))
> > +             return PTR_ERR(bdev_file);
> > +
> > +     while (bytes_left) {
> > +             pgoff_t f_index =3D pos >> PAGE_SHIFT;
> > +             struct folio *folio;
> > +             size_t folio_off;
> > +             size_t to_read;
> > +
> > +             folio =3D read_mapping_folio(bdev_file->f_mapping, f_inde=
x, NULL);
> > +             if (IS_ERR(folio)) {
> > +                     ret =3D PTR_ERR(folio);
> > +                     goto err_release_bdev;
> > +             }
> > +
> > +             folio_off =3D offset_in_folio(folio, pos);
> > +             to_read =3D min(bytes_left, folio_size(folio) - folio_off=
);
> > +             memcpy_from_folio(val, folio, folio_off, to_read);
> > +             pos +=3D to_read;
> > +             bytes_left -=3D to_read;
> > +             val +=3D to_read;
> > +             folio_put(folio);
> > +     }
> > +
> > +err_release_bdev:
> > +     fput(bdev_file);
>
> There's a __free() action defined in linux/file.h so you can use:
>
>         struct file *bdev_file __free(fput) =3D ...
>
> and avoid this label.

Ok, thanks, will use.

>
> > +
> > +     return ret;
> > +}
> > +
> > +static int blk_nvmem_register(struct device *dev)
> > +{
> > +     struct device_node *child, *np =3D dev_of_node(dev);
> > +     struct block_device *bdev =3D dev_to_bdev(dev);
> > +     struct nvmem_config config =3D {};
> > +     struct blk_nvmem *bnv;
> > +
> > +     /* skip devices which do not have a device tree node */
> > +     if (!np)
> > +             return 0;
> > +
> > +     /* skip devices without an nvmem layout defined */
> > +     child =3D of_get_child_by_name(np, "nvmem-layout");
> > +     if (!child)
> > +             return 0;
> > +     of_node_put(child);
>
> Same as above, can be:
>
>         struct device_node *child __free(device_node) =3D=3D ...

Ack.

>
> > +
> > +     /*
> > +      * skip block device too large to be represented as NVMEM devices=
,
> > +      * the NVMEM reg_read callback uses an unsigned int offset
> > +      */
> > +     if (bdev_nr_bytes(bdev) > UINT_MAX)
> > +             return -EFBIG;
>
> This will mean a failed probe. Wouldn't it be better to use -ENODEV?

That would indeed be an appropriate error.

>
> > +
> > +     bnv =3D kzalloc_obj(*bnv);
> > +     if (!bnv)
> > +             return -ENOMEM;
> > +
> > +     config.id =3D NVMEM_DEVID_NONE;
> > +     config.dev =3D &bdev->bd_device;
> > +     config.name =3D dev_name(&bdev->bd_device);
> > +     config.owner =3D THIS_MODULE;
> > +     config.priv =3D bnv;
> > +     config.reg_read =3D blk_nvmem_reg_read;
> > +     config.size =3D bdev_nr_bytes(bdev);
> > +     config.word_size =3D 1;
> > +     config.stride =3D 1;
> > +     config.read_only =3D true;
> > +     config.root_only =3D true;
> > +     config.ignore_wp =3D true;
> > +     config.of_node =3D to_of_node(dev->fwnode);
> > +
> > +     bnv->devt =3D bdev->bd_device.devt;
> > +     bnv->nvmem =3D nvmem_register(&config);
> > +     if (IS_ERR(bnv->nvmem)) {
> > +             dev_err_probe(&bdev->bd_device, PTR_ERR(bnv->nvmem),
> > +                           "Failed to register NVMEM device\n");
> > +             kfree(bnv);
> > +             return PTR_ERR(bnv->nvmem);
> > +     }
> > +
> > +     scoped_guard(mutex, &devices_mutex)
> > +             list_add_tail(&bnv->list, &nvmem_devices);
>
> I'm not sure I understand the need to store these? Whatever you need to d=
o in
> remove() can be scheduled in a devres action here.

I think the devm_ approach would work fine in practice. The only
difference is that NVMEM unregistration would be delayed from
device_del() to device_release(), but during that window any read
attempt would simply return -ENODEV, so there is no real race or
safety concern AFAIU. I guess the explicit list was initially kept to
mirror the add_dev/remove_dev symmetry of the class interface. But,
except if there is no strong technical argument against devm_, I will
switch to that simpler approach in the next version.

Daniel, feel free to nack or ask for authorship removal if needed.
This patch submitted in your name has accumulated enough changes since
the original submission that the current shape may no longer reflect
your intent.

>
> > +
> > +     return 0;
> > +}
> > +
> > +static void blk_nvmem_unregister(struct device *dev)
> > +{
> > +     struct blk_nvmem *bnv_c, *bnv_t, *bnv =3D NULL;
> > +
> > +     scoped_guard(mutex, &devices_mutex) {
> > +             list_for_each_entry_safe(bnv_c, bnv_t, &nvmem_devices, li=
st) {
> > +                     if (bnv_c->devt =3D=3D dev_to_bdev(dev)->bd_devic=
e.devt) {
> > +                             bnv =3D bnv_c;
> > +                             list_del(&bnv->list);
> > +                             break;
> > +                     }
> > +             }
> > +
> > +             if (!bnv)
> > +                     return;
> > +     }
> > +
> > +     nvmem_unregister(bnv->nvmem);
> > +     kfree(bnv);
> > +}
> > +
> > +static struct class_interface blk_nvmem_bus_interface __refdata =3D {
> > +     .class =3D &block_class,
> > +     .add_dev =3D &blk_nvmem_register,
> > +     .remove_dev =3D &blk_nvmem_unregister,
> > +};
> > +
> > +static int __init blk_nvmem_init(void)
> > +{
> > +     int ret;
> > +
> > +     ret =3D class_interface_register(&blk_nvmem_bus_interface);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +device_initcall(blk_nvmem_init);
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index 311cb2e5a5c02d2c6979d7c9bbb7f94abdfbdad1..ee3481229c20b3063c86d0d=
d66aabbf6b5e29169 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> > @@ -2154,6 +2154,19 @@ const char *nvmem_dev_name(struct nvmem_device *=
nvmem)
> >  }
> >  EXPORT_SYMBOL_GPL(nvmem_dev_name);
> >
> > +/**
> > + * nvmem_dev() - Get the struct device of a given nvmem device.
> > + *
> > + * @nvmem: nvmem device.
> > + *
> > + * Return: pointer to the struct device of the nvmem device.
> > + */
> > +struct device *nvmem_dev(struct nvmem_device *nvmem)
> > +{
> > +     return &nvmem->dev;
> > +}
> > +EXPORT_SYMBOL_GPL(nvmem_dev);
>
> This should still be a separate patch.

Well yes, actually I should even remove this as this is no more needed.

Regards,
Loic


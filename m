Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C7DCD98DA
	for <ath10k@archiver.kernel.org>; Mon, 15 Jun 2026 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJ91cGOE3AFgPVR4MUNMTN4B9fXw/iUPFEgbOHjaEU0=; b=3t9IHBb3ZQhlKssY8V54mX0nE7
	IhRZjptiCQZBnyESXoP9ws4usj45otO+0vPE43QT1eUZlRV0+4LNZt7cpscM02McSqbrzavubR3hg
	mACdWaRNdVvgqyTfVR2igQsiK4FNbY5DdPjjnxtwreD+Wo2OpzC+6Jufu9xPUXFNDxyVS/LJGwY8/
	0NMZFAbb1423EHbONuIbXQEWFNZ77TvgdVyoKpmc55iYi/uS3V0uQpb5u/gxTncTf4hXri8dln+eU
	ZH5zv5emKmLmaoCnSts0X2QSJ4tJciHj0urgvisdAINUOUX0cShIMbd2HsVVLmiwaFpKdFwI/7xQB
	SfwrfSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3cb-0000000DyBk-2YUe;
	Mon, 15 Jun 2026 09:28:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3cY-0000000DyBO-2K58
	for ath10k@lists.infradead.org;
	Mon, 15 Jun 2026 09:28:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6L4sU3888584
	for <ath10k@lists.infradead.org>; Mon, 15 Jun 2026 09:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJ91cGOE3AFgPVR4MUNMTN4B9fXw/iUPFEgbOHjaEU0=; b=XOELhX8N1Bf4wA6b
	/Z3rYd8zA/Ixlfqk0s+4bCGEbYt8m3l1ziZJJgwE4+po+R2W0exjvmC66UB/8yAK
	i+0ZF9LYWYGvgwie398qzj85q6qFgFqfqx29wRnhdrwyFdYNagD6y5Duo6XAHt8V
	m4tWLkBGfvBsCBUfvaRQKuh2GcLoZRG0dS0gAVHwGQbe2gMDwghQAdaCmz0gge25
	IMdyAqpQjIZ46KDqY3aCW+UjmrCYv5DCpbuF7ipNF8CgiOteLxg2HOnLPgemrDOO
	G1LbCw8BpRRYv7JI/RDPYhxLhjUFcPujE2uKk0Wiu6jPRn31BmyyGqoViecHpk4G
	yiG74g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wxp2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 15 Jun 2026 09:28:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157f453a27so474806285a.1
        for <ath10k@lists.infradead.org>; Mon, 15 Jun 2026 02:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781515720; cv=none;
        d=google.com; s=arc-20240605;
        b=J0Y1Hz3r2OwAU9PnyFNrPMlqF+SvwLlCWeiUTF6rEWE+8x0MLsD+sLQbYHiLFO3f5J
         KFU7DBEBfnoqRiwQIwJZcuhR/zJw6W9vGw59C9qjJKItHQfhCyV15z2Rw+M+9dEZ9dNl
         1hwtWjFVkEZTTj+rX2/vwsfGV2Lz0E97j+aIrp/O63wUv/SH3bTNL7eh+OjN8gLI2Xip
         mCY3MAUQ/C6Nm5RSGtqH6PLpIR36Vxdser2Y0oHhBFkI79s3aZdhO8OpD2PhbSZANTcl
         WS3JhvqBDr+7OlAfyfWEaU24EnTAGqws6Mhr04LtH108cyiv1l644+oFLMUH6IsZYdGu
         Y1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cJ91cGOE3AFgPVR4MUNMTN4B9fXw/iUPFEgbOHjaEU0=;
        fh=3Q5g+RRKbVy73ncmiYFro5x8G3XDMG5gQ34DjFI0sO8=;
        b=kqPx4R2hJh7yIQhpPHUvy8agNKH+xFR1STt/iBD7Rq32k+rIZ3XD1F5+DLTIzqFB4L
         djVTdagnFn7Ddx9A6/2my7z+xlXd39FPYkNIsgxAWm4/EyVBEXXZU/qIw07mcGqoXGzo
         FQuwAxybopj6Wjif5E4z7Dl+/AtuRj5dD3hgc3n6b+3L+Ffq/I/8cnHgYeuXvUg9N5mj
         pQ3Jqo1EPVFKIvPB93befVZxVWQbXEFGpGm4rtSLrIx9azRF39egjrOvugBejGMITaXP
         MGq/8OMroGrraa2vq53FIzC8MndGh3eaUnOJSPhLyBQHOWtgWIpplqymTC2TZLbgB9tQ
         QyFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781515720; x=1782120520; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJ91cGOE3AFgPVR4MUNMTN4B9fXw/iUPFEgbOHjaEU0=;
        b=Jnv52wyC6fF2dOIe4ucp7Tua8De3wGR5TSt1XmcGzOTZJ9Fc1/qM8gsUoSW7WpLzI2
         vkHOCBQ+NUtMa8LgHSVBSljn2khLemvh2kJaBoIGH58HbVKV6RCQeJPaNGmOATzOiN04
         5jW7XqezifehEASyjhewslFHoQir1PgQxHgtINtmUGn9rtuw1NiA+EO4V0OvzW7hCoqv
         Om3xP3KDhnpEY2QZEDfmXVs9wokFRXpvZXSFgcTVsgJ0nxCXu+cjfpKPk4qTyXlR2Chb
         2vYNuC7tmcK2iJrVmZq1xUvXXkLnO0YTkbR+ovVGmwCLibLUvd+oWQc3SVr0BTa0OjYM
         L2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781515720; x=1782120520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cJ91cGOE3AFgPVR4MUNMTN4B9fXw/iUPFEgbOHjaEU0=;
        b=Jf8fMgq0g60UFTkA2GDhYmiVIxGpL1qQLkmxAGxc/VxQ0Bh6TnfA3kPJJH/R2Ot7LX
         kHGzEPeI01sTzNxqCH/k8+Br56yJbbkPvIAVwWjj7JMxqruCQw6mruHVc0i7C6Cq1ys1
         XnDUb0ZN4O3cfMUkDzXiLPHU6u557adgh2VNUsONylxYl99VA4+iNMhkXGV9RNdBBWR8
         OZfqtwNb888XIhARFZ45p9wlPyofrVYnSo97ygORFXv87toqWdkA0fv5oFBqveS6Z4YS
         HLl7IYBDuhkaN4FCRfJCkKvp0em+9qLgQWNBIJzcWP8jZmzSxQHh8kNoQh0cWn6RH6DH
         TOrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5AS6hlfMXU5Kisvipfaikt1pLcS9s9FXbXEXxY85xfw3eBhmloSZ3WhcOF+mTjzp58Bvk71I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkyYCByoM4NugLABbaa85vjZ5loJ8f96V2xRF8Q3yhuhkmO2Nw
	WnQtpImTmJvLPf7qD7ZZ0sFx5bEUJjYpVRB05wpNqAwM3pwjRONiutU+CYaWkBreTicYbd1K8cv
	1kjs+LCpibx7UoKVPfaW7CQlhkYvZVqEwqTmfZCo2RfqdSFD/e92RJYjXlq14rWTykZwcPPisna
	zz/46S/JuLSTmlac6rpwW3rQcSroBErdxWmTOBe+s=
X-Gm-Gg: Acq92OGiscdcTcSIBRLbtC+IzgdOy9436PNlj6BXIUJDAcFtdNNpX7qu6CkIaDViYrD
	hZoC6w5oL11Hd6npcmFl37MnjRj7EDnnWysh/ycXCmpdrUSqQG32sXfXK0erTviLiSAmRf/w+GA
	8/Fft2JgH615Mo/OuzOZBMTO4asNnMKKnhFXPnSdZKNX/FbtoZcHIjzo2e0N83qOHfUi8h7hGmu
	XrhJX5L/7Q15imrOBchOauk3c5IJtfU23heAHGVNVBUWGVYOYFAgCuuAYT88iCMVZhzvOubbKrp
	yuWSsuh8EenMMjgDZf2c
X-Received: by 2002:a05:620a:1999:b0:915:820f:c78e with SMTP id af79cd13be357-9161bfa0d31mr1962338185a.52.1781515720060;
        Mon, 15 Jun 2026 02:28:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1999:b0:915:820f:c78e with SMTP id
 af79cd13be357-9161bfa0d31mr1962333085a.52.1781515719471; Mon, 15 Jun 2026
 02:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
 <20260612-block-as-nvmem-v5-5-95e0b30fff90@oss.qualcomm.com> <CAMRc=McQkLnz2OS2RREAbcrsp47cL-W3bCduq8LwPBBUcVNyJw@mail.gmail.com>
In-Reply-To: <CAMRc=McQkLnz2OS2RREAbcrsp47cL-W3bCduq8LwPBBUcVNyJw@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:28:27 +0200
X-Gm-Features: AVVi8CcVJ9tT2-ROJWBj3M8PVcaYsYfsOzvYsFfBdtVBF-QvEOp396eVPW8z9IE
Message-ID: <CAFEp6-0qsqhcwnSjm3=bG21jsCktzn5-L5sk2pNTZcGuVXaiNA@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] block: implement NVMEM provider
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
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
X-Proofpoint-ORIG-GUID: OhP1QtFSq2zWJk3mpD_AvykGg3UVnNx8
X-Proofpoint-GUID: OhP1QtFSq2zWJk3mpD_AvykGg3UVnNx8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5OSBTYWx0ZWRfXxnTOK6zkFgYf
 uMVGiCmyM5+e6SIwNa9N+pcrE20CTh2RdqNArZUvdMJfwwJMxbBsELL1VdOg6pciPohvp6V4zPN
 IaYlgthD7Vke6tTdorzxV2jQiS4K5gM=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fc5c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VT4XjZGOAAAA:8
 a=6Rv5uNetd_8wmlz2G50A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5OSBTYWx0ZWRfXzkRzdo4dmsNU
 AGeKilNiwTZSWJjMEJ6EHp6e8UrE5ZufZFD5BgTYAUmsMzn3K4H10XXR1CUui+iutZ027m9dW/w
 230Uvn0pMenE1x01MGhTRTBL6xf6ZRDKMMbs3C1kBDqf2DoAoKr2RU8bAuyS48LpWL1Olszp3VX
 tsufXfpYysEomtj2i2TkAazgwy2jyyuVXejzBoWLmlS4w8c6V5DaCeUVb/YGeC7jR8tEH8nmqdH
 MLfNYoa1T/vjFsjhRuGpB1hhlFWTtjUSXOVmnPSPq0ZcwRQ0A0r1mOtUSANaoZZZVONrRlS+STS
 mlF7h5GUL2mvbRoh4GxnHtb2ncgqPM5phEqlTTa5QHeZspVeKQO+J7X3zAWXQkMhg3H+N2UxwJZ
 laIsZwotHb5f1PQA93/WC8sv0TgBZdg9FRoJnqfK8vTpFrNjVWYzzEjuLgKS6M/Y8LLbOHe77Ii
 U08nlNQ+yviAErdLMHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_022842_714656_DF0AAB65 
X-CRM114-Status: GOOD (  35.84  )
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

On Mon, Jun 15, 2026 at 10:53=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Fri, 12 Jun 2026 15:20:57 +0200, Loic Poulain
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
> > For now, NVMEM is only registered for the whole disk block device, as t=
he
> > OF node is currently only associated to it.
> >
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  block/Kconfig             |   9 ++++
> >  block/Makefile            |   1 +
> >  block/blk-nvmem.c         | 109 ++++++++++++++++++++++++++++++++++++++=
++++++++
> >  block/blk.h               |   8 ++++
> >  block/genhd.c             |   4 ++
> >  include/linux/blk_types.h |   3 ++
> >  include/linux/blkdev.h    |   1 +
> >  7 files changed, 135 insertions(+)
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
> > index 0000000000000000000000000000000000000000..c005f059d9fe56242ebaef9=
905673dff902b5686
> > --- /dev/null
> > +++ b/block/blk-nvmem.c
> > @@ -0,0 +1,109 @@
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
> > +#include <linux/file.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/of.h>
> > +#include <linux/pagemap.h>
> > +#include <linux/property.h>
> > +
> > +#include "blk.h"
> > +
> > +static int blk_nvmem_reg_read(void *priv, unsigned int from, void *val=
, size_t bytes)
> > +{
> > +     blk_mode_t mode =3D BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
> > +     dev_t devt =3D (dev_t)(uintptr_t)priv;
> > +     size_t bytes_left =3D bytes;
> > +     loff_t pos =3D from;
> > +     int ret =3D 0;
> > +
> > +     struct file *bdev_file __free(fput) =3D bdev_file_open_by_dev(dev=
t, mode, priv, NULL);
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
> > +                     break;
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
> > +     return ret;
> > +}
> > +
> > +void blk_nvmem_add(struct block_device *bdev)
> > +{
> > +     struct device *dev =3D &bdev->bd_device;
> > +     struct nvmem_config config =3D {};
> > +
> > +     /* skip devices which do not have a device tree node */
> > +     if (!dev_of_node(dev))
> > +             return;
> > +
> > +     /* skip devices without an nvmem layout defined */
> > +     struct device_node *child __free(device_node) =3D
> > +             of_get_child_by_name(dev_of_node(dev), "nvmem-layout");
> > +     if (!child)
> > +             return;
> > +
> > +     /*
> > +      * skip block device too large to be represented as NVMEM devices=
,
> > +      * the NVMEM reg_read callback uses an unsigned int offset
> > +      */
> > +     if (bdev_nr_bytes(bdev) > UINT_MAX) {
> > +             dev_warn(dev, "block device too large to be an NVMEM prov=
ider\n");
> > +             return;
> > +     }
> > +
> > +     config.id =3D NVMEM_DEVID_NONE;
> > +     config.dev =3D dev;
> > +     config.name =3D dev_name(dev);
> > +     config.owner =3D THIS_MODULE;
> > +     config.priv =3D (void *)(uintptr_t)dev->devt;
> > +     config.reg_read =3D blk_nvmem_reg_read;
> > +     config.size =3D bdev_nr_bytes(bdev);
> > +     config.word_size =3D 1;
> > +     config.stride =3D 1;
> > +     config.read_only =3D true;
> > +     config.root_only =3D true;
> > +     config.ignore_wp =3D true;
> > +     config.of_node =3D to_of_node(dev->fwnode);
> > +
> > +     bdev->bd_nvmem =3D nvmem_register(&config);
> > +     if (IS_ERR(bdev->bd_nvmem)) {
> > +             dev_err_probe(dev, PTR_ERR(bdev->bd_nvmem),
> > +                           "Failed to register NVMEM device\n");
>
> Using dev_err_probe() only makes sense with a return value. Which makes m=
e
> think: we won't retry this after a probe deferral. I think we should retu=
rn

Yes, so here with the nvmem fixed-layout, there is no way to get a
deferred probe error, but better to be ready to handle this anyway.

> int from this function just for this use-case. Also: if we *do* have
> a layout, shouldn't we treat a failure to register the nvmem provider as
> a an error and propagate it up the stack?

From an API perspective we should indeed return the error. From block
core, Do we want to fail the entire disk addition just because the
'companion' NVMEM provider couldn't be registered, or should we only
abort/return in case of EPROBE_DEFER?

>
> > +             bdev->bd_nvmem =3D NULL;
> > +     }
> > +}
> > +
> > +void blk_nvmem_del(struct block_device *bdev)
> > +{
> > +     if (bdev->bd_nvmem)
>
> Nvmem core already performs a NULL check.

Ok, thanks!


>
> > +             nvmem_unregister(bdev->bd_nvmem);
> > +
> > +     bdev->bd_nvmem =3D NULL;
> > +}
> > diff --git a/block/blk.h b/block/blk.h
> > index ec4674cdf2ead4fd259ff5fc42401f591e684ee9..cd3c7ca723391c40be56f1d=
d4810e641b7c8a2b3 100644
> > --- a/block/blk.h
> > +++ b/block/blk.h
> > @@ -757,4 +757,12 @@ static inline void blk_debugfs_unlock(struct reque=
st_queue *q,
> >       memalloc_noio_restore(memflags);
> >  }
> >
> > +#ifdef CONFIG_BLK_NVMEM
> > +void blk_nvmem_add(struct block_device *bdev);
> > +void blk_nvmem_del(struct block_device *bdev);
> > +#else
> > +static inline void blk_nvmem_add(struct block_device *bdev) {}
> > +static inline void blk_nvmem_del(struct block_device *bdev) {}
> > +#endif
> > +
> >  #endif /* BLK_INTERNAL_H */
> > diff --git a/block/genhd.c b/block/genhd.c
> > index 7d6854fd28e95ae9134309679a7c6a937f5b7db8..1b2382de6fb30c1e5f60f45=
c04dc03ed3bf5d5f2 100644
> > --- a/block/genhd.c
> > +++ b/block/genhd.c
> > @@ -421,6 +421,8 @@ static void add_disk_final(struct gendisk *disk)
> >                */
> >               dev_set_uevent_suppress(ddev, 0);
> >               disk_uevent(disk, KOBJ_ADD);
> > +
> > +             blk_nvmem_add(disk->part0);
> >       }
> >
> >       blk_apply_bdi_limits(disk->bdi, &disk->queue->limits);
> > @@ -704,6 +706,8 @@ static void __del_gendisk(struct gendisk *disk)
> >
> >       disk_del_events(disk);
> >
> > +     blk_nvmem_del(disk->part0);
> > +
> >       /*
> >        * Prevent new openers by unlinked the bdev inode.
> >        */
> > diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> > index 8808ee76e73c09e0ceaac41ba59e86fb0c4efc64..ace6f59b860d0813665b2f6=
2a1c03a1f4be94059 100644
> > --- a/include/linux/blk_types.h
> > +++ b/include/linux/blk_types.h
> > @@ -73,6 +73,9 @@ struct block_device {
> >       int                     bd_writers;
> >  #ifdef CONFIG_SECURITY
> >       void                    *bd_security;
> > +#endif
> > +#ifdef CONFIG_BLK_NVMEM
> > +     struct nvmem_device     *bd_nvmem;
> >  #endif
> >       /*
> >        * keep this out-of-line as it's both big and not needed in the f=
ast
> > diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> > index 890128cdea1ce66863c5baa36f3b336ec4550807..f15d2b5bf9e4fd2368b8a70=
416a978e22c0d4333 100644
> > --- a/include/linux/blkdev.h
> > +++ b/include/linux/blkdev.h
> > @@ -30,6 +30,7 @@
> >
> >  struct module;
> >  struct request_queue;
> > +struct nvmem_device;
> >  struct elevator_queue;
> >  struct blk_trace;
> >  struct request;
> >
> > --
> > 2.34.1
> >
> >
>
> I like this approach better than the previous one.
>
> Thanks,
> Bartosz


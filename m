Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54B4CD8CAA
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 10:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rK5tl4HTNEDD0xETjFdof30J5AtGjM0BvzmgQZhcMUo=; b=ILgkJR8UyoSnPFfwpTbNvEPj9E
	lpCQ55oA2pYy8WEoSoUDYtKVfcr+13U7wglS0xRp9QpdbDqeCOvDKNZnh7O947hUVr0JLE5x7R5sV
	jZBt3Tyk9AfKFqhBrxqPAL6KbrO0A3cnD0SQ8vm6RlVzZUjwO2PUrFpLwBDrMnM69SGThoweRkqxa
	IbVMs1s43cu035fHrv0Qi9baXFeP7cH7Q+zEc+6jQaUEAh8lJtBx6ysVhZW92hehDkzb0J4opo+Fy
	ozC5J+omwO1k9OsX+MABTEoFAfzDC7MRrNzNKj49yaJ6qiv/g6xIgAwY5lUZRBOgkWkY8FKFL5jOg
	niJn494Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtSZ-00000005Jnj-0usi;
	Tue, 09 Jun 2026 10:13:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtSV-00000005JmN-39IM
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 10:13:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xFBp2208513
	for <ath10k@lists.infradead.org>; Tue, 9 Jun 2026 10:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rK5tl4HTNEDD0xETjFdof30J5AtGjM0BvzmgQZhcMUo=; b=NvAGqPmoWex3EasH
	EHg/9kr+o6cOMRvupu32I4sJwrVclhFU9WJdr4EtMFVruOHd3xOZe8OBdowA78VL
	iYhUUUl212l1hgQumD6iwgsEC5QwEoKYMUtDbht2jilg9DCHGEH4QWwNkpsnToWo
	i6AvzzlFu1h2H/+LxA+Mh1amFb8NZkfia71dSsETUrjIjKzf+8g7QuYNqynOaDrn
	BcbNOs+ZbUBsy2k5ggc73JOmeGSARvC+5wPX5hWC0qveY65EnFUNJ6/4UE4gNv/c
	7ESdXfUIKQqoWIDhhZjJzCq9Z/LGIBqvzXmpN5z6rzqR2whl4Z367Q8Ri3tW4uYa
	V29G8A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4gp6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 10:13:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915c364ae3bso572184085a.0
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 03:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781000002; cv=none;
        d=google.com; s=arc-20240605;
        b=Yek8rNRuJtpBaqWwi5sBZPVKgkxNi4EI4wvCD1zPVcdJweadLz3LNArAKEFSRMn2cE
         JrLICuRNE9Z82lhssq7CIr4lkGAW60YNhhq4pXgpGZIJKzXtk5mINBk4xcYinfUt4N0a
         J0Y5G8yc35+Y8jJ0PGpqhuWxaYZ8YKMLw0/9oXoZTeSdCCKxp2rFB+BUBADcxnd2s0W1
         9Vg0zagSf8BoLEzJd9nR5Q/GiOIhJc0bTs+GNQhoAGxY82OGt5NQcv5DMMqUWsxjZeko
         G1cRJuoXNh9yZ2HIWFS4SiAfbg5BhLddplQKltN47v5YTM+P16fJSD1HL0LSDTqBaPrp
         MZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rK5tl4HTNEDD0xETjFdof30J5AtGjM0BvzmgQZhcMUo=;
        fh=ZwJIlqiZc7IYxLUB8M5Q1C8ISUpPzsGXAnYfRsGUjb0=;
        b=hZ3w2TUW0o64VhSBjuzq4Ys1Xt9ELy0PUON4RTXEu8OLgq4T3tbicgFE1na+HiStOm
         uWvS5XPPk/K2rFa7mg9L7YUSEBWcWJzCEZpc3Nb/wrBaUNxxbC6769+EHlDc6NEGXsDR
         qi2o2xwq6p/QOBx3jk2Ls70jNmuG1Tz4ClsynGrfa1Ff5Nk71FwFrporxxaz4jqAgtnN
         4U4y0pm47QhmtPphp2oJkgpWJDZX7hfegnqplaRF36uUzDLFobBejbXjtFaCBOloZBul
         01htsxW1Ka+/TbE+tHw+bLvTU7TlVt+EvSoE/1nrHmYkxtvr9ZGY+ZkdKFqZ3K3y1hl8
         TzUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000002; x=1781604802; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rK5tl4HTNEDD0xETjFdof30J5AtGjM0BvzmgQZhcMUo=;
        b=HkyB8pAJUyYWnpbsxoF4ZyYBUg1e8aI77vWSJPcyYNF3dq4IRB/RN29uW5B6vh6isn
         Zh6reLoMxf4AXsvcuTdt5+tkgeiUf/Cl8+WQwxWt219BQcBBBs+j1Eq1+Np+2fHU3d+X
         p0frnO22Jsnu7e/HZ2Sy4TosgceSwpwiEztB1moluRlFkuqLqYIKpjER1FojUIx+UOmH
         aDgk3qCKonc1+sbRSaBlDy/Bx5ZXiLssN7ZXHa2XhGhnvXUxuMXicGm/d1xUSZqsBUc+
         OCXPzYZMOelsqAhCCsGK25+hC3L/jTNRSmKTNmjh60yyYh1Bs69hwBDdLIWPUSfT0uCD
         C7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000002; x=1781604802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rK5tl4HTNEDD0xETjFdof30J5AtGjM0BvzmgQZhcMUo=;
        b=S9FfQ3RmkkkVmD3q8It0RmhOLnZWVyNePwJOvz4q/+VEBqVJh+uXpyMRuB9IHm9TcJ
         q8DLmxIRMVdQ5CuDUA0kvUzhRDklSoeNBojy9GjnPMJKhXchyF35/HoUIt9BMeyTMD2s
         6aGTnZHdsyywtX++iEuknM+y/jQKO/0FZGDFc6aNho7KM6+H+euU1Ks1NvZszLtuoyl4
         7J8YXHcTifSp+uYB9kazQs7C/mXRRbzDaGenS2xkuB5t4JbMrONYeMKbUdWm5WbxIS+L
         h9h0yVE/5+TrPCP40IWG7Ye030fn0GCe0bkmBa8anvwRdag9GJsDuxkEVivf+RxIj+ax
         ixrw==
X-Forwarded-Encrypted: i=1; AFNElJ8LArH5xrvBJkXzFMYkme1Qx0is2RId9PgBh9wuwDoomlXyRR9TO9FjlxmR8Rc5g0+8EPTFxd4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzH2gscp/tp9bc7yGrJop9ptVtdaCm++z5/O/Aa1WubT0SpYn4R
	qm3Ff1q+4bHwXTTU639YevWAD3Bi5vlJF3BVw/FjanLWyTxUuyM2f6CRhhiABcJzMAoA0jf9R7j
	59moPpMYm1/fNrrDkeQ49WliCY7FwNmBXA8C6VV0JHomE9P897x8ir0TtsnNKFWw3mo7PlKKjdg
	aSHqHcAwYUHFJmWj0XGVP4ZifxAAibYBhitstWVq0=
X-Gm-Gg: Acq92OE8j4q1pnFgztY7uwGFjZjZt1k8cVUBUnrgCgLZmUSmB8QymxP2aOJ6MZ193Ev
	ufOCFrVOfb5AyQTlCslEz8BEcwHJYKbBP51LZ8TTLPFzh3b8YCr12w8Y/w+/LGl320DKRpdlj4K
	1T4MXUsgnM1PbrMCQjE66x8fyY9dQl16r31mhSPD+HQbTVzfHmRQjnG/2c1i5G9fqeY4E9V99Fk
	jHDZ0IaLwP7ru4cS9ZBpx9YO5TdH8TDwRF2GqqxBrtWt9PVbeGzBllloSo1qaX4E2GeYkHHLXmE
	Schrop/g8Lar6Eb/ApZPw1VERpboi9/W
X-Received: by 2002:a05:620a:28d1:b0:915:89d4:df16 with SMTP id af79cd13be357-915a9c2921emr3077668885a.7.1781000001855;
        Tue, 09 Jun 2026 03:13:21 -0700 (PDT)
X-Received: by 2002:a05:620a:28d1:b0:915:89d4:df16 with SMTP id
 af79cd13be357-915a9c2921emr3077666685a.7.1781000001380; Tue, 09 Jun 2026
 03:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-4-45712e6b22c6@oss.qualcomm.com> <CAMRc=MfuiPMkSm=-G6VEJpqKhos0TD_pf0ScBGqfwLHT0uk8yQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfuiPMkSm=-G6VEJpqKhos0TD_pf0ScBGqfwLHT0uk8yQ@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 12:13:08 +0200
X-Gm-Features: AVVi8CdO5YI5NAWSbFzNXGbYum69_nA2LQfVjrd4CKqvNbC45JuBlK0C2ABm878
Message-ID: <CAFEp6-1syMQsvuQ+dLU39bnDeL5Ok7vK1mA7CS0v1m7cjhyMQw@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] block: implement NVMEM provider
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
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27e742 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VT4XjZGOAAAA:8
 a=nTbZda4seY50gyMA9OkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: 4aqskuUmBSTH-CXRjRVmWxeImjFikwo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NSBTYWx0ZWRfX8Imk9UQtbEYj
 PyqKN+R9kZCe6U5e9Nz7KlHh62P5HUfo1sNl0ppDJDnxZQk8ypvBM8gz659IzR8rcdYTobrPjyj
 NfZSy3kyspOv5Ne9jmb1+Sau+0MOP6wwIS6zjXF7aOl+nybwhx2LOD9fn9TJB8ZY6P3Zg1hrHv7
 1cmyiBrJcLo7C9/K5zkswU2k55TyWU2MxbDA5jOFVaZ0sXNPU/IIzasEa+KYcdG8gU/PGlWExha
 UO3RWzuySaNZIISazKNJzlgJy023fDyA1ubQ4Mo68rU++1ROAiQBqxvvC+yahkzIwBSZ6wGpLJN
 wroOgVnEtdCtO8OoC5N/Jhp3HAdYJY9NiM72UY5Ros5M1883ANN3flRG9DQ5ZKCBL46ajeuKla3
 kUkwLJtf0ik91N1AOlsqFZbRhPKiU1/8hIYM6uis/xlKWeZN7f/ZESnTv/O3/dU5VHmSdvcCbTq
 t5Iqi1m+VM/6iCp274Q==
X-Proofpoint-ORIG-GUID: 4aqskuUmBSTH-CXRjRVmWxeImjFikwo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_031323_979274_B2C2CB28 
X-CRM114-Status: GOOD (  38.83  )
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

Hi bartosz,

On Tue, Jun 9, 2026 at 10:52=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 9 Jun 2026 09:52:29 +0200, Loic Poulain
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
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  block/Kconfig     |   9 +++++
> >  block/Makefile    |   1 +
> >  block/blk-nvmem.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 124 insertions(+)
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
> > index 0000000000000000000000000000000000000000..a6e62fa98675ee9bcb9c703=
5a611b5a573ab9091
> > --- /dev/null
> > +++ b/block/blk-nvmem.c
> > @@ -0,0 +1,114 @@
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
> > +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> > +                           void *val, size_t bytes)
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
> > +static int blk_nvmem_register(struct device *dev)
> > +{
> > +     struct block_device *bdev =3D dev_to_bdev(dev);
> > +     struct nvmem_config config =3D {};
> > +
> > +     /* skip devices which do not have a device tree node */
> > +     if (!dev_of_node(dev))
> > +             return 0;
> > +
> > +     /* skip devices without an nvmem layout defined */
> > +     struct device_node *child __free(device_node) =3D
> > +             of_get_child_by_name(dev_of_node(dev), "nvmem-layout");
> > +     if (!child)
> > +             return 0;
> > +
> > +     /*
> > +      * skip block device too large to be represented as NVMEM devices=
,
> > +      * the NVMEM reg_read callback uses an unsigned int offset
> > +      */
> > +     if (bdev_nr_bytes(bdev) > UINT_MAX) {
> > +             dev_warn(dev, "block device too large to be an NVMEM prov=
ider\n");
> > +             return -ENODEV;
>
> Wait, I must have suggested -ENODEV here on too little coffee. This callb=
ack
> is called from device_add(), not when the device is bound so it's not the=
 same
> thing as returning -ENODEV from probe().
>
> On the other hand, we don't want to not provide the block device just bec=
ause
> someone added a DT property on one that's too big. I'd say: warn, but ret=
urn 0.
> Does it make sense?

It=E2=80=99s still technically an error in the sense that we cannot provide
the required nvmem feature. However, it only becomes a real issue if a
consumer actually attempts to use it.
Also, the block device should still be added, since the return code
from add_dev is not checked. In any case, I=E2=80=99m fine with either
approach, as long as we emit a warning message.

>
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
> > +     return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
>
> And that was a wrong suggestion on my part too because I was under the
> impression that we're in the probe() path, not device_add(). You can't us=
e
> devres here as the device at this point is not yet bound and may never be=
.

So I understand The bd_device is purely a class device with no bus, no driv=
er.
For driverless devices, devres_release_all() is called explicitly
within device_del() .

>
> Which leads me to the second point: this is not the moment to add the nvm=
em
> provider. This should happen at or after probe(). Once nvmem_register()
> returns, you have a visible nvmem resource but nothing backing it in the =
block
> layer.

There is a short window during which a read attempt will 'properly'
fail, but this does seem somewhat fragile indeed.

> Either do this in block core when registering a new device or schedule
> a notifier here for the BUS_NOTIFY_BOUND_DRIVER event and do it in the no=
tifier
> callback.

So in the end, it seems that the simpler and more robust approach is
probably to move away from the class_interface driver and instead
register/unregister the nvmem directly in add_disk/del_gendisk.
If that's ok I will move to this approach in the next version.

Regards,
Loic


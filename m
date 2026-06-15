Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFA5CD98C5
	for <ath10k@archiver.kernel.org>; Mon, 15 Jun 2026 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qG8HgDUNc/nKERmMalYGQVa0Hi+SFVzgKt5xGaQIVIs=; b=l0QkJVrQCKVAFE8oJ75+PCPzYx
	mLVI44ztb5wyTceH+Nt7YxlpDVMN7zCJOAT2k3rlLhjF4OA1bGEfLA3PSUsTcAQiRK5GW9YSNX0If
	4ZbTUjM/gj0YHT1IipjEYszKe2R3cbRwzNF4qII8qrSHGeFNfDNgqSojWvB91S4cK4G+XY/T0/bc2
	64uIHzyVB4Uy4Q4SApkGIDx/Y0OjuiXsmj3OMb/+tYaiOc//Q9zpOKvh0l8oTx6UJjDVEdCOYHY8G
	irnB1RheW3TZD5AapxeEH0VN4zX8eAIKlIV4w/P1Xe6M6a5hUsxqv48KU2YVaklPHPlWWJWuDOfi6
	mN0VqOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3hK-0000000DyOC-0zTk;
	Mon, 15 Jun 2026 09:33:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3hH-0000000DyNo-2h3M
	for ath10k@lists.infradead.org;
	Mon, 15 Jun 2026 09:33:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F9OND13763485
	for <ath10k@lists.infradead.org>; Mon, 15 Jun 2026 09:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qG8HgDUNc/nKERmMalYGQVa0Hi+SFVzgKt5xGaQIVIs=; b=S2dbtiXldx5Ql60C
	J7+12nSh5fUda9jkhJjD1zB/MbY8XFMoMFuoTOt78NWoMxcqh72cUpHdrxV7Yktt
	KFwL3N2eypVQk1A/hiyvis9/9GDToStZGj99eBd4eCs501gdrYCA42VZJiqISlAf
	kimP9DEFi9+SIdGt/RszZyKLAwlr1Uy03s5P8f65WSHRCsctKGbrKS1yzf953eBW
	BXJek1dzt3vzZAXUa5HcUvQEI8qgxSo+3ravTy2cmkag0jh1WiiB5HpNenyRpYK1
	9jtAZyLRbdlYrfSgb+LJyM63II7SYVpS1iF5m5XNGPsAXKQKC0AIfzDDPt7F23CA
	lVpyeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter001ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 15 Jun 2026 09:33:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915767b341eso289013385a.3
        for <ath10k@lists.infradead.org>; Mon, 15 Jun 2026 02:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781516014; cv=none;
        d=google.com; s=arc-20240605;
        b=hoDF+4CU6STLf9aVLWvCJz/4T2TnGT1ggR3FA7cuqm/ICFkgckDiUDNkrARepp0HKk
         KW+uLU9M1kfll1qsMmhRUCv5W6o25D847eMcqaunXAs5AI98j2TzBwjXt3ngcvtfWNx5
         eMF5Hrv/YTjbYL+Rd2lNNIYeEKRWSYv85sSJLMVtpVWSt39/ylOqATZ2yHSqhm8zmfas
         00BmKN6Th5S/Gef1ziRO5NiPYFL3JnGN8cYxQ0UO9Ca8nCZH2sDrw2wDwrOKSWGK13mD
         IppAghAqnZHR9CguEH7rylCTBt058fzXxseRDf2cT0We79NXcTXBP/Aus9lTynHAKsUz
         3NlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qG8HgDUNc/nKERmMalYGQVa0Hi+SFVzgKt5xGaQIVIs=;
        fh=CenGHJv416s4l8hJZBQ1QwVUAMsh39RcHTGhnhcsEzI=;
        b=U4tePqY2htW0xIIjjNx275sipjxx2O9s3l3xlDGw769lI8oHwClxlqiSFQ2rgK/jRn
         qAXI+Tqnjb8Qo8IyWXgbi71AkEKHnh+4WzBKZ7n4DUKqEwBPX7f5NjJ5elfarOG60HJE
         BGUAp9l/KQB1clekn1tDiPRJI1ia0snEjISDcJn0kJy4QxARy9m953KzoiMmruPhtNPp
         l6UwE9glpeSXDe+RRDyFXWX6MtpTHZX/D2Vd37UPXcuidNzYn5+zfzM0njWL9GXz3+Gg
         6EATjr6k19lWMJ0Xw0QXRvdaXt3vO1+8P4ocQS5tIE0dpEsM/SXQKclqed9vsD+/iasX
         CtmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781516014; x=1782120814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG8HgDUNc/nKERmMalYGQVa0Hi+SFVzgKt5xGaQIVIs=;
        b=VtwKkGjKOhGbunKPutbZlJ1AQgbQzuA60WIPw5EHSDTEgBy55XPK5U/EtBgCdk8Le2
         esXQV6iFZ+EQ2MlRE+yJrzdqEyW/MrismbinG4y6onbcsaOUYkjrIRWeM8j5hjnhWHJO
         bktqqiPprctWguuMVqY0L0RbuTjpN5aUDhtKmF4htT2vC0qZDdj2ji8U7lZ7jWDVA3vg
         8DTrCzTVmdict6CXkh5IXUz2YnpmViLDAiWuQ3IlpQKkXThbkCPvocgi5pDpXVDW82VO
         BxRqk3ZttfvCF00+Pycl9GFwFWenZXHI8vB+NJjV3tjUPBWRpi7gRNHTX3p9WEaB7o2v
         bgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516014; x=1782120814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qG8HgDUNc/nKERmMalYGQVa0Hi+SFVzgKt5xGaQIVIs=;
        b=AWS49NYjTxSg2UbvBLQgtyRTgq8gB0P7V7PB6LUkWn1V04SbTg3fadSEhu31lDAXV6
         ++XJkeBXAd+0Bpo33o35K/8Jm1VzjR75L0D/dmjHz4kIZ7BuqDCwWl6l+3N6F6+F3Kse
         /n8yx6dTRptra9N4kojCAha8uaR1QiFQ3OVHhMEdDiTCewWaT8re9pHDFKiKyMxT4kbX
         CTGWxA/Whiz5qY9fdZ40ixnTgRtSvJT+Rk0IU265/2RQjWU4WyeNVOc6rd1yeuOodoXI
         fXw6XIO705skxuRlwjFT9LqxboBqCqP0bFXdFAl9fD8IczJI4gga8zWpoTwhjMl0HKri
         NaSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/I/qd4zeisjsHv4TUKS19+SjJdSP7W3ZNeDVbAdvvdurBKPbPmYY/XdNclHaLqWmohzjFpT5k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoSJZK7zPA93gJdx5C9zW9xdX6xdWzZymXUqLDdXiTykPaLmuk
	39S8epTwLGsq1Is9KlOM4UFIEKXYwQxP+ALj1IlizxJSiJvB+QwR6fqy29cXDFqmdIskhzRgS7X
	C3QGiUODwGpViHNppigGkJ/ka3pRzSpVAo2tRPU3i047BL0FVA85xq7Z2EBS688W4nZtlDoVxaW
	xpdMNNBZ08irPm6ncylgDRAnkGPum5duNXV/fzJhU=
X-Gm-Gg: Acq92OFiPsvfrrZIShXlJvA9x5Q0CD0C8VH7q9ZdotPsaH7p1xZTwEuvpGWx3JXMmzL
	uUSCp1xh2iLkbFpz9LBsDx0CVVR6Gn/SLwcJUxtYeXMxSyDyGeRbEJJNMMIZlwrinMl+uvxXFxu
	FISXyawyYdmnBXLsKbLI0T/Kjie6nE2n9ho643WJZUHr+5dc0o5nWmOhNgHm9CvpoX5ebHSg2oX
	L49cBoq4pWin+F+wFM6MLOzBI6cyUu/KykszBiuvbzRHrOqfRE8Q1oBCwR0+kXPCHewoV0uwK73
	/0XVAyicZO3YaovUupDf
X-Received: by 2002:a05:620a:4552:b0:916:1726:4893 with SMTP id af79cd13be357-9161bbfd132mr2043633985a.16.1781516013858;
        Mon, 15 Jun 2026 02:33:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4552:b0:916:1726:4893 with SMTP id
 af79cd13be357-9161bbfd132mr2043628485a.16.1781516013345; Mon, 15 Jun 2026
 02:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
 <20260612-block-as-nvmem-v5-5-95e0b30fff90@oss.qualcomm.com>
 <CAMRc=McQkLnz2OS2RREAbcrsp47cL-W3bCduq8LwPBBUcVNyJw@mail.gmail.com> <CAFEp6-0qsqhcwnSjm3=bG21jsCktzn5-L5sk2pNTZcGuVXaiNA@mail.gmail.com>
In-Reply-To: <CAFEp6-0qsqhcwnSjm3=bG21jsCktzn5-L5sk2pNTZcGuVXaiNA@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:33:22 +0200
X-Gm-Features: AVVi8CfBRys-DXFI5wrB8yqdywy7X_kfmKpyDKlwYIcwcR0i_tSHWZVN9l-o_rA
Message-ID: <CAFEp6-0oxBEdfH-fqhdM18pt4JewLwrMOON9qpQgLFh8KS0hDg@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: DiIBX4Wbf_sRWoT7GyRwTf6VkpuGzTJD
X-Proofpoint-GUID: DiIBX4Wbf_sRWoT7GyRwTf6VkpuGzTJD
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a2fc6ef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=VT4XjZGOAAAA:8
 a=NvFwrZXXSFNSu_oYZZQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEwMCBTYWx0ZWRfX9JwXI8mY79L8
 BynpQqVi2SmZDmPb03mLCkkPHdVsvpAReQpyE51gl7UTcHr9J7AjG7UJOkAQdhQlBTGAzbxuNZO
 ZVJrbFPk/nyoo8Fof6LW27lwK3q3L5KnVVqVtl2dkbxxKp95Enkvx53cGteujEbGATr4GPdC2E4
 3nojnuf0fNQHbueqTqw3UXBaTn92Url+GfJqaawjZJM4pSYAUoR0yEWwU1Echqr0tbH46+sPK9N
 5WYUt4ddJDQ+V0qDwtW+hP87jvjdX6WqMHTNwDq7AgNWQwciJFlct4EN0EIS99tsrhBbo7nqm+q
 BjVaZ/xOA4bN5tDGNccEK+fHLurO3Z1jh7e/5tGCxJ+gMbYq1Cm//52yUU0NRW0kv8pwljg4oAW
 rLQSZkN9Be4tt2GqyFUY+AEgN5M57LG0kTD4ZlXyZvSI2xeJnDOi2OwFcS3j3AKxkyfDT0x1npF
 AJ3B4SiZi73EEx+4BNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEwMCBTYWx0ZWRfX598hKDCVN1zp
 lz8MmfeJtDjz0QH3W1gXHqsKB9++zAnM3U4nSp7Ld+nOLHalTkWLZQTDw5UA7gUx0PuegBDCQAc
 86pf7GQ64SJjNeVVEPI94zGdGHnFj2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_023335_868484_591AAAE2 
X-CRM114-Status: GOOD (  35.30  )
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

On Mon, Jun 15, 2026 at 11:28=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Mon, Jun 15, 2026 at 10:53=E2=80=AFAM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
> >
> > On Fri, 12 Jun 2026 15:20:57 +0200, Loic Poulain
> > <loic.poulain@oss.qualcomm.com> said:
> > > From: Daniel Golle <daniel@makrotopia.org>
> > >
> > > On embedded devices using an eMMC it is common that one or more parti=
tions
> > > on the eMMC are used to store MAC addresses and Wi-Fi calibration EEP=
ROM
> > > data. Allow referencing the partition in device tree for the kernel a=
nd
> > > Wi-Fi drivers accessing it via the NVMEM layer.
> > >
> > > For now, NVMEM is only registered for the whole disk block device, as=
 the
> > > OF node is currently only associated to it.
> > >
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> > >  block/Kconfig             |   9 ++++
> > >  block/Makefile            |   1 +
> > >  block/blk-nvmem.c         | 109 ++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  block/blk.h               |   8 ++++
> > >  block/genhd.c             |   4 ++
> > >  include/linux/blk_types.h |   3 ++
> > >  include/linux/blkdev.h    |   1 +
> > >  7 files changed, 135 insertions(+)
> > >
> > > diff --git a/block/Kconfig b/block/Kconfig
> > > index 15027963472d7b40e27b9097a5993c457b5b3054..0b33747e16dc334736837=
06f75c92bdf8b648f7c 100644
> > > --- a/block/Kconfig
> > > +++ b/block/Kconfig
> > > @@ -209,6 +209,15 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
> > >         by falling back to the kernel crypto API when inline
> > >         encryption hardware is not present.
> > >
> > > +config BLK_NVMEM
> > > +     bool "Block device NVMEM provider"
> > > +     depends on OF
> > > +     depends on NVMEM
> > > +     help
> > > +       Allow block devices (or partitions) to act as NVMEM providers=
,
> > > +       typically used with eMMC to store MAC addresses or Wi-Fi
> > > +       calibration data on embedded devices.
> > > +
> > >  source "block/partitions/Kconfig"
> > >
> > >  config BLK_PM
> > > diff --git a/block/Makefile b/block/Makefile
> > > index 7dce2e44276c4274c11a0a61121c83d9c43d6e0c..d7ac389e71902bc091a88=
00ea266190a43b3e63d 100644
> > > --- a/block/Makefile
> > > +++ b/block/Makefile
> > > @@ -36,3 +36,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION) +=3D blk-crypto=
.o blk-crypto-profile.o \
> > >                                          blk-crypto-sysfs.o
> > >  obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) +=3D blk-crypto-fallbac=
k.o
> > >  obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)        +=3D holder.o
> > > +obj-$(CONFIG_BLK_NVMEM)                +=3D blk-nvmem.o
> > > diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..c005f059d9fe56242ebae=
f9905673dff902b5686
> > > --- /dev/null
> > > +++ b/block/blk-nvmem.c
> > > @@ -0,0 +1,109 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * block device NVMEM provider
> > > + *
> > > + * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries=
.
> > > + *
> > > + * Useful on devices using a partition on an eMMC for MAC addresses =
or
> > > + * Wi-Fi calibration EEPROM data.
> > > + */
> > > +
> > > +#include <linux/file.h>
> > > +#include <linux/nvmem-provider.h>
> > > +#include <linux/nvmem-consumer.h>
> > > +#include <linux/of.h>
> > > +#include <linux/pagemap.h>
> > > +#include <linux/property.h>
> > > +
> > > +#include "blk.h"
> > > +
> > > +static int blk_nvmem_reg_read(void *priv, unsigned int from, void *v=
al, size_t bytes)
> > > +{
> > > +     blk_mode_t mode =3D BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
> > > +     dev_t devt =3D (dev_t)(uintptr_t)priv;
> > > +     size_t bytes_left =3D bytes;
> > > +     loff_t pos =3D from;
> > > +     int ret =3D 0;
> > > +
> > > +     struct file *bdev_file __free(fput) =3D bdev_file_open_by_dev(d=
evt, mode, priv, NULL);
> > > +     if (IS_ERR(bdev_file))
> > > +             return PTR_ERR(bdev_file);
> > > +
> > > +     while (bytes_left) {
> > > +             pgoff_t f_index =3D pos >> PAGE_SHIFT;
> > > +             struct folio *folio;
> > > +             size_t folio_off;
> > > +             size_t to_read;
> > > +
> > > +             folio =3D read_mapping_folio(bdev_file->f_mapping, f_in=
dex, NULL);
> > > +             if (IS_ERR(folio)) {
> > > +                     ret =3D PTR_ERR(folio);
> > > +                     break;
> > > +             }
> > > +
> > > +             folio_off =3D offset_in_folio(folio, pos);
> > > +             to_read =3D min(bytes_left, folio_size(folio) - folio_o=
ff);
> > > +             memcpy_from_folio(val, folio, folio_off, to_read);
> > > +             pos +=3D to_read;
> > > +             bytes_left -=3D to_read;
> > > +             val +=3D to_read;
> > > +             folio_put(folio);
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +void blk_nvmem_add(struct block_device *bdev)
> > > +{
> > > +     struct device *dev =3D &bdev->bd_device;
> > > +     struct nvmem_config config =3D {};
> > > +
> > > +     /* skip devices which do not have a device tree node */
> > > +     if (!dev_of_node(dev))
> > > +             return;
> > > +
> > > +     /* skip devices without an nvmem layout defined */
> > > +     struct device_node *child __free(device_node) =3D
> > > +             of_get_child_by_name(dev_of_node(dev), "nvmem-layout");
> > > +     if (!child)
> > > +             return;
> > > +
> > > +     /*
> > > +      * skip block device too large to be represented as NVMEM devic=
es,
> > > +      * the NVMEM reg_read callback uses an unsigned int offset
> > > +      */
> > > +     if (bdev_nr_bytes(bdev) > UINT_MAX) {
> > > +             dev_warn(dev, "block device too large to be an NVMEM pr=
ovider\n");
> > > +             return;
> > > +     }
> > > +
> > > +     config.id =3D NVMEM_DEVID_NONE;
> > > +     config.dev =3D dev;
> > > +     config.name =3D dev_name(dev);
> > > +     config.owner =3D THIS_MODULE;
> > > +     config.priv =3D (void *)(uintptr_t)dev->devt;
> > > +     config.reg_read =3D blk_nvmem_reg_read;
> > > +     config.size =3D bdev_nr_bytes(bdev);
> > > +     config.word_size =3D 1;
> > > +     config.stride =3D 1;
> > > +     config.read_only =3D true;
> > > +     config.root_only =3D true;
> > > +     config.ignore_wp =3D true;
> > > +     config.of_node =3D to_of_node(dev->fwnode);
> > > +
> > > +     bdev->bd_nvmem =3D nvmem_register(&config);
> > > +     if (IS_ERR(bdev->bd_nvmem)) {
> > > +             dev_err_probe(dev, PTR_ERR(bdev->bd_nvmem),
> > > +                           "Failed to register NVMEM device\n");
> >
> > Using dev_err_probe() only makes sense with a return value. Which makes=
 me
> > think: we won't retry this after a probe deferral. I think we should re=
turn
>
> Yes, so here with the nvmem fixed-layout, there is no way to get a
> deferred probe error, but better to be ready to handle this anyway.
>
> > int from this function just for this use-case. Also: if we *do* have
> > a layout, shouldn't we treat a failure to register the nvmem provider a=
s
> > a an error and propagate it up the stack?
>
> From an API perspective we should indeed return the error. From block
> core, Do we want to fail the entire disk addition just because the
> 'companion' NVMEM provider couldn't be registered, or should we only
> abort/return in case of EPROBE_DEFER?

Also we cannot safely return -EPROBE_DEFER from add_disk_final()
either. The NVMEM registration point is late in the sequence, too much
has already happened to easily unwind. The easiest is that the NVMEM
simply won't be available if registration fails, which looks
acceptable?

>
> >
> > > +             bdev->bd_nvmem =3D NULL;
> > > +     }
> > > +}
> > > +
> > > +void blk_nvmem_del(struct block_device *bdev)
> > > +{
> > > +     if (bdev->bd_nvmem)
> >
> > Nvmem core already performs a NULL check.
>
> Ok, thanks!
>
>
> >
> > > +             nvmem_unregister(bdev->bd_nvmem);
> > > +
> > > +     bdev->bd_nvmem =3D NULL;
> > > +}
> > > diff --git a/block/blk.h b/block/blk.h
> > > index ec4674cdf2ead4fd259ff5fc42401f591e684ee9..cd3c7ca723391c40be56f=
1dd4810e641b7c8a2b3 100644
> > > --- a/block/blk.h
> > > +++ b/block/blk.h
> > > @@ -757,4 +757,12 @@ static inline void blk_debugfs_unlock(struct req=
uest_queue *q,
> > >       memalloc_noio_restore(memflags);
> > >  }
> > >
> > > +#ifdef CONFIG_BLK_NVMEM
> > > +void blk_nvmem_add(struct block_device *bdev);
> > > +void blk_nvmem_del(struct block_device *bdev);
> > > +#else
> > > +static inline void blk_nvmem_add(struct block_device *bdev) {}
> > > +static inline void blk_nvmem_del(struct block_device *bdev) {}
> > > +#endif
> > > +
> > >  #endif /* BLK_INTERNAL_H */
> > > diff --git a/block/genhd.c b/block/genhd.c
> > > index 7d6854fd28e95ae9134309679a7c6a937f5b7db8..1b2382de6fb30c1e5f60f=
45c04dc03ed3bf5d5f2 100644
> > > --- a/block/genhd.c
> > > +++ b/block/genhd.c
> > > @@ -421,6 +421,8 @@ static void add_disk_final(struct gendisk *disk)
> > >                */
> > >               dev_set_uevent_suppress(ddev, 0);
> > >               disk_uevent(disk, KOBJ_ADD);
> > > +
> > > +             blk_nvmem_add(disk->part0);
> > >       }
> > >
> > >       blk_apply_bdi_limits(disk->bdi, &disk->queue->limits);
> > > @@ -704,6 +706,8 @@ static void __del_gendisk(struct gendisk *disk)
> > >
> > >       disk_del_events(disk);
> > >
> > > +     blk_nvmem_del(disk->part0);
> > > +
> > >       /*
> > >        * Prevent new openers by unlinked the bdev inode.
> > >        */
> > > diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> > > index 8808ee76e73c09e0ceaac41ba59e86fb0c4efc64..ace6f59b860d0813665b2=
f62a1c03a1f4be94059 100644
> > > --- a/include/linux/blk_types.h
> > > +++ b/include/linux/blk_types.h
> > > @@ -73,6 +73,9 @@ struct block_device {
> > >       int                     bd_writers;
> > >  #ifdef CONFIG_SECURITY
> > >       void                    *bd_security;
> > > +#endif
> > > +#ifdef CONFIG_BLK_NVMEM
> > > +     struct nvmem_device     *bd_nvmem;
> > >  #endif
> > >       /*
> > >        * keep this out-of-line as it's both big and not needed in the=
 fast
> > > diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> > > index 890128cdea1ce66863c5baa36f3b336ec4550807..f15d2b5bf9e4fd2368b8a=
70416a978e22c0d4333 100644
> > > --- a/include/linux/blkdev.h
> > > +++ b/include/linux/blkdev.h
> > > @@ -30,6 +30,7 @@
> > >
> > >  struct module;
> > >  struct request_queue;
> > > +struct nvmem_device;
> > >  struct elevator_queue;
> > >  struct blk_trace;
> > >  struct request;
> > >
> > > --
> > > 2.34.1
> > >
> > >
> >
> > I like this approach better than the previous one.
> >
> > Thanks,
> > Bartosz


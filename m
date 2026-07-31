Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2639EC5516D
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 08:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3GhF007z7C34wPcyFeCCGV2WXEPpkpmeiHbGxUATr4=; b=1MvTHqmcRY+AimiF0loRHMLcbh
	EFbuK8ljF/Cnv64I/58J+0gumtGMg7LwxYHM2sV49aMS/gydDRplf1s0qdgTzFSlEfgNhWpeYa6uK
	TGMnWknz0CkOWULimVEbduSWIv1DtoLBT2SVcT9POMk7LIjNo+DsyWUpZZixAt2ndtwpOGcCWfT4K
	WB6ElmMBxozQzlh7NnGQ+tIBCgTT19VmnqFXg9ry/FISTh3i9fy80MZrebh3Tx31jrSr48nG2Po9f
	K6XSaS9bSNdnV3d7vY5sPDI6aLBXC9hcNciy5UxxF+qzFuwAjOR9izf4jMH+CszGZS6Ic675pw7c7
	CSc/xh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiq8-0000000C5op-448K;
	Fri, 31 Jul 2026 08:43:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiq5-0000000C5o8-3udO
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 08:43:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8bb9O3389850
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 08:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3GhF007z7C34wPcyFeCCGV2WXEPpkpmeiHbGxUATr4=; b=Vqgltm67AGe6H03K
	3UZdm7UENlGOTEEsNjQsuaFyjYDY3WhDv5gT93rwT2kHNoDitSCf4OctnQxOOImm
	AgixAlEps0gNL+ig3eFTmk7lOQiF/2B+9qO1dU1iMCZaTWXmCy4pEbrNY6X95LFw
	RxdgApAtNWtcLsS/wsWJ3cJlEQkYpwCLwT1/kOBJLX+uwf1NinEjYHLaNWEB/URq
	jmMo3icTNZeijQ9Mg5FtHtb2/dx3PWIANHxwB2VD9f1lBHKq/C2IMLfMyaDtyK4l
	Us8UHmG/0RNCD98LNRirVpyPLOvNVlPFyeT8TMFrxF/uGlaJ8rqN5N21hsnvS8Z7
	hatSuA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc2g0r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 08:43:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e8004d60eso162775085a.1
        for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 01:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785487412; cv=none;
        d=google.com; s=arc-20260327;
        b=EDeFSxWozHz3IiOBsgK/T773O2ePy/Ut3rerXY887lClv6/ehElyZKy8hYrDZIpHTw
         FPl3vtjZwlfEuY3f0EfWZDXH0ackcFmPdEGHgsamcPN0REdBHU8VEC/iok8Cf8SWsAPq
         IZp6Zuseq4axVvtz7skYLoylcTmvTPs05XYSQSt1OAlHoLN3mAYnW41tUwY1Ib25lpjP
         I9xXOEmNnxuI5PrGrVKmZzRt+aGGzIaoOTu74ZseGhhoWAGsf7edFzAW9L+dxYPzL7wG
         V83Gt8R8qAZJgB77kDnNk5KmBhVUmcofVbdCebOpK/lEckC//T8GDEXoZIrAvodSsNmM
         7Qqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E3GhF007z7C34wPcyFeCCGV2WXEPpkpmeiHbGxUATr4=;
        fh=XqwGC538NKIENDwkBDb18q+J/LKmE0nas6CKuLu8vlY=;
        b=bmwBN1BBX4KqaAzY0jMJy6B/drGb8Voso21Yv4/mCoI5Lkx8jc1GBy3w9BFQTQdxEd
         gFza9td8kmMBuDpKkwgZCPk2v+8aU4dZMf9TW/bvvUi/OruRVmURaRqv4gggGNC5Rpuc
         eQUNDpemmlvC8dobOhMPCLNzLGTignauCK9QjCXdNVzhq96kmNhGym/Yp2P52ZxU/fPL
         BSSEd63BC/8tmQHDQakmFwOglNaV5nqyHg97B6CNZFBzxtugo2xbboeHM48p6Kt9tcPW
         vXqcer06AlQUfInfeExZ6MYslzeGfz7ctzrOmAimXITJUnjmrP9+dZpKAzRY/8GAMvek
         vYnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487412; x=1786092212; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3GhF007z7C34wPcyFeCCGV2WXEPpkpmeiHbGxUATr4=;
        b=hjRFCQItdycV2uwhMa1R+2rPm1/lIJHQkriMF+ZjAXDTQ/tK9TeJplHZXUS2alavox
         CUgIq4BaHkAVZa4YlWWUllWqsz6aXeDMbdFjnhyaimAbEbtQ8C/T5Ey29XcAUFEyKOp8
         ujsI/UwMgX2QOYrA0j5VNOFDGdMpKa8g6qnjU375Q4M0HVbwKDLg+2iP9NyUC9b2+krh
         hxuR1u+6wrpIEHmW5IFTov/RgX+a1WNHvPP8/DhLBegTYYzS85GcSeM3fbI85vLgk3ld
         2890LrRaNY1Q9C9i7eOmMbQ7IRfwTC9jvzBGpywJWgmDjm9T7mZlBEOuWeVRmwjuV2dz
         LDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487412; x=1786092212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3GhF007z7C34wPcyFeCCGV2WXEPpkpmeiHbGxUATr4=;
        b=U7U/j54AdZ3/WNbBFGZfAg3bqVSukJ05oMmzUjqzjvsYyvGsqS/rAxOTGLwktxU5SV
         Du2nHX63bmd3yPjHSxFCI/CH4A+a5KMWAZHQks8zZH2C6U0gqb/tGrctXoAWy1JSFmhZ
         kyigln/f1D0kH/phQgn7ivF3IF50qax720AzIQMKD59mvqflyP5XGlEARUmsCxySblIy
         rqbfjBL+99Z6PBHVhiJDCedzlh2fSqDJX6dKYNnfSbOkzMacCWWEcq1/kLmIZmpveJk3
         ZiV9dBD+SPFUb0nsaftWBZS78+2QikKSsVT23Zg5HbfZiD2P+q/aJM7MUh+KpT2NckY9
         abOw==
X-Forwarded-Encrypted: i=1; AHgh+RoZy+f27lUZiDHFSsGNyOYL7d8b+/HL1rekbRBKOdJJzGSF3gWAxfOYuSXDrYlbF4SHc1j8+Ms=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7jMbFXDBwvp6R5e1e4xmh/T/HxhHquHwAnQ62mUw1IdNiM5TB
	QPErC3kr1RC/6Wfce9wDMY4Mabt0wCktcU69yCySxwhkeZ1pPSw6lHCgapt0no3iUDylV6f2Zmw
	Vvp8FRgmkp4exdIZViMxtSJ3e7xrVqg+xuQc6jA7G6gSaaKqxrf6+fi+RIseRTF1KGGBdrYFYf5
	2cqysPpbfA7k6VRRIZCsqyJVF+LNVAJmAdo0wpjPQ=
X-Gm-Gg: AR+sD11V+y2RRzUw9Xcu6kveH7e7KY/bLKnNOGJlCxEhFNhhEhS4cHtk5pLREQlRwNw
	DXPEboR5+s/27g6alaiECg9Eg9e+29RHddaQ53tPq1BgP5BIJ5jFWhbktd5l6Qrz+gW4hnRF5ts
	/Ijdpfw53jaFWOCcQQjSh4Mz8SW027eGu3ez8S/MPKPLYrfbmYmwYoel7GImvoiTWTx0aO4oSix
	ld7m96+eXlO7Pkhj0yOpM2wXCeuDWIWC/bAd8dKjcNeZ+g/Uk89M49wjI0mS5gptAufBVFQhJE=
X-Received: by 2002:a05:620a:6f93:20b0:92e:9ceb:24af with SMTP id af79cd13be357-9349687363bmr109637385a.41.1785487411885;
        Fri, 31 Jul 2026 01:43:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6f93:20b0:92e:9ceb:24af with SMTP id
 af79cd13be357-9349687363bmr109632785a.41.1785487411292; Fri, 31 Jul 2026
 01:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260731-pwrseq-vote-rename-v2-1-480357946e00@oss.qualcomm.com>
In-Reply-To: <20260731-pwrseq-vote-rename-v2-1-480357946e00@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:43:19 +0200
X-Gm-Features: AUfX_mxGc8TowxqJoyMLr9lPewvGGZuHpNOlIMfPw74Jd7bPqJDpwbDzy4wrrSI
Message-ID: <CAFEp6-3X+PCXZdEy1p47XUDs7cT16JDjt0=928Jjkeik_haaQw@mail.gmail.com>
Subject: Re: [PATCH v2] power: sequencing: rename pwrseq_power_on/off() to pwrseq_enable/disable()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
        linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, imagination@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pci@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Zdst8MVA c=1 sm=1 tr=0 ts=6a6c6035 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=W1t4AYViT67xggANpSQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 8S3W17fauUkpqMl17OQsBETw6RCcD7Kc
X-Proofpoint-GUID: 8S3W17fauUkpqMl17OQsBETw6RCcD7Kc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX7mLni9an533D
 25mo//Hp3p2WK42l68IGJ0K+mSnNGIA3IVSNb6fIwpAhLTWuzSeApE3iki10CjEfM87TSZZ2J1q
 rr07NHC+JtYVkjY6Lgs/6sO6osoEayVY+ZD3erTzL5i/MqVJof4EnsJsVqjq5ENeJqboA1KkULl
 50qmaLcHQbiSod7Q/zdHi2bH4aP2f+0CyZJjQN1HSXhPLzYmT6ffohrYXkKGV5n16WE0DHE7Qeo
 BxOT2qGOzq16cF/X7q9dmDrZ0H0nk7stQNIkD8lpt/XMEZlUb80Oer7NJDKPKKpGujqu9YaZD4k
 k83JnfZSrP8UQQq1n0EE0ddPyGJvYK+2eIH7ELirrfkup4Gt415FWuZuD7V0j2IvGWKLABHGJfc
 dw05ylSWyoXP9XKeJhrC1Fo8XXAtOlmp9/WWqEoZk2djLNuyUmtXK0SUEso4/95WJpnndwELuM0
 HZqok4L2ajjNVmyHg5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfXwJKUBl8m+1s2
 LtP0jq48QpRpbjm/md/C5lxFUaWSzhdZc3BWwTebpYvBfxhk9/W79UmtTy9wMEKLv4IDAflf8lU
 uaTmhAyGU2BbcigfdrQSucgFPP9XICc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_014334_010267_7FBCF8BD 
X-CRM114-Status: GOOD (  37.64  )
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

On Fri, Jul 31, 2026 at 10:29=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> The way power sequencing works means that a call to pwrseq_power_on()
> does not necessarily result in the pwrseq target being powered-on at
> that time: it may have already been powered on before. Similarly: a call
> to pwrseq_power_off() does not have to result in an actual powering off
> of resources: there may still be other users that requested a power-on
> before.
>
> We will also introduce the concept of "non-controllable" pwrseq targets
> soon which further increases the disconnect between the naming
> convention and the actual semantics.
>
> What consumers of pwrseq descriptors actually do is: they *vote* for a
> powering on of a given target or retract that vote. These operations
> could be called get/put in line with runtime PM but this could become
> confusing since we already provide pwrseq_get/put() for a different
> purpose. pwrseq_vote_on/off() also have been rejected as unusual in
> the tree.
>
> Change the name of the two functions to pwrseq_enable/disable() which
> better reflects their purpose and semantics and also mirrors other
> enable-counted resources like regulators and clocks. No functional change
> intended.
>
> If at any point users need to know *when* the exact power event happens,
> we can provide that information in the form of a notifier.
>
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> I've floated the idea to rename the two pwrseq functions from "power
> on/off" to "vote on/off". I've sent a patch but the overwhelming
> consensus seem to be that enable/disable naming is preferred.
>
> I'm doing it in a single commit that should go through the pwrseq tree
> with Acks from subsystem maintainers.
>
> [1] https://lore.kernel.org/all/CAMRc=3DMefxn81d0VUwmQgwFtffkL1=3DEr_1VQZ=
CbC1Sa-Qph4t1w@mail.gmail.com/
> ---
> Changes in v2:
> - Change the naming convention to enable/disable
> - Link to v1: https://patch.msgid.link/20260727-pwrseq-vote-rename-v1-1-a=
2029aeeac65@oss.qualcomm.com
> ---
>  Documentation/driver-api/pwrseq.rst      |  4 ++--
>  drivers/bluetooth/hci_qca.c              |  4 ++--
>  drivers/gpu/drm/imagination/pvr_power.c  |  4 ++--
>  drivers/net/wireless/ath/ath10k/snoc.c   |  6 +++---
>  drivers/pci/pwrctrl/generic.c            |  4 ++--
>  drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c |  4 ++--
>  drivers/power/sequencing/core.c          | 16 ++++++++--------
>  include/linux/pwrseq/consumer.h          |  8 ++++----
>  8 files changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/Documentation/driver-api/pwrseq.rst b/Documentation/driver-a=
pi/pwrseq.rst
> index ad18b2326b689a41471216f3889480b11768ca82..0c315ab1138b02540fae60b39=
928c580027c0f7c 100644
> --- a/Documentation/driver-api/pwrseq.rst
> +++ b/Documentation/driver-api/pwrseq.rst
> @@ -50,9 +50,9 @@ Consumer interface
>  The consumer API is aimed to be as simple as possible. The driver intere=
sted in
>  getting a descriptor from the power sequencer should call pwrseq_get() a=
nd
>  specify the name of the target it wants to reach in the sequence after c=
alling
> -pwrseq_power_up(). The descriptor can be released by calling pwrseq_put(=
) and
> +pwrseq_enable(). The descriptor can be released by calling pwrseq_put() =
and
>  the consumer can request the powering down of its target with
> -pwrseq_power_off(). Note that there is no guarantee that pwrseq_power_of=
f()
> +pwrseq_disble(). Note that there is no guarantee that pwrseq_disble()
>  will have any effect as there may be multiple users of the underlying re=
sources
>  who may keep them active.
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 345f602e9ce233a0934a73a85d1e7c17c4f3210d..e713fc06b73402ae3d57794ed=
0870df8394a796a 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2259,7 +2259,7 @@ static void qca_power_off(struct hci_uart *hu)
>         }
>
>         if (power && power->pwrseq) {
> -               pwrseq_power_off(power->pwrseq);
> +               pwrseq_disble(power->pwrseq);

Nit: s/pwrseq_disble/pwrseq_disable ?

>                 set_bit(QCA_BT_OFF, &qca->flags);
>                 return;
>          }
> @@ -2319,7 +2319,7 @@ static int qca_regulator_enable(struct qca_serdev *=
qcadev)
>         int ret;
>
>         if (power->pwrseq)
> -               return pwrseq_power_on(power->pwrseq);
> +               return pwrseq_enable(power->pwrseq);
>
>         /* Already enabled */
>         if (power->vregs_on)
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/im=
agination/pvr_power.c
> index a71d5b35601e7b996428312028a4c0542a5b1350..031fad8adf4f4843e852000d3=
d6ba45d0e4b0aeb 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -352,12 +352,12 @@ static int pvr_power_init_pwrseq(struct pvr_device =
*pvr_dev)
>
>  static int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev)
>  {
> -       return pwrseq_power_on(pvr_dev->pwrseq);
> +       return pwrseq_enable(pvr_dev->pwrseq);
>  }
>
>  static int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev)
>  {
> -       return pwrseq_power_off(pvr_dev->pwrseq);
> +       return pwrseq_disble(pvr_dev->pwrseq);
>  }
>
>  const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq =3D {
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireles=
s/ath/ath10k/snoc.c
> index 3106502275781d32d17a45a661362206144df6b3..d7e23971fe1da99f6b5f7559d=
62d04e2044d8950 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1025,7 +1025,7 @@ static int ath10k_hw_power_on(struct ath10k *ar)
>
>         ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
>
> -       ret =3D pwrseq_power_on(ar_snoc->pwrseq);
> +       ret =3D pwrseq_enable(ar_snoc->pwrseq);
>         if (ret)
>                 return ret;
>
> @@ -1042,7 +1042,7 @@ static int ath10k_hw_power_on(struct ath10k *ar)
>  vreg_off:
>         regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
>  pwrseq_off:
> -       pwrseq_power_off(ar_snoc->pwrseq);
> +       pwrseq_disble(ar_snoc->pwrseq);
>
>         return ret;
>  }
> @@ -1060,7 +1060,7 @@ static int ath10k_hw_power_off(struct ath10k *ar)
>         ret_vreg =3D regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->=
vregs);
>
>         if (ar_snoc->pwrseq)
> -               ret_seq =3D pwrseq_power_off(ar_snoc->pwrseq);
> +               ret_seq =3D pwrseq_disble(ar_snoc->pwrseq);
>
>         return ret_vreg ? : ret_seq;
>  }
> diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.=
c
> index a7e599d841e6289db161b19a93ba5a61d9e0ab1c..d366883355173eac1a2631b73=
e5e041666ac23ad 100644
> --- a/drivers/pci/pwrctrl/generic.c
> +++ b/drivers/pci/pwrctrl/generic.c
> @@ -29,7 +29,7 @@ static int slot_pwrctrl_power_on(struct pci_pwrctrl *pw=
rctrl)
>         int ret;
>
>         if (slot->pwrseq) {
> -               pwrseq_power_on(slot->pwrseq);
> +               pwrseq_enable(slot->pwrseq);
>                 return 0;
>         }
>
> @@ -48,7 +48,7 @@ static int slot_pwrctrl_power_off(struct pci_pwrctrl *p=
wrctrl)
>                                                 struct slot_pwrctrl, pwrc=
trl);
>
>         if (slot->pwrseq) {
> -               pwrseq_power_off(slot->pwrseq);
> +               pwrseq_disble(slot->pwrseq);
>                 return 0;
>         }
>
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c b/drivers/pci/pwrct=
rl/pci-pwrctrl-pwrseq.c
> index a308bf4b5fc01d23b75db4cd396201c3ba3fe695..2a6f46f6e2012dd985b657c97=
c85879ba13b5133 100644
> --- a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
> @@ -56,7 +56,7 @@ static int pwrseq_pwrctrl_power_on(struct pci_pwrctrl *=
pwrctrl)
>         struct pwrseq_pwrctrl *pwrseq =3D container_of(pwrctrl,
>                                            struct pwrseq_pwrctrl, pwrctrl=
);
>
> -       return pwrseq_power_on(pwrseq->pwrseq);
> +       return pwrseq_enable(pwrseq->pwrseq);
>  }
>
>  static int pwrseq_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
> @@ -64,7 +64,7 @@ static int pwrseq_pwrctrl_power_off(struct pci_pwrctrl =
*pwrctrl)
>         struct pwrseq_pwrctrl *pwrseq =3D container_of(pwrctrl,
>                                            struct pwrseq_pwrctrl, pwrctrl=
);
>
> -       return pwrseq_power_off(pwrseq->pwrseq);
> +       return pwrseq_disble(pwrseq->pwrseq);
>  }
>
>  static int pwrseq_pwrctrl_probe(struct platform_device *pdev)
> diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/c=
ore.c
> index 02f42da915985339d3de507fc36dd158b0035a99..34d5c0af6f37bdbfa9d656d95=
795d38cc7e38762 100644
> --- a/drivers/power/sequencing/core.c
> +++ b/drivers/power/sequencing/core.c
> @@ -708,7 +708,7 @@ void pwrseq_put(struct pwrseq_desc *desc)
>         pwrseq =3D desc->pwrseq;
>
>         if (desc->powered_on)
> -               pwrseq_power_off(desc);
> +               pwrseq_disble(desc);
>
>         kfree(desc);
>         module_put(pwrseq->owner);
> @@ -874,7 +874,7 @@ static int pwrseq_unit_disable(struct pwrseq_device *=
pwrseq,
>  }
>
>  /**
> - * pwrseq_power_on() - Issue a power-on request on behalf of the consume=
r
> + * pwrseq_enable() - Issue a power-on request on behalf of the consumer
>   *                     device.
>   * @desc: Descriptor referencing the power sequencer.
>   *
> @@ -887,7 +887,7 @@ static int pwrseq_unit_disable(struct pwrseq_device *=
pwrseq,
>   * Returns:
>   * 0 on success, negative error number on failure.
>   */
> -int pwrseq_power_on(struct pwrseq_desc *desc)
> +int pwrseq_enable(struct pwrseq_desc *desc)
>  {
>         struct pwrseq_device *pwrseq;
>         struct pwrseq_target *target;
> @@ -925,14 +925,14 @@ int pwrseq_power_on(struct pwrseq_desc *desc)
>
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(pwrseq_power_on);
> +EXPORT_SYMBOL_GPL(pwrseq_enable);
>
>  /**
> - * pwrseq_power_off() - Issue a power-off request on behalf of the consu=
mer
> + * pwrseq_disble() - Issue a power-off request on behalf of the consumer
>   *                      device.
>   * @desc: Descriptor referencing the power sequencer.
>   *
> - * This undoes the effects of pwrseq_power_on(). It issues a power-off r=
equest
> + * This undoes the effects of pwrseq_enable(). It issues a power-off req=
uest
>   * on behalf of the consumer and when the last remaining user does so, t=
he
>   * power-down sequence will be started. If one is in progress, the funct=
ion
>   * will block until it's complete and then return.
> @@ -940,7 +940,7 @@ EXPORT_SYMBOL_GPL(pwrseq_power_on);
>   * Returns:
>   * 0 on success, negative error number on failure.
>   */
> -int pwrseq_power_off(struct pwrseq_desc *desc)
> +int pwrseq_disble(struct pwrseq_desc *desc)
>  {
>         struct pwrseq_device *pwrseq;
>         struct pwrseq_unit *unit;
> @@ -966,7 +966,7 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
>
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(pwrseq_power_off);
> +EXPORT_SYMBOL_GPL(pwrseq_disble);
>
>  /**
>   * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
> diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consu=
mer.h
> index 3c907c9e1885dc2958043a9a733fbe20bdf95f6e..5e94b0b9c38b036fc40e3e2c8=
c6e1020d0d0bb6e 100644
> --- a/include/linux/pwrseq/consumer.h
> +++ b/include/linux/pwrseq/consumer.h
> @@ -20,8 +20,8 @@ void pwrseq_put(struct pwrseq_desc *desc);
>  struct pwrseq_desc * __must_check
>  devm_pwrseq_get(struct device *dev, const char *target);
>
> -int pwrseq_power_on(struct pwrseq_desc *desc);
> -int pwrseq_power_off(struct pwrseq_desc *desc);
> +int pwrseq_enable(struct pwrseq_desc *desc);
> +int pwrseq_disble(struct pwrseq_desc *desc);
>
>  struct device *pwrseq_to_device(struct pwrseq_desc *desc);
>
> @@ -43,12 +43,12 @@ devm_pwrseq_get(struct device *dev, const char *targe=
t)
>         return ERR_PTR(-ENOSYS);
>  }
>
> -static inline int pwrseq_power_on(struct pwrseq_desc *desc)
> +static inline int pwrseq_enable(struct pwrseq_desc *desc)
>  {
>         return -ENOSYS;
>  }
>
> -static inline int pwrseq_power_off(struct pwrseq_desc *desc)
> +static inline int pwrseq_disble(struct pwrseq_desc *desc)
>  {
>         return -ENOSYS;
>  }
>
> ---
> base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
> change-id: 20260727-pwrseq-vote-rename-b7cd21032668
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>


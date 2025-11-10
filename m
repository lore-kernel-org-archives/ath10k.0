Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC36CCFA13
	for <ath10k@archiver.kernel.org>; Mon, 10 Nov 2025 20:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTlua583S/dZeMaixdSpGWSBTXZiJ388iplr0b/Hmng=; b=eJ8mA+ugd/KZSgw70TESvjUj7A
	WaVWF38KcJV8HtiEzN9G+NTmYPN3q3hyxBL97ioRRIH0/WAvqcTOaNQkRW/JD/bJHkAGDxMD8pF/s
	DV1Ng6FiYxMDSB4Y76FmnVGgCFoFe8kbFz2xe4Sa/hR5wATKJub77nDPdYtRYDtLyAR14cVqXvxnW
	k5Ugo+msGr1D3rd4d352Aggudmn/p2eR14fWza1CA1erBrgoEr6AmfY4S5T687pWi7TjW5IX+zbTy
	HOYw/4osm+w8Z8Q1/roU/PROc/dtxTqkZMXjbtnuUqT9yPgwL47Q2sOKBTD20Y80eucYpHIV1Rbt4
	vWUHqtWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYhW-0000000673f-3LQC;
	Mon, 10 Nov 2025 20:41:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYhT-0000000672s-3C9G
	for ath10k@lists.infradead.org;
	Mon, 10 Nov 2025 20:41:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFhSPD3985047
	for <ath10k@lists.infradead.org>; Mon, 10 Nov 2025 20:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FTlua583S/dZeMaixdSpGWSB
	TXZiJ388iplr0b/Hmng=; b=Xi1eYA8c8AvO0xpHrOwV5GyBJ98PFSY7Q09j9c+a
	H6bNYBq6Hl0wzrSvTplecqVfHJ5kkeCshwl66zQEU1UjGcgTPiJGCBufeYtT0SMC
	EWZh6xwq36HBPytwpVY5KXc7JAeufYjTQTkxxXX8+G8DhZpvu6YOv0U8vbdODPj/
	H0/bGby+bccYNUHstKVfyyUe0yBxa4YD14Zelyr2+/P9xmcJvHMG7wYcEPOP2HJr
	gIQcRyWz6GLFmZQbk0MXDI8Zl6Whn5uv2UUldnSf5FwM1lCvILAt3kQ+RUSjqalA
	PArADd/4uZHCw6lDj0HD+jIVnP7V1tPmebniWdt41fHtLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjxqgvwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 10 Nov 2025 20:41:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb35b1147so46081301cf.0
        for <ath10k@lists.infradead.org>; Mon, 10 Nov 2025 12:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762807278; x=1763412078; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FTlua583S/dZeMaixdSpGWSBTXZiJ388iplr0b/Hmng=;
        b=dAIgkxiBCJlcfn1HE4xIpGuDU1v8voh+MPNF2G3842DkW4FigiuomM5F/HgeMztVY8
         y4UU7PIPsHtLktec90FU2n3I0jr07czdEUAEdL2i1kmBzZL+FVCBLchN4TdKDHzs+bG+
         p7qV5PA0LmMo9D2Pw07LaGfzqyVhe2ExSF0IV9tBiRrZr5wdBQo3x70D8DwxnYI2dUF9
         4WcTgY448HVSVaObMLx9T21O4KyyqicKPfHX+h3HrfNbqD1k9gDByafXihYRw/io0a7I
         S4OKdSmJl+ADjxbCg/XTkHn/HcHQZNkk8V1D6McdD9vZc1Oyit/fRsNVbcTwuD4NVBml
         09RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762807278; x=1763412078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTlua583S/dZeMaixdSpGWSBTXZiJ388iplr0b/Hmng=;
        b=cCvY/kj/etXsc+avF1pSa9JGsVKGjkxn+gcV1iFppRKboYlx9W9QOVGHZn4dqY/hyV
         k1ey0qUcNeERHnU3zy411Veg1oY+Swu8Uo52pYNVfsnTFE9BZYHkl6W0pOop5NvzXshP
         yeGWsLqaOvUnZClGLEH/nVnMNI0uSq3EQF3ALoCaU49rmwdpL5OfPE0FDpxcrNoFkbA4
         V4XIMnhkjLUCzj/V9+LukXxq4+VDdpeRplIQn+NUX2P+0wom38fJ9qkt9TpNE6sEQhaw
         BpCHqi1b8DzYNAFNeVfFt6WwTif8+XTNIhUxjEXHYjhOHIkwHjHE2/3RKGeM/HqF8haf
         YkNw==
X-Forwarded-Encrypted: i=1; AJvYcCX8T9hXD9IHy4KdMo/VzHqKWzJltgYGD1b3fZNvQFZquhWIXU+H1TAfLEbm2MhuO1ldexkz06A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxesHZ2a0Z8WzKl/i3q/+e77aFIDtYdKZUYWyhdrdxi3dAYWaWh
	7xG878klVvqqVQWX3kBhJI+yqkCfdz1JNizxSFCRS+Qeu8pR53OhFS/bFPOZZSN6XkA4k+8aT+L
	974WU9bPF6TjQQRCU+2fMYBadapAxP95au238ykquWnNcQBlQ5JcW0UJ8oN1DLDrf
X-Gm-Gg: ASbGncvFCY+O1ANqqEcp4auJTl6LDlpHztQN5HiourAotOiZZfb/e0zEGv4yUyeV8hQ
	XOwCWIITuvGYPmMQrQKM1EVyj5Z2uxggQza6lzogHz/dIljIPORn9wGpZ5oAYsCVwdq5ioF4D7c
	VLFuiW9JF968iRuP0gHIFSQ8MLzQcVKLjfWhta5v1oTr50u1vtcvXONOYRiihUhLUayuHet0hks
	Z65PKEZcnXjFF3XVQ0I/zSi8uF7DddDd8vaqV4vKmof8IRD6smcPD8eklpLvXgThrEb9rZ6WGiq
	XvtGvLrs42cXJYbVw494GJuyiif+TozlGvShrjSNlpa9P84RnZL1MBMJ3ClSb8VjWu2SBTltb67
	bQ8T9ypErL5bJFbWDqWOGuCAvjaORRdUYgndgLHgTUYwKvpoftKaXD4fYk+AN2OMA/I5FC+yEno
	9MuH+kkUqx8hxk
X-Received: by 2002:a05:622a:180a:b0:4ed:68ec:ef0b with SMTP id d75a77b69052e-4eda4fb503amr123049611cf.65.1762807277769;
        Mon, 10 Nov 2025 12:41:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElUDq/y44gjPvRzLfM/ZwtkC9odeJSaAhtGvVNGQ4FaNWkS5GBSU5BWkELW6/a5ap9d7GDvw==
X-Received: by 2002:a05:622a:180a:b0:4ed:68ec:ef0b with SMTP id d75a77b69052e-4eda4fb503amr123049271cf.65.1762807277332;
        Mon, 10 Nov 2025 12:41:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0fdd55sm36895631fa.52.2025.11.10.12.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:41:16 -0800 (PST)
Date: Mon, 10 Nov 2025 22:41:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v2 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
Message-ID: <ttka4uevai7tzf4c3r7rgozzpd3hsdhjzf5uyysfzj24ex2o2v@r64z6pvxb6sv>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
 <2b34ceae-5e31-4dba-93e5-3fa35754fab6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b34ceae-5e31-4dba-93e5-3fa35754fab6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE3NiBTYWx0ZWRfXwn9+cfk6mMxe
 a2hlvsAAT96pNQLCx8gZ4tNJonj1HRkO98tJBWdqh6sniCcRmTSWbE+2URd2LmUMN7PiSmi5/Ro
 2UfoXgD6OG3d+0mpPLHd/lTPFtYsQ+vJfR/UE+MoDYb4hEhkmOvW7rGFHJcQEC51RdJOO8719IM
 iG3ZXoWndEypMstMGwFq8GOQ59OOz1mHBYzSrjfDOiYuYMkkFD07M1r+VLVDULa/6nfYvwKF6r5
 dUTBVB55kR4/CwEJJ6X0JpTKt5kZhRAoO3rRpT2/nWlx1k/m8/nfF0A6O3nZhgSlB+eLGcONmGt
 8tYXzjRbqvzUbijwPW9Aqc3ZPPsd5zSokDkWoPyP+aPrLWvWj0UpWrtIDrgCvLaVDuMV4P4iMpv
 1maCRi2qmsnXYF8FcIyp9tSGDFeF8A==
X-Authority-Analysis: v=2.4 cv=CsKys34D c=1 sm=1 tr=0 ts=69124dee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=p0WdMEafAAAA:8 a=yp1dWoDyaxJPrsKXCeAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-ORIG-GUID: irNghLWx33zWHROqkgtuxemfxH7VQ4L6
X-Proofpoint-GUID: irNghLWx33zWHROqkgtuxemfxH7VQ4L6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_124120_089527_306C53EB 
X-CRM114-Status: GOOD (  30.67  )
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

On Mon, Nov 10, 2025 at 12:04:30PM -0800, Jeff Johnson wrote:
> On 11/10/2025 6:26 AM, David Heidelberg via B4 Relay wrote:
> > This quirk is used so far for Xiaomi Poco F1.
> > 
> > I'm resending it after ~ 4 years since initial send due to Snapdragon
> > 845 being one of best supported platform for mobile phones running
> > Linux, so it would be shame to not have shiny support.
> > 
> > I'm very much open to suggestions how to solve this in a different way,
> > as the original discussion thread got quiet, see
> >   https://lore.kernel.org/all/b796bfee-b753-479a-a8d6-ba1fe3ee6222@ixit.cz/
> > 
> > There could be other devices in need of this quirk, but if they're not,
> > we could make it compatible specific quirk.
> > 
> > Until merged, available also at:
> >   https://gitlab.com/dhxx/linux/-/commits/b4/skip-host-cam-qmi-req
> > 
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> > Amit Pundir (3):
> >       dt-bindings: wireless: ath10k: Introduce quirk to skip host cap QMI requests
> >       ath10k: Introduce a devicetree quirk to skip host cap QMI requests
> >       arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
> > 
> >  .../devicetree/bindings/net/wireless/qcom,ath10k.yaml       |  6 ++++++
> >  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  2 ++
> >  drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
> >  drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
> >  drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
> >  5 files changed, 22 insertions(+), 3 deletions(-)
> > ---
> > base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
> > change-id: 20251110-skip-host-cam-qmi-req-e155628ebc39
> > 
> > Best regards,
> 
> The original thread predates me becoming an ath.git maintainer.
> Just for my information, is the firmware and board files for this platform
> available in linux-firmware? Or does it leverage the files already present
> from the original (Android?) installation?
> 
> I ask because the alternative solution suggested by Kalle would require
> modification of the board file on the device, and that seems more of a hassle
> than just modifying the DT.

I think this should go to the firmware-N file. SNOC platforms now allow
per-platform firmware description files, so it's possible to describe
quirks for the particular firmware file.

> 
> So I'm personally OK with this suggested approach.
> 
> /jeff

-- 
With best wishes
Dmitry


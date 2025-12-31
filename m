Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC47EE6428
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 16:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68Auck60GyYj13jsQrKu1d0pmyBuLZkKakUCDN+kvEQ=; b=xEAJNi3H/CAP7NNr1g2rBhW20H
	AU6hfUqbCLBq+tmNniOcTHD+EzHiEJ6/hhDDaoQGpfXq2rS1KDUliq75+D/kaYSJ2M4IDpjHv+ySS
	qXbLaLEIY2zRdvhwTlVbLyzi1T0V3oln7rEl3MhssWWfcVah3lDNHmGB7flKw/419rGDfFGc0wy88
	S4NkvwT9q57gdyNKgcTaNrrkQ/aEvz5MMzQNKXBkQkpbZSbG2mGFBRtB+TG6yrb8KDYeKQ/JoqsAM
	QdyXD3lOBiZ5N8XfLMIXepLnoYGmoVv9BsysIX9iwzUAkrkV72qfTLCTTWWduE8U91A4eCunR+p0j
	OjbLzffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayvb-0000000680h-3uNR;
	Wed, 31 Dec 2025 16:20:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayvZ-000000067zy-1Bfa
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 16:20:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAi4Ys3367077
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 16:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=68Auck60GyYj13jsQrKu1d0p
	myBuLZkKakUCDN+kvEQ=; b=Y56WiDHy7zvU0OWvNzDvl3lFHBxgcjngMAAiMLl1
	+0lnLb+eNZ0BAQ+EAwqgX3EBHGSZnAKY4yPPdKbQxB/Mlu8vJ94/SJwlimPu0khg
	1R0TOG82MaUTqqWMyrUnGtLDUI5BtEn1DjeG8gVTs2XpcxtVrWi5HKPvq8ogxbz7
	8hxan3I7pKUMR2SUGZk14S1YgMCGYEuahfTmFnCTOgkCiXRW+q1K4ufkf4LonRUI
	K9hEUpmLOIT7lBgpFoJx5to/ei9oYHx14W9+lH28qlfG2UgC2zGPOsV3ISBsjBBR
	80A7/vyQ1UEH8qapElypV71/OBFAHyjDjPZtytge8VRmZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb0gsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 16:19:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edad69b4e8so230545141cf.1
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 08:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767197999; x=1767802799; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=68Auck60GyYj13jsQrKu1d0pmyBuLZkKakUCDN+kvEQ=;
        b=MgZzKtPN4TPCnf8Ouv72Gq3UAT5rx7iUTt/wqbhnzGZYNuVnKMaDk1qIKkEo3xQGd4
         4u4oOFGpgiLk+ULB0/yhlNnT5sg8ZI35dt7qXTKq2pa0ImR3NdIIjuAm9qm1WsbUjOKE
         5B+uePIiGqq3WXdjY2W7NfRc5jgxPp1d1CtE8hWQh0KZp/gzIIzrBshEk0N/7MvxBCOR
         xYu/J7leV02iyaAIf1ELmeAeXDB1CyKJn6ePo8+Ge+z2XdbV8vzG8Ld9sVjV7PcJFOcG
         Pvn8T5JG4GGPcF1riKo3YHIfOpHkLPuG6OCptX8M6zWl/1s1A/mHZfIEW433f+BCGe1U
         xrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767197999; x=1767802799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68Auck60GyYj13jsQrKu1d0pmyBuLZkKakUCDN+kvEQ=;
        b=sS2578X0i2WPK8c5wV8cHwBsdfkJfoOGHahnnPBzlrJeca97RbDkXDOhoF2a4N4mBk
         c8GxPQ98g2ptMpNMf6J5rDj2Vl2WB7cYFYHGxbaO5q8yNjIW/euGQOt+dkP/lXG3UzI8
         sWFD9hKa1/RYjMNHy86W+6RktSNu2/vhk+zB7YgafsWagouRO7NEIQRojrAl8x7XgPjZ
         CCYopIhmsQvWuwRfrId/JcylHVL8pVmIhBhScjoVeOZ16uyF3MDHrFniBABIrs2j5ujY
         oH/o9Kgb6sOKr8g00rlzg5TNwqqjsdQ7EBMmoh1ZB0VkpCA5YWnDQVXUOBl9YBZmIJx7
         V96A==
X-Forwarded-Encrypted: i=1; AJvYcCXkzYIcghMwJBUjWLga4j8Pd3LS1Rl9uRVTD71DAliJcBnCVhP54mNasmKd+GTNooZMh28jxg8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBCRBA7KzJlNv3DhmNFVKHjnCoAwYAS7I97FnIDpsFEVMgVxdW
	trsK4w6ROz0TB7a/eU2QH4I+QLMwUPKEpHDZRkz16yjH+plzFTxnrQK1KuQw3Moc0XJc7C6E8cP
	CNBk0nY/f+TjIGUHgW3jD7oJlsKtAAX7DSphfpIwfM/MrP4mRJSfAlC0Ciw8TnvcG
X-Gm-Gg: AY/fxX6WRG5R6Uu4zY2vYAWTK9UH9sbyFvaZxV3acWk3m6mJrZV+qCL4ft33oLgENAa
	98UdoAWUgy7jCd+9Oq+2rMc86GHCvKoXULY3tbn+oMPoHzV0LGLlTgVsuNZWS4FQW0znqG9d7KS
	+VssjUKIOvP6bJgvuYtBeu7DeQzsHGAxJLhDC3GXl4m7nir3KhL3YR1Piee3DOWKZlMnCAyKNsy
	KCbFKaLYzKYCCMEfcxGl/Wq3PiuVWdQ4wCRs02RZkwoXkJ7vb3+Ny/rwXeHOL4diw84K0ngW853
	NcFc7E528ppB3sDsYwBjvjkWseO/RhzV5iI2n5vJ+e8dnX9HFk5zRfejdAxMrj1VlP3jFadPc0O
	fh02RgVCDirfhLtW4eIweSMpJUMm065PVexMXsOcgtohD8fS0UGoqaq3hi8/xrKESBODgM0lCNQ
	4Olw1NQdZPB0iA48g0eiS4Dqo=
X-Received: by 2002:a05:622a:510:b0:4f1:c1d5:e37e with SMTP id d75a77b69052e-4f35f2b5da0mr569786101cf.0.1767197998979;
        Wed, 31 Dec 2025 08:19:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTdCBy+pVg+IDVoeUL7VU7D/QmJWesvdotmIF1p1sLqgL4Z+uXs6v2Khhhh/si8HOFeLlgxQ==
X-Received: by 2002:a05:622a:510:b0:4f1:c1d5:e37e with SMTP id d75a77b69052e-4f35f2b5da0mr569785601cf.0.1767197998547;
        Wed, 31 Dec 2025 08:19:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10855511e87.86.2025.12.31.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 08:19:57 -0800 (PST)
Date: Wed, 31 Dec 2025 18:19:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 08/14] arm64: dts: qcom: sdm845-db845c: specify power for
 WiFi CH1
Message-ID: <brzdqbu3uiy3gd5a2uyzcgx24wvuhjrrs3fs5b4qbnj5jvmra3@rfbiy5kgwlbn>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-8-1ff4d6028ad5@oss.qualcomm.com>
 <ab7d6780-4328-4c77-9133-402dd1c4fcaa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab7d6780-4328-4c77-9133-402dd1c4fcaa@oss.qualcomm.com>
X-Proofpoint-GUID: I7XCZR4Wz77QRUFPvUrz1DYrO3l1nHo-
X-Proofpoint-ORIG-GUID: I7XCZR4Wz77QRUFPvUrz1DYrO3l1nHo-
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=69554d2f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VsWXYa84w75D6ua-j4wA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE0MyBTYWx0ZWRfX5epcYbavNEoG
 INW9jDW58gLQYQvGFbnKC9g2sqtLz/zrCGzByL+BdJhmBTfKI++zG1lnPRVYt5gQHvaCgj0zc5e
 tKBwr1AyIRfdBZpM5GGLdGA/qtrmARTeTas9wYD/1YUijdzSv9om6yDR1Z8sYg75w+xoS+PsyHR
 TgrVlZeYn5n1nT2C0zlaP46R1cGb1BKZRtqmVAhRMNR1edyeSBZgfyBrVyaBSyIbjg71PJvq0OK
 WLLfBmEUyRShCfiJ58SX3CP2PuxSiWICKggUFKZAcafV6NpuTMTNDTBhXg08YiNK9nBwjhwHl7Y
 HY9yvLcCR9CiDnFVp49q91PZfwKJ9yNTMC2NrQQ0nw4NtIjlcbgRnI+mdtsRSyMrOVSzXDgkBtf
 W5mEIi6dYw6zIwLBsLXiGeRK4oq6v/mJev14s7bMVmO1C7yGE1eUrVqrD6+8zpP4FuyBWpFmjBf
 7pzaYMdY5mGM9I07HJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_082001_470913_A8F3AC17 
X-CRM114-Status: GOOD (  22.39  )
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

On Wed, Dec 31, 2025 at 01:09:49PM +0100, Konrad Dybcio wrote:
> On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
> > Specify power supply for the second chain / antenna output of the
> > onboard WiFi chip.
> > 
> > Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> I don't have schematics nearby, but jfyi downstream doesn't do that

I checked in the schematics, it is L23A.

> 
> >  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > index ad283a79bcdb..5118b776a9bb 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > @@ -379,6 +379,12 @@ vreg_l21a_2p95: ldo21 {
> >  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >  		};
> >  
> > +		vreg_l23a_3p3: ldo23 {
> > +			regulator-min-microvolt = <3300000>;
> > +			regulator-max-microvolt = <3312000>;
> 
> Do we benefit from the 0.012V spread?
> 
> (i.e. is there anything else on this rail?)

I must admt jere, I just copied defition of the ch0 regulator. I think,
they should be the same.

> 
> Konrad

-- 
With best wishes
Dmitry


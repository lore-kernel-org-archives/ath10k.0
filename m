Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588F1EE645E
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKTh23jrXofXXT0Slbp+Ytpw7vST+8Ljsbw/o3S95tU=; b=Y59QuO+Ll9yDBr/cnlRPT5rGp0
	Xc7xvCymhh4DieN0VoyijEwMQNStL8gZrqilQfhNDluTXoijTWZfvyGaI8zuKFKKu41PeG6QJJ10+
	AmVojnWf7fPYylANEFZ0X5j37bmegtanH4qhdVAO4YJ6JyhQ+mOfkgxM4vjQU9Aj3Py0yStjZ/Q1g
	KZMdpfdFa7FaYWxtGg8NY4hLu7osiTytN9gEn+QBwfkMf8o32ewUkMCata9UwT0+9hUGIoC7Zao2Z
	nIo5eMbzV4V+SyA1EYb5MT1JSHeVbSXFWLwOsZwxgW7Qe57hxWGRyU7dwHnuE327Vu5ioqSwHNHJe
	TTHkiTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vazkc-00000006BLz-2Yl3;
	Wed, 31 Dec 2025 17:12:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vazkZ-00000006BLa-45du
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 17:12:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVB783R2778340
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 17:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IKTh23jrXofXXT0Slbp+Ytpw
	7vST+8Ljsbw/o3S95tU=; b=L0aOkgdiQKjso7SyBTq4kvMIAbSbVIP9T2qPp/sH
	RQpDkGDyySR/ljWanjJU4aEYBU2Nj+XP1Qv9c2GFnOdN/x0ssaXikLGhERcGWTER
	BPz8Fty8y8rscmAnWrwjbTdYTeyRRAtfj6p8/uU41r/LyqOqcuQ7o7ayXSYcD5+b
	J7A/hgmxgiIHInLx+1JLoF0SapllGp376Efga0toWZlMB+13zLnq25MQ1tWQ6UBg
	k7rK7WO59NYvpZ0yVT5f1Ato9KX6O6MqwtULDyCWzBpJvTIBCnj6TT4R+wFOIUVb
	/hMzkCnJILJdTEXed8zRzAtqW++F6H8PEg19KYmqAn+duw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky3x1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 17:12:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4ab58098eso266887021cf.1
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 09:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767201162; x=1767805962; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKTh23jrXofXXT0Slbp+Ytpw7vST+8Ljsbw/o3S95tU=;
        b=W2TSqPak+OY4hpslrQ7/5OtGExTBcqJdnohxxuzgWQ5rFwrg8rZ4gsJol4kNw0Vp95
         shfj9DCOkcisl62d0ZWcZlPEF69PD6+P/mkXsSyv1LJjhc+keMxGsmqHlFTuWaoE82cS
         6Bm6fbHnJ8FTRbSMttt4QqAhLBUk8AVX7pVJGpG4VlLT1HuW7lrDVIV1kFvBdKPr8nCB
         ie0BgAf3EQPu7f5XxIYmk60UoXFbVeyJPlEUT2wDORimY/XLgA645EEqgwiMoOcYK2Sl
         1wS5VVEV++XUJfVL3PW98F1HHkcOlGx019mG3RQzX67Yr4HVI4ZdX9gGMda66zKfiadc
         FqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767201162; x=1767805962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKTh23jrXofXXT0Slbp+Ytpw7vST+8Ljsbw/o3S95tU=;
        b=Y1Z+JUzQtGHyZ5aWi4i2e3bp9e2EXj/Q1a6wmJjqW+PW26vaZBihQ7VbeD2wmjVRJA
         OetLwqy7VrRV1IjF6u/CAeMtYcX72J0BK29SsRIlc6DLjYZeDglcGsm0/+UpPrfj6vOM
         325y4wdPEPPm5MdRld20p6FD3QnBGIvLNRgqavIaQ3TD67F+/qMKBAbk11K0qmt4711Q
         wWfu98WtBM9xxLYWXjmQse6vXkOyMuUA12GFLf0wU5ix9t0vitGztLKsVTt6H8Gadu9a
         r6OM68767DGFalkSX0hGnByI5z1poTFfLtQpqAlX9GV1w2F0mDhvCPyLbnTLdwcq6QEb
         VSfA==
X-Forwarded-Encrypted: i=1; AJvYcCVO4ifScTadHqWZtZyHHic0LqJjvwT1v78u2ioQHva0WPbLc0cWCDC7BFQCb1EAaAAyJvFKTC8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoYAUKe/pkClCyYvMfTS1gEWjYfs+VB/0wshvM+oAhhUXtKL5q
	8yO2qeXTRaqPB/sPNIhtgxCSKRPDHoAng4d5KljBXxNTGnLEd5TowYMexqPux6GuomKzWrxA/PS
	NQHMYiCVDGPxmBX7XE2LoLnE2uXHHvRdzo2/sSMSRQ5wckMZLd9c/8Kn6fKoGfQ49wXT4vpoL
X-Gm-Gg: AY/fxX7cR2L31pH5CArGK3ic1+d0QqaFYULho+D936E0GCH+vuCsopjNyXFw8G2etNg
	KDs3JhH8I/Ci3HHJNj7FZWRsL5k0IzXk7TSfE18y4bfIcUld+qgoyvO271EA7b9NJf330rtllRn
	wMstm1n86xDQb5n7m2DXTw9BgMUVbE0rc3yMmD/GKRafBthjRIbA3CjbE9PLni0YexpR4qwfZT5
	uAv9/HaEOrRx2Ep/23euJIhgmVCAoOyoIbEkWe+FR9+UksYRk+IvJaDitvPln3oUu2LFRy+EZo6
	lBR9c+vk1maM2l4Vp8WxTHCiedux0+Bm09hpxwpQF4+jJe/9a4ReEM9vrRahjQQNHfv/75+hxx6
	4fVqZV7IU5cIRYcLbkXsxMmhwgeC+qnD/hjZWRlumivCxju6r9xjLTt2MsNszDiidpztV2ONIin
	juD6QFFrbBITXm0XBQh2VKqPI=
X-Received: by 2002:a05:622a:1b89:b0:4b7:a680:2111 with SMTP id d75a77b69052e-4f4abcd07c2mr533470361cf.8.1767201161834;
        Wed, 31 Dec 2025 09:12:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFooM6E3T59ev8qt0Af3ld0+KnpikYOj66YFUfc6YqMoSrGQ5YeifZppFToljB8W/kglGPeNQ==
X-Received: by 2002:a05:622a:1b89:b0:4b7:a680:2111 with SMTP id d75a77b69052e-4f4abcd07c2mr533469851cf.8.1767201161301;
        Wed, 31 Dec 2025 09:12:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861ffffsm10965451e87.81.2025.12.31.09.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 09:12:39 -0800 (PST)
Date: Wed, 31 Dec 2025 19:12:37 +0200
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
Subject: Re: [PATCH 14/14] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT
 properly
Message-ID: <df7qz7oz5et7px3ghdfteuyiyistbrpei5tq62s6uwmzng4ols@gklfvzhbf7tm>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-14-1ff4d6028ad5@oss.qualcomm.com>
 <59f3db15-77f1-42eb-97e1-31129fdf363d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59f3db15-77f1-42eb-97e1-31129fdf363d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MSBTYWx0ZWRfX/517oHZdNK1R
 uN8nQau2MQFxkl7pSpZjGa6K7j5b3O++XN6iz3BqPZGq6qIGssdUe1qMlDU4hZ4WGi0PdlB8FMO
 tLioRmyIvwr6oPQLQP4hKVug//FCUINUSCwAics4FcFlgkNTmCFu6NbDAjXhBqrE+Y+7qbA4HwL
 i1GA+lqSC8W71knyTxxqchTEskMHyObxgt5mOAYWOA6fV2b7cEao3ug2Vy8dzDjp7ZQkn3gLMYz
 LZOS00NirNCZNjuIWT7paM8/l00c/vNRkey++ZVxRif6gnqBQjp/98DfJKjZcBFdoytW+Co+zp9
 ca7KMkw7Rg8M9sDE7iXifErdzNv/xFAF0p6dJWq/9FvtJv73igf+xhUaXrt4I5GnKBN+sOlpLbG
 dhAnTboh0l+4NOm1t9xUEGRjf8tOZJ9QwcXxGmWHjw6Bq3qjlmQjanXPHIUb1TRkvNVIHjIcJVS
 Ydmefm7MDocFNzuFgNQ==
X-Proofpoint-ORIG-GUID: r4xYxpCM7F7SAGGdcJ4WShe4hOFh2A1h
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6955598b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=uWyKjS0O6tEDB_qzV6sA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: r4xYxpCM7F7SAGGdcJ4WShe4hOFh2A1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_091244_022698_45D25762 
X-CRM114-Status: GOOD (  13.92  )
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

On Wed, Dec 31, 2025 at 01:16:30PM +0100, Konrad Dybcio wrote:
> On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
> > Properly describe the PMU present as a part of the onboard WCN3998
> > WiFi/BT chip. Enable Bluetooth part of the chip too.
> 
> [...]
> 
> > +	wcn3998-pmu {
> > +		compatible = "qcom,wcn3998-pmu";
> > +
> > +		pinctrl-0 = <&sw_ctrl_default>;
> > +		pinctrl-names = "default";
> > +
> > +		vddio-supply = <&vreg_s4a_1p8>;
> > +		vddxo-supply = <&vreg_l7a_1p8>;
> > +		vddrfa1p3-supply = <&vreg_l2c_1p3>;
> > +		vddch0-supply = <&vreg_l11c_3p3>;
> > +		vddch1-supply = <&vreg_l10c_3p3>;
> 
> Again, please double-check - I see UFS VCC is on this line too and I
> would guesstimate that antenna supplies may be separate

UFS VCC is L10A, while this is L10C. I've doublechecked the schematics.
L11 / L10 of PM8150L go to WiFi, L10 of PM8150 goes to UFS.

> 
> Konrad

-- 
With best wishes
Dmitry


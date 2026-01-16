Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A97C982D1
	for <ath10k@archiver.kernel.org>; Fri, 16 Jan 2026 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAhjhpP5g5sO71epspZ2mzNRfO/LIFwmhQneKuVWClY=; b=hXeCZV/e7MJQiZtYWvtiEEflmr
	9GetM2m3Wr9g36b3wkTxerx+9TixIqDYn8gDUgWmFNZRafO5sdFy1xat7UKY8ZdVZXDE82xiNFudg
	AS2HbQHhyjFKbCcoQninVOE5ECFBjqKcz7K0f8rNlioku+5hg2dQ+4TfFC+RKUuZgwAfm6g/VTkfN
	DLKRUYqdfbDGbSxORE1i3RYyCPyndODNVHDbJqmpUdu4AQUYCNC8PpjnYTxzp5SIP3DANpEA54JMn
	kVLuOtdEAkyBNH6oCpDMqEN2+XF3JkybOk9AGB6HKMyK+F3IlkdmyO8r2d4gdSw+PVHdBCa/pXF5Z
	ikeU7v/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgmtW-0000000ETzH-48Yv;
	Fri, 16 Jan 2026 16:41:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgmtU-0000000ETyu-1LcR
	for ath10k@lists.infradead.org;
	Fri, 16 Jan 2026 16:41:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDa1o71196678
	for <ath10k@lists.infradead.org>; Fri, 16 Jan 2026 16:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iAhjhpP5g5sO71epspZ2mzNR
	fO/LIFwmhQneKuVWClY=; b=i42Www/NdZN6LzItRHhs1lGNrTjUffsxmgdOuTcw
	SwXr0VTXaQvPOZiHg58VQdO49hyLYsnLXM7E+rCHPl4SrIn8z6NQKLMcuOhXkes3
	TSfQqynYD0YJHu+72n2CBiBFnTOsOusQI0IyRrjXjefyGsjDZ1Gi0i9ANX70CBi4
	4JXhaElFc8ikkOrLQUHj6AsmlP6g+5Y76wPEPtc8mDp4Hf2VQHkZWqsjR916DC2d
	D0X8EI+oE4s5NRc9NJ8DORM+sb9ob059Q7n7gdhoL1ohDTQmGuEd4ey0Wyk+HcPb
	mF6dj2VDj1QTQRqU5iEilTmhMRYZyZkxgtbmtrdmpEpoVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqpbr0hmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 Jan 2026 16:41:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c538971a16so504468985a.1
        for <ath10k@lists.infradead.org>; Fri, 16 Jan 2026 08:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768581711; x=1769186511; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAhjhpP5g5sO71epspZ2mzNRfO/LIFwmhQneKuVWClY=;
        b=JQZzHW/Y95B3nVQFBm8Tt6Zg/AXY9XpyZgvRZ+YFAiJYUZaIItmjP5loE7kXQwHt9A
         mOOjCa4bA+fW0RyKUBh0lt3oEOGJUxjCt8sRtwIsxKOBD47oZOjvcSd/nkAqDzusAMTw
         weq+Gig3xsz6o1COXFlWqbOpv4WDO+enWLMw7yB9YzeowwHftDVanXVKWXiBi8VLESY0
         uECUzbHOswElLph+JPT3O9f+3dsc/nXZ/L01l1BYY3tf3Bfj6TMqDXoBoop7IdplUbCe
         /HzgKMW1nY+Rc6Fzac0vtPdRJupT7gPHhFvcSsHvuQcMdxgCUoX/VKMa7UuUdYqbfcIs
         YTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768581711; x=1769186511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAhjhpP5g5sO71epspZ2mzNRfO/LIFwmhQneKuVWClY=;
        b=Plk6YrqDctPQ5NrlhiLc9PPDFnU4h6AecaP/GSwSKjVqSbCG4AChAyF3dbGx7JQlnj
         xXS95xYYjUm1/ANTkwHxHgt0V161Uv3dDFXiOZDWZ01t1OUAmfIw/JiN3gRWTX2CAEi3
         Jl8MJfc1nt4mdCAGXGFojgCNtxcXsRSNltmaNclshc+BkBTqiBmi7bCSas3+fPjXBAK7
         PfbrLibyBnfAWwezkx3BVhuj4kBSTGDgwrChF0cNNooOpmbzZZMhkR0Qp1itcwpDq8z+
         puAMLR85qv0caXl0CpkXEY2wrUOEnJQb0u/4VEMgk1jrzzpol/4ZoFGDHU3ps2gAUj1R
         890A==
X-Forwarded-Encrypted: i=1; AJvYcCUv80zWdk/F8hV/6lCdCgLgrUg6Q7Pdu/4IDBniBqVdD1GiphTuoL/9IAFLrP1qHiSZCNffomI=@lists.infradead.org
X-Gm-Message-State: AOJu0YybA2NkFdg8OKPDdY9FlU7MNPH/qiZ+KnH6/TTPC7KlCDJfGmHe
	TgLGlQbogzcKOiak2LndoQzARdao1WSwunQCtZMoLh/3tkK+iAMXnJR8khBsWdvZ1MI60SiN5gK
	LmXmcC4InTTfrzuF9Zf4/3kW5gw1D6uA8roOHeHQJewmkKR78LEEMoYGHdNgW0V8w
X-Gm-Gg: AY/fxX4ogkYtgPh1AhgeTUqTzRXkTlfLIySLwUZinNdsr9feIrqvHp7h/hpBbP9ozjq
	iW+/8d249WvQ6C/Rfay14nAa5uHelTS9wsfLSLp0ZqLTwtJEFqXAigIpOQyHqXHSzXjz5Cd93HM
	dPchJlTgGJ4oNRqQ5Q157HOEjHPswWBtNq9uI1W+72aDAcUJDDUUGpTSa5Y5L188SRKo1SPpNho
	csIcs6Kq+vq0Bo2sF2rKs7lDvOwlOXAMjHxTEcKAMBprJPsg2yvgCbCRWI5oItAdZMTUsSazMLn
	v1txfSbuautqv6Vh5+r+XRyVxEVPU/3QFII0sFFo3OUYmxGbOIk4cQB1fqUpxlGBa1y2vMsRTO0
	S8cTFr8Gp8llKqi/yQvRc8avzq3KSadRyzXXC3/CGX0KT5bCw1Minb1df8boMwvRgeMbRHI3q0U
	XHQARehJpaDxLUAnYmdkTminE=
X-Received: by 2002:a05:620a:f03:b0:8c5:e166:fa14 with SMTP id af79cd13be357-8c6a67a12c4mr475982785a.73.1768581710577;
        Fri, 16 Jan 2026 08:41:50 -0800 (PST)
X-Received: by 2002:a05:620a:f03:b0:8c5:e166:fa14 with SMTP id af79cd13be357-8c6a67a12c4mr475977585a.73.1768581710052;
        Fri, 16 Jan 2026 08:41:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a4ccfsm899874e87.99.2026.01.16.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:41:49 -0800 (PST)
Date: Fri, 16 Jan 2026 18:41:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/14] wifi: ath10k: snoc: support powering on the
 device via pwrseq
Message-ID: <d4ttsbhlw4c2fvgpfwgnc5mdh2egc6nwluj5pmkst2sunpn6m7@7b6by2eboob4>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
 <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
 <52b2b799-09e6-40a4-bea8-c7e8bf21cf51@oss.qualcomm.com>
 <15470b51-d398-449d-9017-304df5ad7cef@kernel.org>
 <132c34db-07c6-491b-bfda-f3c51462a184@oss.qualcomm.com>
 <f35b1380-b7d4-45e7-94ad-9f76973d3289@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f35b1380-b7d4-45e7-94ad-9f76973d3289@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEyMSBTYWx0ZWRfX/GJOC/OlgGQi
 nj+HhCvt2jBhagSygmST5l2gS2YAJoCKxVwumTFGZ/gESZbOyfKEJH/5hYdbheFzJx4sKECc2Is
 Y8Ge/gMrbi7yUxThWDRWX0FOdttilmIuUvew4pIvAclRxjQa4FkoXfY0wAyIF0qzErCH6qShGhE
 35v+AHQHaLCXjeSQw58Mpdzf0s2F4dhcqtEOwvnNXSfqITto70zaEzX/IhUqHjw5gIRaiMWUqMK
 DyHz2ion45FxOIJPEW4yEdDYhTvHaDiqZtiARs4xBsizlLA8JCxNrQqDKt95mU1flWT185yLOPR
 FMO41kuN8sNRr4fzpRA9RIwdVX95XshMHMpu/Kv/T/TQEhXDSbTcjVenFCzudfLJQ3xTtUWcV30
 gkQ3kWoUK2oLsSOy/lDEs85oPwYTdvqDcb6WQKuXGSNmUOXNj5+8ZLwIjs0vJjIki4WMaJI+LlV
 k88ORIA98F5yxnpT74Q==
X-Authority-Analysis: v=2.4 cv=dL6rWeZb c=1 sm=1 tr=0 ts=696a6a4f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d62U7F-bSLN4PTEm1scA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: kEzwSEfCc2PQA5O905Y_UFhtZnuDT9k1
X-Proofpoint-ORIG-GUID: kEzwSEfCc2PQA5O905Y_UFhtZnuDT9k1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_084152_482363_C3D5DE4B 
X-CRM114-Status: GOOD (  23.55  )
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

On Fri, Jan 16, 2026 at 05:08:58PM +0100, Krzysztof Kozlowski wrote:
> On 16/01/2026 16:18, Jeff Johnson wrote:
> > On 1/15/2026 11:48 PM, Krzysztof Kozlowski wrote:
> >> On 15/01/2026 23:30, Jeff Johnson wrote:
> >>> On 1/5/2026 5:01 PM, Dmitry Baryshkov wrote:
> >>>> The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> >>>> voltages over internal rails. Implement support for using powersequencer
> >>>> for this family of ATH10k devices in addition to using regulators.
> >>>>
> >>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/net/wireless/ath/ath10k/snoc.c | 54 ++++++++++++++++++++++++++++++++--
> >>>>  drivers/net/wireless/ath/ath10k/snoc.h |  2 ++
> >>>
> >>> My automation flagged:
> >>> * drivers/net/wireless/ath/ath10k/snoc.c has no QTI copyright
> >>> * drivers/net/wireless/ath/ath10k/snoc.h has no QTI copyright
> >>> * 2 copyright issues
> >>>
> >>> I'll add these manually in my 'pending' branch
> >>>
> >>
> >> And why is this a problem? You are not here to impose Qualcomm rules, bu
> >> care about Linux kernel. You cannot add copyrights based on what exactly?
> > 
> > I am a maintainer that is paid by Qualcomm to perform that role, and hence I
> > have a duty to enforce the legal guidance from Qualcomm when it comes to
> > contributions from other Qualcomm employees.
> 
> No, it's not your duty to enforce rules from some other departments or
> business units. Especially not without agreement of that person. You
> cannot just add copyrights to other people's commits just because you
> think that such copyrights should be there. Only the copyright owner -
> which you did not identify here and email address of contributor does
> not imply that (you don't even know what work contract a person has) -
> can add such copyrights.

In this particular usecase Jeff has enough knowledge about me and my
working place. I will have to resend the series anyway, but otherwise it
was perfectly fine for him to correct the copyright.

-- 
With best wishes
Dmitry


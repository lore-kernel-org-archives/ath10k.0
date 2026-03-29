Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26662F3D610
	for <ath10k@archiver.kernel.org>; Sun, 29 Mar 2026 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DRZhCEGAhiBuBP1YCe5luWOTveYo+3ES/uCRfsSr/U=; b=GWgMnQvWTN10wLKAqFr/i7mZL6
	k83lQdZA7Seix4DUfmbIirGLWHJKAEQzXcvaNchgIw5pfqueoTcOIPbL74PRU5rvWFCR6dfJVWDi6
	Kt6cr8gPf/fJj4Kme7KaPm/DtNyfJ8NBqhEKhnuQsLWZP7kg0Z/vDv7TXmKiCb0QlT6V94L6ozbtT
	yj2bOgAtCxXeqG9JbIgaN24xiyvY3j1frNVW8DmA2kcUOSKNu8XkSLDt2QNBXUiwOsw3zo9bAzOSa
	5eEaj78KV0XtvIZv6k6GBcWFX8O9bdXlit8njnYGOifQeZAj56yyouy8sxt6OtoqpAh1MPk3wqT1w
	GczNKMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6syn-0000000A6xs-2tqu;
	Sun, 29 Mar 2026 16:27:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6syl-0000000A6x9-2lAP
	for ath10k@lists.infradead.org;
	Sun, 29 Mar 2026 16:27:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhYgj201408
	for <ath10k@lists.infradead.org>; Sun, 29 Mar 2026 16:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2DRZhCEGAhiBuBP1YCe5luWO
	TveYo+3ES/uCRfsSr/U=; b=LH4yN1xUjGDj4Crv4C/8ISiVOaWv0I2qSshRYCPu
	gVSDiIq3RQ1WWt/rZjqfmoOkmG0FnZdSkBOpuWhqmVg/CchnULzkjGOBgqtV+Sdp
	hmNDBcxDNLtxRu+2sbXcWglE0EQYjCPJ4xy/EM2jO3QG3SvRQ7/zGcTIXhvCKad2
	owC9hl/9rrJ7sGlClsPS9yOp8vZj6YMYxgT1Q28ct0nWpawKFW3rxw89BKoelQm0
	DCczyUmhqSCj5P6F5sTK5Js93VkiTii+LlvBhlctBV+jRNbpxrUCA3F8Sr9f4S1K
	CfH7PkzDd/XgRDvCWdQWjspoROOv6E4RU9OjCTdOdv32xA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwk8af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sun, 29 Mar 2026 16:27:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso51235111cf.2
        for <ath10k@lists.infradead.org>; Sun, 29 Mar 2026 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774801630; x=1775406430; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2DRZhCEGAhiBuBP1YCe5luWOTveYo+3ES/uCRfsSr/U=;
        b=c6jOMRGCmihYWVzCx/YkOrhASstt6dkRbJWNeCGkAjvzrUojRTtwjQmFtTmBIiapHc
         NrZxmUbbe9f5X31AZ6hFwEneInsOxpxsMtAMItBSSPOSlwjaHpNFEqOHTdL7nVBZN0OX
         n299HIZwgB0Ez+ZWhrhPotvf7S+CA+GttKaoHnEnA+ebH0IGYOOZm2AJSnr+WtaLshCf
         ftl23z8bttY+MqtD6zAe0T6fVZbO4FbCbz8bdbeqhhsjcgVhUzWccjCCX4MFPAh0zCRg
         AqOdbfSTXUg/J3JXlEfIjgmcoI3lu238XTER6bVpHoX63XtyOoygUil0lih88mAp1vXm
         O+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801630; x=1775406430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DRZhCEGAhiBuBP1YCe5luWOTveYo+3ES/uCRfsSr/U=;
        b=sjl8W2/5LVRkgsAT8eG+ZDvgH1jCr1y5HtD5kJc2OxehljBS0SKTx+lwQrYCKIph91
         acLilO1K1qYZbL/S7hyIXYSzbogW1E5mOGYeypHFX2+UhrYD03llUHm3BrATBLhhXkD1
         Q+09R74BTr1suWKigJPQkSr50AMFbT848M4xowAasR98+bVWhyZ1fV9ql/RFUHxl/M1y
         00K/rNjHTwuD3sVdKQRZAKO3eI+THuWDS3tAMq/YwKouceQWrXynF3LJJSfVbHglYMjb
         2Hy2VyxEI13XcfVX1ndN/5JeZUSE72Uq1zPvuHqFTdrS6L6lKjZ5xDa8IX3BmvEDDdQf
         oG5w==
X-Forwarded-Encrypted: i=1; AJvYcCWMA2vfxOMCxBz4wbRgGrsu4lKLztIB7JqOL2+/+10YP9xg7FYelPtui/HCvyoXJ6QOAnGP8t4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcaNE3thMf2ekFvB+XzP4Z8pvqRT6dUhx0DDhyxrK00/B8U3LT
	XyjsjLbJ1VbKAWg5SPAblbbKYteKsCGuTmzzSkcnkU9yrXEvgiBXZceta4iLO+nGjnYxEAw12u6
	dqiEy8rh+JCsoMazl16W+euj1XRcMIHo5G85R545TTcIv1S6A4+iPqRPzhaDgXq0P
X-Gm-Gg: ATEYQzwoEJdrHILRXtANm1y0CvjiYN8gLMlcjWNTKyyO5B6NQwckARX+N4nb/EkhgBg
	p4HVl5aSd/80odFgfVk33NRXZo8SWlZGbNsNSyXBc3ndrgm5To/5U5U2RANk4HtZtMT1SKy2Til
	QVVq4dqZ0o8QvFzThrIpmPwndA2WJwPv7I4pp9TOAX5IynLrVNXQ9VAECsdmfUWyLNFKUtdwXdm
	Y1V/2/zmYO6dfyubLX8GB7oGoMwOx9vJb+l5M+4jRqm4i1rIYYO7Ahe47d3ivHK1DMt44nmn9Ia
	X8z+k4VJOpdlY1KcYfb5pAnoeFN82Nxcy15HI05q6DaBftmGmGf+pVRhn4kIIiOuY6ehWDaDPbH
	KqeqKgHVPVftmNy579FH3mkV0o1r+BXNiiM5ZDQli5QXR9sPgRjJ8bbWgtKseioB0fh838DHIn8
	DjiaWy0+mgJGVH4S8PWBsrnppyuRQGAvhJytI=
X-Received: by 2002:a05:622a:4d4d:b0:50b:26d7:eaa9 with SMTP id d75a77b69052e-50ba398f174mr111884871cf.64.1774801629986;
        Sun, 29 Mar 2026 09:27:09 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4d:b0:50b:26d7:eaa9 with SMTP id d75a77b69052e-50ba398f174mr111884651cf.64.1774801629485;
        Sun, 29 Mar 2026 09:27:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm10059401fa.21.2026.03.29.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:27:08 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:27:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 ath10k host-cap skip quirk
Message-ID: <iudca2llwe7dgisilievlwz6t4vbswfywmz43v3oski5usbvxo@ll37ug7adaoe>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-3-bc08538487aa@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-3-bc08538487aa@ixit.cz>
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c952de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=I6QQIrWB-BqS60JhQb0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WSfck7mtr9clAslwr8telc_TS8Ch3pcp
X-Proofpoint-ORIG-GUID: WSfck7mtr9clAslwr8telc_TS8Ch3pcp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyOCBTYWx0ZWRfX5CfnNoiLJTly
 nD07P/gguzp2r/R3rHvrI4nXX4GfPA9eGRtKYqZDfE/bhW6+vRUNtZmiqESglY5ixE33f+dP5Cs
 JE9HpH+n+LzuJQLEaasVXloev99nTS8IfU8XH1fqk3B4Trnye4aonpStA7k3zJz2HwIgYuSJJ/t
 ztC6oKsCOeAUeTzsIT2OnjsCawBq5dGigwJz8zlCfkkguY/tXVSQ9XIkeS4G26QwCRDT2yGOkEV
 F/vJULdY2HCRVkCPP0PcfDDNsLJNp1Qy0pYx8FpafDA4GS9H2aGfIwFw4DN0ERz3F9QMnjZni5U
 aimjJq5nHhhErY/L3N8AQRZqAFfz3Nfc/W+39cdv/Di7Nb+JNTBU/PBZXVyiJfmr50vcW0Vxcbp
 BCCi66Z9qQpTq7y99eGl5XZ9O3BxJpVrzkKHgzQ5d3B7FPTzXsbNNR11eQrPVOQCCrh5T5NLnW1
 V/AUA3lGI6ZkrZlGGbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_092711_813078_D6ADAECE 
X-CRM114-Status: GOOD (  14.24  )
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

On Wed, Mar 25, 2026 at 06:57:17PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> The Wi-Fi firmware used on Xiaomi Poco F1 (beryllium) phone doesn't
> support the host-capability QMI request, so add a quirk to skip it on
> this device.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


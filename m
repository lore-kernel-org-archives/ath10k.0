Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DA7F99C89
	for <ath10k@archiver.kernel.org>; Sat, 18 Apr 2026 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbwvqRx22EuSdW1o5avcOXEZl4XvhLf+30K9TnHpX7o=; b=0+K/w2Dxk59Ig5eURUPNK1hS3O
	v2p2C/9jkXUeKhU6t9Z8j4ViFUkDAuLGLGS/LKpHxWYqOdjBDepx5OyX9Mqu6flvmLkluDMH2rdZE
	vFdgUuqaippsuSA30ZHLJMZ/71LYXZXJ59vr50yoeGzYU3QyTesmhzU0QTdOqBDvxmV6/Pe2c7dnb
	X80ASBfLbhqDYuxrACpWHbrlpQlm59TMCKUX+fXQ9pUIWsxoXmmSHsEROZpjOWASjA8cQf1e3ryuK
	5YlJ8jGK2bicJrrl7rbINJz/2e5wYV78jXyyGo7lX7zHqQ7wepc8jkRw8ApIo1o8NTzvDoz0wydAT
	hXHvIHuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEBUr-00000005BAR-10Pd;
	Sat, 18 Apr 2026 19:38:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEBUp-00000005B9h-0KaT
	for ath10k@lists.infradead.org;
	Sat, 18 Apr 2026 19:38:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IIxbja3166336
	for <ath10k@lists.infradead.org>; Sat, 18 Apr 2026 19:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kbwvqRx22EuSdW1o5avcOXEZ
	l4XvhLf+30K9TnHpX7o=; b=iPZXIwGw/DRx+Zt91iZVqqLZHLhQfaqwatR2rPg1
	i8q/oA20HMpxH46pXKnyynNMPPH3db0oFL2PK63Bs7E27TI5ymG5qeIbZF5BvULk
	fRL+sK6vkRG52aO4231tZMZp6/iiQg6i5CfN59YvFzpx/VShtp1gXg1vrhaOqV+d
	sFE0aHqta25IQs3krIY5t1bY8CMV3neSQM9FM4XkgLm9RecZM35805nez8FbngXI
	oSi3ULWHzpk6HGHHBH/6wUwPVCfWam5B1MN7PYZg5E1pyeEM7b7ymoyHzfk2d+Mo
	pacK+MXqrVp5Yz+tWcCcwbV9AGMreEJX2ukMqJDehzcNAA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qahb6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 18 Apr 2026 19:38:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d826ed6f9so67528601cf.1
        for <ath10k@lists.infradead.org>; Sat, 18 Apr 2026 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776541105; x=1777145905; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbwvqRx22EuSdW1o5avcOXEZl4XvhLf+30K9TnHpX7o=;
        b=A8JZrHFxIa1Y6uiWL+3qCaZD1LqtbndEeN9NPrUsgLJ5hL2BaPvGFPgt59UI4B3szQ
         6VEiuIEz4JHMUcEYYV1GmukGSLe2axxCtQmhrsLYYXMX5i9oWUH7Tk6E286ZudzBC6vG
         Fr9d/HI81tP0duG4rqZJe+AMp2zGd9QUoub57p7ctUsGEHIFK53sVJzX/11yWRI2J35+
         z2P5wb9fJqCq/tJ76O/ytfwAZ4SjiKx0yVylgtS+3Wi57dGp6CbuSZ1I7Mm6cZY58hbY
         9VqkVrmsFQbSRV2UPjuopBELMEBd9Z9poDrIHIsIx9jpydScNjEJd8BpAldy3ZRpSUXw
         TLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776541105; x=1777145905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbwvqRx22EuSdW1o5avcOXEZl4XvhLf+30K9TnHpX7o=;
        b=KUmrbIfGCZejfp9J4slrTkc2VXDAEWUHpa+D0kzccKWRbL42W9+GVM0qwAo44U9On8
         98QdKVCl/1SbwKQA5QPaH5QbHH6OSPIV71Ptjn2+cgtRs7tXxWmfbh8XHX4EY6cFimEm
         o+wdbxxraQ0UpnpzjigluDDb0HSLopN/yvbVK7BzEDi9zj79zyzuQBOhKdod82iBgG3N
         Z4jfR0D57ajdxYmxmw6UZQpoIBCarN3YQ44BHF8B22Ahh3J8Lskp/PUX7KWmpREe1bJh
         Clp2FmQrHMsCM+5zKfaz/xPZ5MejyHnwtbFUtA7f6is+j6TwFEayProe0KDMyleQsJLC
         phZw==
X-Forwarded-Encrypted: i=1; AFNElJ9s12MrrvUuVSGZJdZjL5snGBTeYulPmMb+7VV691+Atpn5V/XRGmpTBByXI9nbo2NpzMD0KTA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxX5es2fH0YZqY9xOitgassk6tRXeD/dVlxvGyrOsOHcfzySqlx
	6OahLPCGysoSwxOzIjc3qYu9DHY5eriuqPsNtswhFtYveSKkfDMz/4PdqZu+7wzSgeS/Nu6l0BI
	oaO+qk3nqe71ngKEBYbGxoLGMZM8tkND84oQKslC0BWmyvyFvZrE7c8vEF+wjdsAU
X-Gm-Gg: AeBDiesvChE8Sxgo/HhWTyuZGQ1plvaYCzYPCVRXWVlslgl2VBapyaH5ye+9TU5YSLN
	+8VRH/CW07narCncr5B/JQoYLyRd2wezpnFK4fZIeM+aP4EaQkGXJVjlclf2Z90RfoSp2/5rAgR
	WfZMT39RfdQR+cbFrZdVH8d68nVLg0J0EAwvuyRV4EXcD2EeJwK+nzAlVcqDqBlMqHFH744NcHu
	GCY48kutgY6moOL5HSIR1Ea+6039i/sy8ZAQd8ZRs//zrNdBaq2/Z8diuagjxOYuJlvEiCyhqFR
	+QL+ZvNwgHW7y1QfTMoEIqaOfvOUkTRjE0oc8xvNxKOVNZZmVVRUEm3UshRP+Gn6ch7ojH0eNdD
	WYWiPX4vbybzBWVdPMUElyq7GyRYVbUEeekJCADYmdA64X/BtHZg2PpYzIBjkeup5LW/lGiApTY
	Rbg29DMsqssKc99JhUoi72jvtQnnvIVKTovMOhRb1PuQY7qg==
X-Received: by 2002:a05:622a:48c:b0:50d:9c1b:941f with SMTP id d75a77b69052e-50e3661b147mr97389771cf.8.1776541105476;
        Sat, 18 Apr 2026 12:38:25 -0700 (PDT)
X-Received: by 2002:a05:622a:48c:b0:50d:9c1b:941f with SMTP id d75a77b69052e-50e3661b147mr97389461cf.8.1776541105035;
        Sat, 18 Apr 2026 12:38:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dd0sm1553387e87.69.2026.04.18.12.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 12:38:22 -0700 (PDT)
Date: Sat, 18 Apr 2026 22:38:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] wifi: ath10k: snoc: support powering on the
 device via pwrseq
Message-ID: <hdypom3nioc6tk26gh647imy5ykhcjqvknideilnbc2b5p7eo7@hm7fsscleutf>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
 <DHUHU7UIT487.139L3KIVRVREU@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHUHU7UIT487.139L3KIVRVREU@fairphone.com>
X-Proofpoint-GUID: hBDSP5vmMhqvj0-RPtTyCgrG9VDy2elQ
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e3ddb2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Rs7pINfTDodmtXVth3IA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: hBDSP5vmMhqvj0-RPtTyCgrG9VDy2elQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE5NiBTYWx0ZWRfX0x1uNNUAbbeS
 6WHSXKiCwZqEx0Q+GIJfaVT4geAAr8UT2gKklzD5PTyXlgYGlWuEdtNR4Sr8IU6vUM8oqehEXgR
 0lDfJVsA5YHbD6xe5O6k5E7u1+iJWRztmKLlb5GlsUIAp5StuqHhz7/0t3zcddI6Wtn3CAS52+F
 qIdt3F+Ip/dOZmUfqUC6Gc6MPVixRig6jhE3uLYKOK36rl4GS6QPLsPdb2Ckc3jFFGJStjqzX/u
 /79uOqJ3r2SvyQlyhIFutmYT4V/a0x9bJ6oN6K3oB5+J3fSF93OTlEEJ3rsFVUAA45B3ENEOLKx
 x2NqK4b1OLrcjNg3tIZMHXCjUARwvTjUrHJftI269+CgLihBITf5c2Tzq8hHAGj3to4lQkXWl3F
 Y3DgYRLG6gdXm6R7HZ9oWn6CuwqFKg26L9hYt5uCxfF2wDPxzW14yws4eJY+zG3rB4NkG+dq7kK
 zMqe+sb1ilmnlmH82Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_123827_121828_2D99302E 
X-CRM114-Status: GOOD (  20.21  )
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

On Thu, Apr 16, 2026 at 12:06:09PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Mon Jan 19, 2026 at 6:07 PM CET, Dmitry Baryshkov wrote:
> > The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> > voltages over internal rails. Implement support for using powersequencer
> > for this family of ATH10k devices in addition to using regulators.
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath10k/snoc.c | 53 ++++++++++++++++++++++++++++++++--
> >  drivers/net/wireless/ath/ath10k/snoc.h |  3 ++
> >  2 files changed, 53 insertions(+), 3 deletions(-)
> >
> > +	ar_snoc->pwrseq = devm_pwrseq_get(&pdev->dev, "wlan");
> > +	if (IS_ERR(ar_snoc->pwrseq)) {
> > +		ret = PTR_ERR(ar_snoc->pwrseq);
> > +		ar_snoc->pwrseq = NULL;
> > +		if (ret != -EPROBE_DEFER)
> > +			goto err_free_irq;
> 
> I'm fairly sure this is now broken with CONFIG_POWER_SEQUENCING=n since
> then pwrseq_get() is returning ERR_PTR(-ENOSYS) which is not handled
> here.
> 
> I'm observing my ath10k_snoc is now failing to probe "with error -38"
> which definitely seems to be related, but I haven't debugged it further
> yet.

Posted https://patch.msgid.link/20260418-ath10k-snoc-pwrseq-v1-1-832594ba3294@oss.qualcomm.com

-- 
With best wishes
Dmitry


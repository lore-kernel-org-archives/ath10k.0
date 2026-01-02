Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A05FA3738
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 12:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFb/aTv+kCh+IVFQzl/+XUeOGrMrnchl5YsnuK+85mg=; b=glkT8rDEwEq2N/sbwe8Ji710dj
	yE3wT6pmGQqcHYZVCh9HRWFC3FMGEpVXF6UOXq+IDSa5cJM27cdapRW4qBokXvL9eMEwiEO3qbkDV
	eXvtZrGD28IgyaTojnMkNmfXFeLVjrQf8os1Vng5tnEpDi/h92CvGBqYofgMBMT6GLVEatCAVA4V6
	8mjTPmEB/6LvOzABjTsImNOxTbucbTv/T9zz0GrUHUMEZUOcP66Ks223POnZZJzVHrSl0f1srj0Ux
	AvvfH3OvjonDH7giDisDoHtjbIyC3tDQWu1f6MVqGOSQh5GyOfdEEv/XVBcreQ4BhAFs722P8iLcV
	lnIqlumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeCI-00000008C8e-15dW;
	Fri, 02 Jan 2026 12:24:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeCF-00000008C85-2e4m
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 12:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4FBD43C38;
	Fri,  2 Jan 2026 12:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1EDC116B1;
	Fri,  2 Jan 2026 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767356638;
	bh=UFKKF1haRLgSTi4RG+IyCkOVonss33GrfgWTfx8VFj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4vzuANRs/MKY/qs8qq0MJvtp8uzAfIK0t0Nq/f97q9oZtXOL267hkPvzCQDFRrF/
	 bOefuMnqSyBXiPUT55snSNbPneHYuOoy6h+was+izicXzxDY2RyakDOjAnCIvZdPum
	 iRqGw4CdAY9s4jBAGG7gzqCYUEVJ32IQRMkGJYDw577TipItqMKWIAF8s6asVKyTTf
	 Ci8ORTHWb7KbQfEwsYtB/tDqXLQlMc3ptzpAg/84UQiMrvGEncOuOvO9/7FdlVAfur
	 MFi8mYG4AlrCWUKNv5UMDiGEIvZnK1Dw3mg+uVcMfpl9zslr5NIShF7/4D8OwZqZZm
	 06S+Fz2WgoARA==
Date: Fri, 2 Jan 2026 13:23:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 01/14] regulator: dt-bindings: qcom,qca6390-pmu: describe
 PMUs on WCN39xx
Message-ID: <20260102-exotic-spectacular-ladybug-0dc1c5@quoll>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-1-1ff4d6028ad5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251231-wcn3990-pwrctl-v1-1-1ff4d6028ad5@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_042359_688885_6B48B758 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

On Wed, Dec 31, 2025 at 01:35:51AM +0200, Dmitry Baryshkov wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,wcn3950-pmu
> +              - qcom,wcn3988-pmu
> +              - qcom,wcn3990-pmu
> +              - qcom,wcn3991-pmu
> +              - qcom,wcn3998-pmu
> +    then:
> +      properties:
> +        wlan-enable-gpios: false
> +        bt-enable-gpios: false
> +      required:
> +        - vddio-supply
> +        - vddxo-supply
> +        - vddrfa1p3-supply
> +        - vddch0-supply
> +        - vddch1-supply

You need new binding file. 3/5 above are not shared with any other
device.

> +
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.47.3
> 


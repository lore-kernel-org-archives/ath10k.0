Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66448C25B4F
	for <ath10k@archiver.kernel.org>; Tue,  7 May 2024 15:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1iVbNBX+kSGSsbGNwFZ40H8YG2tZxRO7iegVU4wpME=; b=fvf+oJPjEeGLXSfPvEEQCGM4Gm
	rWft0zcfuIxGnkjVx2OY/ycRB4eXFP3DIjtPArwg0jkIs1qAebY+iu2MM61+0saS7Li0zNHdhqUVm
	P3GmDkDq8C4LLaIfSsxiMquf7zNlZPU1rQwXqt7cYZY9hgf7WTZgF1rf4ThtRFGneMCgZpYFCpdb0
	KDJ+7QtPxo9GVO59aVqdxlGStdU+8T2zu/xeaXwsAmcE6SzMe9fLmXNxOhje0oj6JqIiWywGBSP63
	nYuvhJhfM0kmGlckiUZwLEnrIIdYDPulG+zmXVgcelimYLCF5jH8oGCZdvdG8LwZPsPCGu4ytBIHy
	Qy9HY+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MNw-0000000BepK-2MHg;
	Tue, 07 May 2024 15:05:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MNu-0000000Beo8-1nBt
	for ath10k@lists.infradead.org;
	Tue, 07 May 2024 15:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37BF3CE0ADC;
	Tue,  7 May 2024 15:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC53C2BBFC;
	Tue,  7 May 2024 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715094334;
	bh=VVeb/LlZcPst//x0wDQgatV0HpkM8V7tQznlTpAm+QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPULlZ5sCvp/thR6YELavA6A7tsYjvPFaihKBvsUJWSfk0t+iFaF+Abmaqz597+tk
	 gg1bRHkd1WU2Zp6QOdAIwrooUYsWET6XA6d8khuZXsriaBrU4GyUtr3EnIN2lY/cPS
	 pGOl7fAnP2ExrPyqoif8h+C9e3naaD8j/AlIgkvsaO623Nqy+0KWFN+trs8hAgUMbm
	 5++IXFV3JlAhQceJJGqKgEMT7GjfA4olT7XtHWcZEPM970k+m2WLOSleJKVDOuVYqZ
	 VaguSfHqu5t1eQM3J6q9NZxIC/YBD9ZLCSpaQh22HYR1uq26XxKp+nuceNAg9//eeL
	 LWpznNru1d0LQ==
Date: Tue, 7 May 2024 10:05:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: ath10k <ath10k@lists.infradead.org>, DT <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Kalle Valo <kvalo@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	wireless <linux-wireless@vger.kernel.org>,
	Jami Kettunen <jamipkettunen@gmail.com>,
	MSM <linux-arm-msm@vger.kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Message-ID: <171509432258.482945.17084228193857427143.robh@kernel.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
 <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_080538_679175_7D061AC2 
X-CRM114-Status: GOOD (  16.60  )
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


On Mon, 29 Apr 2024 16:04:51 +0200, Marc Gonzalez wrote:
> The ath10k driver waits for an "MSA_READY" indicator
> to complete initialization. If the indicator is not
> received, then the device remains unusable.
> 
> cf. ath10k_qmi_driver_event_work()
> 
> Several msm8998-based devices are affected by this issue.
> Oddly, it seems safe to NOT wait for the indicator, and
> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
> 
> Jeff Johnson wrote:
> 
>   The feedback I received was "it might be ok to change all ath10k qmi
>   to skip waiting for msa_ready", and it was pointed out that ath11k
>   (and ath12k) do not wait for it.
> 
>   However with so many deployed devices, "might be ok" isn't a strong
>   argument for changing the default behavior.
> 
> Kalle Valo first suggested setting a bit in firmware-5.bin to trigger
> work-around in the driver. However, firmware-5.bin is parsed too late.
> So we are stuck with a DT property.
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FB7C25B10
	for <ath10k@archiver.kernel.org>; Mon, 13 May 2024 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jB84jq3Crj6axci5gs8xEI1E2bZQv9Fgj6RlYg17wys=; b=BCH0Co7W+tCrtUKCOpvaU60Dwl
	OisvMoQYuqrKncNVte7veIcLHeg38Dz+n02dAQpVVdCHt3vwqBnyJeBYDY4UHpRJk9ovlI5yvNrc8
	xWreGL1QBXsFBOB9C8xkutNATXdVMDWc6OrPPvtPzPF0xGil6x+TMx7a7c80vzMyMlAkc+kTEQMQ6
	Xdb93j/KxJLTmSO0aOWrxJ4bOGPMl46VtAcqF/YDtyeU9R6GpVP9D1PJi26nlf6rfoa9AqQeIaF0v
	M3R7sFT1bsCrcqocdtBh17v/v57TrscwiyMGRCQUwyuOTQkmBX2j2I4W3BQLXMvaok1WqT6lThdzf
	of6k6apQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WTM-0000000D9Rm-099C;
	Mon, 13 May 2024 14:16:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WTF-0000000D9R0-35K8
	for ath10k@lists.infradead.org;
	Mon, 13 May 2024 14:16:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0315860DF3;
	Mon, 13 May 2024 14:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2D4C32781;
	Mon, 13 May 2024 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715609764;
	bh=ztDLgSBwpXs1XqFtFOt86T1h2DMz/XQmvsHWKSx1FeM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DNmtCVJwPDEsfWvcPiiLOyHBC4Rmy3N3hPBcJgLbFVdGL8tHpmNpfu4Vbqle0QPY4
	 PsFmfqWo0euv1DYfjyazS7BPjAgu2LTVgezqGPm9PxM7e0esVeZqPW7t+v6T93jjh+
	 oLp/uW4uSLL1EqSJvj66pxuE+tM1rIPn1thedJosCmoambJFEWpeKmB0BwLKxxxN1o
	 BFiIuyhP0Mmr5KCKhLM7KXupG3G7/QIeb6U1p0wxqNaetUNsFDNkd9ZSNwR+7tDXwX
	 g40rXpANPwJFhlLLJbNdWUtZt88PHFvjJDLpgwPj3gv6RlI/Gf62diIjizSch2FHXZ
	 nPSCPQ1o9+U1Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
References: <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171560975908.1690511.498631481702370762.kvalo@kernel.org>
Date: Mon, 13 May 2024 14:16:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_071605_981665_10A61F6B 
X-CRM114-Status: GOOD (  14.25  )
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

Marc Gonzalez <mgonzalez@freebox.fr> wrote:

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
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

71b6e321e302 dt-bindings: net: wireless: ath10k: add qcom,no-msa-ready-indicator prop
6d67d18014a8 wifi: ath10k: do not always wait for MSA_READY indicator

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



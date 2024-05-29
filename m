Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC5C27C43
	for <ath10k@archiver.kernel.org>; Wed, 29 May 2024 02:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5L32Sssgs8plX3zTz3U70gpJoPMjha4AKX24LHJDGA=; b=wzNSZqHvvEyWm/bZCINUNRpbO1
	CroJ9jNi8aac5901c18MpMEDjH1MfvgNWIuO1W3EAyUNrpMw4p9O3n7FTtXnBKuDzpd6HvX7LMswz
	qMebe7KVBkhndaOmrQqZL39pafwyVoqR8tcP1duv/0rIiTCNHEkZDudm+ZzHUckUH1u3cO5KMGaz0
	LObDf/bP6lUpDnvdpz1ijnmgFQominxTZBVzqFRJ2bKKXRZYUSBsXWFMfuaCDZ3ejLYHfhIGmcH1c
	LrHcg1YoHtiSXwc6y5T3QC1BmO6cKzBWtAglzGvwaaPvNFB5CbY7/pQ/Cf9iZFxyW0WcorWSfaF5r
	KJ/SNxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC8dw-00000002Y1x-0mgM;
	Wed, 29 May 2024 02:02:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC8dt-00000002Y13-2mOp
	for ath10k@lists.infradead.org;
	Wed, 29 May 2024 02:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B26B8623A2;
	Wed, 29 May 2024 02:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB112C4AF08;
	Wed, 29 May 2024 02:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948136;
	bh=kBuQ9fcA+VN6pPO3SFipaZrl1mBckkhQxMcU1vdmrT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lwFVivYOgH6ldsdLchXHx8VvhvKvJ2HOJXTIpYoe1syCLelhlDuql/2rPzZcCvm3w
	 BwuBUY1hRH3dZr2/8875yzsE+sHEY2GLSzzfbMoqaJpsjpQO8IPtFOvO8lU4VPoSLQ
	 X7Uxtp+B8ZABJb+ZWLVcO82zeHX2HSIj0EcbVfQwsaTihNVNvHXE0LbEknveDL7rpH
	 WcsA3Mm23OfE/f8dWEXBajFO/lNQMmobJofNmst2lMBGuVgdfFv0vgAb/qJzMuTATQ
	 uf0ia4VvpVsndQxmSY69Ta6/bTkNjTJahLInrlzTwsuDe7APARcC+NxGyW07Z57CkA
	 4Ed6S8oh2mnSQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k <ath10k@lists.infradead.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Cc: wireless <linux-wireless@vger.kernel.org>,
	DT <devicetree@vger.kernel.org>,
	MSM <linux-arm-msm@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Arnaud Vrac <avrac@freebox.fr>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jami Kettunen <jamipkettunen@gmail.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: (subset) [PATCH v3 0/3] Work around missing MSA_READY indicator for msm8998 devices
Date: Tue, 28 May 2024 21:01:54 -0500
Message-ID: <171694812078.574781.940205504715408568.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_190217_767721_85854C3B 
X-CRM114-Status: UNSURE (   9.77  )
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


On Mon, 29 Apr 2024 16:01:41 +0200, Marc Gonzalez wrote:
> Work around missing MSA_READY indicator in ath10k driver
> (apply work-around for all msm8998 devices)
> 
> CHANGELOG v3
> - Add a paragraph in binding commit to explain why we use
>   a DT property instead of a firmware feature bit.
> - Warn if the "no_msa_ready_indicator" property is true,
>   but we actually receive the indicator.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator for wifi
      commit: 737abcabe97bb37e38be2504acd28ad779dbaf3d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


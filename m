Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473BFF532CE
	for <ath10k@archiver.kernel.org>; Tue, 24 Mar 2026 03:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1a3laSTmBejXU83ZtzgYdW8hmdbuSQp2nddfgO/+Bzs=; b=XsilTHBt/ZDhaCjeXyMWjH8HGn
	DqNYhIt9J1EZW+xPyoiiwVV6ToA6WVDvwBNscDpDvTcUUupHB98VmIDw014Gg7M9DBJ9DX6ykEpHL
	qgvoCSz0u4SYr1srIe/rqPhXiLtlHtkx/mqtjgnnK+zEai+L4VNGync5Dhw2EQHj8Y9SRgsOmYlNP
	zTCZVI7+mNk9vX9Rikkcgmgj0iP/yHjD23H7n/bdtdbn2O+0nDQldZZbvdjlSMiSVcoiFcYmx4oaA
	gRvUnZov46kIh3aaG0hvdbaDrAYjsFjoq1F8huJrsXdd/v6T1iA1NYHczATkY213AtJiMP8xZLyob
	pZwfY08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4seo-00000000V9f-2Ki3;
	Tue, 24 Mar 2026 03:42:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sem-00000000V8d-0Zjr
	for ath10k@lists.infradead.org;
	Tue, 24 Mar 2026 03:42:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 411154023F;
	Tue, 24 Mar 2026 03:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71660C19424;
	Tue, 24 Mar 2026 03:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774323735;
	bh=qpWNh+tTYj8MbrdcqgUMlZVZZhUWaYgGrvrVHLiKCBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R719frGOM/L0P7abqsQXEE2kqqXEtWJwQlWRwk1c6JSRqaOjfeYcyyOm4/lf51mLC
	 Nv1kOwcRbCBtHThGpyOwpG0IlUfZa4kYuRSFZM1GeQjBXDL5gJJ60wgiln/9o3hAiv
	 qGV2aOc5keMh/1LnL0lV0vPFRDnbgAhE4o0KX3+i3UQWBzuZqwy1qjRxXcULJC+P9Q
	 /+HYAhJ4SFlqQ4BqcnW2S9x6r2MFkwLsFwM+hCAQmU4sLYkFfZzOV/Pq2IqtPM8KAf
	 bjzY0XPVn/+ja3Em3n+8c0ghrb3PSd027BxIKGh6kcZZaqwS7RQiOoRti+dsrb2n8N
	 mGiW3gQixOGhA==
From: Bjorn Andersson <andersson@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 00/14] power: sequencing: extend WCN driver to support WCN399x device
Date: Mon, 23 Mar 2026 22:42:01 -0500
Message-ID: <177432372677.35532.960283784585134331.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204216_193984_122236E7 
X-CRM114-Status: GOOD (  10.23  )
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


On Tue, 06 Jan 2026 03:01:10 +0200, Dmitry Baryshkov wrote:
> Qualcomm WCN3950, WCN3988 and WCN399x families of WiFi/BT chips preceed
> the later WCN / QCA devices, but they still incorporate a very simple
> PMU on die. It controls internal on-chip power networks, but, most
> importantly, it also requires a certain start-up procedure (first bring
> up VDD_IO, then bring up other voltages). In order to further unify code
> supporting different families of QCA / WCN chips and in order to
> maintain the required power up sequence, properly represent these chips
> in DTs and modify drivers to use power sequencing for these chips.
> 
> [...]

Applied, thanks!

[10/14] arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
        commit: 2d0840e31c8a6ceebc701822889424bb1927d1a7
[11/14] arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
        commit: 1eea8321da0fa3b80eb19802ab830bf83d304519
[12/14] arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT properly
        commit: 40a5da727ebc2a8d085feda501ab7bee4c5d9608
[13/14] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
        commit: 77648f3a7e9be4e7090bd326b2e4a4f9265b80f3
[14/14] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT properly
        commit: d545fd1caf42a8f20531ba38c671f5bf10542720

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


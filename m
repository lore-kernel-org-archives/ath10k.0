Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4590CFA3748
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkRIBSxJfaZm98Uuv0ZlVaj5DXD3g3k3qpYt6yBPRxE=; b=jfQwRjHHpvOxzJhfIVWQ94ANRq
	ucw3AqaHo2fJsZAKESjfl0Poo87g3+B3ep3ysAfJyzqchbPaZYDhRih8fmFGuCzNZg57hMKajMkJD
	cJHbf5UkWw5qV64wttCZi/iU9fT4dFSF/hJDmxZYlbYe/R8pITu/FgVxf55gwuxfnivK/tbTtXSks
	OQ55SdpbSvfNEbVAwcwakF+NBOykSl1CiOvfSNDYObZJN0jZ0Uv1ySa/KT1HCh3NITV+iZVTSla95
	vhgb5/JBYwRCScs/Gact2uOQiLAVUwFApn0rk/xE/exyzr1edZJxrpXxULlzU/jyCazE2Bk1OecET
	E5GghLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgNO-00000008NAk-0Vio;
	Fri, 02 Jan 2026 14:43:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgNK-00000008N7t-1b5S
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 14:43:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5576F419CF;
	Fri,  2 Jan 2026 14:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09075C116D0;
	Fri,  2 Jan 2026 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767365013;
	bh=nyHtgP68erpLvHWm6764+JEIXGn81OZrAUsIOLo6/ys=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=u7OcxuCpmb29cSRLpISqyRHup8TEYMOWAkIYs40lRyNkKBia3n7iZ6NSmpQOktwnA
	 xxoXi0cW+kTUVzBo9bEAlsbuq5mX4OP/eDUJeHRIo4ObHeMQXQMXBOuaaeTBBLjWHh
	 dYk/0iIQbZdrpMUb0wm929Id2xZbgu2JaAfsN5EuQ8qJa/7sADkJTJu8eSS/2J58G4
	 UNrVr6CLDoeZWCtUBC2XuoIQv1PPqJKPYuehEPv2ALLopOE737dHbbppIPSeO/k/11
	 M5sgXa50iyFjfBo9+cN3kr7P8RUkT0zDEN+LywgewS7S6aFIvT5jO3BU6kMNUwjqjv
	 q9HEY3+hg+8Xg==
From: Rob Herring <robh@kernel.org>
Date: Fri, 02 Jan 2026 08:43:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Bartosz Golaszewski <brgl@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, linux-wireless@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 ath10k@lists.infradead.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
Message-Id: <176736452702.3671432.8334984298495582439.robh@kernel.org>
Subject: Re: [PATCH 00/14] power: sequencing: extend WCN driver to support
 WCN399x device
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_064335_198083_BADBD45D 
X-CRM114-Status: GOOD (  24.08  )
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


On Wed, 31 Dec 2025 01:35:50 +0200, Dmitry Baryshkov wrote:
> Qualcomm WCN3950, WCN3988 and WCN399x families of WiFi/BT chips preceed
> the later WCN / QCA devices, but they still incorporate a very simple
> PMU on die. It controls internal on-chip power networks, but, most
> importantly, it also requires a certain start-up procedure (first bring
> up VDD_IO, then bring up other voltages). In order to further unify code
> supporting different families of QCA / WCN chips and in order to
> maintain the required power up sequence, properly represent these chips
> in DTs and modify drivers to use power sequencing for these chips.
> 
> Backwards compatibility with the existing DTs is retained by keeping the
> regulator&clock code in the drivers as a fallback.
> 
> As a part of the series I've converted only several boards, verifying
> that all known instances of WCN39xx family works (fixing the issues
> meanwhile). The rest of devices might follow the pattern later.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (14):
>       regulator: dt-bindings: qcom,qca6390-pmu: describe PMUs on WCN39xx
>       Bluetooth: qca: enable pwrseq support for WCN39xx devices
>       Bluetooth: qca: fix ROM version reading on WCN3998 chips
>       wifi: ath10k: snoc: support powering on the device via pwrseq
>       power: sequencing: qcom-wcn: add support for WCN39xx
>       arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
>       arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
>       arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
>       arm64: dts: qcom: sm8150: add uart13
>       arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
>       arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
>       arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT properly
>       arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
>       arm64: dts: qcom: sm8150-hdk: describe WiFi/BT properly
> 
>  .../bindings/regulator/qcom,qca6390-pmu.yaml       |  36 ++++++
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  60 +++++++--
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  62 +++++++--
>  .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  66 ++++++++--
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  75 +++++++++--
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts            | 141 ++++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sm8150.dtsi               |   9 ++
>  drivers/bluetooth/btqca.c                          |   2 +
>  drivers/bluetooth/hci_qca.c                        |  26 ++--
>  drivers/net/wireless/ath/ath10k/snoc.c             |  43 ++++++-
>  drivers/net/wireless/ath/ath10k/snoc.h             |   2 +
>  drivers/power/sequencing/pwrseq-qcom-wcn.c         | 130 ++++++++++++++++++-
>  12 files changed, 596 insertions(+), 56 deletions(-)
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251229-wcn3990-pwrctl-cfa64f9d8167
> 
> Best regards,
> --
> With best wishes
> Dmitry
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: wcn3950-pmu (qcom,wcn3950-pmu): 'vddch1-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: wcn3988-pmu (qcom,wcn3988-pmu): 'vddch1-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml







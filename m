Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E44D46625
	for <ath10k@archiver.kernel.org>; Thu, 15 Jan 2026 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvwI/4grruJ/zuI4AHqBDA/jwfjbFuWcr5sOmDjNtyI=; b=vofDOa5/pvcki2+yrniYpXwLYD
	kk4jJ0wQmQQ4FIZ6InPEQlBVKwleh4oOH6wft2EPk7ExYASCFxfN2Y9YbLrJKbV0C+cR5BfzFvIWD
	bCTN2hg0UYUyic1ksgQSyr9LrGM/g8Iyzmoze06atlTNScBxbuyWQYHZqnex31wCUymLr7xMlOJvf
	p5cbcNMSr1ZsyyO6VN7SHLrButUL/bfs6fFEdoFM4EsErOGeMlYo1cDHsZ5AZCsRRTOzQRBla/Yj1
	CxgvZ1EJl3g8yyQLCE9uql1iIyWHxSVmGchV6B2DhBUObG7/tT7I/8YX9YvOlg5NeDtE0NviNv9wb
	agAOX0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUVK-0000000DCCE-0lDO;
	Thu, 15 Jan 2026 21:03:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUVI-0000000DCBu-2VC3
	for ath10k@lists.infradead.org;
	Thu, 15 Jan 2026 21:03:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0F2641B66;
	Thu, 15 Jan 2026 21:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213FEC116D0;
	Thu, 15 Jan 2026 21:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768511019;
	bh=Bfdh1ihpqGHMGuPqW6c73mjv5JMezBBfg7OgdT7IM0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ujGiB/MHcXEUMMquCTYeVW1Z0CuGRIv8DgW6mCFGMHRcB2vuIrvLfZJh02ZJImnP7
	 sRldwyf6qDQ36d/NVnzw9Y3qJiUwLaovnG97wG3tEfcaosNqi8/5xgiIRgpZN5fDzO
	 kZ/gYoJnNEAGxCkhoNa3mcOqzXug70iUJ9atlHWOGjMdeuJE1KJw/ycWeBN6CNC6Qb
	 4/VszlIprBQjAkI8f5itv8U7Mf4kNyB/TXU+j457T9HVkXIqtiyW2VnLcTzhuDmwtw
	 Ak2yhw7DPo+RcLpVn9IzKWk3MCBD84J46JX+pNSEVPhz8eJ32eI+k88IZn6xnNDEYB
	 BhMmx45rwOP5w==
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
Date: Thu, 15 Jan 2026 15:03:34 -0600
Message-ID: <176851101091.263753.12255000072756523298.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_130340_657253_8C4DF50D 
X-CRM114-Status: UNSURE (   9.98  )
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

[06/14] arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
        commit: c5dc4812f6bf397b82290c540085e9ec98b47b30
[07/14] arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
        commit: 8bfb696ccdc5bcfad7a45b84c2c8a36757070e19
[08/14] arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
        commit: c303e89f7f17c29981d09f8beaaf60937ae8b1f2
[09/14] arm64: dts: qcom: sm8150: add uart13
        commit: 0404b98c6bbca7a3b1e59a20d173fa149ac20194

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


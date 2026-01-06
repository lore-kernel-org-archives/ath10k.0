Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD422C47BC4
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJGyq+HGJvmFnSt0gL5WNLOkDgg/GBMwgXC/kduOlWA=; b=cNkwI3JOl9o60TsfN9/AsMH1Kt
	5VZHyhY2Q95CgNUphfa+VvLQ3FLyuxX+KorFIuYGuD++IURYpWltP4wr5dq2+ashdEyeVz1jti+/J
	iWeg0pZ5IbgZNyb5Hae5wZXIruphWCzjEBCbGdEho7Tok+lfE10NndmwWZlTn3NVnBJ9ECf5gsmps
	rhrHGuI5YBsssucUE6MmVH5fyNx3JS/CKDz5YuTojsQVCyNTluMsKxNjEl86nLaEVFk/PvVKtUvKo
	lu22s02IkP5ZeoOCsdtmSRkslVYt+hufbnsd4LgBocbiNkc1LijSgp+QjOu43qxHcAyf34P/syKke
	hUSBwiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1zL-0000000Ca8Z-0VkJ;
	Tue, 06 Jan 2026 08:00:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1zJ-0000000Ca7r-0LQU
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 08:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B0F54182F;
	Tue,  6 Jan 2026 08:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9012C116C6;
	Tue,  6 Jan 2026 08:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767686420;
	bh=dkGrJ+HNkmvmZTpBr46Pq3Us3nvf8mhGcZF8C0/MzzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQQ0gBPICFv2Mhig5gItFjq+6d62Zn7GYDi4hGisgG54sbx1sgsEtz5/vFHvZEeQa
	 KVKEZyE6wQXD9BTKrQmDB8+/PhWyAR5ZnqXqgzqlXGkoanlksDCKrIzVwpNbL0HMtU
	 dR7y451KqxpHu0ySjoNP6rfE5urNIbAMBrO/QFKtdh1+HT/wgHh5/ZuU256HPkfutC
	 zbMicu03Tv5lAInAc4BX/mjKq7VWuFuJpHUTAFRTr4LtpTkS2Ge+YjU4TPFm/FYwzA
	 178W6grtUapZI8I9OdewbzF3lIcQfW19Y/is6EYEIu3mc1I409ROTXi7z4/DJ82s08
	 3azdQeGnkeMqQ==
Date: Tue, 6 Jan 2026 09:00:17 +0100
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
Subject: Re: [PATCH v2 01/14] regulator: dt-bindings: qcom,wcn3990-pmu:
 describe PMUs on WCN39xx
Message-ID: <20260106-excellent-pygmy-puffin-97f7d5@quoll>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
 <20260106-wcn3990-pwrctl-v2-1-0386204328be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106-wcn3990-pwrctl-v2-1-0386204328be@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_000021_134990_A7585122 
X-CRM114-Status: UNSURE (   9.44  )
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

On Tue, Jan 06, 2026 at 03:01:11AM +0200, Dmitry Baryshkov wrote:
> WCN3990 and other similar WiFi/BT chips incorporate a simple on-chip PMU
> (clearly described as such in the documentation). Provide DT schema
> covering other Qualcomm WiFi/BT chips to cover these devices too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/regulator/qcom,wcn3990-pmu.yaml       | 100 +++++++++++++++++++++
>  1 file changed, 100 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



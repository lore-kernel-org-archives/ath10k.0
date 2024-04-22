Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030E7C4345F
	for <ath10k@archiver.kernel.org>; Mon, 22 Apr 2024 13:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfC7yXAnCEGac6+hGBimL11vSSwp6Dx3JGzw5OV2uyg=; b=HatSc1Dt2+gMpisIup5mND2BWm
	o6o8gOMHmZtakA/0W2jboskAOOVapdCApCqAoCagVSnmv8Biiz1W/hklE6zAYWJR7144VdQJxZeAz
	PVZ27J4VB0oEOpHlUz4jppWm1W3VnLd6YJXQoFtPhYnseRX3j6LiZRlG7tbt4KkFGdOhSSNtHY9y6
	Vqa4HkHGbLCJBAY6ZMmNq9MpglBsfQ+BreGu2lZfBDFRWChgUNu8E4rDk75xpikV4aCswkbH7efZA
	SCVinhBkJ3QifqvCRwLJlvmjJv0oiwoRpetSomrpBnk1JQyIsG9844ju1+aJgenBoTcRVknypXhpE
	hk5PGPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytW0-0000000DhjG-17aV;
	Mon, 22 Apr 2024 13:15:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytVv-0000000Dhin-1PeV
	for ath10k@lists.infradead.org;
	Mon, 22 Apr 2024 13:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9AA26CE0174;
	Mon, 22 Apr 2024 13:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7718EC113CC;
	Mon, 22 Apr 2024 13:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713791715;
	bh=Eio/1AEc7ubO0FasZh46qzObS9lQSnNE57hP8qhc5Ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H7DzM5Eib4LTUdtI8EUX/6yzxsvNX3ccwNEngynGV/pqCi6g4O+IrzcTi5u3Q/5nQ
	 wgmR/xx7BLiImCXH1RCOIttNXHQt2ZViIBDMqnn7VgGTn3mxDiiTD6yVuaLuVNJKz1
	 r+59rFVB21rdOC87v5yC4KnSiplLLhFAacJaIedNz7v19D7yMyIDqcwRTTF01NAlYH
	 pRQeGREO1CKoHDZqJT/MhFg2ZpGixj4D54c0TrnH25TVvr0l5ib7ijZYrFD2BM1hfb
	 0D5LfRU0B0vzHsAOE9cvoHRN44CM+npJ14iC6PTiZK7X/WxJjAWw+Js1j3lzZ9v0lH
	 80BV6ACi7rN5A==
From: Bjorn Andersson <andersson@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
Date: Mon, 22 Apr 2024 08:15:12 -0500
Message-ID: <171379170888.1217989.8167751161214805581.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_061519_703836_16BF3D82 
X-CRM114-Status: UNSURE (   8.70  )
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


On Wed, 06 Mar 2024 10:16:44 +0200, Dmitry Baryshkov wrote:
> On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
> modem DSP via the TQFTPserv. These MBN files are signed by the device
> vendor, can only be used with the particular SoC or device.
> 
> Unfortunately different firmware versions come with different features.
> For example firmware for SDM845 doesn't use single-chan-info-per-channel
> feature, while firmware for QRB2210 / QRB4210 requires that feature.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: qrb2210-rb1: add firmware-name qualifier to WiFi node
      commit: 57ce4b27a12c827a24aaa18aa444bcb8733cb053
[4/4] arm64: dts: qcom: qrb4210-rb1: add firmware-name qualifier to WiFi node
      commit: 673b174b5b2ca2fb99fe52bf7bad3cc348432170

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


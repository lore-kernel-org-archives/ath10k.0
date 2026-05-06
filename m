Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FBACD3427
	for <ath10k@archiver.kernel.org>; Wed,  6 May 2026 01:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUCGS+ddTU90l0wkK8hdL8aFpIEwkI02+hdnxHSHVOA=; b=mfV3LbuVvFAocMqlTab2POkxDW
	k3PLqmnPhAWZkhR+YmmvCYYVwBmKZ93XA+Rw8LQkmN5+/Z4ofDZ0brcVAb0BzA0WsUUw490Srig0K
	EvLNKniWQaxiOjaOu7GTmeQpmv4cODHldKDwKpC59rSE1Sej666PSgoeXzw1yB/120mtc4EgJxG6e
	j/spoGBWOWVDwYt+Ue/UFUiM5lUCaPXkVQdH8PEbURuscO5OS68LgbN531yaWHPNlbH7fQ/GaPyyC
	PlvPb1XI2DQfzNQzuYTA4HcKrT/uUEtpj/RpsP6Vkte8BPq488YYnmphM49MJNlWzVs1LonQxJ6pZ
	evNt9nIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKR93-00000000Ppq-2RKF;
	Wed, 06 May 2026 01:33:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKR92-00000000PpY-0R3F
	for ath10k@lists.infradead.org;
	Wed, 06 May 2026 01:33:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75DEB60123;
	Wed,  6 May 2026 01:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81D9C2BCB4;
	Wed,  6 May 2026 01:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778031227;
	bh=DqNkGEpajtFeSQcLSJkXmxKpW6Vr9KH4V+Ji0b1S3VY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sz61/s/GI0TkrpeVMFADYjLjsDfw5T5KWZ1GmKFoCNBt509CDAuVqYiaQnV/oTfqI
	 /QGsrgz9nwOkQsgjlYBTkO6fcdhwJ49HQOdbgpVX3nMSAHPXqn7ZHsB9Z1IZtAHOtV
	 Amw6WigEhhehAR0O1WJOrUJM06povIob18BjaAUx+7edqljzyC+acVIdekzAu8g/lT
	 LC0qhGRACtvUCPhkfrQAvZKpKgplKcbxjygb3kpkj9fdylaba00dx4RLHNO+F94pjA
	 zU905gf7D/BniueZMM76JtCoSqa75RJ7VIqF42VmTdd6ssCe1LLcv1BsZY1/5Vx40Y
	 EhhDjmYJdvcDA==
Date: Tue, 5 May 2026 20:33:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, linux-mmc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Rocky Liao <quic_rjliao@quicinc.com>, daniel@makrotopia.org,
	linux-wireless@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-bluetooth@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
	linux-block@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH 6/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Message-ID: <177803122421.266355.17077010002069649916.robh@kernel.org>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-6-6ad23e75190a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-block-as-nvmem-v1-6-6ad23e75190a@oss.qualcomm.com>
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


On Tue, 28 Apr 2026 16:23:11 +0200, Loic Poulain wrote:
> Add support for an NVMEM cell provider for "local-bd-address",
> allowing the Bluetooth stack to retrieve controller's BD address
> from non-volatile storage such as an EEPROM or an eMMC partition.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../bindings/net/bluetooth/qcom,bluetooth-common.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC303CCFA1E
	for <ath10k@archiver.kernel.org>; Tue, 11 Nov 2025 12:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1FJWIdwtxeXo6Uq1JFHSA+NMBeLiYYJm6jL44q1rwZg=; b=bc6QJuJgqUElFyya/i6lHLC7Po
	wZ+WLx32d3y+sEKaQV5gHwovW1LIqP5xEyC71Q5eJGe2wYONcSDPmpyv5m+f0SN0fNRn5XsbZXKQI
	suRqYNYhjX85FQDNwxziDnvMie8BrExHPH+S15gRkEv27xpRo0zrha7En6Hk9YC/3qTiz+D5j65l4
	bHmD4ON5toO9tqTPK0MqFESLjgr6mQ/Kf7kvOuCmFExyjrma2FoJ3pN3koII77OEBjaj+m2OVSLvH
	g3/iA92GNRjYw/5WQu9aKOt1l6AoddCBCwHtXGuubSNBWlHtnnRr892ukxIVznjWc0HXbDNoXpObZ
	r0er3CQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInZp-00000007B4d-3HZS;
	Tue, 11 Nov 2025 12:34:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInZo-00000007B4C-4BKC
	for ath10k@lists.infradead.org;
	Tue, 11 Nov 2025 12:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3044861903;
	Tue, 11 Nov 2025 12:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7A4EC116D0;
	Tue, 11 Nov 2025 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762864463;
	bh=oJHHP/sCumz0LK6v3+qYS89WnkQEB+RP1IS+56P1ZN4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Oc6cH8e7DPj0WRd5lF6kMjyhTnXrbZ0cFAuJQ2CoPz4pAHTJ6extkgRWGELdsWDY2
	 M+/35dCCMndnfmELsptsWRWxxa/55ZCXZ3dxQuaRyUrGdd50UABnUqf3+53QOoW/cN
	 KG3mTIi/m+dZAcxmJPbJf8v3WHVOT+2SzJmZflkMO7Dgrs7vYqLP3n4Rf8nBht1BDY
	 aegu8EJTVWblyh2Zj0Vdu8Dr4EU+dNmgad76qCfKmTeZrofAWHnC+m06P7055NVzD4
	 YMueVXdzAdaNfCHcHtimhT8w9LGongayuoubOmYGoZ6/dX8AgONWbdHGs+u1WrfBkm
	 2nRiyxZBLbJgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9204CCFA18;
	Tue, 11 Nov 2025 12:34:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] ath10k: Introduce a firmware quirk to skip host cap
 QMI requests
Date: Tue, 11 Nov 2025 13:34:21 +0100
Message-Id: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE0tE2kC/x2MQQ6CMBQFr0L+2p9QVDRexbio5RVeQsH8BsUQ7
 m7j7GYxs0mGEVlu1SaGNzPnqYg7VBIGP/VQdsWlqZuzK+hKPyfqE/YdRy5JIy19vEG7qzueAtp
 LRJDSvwyR6/99f+z7D62fNEJrAAAA
X-Change-ID: 20251111-xiaomi-beryllium-firmware-d8134ce67fec
To: Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=oJHHP/sCumz0LK6v3+qYS89WnkQEB+RP1IS+56P1ZN4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEy1OwcfWAIeMvcoH7yTxn6/FgW06G7MYu7TJ9
 3Wdp4Q589SJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRMtTgAKCRBgAj/E00kg
 cvrkEACqwypCmP83LT1ayifRqq1ffXXYD3H3G5YV2cGif21zY5CAORRr4/wJpFuiwuyjT6/NZXy
 /ejAlrVl321fcHwDGZBKjdnWfckKbbS9CQlfWiCjfO4AtEemlMXr5pkSqx95KzX1CdFKyVxofqt
 dTut69E0VaYPwx5epvtVlBWpBZMym6h3x4kKguwRg34za1d2PKu6J/vT2O2Hgo57y/hsnasQELe
 qjA2y36mo0pxc9KvjZJcFX3RCbUSi+rJGsEglSKPo0fqmfBmzxcvLZNwz3UIyZoZ6qlvgspH5FF
 DclCcuAwl68HaSLxqi3ZM+QtZY1IJUEyRBVqZH7xu65bzKAUJlQ1w4Okx66Mu1IlVOrNYcarggS
 frzdCVSi6QtTCSa6FhOQwAmCgoM77DqFnFZ0IeOoncU8Ul34GPsZEA1Muc3MkYNr7Ukj/gSwZNg
 kRnlKjBxUU5HzUmypt2ai6UbbG6Yb3UFDMvlIoUnA5GiLycUPWqmwuo8syHZvdYOyBn4ZRmcqDu
 WiJzK251OOXpU2p/lBNfniLKr5Q1L4k+PUIZDG9r71kDnNrjvYLj8L3pTR5fhKFCjBtaL36Pxgx
 py/Y+oAhfY41AiU9MT+wuLT9+1tCM1EYfTiSWwzAGCg0ix3TIzc2yqa1e6Oe/8xRtjcoLsRwxKp
 q/9mhNW7f+Drgtw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

It's follow up of recent discussion from

https://lore.kernel.org/all/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz/

doing the workaround directly in firmware, so we don't pollute
device-tree.

I added the change needed to be done in Xiaomi Poco F1, so it's grouped,
but I'm open to getting in first commit and sending the second later,
when all firmwares and tools changes land.

References:
 - https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/780
 - https://github.com/qca/qca-swiss-army-knife/pull/13

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (2):
      ath10k: Introduce a firmware quirk to skip host cap QMI requests
      arm64: dts: qcom: xiaomi-beryllium: Add firmware-name qualifier to WiFi node

 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  2 ++
 drivers/net/wireless/ath/ath10k/core.c                      |  1 +
 drivers/net/wireless/ath/ath10k/core.h                      |  3 +++
 drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
 4 files changed, 16 insertions(+), 3 deletions(-)
---
base-commit: 2666975a8905776d306bee01c5d98a0395bda1c9
change-id: 20251111-xiaomi-beryllium-firmware-d8134ce67fec

Best regards,
-- 
David Heidelberg <david@ixit.cz>




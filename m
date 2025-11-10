Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2F2CCF9E3
	for <ath10k@archiver.kernel.org>; Mon, 10 Nov 2025 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3p3eVYPwYOQOgpu9aeTeZonH8gVl/2K8T45CQoXktU=; b=0piO2KoSP/OQ15k1oFxfSCG1oR
	8qmo5j78ktniGyRkm/crqRjBbj00iovGtP79dtYZGajCvMe2wUcEH+uenMfMdaIcoTZsDVoFa4jbD
	UOV5dWH+SbeBHnsjrA57blhkj1OdjKAnvdtTASBmZ9wMr2QAvqI8egGotJ2EOfwDaxFvHVzRLhD41
	f3js1NYm8Fg4wZ1d3CHULz8lHlw0xWLTBMVKeHGF2Oi6FMlLfmHbSPrr/hR4Jix0iJKgmUkQFcxhS
	cQpIGhAgE/p33cX5Z4/qO43yVVA57SmJGSncFoGUZCrecpvIDM+Bzxvcj6ICWmFhrpWunEAELr4Ra
	J5RQgBNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISqk-00000005a9Y-2ckE;
	Mon, 10 Nov 2025 14:26:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISqj-00000005a8p-1BXI
	for ath10k@lists.infradead.org;
	Mon, 10 Nov 2025 14:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61BD8601A5;
	Mon, 10 Nov 2025 14:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAF39C116B1;
	Mon, 10 Nov 2025 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762784788;
	bh=L3nGmc65cfsV6qiQ+LYogmLlv8XDTxddUlOLJY174z8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pb5mDbCkKZdH2m8BQACdqKZTCEu/n2DXSP7srbHxmdAfOHZJx570wJUD1kaBc9F5R
	 BDY/1DOm+chtaitlSvHxBhq61A0zZuh09dAOnWyOW1lpnBireJRGv9ro2SmzN4v0QL
	 iwPG/dSqO8kLVqkqoXszDEjG7lq0JctbcJFRWd6V0k836Th6vG/0pICswr6ggCS3Pp
	 U6k/cf7kx0bSB/QJr4UieU0PGZDwlYST0qrG5O3jQnheDVFTplpjsexhcO5KynNAIt
	 vFzUM1kx2OWgmb17zx7n1OjEpn+LHyN+SQCSodpUZ5Q024jb+79u65maN66FLiFP9I
	 RW7dE0h08629w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBD0CCFA1A;
	Mon, 10 Nov 2025 14:26:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
Date: Mon, 10 Nov 2025 15:26:23 +0100
Message-Id: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/2EWkC/x3MQQ6CMBCF4auYrh3SqZaAK+9hXFQYYCJtYVqNC
 eHuNmxe8i3ev6lEwpTU7bQpoS8njqHAnE+qm1wYCbgvVkYbi4ga0psXmGLK0DkPq2cQWoHQ2to
 09OourSrfRWjg39F9PIsHiR7yJOSOGtYatW1sg4DttS4LI2dIFHog73gG5zlXyyf0LPeZg5NYR
 RnVvv8BHXRHebIAAAA=
X-Change-ID: 20251110-skip-host-cam-qmi-req-e155628ebc39
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Amit Pundir <amit.pundir@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=L3nGmc65cfsV6qiQ+LYogmLlv8XDTxddUlOLJY174z8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEfYS7iCjxoLP0PYyTp6kzSTKLNz3Min/kJQM+
 +zutAUqZSOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRH2EgAKCRBgAj/E00kg
 cmr0D/44yLirU8sAm10sSfdpjaByLaHLJ31fqEwiWiOfg1nSaysGs2tB9VxmWhkb7aBtP1IVBQ0
 lgZDpZQ9MbxExySnG4MRztMmXK0Fta/fA+Ng7VW754pQYzDxBWEUwjdOPsrfXOZ/PfbGdPVkN1W
 L2p3LEgCkB9zBQ0WddnxTRNFKwBrYgySEAk/qjHZeIX/aD25Jr8IpRrGtkMgOstpwkkwhXmxR1y
 ThsRwgeglDN4/PndoiIo01PO/YzUNCASLCgh/WWd4E8QSQuQ7+zPmVOHzjtXxVUKaeiiIzDK3Jh
 zzYIJAnG8m5bash9NwGW9MSpwudewo5lxV+9/wAbk/E9Ol+uHf14Q/jW0xb40yTWLHNJDbtwfEm
 ZXuyjVg2tlKVrZi+hmrI58OkD2VYjuIGm9OH+jdkCwZyAyoKxHE471m/qaZcZ27wB54J68IPr5n
 QuQ744n6lddLMMET0L/jFa82yWBV9vhCouk+WQFX+Wm/1SPedSEMz1NH4ax5Lxeel/I9jX26xnk
 PyCaaQWkAxg5qinGYs+LOLzGNjnfc8ElGRoSJQznPbVtSwZcb62l2U900GSUe7Rhvt+TNDami4j
 Qd79ebuzvzBzMCeylNo4sjsI1PuRrzzifjwYHtPklpa0d9iKG+qRMIHGVEYZWza+5cWDIIx7ZLh
 vvJdMvAfrCGgVAA==
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

This quirk is used so far for Xiaomi Poco F1.

I'm resending it after ~ 4 years since initial send due to Snapdragon
845 being one of best supported platform for mobile phones running
Linux, so it would be shame to not have shiny support.

I'm very much open to suggestions how to solve this in a different way,
as the original discussion thread got quiet, see
  https://lore.kernel.org/all/b796bfee-b753-479a-a8d6-ba1fe3ee6222@ixit.cz/

There could be other devices in need of this quirk, but if they're not,
we could make it compatible specific quirk.

Until merged, available also at:
  https://gitlab.com/dhxx/linux/-/commits/b4/skip-host-cam-qmi-req

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Amit Pundir (3):
      dt-bindings: wireless: ath10k: Introduce quirk to skip host cap QMI requests
      ath10k: Introduce a devicetree quirk to skip host cap QMI requests
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk

 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml       |  6 ++++++
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  2 ++
 drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
 drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
 5 files changed, 22 insertions(+), 3 deletions(-)
---
base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
change-id: 20251110-skip-host-cam-qmi-req-e155628ebc39

Best regards,
-- 
David Heidelberg <david@ixit.cz>




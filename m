Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589A9109C041
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AkvqHhB+abl8M1o6uAY6eLRJoBVt8w5E2QOnqRvYepQ=; b=TgTlOJgtb5LliZvnXiNqogG5xe
	TLXLX6IaizYlhDhR2k7boGsyfVoTcFTm8bS3vvdN8ymbJ473IPohZtcegKeUE4EYkfmcHJClkiPcl
	5eF6UETs4vaJ2AhFdhEqQ++MWWYWwnR652/hsIEuhoAM8xX1lukEhis6VtcQu9YG8O1+ExcMOA1T0
	OlgmnnYas2DPgRTG9z6+6uObuQQU8t+fWuf6HAy0MGQNwmVRJ4uSdm0d14HEjrUO1vzJoqPqq2w0m
	K5Kq8BzHCR5tXKkJ4mVqJbdSn+hEQYEav98V5IGjS23CRmg3JkR7DdKA+nOQWUxj9/r/naf6F/kEx
	Tirmv9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RIF-00000003va0-3j8s;
	Wed, 25 Mar 2026 16:41:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RIE-00000003vZQ-3Qkl
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 16:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB2A760103;
	Wed, 25 Mar 2026 16:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87DB5C2BCB0;
	Wed, 25 Mar 2026 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456877;
	bh=vtK7rSLmOZizMz4lOu2txEFWIOZihcAENkHz9Einb/Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=En979Eku+qvZsKfSn4jjAUbjbggnL5gq2Ibnvno3DzrEhSILZxBAS7QSoblws4YxW
	 5rgmBqA4mL1PCReTdvObRE0eThDwEl3OWgxH0eze2LnrQevuaWPcKZUOrN7vxlO339
	 Jc3n7n6v8A0t8Va2RT1NGZbFPt9fS+j4gzll6XCoGqQWj8AfsmskI2L9AeMc8bJdRK
	 dXhQ1KPYzgfV5UNpM01WQb1lPtChszAQDw7C8p/B4AXNzV3CzkZbE0MrPYiYVbtOGS
	 GEbvsHw6jtqRO6A1GWhz9qlvtbcloHZ1OwgBTtiyJjUTLdD+n9J1gk5ERG8CnvJeff
	 cU3BU1twZeo3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB39109C041;
	Wed, 25 Mar 2026 16:41:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
Date: Wed, 25 Mar 2026 17:41:11 +0100
Message-Id: <20260325-skip-host-cam-qmi-req-v3-0-b163cf7b3c81@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcQxGkC/4WOS27DMAxErxJoXQaSErlyVrlHkQVr0zbRSHIo1
 cgHvnsVX6CbAd5i3sxLZRKmrE67lxJaOHOKFQ4fO9VNGEcC7isrq60zxmjIPzzDlHKBDgPcAoP
 QDcg411hP392hVbU7Cw1837xfl8qDpABlEsLNZhpttPPOGzDtsakJIxfIFHuggHwFDFz282/sW
 c5Xjihpn2R8qyfOJclje7zY98B/5xYLGnSPw9E7bP0nnvle7d1TXdZ1/QPmdeibAwEAAA==
X-Change-ID: 20251110-skip-host-cam-qmi-req-e155628ebc39
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org, 
 devicetree@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1865; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vtK7rSLmOZizMz4lOu2txEFWIOZihcAENkHz9Einb/Q=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpxBArTJ7PfpWkqgf/dBwhmh4IilQZcFtLdhKrY
 0cNZqsWLXuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacQQKwAKCRBgAj/E00kg
 csJsEACKM0vsF6hpEzSHmJ0lYNQSj7bCkni9QQ5+PB4FQ/V/fhxXw5/NTjomHc5NDBcu9jFzVZi
 kTx46Ars3CTwwhMClTb8+dnBzdTkGC2V9V+CBe+76+jCz8rR8WM07st6+3rsnIRS1d3Qg1/OT1S
 tCDjwTy/Go9nCJeH9b02wseWUa8SWgVQItpXFwkB0PvmLXz0gWEu2DCoWn7Tq/wSd8ixG3+c/zU
 aDeBma7exjYVaAg4sc9OG2j8biUe6tMWuFXt0Y0uys/Rqv6rM/EWHcWXPG7Et9Eusvs3qLAOBR/
 LRFz8m2geTY2vWyWuKG0WaMgaE32VCDPq1st1qnHr94HC0Rhoo5m0C5/KbJegCedNfU1GVAU697
 smIHLkSG8YvAIyGFrSxyVp7OhNWyr8sOaJhxF9apqDD2oAxKsE0ZMZRD9+ggAcS8wKV1W5oS/49
 69Ho3ypEm31JFw/ALPHtKCQgnrmBX6xF/5pcIrYjdDMPUZloV/4b9BcOx15j5lA4Mqu2DuXgTYH
 r9pbBke/IXAVG2ClOeyru19Zvr5UzKVMbSw0/B2z4v/0BogFinvcuahduVJWv5cURVXO8MXoytg
 SesbPIWgekWct70DNyIop6lYs+crUqxV1bG9LIibq5w5C+tfRdWfKU/bVPEUJ3mcc7AbKsdjha2
 qaLtkSOtVRg8+HQ==
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

This quirk is used so far used on:
 - LG G7 ThinQ
 - Xiaomi Poco F1

I'm resending it after ~ 4 years since initial send due to Snapdragon
845 being one of best supported platform for mobile phones running
Linux, so it would be shame to not have shiny support.

Original thread:
  https://lore.kernel.org/all/b796bfee-b753-479a-a8d6-ba1fe3ee6222@ixit.cz/

I tried the embedding the information inside the firmware, but the
information is required *before* loading the firmware itself.
Firmware quirk thread:
  https://lore.kernel.org/linux-wireless/20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz/

Until merged, available also at:
  https://codeberg.org/sdm845/linux/commits/branch/b4/skip-host-cam-qmi-req

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- Rebased on recent linux-next (next-20260325).
- Improved motivation and description. (Dmitry)
- Link to v2: https://lore.kernel.org/r/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz

---
Amit Pundir (3):
      dt-bindings: wireless: ath10k: Introduce quirk to skip host cap QMI requests
      ath10k: Introduce a device-tree quirk to skip host cap QMI requests
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk

 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml       |  6 ++++++
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  1 +
 drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
 drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
 5 files changed, 21 insertions(+), 3 deletions(-)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20251110-skip-host-cam-qmi-req-e155628ebc39

Best regards,
-- 
David Heidelberg <david@ixit.cz>




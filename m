Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2F1C7EE25
	for <ath10k@archiver.kernel.org>; Fri,  9 Jun 2023 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TZFRq7sw1cy3v3Fvhs7gdO8zJmsuyBWoQ4YUTMZaHsA=; b=i3BSKdsZlAOGV0
	upYB9WR+4c3R5wmldBFF3tx7uPPsk8yvrnMdPmrqJZtXecByEG2Udfw+1ErguSD/HmFg+ec6M+Kbf
	2MLouafIebtiYNMlmfUE3LO/yrDtioaALrPV3dv9TXJGouJITUeOReDa55N6GKjs5kyEJNO0wy+IV
	kd0hwUQClY5bqqoxVxHS2Nxs+Hr4+cWstmjRJgQqDCG82F8oJmFU65lb1VoG0oQ6ihxmAb/uDPeor
	dZHP6aa6E/NYUHnPbxZskQ5Bwj0NEcxb+oG6R8Cc7fp+zpr2fai0zqKX/ZRulvyX8+fHnwpe58kVy
	c2vZgPGEUsj6NSb4gdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7ftZ-00DjDd-2N;
	Fri, 09 Jun 2023 17:27:29 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7ftW-00DjDC-25
	for ath10k@lists.infradead.org;
	Fri, 09 Jun 2023 17:27:28 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51494659d49so3436031a12.3
        for <ath10k@lists.infradead.org>; Fri, 09 Jun 2023 10:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686331645; x=1688923645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dBlvpkapb3S5TXw3HEYTW+PcvrpF6HWECZJi4X+Mzp4=;
        b=jwxV/JhDrE1JIYNpbRXRvZR1eNbyK/P25a726MCS7/SOEBr2f4HMFnEsw0ebCNyQJR
         N17IGdjnrKWElfV0q5RbTjZXw29COnTMQOYmy51xn0XqAA/HP28oUsq5eiO3dOgLYe6L
         ggXuNLh4+VXOPRH6iJ0tGv0rJDEq2fbc3Hd5Vj3r85I5dknUhdlqTtPV+GSMsuLCbvD7
         nl8JPdUeq8FBrJ9CdLoxzT+oAelsLTyEUkyBOMp4ZJLowOHuZLJ94XKetc/G8UwJqKyp
         V/KuYLkSZHWii4YpeEXDYxTNpvWUQBf5tS2o6BQ/lxm49M5lTkMIa3z5t3baWCvVZnPB
         KDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686331645; x=1688923645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBlvpkapb3S5TXw3HEYTW+PcvrpF6HWECZJi4X+Mzp4=;
        b=bDiFjuF1Mplp+23ZjuQJkrySvrZLffijUdqERck1llFYaQkMwWJl0DEDVGt4KB8+LM
         sAHs/16cBPgV6aRPK42G5wh4naxyhnpbCaWnAqOEQcmrgiMBd6R1HzJp3wbtvrlSo5tW
         QjsTb+TImsMasR73fd2WcNAlhgghSOpk7R6bha2uCjxy+0Fjb/tSaerXERQyFg7CgTVP
         kpz/ZmUDsux7brDDO9gdbI35V2R9InC7xe9i3CI5ktHU3gXmnOYViVe+27vpmPtMaAoI
         ygB/8h9hvI/zj2r8py4fFeRZAGboRknVyijpmukdN/ttP3RvXtmbPrud2IiWMbTNbAqM
         W1+g==
X-Gm-Message-State: AC+VfDz6CTN9UZoy/AU5t1Jwa20BA/hEwfLtLVHWrkBLpGZiQH0aUQ2i
	KHBPvTe+J+jMUdGK1YBfyoA=
X-Google-Smtp-Source: ACHHUZ7cF5TdfCz0QzjlZXBNor2s9JlusjzWgB/1lzfd+n3faNH1UWC1izdjrIK6ae//QPBZBLjeEQ==
X-Received: by 2002:a17:907:741:b0:958:801b:9945 with SMTP id xc1-20020a170907074100b00958801b9945mr2510182ejb.31.1686331644733;
        Fri, 09 Jun 2023 10:27:24 -0700 (PDT)
Received: from shift.daheim (pd9e2959c.dip0.t-ipconnect.de. [217.226.149.156])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906a40f00b0097d9e2b5f9csm11048ejz.170.2023.06.09.10.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 10:27:24 -0700 (PDT)
Received: from chuck by shift.daheim with local (Exim 4.96)
	(envelope-from <chuck@shift.daheim>)
	id 1q7ftT-001k9b-2Q;
	Fri, 09 Jun 2023 19:27:23 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org
Cc: kvalo@kernel.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Subject: [PATCH v1] dt-bindings: net: wireless: ath10k: add ieee80211-freq-limit property
Date: Fri,  9 Jun 2023 19:27:23 +0200
Message-Id: <f30552d1bfdb4c56f99ca79d8fbf52d3fcf71686.1686331623.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_102726_689081_69A7EA45 
X-CRM114-Status: UNSURE (   9.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

This is an existing optional property that ieee80211.yaml/cfg80211
provides. It's useful to further restrict supported frequencies
for a specified device through device-tree.

The driver supported this since ~2018 by
commit 34d5629d2ca8 ("ath10k: limit available channels via DT ieee80211-freq-limit")

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---

Note: this is for ath10k. The other patch is for a different driver (ath11k).
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c85ed330426d..99db442cef92 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -12,6 +12,9 @@ maintainers:
 description:
   Qualcomm Technologies, Inc. IEEE 802.11ac devices.
 
+allOf:
+  - $ref: ieee80211.yaml#
+
 properties:
   compatible:
     enum:
@@ -84,6 +87,8 @@ properties:
     required:
       - iommus
 
+  ieee80211-freq-limit: true
+
   qcom,ath10k-calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
-- 
2.40.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

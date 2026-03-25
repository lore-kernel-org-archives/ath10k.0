Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3862D109C04D
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 17:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmctQtC/v/PkN9inuKqfUv2bJr7oLkuS5Q085HEztR4=; b=tO15bDOGx29DkrYVR0Z8xql1kJ
	LnMAt+gFNuqyPgCJJntHwJGZEO3P2FaHDpxiwBkFKb/ITC04WRmbWkId2x3Hm5GSglWkR3u1PQEC/
	FO6iSr9ehsv6V/EKcZ4x5ak9ZK0KRxzc0h6z85OBHdFq/Yrv5n8vZ96mi22s7O8hueTgEfVD3K/HU
	w4n9hDawdm/hTGciQfsAPLlgPrPJRSDhRzPu3nYc1oSYjGf1wrDX+l4tF9tEDYjPVpoe9yBKXNMVU
	lZgYZAa4QXdt6FNfddQIHhUeZzFnfc8Pa7zY0xGHCBFSP2T4SRiQ/1f5aFfrZgeX1LMQMFeFWz0ZZ
	X+y6LHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5STo-000000041Zy-109U;
	Wed, 25 Mar 2026 17:57:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5STm-000000041Zc-3qyt
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 17:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16CE9600AC;
	Wed, 25 Mar 2026 17:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9897C4CEF7;
	Wed, 25 Mar 2026 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774461437;
	bh=rLDm0/z7gFOJMuRH2GprHEW5mgXEEAaNJQATCQyYAiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gzPFifXYR7Zkkl+lq6N1p4tLrRencskst/5zPXrwf8edKV0r824K8G81ULINxHK0o
	 Y54ND9Z6HQlSgoNxPTS/FO1jZY/+dd+6ymiszCxmtdTQp+PhSEyAoVkD5gqHFscnNm
	 anhIx0lQWzX9CBD+q8gJYG863rcdaQkKKuAXsjHr3q9tGZK7o6dbHqibRLmOr7QEvL
	 DW+gt0zGum+bRjZh7drnRuM+jR7tupBAhXLOf3DPooIfu2s9TmRlNWyRoFbW22BjSz
	 jQC0q60S8pAqdlwXD4z6gYLq774cixlR1iyqadTo6juAO6utCJLXVtBSEZm7b/c4ev
	 RWP0nPZNIYiOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9912109C050;
	Wed, 25 Mar 2026 17:57:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 25 Mar 2026 18:57:15 +0100
Subject: [PATCH v4 1/3] dt-bindings: wireless: ath10k: Add quirk to skip
 host cap QMI requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-skip-host-cam-qmi-req-v4-1-bc08538487aa@ixit.cz>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=/8qUsNDjZq5nMAWqSvN26r6+nO/+y9uNfhTrBdSgls4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpxCH7tYvhKdRWxn37UiaCzxwuvwqrhsSG9sPeT
 +oOYgR7E4eJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacQh+wAKCRBgAj/E00kg
 clTkD/48f15KKMy94GM3zg0pd84HcSO316PCHR8euVg4gAPZk054dbEOMbqZUENK/r+w3QQfzpw
 UE/5YYuWDHOmKGRzT301wJROqaHJE5iGlyvSNug/gAxIZwFzQjvtjtExvAnLe4bJoDqNxhctSD0
 ZhP3P0pQruy89bVhnkeXsSua8rzcdMSJfe/XKvWnFN60hXPhNVGV+blfMjWzxhfj2gHl6SCk1yt
 BBarcaVJzWOMeRPf9Bw8Ou6f8EHTZhowwLS5Mj0E5ExVyPsB+m9/WuOnrT5LEo0n6HTdgyd5h8e
 clddgb8GG7qVOqzFX4gJQ49Lyv1kLp7PZTre03ahAycNa7HeVfeB/SE1fNcj44MGXVWEAj9sXlW
 8ZKcbtib3lrK6dklP4zDEOyRaZ72imPMUryvsIvFG3jgps+EssvFIHKllLtliGwxh/IBgt9i3re
 GySSyAFpr/Y8hGpJPl3LdboTLuT7ltA/pLjtoT7gTJEE38QWN7LnFj8GCneZk7QRiz5Je9tsJ2K
 8gK8mf76hf22wnYZduMQvd+bzUghBlhveJHt7dFVizuowDz1tTOtyHMOAKBFNUfo/XLmsB6IdUe
 hF7RgnlzodNclnWz7vUKfxcqPngwmYaSbveSNKoYV/Vgr/++LDcM24UuxVA3JUqSBUBJqy+7bMu
 PUey1Vy5r/dvpkw==
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

From: Amit Pundir <amit.pundir@linaro.org>

Some firmware versions do not support the host-capability QMI request.
Since this request occurs before firmware and board files are loaded,
the quirk cannot be expressed in the firmware itself and must be described
in the device tree.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index f2440d39b7ebc..5120b3589ab57 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -171,6 +171,12 @@ properties:
       Quirk specifying that the firmware expects the 8bit version
       of the host capability QMI request
 
+  qcom,snoc-host-cap-skip-quirk:
+    type: boolean
+    description:
+      Quirk specifying that the firmware wants to skip the host
+      capability QMI request
+
   qcom,xo-cal-data:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:

-- 
2.53.0




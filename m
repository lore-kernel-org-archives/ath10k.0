Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B054FB519E
	for <ath10k@archiver.kernel.org>; Tue,  7 Apr 2026 06:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r28FjEb+repD/sHT+kWpubMl35aUWn3Iouym/zF5O0g=; b=K9NCTyUGDMLmMu/6TP5sx7BYjU
	6lS767NdKFmxryyprHJTf67QDtz1szwaC+4Rn5THutB44ZNAScyGBEbKvdixfFe99Gd0sSiGSzz9A
	j6hCPYm2yEiXoupwlm10pxjbs95+uKQ6EjNtX1KNOCdIzuMJckciUvslzR59i9Dn3cv4R/JW28MRV
	Lk2wexYSXI2DRjfUA3lHc9+DYhIDgCFanYugIXbtt2Wd5Yujfo+iKMLx80DtlDju2wCGJKTMzwK7P
	zLGnJv+pv6Yew0NAE2QBhzwA3TR7z7c/ghFFhHsZ8TJ5L0gFTLFOesEBrVSy+bEwwinCFrlEWWJae
	pnrllI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0AO-000000060nj-1rOc;
	Tue, 07 Apr 2026 06:44:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0AL-000000060mF-3Sv0
	for ath10k@lists.infradead.org;
	Tue, 07 Apr 2026 06:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9DAC44167;
	Tue,  7 Apr 2026 06:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F2DDC2BC9E;
	Tue,  7 Apr 2026 06:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775544240;
	bh=Te43aWuAgzoNv/WPGZnzW3zZ+aV+8/H/z+FNFK7lU94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nH6nWXwYGakVtZvQSTSHUc1XgpKajBMKcBgbY118ti6DdFgIqFdBX9QfWORtsZE1Q
	 YcO2NEUGJRMdLHzbzAzibKc21A1OKRmhg1KOYgdV1QcJw7Qn4vbamFhYqvGpqtyXOZ
	 hVjThEWh35D7wmKY2lsvrKQN58WHKNbe9qop2fSmBK2Ym2y4Tc3K1GV2yIsiqZr3K+
	 JpMBDxgKJbNSvoB8A1mxlTNbZmbzPfuf+R5nbefjIU44xN/p5MwywmN2e33lNS1hx0
	 gxgFNhb0C0o3kpyCQxFyXq1+5JlaUsNI3/Dmwmo0faoaxrM4u0g967n0IUn2LYt/oz
	 WQVnTHK6gxtGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8892BFB519E;
	Tue,  7 Apr 2026 06:44:00 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 07 Apr 2026 08:43:54 +0200
Subject: [PATCH v5 1/3] dt-bindings: wireless: ath10k: Add quirk to skip
 host cap QMI requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-skip-host-cam-qmi-req-v5-1-dfa8a05c6538@ixit.cz>
References: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
In-Reply-To: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Paul Sajna <sajattack@postmarketos.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org, 
 devicetree@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=1luENuPnPeyXu5VeZAHgXAvwbtbY0TaE2mQPU89+fLM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1KeuDBmYFxoMD+Feuzgv5t7+yMPiKxBLPkhjo
 BOciIS9EeuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadSnrgAKCRBgAj/E00kg
 crJnD/92pJEinb9W7xjyVfljYpzqTfNMPOo4pEvNwTgGCTm7Lq34y5I0iufUO/SBAILukgfj4bb
 j2XQd7yv00r8KhhrdbzXhg43Fj7/rKuSJMCENJBB4kDfverQ/wB7towGcS5lqeXym3D7XU6PS+S
 3uNXhdVG1ok4ZWliDtim/MWXWO3fiGzC+OIijYJX8dGYbmItcmRtfNbVJdQKyoAwAOGQM8jy1n0
 f0ip71zbZYbCIP8BqBXYf+iB0xSlIvY+9phdX2vQW8uwKpsqtIhsFyAde7pMBWYNV7GDPF3l6bL
 4Ge9GhFGiOKQowqoJKTmVZG9Pbq3HTyCebiJd/8WIAjUYEEAZO+4YRZjPXgbxshXDYsSGWDBP58
 Dtik0XR6CTDTMRDlRYIB9n3TGDmWXEJWBFWbIzNhoX5WV9aRVaSkop9wGziturc8MZQLXTotpyQ
 MIktNTjigI8p/KIv2wNQZPUJPKCcToYK3JWXgQ4FWSTSwmuzlCBLxyYlM/oVffbdkyGbrKwkZzE
 de7bXE/i06hqwv/4d0jptGDlzTUK4p8UPNPRVB1b4/qS3vPFUBbpAdwc1D4yne0DTMioKc5yXF2
 9EqOwclRLK6fo2OAo4H/kT9eiZCv69kjKoVShGU9PuEu8Fk+GJLHPFZyGfd6IFLPoFVClrYfwbP
 9SluheIL9DVDPJg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_234401_913906_FB913DA5 
X-CRM114-Status: UNSURE (   9.28  )
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
Reply-To: david@ixit.cz
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Amit Pundir <amit.pundir@linaro.org>

Some firmware versions do not support the host-capability QMI request.
Since this request occurs before firmware and board files are loaded,
the quirk cannot be expressed in the firmware itself and must be described
in the device tree.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index f2440d39b7ebc..c21d66c7cd558 100644
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
@@ -292,6 +298,11 @@ allOf:
       required:
         - interrupts
 
+  - not:
+      required:
+        - qcom,snoc-host-cap-8bit-quirk
+        - qcom,snoc-host-cap-skip-quirk
+
 examples:
   # SNoC
   - |

-- 
2.53.0




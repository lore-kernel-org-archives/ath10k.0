Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EC8C7EE23
	for <ath10k@archiver.kernel.org>; Sun, 11 Jun 2023 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmix4ZzvreFSGe+xQOlZFFKeEH7/9I4KAzX1fkHMAOk=; b=LRmgF07rN18jlb
	sntFFDk8MFKybqC2DyYPGYem8txxA+SXDuC8Eswwk/z2+8VsFlSLoMPdBBJuj1U7leiZ+98U+Dy4D
	rQRugPbL7tWM3O5L9MSEMDHujLvETjiNrPIDQEfRwO/DEU3Hokasjm9nM+BKrMy1vXLA8UA82AlMN
	hEHsJvJcB3O79xqRkUVtRU0k5JSsWl6anHVySEuDvz1vUq6/OCiFfqrOIIAhJe0GOq7LTVm071WHv
	cG4gBQiMQENkzT9N/ZfBy/pHJ+hF+aXR5oZ9AoDYAjkdrLeuvALiOava6E8BMHNGeHDKfyMfLYfIw
	zGokAp56QbGb0i9UsJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8KKG-000uDP-1R;
	Sun, 11 Jun 2023 12:37:44 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8KKC-000uAp-0X
	for ath10k@lists.infradead.org;
	Sun, 11 Jun 2023 12:37:42 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-977c72b116fso507836066b.3
        for <ath10k@lists.infradead.org>; Sun, 11 Jun 2023 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686487055; x=1689079055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfW8HTLYud1EQ9tICw/yqJQZQx8gu/6gJXHN5sMzGrA=;
        b=DipsTsm3cr+dNOJPEbzT/krkoZkZ+7PvswUNs6Xaiu/Zok9KXecIlT5IabEJG9KI04
         6TB0eYszMtJG3I1EUvkP9R3XzIBN2NIzEg4LbnhyZmxkQekM4abiE0/Cv2r8cLDjVf0S
         DN0Nq5mDiUQ10hZs66Gk0kcLUildSlcV+iI8+VKCh+MYGdGHjPvg6gHG1DIkCOmWWhUs
         27nGoB6U0Hkz78Vh2GIVcfa3W+GHQLDMtKhq8lWN5d0AFdNj/QUFnN53hrNTf7aTHWlx
         K4GGUaiGhhE+2fq3+LxOn7P9BWjSkjV6E2OJT7pb1TlYBu9TkSFmqhklwL+0T9Lh+r3f
         1xpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686487055; x=1689079055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfW8HTLYud1EQ9tICw/yqJQZQx8gu/6gJXHN5sMzGrA=;
        b=BiIldmizWsKY7HcWw6oOpVP2ptGV/e9hSW0jWvrfZBjjIlRvko3JlYqaTFYYZob/r/
         gooAPsU+eYKLJQ6VBbhi6xH2/5v67EeyJAWS7fiXEkN3v9EvD9B/vOXS8gW2oQZCvMB8
         BJu7r+nQh6hvc/wGGRxHhuhjyvfTTLWg9vYGq9KCBcEmQqEQaXppHa60iyHeRHdxscgk
         28Vzv0+EJJwLYftWxMcvuf71gQZ1OrllQeXvTM4H27y66w6QbGEdoknznv4/HXLqfed8
         VRIIbt6RYOEL2zx3zkOzsa/LRHEBOZU3Nl0uPwBp6y1xBHQbKxL/bb/0RM2eIdNoMBuq
         EoyQ==
X-Gm-Message-State: AC+VfDxqh3YA4oJiQrbkcxjnLDgjW5x/ePdUiE9oy7vFT7XRE1nwpf0T
	dEDM1Gha1oTS+7UPqALpAzw=
X-Google-Smtp-Source: ACHHUZ6Fb4nGanBr0hBWFYus+4reVW1WKuvN6K4zUZSQYA9dCf0i7FosFAStsWJAuyfWrdygkNe5+g==
X-Received: by 2002:a17:907:3f8e:b0:967:2abb:2cec with SMTP id hr14-20020a1709073f8e00b009672abb2cecmr7303359ejc.64.1686487055333;
        Sun, 11 Jun 2023 05:37:35 -0700 (PDT)
Received: from shift.daheim (p4fd09ff6.dip0.t-ipconnect.de. [79.208.159.246])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090663c200b009662b4230cesm3852749ejk.148.2023.06.11.05.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 05:37:33 -0700 (PDT)
Received: from chuck by shift.daheim with local (Exim 4.96)
	(envelope-from <chuck@shift.daheim>)
	id 1q8KK4-000LMx-2V;
	Sun, 11 Jun 2023 14:37:32 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org
Cc: kvalo@kernel.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Subject: [PATCH v2] dt-bindings: net: wireless: ath10k: add ieee80211-freq-limit property
Date: Sun, 11 Jun 2023 14:37:30 +0200
Message-Id: <c33c928b7c6c9bb4e7abe84eb8df9f440add275b.1686486464.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <288fc9a0db6c292bc132e828611c41785b075078.1686486461.git.chunkeey@gmail.com>
References: <288fc9a0db6c292bc132e828611c41785b075078.1686486461.git.chunkeey@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_053740_207217_72A11CB3 
X-CRM114-Status: GOOD (  11.35  )
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

For testing the addition, I added the ieee80211-freq-limit
property with values from an OpenMesh A62 device. This is
because the OpenMesh A62 has "special filters in front of
the RX+TX paths to the 5GHz PHYs. These filtered channel
can in theory still be used by the hardware but the signal
strength is reduced so much that it makes no sense."

The driver supported this since ~2018 by
commit 34d5629d2ca8 ("ath10k: limit available channels via DT ieee80211-freq-limit")

Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commit;h=e3b8ae2b09e137ce2eae33551923daf302293a0c
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
v1->v2:
	- AllOf is a list. So add it to the existing one?
	- added example with link to vendor hardware reason
	  notes about the filtering
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c85ed330426d..7758a55dd328 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -84,6 +84,8 @@ properties:
     required:
       - iommus
 
+  ieee80211-freq-limit: true
+
   qcom,ath10k-calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
@@ -164,6 +166,7 @@ required:
 additionalProperties: false
 
 allOf:
+  - $ref: ieee80211.yaml#
   - if:
       properties:
         compatible:
@@ -355,4 +358,5 @@ examples:
                            "msi14",
                            "msi15",
                            "legacy";
+        ieee80211-freq-limit = <5470000 5875000>;
       };
-- 
2.40.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

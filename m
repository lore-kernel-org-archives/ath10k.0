Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52C2C433EF
	for <ath10k@archiver.kernel.org>; Mon, 10 Jan 2022 23:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0UOalqK5zTYMjQSM2H6aPyyNsGEo2RcwphPvojuZMw=; b=T+OgP99cxTJTm+
	RQviRqQ5AtAS7qnCPwg/Ka2+dqXYRSdmF7ir17qqPqB9o2ZXSNMDZuYwD8+hk9Pl3wGM97R+8pOLw
	Ecrq9Eg8/wRPrF9LsxDYYloEJ0PHjOKctEcna8m0OP7hoC6Iuh0Y14jT7OdA3h/abJkc00Vi5l4od
	3g41Gm4jjynA0fbutcC1T3YOY5YX9PLSjozxwwcZ+2TJ8/LQB5lriRQOo49/iDBptoSy+iUEhIbat
	WdCr+b06B1AZEenldOTVYbTHL7ZsR7GKdJ2FPXujcr4nSPwg8USaMLW+UE8SKXmYZ5AqzzWwKkcDJ
	jyw8Y9p4DCPQ/lYQ3dYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n73tZ-00Dq2d-1o; Mon, 10 Jan 2022 23:16:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n73tW-00Dq1b-FG
 for ath10k@lists.infradead.org; Mon, 10 Jan 2022 23:16:07 +0000
Received: by mail-pl1-x630.google.com with SMTP id n16so14430426plc.2
 for <ath10k@lists.infradead.org>; Mon, 10 Jan 2022 15:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3m+MSLx1aWfmG9c9/zNheqVQNvN/1RiPSkKxDhXhUc8=;
 b=FAMQ5bXG1ZfRIjz22ZXOpXwVILq33lkpwxmtzGpBLjXF7+qgVHuUiHA0IqeOkC8bnf
 6mYOLEIUEemetr3Z3413MXhVtacNv8CjstL7k17KalyIrrEcMiYBqquu+0XESpYWrlyB
 bA36yrEmUwWyB0vAkd5sj8ujgXq2UelOE8jr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3m+MSLx1aWfmG9c9/zNheqVQNvN/1RiPSkKxDhXhUc8=;
 b=c1nsVbnCF4Ipzp20AC9wyDOdou0G/VJe4NgaGiDwXs7AzEbLtKadGT0r89+jd8L+fH
 8RrwmaB+jbzkBUwN6FZ2pMW3sa8eKGzj+us7kNFQypXjS8lK29g9QV4wUsNFztCAIlNt
 Yc96piFCbO0pUEgSWiCsisIC86ylS71059BzoVzqgKyIlmvIKPMcvwcGGOzdoSVFooku
 jTGKu7pups/Rd+iy1Ifw5vkExT4OYbBf9fPBtLKxLf2s8Intpq9mP1ihUyvB9JAb9B90
 Q6houtCY9C3xFlpLyUGdqLD0EqYk9XhBtO8Arm+yzPLLOnYA0zRq0yp5SGudvb2GEgR2
 ua+Q==
X-Gm-Message-State: AOAM531QD9PHmtMRARttdajvgIfpXqEOijsizLM+LzIma3Ub9mvICf4s
 EEREK0TTTmoWA0jfqrhSmBmcUw==
X-Google-Smtp-Source: ABdhPJz6e6Ax9KoaHUu4OKn9vuzroT/JFuIVuYRtgwypH2Qm2t3A+TB6jFw/sR4u3TNPzw9d5v2lIg==
X-Received: by 2002:a17:902:bd05:b0:148:a2f7:9d87 with SMTP id
 p5-20020a170902bd0500b00148a2f79d87mr1720722pls.166.1641856565660; 
 Mon, 10 Jan 2022 15:16:05 -0800 (PST)
Received: from kuabhs-cdev.c.googlers.com.com
 (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
 by smtp.gmail.com with ESMTPSA id z12sm6123924pga.28.2022.01.10.15.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 15:16:05 -0800 (PST)
From: Abhishek Kumar <kuabhs@chromium.org>
To: kvalo@codeaurora.org,
	ath10k@lists.infradead.org
Cc: pillair@codeaurora.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuabhs@chromium.org, dianders@chromium.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 2/2] dt: bindings: add dt entry for ath10k default BDF name
Date: Mon, 10 Jan 2022 23:14:15 +0000
Message-Id: <20220110231255.v2.2.Ia0365467994f8f9085c86b5674b57ff507c669f8@changeid>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
References: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_151606_545242_8C54BB6C 
X-CRM114-Status: GOOD (  12.42  )
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

It is possible that BDF name with board-id+chip-id+variant
combination is not found in the board-2.bin. Such cases can
cause wlan probe to fail and completely break wifi. In such
case there can be an optional property to define a default
BDF name to search for in the board-2.bin file when none of
the combinations (board-id,chip-id,variant) match.
To address the above concern provide an optional proptery:
qcom,ath10k-default-bdf

Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

Changes in v2:
 - Changes in v2: none

 .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index b61c2d5a0ff7..d76d1392863d 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -63,6 +63,10 @@ Optional properties:
 				 hw versions.
 - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
 				     the length can vary between hw versions.
+- qcom,ath10k-default-bdf : default board data file name to be searched in
+			    board-2.bin. This is searched if no BDF is found
+			    in board-2.bin that matches, chip-id, board-id and
+			    variant combination
 - <supply-name>-supply: handle to the regulator device tree node
 			   optional "supply-name" are "vdd-0.8-cx-mx",
 			   "vdd-1.8-xo", "vdd-1.3-rfa", "vdd-3.3-ch0",
-- 
2.34.1.575.g55b058a8bb-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

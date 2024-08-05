Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20670C3DA4A
	for <ath10k@archiver.kernel.org>; Mon,  5 Aug 2024 04:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlzXcLpdIWh+ceUwvMyfQ1ubB1VnnClTDDzKPz0HlIE=; b=noyAS01f5/Auxyd0cxAcj9PqYK
	gsPgXOqs1GjfghS5EMT0F2boI16XsvOAsiC1klgFuYHqs1J/hIx99s0ZbImVheNg8HmT8XDPT8+im
	gmdzBiaIBcaOe8ElEn9iIHuk59bz9tp1C5cH7lBe6EjXqQFgDFb6fWnTiNdxh5GAULfD5oYF7kyFN
	zhhWz3IPc8ouDY1bNznULl0jbLxLzcCaKOnYkfCmi3lw7NbHqYRsHYeVsTpeDO1inTHXqDxQOx2rN
	eAsHDAAxh/4iPSILietp8KGITmPHo58omOq8Cz8dP3mgAftYOHE5D3TFbwVL8qi4X5tubCq6bW76H
	oZljkJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saoum-0000000EYMn-26v3;
	Mon, 05 Aug 2024 04:01:44 +0000
Received: from mail.kaechele.ca ([2607:5300:60:7a38::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saoui-0000000EYLE-3kMa
	for ath10k@lists.infradead.org;
	Mon, 05 Aug 2024 04:01:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1564BC006F;
	Mon,  5 Aug 2024 00:02:05 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1722830526; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZlzXcLpdIWh+ceUwvMyfQ1ubB1VnnClTDDzKPz0HlIE=;
	b=XvgT7+Hh79of3fxUqEs062oNTR0sChabKFL9U7f0h+3+yK7u+bFi566bnXmWZrkcB0KJvH
	KFpIpkeIXAbQxD94lYD5Pqil44cK3mqpjsDprTnPlUFMA03R8VcrYPQKcH4AciyVIU/toG
	D7BmNq1OSkiMvP764eUVX3JAa3+G+4w=
From: Felix Kaechele <felix@kaechele.ca>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: net: bluetooth: qualcomm: add QCA9379 compatible
Date: Mon,  5 Aug 2024 00:01:30 -0400
Message-ID: <20240805040131.450412-4-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805040131.450412-1-felix@kaechele.ca>
References: <20240805040131.450412-1-felix@kaechele.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_210141_014865_5E8F776F 
X-CRM114-Status: UNSURE (   8.37  )
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

Document that the QCA9379, as a member of the QCA6174 family, is
supported by the existing driver.

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
---
 .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 68c5ed111417..f968b0d236e0 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,qca2066-bt
       - qcom,qca6174-bt
       - qcom,qca9377-bt
+      - qcom,qca9379-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
@@ -125,6 +126,7 @@ allOf:
             enum:
               - qcom,qca2066-bt
               - qcom,qca6174-bt
+              - qcom,qca9379-bt
     then:
       required:
         - enable-gpios
-- 
2.45.2



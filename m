Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAEE109C043
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWdhx+3cKC0cpHO5wigCXlmqAHPheYXyD/VwLctgMeY=; b=jzzqkBGOj2of1HVd5d+VTkaSF0
	lp5AMXwjxlst2Bp5e75tudYBza7zyL+ucYMbGzL5/w0kxIOgkozEF4uI2LZss5wIcJa550DSLPzWl
	+1h0gmjfTHVo1jg8aWJlrDJNHvcVE3CC/TmfnadtrwoG70DAX0SB10V/6nCdti2tPctjFa7J9zlZy
	3/aNbi1pGZHOAlptLO++QJRQg8X4q/qCDE2Yow+J0/UPCJJF1hnvFqcOb+NPBcjGPK/NiIjteqFy6
	krJwqsQqeoqN57NCq0Opw77rIZEq0YDQBs4P8mCRqxJcLfHGy/zHO9CwGsCiE5GRK3PxulmC/QRiv
	BhgtcgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RIH-00000003vaZ-1sY1;
	Wed, 25 Mar 2026 16:41:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RIF-00000003vZP-0gq6
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 16:41:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D94E2444EC;
	Wed, 25 Mar 2026 16:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5E40C19423;
	Wed, 25 Mar 2026 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456877;
	bh=ulufeSA1tGGPP1e0QrNAVTj3y0lhEZxQY5RP+AWdRiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lAHwmzEGQkYHeBv5xcFFsOHJOOYuqwD+LchmosVXriQRlF57OblVZ4ttwhTRc46SM
	 2ZAQdAjXNTBnrbV8cPWWPWiwvi1jPt/iT+PYI/n/J4MBf1U/JlyWnC7ga/BNr/57Ie
	 0xr3pXHRGVPV3W+nkooc2ArNbVZzbiGxF46hAmyvhGa4CAEwL8bAnYeJNpijda9g0T
	 NATdbC6hCEyTu91V8tPrPM8x3nari8RFuyOPIUE+jFKxyk3dnLqQfECViB0eYkJG2l
	 KEeNovgaJsOcp/kuhbtQl6F24QmZvwKpyE2y1Y4niRf8AAYWvb5+N+yJDE0e9PRxp4
	 UrTi+U70YFl/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972AD109C040;
	Wed, 25 Mar 2026 16:41:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 25 Mar 2026 17:41:12 +0100
Subject: [PATCH v3 1/3] dt-bindings: wireless: ath10k: Introduce quirk to
 skip host cap QMI requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-skip-host-cam-qmi-req-v3-1-b163cf7b3c81@ixit.cz>
References: <20260325-skip-host-cam-qmi-req-v3-0-b163cf7b3c81@ixit.cz>
In-Reply-To: <20260325-skip-host-cam-qmi-req-v3-0-b163cf7b3c81@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MEOt3SMdJE/GBpWMQAq3qov+9BM1LX4l8sFyx0gK28g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpxBAs06VVgNasyU9OMzOcVIK8wXTqTwoy05ExR
 Gxby/HcVj6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacQQLAAKCRBgAj/E00kg
 ckctEADPstXjr6+tPWWuzprLUqZj21UqGEPg57hKPIIiXgIkmkBvohi73ttOJrZwJHx8SsrQvx7
 yS35aDxoS7m5tllrMzJDes06wKJeB0oXUEp3KjcPEj+mGsUz5eSHKaz2sSKe3u90lv3hhMXFZCz
 NS1lez41OuhhNaXF6zxumA0gD4NBXkpChoSTdrjgcP3qcAcP0BGPhZ+d1yRJReT7Ji9+iTOI/X4
 BIQrdHeyjPAohizWMt9Xvhz5FM715UJttf4iE0mnnzF49c6RlVfSb1s+fBocsZ3kMoJtdkHbJS0
 OhX+94KINFkstZtkeSf9Wb+kleF9WmTRJOltvPkAIWjud3IvADff46T23ic+oTFgdbHCLfld3tr
 iVUNq2TQit5eBoTulrxrX8xHPJV+y4/BbW7tfvqy25sKvPejhSWU8n6jQpZp+/dk7un87RDOoPJ
 564yVBNl9Rl9kUOAJZvxkK09h8qgEyzssyyTBq2K2TKWzh6QVbvrrFnTURt6/jS5MZEjV0h00Zo
 53myBSjacOHAoZZ4l3yyueTYgFBJxqeHJQWc4+0PubmpnpWWJoJCV3tIgegXRWGeMd2HIwc2ROp
 vtHGred+Lc+cggPZZ1mvljb2nsAkEdobLrXx18FdusFi7djz4rq6RCTLXjT1zlyovTc75cbhpZx
 wZbOErO56Q9FKiQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_094119_256739_5E736268 
X-CRM114-Status: UNSURE (   8.86  )
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

Introducing this quirk to skip host capability QMI request for the firmware
versions which do not support this feature.

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




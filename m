Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D656C48285
	for <ath10k@archiver.kernel.org>; Tue, 30 Jan 2024 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sf6cX1kNwC+ZyH+vJIqU22NKTlhKvVMieai2ykB+P1c=; b=f/MhT9dBrrRFaVaSYNycogejps
	6ZMAOFHruWcXhvwKiuxkh6bSrWLwK9eNvHTYM32448Zwa91bcoDTaBY1NJOGvTbSxUYi5l2vfjQZE
	2B9g74DII6xnub7Mbzas4xOAnljfzA6sO2plWd1g/Xpw8Tp9kzElbl7TwEj6sAAH4x8Q0tK5KhjQM
	B4q3seJoLHBf4R9LD4r4gWdJSwo8drVOjFq1nAQeY7ww3j4cFgirLWwDxxlDJW38ku94Bpt/k92ME
	+zCBlNE3DhqxT0a4EmGOW+jQ5yy8glZXao2CXNs4pIcGudxxj+Un02I2jYlHgFGyTlc0RwauXB4cJ
	NUwIQBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUr8M-0000000HPfZ-27ss;
	Tue, 30 Jan 2024 16:38:50 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUr8G-0000000HPba-1AQA
	for ath10k@lists.infradead.org;
	Tue, 30 Jan 2024 16:38:46 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2d04c0b1cacso28238211fa.0
        for <ath10k@lists.infradead.org>; Tue, 30 Jan 2024 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706632723; x=1707237523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sf6cX1kNwC+ZyH+vJIqU22NKTlhKvVMieai2ykB+P1c=;
        b=r3HyiCp1C3h8dhA8IJeAnlXTVto/tLKODosQ7kClUT7Yg/rnhf+RaPmtBoPZgCuq24
         HYwcoAaqRUBfN3/slnKg5wbWZ9Sf0ocMykONYWFX74QA2qaKZdBExm5juS2Xmr+vjn+q
         qw6czUAP5Ge5mhegw8xXZGHUiRcemEXU/FddUQxt3P25hMvtILRU/tSxfiRsJ3ygDVQe
         NQFVXRfVOymq75Q3r/gNMqhfrb8hvfoba7lO7hcukWCKDtapvhK4t0LoN3J9Z1wTas7b
         mIdIVQlI6Mz4yEMWYBXUdYYGUeFFPcaLtrq752WZFI+geGcPP+OcBdzYW3wXITD0Kgnb
         yE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706632723; x=1707237523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf6cX1kNwC+ZyH+vJIqU22NKTlhKvVMieai2ykB+P1c=;
        b=LJ4e6pvZ9p/7FcHtfC4XaXbSGTWaXcmiISpY46Eza+pUhJKgB6NKufvuJ0jkJ9bjde
         c+8LmDX3oqMVjYmH+amnaAlVPasMwp884XbN/jQtMb8C4sH6TGpwLotoZg7AsCSumBnw
         h84khfFqdJJRq6Hoxfn7moN2/4KmUr0wRzki0KFQ16dC99alIzHR+syD3WLtloK5jzlE
         OgyJvjiHb34HEVg8JgMX5NWCGLxatcyQuic/tWlKJ0HX5OipZMJVShMdH317qIUx3O6w
         kEjHN984pBEKXd1jiDr3fo68wRD2xqCwsoMElwiE+IPUdC4HfYNgIArOEb5D3nyRiaZR
         E/lQ==
X-Gm-Message-State: AOJu0YxCy79+eXsHAK4ioK8tVK/bIvyAtIJZM5mWICvzZBYN3ki8oBJ3
	oc7nSBZ/YmZmf3nmoCE27PxdlUladNJdsmZFZAL7I7z8XgHk+2bImkVPJ5YHCTw=
X-Google-Smtp-Source: AGHT+IGL7MOYOgKKeouag0S4EDPx+mRu3y6AV3aycea0KqrniBsk79ojRA8e357wUj+RsWbwyzeeWg==
X-Received: by 2002:a2e:8e73:0:b0:2cd:9503:f91 with SMTP id t19-20020a2e8e73000000b002cd95030f91mr5481005ljk.15.1706632722898;
        Tue, 30 Jan 2024 08:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUNhW/hrthqpie8kW0dbHKqPY6B82R4tTMoLB2y1WsE5JPMqK3mmTWPxOOP9355w9KJ/I0gGpYEjmmo00xhswTF9vt+uxB/nI1ZP3aqTDeD/fxkpqBuSRnUh4OqvUkMX7paQSkoR32TcHZDi5U4aRdeBEyIg6z1EI2WXVldCMtvR69Md9t8o4knnfZV0nFy2zWjzW7NdIEw7nOGDj5RFXG6M+ujn34sjJiAwxlCO61ufAaabkJ3d6MKCH6wJBRD0N1EB3C76uzoglzeU4+cf8GirwjD7mlNHGp8o52jL7oFjJ/so7mvPKdvfvRZMg5GUco9He/E5cidXxnuufth8PySPzcrYGCAYYT9N+3mGaxNJKDywBxzIJqZXVmrzlake2VW6QF72TNLnDtLXf3i5QQnPTayz0fsdED2QvNe59zaB1JygvE1gR1rok16ynxApeokd6RtBFa14JyM/4tzBxtBJ3trtsUGvw02WHnDGDHz6ysAOzRPVpn5TWPEtZ2/J1NM5Xx7DpE=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y8-20020a2e9788000000b002d05e8bd84fsm219639lji.31.2024.01.30.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 08:38:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 18:38:40 +0200
Subject: [PATCH RFC 4/4] arm64: dts: qcom: qrb4210-rb1: add firmware-name
 qualifier to WiFi node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-firmware-path-v1-4-826b93202964@linaro.org>
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
In-Reply-To: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=f6I51MDLQiOqeJhfgmaztAzDHCND04cZOAhmoNK2kAw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+pONf7+oBu7cj5b/Px+y3syj15dV21DWHCZgmzclrfb7
 Finhrl3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAifIvY/0cEubKXi9/gm8od
 sbbh3FFrGea938T3d+1ivO7RyMwh8bPo589T/4PXan+/n8vCa5zdprtqp9d2r/iK2s0NrhkCs7x
 +3/kn4cMit86+8ZCEx3GFwDMTGUw78tzP5zHWOBtt6hOMSLl0Ji2jVN5N7FfbNNvnH1mvBNzu/M
 rFqfZ5Hv/jjexzJdSdus86LSwO6NolO/vlhltBc4xFLzF27JfiyNnJf9x8ifmD7Pi+U/mZZx6nx
 QUGfgjI+/aMa/+N6OuSHwNa2dReN8o6z3dI3CzrWNPBIH1hxcNr096s8uxYaFLxmOtsau6aZT9v
 XGA7YPOnxVvhn5Jnx3xdy0jOm/uvmIWWdxz1VQm5y2AKAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_083844_488988_985AAF4A 
X-CRM114-Status: UNSURE (   8.45  )
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

Add firmware-name property to the WiFi device tree node to specify
board-specific lookup directory.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 7c19f874fa71..cf1d8d6f1546 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -632,6 +632,7 @@ &wifi {
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l23a_3p3>;
 	qcom,ath10k-calibration-variant = "Thundercomm_RB2";
+	firmware-name = "qrb4210";
 
 	status = "okay";
 };

-- 
2.39.2



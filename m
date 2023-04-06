Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264F5C76196
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSTlPqShaxxoxrZjHWSxf0kGWcn8VTI91jisvFZ2P/o=; b=ZKwG6bLWryovAF
	utUq83daXmJW0VWJ0PtOEpk3DITELShvVjX9cuZ5986F6SMvbFSYRcMmgratDLLHI7k7qvK5MmRPH
	0RwpkaYf+ecN+kt0GYnc3zp7lCN4MHsQlIxEF1JhcgmBjSg3hglD5qUR/DVmMPV/rxNcoW/uHFyKn
	EkV+Ectds80CtHhhJY3NHlZ8S8ynaGh3uFOiaeMqDcB73t9g67bXt5hX9gRp2O3XZR7EP4BaNXd9Q
	7HeGcInv3Gfzd8P82x6GLDYRPWsG3XH519bUPg09+e2Q6RMaREH3jiXmHjzZQxaDMB3WtZm//+L6Z
	SMeZaJVTanj8luo3Y+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOC0-007Dr6-04;
	Thu, 06 Apr 2023 11:54:16 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOBx-007Dpa-2V
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 11:54:15 +0000
Received: by mail-lf1-x134.google.com with SMTP id j11so50421818lfg.13
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 04:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680782052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vr7hvDh/glr30Yw4qpt5Kbr2lkI/viKC3PQIzjAY6io=;
        b=NT0z1D54Jz23Qd8QBqW5y4LUgbLtaQiI1TTTYvzoNpqNjsOnHncu4tIm1w0PLSWfus
         FcGnKVh4sD4n20MNNi8iHuadPLgpCDZy3tNxNa+3prJ768N6bKVXy5ptvrYhfmmP153M
         nQT/Rvmq+0VrCWP7UfX/LVCU0QvOlyKPLKiaKC76p+4gyYfBcH048wCc/sJ0dGjmFB12
         SBH7ATZwDZgnf+2p8rbb5dnINgkFDUZxaevgSsqVaCXU8PiAW0dN9GX/a9MPcCZQT9dy
         jsjn0PO7g5uIHM+UuOO0VqtmQ9vqvErlM/XEs0HeE7HRYS2ojiPvPbuUXnSNbBXOHhoI
         tfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680782052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr7hvDh/glr30Yw4qpt5Kbr2lkI/viKC3PQIzjAY6io=;
        b=VUTTLNk+vYiXdar5XMonDE0zKSaSvIQqBY+n06vZ8K4CFc0d2ogbaoDaOCuvVsUljf
         mLtW/TWbuQGaIzzUM4GndcoAabdE236yxjZ30feIQSC4NSW83oA1tp5+eqEOpQ2nW0+M
         HzqJGuAACcixRGDHGIEyfw4JoUo81a76WYLLCNjWZMC6VaK9Pg55vPFehDem6OpStsvT
         CXlXvcVJuyC+pmI4PQldTIGhrmrGrP1TzEHu4PoZRqvtVyCjKgJxdZji+p7MmlvPdXGa
         dBYyMKDE15HgdMLXIfeV0+MsUDmlpJDWvyPiIPIQJpwD2o/Vf9QBPMQ+Z96qr/D9xaLh
         NitQ==
X-Gm-Message-State: AAQBX9fvtKoXWSUla1t7W+Y5BCNCZaCZE7/NCR/hyjetmva4wHf6izGC
	DH2pQM3r1ILGyIgKWpRnF83Vcw==
X-Google-Smtp-Source: AKy350YOJBBOhvLdzYhTyarkDYK/pXLiXR2cWg4R6nvYfiOFuIxo3sv/hjwJhsRRoIA0DWwgZVofkQ==
X-Received: by 2002:ac2:596b:0:b0:4e9:609c:e901 with SMTP id h11-20020ac2596b000000b004e9609ce901mr2444588lfp.21.1680782051848;
        Thu, 06 Apr 2023 04:54:11 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id q27-20020ac246fb000000b004eb2cc16342sm237513lfo.21.2023.04.06.04.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 04:54:11 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 06 Apr 2023 13:54:05 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm845-polaris: Drop inexistent
 properties
MIME-Version: 1.0
Message-Id: <20230406-topic-ath10k_bindings-v2-2-557f884a65d1@linaro.org>
References: <20230406-topic-ath10k_bindings-v2-0-557f884a65d1@linaro.org>
In-Reply-To: <20230406-topic-ath10k_bindings-v2-0-557f884a65d1@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680782047; l=826;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=A+cHJo96LANW/mYlLiz68VJ9kDkIsUWUlAaAZ/obM9g=;
 b=JZKiZ4o7YkofUMsu2AgB8TAPweZ+TM2wSK7+a4qVZ4XupOfbVVCCqYRW+YkwYuRfcRV1vwF/Z5lp
 cZVP38w6DVmxGIdjnblGj2CeL8CJgzyfVanJardNzq2u/QMMqRgn
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_045413_812486_B8B1C644 
X-CRM114-Status: UNSURE (   8.15  )
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

Drop the qcom,snoc-host-cap-skip-quirk that was never introduced to
solve schema warnings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 1b7fdbae6a2b..56f2d855df78 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -712,7 +712,5 @@ &wifi {
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
-
-	qcom,snoc-host-cap-skip-quirk;
 	status = "okay";
 };

-- 
2.40.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

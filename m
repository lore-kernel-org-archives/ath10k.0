Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1F8C761A6
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 00:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQfVEFJ9zFSH06ZNq3dIGvl7WngRgtczezwtr33n+vY=; b=nvTs9W+wkg3ALz
	9OsBSFDCWmoX7A1eEm3HbGbmuXTXk8Ok7OjE9Toik2yrIu7OrzYgWGDry6CVuRMCfsaugiM47dDsj
	klDGpM6rJWWNZ6GhbABwXd86yy/3lXmSOnB5/SOiXt37CwEyjyAUX+XlpouixCVvI7MeKZxzjSFc9
	8j/njJ9hTL2GoA7TGKhorOBhVOcjFD3zoNlub6ff+ZQzbH7gUOUTrE0DsmoFkI8C3MGPGuBvfhqWL
	nps3T6kr6+s9KwaAODTxsugnFgwPdT0/gyjLV1QbQiAEup1gyADNzraXw7RMO4f9AOt7dqMa7OCfs
	4QwWa+i7CWMwrKzVreZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkDyd-0060Hw-2a;
	Thu, 06 Apr 2023 00:59:47 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkDya-0060GB-29
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 00:59:46 +0000
Received: by mail-lf1-x12b.google.com with SMTP id g17so48941739lfv.4
        for <ath10k@lists.infradead.org>; Wed, 05 Apr 2023 17:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680742781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyt8W3zTm8mLAuocsZEse9H9Wjv92dhj3v8YnLOroKY=;
        b=t7X/Za4IJMuxfnHTFyLConWxB5AywCFd2qxosbiWBC5GRmaCKIYfRr7egqzVJTTg8N
         wMFbDyZu/hHkJLnmQnMGLglPe8hWrFPJ5vNSDzLLusqD9gi1PXfJ9Stejstg+H/Ud4Gv
         E1+ta9m4intURNO7QCH/HWiE9Vtx7thGr5LNhP+q+cRhPxHFg73zFy6kwBqs3Tz/1Qdq
         0yNg+PzJ0yLLN+oM2awMlSVtsg5g1MFC98pMOFe57DGa06FNoWlQEuZQf01dDrHMhSIu
         P28E9raIwGheBgSq2YT7ivFoB0eY3tv+TvrqW5ibihUfbl0/GvON9YZoHIEFQIhywO9r
         tdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680742781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyt8W3zTm8mLAuocsZEse9H9Wjv92dhj3v8YnLOroKY=;
        b=6NjyNs6RmQsCBOME5r5pYAt3XL7lmWbvtmHcOuEZACmIMsDIoBsWl3ChIvyHLd4Go9
         63Brr0twWN7+6IBnBir1Hpz0kOfKWIO2IZcn+RZ0CW1LNVxmNeeSLPcOZird6vOEx0yc
         VR+S1bzVKDay5O4mhRvSymS0+xMRvo9bauZUhDF+25V+UAi50mWcZR9x/ndIQgOxuTsw
         I8JdnrucyBCVg06VNHIJ9R88zdKFCr/KygIeH1LYER+Sq4xiyAHS6cy1n35G25xjCBW1
         1YFNttsvMY39XOxobzLZL5PDlyBoyORhIfcqsQjE5bGLLpnkAswf3YLGSI4o/SzTyxiW
         hW4A==
X-Gm-Message-State: AAQBX9cpArpFhaVJRkcoguAHlvqKFBBwarTJPCIo/9IMyC6vUCwJkULZ
	kpdqNRlpMRrEYeNuJKTcejRVxg==
X-Google-Smtp-Source: AKy350b6b79dA9VgLSyOrjVxET0SPehmL6ImBkvScOgiR16iexi0wp3aZDwU8WR1aquDEhltWlqnXA==
X-Received: by 2002:a05:6512:3885:b0:4cb:13d7:77e2 with SMTP id n5-20020a056512388500b004cb13d777e2mr2177317lft.26.1680742780676;
        Wed, 05 Apr 2023 17:59:40 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id v7-20020a197407000000b004b550c26949sm48280lfe.290.2023.04.05.17.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 17:59:40 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 06 Apr 2023 02:59:36 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-polaris: Drop inexistent
 properties
MIME-Version: 1.0
Message-Id: <20230406-topic-ath10k_bindings-v1-2-1ef181c50236@linaro.org>
References: <20230406-topic-ath10k_bindings-v1-0-1ef181c50236@linaro.org>
In-Reply-To: <20230406-topic-ath10k_bindings-v1-0-1ef181c50236@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680742775; l=759;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yzgqDSTZJ+UbMalehZ3yMdPUd3D/DDvUo/JFlgMs+5U=;
 b=sHPf/FrohXz7C9fLj2wWw9ZruWAGCYizyuzeuM9hidn5HR7plSHgPqw68u4/AQQt0bfoI/3/oBQF
 A0aZwIuGCJi7efvDfp7+sLcTU0v+aRrdzceZDkVr1R+uE84UOfRd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_175944_704204_98873D18 
X-CRM114-Status: UNSURE (   8.08  )
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

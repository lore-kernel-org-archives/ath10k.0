Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA48EC678D4
	for <ath10k@archiver.kernel.org>; Fri,  3 Mar 2023 02:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eo2UD9TenXL928kO7tEiBlISBwCNpNkT29/ACyHsuJA=; b=GsAgG8foP9i0KL
	v/YapJg4Y49ubx9k+z5lXgMe0uCs8dpC/fa5Voq4ntWCOrdtNjkP8LtJafzM9lnxOH10NCCaSzxdf
	iFc03vHf9Am0E/PKF4RoaPAuPMd1tyYE1rfg4r+C2Cky+7xUf2ktUFy30D81VYF1nauxJaATx2l3/
	zqIiXlWBCnJOoKGIyfLPQCHOMo1mx/4yr+QD470SoAJMj8wEBHQTDxBF4fGtmA2dfh0RvgL/rMiFg
	7Lmg7U/gVVekisRPxsno3M2v+maYp0IIigKDAbygijYuMwYp08DNZ0MOPSaxzMgBQa6dcjUpmMPbO
	TDilV4DoOuClvNnHEtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXvNq-004Xuf-1j; Fri, 03 Mar 2023 02:42:58 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXvNn-004XtN-1Q
	for ath10k@lists.infradead.org; Fri, 03 Mar 2023 02:42:56 +0000
Received: by mail-lf1-x129.google.com with SMTP id n2so1801672lfb.12
        for <ath10k@lists.infradead.org>; Thu, 02 Mar 2023 18:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677811370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDNEXw8teYXC1RePAZhjBh/dGMalMHP9Lg4fn2iWwxc=;
        b=dbiBVX/9NCg6BYhGh8+LSwc0ol2iHOSJAG4s5qAC8SSKGGXFnOadO4zhO2ClOZxR+T
         h57Xi6/m6alMV2KeoMcOwLJA60xhg5m6RjAK6+BoJZ4dx7z96UaS52+hN+DkPCwJQBJm
         RHNHTKlIH4lcldJhSyQYjwdaAHxB/ubgYt5BqbeBSM8sSAnaw20m5OcPsoiABIHqU/JK
         +fj74GC4nkL+uA3QG61opD2K90/6c6crSgwyJ9VnKZ1NguTDCU4irPdKTbOjJGFruvtB
         SsgVDZ5RTYAneDGzXiT4gt+sDQ9u9pf7mqs7XGld37ce1IvRjhktTGktDeKxdJF8dZSJ
         nE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677811370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDNEXw8teYXC1RePAZhjBh/dGMalMHP9Lg4fn2iWwxc=;
        b=c7u1C7aE4hhg41Ye0PzuYOj6Ze97XlWoIr38VWqtgtujUHo3Dzayj0zbuSABgcIkSI
         uqHPsxbfcENh0Izzfreish7ZMBUm9dcaE/srLr///HEBLp9YYTR2sGtoujkCQJgfC1VA
         bnMZX3O1kA/uaHzVDRwfgAzD/SUNdSRVfHY8/oDhrxwRkmJ3qVRl6aG3AftnsunYgxDx
         VboWVtm+5h/NwdCJdPEaH5ZbZDycTxgpW2Y9IE+s7atZmerMz6HuBQb0hhR7DyKuFL3W
         W75F3R19Ufs3o44HX9u3bTKE18XyhS7sXNJSUhPG54/a9FfiPT3Z9LAIsSrwJknxGF+1
         b9xw==
X-Gm-Message-State: AO0yUKU1LkPQSz+mK7b5XpRm6wze1i1mp6kthnTpAuGHR0wv+aplqwBX
	T/czpikwespkgVV6/WtnX+8jrQ==
X-Google-Smtp-Source: AK7set/6zMdHJiXD7PXCcw4098kJJxCA5Cq9XHtnY3BVqas1Stg1PK/SfGNLLtpNEMiO4rTo9aUbOw==
X-Received: by 2002:ac2:548d:0:b0:4e0:ff8e:bbfc with SMTP id t13-20020ac2548d000000b004e0ff8ebbfcmr98941lfk.31.1677811369885;
        Thu, 02 Mar 2023 18:42:49 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id x19-20020a19f613000000b004db1cd5efcesm181379lfe.241.2023.03.02.18.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 18:42:49 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Cc: marijn.suijten@somainline.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: ath10k: Add vdd-smps supply
Date: Fri,  3 Mar 2023 03:42:45 +0100
Message-Id: <20230303024246.2175382-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_184255_121543_5869C2C7 
X-CRM114-Status: GOOD (  10.79  )
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

Mention the newly added vdd-smps supply.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index b61c2d5a0ff7..8697e63aeffa 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -66,7 +66,7 @@ Optional properties:
 - <supply-name>-supply: handle to the regulator device tree node
 			   optional "supply-name" are "vdd-0.8-cx-mx",
 			   "vdd-1.8-xo", "vdd-1.3-rfa", "vdd-3.3-ch0",
-			   and "vdd-3.3-ch1".
+			   "vdd-3.3-ch1" and "vdd-smps".
 - memory-region:
 	Usage: optional
 	Value type: <phandle>
-- 
2.39.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

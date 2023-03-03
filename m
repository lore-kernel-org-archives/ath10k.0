Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE5DC6FA8E
	for <ath10k@archiver.kernel.org>; Fri,  3 Mar 2023 02:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsMAafNH/MGkF2mOnAoLWyucskNzRzilYr9ibrfr01k=; b=pR7/Ctz0pU2Lj7
	B8vcrv3qNbFO2cLC6rwC4slybq2xCjLigtnNrjpa6rOlDbezN1uGKzW94iNk58NrM3b5/EMNAVuwM
	9+jAJ1RFgg3EVhua+7oN8GgEhbLtaTXknJlXfMGSfd8ClW0pzAttu88x6FROZeVofwJGpiIhclEcU
	rwkVRIhp9b9TX+HEqtnrppFx+aabQY6Djp4vI5+SpbAKGk+05pw1pfmtOzjhcwoFgfXXBBhhCiPX6
	pfAp1LWDOtuOZiazN0S+WJZOWQ2YHI0lK3S300kXZQi+l2Jw7LYJsTEUEY9BieB8rTNmNq8w7kG0s
	N9AoOVQDWwARD4SjZ/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXvNr-004Xux-Hw; Fri, 03 Mar 2023 02:42:59 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXvNn-004XtS-7R
	for ath10k@lists.infradead.org; Fri, 03 Mar 2023 02:42:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id j11so1790074lfg.13
        for <ath10k@lists.infradead.org>; Thu, 02 Mar 2023 18:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677811371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5WGNHoHvFrqEzbIMWPaETRGh642NbHa8AZbtFWCIaY=;
        b=a1Th93dRZhNLFhiK7IaDAOwo6+U7mQU2G9IxkKcOhsXbtvHHwqOJBbyqnZq9OWlJbe
         PRy2m3odeC/uu+rdRtGZFHE4CyA+ZQyW570JMMZLN4ZkJTbwPvvrklO6MtzsN/isn4BZ
         d6+Vw3elF8Thke2Olw45Gfy2cHVxP7Mn/m34a+orjQ73+ZKOSd2QIvCAH5Xjl2PGcOSe
         Kt+nHfF3mpKhQlnRl82T+Ihx/9ydlw6UJibClFQKxIyBYPPaSJ8YYC0mAaBnuZk5yqdu
         wUD+TIYQLfmen1g5gsYWk2+PTx84nUjPbl82gCmqpBZeOrpdzxTaESrrrRSVSUuAlubS
         glEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677811371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5WGNHoHvFrqEzbIMWPaETRGh642NbHa8AZbtFWCIaY=;
        b=PVFkU96GP1vPT7WpwSs+HYl2Uy66TFduTfZ77+W2uSNJLIEYndg2ar+Uakja7AvQ16
         ssSjpnoy9dDs2VY8ZqSbzYmRTW+cEdD0b/A3gj7hNPItEddDJWygguMWRgqKDWZiRJXQ
         sVOxtx9v1vIDejtIWox527fNhQ62vNPuV4l3lfADJ7Tj6Jr3uJHiYxufTQAy652FgOzT
         H9PNb5AdFaLKGbYvHYsEZ2yb4H+uEWJ42MEL8WjVnhFXZ+fjLli8QV5CXWFa2BByNuKV
         +iO+UdU5eqv4ZnXr5iGJDZPjncaT5grQIhe6E54M+Eztsnl0CyZrfwOBn/w7JewdW1hH
         smkg==
X-Gm-Message-State: AO0yUKUXkI4cgs2EzNMiVJ0oPMbdJbl+KFiKkicLrj5Wjgd4k2doBpvW
	LpgFf9jNHpf/Zs5xIjbc3vJuMg==
X-Google-Smtp-Source: AK7set9F3ef7m9KaxrogAYM4oalKAF6WRYPXP6o4DQr3SoBD77rCGtH28CpKaBUu35HPmnfJ/K7pCw==
X-Received: by 2002:a19:7611:0:b0:4b5:b705:9bf7 with SMTP id c17-20020a197611000000b004b5b7059bf7mr99636lff.11.1677811371416;
        Thu, 02 Mar 2023 18:42:51 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id x19-20020a19f613000000b004db1cd5efcesm181379lfe.241.2023.03.02.18.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 18:42:51 -0800 (PST)
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
Subject: [PATCH 2/2] wifi: ath10k: snoc: Add VDD_SMPS regulator
Date: Fri,  3 Mar 2023 03:42:46 +0100
Message-Id: <20230303024246.2175382-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303024246.2175382-1-konrad.dybcio@linaro.org>
References: <20230303024246.2175382-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_184255_304293_B0D12A0B 
X-CRM114-Status: GOOD (  10.40  )
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

At least SM6375 (bundled with soc_id 0x400e0000) and SM4350 (bundled
with unknown, probably the same) expect one more supply, called vdd-smps
downstream. It's set to 0.984V and connected to a - you guessed it - SMPS
regulator on PM6125. Add support for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
The smps name sounds like a quick downstream hack and is probably
something more exquisite in reality.. Not something I know, though.

 drivers/net/wireless/ath/ath10k/snoc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 9a82f0336d95..6443523131db 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -48,6 +48,7 @@ static const char * const ath10k_regulators[] = {
 	"vdd-1.3-rfa",
 	"vdd-3.3-ch0",
 	"vdd-3.3-ch1",
+	"vdd-smps",
 };
 
 static const char * const ath10k_clocks[] = {
-- 
2.39.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

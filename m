Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8001FC001DE
	for <ath10k@archiver.kernel.org>; Thu, 10 Aug 2023 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HYjDZmwqVVXGe91s5P4FYxjbnm0caqxuihTLnNEUcXY=; b=3L6PQILF9A7ZHd
	HkmR9HSij/qda2fyKUSzpLkwCcuLKaoUkbGBMFr5EZfLRBXPe0rJosL2dBdXziv5kWqI6TPvHAHFp
	4GsJvai9RR6sokLOBOFm+nDTgvHaeQ0MHnc41Doq/GM1FsCWcsr7j66BaG1p2Ek6rXjosCH6DINmQ
	d7uod1GacTFALmxC3qYayhqnnPhewhrEcuR6z/PeXaTdgM0Xerxr+TvBMY84mf/h740cwDX/bkgXd
	vRep4cfgIADVEoDTjbAmKEp5xh2AvKKC2eKC+uOOl2Nt4R+jMd6/TqQq0ZLUb2jDTidjmwlHtW+Ns
	ihBQ/AnnUlwzlnqmBkHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1ie-006wlJ-11;
	Thu, 10 Aug 2023 09:12:36 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1ia-006wj6-0Q
	for ath10k@lists.infradead.org;
	Thu, 10 Aug 2023 09:12:34 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9bf52cd08so9896691fa.2
        for <ath10k@lists.infradead.org>; Thu, 10 Aug 2023 02:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691658747; x=1692263547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Htd/z2F7UUScMygTNeT7Itp1hTM2TNM8XLM8S0EeMbk=;
        b=yfSdVESMRpRIqdOLo9ElSeY5VhUcLrAhe9vvR74OF27QX7tn8JvLFYN4qIXSQ6LrKN
         zp+rtZscwMT2u+cliOkOlI1ijhyLrQGZrXZoH0eK4YjoUBqzb4kx2Y5xvHKJHHOhBOSF
         ddS9gdY/ynd4QmvcGEidd6g4tBy0SeQn/MveMwxc6E3OiP9b9FqGGsc8xojcC+70Iyeh
         8jsbbsFVH50wP/LCTkQK6IKVj6KjYqj4c52N/xVsV/5vgAJz74xTZmP4FzoA3SXDKxUi
         jB4hLTNv7+RzEyai3VX/XuaexBUx56HlEoacEgR9I56wKQVGZ7lI67JVKAZI8TO7lmVn
         5wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691658747; x=1692263547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Htd/z2F7UUScMygTNeT7Itp1hTM2TNM8XLM8S0EeMbk=;
        b=Y7zYl03aDR3SZn3Wu34RVcEcxV04nuELvuQQVrz2lON13Ozt+EBDNeY1YdyFocG1jo
         22lq3uYxZs3vhqd3+Ai7xbkq2vV4KaMxqgDPEGm8KB8ov6pJ0C/i54A85zQP3+reiSVt
         n6/evxNMuuzC2ydfYfZq2svrUUTmTbTRlrWP15SjRgSYUUbRib6bJK37TGNDH+EmpmK4
         6Py2t3Zs8yIs6u3ZNIbniuZWwQ9P13y9CyIGarySeXsynu2s26H4S8PWICTn0IymK1j/
         Ya6g2vBgV363OrH6c+iwppMLlqaztUc8Wank8onXF5Aol2/SHS6yVjY4ym9DGvVL6jrY
         kCwg==
X-Gm-Message-State: AOJu0YzpErLCwgoRJWU3ghezip1ANt8hYpJHPCA61aYxSC9pF+P+Oc8y
	Tkpz38MbTsu1XZBUymA0rzJFuQ==
X-Google-Smtp-Source: AGHT+IE6Iks4Spr/j3fclN0BH0yxXPY85IWHUb1d17wuwqtArGFuIGsqA+mNTYIL5i+q7A7/N7gOfQ==
X-Received: by 2002:a19:7111:0:b0:4fb:cff5:3963 with SMTP id m17-20020a197111000000b004fbcff53963mr1104029lfc.60.1691658747473;
        Thu, 10 Aug 2023 02:12:27 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id f14-20020a50ee8e000000b0051ded17b30bsm531961edr.40.2023.08.10.02.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:12:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next 1/2] wifi: ath11k: fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 11:12:23 +0200
Message-Id: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_021232_219213_AE7B6548 
X-CRM114-Status: UNSURE (   9.87  )
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

'hw_rev' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  h11k/ahb.c:1124:11: error: cast to smaller integer type 'enum ath11k_hw_rev' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 139da578831a..ada4d68c7421 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1121,7 +1121,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	hw_rev = (enum ath11k_hw_rev)of_id->data;
+	hw_rev = (uintptr_t)of_id->data;
 
 	switch (hw_rev) {
 	case ATH11K_HW_IPQ8074:
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

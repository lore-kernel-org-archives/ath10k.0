Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346CCC54E41
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 08:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IOVorbNDjmEYCRkOIJ6RfUvTGmzX7zzuHuefGqOjfNU=; b=qHLJwhbRPfDXDR
	9A0eRWlJrdepna9JV5kzvIRKrza+3SNXpoSz2VFgiRf7sCm2unhse9EWBIU9se+0BT2+/4lfVUDoW
	GMqghEJNqUlEZxa28xD+l3iG9VcbryV8mv+7oD48HLVvfSdXCagqfzslo/m58uaodQAkXR/Uu5IJW
	kqRaNFQurNy+saL0d+kyh1f+lNA/42ZKbpvq0xUZ0mih1aN2TVKURf0pHYAHe33QSprxLvqqh1P5x
	YMxpKgUz8IOaN48ZNn8TqJ/HJXPViurIW13HS53c4Z4CjxWuRXpl5cpipQCGUX630fDGQ8r4q5kBX
	h8lenrCv70kvpZOjQT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmSM-0000000Gqng-2ppK;
	Wed, 06 Mar 2024 08:16:54 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmSI-0000000Gqm7-49JG
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 08:16:53 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-512f54fc2dbso5735115e87.1
        for <ath10k@lists.infradead.org>; Wed, 06 Mar 2024 00:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713008; x=1710317808; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOVorbNDjmEYCRkOIJ6RfUvTGmzX7zzuHuefGqOjfNU=;
        b=XeLTgnoq6UemRvP/EL5POVgExOxo/AhxtOnTkwQoXLwMgoMeTvvAoEfuytiVtRP1lR
         gxcoa67GpqW4M3ZhLO2fRgDGzvt+xamHDo1eJb4IMrPoPfHwssfIH3SuS18LtqgNEJIx
         Ec26SnUeKPUvtoAuwXgNTVAAB6D+EqijynMBWEnXiT4FJFimnnOGJKetNaSftzp3c/V0
         1d2LvMoDbH6AaQdEZ7m5LeAKny48TSETQ0ZY9dAyrK3JQLNgRHy7iQx4fZvy64ULoA2P
         POpLy+HY2ElU1JmZ1KrM1Mr1WpphzDyoke4M0kv9glGMoXUQV/3acGyA9Jr09OxIhb3X
         TEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713008; x=1710317808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOVorbNDjmEYCRkOIJ6RfUvTGmzX7zzuHuefGqOjfNU=;
        b=esVz0dATnQ08pGYd31m/C56qMGrf5zIQbc+EKVmGJHk4xwA3skbogXx1mJrM9JsgKS
         EwDtxKG3u4TOhSGYHpN4d3uaskDyU7pRgxQfjP1ampvrYcY42AtEUTCbJg9KBzXLclnM
         odSjeTzloN42upcdn17vae5rp4DYdlfCBw5TGQzfs9298w7ar1xM3XkucgunQN2LfPg4
         hIR2Ri5QLKv0Bb/Rfn2+Zg+1qrWAphF/Lgz+EpmF09iJAaS0d3TiBCxQG2lW8KK0kRD0
         SiPjFIOeEv59tS/M+qHnPARqzyDaAr/q6v/u6UTGCySN+G6TtsC67ehJbZa6zRf4X9gH
         Wzdg==
X-Gm-Message-State: AOJu0YxkQSiMQgyU3snOAWyWn9ey9Cpj+B0qayRwWbwKRBJ9+A74EeoA
	WSvwGDIHn+pY6lOywDSwa0/tJ/jbs06Myj6c35fJsPCES8CRuZeJF9WTM6ffrn4=
X-Google-Smtp-Source: AGHT+IFoKXNcKYuZLINzFqMTqbCvqGxphCUhFBrxErlA5QFN8wPG8IihwSx3yNHj5wiOZJOAUzxEVg==
X-Received: by 2002:a05:6512:2e8:b0:513:26e7:1b13 with SMTP id m8-20020a05651202e800b0051326e71b13mr2848069lfq.14.1709713008329;
        Wed, 06 Mar 2024 00:16:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b00512dc23bedcsm2162366lfo.99.2024.03.06.00.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 00:16:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware
 overrides
Date: Wed, 06 Mar 2024 10:16:44 +0200
Message-Id: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGwm6GUC/4WNTQ6CMBCFr0Jm7ZhpQbCuTEw8gFvDomKBSbQlU
 wIawt1tuIDL9/e9BaITdhFO2QLiJo4cfBJ6l0HTW9855GfSoEkXpHLCufG5MYQty3u24nCwY4+
 VpYOlpj0qqiBtB3EtfzbuHW7XC9TJ7DmOQb7b16S26A92Ukh41OXD5KlpyuL8Ym8l7IN0UK/r+
 gNoSeg0wAAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2186;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/EMjKJh7RTTCREzzTjnONmH5VAO67zSYckgm8+w1p+A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6CZuucldOlm1luyQUFD+7gU157AjQNbYIEZc4
 k2wPW2lBZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZegmbgAKCRCLPIo+Aiko
 1TU9B/9j5w0jL9XNxvqu1AflOwDGcSRKyvic9ybSvcGkVtS6OUAccbDdevCYzJaPhhIiWqCpcLe
 QksNPMXw8xGef7skT3/O1H9DZvwklOXTQI43aqvqolNtv+CjZJlJCylbzry5NXZiUzdJAtRb59j
 ZYVtoFxlk0a9NvHwiJdJHoOnpMGI88ierKkEuG8duA4AjYPoQoFQoBB7nU2jyyjhWP3Y3kJATFL
 KOab5ZOrO2y7JvOw8uO3X+DkCoXLqTMrK+gmnU+12kqYDkLbw7JByEfnGAZKyYLubrCBR3iWwij
 RY109AOxtH/aMLBKqvWboM6Ypt+J2+2MQmxZZfDeEo3a/dQq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_001651_258659_F879558E 
X-CRM114-Status: GOOD (  11.33  )
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

On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
modem DSP via the TQFTPserv. These MBN files are signed by the device
vendor, can only be used with the particular SoC or device.

Unfortunately different firmware versions come with different features.
For example firmware for SDM845 doesn't use single-chan-info-per-channel
feature, while firmware for QRB2210 / QRB4210 requires that feature.

Allow board DT files to override the subdir of the fw dir used to lookup
the firmware-N.bin file decribing corresponding WiFi firmware.
For example, adding firmware-name = "qrb4210" property will make the
driver look for the firmware-N.bin first in ath10k/WCN3990/hw1.0/qrb4210
directory and then fallback to the default ath10k/WCN3990/hw1.0 dir.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed the comment about the default board name being NULL (Kalle)
- Expanded commit message to provide examples for firmware paths (Kalle)
- Added a note regarding board-2.bin to the commit message (Kalle)
- Link to v1: https://lore.kernel.org/r/20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org

---
Dmitry Baryshkov (4):
      dt-bindings: net: wireless: ath10k: describe firmware-name property
      wifi: ath10k: support board-specific firmware overrides
      arm64: dts: qcom: qrb2210-rb1: add firmware-name qualifier to WiFi node
      arm64: dts: qcom: qrb4210-rb1: add firmware-name qualifier to WiFi node

 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml         |  6 ++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                      |  1 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                      |  1 +
 drivers/net/wireless/ath/ath10k/core.c                        | 11 ++++++++++-
 drivers/net/wireless/ath/ath10k/core.h                        |  2 ++
 drivers/net/wireless/ath/ath10k/snoc.c                        |  3 +++
 6 files changed, 23 insertions(+), 1 deletion(-)
---
base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
change-id: 20240130-wcn3990-firmware-path-7a05a0cf8107

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666A0C47DA9
	for <ath10k@archiver.kernel.org>; Tue, 30 Jan 2024 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b+3/wsx3NS47JcKpNk0wT5zaj/mo2WWMlXJ2KicYJcA=; b=syXG5qy8V1ElhX
	67fyzQEoqG4QnB9Uec0CQKMa3EJtwnZMAIskCV9vF0HMYZQ1MyFUNym4oK5Fi6vyAlON0ZFJIXhyc
	p1h6mCmxEIG/6Do0szmQl/kX6LAjEo4uYTG+5jrTBGRXjxVuksTMh6SI4aSUxVR65JLeiRIZkf9IS
	rFVj2eL8zm4gT9xYmwRKuHz0LTr58satCst9Cc68ssGxD/8JtcmD4Jz5Bdd95MT9A/Cg5jLEV8wtG
	H7rSz3ign/Db8mYH6b+ORkVvGVHJNRmX4Bi5GOik3kenQNZA0JsHKcJv7lckSF4vvb3xHmfvwTkBv
	4yvusY2UJm7tjzVXC1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhto-0000000FSWp-3RNB;
	Tue, 30 Jan 2024 06:47:12 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhtn-0000000FSUz-04on
	for ath10k@lists.infradead.org;
	Tue, 30 Jan 2024 06:47:12 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51030667cedso4243287e87.3
        for <ath10k@lists.infradead.org>; Mon, 29 Jan 2024 22:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706597228; x=1707202028; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b+3/wsx3NS47JcKpNk0wT5zaj/mo2WWMlXJ2KicYJcA=;
        b=UrwK08kd3PO1OBmPslkO5pu2edAPMbJC0QctEFs3QOV0C5sz5r+keApMvIXcIHoi+/
         mcl6Z57Ei2J8rlUorZgo5ZGJYM4V/h47xOJ3RimV3BcBG+74jQB86EFe3yU+E5Qq/oZg
         Yv9iCUz7fR7NPvPAR5vPaWGILb1NDSKRro2qKrybse1y2+nDZZy7ttGDcslh8uYK226D
         cDJrHcXZAjqwcCLd6T1LMowsd9ZvPUzWsJKnhYARk+ebvN9Deqnz99uqoNPP8ljSxqyT
         Y8kUqKUCHqeOmQIW7V/KytjEtgpErMq7NCJKpolelf45Ofbpj6OLw+UvRIWhxaVYKHTf
         9N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706597228; x=1707202028;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+3/wsx3NS47JcKpNk0wT5zaj/mo2WWMlXJ2KicYJcA=;
        b=ow1EtdQPa1MRBXLOhTEfRW9kUcsi0kD3KDFwLUcylMCN/AyB/6AzfHbiDrJ4kTTTnH
         VA9V99rSFC9vwTKN0ymHWAvJz/7gzem85L4yVpb8fY8OirVJhbc5KwXaotgW1O/noWcV
         MHWkDxLTTlS+TaTJXJLrEtaSeBAIXbAhd9uvzXP89ho3c6vPy48tf/YsNvhiFRRnH2kd
         AGgFQpiQDo64G2mFjgW+/2VK+tNH8R0gaW3Z4/KbcwSSaPKP4HAF8IhxpQUYmXE9TA1B
         GBgTxWjz7JtoGEVsmsb11rsvvkd5DLqeRgd6BX9QQmV9jc0j9TCs1HVk/NsWTvV8OVxm
         61iQ==
X-Gm-Message-State: AOJu0Yy6/bLxZDBsUVEtzyePoLhos89qc091A8JCZb0N7giRPAkbOBBh
	2iE+rweGR7i8SzidTe7FfUT/LTHERt0QYrDvTScTUmjWjTsN7v5YqakGRQORBoo=
X-Google-Smtp-Source: AGHT+IHuTOBp8q9TetwZto+FqfFgxTgf+zUQtYtQGObfcIOml5Gpv73qP1xyxGdib0ojwLeRBndsKg==
X-Received: by 2002:a19:5e14:0:b0:50f:18f7:855e with SMTP id s20-20020a195e14000000b0050f18f7855emr4014975lfb.39.1706597227766;
        Mon, 29 Jan 2024 22:47:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d18-20020a056512369200b005101e1870aasm1367068lfs.162.2024.01.29.22.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 22:47:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990
 devices
Date: Tue, 30 Jan 2024 08:47:05 +0200
Message-Id: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmbuGUC/x3MQQqAIBBA0avErBvQqRC7SrSwHGs2FgoVhHdPW
 r7F/y9kTsIZxuaFxJdkOWKFbhtYdxc3RvHVQIp6pcnivcbOWoXL4ZLHcKMjb82gjDOaoGZn4iD
 Pv5zmUj7UHRB+YgAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Z5DIe881UwCU9DDgOmmQOXALIXUP8SI9QhUnk4wRCZc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluJtqDq6KB3BH4ao2LCbZG3zMTpmYnqCmaMaUU
 EslVyTJTq2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbibagAKCRCLPIo+Aiko
 1T7gB/9B4JuOVfuG2430l3IsEd1NFbPHLLbLi6xPqWoqsvFRI+vhZmCZ6g9jWAXBb/8FIcujsds
 YlpFu9zJ7ln8SftJ9bzqfmU2dOJQya1Mupy8LY2FdQXmGVUX/axTQRD9pSl4Iz3fSA8IuejE3LY
 RM6OiF/O+eDUGYnIVzAxViy2od7bQ7dmhPpl/GKjkE1NeXs/j0LOg6o0x+sYGbJMkhjpNwS3nvW
 zbvVEiVGEZz5E66W9Y6KKfnYbD9lO4KRLDipspK2Fm1vk7JMbYnwg1CNRJYNBbUHtPjxoWoYMpw
 gJHQclgkXPR9BcuwCMby/lg6R5v0MYvVimIsWx09HWwunkbN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_224711_098501_7C2995A5 
X-CRM114-Status: UNSURE (   6.81  )
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

The ath10k driver fails to properly handle fallback from board-2.bin to
board.bin for WCN3990 cards. This happens because the
ath10k_hw_params_list doesn't include .fw.board* parameters for the
WCN3990 platform.

Add board data configuration for WCN3990. While we are at it, merge
common pieces of BDF support: drop .board and .eboard names from struct
ath10k_hw_params_fw and use the common name instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      wifi: ath10k: populate board data for WCN3990
      wifi: ath10k: drop chip-specific board data file name
      wifi: ath10k: drop fw.eboard file name

 drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
 drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
 drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
 drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
 4 files changed, 14 insertions(+), 45 deletions(-)
---
base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
change-id: 20240129-wcn3990-board-fw-a2d97507a712

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



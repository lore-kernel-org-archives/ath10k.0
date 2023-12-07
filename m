Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC991C4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bnPbiFfs70AQqUXKz4rBwjx4wdAbPnTRaSNe0NqQREU=; b=UBeq+E2XhtWtIxDJKsyP5Y5y/+
	uwiVTdpk1996q2Wy3zIoSQFEKu1nbXKt82RZDB7F2MtfKD9h7P2YwZfC4XSLSTdSVr76LNfNV1ALR
	BV+ZlfNAfw3tvLnjpEt49dgJ1o5GNcEHqY6dKiWW/fFRl8vLBLiuqs8Gk563c7XTdXPJkNze1Ykl+
	du5y9dabIQnL0oRqVSpzmb6mMmfYWzWpJke/WH/i0Bat3BSIgjYpJu7v8g75izlFz6SCBn44vwn4Z
	o3COzfmtLN1TFCQYiiECGw2rnlKOKNsZrldgqfXTQRSgRyKxsXpwZgvSBWd4qMYHYTHVfTP63BECQ
	EA8krI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBBHt-00CR8h-12;
	Thu, 07 Dec 2023 10:07:21 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBBHq-00CR8H-0o
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 10:07:19 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1d069b1d127so5194835ad.0
        for <ath10k@lists.infradead.org>; Thu, 07 Dec 2023 02:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701943636; x=1702548436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnPbiFfs70AQqUXKz4rBwjx4wdAbPnTRaSNe0NqQREU=;
        b=cgmHs7FykQrQWlmw8GCl5GMsd5kZKsps/tk2/6LXysh1JtfoufZsJemCRZEG4Cvblq
         Lh2I0Q2LSNg5mDMjEy3ikwaotBYt1/aFobd1VPC/TPt9CgdBpaxk41ucuWz+DteRIdwN
         +tMKuA9TnbQJnACeuObrjkjtxlNjz3rLl42fedILf2TBthUwYVL28kCtoPy4kByDYXCX
         X5GmYj9y0yiyOUHt56xKJ/U1RGbLStYaCurC/kpqZN99z11LOuxsGB9miNAYkm3uHCp2
         fMmOjkJ5K81CGDOdqPx7/E5UlEYaOQYK6AAnIAbpa0vsGjSjeNhO1v+Cpd+S/CQx8bhM
         VXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701943636; x=1702548436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnPbiFfs70AQqUXKz4rBwjx4wdAbPnTRaSNe0NqQREU=;
        b=Gm4HEgvWNkGhPT6r40/L6VHFPpgBthGME2dX+LNz6MJUYDR9ATnmTTfH5nUL/BAD2X
         mmKaCu2126ARaoIJHw68PJ+yJaPPcH3H+Iadf/8cV2HMMJbt60iwTzDStq+acFiHJcAk
         BPjI2G2RYFqqyOWgzUFTpvZRGRxMGVGgZEOPGIOA2tySY9aiDMIEKDuutoChL1ju8mYR
         RlN2rHtM+JqkOhduE7YOfU5KNmTqY5EiNRcadZAZl7CxuJd5RIs7aAfkVBWL20b08g6e
         c/hG20AvE2dYsDgS8IErCHpKykWD5bz+49BwqukBvLUAg6GevHCFKrDF4voQC8qPn18F
         RY/Q==
X-Gm-Message-State: AOJu0YyHZwcvpuZqq7TYRtF0plkw/4LO/9k/p7U61Z7Yjjn3+lDU0Nl0
	ZXzjVUh2ef2bUMVes7vlc6k=
X-Google-Smtp-Source: AGHT+IEtkZZSqB0ukEFicFBdsJi6RBm15EqHkme7IVBeTy9ypwG66PTjytyzx9giJefpv/0ensSpOA==
X-Received: by 2002:a17:902:e548:b0:1d0:7468:6f60 with SMTP id n8-20020a170902e54800b001d074686f60mr1991762plf.56.1701943636198;
        Thu, 07 Dec 2023 02:07:16 -0800 (PST)
Received: from localhost ([113.88.15.172])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c21500b001cfb573674fsm985182pll.30.2023.12.07.02.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 02:07:15 -0800 (PST)
From: Xingyuan Mo <hdthky0@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER)
Cc: Xingyuan Mo <hdthky0@gmail.com>
Subject: [PATCH] wifi: ath10k: fix NULL pointer dereference in ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()
Date: Thu,  7 Dec 2023 18:07:09 +0800
Message-Id: <20231207100709.12231-1-hdthky0@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_020718_287483_1F60847C 
X-CRM114-Status: UNSURE (   7.44  )
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

We should check whether the WMI_TLV_TAG_STRUCT_MGMT_TX_COMPL_EVENT tlv is
present before accessing it, otherwise a null pointer deference error will
occur.
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 6b6aa3c36744..0ce08e9a0a3d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -851,6 +851,10 @@ ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev(struct ath10k *ar, struct sk_buff *skb,
 	}
 
 	ev = tb[WMI_TLV_TAG_STRUCT_MGMT_TX_COMPL_EVENT];
+	if (!ev) {
+		kfree(tb);
+		return -EPROTO;
+	}
 
 	arg->desc_id = ev->desc_id;
 	arg->status = ev->status;
-- 
2.34.1



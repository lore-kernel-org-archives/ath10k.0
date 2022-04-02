Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE27CC433F5
	for <ath10k@archiver.kernel.org>; Sat,  2 Apr 2022 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XL51MC1ZgNX2rMkr3hpH5caktGjVa37xqC/pPxOBzc0=; b=Qox9iSTjTwmTmb
	kLdWuIyJEpLn0kjW4SFTkD35oET3/DX/kxmgJbzKHh2igNlIXaKRvMFSx56rP0yh1onzsKqB9aHrl
	5K7hnH4oM62s19RDQOquBHSJhzpEcwVuNZJQYYXmbUCgeobYKNMEWwZHt+fO21Fj7vEcCbJWOCgnZ
	W5I4D0hYdakNLsZd7GZFNYysR4/gmRqaj+JV2Xgs6mCiYXLzam15XqNNGknQw2kOZblWlIQQucxaH
	py56WFL0V9D7uXc+5M2an7A3ZJORo4siKDNsIJ5mUhQ0gXRTxkvGjS56d5KTvnEvlMYQDmQgaB/81
	gl9KcfNrvyhV1mf1eo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nafnk-009UUV-Ok; Sat, 02 Apr 2022 15:36:32 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nafng-009UTO-90
 for ath10k@lists.infradead.org; Sat, 02 Apr 2022 15:36:29 +0000
Received: by mail-lj1-x233.google.com with SMTP id v12so7559528ljd.3
 for <ath10k@lists.infradead.org>; Sat, 02 Apr 2022 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GQBGpHLJBuI7vXHCkIC9Pl1G1Y1Yo8MMpmAHSdbTzag=;
 b=LxjCfQ3A25yPGUozfoldbZqZ6NzGyDPTEt418FEtiO3zSbYSLOxFlke/ZAHSj9XmmY
 54JoxWfnzkqyT84xVG/IK8ogKyboykuSSIXvoaHlU5epvLQTZkoevMr+BfOUq0rqlaJQ
 b1QSSZ8gAoIxO1VIPoaPya5+stOPX1pA+oKIe6DpkdMwPRaFrN9LggwqJa75hcCA0Bsw
 /TAJW80kyDNhnHJwFfa0rDYMb16y5VS30nObXAwikdmO0nIGZQRFv6LAU6iqBpKOpErW
 T/GiTXry+JHfXtMHMPwmqNZXWP2j/oZb4XbuoH1EypkU21aYjRzMriGUjIrtoKnwAqVx
 C/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GQBGpHLJBuI7vXHCkIC9Pl1G1Y1Yo8MMpmAHSdbTzag=;
 b=SlpGiJpAquUpN1QQ/a4ueZnKdN113sCqMn8CZEUpFd8oCuUFYtG4uS/VvKvZ7ORRHl
 MPmio+hCl/IQRcqRmT00yd4W8uTvJXNGUK8z5xmvAT1QVnegTYJNcO3+PWkMKjUsLkoa
 uTRgIV653X1e++W4u0o38p+VIZT7od0CaG/EZrxnerQLgcxJxhHs9eyfqOWSTOJlWJVu
 /B8NUOL7SRjcWKgj0o024iToOdHP0m9ms5ZKwJv3NpbpjUjUo9wgjnn6sDQMGjUryibm
 pX5FpR5WkiQiWcGa6mDCkc7H+vFtFhTe3c/01/XrkuiIYjL7GjcWPMJzXgqwx0CnXzN9
 zHww==
X-Gm-Message-State: AOAM531cwSLpL8EeBkpmuNFmVLVcMNOQ6i+Er1JAYeMovIxQPAe731Ac
 sLgQ4Ace040moLlC6Uq9Rbo=
X-Google-Smtp-Source: ABdhPJw6DBWvZkIGMlMq2WlL3Q/AntGiLMZ8CRWAG6jBHhMCJnRHWrmQYBSXb59BcwFkxRJ2THe9fQ==
X-Received: by 2002:a2e:a901:0:b0:247:e3e7:7c26 with SMTP id
 j1-20020a2ea901000000b00247e3e77c26mr16974792ljq.395.1648913785163; 
 Sat, 02 Apr 2022 08:36:25 -0700 (PDT)
Received: from rsa-laptop.rossosh.lan ([217.25.229.52])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2e3512000000b0024b12b5044csm52884ljz.89.2022.04.02.08.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 08:36:24 -0700 (PDT)
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 1/3] ath10k: improve tx status reporting
Date: Sat,  2 Apr 2022 18:36:13 +0300
Message-Id: <20220402153615.9593-2-ryazanov.s.a@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220402153615.9593-1-ryazanov.s.a@gmail.com>
References: <20220402153615.9593-1-ryazanov.s.a@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_083628_354884_CCB96FF9 
X-CRM114-Status: GOOD (  13.35  )
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

We use ieee80211_tx_status() to report each completed tx frame.
Internally, this function calls sta_info_get_by_addrs(), what has a
couple of drawbacks:
1. additional station lookup causes a performance degradation;
2. mac80211 can not properly account Ethernet encapsulated frames due
   to the inability to properly determine the destination (station) MAC
   address since ieee80211_tx_status() assumes the frame has a 802.11
   header.

The latter is especially destructive if we want to use hardware frames
encapsulation.

To fix both of these issues, replace ieee80211_tx_status() with
ieee80211_tx_status_ext() call and feed it station pointer from the tx
queue associated with the transmitted frame.

Tested-on: QCA9888 hw 2.0 10.4-3.9.0.2-00131
Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
---
 drivers/net/wireless/ath/ath10k/txrx.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 10123974c3da..72540434c75b 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -43,6 +43,7 @@ static void ath10k_report_offchan_tx(struct ath10k *ar, struct sk_buff *skb)
 int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 			 const struct htt_tx_done *tx_done)
 {
+	struct ieee80211_tx_status status;
 	struct ath10k *ar = htt->ar;
 	struct device *dev = ar->dev;
 	struct ieee80211_tx_info *info;
@@ -128,7 +129,16 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 		info->status.flags |= IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
 	}
 
-	ieee80211_tx_status(htt->ar->hw, msdu);
+	memset(&status, 0, sizeof(status));
+	status.skb = msdu;
+	status.info = info;
+
+	rcu_read_lock();
+	if (txq && txq->sta)
+		status.sta = txq->sta;
+	ieee80211_tx_status_ext(htt->ar->hw, &status);
+	rcu_read_unlock();
+
 	/* we do not own the msdu anymore */
 
 	return 0;
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26AACCF9F8
	for <ath10k@archiver.kernel.org>; Fri, 31 Oct 2025 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+e+UAk578qZgTiUOAdHLd6XVTShCxhiEWjVV/FznGz0=; b=zjgjXfODmlXfeWYCEd/5KLZdMl
	HhDkq9cyNjS5EKQElpY+SlY5SnuC3Lpm40Aqidb+tQBVN2RdVnOcRwR4IeBe5+rzb2Kr+8dR8Z/vC
	j/4GJ4FaQj25jh2bsqIjiFtHU85X8OdBYfLeDnspYrwuYCs+i5YIX/BHry5y2U/AXi2snyXiqIWUM
	XEDhphVGe19dxW+Fj92dd166/4KOTCueD3745/K11JZ1WxicPoWI9JxY6Ca0Vuy/KpjWaVr1QnAnw
	8xEzYyRKtgaruAwpBzZDpncTOc9h9ahm1DfwMSONV56hRrW7hO1vO++Y/UgFkS7F4ygrPP0+eXdU8
	oeOlCRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn8Y-0000000609x-2BGz;
	Fri, 31 Oct 2025 11:17:42 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn8W-00000006099-1R2Y
	for ath10k@lists.infradead.org;
	Fri, 31 Oct 2025 11:17:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2698384978dso17769645ad.0
        for <ath10k@lists.infradead.org>; Fri, 31 Oct 2025 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761909458; x=1762514258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+e+UAk578qZgTiUOAdHLd6XVTShCxhiEWjVV/FznGz0=;
        b=d+4Xvv3zSvqk1PDLHinrbRAfIxsbXfSfbVzo44As5DD8EqA5eL6za82u//Xi0T1fVl
         FY45Yzok9+5kj1+WLo8QWeCTkZK1Rev+oSxblVYfGNXzSVbBM3TnZZ2h8SPs4TV8nfya
         +JTSyUlWWmTH3SYaa8y0GBFWpAK5OaOt+nRp1Sg3ukMgyjK5f6YaYAGDKCHuo8c1SFZh
         7THs6ovM72lFvxfDXSKS2SMOW7vPfFvUNOO0BsXW7c8rYikw0NcFMaGAsqnioL4uj2jO
         o2f1Rtz/oEDQzzpOI/iBDeD4dTYu4bTpWGzbzccyYNCsQtp0XtLNGkWL/vSZ/b41j4XW
         eEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909458; x=1762514258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+e+UAk578qZgTiUOAdHLd6XVTShCxhiEWjVV/FznGz0=;
        b=vmzdkJUXcUaMxfPGDUaPOppraVBkSjp6QYdMas+YuQ686qqSnLYwlaTpCxvAQjwiFN
         MFSK50Q6QO2ma3wPCgjz1wPKRq/TFXAcINCB33LSvxubMHkOph1nTmENHh5EXd2nZTMI
         U/5sk7EWEOHCwpMAAZTS/XVFApWM3TyiOIctjdSHhUc9j3JbmRHbLRJji2r4ZCO7I6Jf
         6Ef2UTAf5SpD38nVdoRQOGFPHSief/gD0Nt9GY8qGAmUsFb+WWg+RtVcVpyG1sqC/Txs
         HQI/4uLh5oYlU+eI9z09VvEvy2XsycFsdeSuVOc1n6Tl9ZiS6+WubpEL1sWY9zqNA9F0
         aZog==
X-Gm-Message-State: AOJu0YxoRdVyop5uymFoZ7CUwEr1iErTglU3MDodu/CE+18y1EOhnUWB
	w17N//EvJR4u7eobCjel+PdhlxygKdglZKmn2bYldKqry+z0AdDhZITN
X-Gm-Gg: ASbGncv7dKQH/RLKPfL+4oNJJmKGJTqZTsNoIXBCOoGnqgA8sOYO4lKEe/TsnQkMF5N
	g5vSdI9NU5k8E32vx0ePtoKzeNtvOCTAuXQKq5ST6VYU0Z/32GN6Gxxq/gnElXRE5+ft8IOMZT9
	Nb7zJ6UAu3AH7xHSkUu0yHbQcDP4fsFyHCDwvqVDnVKKGHQ0QTNU6VnvQAOz/q1gwyA71VGcqB0
	1vdV4iwBdvDZbAEtOJjWqQuyYtDvS2nQQouaDNYDYcHA041O+XbSkfuCdD8fQhqtF+m4/V5836+
	oH4LEHYjTtg7nRUuYHqJdarVaHKKHwsRsM61JfaT2UKqyi1PuhiYRkQSyAzsM9zcx0kOKeeRE2V
	NG/ys96P1Pi8NgNd2CwyXLaEmcInt8daFh4XGAYm+W6MXlaKG0rhWoGIdFkjfZQIuNyQKQziB4P
	qO9fC8shbV6y4QYkn7NPaTs+YFi/NRIgBrA+GfR6/ieJWqOnNA
X-Google-Smtp-Source: AGHT+IHDqFb6gR3IjGUQRse71p5ISdIE1cA0yF0w/b7oVCBs5q2wxqjLzKdDydo1C/6WO9/1B2HbeQ==
X-Received: by 2002:a17:902:7608:b0:290:a32b:9095 with SMTP id d9443c01a7336-2951a5c201bmr29211485ad.54.1761909458309;
        Fri, 31 Oct 2025 04:17:38 -0700 (PDT)
Received: from NT123328-PC02.ZyXEL.com (114-33-191-187.hinet-ip.hinet.net. [114.33.191.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268a96fdsm20220115ad.31.2025.10.31.04.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:17:37 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: jjohnson@kernel.org
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH ath-next] wifi: ath10k: simplify ath10k_htt_tx_mgmt_inc_pending
Date: Fri, 31 Oct 2025 19:16:39 +0800
Message-ID: <20251031111639.406873-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_041740_387658_7AD30DB9 
X-CRM114-Status: UNSURE (   9.82  )
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

Remove is_mgmt from ath10k_htt_tx_mgmt_inc_pending and make sure we only
call it when it's a mgmt frame.

Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt.h    |  3 +--
 drivers/net/wireless/ath/ath10k/htt_tx.c |  5 ++---
 drivers/net/wireless/ath/ath10k/mac.c    | 20 +++++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 603f6de62b0a..d94f63637810 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -2450,8 +2450,7 @@ void ath10k_htt_tx_txq_sync(struct ath10k *ar);
 void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt);
 int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt);
 void ath10k_htt_tx_mgmt_dec_pending(struct ath10k_htt *htt);
-int ath10k_htt_tx_mgmt_inc_pending(struct ath10k_htt *htt, bool is_mgmt,
-				   bool is_presp);
+int ath10k_htt_tx_mgmt_inc_pending(struct ath10k_htt *htt, bool is_presp);
 
 int ath10k_htt_tx_alloc_msdu_id(struct ath10k_htt *htt, struct sk_buff *skb);
 void ath10k_htt_tx_free_msdu_id(struct ath10k_htt *htt, u16 msdu_id);
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index d6f1d85ba871..0cf30068447b 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -168,14 +168,13 @@ int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt)
 	return 0;
 }
 
-int ath10k_htt_tx_mgmt_inc_pending(struct ath10k_htt *htt, bool is_mgmt,
-				   bool is_presp)
+int ath10k_htt_tx_mgmt_inc_pending(struct ath10k_htt *htt, bool is_presp)
 {
 	struct ath10k *ar = htt->ar;
 
 	lockdep_assert_held(&htt->tx_lock);
 
-	if (!is_mgmt || !ar->hw_params.max_probe_resp_desc_thres)
+	if (!ar->hw_params.max_probe_resp_desc_thres)
 		return 0;
 
 	if (is_presp &&
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index da6f7957a0ae..6d77d451988a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4442,7 +4442,7 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
 		is_presp = ieee80211_is_probe_resp(hdr->frame_control);
 
 		spin_lock_bh(&ar->htt.tx_lock);
-		ret = ath10k_htt_tx_mgmt_inc_pending(htt, is_mgmt, is_presp);
+		ret = ath10k_htt_tx_mgmt_inc_pending(htt, is_presp);
 
 		if (ret) {
 			ath10k_htt_tx_dec_pending(htt);
@@ -4728,14 +4728,16 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
 			return;
 		}
 
-		ret = ath10k_htt_tx_mgmt_inc_pending(htt, is_mgmt, is_presp);
-		if (ret) {
-			ath10k_dbg(ar, ATH10K_DBG_MAC, "failed to increase tx mgmt pending count: %d, dropping\n",
-				   ret);
-			ath10k_htt_tx_dec_pending(htt);
-			spin_unlock_bh(&ar->htt.tx_lock);
-			ieee80211_free_txskb(ar->hw, skb);
-			return;
+		if (is_mgmt) {
+			ret = ath10k_htt_tx_mgmt_inc_pending(htt, is_presp);
+			if (ret) {
+				ath10k_dbg(ar, ATH10K_DBG_MAC, "failed to increase tx mgmt pending count: %d, dropping\n",
+					   ret);
+				ath10k_htt_tx_dec_pending(htt);
+				spin_unlock_bh(&ar->htt.tx_lock);
+				ieee80211_free_txskb(ar->hw, skb);
+				return;
+			}
 		}
 		spin_unlock_bh(&ar->htt.tx_lock);
 	}
-- 
2.51.0



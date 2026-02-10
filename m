Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B4CE94625
	for <ath10k@archiver.kernel.org>; Tue, 10 Feb 2026 02:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wyckoz1LCy6lmq5T1nxhAjHQG5bYzvC9R2mzguy/dUM=; b=zapE87yb4FNeN1y5HdHYVi+qYs
	knmjcQ1CtxT3fsyd/FSAFEclaO1whfF77hwmdmOnHMJTBbVzKxJlzidXkMYzcqd/GClQCqSABErIZ
	MFoc4o2ZwtqSc+bGdP1AMfbsCoYL2Y7CNazcdUrPzTjA6yAH9sIeLVoV2EyZ4VItw0FIpjUNdJO5F
	kToGa/VjYzr7Iq5GsTaYiWTanlcLVQ9LFDsTmajq/nPY8l5HPdHoB2WLhJHVSgURUQX7ltnkE2ld3
	hVKzdc48mj6ta7rMiUEU7KAjVaEEftqV7M4+e4DuVTGzKooBVE9DJIgTLZpEVmSDJwXaudGXKjIv9
	hBPgTa6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdEh-0000000GJRo-2Ytd;
	Tue, 10 Feb 2026 02:12:19 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdEe-0000000GJQs-35ox
	for ath10k@lists.infradead.org;
	Tue, 10 Feb 2026 02:12:17 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8c533228383so23856785a.3
        for <ath10k@lists.infradead.org>; Mon, 09 Feb 2026 18:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689535; x=1771294335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wyckoz1LCy6lmq5T1nxhAjHQG5bYzvC9R2mzguy/dUM=;
        b=g30dRI8/lra21D7yHO4p062LKI0b2Pz46/+YX+/NMSJqLrbwJsTtG1cRlLEmK0aBpU
         e7KJNFEocmVku+3tJuMkx2rm9T+f/qTkfBvRCsLafZFjvyhJEaeU4Vdx3kUFIDayrCGJ
         Z+wbDQt9xhnKBe3D0Z5DDSstxyQhU7Cz27m0FZWrF1z+d2h5K6va0wN7NMXKZP/CTfKM
         DNhEOq3wyJjMUw/hYfoOCfVI7V+MLsMQzfGZN2OxpEK0JzfOHJcMn7Aqjk+U+FfoCiaB
         8L+D5gRYMvjrYi27fIujPatiiqql639tpy3wzDFvkxmKV9RvyP1tA2JgGJqSlZcbYqik
         lusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689535; x=1771294335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wyckoz1LCy6lmq5T1nxhAjHQG5bYzvC9R2mzguy/dUM=;
        b=E8vEjwshzfbBfIqgGiCGieS3JNKJIvdvDpMB2+fqGHejJpgQGCHAYpqswqSGrMjoLz
         vKeeMdDfyx9P50gwAEbMwCMTG+m4G3tAXEoTgY8lYumtXmA+S2ok78k3eCRyQ2jDaykM
         sjL40bRLynEfJD8ncbFUdP7oM/v0YMuAsfZjiP8jXuZIrDz8l79FbrFb8x060gKGzQle
         Mwtz3aZrhh62Gr6L3r6BEemk7IyEE72e/4wjkGfIDuDnRi3z4QHQsqHPfmP8xckLEYra
         SkK4hUpJqjzPRbu4hWpbzFLRkitXPua8wbE12+wPsFbn/8OtHgVphtmOr9nrcA0bKEI/
         ozIg==
X-Forwarded-Encrypted: i=1; AJvYcCWRzpOM/c6tY/uuEETToi3mj/45gUe+Z9Hkx/dxAIgbs0Lj41sthA209WJJRBTjv/owHAq7X74=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaSaUsxZ0e0d9ZCw0fY9gJPtp+N2yCAFGa1eMoxiudfieUG5Nw
	ugiWXYNwPcEHeAauwUwpB9jJbuGVUapDhX2e4jznxsDD0mNAW6FtJ4/X
X-Gm-Gg: AZuq6aKLnhOQlFOtxdNtFjz4Y0L4cqVB6bFYY+nzOOB2nen0TAr0QL587UhcA+DULla
	TU0uKEAD7LvUCABEMICkfTvkoN72ACz6RgFNBDSZWdXZ4DJpVLbYGjvVXfCH3l5ZMLCuGee18P/
	SedfCb2Cz3ee6P8/eG8HjX5dSaoOvs4qSlQAQw8sfyz8VVAv9IwUposI160nCOzHhkrHdYPrHIO
	/Y0eTkIm4tHoXxSrQLrt1xL0kmltoSHbyWYHLdPBSMIAKHcm9JziomqDyH2/rzGPtncPJVJ8rwa
	MuwX2HHzygrlvMGmSANSWPKOh0dARhKgVPOt+a+NDc2A0KkQz6UR8SDnKIXYNtM1oKZQz8zY8+a
	NPAMPT8JKtYbvR1LsMPhDlY+Hl6jKZeaZDx1w7NPK39Cm7pGdVx5AuCFHE+r2x5pQiDY2WWyqlF
	jefiVT46XEvqPcpdkcyu5w23pIISVNKs/zFUy3sA0ZSD5TxorrAtAajYyZiGTRDfleqC9KhcL0V
	t3nLcnyz7z+tZ0=
X-Received: by 2002:a05:620a:1a97:b0:8c6:a487:6add with SMTP id af79cd13be357-8caef029f46mr1835314385a.22.1770689535278;
        Mon, 09 Feb 2026 18:12:15 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf7aeed8bsm963656285a.20.2026.02.09.18.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:12:14 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Michal Kazior <michal.kazior@tieto.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [RFC PATCH 1/2] wifi: ath10k: make in-order rx amsdu buffers persistent
Date: Mon,  9 Feb 2026 21:12:48 -0500
Message-ID: <20260210021249.12132-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021249.12132-1-mailingradian@gmail.com>
References: <20260210021249.12132-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_181216_787367_57FA18DC 
X-CRM114-Status: GOOD (  18.26  )
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

The WCN3990 might split MSDUs among multiple "in-order" indications. The
driver needs information from previous indications to handle MPDUs that
are not started by the same indications that complete them. Move the
list that tracks unprocessed MSDUs to the driver state so the driver can
handle MPDUs that are split in this way and be less confused.

Fixes: c545070e404b ("ath10k: implement rx reorder support")
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt.h    |  4 +++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 41 ++++++++++++++++++------
 2 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 603f6de62b0a..ec897175c933 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1929,6 +1929,10 @@ struct ath10k_htt {
 	bool bundle_tx;
 	struct sk_buff_head tx_req_head;
 	struct sk_buff_head tx_complete_head;
+
+	u8 rx_in_ord_split_tid;
+	u16 rx_in_ord_split_peer_id;
+	struct sk_buff_head rx_in_ord_split;
 };
 
 struct ath10k_htt_tx_ops {
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index d7e429041065..b27271c56d07 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -297,6 +297,8 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
 	skb_queue_purge(&htt->rx_in_ord_compl_q);
 	skb_queue_purge(&htt->tx_fetch_ind_q);
 
+	skb_queue_purge(&htt->rx_in_ord_split);
+
 	spin_lock_bh(&htt->rx_ring.lock);
 	ath10k_htt_rx_ring_free(htt);
 	spin_unlock_bh(&htt->rx_ring.lock);
@@ -846,6 +848,8 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
 	skb_queue_head_init(&htt->tx_fetch_ind_q);
 	atomic_set(&htt->num_mpdus_ready, 0);
 
+	skb_queue_head_init(&htt->rx_in_ord_split);
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "htt rx ring size %d fill_level %d\n",
 		   htt->rx_ring.size, htt->rx_ring.fill_level);
 	return 0;
@@ -3264,7 +3268,6 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 	struct ath10k_htt *htt = &ar->htt;
 	struct htt_resp *resp = (void *)skb->data;
 	struct ieee80211_rx_status *status = &htt->rx_status;
-	struct sk_buff_head list;
 	struct sk_buff_head amsdu;
 	u16 peer_id;
 	u16 msdu_count;
@@ -3299,16 +3302,32 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 		return -EINVAL;
 	}
 
+	if (!skb_queue_empty(&htt->rx_in_ord_split)) {
+		/* It might still be possible to handle this case if there is
+		 * only one peer that splits at each given moment. We are
+		 * bailing out because we should have a test case for this
+		 * before trying to fix it.
+		 */
+		if (tid != htt->rx_in_ord_split_tid
+		 || peer_id != htt->rx_in_ord_split_peer_id
+		 || offload) {
+			ath10k_warn(ar, "split amsdu did not resume immediately\n");
+			htt->rx_confused = true;
+			return -EIO;
+		}
+	}
+
 	/* The event can deliver more than 1 A-MSDU. Each A-MSDU is later
 	 * extracted and processed.
+	 *
+	 * It can also continue a previous A-MSDU.
 	 */
-	__skb_queue_head_init(&list);
 	if (ar->hw_params.target_64bit)
 		ret = ath10k_htt_rx_pop_paddr64_list(htt, &resp->rx_in_ord_ind,
-						     &list);
+						     &htt->rx_in_ord_split);
 	else
 		ret = ath10k_htt_rx_pop_paddr32_list(htt, &resp->rx_in_ord_ind,
-						     &list);
+						     &htt->rx_in_ord_split);
 
 	if (ret < 0) {
 		ath10k_warn(ar, "failed to pop paddr list: %d\n", ret);
@@ -3320,11 +3339,12 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 	 * separately.
 	 */
 	if (offload)
-		ath10k_htt_rx_h_rx_offload(ar, &list);
+		ath10k_htt_rx_h_rx_offload(ar, &htt->rx_in_ord_split);
 
-	while (!skb_queue_empty(&list)) {
+	while (!skb_queue_empty(&htt->rx_in_ord_split)) {
 		__skb_queue_head_init(&amsdu);
-		ret = ath10k_htt_rx_extract_amsdu(&ar->hw_params, &list, &amsdu);
+		ret = ath10k_htt_rx_extract_amsdu(&ar->hw_params,
+						  &htt->rx_in_ord_split, &amsdu);
 		switch (ret) {
 		case 0:
 			/* Note: The in-order indication may report interleaved
@@ -3340,12 +3360,15 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 			ath10k_htt_rx_h_enqueue(ar, &amsdu, status);
 			break;
 		case -EAGAIN:
-			fallthrough;
+			htt->rx_in_ord_split_tid = tid;
+			htt->rx_in_ord_split_peer_id = peer_id;
+
+			return -EIO;
 		default:
 			/* Should not happen. */
 			ath10k_warn(ar, "failed to extract amsdu: %d\n", ret);
 			htt->rx_confused = true;
-			__skb_queue_purge(&list);
+			__skb_queue_purge(&htt->rx_in_ord_split);
 			return -EIO;
 		}
 	}
-- 
2.53.0



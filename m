Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AB6C4332F
	for <ath10k@archiver.kernel.org>; Sun,  6 Nov 2022 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hAY3MOGNIazcl29oHeDjLqOt/LgDQlnUBrDnYkxPGr8=; b=GiZSoQxFT7z670
	18Gat/PAtNZua3XR9sbrhB3dJAHzKk9Rac0T8la+Gt+hcpX8cPTea4C97JyvRRO7ZNYTWNDxDCVHa
	ACKRvfxdBoCXKa6dbNpF0ZG/13XajE0R1IZkvN7yLRnVfsxxVU4BOMrniUZ15v1so66Yk8LXWL167
	IWi2cwYjH9e+t/Uum1PY9BhTFGaZuTzYNvjMBJfBckRmY+vZzv4/ETPKnyMTsq3KzNGt2DHRyS8iv
	7mYC79T7lK7fogHBQ01PI/AJ5F6B8tIHY/cnEM+35UZe69hF1JpA4Z8V8UHY4TvqI/58L2DGP7J1c
	dFKmbrRVn6VCX+4kC5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oriPs-008nHy-3g; Sun, 06 Nov 2022 16:22:36 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oriPo-008nHB-HI
	for ath10k@lists.infradead.org; Sun, 06 Nov 2022 16:22:34 +0000
Received: by mail-pf1-x432.google.com with SMTP id y203so8590232pfb.4
        for <ath10k@lists.infradead.org>; Sun, 06 Nov 2022 08:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/wVMRQYq8fkVBXtAwiW4f5YaI2apCsd/u8FPJMnqNok=;
        b=g/3dZ7V6H4TGo6Dx9VFMdPSAakRhYAvypjCvUEz/ORr2IGW9cP/rNct16U9A4LBoQV
         DqrJw6LPZthIM4YQIbD6bX3n8UlmvMmB/B0o7sJvmX9I5NY/pf9k4i3ItWnwX37xuo8D
         AVGNrxztMlS/SWiDtWj1q1oN2QeQzBzkk8JIs/7eJYaBetHCJNq8Sr/PhcOamlMWHBLk
         4QovzyhjlFFrrnfY3a/fySl7jpFGKVAcb/WgtP5YR1f5F5GnqW/dTzYmiHjSc598GSoW
         OHGS4Q+nH+eQuCpRB83XMYHmkL3HjbmXUiti9XLD57gY9S4q+kDKtFgYxtVNN2BJEJPN
         mxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wVMRQYq8fkVBXtAwiW4f5YaI2apCsd/u8FPJMnqNok=;
        b=6dxOcawh8n76nLWhwgCxSm4I1X47TAskjySHqvnm1mhZPAVRNEYs2QH4YEdgdWbZU8
         8z9MWBIgqCRRNStzQgzLtHDizjBhd6XpXeRXmYfHffVfYkC3FAU9f/BoEuNuGbB1ewkn
         MtE/EBPBKiAkSquUL+5pSxMsgDKxj+K3CHNLWlqDEqo+dO+aXyZrlW5EDL7WnrfeLCyy
         tkZ/Stb9amoNwmZZf0GOLJDQxkcHNCURtzCZQB4taGcDDzpUziDAtKE5Oyjw4QSI+J6T
         zoBHzZq5LtvOzhw62KXnTLT3J5WEltUaxBpi8FZ4FpohTcGxqIjGEebj6M0fLXJCJWf8
         a4tQ==
X-Gm-Message-State: ACrzQf3U2riGfVEB9WmVLljrMomTK453Hsrlt2K8lAPoh9DAZgQigedL
	3XNtTaGgu4oU1I77VM3rmHMWb0DD1LYz4w==
X-Google-Smtp-Source: AMsMyM7pZC81Z40/KXXnKnySA/OU1VrWMbZGP+jcb+vEqEgusRCPwNOcJ7MLaC40KgrjVd0Lz7eK2w==
X-Received: by 2002:a05:6a00:1889:b0:56c:3d4f:ae14 with SMTP id x9-20020a056a00188900b0056c3d4fae14mr45593009pfh.49.1667751748721;
        Sun, 06 Nov 2022 08:22:28 -0800 (PST)
Received: from Redminer.localdomain ([115.165.217.97])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902ce8700b0018691ce1696sm3330267plg.131.2022.11.06.08.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:22:28 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH] wifi: ath10k: Use macro for seq_ctrl conversion
Date: Mon,  7 Nov 2022 00:22:27 +0800
Message-Id: <20221106162227.1119-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_082232_608062_87D75F35 
X-CRM114-Status: UNSURE (   8.86  )
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

Use IEEE80211_SEQ_TO_SN macro to convert seq_ctrl to sn for better
readability.

Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index e76aab973320..3df52906b356 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1379,7 +1379,7 @@ static void ath10k_process_rx(struct ath10k *ar, struct sk_buff *skb)
 		   ath10k_get_tid(hdr, tid, sizeof(tid)),
 		   is_multicast_ether_addr(ieee80211_get_DA(hdr)) ?
 							"mcast" : "ucast",
-		   (__le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4,
+		   IEEE80211_SEQ_TO_SN(__le16_to_cpu(hdr->seq_ctrl)),
 		   (status->encoding == RX_ENC_LEGACY) ? "legacy" : "",
 		   (status->encoding == RX_ENC_HT) ? "ht" : "",
 		   (status->encoding == RX_ENC_VHT) ? "vht" : "",
@@ -1902,7 +1902,7 @@ static bool ath10k_htt_rx_h_frag_pn_check(struct ath10k *ar,
 	last_pn = &peer->frag_tids_last_pn[tid];
 	new_pn.pn48 = ath10k_htt_rx_h_get_pn(ar, skb, offset, enctype);
 	frag_number = le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
-	seq = (__le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
+	seq = IEEE80211_SEQ_TO_SN(__le16_to_cpu(hdr->seq_ctrl));
 
 	if (frag_number == 0) {
 		last_pn->pn48 = new_pn.pn48;
@@ -2824,7 +2824,7 @@ static bool ath10k_htt_rx_proc_rx_frag_ind_hl(struct ath10k_htt *htt,
 
 	hdr_space = ieee80211_hdrlen(hdr->frame_control);
 	sc = __le16_to_cpu(hdr->seq_ctrl);
-	seq = (sc & IEEE80211_SCTL_SEQ) >> 4;
+	seq = IEEE80211_SEQ_TO_SN(sc);
 	frag = sc & IEEE80211_SCTL_FRAG;
 
 	sec_index = MS(rx_desc_info, HTT_RX_DESC_HL_INFO_MCAST_BCAST) ?
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

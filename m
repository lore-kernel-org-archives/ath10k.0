Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE70C433FE
	for <ath10k@archiver.kernel.org>; Thu, 10 Nov 2022 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oUKiheAMPp91D+xbvJelI8CrqxdimeLB3+yCsaAiXJo=; b=AKjDzH5J5rGeUc
	lCyuuqw31wjsnoqaW5bV2DgYg1Jp+KJO7lbtSch8ccWFpElvmeMEzsoaTzihuoDifW0BY4jWFfAlH
	7uSNkfawyambmh4tNZ2n41OIHd0SvkowViEYPkYIN3MQdGSvfEhG6fgs2Tl8f3b7oVCOIhW3ptRM5
	UZMmya0LzZWHrKOF0wnlhKNss1IJR7otjDGHth75CAbBGC6XahzLtvxaX9o1KgnpU7DoeEf9SmaZH
	8qvCue00goBtRU2Byp80L7EyT+cjGW7LfgMduoV2HGixBlj3YzLML3jOOjR/VDyVer8FlV2rrLWVV
	d5VMJiAtvACOsTghZwag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAbj-007FGS-Om; Thu, 10 Nov 2022 16:40:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAbg-007FCK-2y
	for ath10k@lists.infradead.org; Thu, 10 Nov 2022 16:40:49 +0000
Received: by mail-pf1-x42f.google.com with SMTP id q9so2688879pfg.5
        for <ath10k@lists.infradead.org>; Thu, 10 Nov 2022 08:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+tS7l+7sPNDJCBK5t8QzEw6hTvxujfl3brJNybjurTQ=;
        b=FxOd5GAR/+gs/lKAflTGX6uadd7Qk34A8tEkZ4oajCUmcMiyRxSZYv6qAUORvZipHZ
         kmyo/IfYLpwNWxLWDWfjHE3v6RDHyHxIPrjIXsMIeFM7L8LsokAwsEDYgTkjtUc+RmM7
         uPIUBON0d+tDv7ZyuvnL8WiDxkZGLccnxprYb8BGaH/4t0gJrsKQBOblY/HI54TLCnh9
         p/aH1qm5dP6kYyeqzAdxrOsxVrWa90oCP0HR6jSO47b8v6vlQ3q6ihmFFOdqctMShzXS
         weqO5hxMs2H+NrVgrsaviKcfrA9dfAGYyrsFVi9KSFQnaU/EJtRhWHsQPSJRZS4fz6hx
         6mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tS7l+7sPNDJCBK5t8QzEw6hTvxujfl3brJNybjurTQ=;
        b=hUnUTyDyyFInkhYmbT3xOyMeeE6EzG+sFs602U/TG7u+h9WhhPkuwhxDavTasOWoYJ
         FG6CqUlcZiZ7XfGliKV9rx5vDXjUVI22dWkX7hzISNR3cVaIRM1U5zjBv0DUTnTuJLlj
         RQh9yuzsZa269WM0/ZhbrpqKKkJ8ndtcnIFWN6PkSECZc2TmMJJep3cLyCnoknpMNfgz
         G/iu75DCyHDpY6E6lpAh2H8Pbn0Dor8ce1Hp70vTqh9APZLFz0aqStsf2v/ZwBOGGJ30
         sXCqadv/sNIlZxeMkrS6Hj8HYf7w5+CGbRYfRlOyxxsVBo0W6dYznX1Ba2GKWOYYFm8u
         taEg==
X-Gm-Message-State: ACrzQf2wF0wo+7sy9dg3DjA58uVBUhtsSJyUNFo4w8BY27XXlfH4gEnV
	DRpppL58JyAV3pR4OIu7Y3DdSGoBWus=
X-Google-Smtp-Source: AMsMyM41ZKRolLBsqIqB0CI0WU0CFRP1V8MoDjNShQiLvrZUUaACk/G/hQQHE4v+gS80fTGyVa/ujA==
X-Received: by 2002:a63:2017:0:b0:460:7078:dd7a with SMTP id g23-20020a632017000000b004607078dd7amr2819124pgg.286.1668098445655;
        Thu, 10 Nov 2022 08:40:45 -0800 (PST)
Received: from Redminer.localdomain ([115.165.217.97])
        by smtp.gmail.com with ESMTPSA id t7-20020a635f07000000b0046a1c832e9fsm9336929pgb.34.2022.11.10.08.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:40:45 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH] wifi: ath10k: Remove redundant argument offset
Date: Fri, 11 Nov 2022 00:40:25 +0800
Message-Id: <20221110164025.14418-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_084048_194804_5452B5CC 
X-CRM114-Status: UNSURE (   8.99  )
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

This argument of ath10k_htt_rx_h_frag_pn_check() is always set to 0 so
drop this.

Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 3df52906b356..438b0caaceb7 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1844,15 +1844,14 @@ static void ath10k_htt_rx_h_csum_offload(struct ath10k_hw_params *hw,
 }
 
 static u64 ath10k_htt_rx_h_get_pn(struct ath10k *ar, struct sk_buff *skb,
-				  u16 offset,
 				  enum htt_rx_mpdu_encrypt_type enctype)
 {
 	struct ieee80211_hdr *hdr;
 	u64 pn = 0;
 	u8 *ehdr;
 
-	hdr = (struct ieee80211_hdr *)(skb->data + offset);
-	ehdr = skb->data + offset + ieee80211_hdrlen(hdr->frame_control);
+	hdr = (struct ieee80211_hdr *)skb->data;
+	ehdr = skb->data + ieee80211_hdrlen(hdr->frame_control);
 
 	if (enctype == HTT_RX_MPDU_ENCRYPT_AES_CCM_WPA2) {
 		pn = ehdr[0];
@@ -1866,19 +1865,17 @@ static u64 ath10k_htt_rx_h_get_pn(struct ath10k *ar, struct sk_buff *skb,
 }
 
 static bool ath10k_htt_rx_h_frag_multicast_check(struct ath10k *ar,
-						 struct sk_buff *skb,
-						 u16 offset)
+						 struct sk_buff *skb)
 {
 	struct ieee80211_hdr *hdr;
 
-	hdr = (struct ieee80211_hdr *)(skb->data + offset);
+	hdr = (struct ieee80211_hdr *)skb->data;
 	return !is_multicast_ether_addr(hdr->addr1);
 }
 
 static bool ath10k_htt_rx_h_frag_pn_check(struct ath10k *ar,
 					  struct sk_buff *skb,
 					  u16 peer_id,
-					  u16 offset,
 					  enum htt_rx_mpdu_encrypt_type enctype)
 {
 	struct ath10k_peer *peer;
@@ -1893,14 +1890,14 @@ static bool ath10k_htt_rx_h_frag_pn_check(struct ath10k *ar,
 		return false;
 	}
 
-	hdr = (struct ieee80211_hdr *)(skb->data + offset);
+	hdr = (struct ieee80211_hdr *)skb->data;
 	if (ieee80211_is_data_qos(hdr->frame_control))
 		tid = ieee80211_get_tid(hdr);
 	else
 		tid = ATH10K_TXRX_NON_QOS_TID;
 
 	last_pn = &peer->frag_tids_last_pn[tid];
-	new_pn.pn48 = ath10k_htt_rx_h_get_pn(ar, skb, offset, enctype);
+	new_pn.pn48 = ath10k_htt_rx_h_get_pn(ar, skb, enctype);
 	frag_number = le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
 	seq = IEEE80211_SEQ_TO_SN(__le16_to_cpu(hdr->seq_ctrl));
 
@@ -2059,13 +2056,11 @@ static void ath10k_htt_rx_h_mpdu(struct ath10k *ar,
 			frag_pn_check = ath10k_htt_rx_h_frag_pn_check(ar,
 								      msdu,
 								      peer_id,
-								      0,
 								      enctype);
 
 		if (frag)
 			multicast_check = ath10k_htt_rx_h_frag_multicast_check(ar,
-									       msdu,
-									       0);
+									       msdu);
 
 		if (!frag_pn_check || !multicast_check) {
 			/* Discard the fragment with invalid PN or multicast DA
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

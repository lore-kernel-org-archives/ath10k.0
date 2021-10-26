Return-Path: <SRS0=WP6D=PO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC8EC433EF
	for <ath10k@archiver.kernel.org>; Tue, 26 Oct 2021 02:52:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2459560EFE
	for <ath10k@archiver.kernel.org>; Tue, 26 Oct 2021 02:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2459560EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1OPl1RMdC8d9jNuqLjenGlyyonZQyj+GLEsAFyjGdDY=; b=wI5pMm5ClZDWqL
	0OpTkTHeEJpjFA62QPhXOsClpNmtAIo+0Qe/SBOh+iPGoLIkhiAvGH+MS8Ise48xocrWiGnLgBmdf
	on5p/iG/QoZCdhA8PTY6xjIEOuYDI+IMS4C95hhWfYSWnI17vLYYlrh4y7kOZ92Zf/0MLVda/aG62
	RLEwNfF0AElBRgYCvYORPbMyzj4xXIOWMpHH8TAkyEGvMFGym/NUxBe/vo52hiXcFJZQiGdbyFsEh
	NjthyCEC20Cbf30B0t7o/6H+W600pJARjrLfPlR6RXj8t4sK/18cjUCOzOA2Y87pyY0CWA2PDWkbb
	G65R58imwqmJ/3u6I8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfCYt-000VEm-LR; Tue, 26 Oct 2021 02:51:39 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfCYq-000VEP-EB
 for ath10k@lists.infradead.org; Tue, 26 Oct 2021 02:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635216696; x=1666752696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qWNXKZEUBFhXN/M7Sy4OIdMpTqWWuS/4cjm0eMEsInc=;
 b=Xm1TxCKfR/vLql1PmK7BMLwGIf7NgaQuMABo9B31lPOUNm1a4zHYXysU
 keslPAuYjLKjSwfXrmqLLpiUDC/D+ZB4mpeXG2UzsduLl2GzdfQ1HlAGH
 bgFxyu74fnX7lPRjkyQtkl4WK4MinRPnPMGTcf8Bg2IlSByXU2ua+74xg o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 19:51:32 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 19:51:31 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 25 Oct 2021 19:51:30 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath10k: drop beacon and probe response which leak from other
 channel
Date: Mon, 25 Oct 2021 22:51:14 -0400
Message-ID: <20211026025114.26313-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_195137_081635_5EAF8511 
X-CRM114-Status: GOOD (  11.48  )
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

When scan request on channel 1, it also receive beacon from other
channels, and the beacon also indicate to mac80211 and wpa_supplicant,
and then the bss info appears in radio measurement report of radio
measurement sent from wpa_supplicant, thus lead RRM case fail.

This is to drop the beacon and probe response which is not the same
channel of scanning.

Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
This depends on commit 
97981d89a1d47942a2d7517631d2400b99fe3f93 
("cfg80211: separate get channel number from ies")

 drivers/net/wireless/ath/ath10k/wmi.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index d48b922215eb..2c75fdddbf6e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2610,6 +2610,29 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	if (ieee80211_is_beacon(hdr->frame_control))
 		ath10k_mac_handle_beacon(ar, skb);
 
+	if (ieee80211_is_beacon(hdr->frame_control) ||
+	    ieee80211_is_probe_resp(hdr->frame_control)) {
+		struct ieee80211_mgmt *mgmt = (void *)skb->data;
+		u8 *ies;
+		int ies_ch;
+
+		if (!ar->scan_channel)
+			goto drop;
+
+		ies = mgmt->u.beacon.variable;
+
+		ies_ch = cfg80211_get_ies_channel_number(mgmt->u.beacon.variable,
+							 skb_tail_pointer(skb) - ies,
+							 sband->band);
+
+		if (ies_ch > 0 && ies_ch != channel) {
+			ath10k_dbg(ar, ATH10K_DBG_MGMT,
+				   "channel mismatched ds channel %d scan channel %d\n",
+				   ies_ch, channel);
+			goto drop;
+		}
+	}
+
 	ath10k_dbg(ar, ATH10K_DBG_MGMT,
 		   "event mgmt rx skb %pK len %d ftype %02x stype %02x\n",
 		   skb, skb->len,
@@ -2623,6 +2646,10 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	ieee80211_rx_ni(ar->hw, skb);
 
 	return 0;
+
+drop:
+	dev_kfree_skb(skb);
+	return 0;
 }
 
 static int freq_to_idx(struct ath10k *ar, int freq)
-- 
2.31.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A296C433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Dec 2021 06:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6D9U2LKA3BGm5q1rvDtgIsUnJRV7PdJK8GGMF3lvzeU=; b=V31jqmn6p8CCkU
	/gsZmZKkSsO5eaKG+w7f9p5fOzodva2DxOyxFqDeAPoDpABuqk0d+4KQ6ZjhO/kUbpuNGC2DAKBe2
	eSjwdpZmkN+dSXB4CgCG7ZePkYxqGgbIV/F/yIwqWF4c0ZYH4LC0HJGC1GVsF0eW9wTgp4+rDtkti
	b1/kLkUuaqb6Or1estk03aU/MtGWHYSzKFQcM3Fp8lxahVbceEVbhzWiHPSl8n5X3u1hfmUVbB5Rb
	t0okekiG4iu500RwcxuHMOcE4LAmPXdbE7oxbHifSZ5jwQQXOpniIAQEmwYUMlSvHS+3SGiEcPvbf
	o90tah1mZMPuEvIgrbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muqHV-00BS1M-VB; Wed, 08 Dec 2021 06:18:21 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muqHT-00BS10-3B
 for ath10k@lists.infradead.org; Wed, 08 Dec 2021 06:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638944299; x=1670480299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7JYL/fSf6uoFqLWx5PNjKqv5+3ggL/lvl93PP8sngqs=;
 b=oo030dtI4p89rDVXr49Ts6iTkvgE5a4pMT3+X6XftmLi1N+DMGDocTXL
 910vsOalEOYJfYmPPccAtnXEoOZSL3vc0+ZlTRZJzzKvEv8k8YW7ZlcN6
 sW3GPhiQlJRcLy3iQezneXEukmq0yqhmOQquXbMgtEc/mL6CB8vw8bE/G s=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Dec 2021 22:18:13 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:18:12 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 22:18:12 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 22:18:10 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] ath10k: drop beacon and probe response which leak from
 other channel
Date: Wed, 8 Dec 2021 01:17:52 -0500
Message-ID: <20211208061752.16564-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_221819_206246_F65DEE35 
X-CRM114-Status: GOOD (  11.80  )
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
v2: rebased to ath.git ath-202112071521

 drivers/net/wireless/ath/ath10k/wmi.c | 28 ++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 7c1c2658cb5f..07764ee409fe 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2610,10 +2610,32 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	if (ieee80211_is_beacon(hdr->frame_control))
 		ath10k_mac_handle_beacon(ar, skb);
 
+
 	if (ieee80211_is_beacon(hdr->frame_control) ||
-	    ieee80211_is_probe_resp(hdr->frame_control))
+	    ieee80211_is_probe_resp(hdr->frame_control)) {
+		struct ieee80211_mgmt *mgmt = (void *)skb->data;
+		u8 *ies;
+		int ies_ch;
+
 		status->boottime_ns = ktime_get_boottime_ns();
 
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
@@ -2627,6 +2649,10 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	ieee80211_rx_ni(ar->hw, skb);
 
 	return 0;
+
+drop:
+	dev_kfree_skb(skb);
+	return 0;
 }
 
 static int freq_to_idx(struct ath10k *ar, int freq)

base-commit: 4f4f8aee394b73abf5e5f98c63187fdbf1d627f0
-- 
2.31.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

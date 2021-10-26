Return-Path: <SRS0=WP6D=PO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296C3C433F5
	for <ath10k@archiver.kernel.org>; Tue, 26 Oct 2021 02:59:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D715F610A5
	for <ath10k@archiver.kernel.org>; Tue, 26 Oct 2021 02:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D715F610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k7zH4vIf3Ygc9HgbnX5lGys20ACAeb6Fd7fZj90NNPI=; b=CHmidYTjO6M6oW
	jShf2AL16XPdDKhv4alc0MbSvEBFoO3ohAm5DWlQDiiGIFUcxYwzQW1k/1khZf46NuMum3Buei2Nz
	UNGLW2//bL/cZN0KIhY9n5eWqp/SwwRUAhGLcpJUUYyHIJYuxfCHN3WvOfeFzHeil1p0UKE+f/+OW
	UGQt5WMlYSlpn+O2A1w1LsSPjHBMLAt2Gv62frrbSJNc2TapsRnp1kRBkjuyzemMQbnLTPBmoB36b
	6zYFsGO6j55QnG9RNcoWPNAJciBDzv2BJwMCy5Ynpqz/G+ySTEBZNEwVwlxpNfs+jQWZNWoaD7BfU
	JnbtkKAwwDJVW+VX1+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfCgR-000VjV-2W; Tue, 26 Oct 2021 02:59:27 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfCgK-000Vj3-Ki
 for ath10k@lists.infradead.org; Tue, 26 Oct 2021 02:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635217161; x=1666753161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OVoBcGDkhc6VnKEutfoPDmQju4OwxIJ0h0yn5iQdpUI=;
 b=nwHrwVFBmvO70KvaFoeh33Y+FUfM8UUqSAQRmE+QqvdsROfw6Vu5miy/
 FBSCDy1pkDZhb8PRudQLxiRaHovVfjxunLazSwmsqcO21Svj04dkECIG5
 kl/MsMP7UmwmkF6V2iEeYJ/IylM97P4UkW9GFeB2TxdxNSp7uoVyaupDC 8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 19:59:20 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 19:59:18 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 25 Oct 2021 19:59:18 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath10k: fix scan abort when duration is set for hw scan
Date: Mon, 25 Oct 2021 22:59:02 -0400
Message-ID: <20211026025902.26621-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_195920_758791_D607DAAD 
X-CRM114-Status: GOOD (  11.36  )
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

When request scan with duration 120ms on channel 1, it failed with
scan abort easily. Because scan_timeout is set to 130ms for the scan
in ath10k_hw_scan(), and timed out before scan complete, so lead
scan abort.

failed log of ath10k:
2021-04-14T14:43:29.936058Z DEBUG kernel: [67384.594846] ath10k_sdio mmc1:0001:1: wmi tlv start scan
2021-04-14T14:43:29.937896Z DEBUG kernel: [67384.595820] ath10k_sdio mmc1:0001:1: scan event started type 1 reason 7 freq 2437 req_id 40961 scan_id 40960 vdev_id 0 state starting (1)
2021-04-14T14:43:29.938357Z DEBUG kernel: [67384.596761] ath10k_sdio mmc1:0001:1: scan event bss channel type 4 reason 7 freq 2437 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
2021-04-14T14:43:29.992497Z DEBUG kernel: [67384.651013] ath10k_sdio mmc1:0001:1: scan event foreign channel type 8 reason 7 freq 2412 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
2021-04-14T14:43:30.063530Z DEBUG kernel: [67384.722139] ath10k_sdio mmc1:0001:1: wmi tlv stop scan
2021-04-14T14:43:30.066592Z DEBUG kernel: [67384.724403] ath10k_sdio mmc1:0001:1: scan event completed [cancelled] type 2 reason 1 freq 2412 req_id 40961 scan_id 40960 vdev_id 0 state aborting (3)

failed log of wpa_supplicant:
2021-04-14T14:43:29.981842Z DEBUG wpa_supplicant[887]: wlan0: nl80211: scan request
2021-04-14T14:43:29.981988Z DEBUG wpa_supplicant[887]: nl80211: Passive scan requested
2021-04-14T14:43:29.982202Z DEBUG wpa_supplicant[887]: nl80211: Add NL80211_SCAN_FLAG_FLUSH
2021-04-14T14:43:29.982339Z DEBUG wpa_supplicant[887]: Scan requested (ret=0) - scan timeout 30 seconds
2021-04-14T14:43:29.982491Z DEBUG wpa_supplicant[887]: nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlan0
2021-04-14T14:43:29.982629Z DEBUG wpa_supplicant[887]: wlan0: nl80211: Scan trigger
2021-04-14T14:43:29.982779Z DEBUG wpa_supplicant[887]: wlan0: Event SCAN_STARTED (47) received
2021-04-14T14:43:29.982920Z DEBUG wpa_supplicant[887]: wlan0: Own scan request started a scan in 0.000175 seconds
2021-04-14T14:43:30.082401Z DEBUG wpa_supplicant[887]: nl80211: Drv Event 35 (NL80211_CMD_SCAN_ABORTED) received for wlan0
2021-04-14T14:43:30.082704Z DEBUG wpa_supplicant[887]: wlan0: nl80211: Scan aborted
2021-04-14T14:43:30.082905Z DEBUG wpa_supplicant[887]: nl80211: Scan included frequencies: 2412
2021-04-14T14:43:30.083123Z DEBUG wpa_supplicant[887]: wlan0: Event SCAN_RESULTS (3) received
2021-04-14T14:43:30.083310Z DEBUG wpa_supplicant[887]: wlan0: Scan completed in 0.128655 seconds

This is to increase the scan_timeout with 200ms for this situation,
then scan will not timed out for this situation.

Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index bb6c5ee43ac0..a4bd6b9dcf6f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6354,13 +6354,14 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 		scan_timeout = min_t(u32, arg.max_rest_time *
 				(arg.n_channels - 1) + (req->duration +
 				ATH10K_SCAN_CHANNEL_SWITCH_WMI_EVT_OVERHEAD) *
-				arg.n_channels, arg.max_scan_time + 200);
-
+				arg.n_channels, arg.max_scan_time);
 	} else {
-		/* Add a 200ms margin to account for event/command processing */
-		scan_timeout = arg.max_scan_time + 200;
+		scan_timeout = arg.max_scan_time;
 	}
 
+	/* Add a 200ms margin to account for event/command processing */
+	scan_timeout += 200;
+
 	ret = ath10k_start_scan(ar, &arg);
 	if (ret) {
 		ath10k_warn(ar, "failed to start hw scan: %d\n", ret);
-- 
2.31.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

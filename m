Return-Path: <SRS0=gWg/=HL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F42C433DB
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 02:59:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEB8C64E0B
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 02:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEB8C64E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D+U+a9kEi7GTaU345HjRNUCkPL6Q0zOqBqWrYx4Qq6M=; b=o2FQCiDYfXbTN8flg+CH+DSUIR
	OWEMkgT1wmz3NBebqdCZqImgx2JeNLMAEKLBpI4FEdnS+GsO+nvXcTkiC3+Ii8uKKnypAsiUjhat4
	PeedlMn813A0oNVKuFL1m3O0xz4/Fd6sY5f9oNePbrAOj3BCaN5hoN2zc9tXm9yyG+f0SX4M5HsGE
	e8nZ/hyZVCGcR9pRisKmhuayUViEIknwpZnXOGtF/CF7YeNs1QOJSUkM3lw5hj2VOsmaeaDaZGECG
	jxAM3v1r4eSXUvZ196lH4Q3j5j+QiMnHlWn5K3bK4oFhN3krjqmQOGKDhsCN8A/EbnqvCbg/yp8+G
	IsLAfnEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9JEB-0006ds-HR; Tue, 09 Feb 2021 02:58:11 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9JE7-0006d7-67
 for ath10k@lists.infradead.org; Tue, 09 Feb 2021 02:58:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612839488; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jQoHOJt1f+bVaxtKsuGzlepL01TAE5RWMk3Uz70Gxnc=;
 b=Calw2+v930hBL3+lNld2SYS673WWFWbutwnaEI/wEs8DuWXZCS1xkWRs74o3dZIo4W0+cMMf
 ecR4GHBUTZY8tRJpU3Fk6UO1Fol4mfSgI73wHb2MrCpO5qNWl3w1CfsTpC1cpM21G5PvynRb
 svJ4mhJevysgtZ43wQFsW2EaUHY=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6021fa35e3df861f4baa477f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 02:57:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9DFADC433CA; Tue,  9 Feb 2021 02:57:56 +0000 (UTC)
Received: from gongwen-ThinkPad-T420.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 37EBEC433C6;
 Tue,  9 Feb 2021 02:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37EBEC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath10k@lists.infradead.org
Subject: [PATCH] ath10k: restore tx sk_buff of htt header for SDIO
Date: Tue,  9 Feb 2021 10:58:50 +0800
Message-Id: <1612839530-2263-1-git-send-email-wgong@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_215808_910677_71957D32 
X-CRM114-Status: GOOD (  12.39  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

ieee80211_report_used_skb of mac80211 use the frame_control of
ieee80211_hdr in sk_buff and indicate it to another function
ieee80211_mgd_conn_tx_status, then it queue work ieee80211_sta_work,
but ieee80211_is_auth(fc) in ieee80211_sta_work check fail when the
authentication has transmitted by ath10k.

When the ath10k report it with HTT_TX_COMPL_STATE_DISCARD, it will be
set without flag IEEE80211_TX_STAT_ACK, then mac80211 should try the
next authentication immeditely, but in fact mac80211 wait 1 second for
it, the reason is ieee80211_is_auth(fc) in ieee80211_sta_work check
fail for the sk_buff which is not restored, the data of sk_buff is not
the begin of ieee80211_hdr, in fact it is the begin of htt_cmd_hdr.

dmesg without this patch, it wait 1 second for the next retry when
ath10k report without IEEE80211_TX_STAT_ACK for authentication:
[ 6973.883116] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 1/3)
[ 6974.705471] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 2/3)
[ 6975.712962] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 3/3)

Restore the sk_buff make mac8011 retry the next authentication
immeditely which meet logic of mac80211.

dmesg with this patch, it retry the next immeditely when ath10k
report without IEEE80211_TX_STAT_ACK for authentication:
[  216.734813] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 1/3)
[  216.739914] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 2/3)
[  216.745874] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 3/3)

Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 9a109840a4c9..44c617834c56 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -573,6 +573,8 @@ void ath10k_htt_htc_tx_complete(struct ath10k *ar, struct sk_buff *skb)
 			desc_hdr = (struct htt_data_tx_desc *)
 				(skb->data + sizeof(*htt_hdr));
 			flags1 = __le16_to_cpu(desc_hdr->flags1);
+			skb_pull(skb, sizeof(struct htt_cmd_hdr));
+			skb_pull(skb, sizeof(struct htt_data_tx_desc));
 		}
 	}
 
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EF4EEAA52
	for <ath10k@archiver.kernel.org>; Thu, 14 Sep 2023 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4S07VWy0N4E5c9c6XG3rRe0dra+eTmX6e3x7R0BmqU=; b=kInuYldtC8kNjI
	W9ENrFSf5DzqSnrR9V64U5BFBHyM7ckh6D4LcqNEW115qX+OYFA6VxGVphrtQw7sQsCFLHAzoty0X
	SACW8WbRb89m9EMb35o/LRh6eXGOj22QF1sH301vz7nMNu0Tb3if9ZB0JQfjgHjIrmn5I+zgB5dFc
	KZnlJKzqyRycBJm+sRBeHf6qVIAjxVoMn2jUrVNoFxQILHDdoQ5akkoKae15O0p6hYGIBoB+S08cf
	glqSHWmfPho7DticOxqc+Xn7e5b0zyw0f6zaPzsBV0TiPXbaKN56DK+uZk3TmOG7twHl2DzoYj4j1
	OJQCCSR0A/efd6JuDcPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgotV-008sPV-1W;
	Thu, 14 Sep 2023 16:08:41 +0000
Received: from forward101c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgotR-008sOA-1E
	for ath10k@lists.infradead.org;
	Thu, 14 Sep 2023 16:08:39 +0000
Received: from mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:195:0:640:cda7:0])
	by forward101c.mail.yandex.net (Yandex) with ESMTP id 4ED1360036;
	Thu, 14 Sep 2023 19:08:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id S8jreuLDXiE0-8T098tht;
	Thu, 14 Sep 2023 19:08:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1694707708; bh=khJbb1v9CxYDR69tTGRoXyJBoHhMmLWlZqVZyoTBExk=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=fsGkfe3z0a3k5l897BsdEDzcx9PyMzBmOXDE1SGCg4zWNfWUqdTbPSOgXxM4IGzoZ
	 IlGeXiARYykxq8D9oj11sRVmeatYgHv5laBXcoTvXhuNfxD5BdviWNxw5xwjVCYqfN
	 rnNPEfaTP7SsodPsQhMxynQLDRqSZYl1nbYRap5g=
Authentication-Results: mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath10k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath10k: drop HTT_DATA_TX_STATUS_DOWNLOAD_FAIL
Date: Thu, 14 Sep 2023 19:07:03 +0300
Message-ID: <20230914160744.155903-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <18eac255-720a-488e-882e-b79f098aba65@quicinc.com>
References: <18eac255-720a-488e-882e-b79f098aba65@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_090837_880287_E70674F4 
X-CRM114-Status: GOOD (  10.45  )
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

According to Jeff, 'HTT_DATA_TX_STATUS_DOWNLOAD_FAIL' from
'enum htt_data_tx_status' is never actually used by the
firmware code and so may be dropped, with the related
adjustment to 'ath10k_htt_rx_tx_compl_ind()'.

Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Found by Linux Verification Center (linuxtesting.org) with SVACE.
---
 drivers/net/wireless/ath/ath10k/htt.h    | 3 +--
 drivers/net/wireless/ath/ath10k/htt_rx.c | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 7b24297146e7..c80470e8886a 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -880,8 +880,7 @@ enum htt_data_tx_status {
 	HTT_DATA_TX_STATUS_OK            = 0,
 	HTT_DATA_TX_STATUS_DISCARD       = 1,
 	HTT_DATA_TX_STATUS_NO_ACK        = 2,
-	HTT_DATA_TX_STATUS_POSTPONE      = 3, /* HL only */
-	HTT_DATA_TX_STATUS_DOWNLOAD_FAIL = 128
+	HTT_DATA_TX_STATUS_POSTPONE      = 3 /* HL only */
 };
 
 enum htt_data_tx_flags {
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 438b0caaceb7..b261d6371c0f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2964,7 +2964,6 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
 		break;
 	case HTT_DATA_TX_STATUS_DISCARD:
 	case HTT_DATA_TX_STATUS_POSTPONE:
-	case HTT_DATA_TX_STATUS_DOWNLOAD_FAIL:
 		tx_done.status = HTT_TX_COMPL_STATE_DISCARD;
 		break;
 	default:
-- 
2.41.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

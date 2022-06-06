Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1948AC43334
	for <ath10k@archiver.kernel.org>; Mon,  6 Jun 2022 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gKTVEzGiRFCLSq7LPnIiGAeNo6CB7Mb8Oi2RwXdVKfc=; b=xoJTITqZAoOg2o
	EIlGkFLKQPifpWg9goDU0cbHCoMf6kqvK3L3+EAlUGV6C71EUgXbBGGTBnb1NM1uLIG5d1a4kbO53
	EOBw5ON+C2vt1YuuS+Qyr5TJmQDmaFA6lOmXGv55Hwd1YcImlZ148D0CD8L2wxUeP7Nh1wRIXyDu8
	MU+3jY0NLgdV5Oq8bnieJkD5qfgVskvBw0667bumc70+ZjVr0hfgqXANzuC9UheuuLmXoKI8W0IR7
	8Rl8tAgxCGx0ml96EmKAoKAp6lhlcD0r+WesksH7aX0Mw4OcqS8gQm0E1Sg63gHcWT9vcyyGwR08g
	VZxZyZtQypJhRQbvGBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDk4-001W9m-LJ; Mon, 06 Jun 2022 14:30:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDk2-001W8Z-1T
	for ath10k@lists.infradead.org; Mon, 06 Jun 2022 14:30:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91CD561407
	for <ath10k@lists.infradead.org>; Mon,  6 Jun 2022 14:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8ECC34115;
	Mon,  6 Jun 2022 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654525801;
	bh=VEF+MQRX98WvINQNg+niiWNVO20KoeMb8rtD/9lTfAU=;
	h=From:To:Cc:Subject:Date:From;
	b=B4LCmeNXDWs8dx0w/3VahN6gidQ/+bosU6mKZs+OmA4FMjuYtRNWn9S/2NojlMb/j
	 0t8Huf0m8hZIHxMf3y6Qvdrx2+WirLMIJkm1+G9a2/PxHOwlx+GRRS3aGgEjRud0q5
	 FJky3VsiJhMTJgNU/YdmNSoMMvXzOIVdfSjCCwsukDOyqkbjIFiAjBFzH59tvNbDpw
	 MIUqZlQXNVv3hjrD7Ib9YuVcdE7jl8HjtbsBdcNXyGsx9Yxna5SCHhbU/i6eDLyodZ
	 g+rzzbVmRMCrxZY+bgHX6yCbRMnZQHko3pZ31E/z2WgbfE/QDfUfoCidO23DchMT9J
	 CY06h3UO6PdDg==
From: Kalle Valo <kvalo@kernel.org>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] ath10k: fix recently introduced checkpatch warning
Date: Mon,  6 Jun 2022 17:29:57 +0300
Message-Id: <20220606142957.23721-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_073002_183112_83191104 
X-CRM114-Status: GOOD (  10.29  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

I updated my checkpatch and saw new warnings:

drivers/net/wireless/ath/ath10k/qmi.c:593: Prefer strscpy over strlcpy - see: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
drivers/net/wireless/ath/ath10k/qmi.c:598: Prefer strscpy over strlcpy - see: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
drivers/net/wireless/ath/ath10k/htt_rx.c:3565: Integer promotion: Using 'h' in '%04hx' is unnecessary

Compile tested only.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
 drivers/net/wireless/ath/ath10k/qmi.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index e8727c0b0171..b8461501221a 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3563,7 +3563,7 @@ static void ath10k_htt_rx_tx_mode_switch_ind(struct ath10k *ar,
 	threshold = MS(info1, HTT_TX_MODE_SWITCH_IND_INFO1_THRESHOLD);
 
 	ath10k_dbg(ar, ATH10K_DBG_HTT,
-		   "htt rx tx mode switch ind info0 0x%04hx info1 0x%04x enable %d num records %zd mode %d threshold %u\n",
+		   "htt rx tx mode switch ind info0 0x%04x info1 0x%04x enable %d num records %zd mode %d threshold %u\n",
 		   info0, info1, enable, num_records, mode, threshold);
 
 	len += sizeof(resp->tx_mode_switch_ind.records[0]) * num_records;
diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 80fcb917fe4e..d7e406916bc8 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -590,12 +590,12 @@ static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
 
 	if (resp->fw_version_info_valid) {
 		qmi->fw_version = resp->fw_version_info.fw_version;
-		strlcpy(qmi->fw_build_timestamp, resp->fw_version_info.fw_build_timestamp,
+		strscpy(qmi->fw_build_timestamp, resp->fw_version_info.fw_build_timestamp,
 			sizeof(qmi->fw_build_timestamp));
 	}
 
 	if (resp->fw_build_id_valid)
-		strlcpy(qmi->fw_build_id, resp->fw_build_id,
+		strscpy(qmi->fw_build_id, resp->fw_build_id,
 			MAX_BUILD_ID_LEN + 1);
 
 	if (!test_bit(ATH10K_SNOC_FLAG_REGISTERED, &ar_snoc->flags)) {

base-commit: 0f4b70f3f15c463222094ac85ec3b6d9e7c6ab77
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

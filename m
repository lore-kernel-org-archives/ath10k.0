Return-Path: <SRS0=pCY9=O5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764AFC433F5
	for <ath10k@archiver.kernel.org>; Sat,  9 Oct 2021 22:17:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D24A60E8B
	for <ath10k@archiver.kernel.org>; Sat,  9 Oct 2021 22:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D24A60E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CFxhW3Nrd3gYz4znizQ4/bgW8HXarNTmSmxpA84eoa0=; b=v3+CEDMUSqHya1
	IXVV31+6TXiLFpiIOdMPDcBWGbLwXSC78KZzv0fIs8/M0lFpS/YC+XCPnh5x1s+ihhofRg10gMsvf
	fNqc/xWnMX6lgH40lqXVZldwJsnAWV0H9weS+Wuza2yfg0aetz2Cbdbu/ra5HRH4/38eiSZTH6evv
	c6tk7+c0NoS7ppmLOIVH0wg8kg1G83Pe2sOBbArEZZBc2X6JpNDc40p+OMaGBtj7vtIi5H/hqvnar
	CbqwV4Gu5cU/UMD1jxT9EQwtXkRc9Qu23cODJuaVcPmLiBGuVZKxUph//fYzt798DIoWnXfidu4rc
	L6jENuE6iOeR4Ikustrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZKef-0067Iy-VZ; Sat, 09 Oct 2021 22:17:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZKed-0067IB-5f
 for ath10k@lists.infradead.org; Sat, 09 Oct 2021 22:17:20 +0000
Received: by mail-ed1-x52f.google.com with SMTP id a25so34801110edx.8
 for <ath10k@lists.infradead.org>; Sat, 09 Oct 2021 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6k8mNyxLA9vdEcmjlVx18gI02oq8G/qXeE9dmeA7d8=;
 b=lk6cXENKjt9h+3xLSMV3cVn4dD1HVf19+yIH8ZL3nMh6uv0Lt4xAsl2Oe0/GWQnZqG
 tGzQjit/yvsAsukdsIBfaKy2tj8Sr01Nz11+cO3DLwDCPU5VgaENaOYzsS53tYkKFk0o
 fSoFdGVsSfBi5nn5l4pOebrNGj1pFwqpyjSf7UV4tOkrERK0QdyO618kY1AkyqWnwlpg
 aq1QFnpg54EmjAjnVEsdvLoELqpaLCIJQWEoeDHwlvjTWTp5v6PV2d1C26zY5GK0Uy7V
 JfhlpWD/M1C9RBtRoRRyxFyfhLO04FYkxcmomei8d4LSBtS2wEboqs6wV2pMqqP/c8nC
 /Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6k8mNyxLA9vdEcmjlVx18gI02oq8G/qXeE9dmeA7d8=;
 b=OW06EvL6EdhmIn1JaZnFd21MUvwUNQAHQ3cBDKG0smO6bMJizPZgKJkKiBKYqUfUfS
 dKPVzGhKvnl02jX3M5bTgrmSkuagh7yOu2lHG91dh7XHTzBVa/0HsydSMeD6KZ7Eau6T
 cMHilvDpX7XGpgEGvsP4xtmJg5DTRMHGPbCcXVUqwFCFc88vLKW1uGkOb2pNCuR4DsaT
 bFkP94cfxwIytOznaokK/3PNdeMYcxqaw6GC5yLnk+Ag6+8NK5ZZP+VEhgpXcwlLd266
 tmbI8hNP8wBZ4uDpFGgFmcWRjzzYPNlXRR81bkJklgiOY1rx2E9AyZPFc8EC+t4dRCkI
 fnTQ==
X-Gm-Message-State: AOAM532eD/sCMBVo25V+i6hAInHCTe+EsfRWrX53jqHKz8bse5IdsFzO
 dhKYwgFpGv1InPlHqPJaj2s=
X-Google-Smtp-Source: ABdhPJz4mGtNwyXniyqTQXxvLJESSpe3i+QgNK3ZGA+hZ/7qyJGFX52e/hTaqd40mYeRJEgEE2MU9g==
X-Received: by 2002:a50:bf48:: with SMTP id g8mr27269492edk.10.1633817836282; 
 Sat, 09 Oct 2021 15:17:16 -0700 (PDT)
Received: from fedora.. (dh207-99-195.xnet.hr. [88.207.99.195])
 by smtp.googlemail.com with ESMTPSA id kd8sm1405151ejc.69.2021.10.09.15.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 15:17:15 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH] ath10k: support bus and device specific API 1 BDF selection
Date: Sun, 10 Oct 2021 00:17:11 +0200
Message-Id: <20211009221711.2315352-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_151719_238117_0A03FB8F 
X-CRM114-Status: GOOD (  16.03  )
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

Some ath10k IPQ40xx devices like the MikroTik hAP ac2 and ac3 require the
BDF-s to be extracted from the device storage instead of shipping packaged
API 2 BDF-s.

This is required as MikroTik has started shipping boards that require BDF-s
to be updated, as otherwise their WLAN performance really suffers.
This is however impossible as the devices that require this are release
under the same revision and its not possible to differentiate them from
devices using the older BDF-s.

In OpenWrt we are extracting the calibration data during runtime and we are
able to extract the BDF-s in the same manner, however we cannot package the
BDF-s to API 2 format on the fly and can only use API 1 to provide BDF-s on
the fly.
This is an issue as the ath10k driver explicitly looks only for the
board.bin file and not for something like board-bus-device.bin like it does
for pre-cal data.
Due to this we have no way of providing correct BDF-s on the fly, so lets
extend the ath10k driver to first look for BDF-s in the
board-bus-device.bin format, for example: board-ahb-a800000.wifi.bin
If that fails, look for the default board file name as defined previously.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2f9be182fbfb..20a448e099d8 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1182,6 +1182,7 @@ static int ath10k_fetch_cal_file(struct ath10k *ar)
 static int ath10k_core_fetch_board_data_api_1(struct ath10k *ar, int bd_ie_type)
 {
 	const struct firmware *fw;
+	char boardname[100];
 
 	if (bd_ie_type == ATH10K_BD_IE_BOARD) {
 		if (!ar->hw_params.fw.board) {
@@ -1189,9 +1190,16 @@ static int ath10k_core_fetch_board_data_api_1(struct ath10k *ar, int bd_ie_type)
 			return -EINVAL;
 		}
 
+		scnprintf(boardname, sizeof(boardname), "board-%s-%s.bin",
+			  ath10k_bus_str(ar->hif.bus), dev_name(ar->dev));
+
 		ar->normal_mode_fw.board = ath10k_fetch_fw_file(ar,
 								ar->hw_params.fw.dir,
-								ar->hw_params.fw.board);
+								boardname);
+		if (IS_ERR(ar->normal_mode_fw.board))
+			ar->normal_mode_fw.board = ath10k_fetch_fw_file(ar,
+									ar->hw_params.fw.dir,
+									ar->hw_params.fw.board);
 		if (IS_ERR(ar->normal_mode_fw.board))
 			return PTR_ERR(ar->normal_mode_fw.board);
 
-- 
2.33.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

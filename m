Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2802606A32D
	for <ath10k@archiver.kernel.org>; Sat, 14 Nov 2026 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VpqAJ5jZ;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=YOTGuZOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FOVWd2qsqafgx33bmFPWbdLfTArZG1j+JJ1xA6ovljI=; b=VpqAJ5jZJO2ekK
	y51UntjQdBGP3n8RVx4RR4NrwQmsVB4GTk48oWGKaD9EQW0iXLw7buIZeIfetAipTZ8r8Njx4fkU5
	9JndJ7b5vm+d8jVfM4YQKVUDGUBgq4WjkdQ7WsXFVxCMBMp+5r4SxjjO5jBhDQ4rXS05oRpJhN09n
	4/0kipJ6ftr/LSrqkYwJTAmV9qZUT4yF6exV66dTyh8Sy5A4uZZoRWRIo1v2Y1lUQ9fNpLXn3BYHs
	c/GIewk7d/lJAdZwlKm8rHs/eShPi+io84dF77xIFe8knrVLXS2OTvVHV4eeIm+nILM+P7u0iTNLj
	Q4LSHLCq1g78FZZvTetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9lE-0000000Fcur-27tl;
	Sat, 14 Nov 2026 09:09:24 +0000
Received: from mxd-1-a3b.seznam.cz ([2a02:598:128:8a00::1000:a3b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9kE-0000000Fcla-2m4D
	for ath10k@lists.infradead.org;
	Sat, 14 Nov 2026 09:09:22 +0000
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-chpkt
	(smtpc-mxd-5f46658f7f-chpkt [2a02:598:128:8a00::1000:a3b])
	id 36bee7bac84a5510363069a2;
	Sat, 14 Nov 2026 10:08:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647285; bh=FOVWd2qsqafgx33bmFPWbdLfTArZG1j+JJ1xA6ovljI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=YOTGuZOl9lgS4eYflV3MmKC7Hw3U2bX0BKbd9Jl6Clsa9eHJsFwGpHCSpZPiqAOXW
	 CyMjb5M/lbpr3mMmjJxNairrShz7gTyTBNVPb5WenugB+YFRWrn7tVixakpLX6CuqV
	 J+3eiAV7mnLgyeGJ9wEHa8CU5NtDtq0rphZAGRTE+P02GhP5yvOcV8hUlkxxn+VG3p
	 bwqjgVjMsfO95CME30fN01GKqgTD8MIuf11rkx9e2oxFqUNgz3M5pxF7TKccgYCWU2
	 Vhlyjs60zkwgbOij3BtYmZ1Hu1r6Hjgz106vWRp0V5BDicka0CYttOs9sfNej5fPka
	 dV21pworDaxHw==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id d66854cc-2367-4c3f-9226-e4ac87f5aff1;
	Sat, 14 Nov 2026 10:08:03 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 4/6] wifi: ath10k: usb: add hw_params for Atheros QCA9377-7
Date: Sat, 14 Nov 2026 10:07:35 +0100
Message-ID: <20261114090737.64348-5-tomaspaukrt@email.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114090737.64348-1-tomaspaukrt@email.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_010823_452169_478FE8C8 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add hw_params for modules based on Atheros QCA9377-7 chipset like
8devices BLUE bean or SparkLAN WUBQ-159ACN.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/core.c | 42 ++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 0741b7ee073c..b7a84980a088 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -628,6 +628,48 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.delay_unmap_buffer = false,
 		.mcast_frame_registration = false,
 	},
+	{
+		.id = QCA9377_HW_1_1_DEV_VERSION,
+		.dev_id = 0x9378,
+		.bus = ATH10K_BUS_USB,
+		.name = "qca9377 hw1.1 usb",
+		.patch_load_addr = QCA9377_HW_1_0_PATCH_LOAD_ADDR,
+		.uart_pin = 6,
+		.otp_exe_param = 0,
+		.channel_counters_freq_hz = 88000,
+		.max_probe_resp_desc_thres = 0,
+		.cal_data_len = 8124,
+		.fw = {
+			.dir = QCA9377_HW_1_0_FW_DIR,
+			.board_size = QCA9377_BOARD_DATA_SZ,
+			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
+		},
+		.rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca6174_ops,
+		.hw_clk = qca6174_clk,
+		.target_cpu_freq = 176000000,
+		.decap_align_bytes = 4,
+		.spectral_bin_discard = 0,
+		.spectral_bin_offset = 0,
+		.vht160_mcs_rx_highest = 0,
+		.vht160_mcs_tx_highest = 0,
+		.n_cipher_suites = 8,
+		.ast_skid_limit = 0x10,
+		.num_wds_entries = 0x20,
+		.target_64bit = false,
+		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
+		.shadow_reg_support = false,
+		.rri_on_ddr = false,
+		.hw_filter_reset_required = true,
+		.fw_diag_ce_download = false,
+		.credit_size_workaround = false,
+		.tx_stats_over_pktlog = false,
+		.dynamic_sar_support = false,
+		.hw_restart_disconnect = false,
+		.use_fw_tx_credits = true,
+		.delay_unmap_buffer = false,
+		.mcast_frame_registration = false,
+	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
 		.dev_id = QCA9377_1_0_DEVICE_ID,
-- 
2.43.0



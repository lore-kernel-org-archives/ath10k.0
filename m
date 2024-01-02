Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B72C46CD2
	for <ath10k@archiver.kernel.org>; Tue,  2 Jan 2024 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xx0LeTeIW32q/hCd9KIFcqfXL/LqFY+MNCe/80cec9I=; b=USeMSDba0RF5vUzMu9/EHfsqXQ
	L2GNrKu9QlqrqUwTCrUTzzN2zvEKNwHAcxigErz472kFoR82HtwvMNM4M8r7P4gXXRWszO9Zi+4cr
	ArAR5UdiQjwWOvOaehmVMalBKCT1l74ZP2G45Svx6Yi+GamBF9livzLnaffrXWnEuLiQ9aE2W4Cr+
	h+wIzNti6Um1oeTYHsLhQiz+IBvQdizMyHQdTlErnU/H47p7eOkgDmTJQ0HkCgQcPYAb9MkyV0QJa
	jdcac44ugpugJM1+aVMZMi9F8jJNuMSDQ6FNZm+hlzblCJQFV/1mAWsu27EAII3G64IdKK6y7U2uU
	XF/r2qVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKib3-008blx-37;
	Tue, 02 Jan 2024 17:30:33 +0000
Received: from mxe-1-527.seznam.cz ([2a02:598:128:8a00::1000:527])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKiaw-008bkP-1x
	for ath10k@lists.infradead.org;
	Tue, 02 Jan 2024 17:30:32 +0000
Received: from email.seznam.cz
	by smtpc-mxe-54579945bb-pxvlm
	(smtpc-mxe-54579945bb-pxvlm [2a02:598:128:8a00::1000:527])
	id 6485de1f9a716cb5640b5007;
	Tue, 02 Jan 2024 18:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1704216604;
	bh=Xx0LeTeIW32q/hCd9KIFcqfXL/LqFY+MNCe/80cec9I=;
	h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding;
	b=oQUUiUr1763PL9mCakPXaR/fnki/HkAxPXG6zgDNRZODrCC3VchLna2HI5c56tQS7
	 H+hSfb+R4P47tkAvZUFMxPTGiXFWUXKYbm5/PWB/s051ogP13ib0BXX+i3XcmPRRji
	 +077jP7bAhYKvAtpoi6sW00rTjbE7n9hRmYrJzfx78VHP+xvRb0oKmwdPgZgCKnMgp
	 pUDKzoR03Ga+daLM0ICKu1SCvEl5GBw2D5Kdh4okyOn5dd3Qa9PNWiST9PRQUh/+VD
	 IDAAWggFqMBnVvMSTgdcXlibT06cwsQl6DgUSUIMvvnqPYet1qauJwqPJkmZpDF8yA
	 HQQ3SKLQ28L3A==
Received: from 184-143.gtt-net.cz (184-143.gtt-net.cz [82.144.143.184])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Tue, 02 Jan 2024 18:30:02 +0100 (CET)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "Kalle Valo" <kvalo@kernel.org>,
	"Jeff Johnson" <quic_jjohnson@quicinc.com>,
	<ath10k@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: ath10k: add hw_params for Atheros QCA9377-7
Date: Tue, 02 Jan 2024 18:30:02 +0100 (CET)
Message-Id: <BBi.ZZQl.2U1cEGGzeXI.1bb4WQ@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.1.33)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_093027_041640_8457C271 
X-CRM114-Status: UNSURE (   7.65  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Add hw_params for modules based on Atheros QCA9377-7 chipset.

Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/core.c | 42 +++++++++++++++++++++++++++++=
+++++
 drivers/net/wireless/ath/ath10k/hw.h   |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless=
/ath/ath10k/core.c
index 6cdb225..cb33c93 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -615,6 +615,48 @@ static const struct ath10k_hw_params ath10k_hw_params=
_list[] =3D {
 	},
 	{
 		.id =3D QCA9377_HW_1_1_DEV_VERSION,
+		.dev_id =3D QCA9377_1_1_DEVICE_ID,
+		.bus =3D ATH10K_BUS_USB,
+		.name =3D "qca9377 hw1.1 usb",
+		.patch_load_addr =3D QCA9377_HW_1_0_PATCH_LOAD_ADDR,
+		.uart_pin =3D 6,
+		.otp_exe_param =3D 0,
+		.channel_counters_freq_hz =3D 88000,
+		.max_probe_resp_desc_thres =3D 0,
+		.cal_data_len =3D 8124,
+		.fw =3D {
+			.dir =3D QCA9377_HW_1_0_FW_DIR,
+			.board =3D QCA9377_HW_1_0_BOARD_DATA_FILE_USB,
+			.board_size =3D QCA9377_BOARD_DATA_SZ,
+			.board_ext_size =3D QCA9377_BOARD_EXT_DATA_SZ,
+		},
+		.rx_desc_ops =3D &qca988x_rx_desc_ops,
+		.hw_ops =3D &qca6174_ops,
+		.hw_clk =3D qca6174_clk,
+		.target_cpu_freq =3D 176000000,
+		.decap_align_bytes =3D 4,
+		.spectral_bin_discard =3D 0,
+		.spectral_bin_offset =3D 0,
+		.vht160_mcs_rx_highest =3D 0,
+		.vht160_mcs_tx_highest =3D 0,
+		.n_cipher_suites =3D 8,
+		.ast_skid_limit =3D 0x10,
+		.num_wds_entries =3D 0x20,
+		.target_64bit =3D false,
+		.rx_ring_fill_level =3D HTT_RX_RING_FILL_LEVEL,
+		.shadow_reg_support =3D false,
+		.rri_on_ddr =3D false,
+		.hw_filter_reset_required =3D true,
+		.fw_diag_ce_download =3D false,
+		.credit_size_workaround =3D false,
+		.tx_stats_over_pktlog =3D false,
+		.dynamic_sar_support =3D false,
+		.hw_restart_disconnect =3D false,
+		.use_fw_tx_credits =3D true,
+		.delay_unmap_buffer =3D false,
+	},
+	{
+		.id =3D QCA9377_HW_1_1_DEV_VERSION,
 		.dev_id =3D QCA9377_1_0_DEVICE_ID,
 		.bus =3D ATH10K_BUS_SDIO,
 		.name =3D "qca9377 hw1.1 sdio",
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/a=
th/ath10k/hw.h
index 9643031..f5e6f8a 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -29,6 +29,7 @@ enum ath10k_bus {
 #define QCA9888_2_0_DEVICE_ID	(0x0056)
 #define QCA9984_1_0_DEVICE_ID	(0x0046)
 #define QCA9377_1_0_DEVICE_ID   (0x0042)
+#define QCA9377_1_1_DEVICE_ID   (0x9378)
 #define QCA9887_1_0_DEVICE_ID   (0x0050)
 
 /* QCA988X 1.0 definitions (unsupported) */
@@ -121,6 +122,7 @@ enum qca9377_chip_id_rev {
 /* QCA9377 1.0 definitions */
 #define QCA9377_HW_1_0_FW_DIR          ATH10K_FW_DIR "/QCA9377/hw1.0"
 #define QCA9377_HW_1_0_BOARD_DATA_FILE "board.bin"
+#define QCA9377_HW_1_0_BOARD_DATA_FILE_USB "board-usb.bin"
 #define QCA9377_HW_1_0_PATCH_LOAD_ADDR	0x1234
 
 /* QCA4019 1.0 definitions */
-- 
2.7.4



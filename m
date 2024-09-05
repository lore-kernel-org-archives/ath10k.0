Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C164FCD5BAE
	for <ath10k@archiver.kernel.org>; Thu,  5 Sep 2024 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Gu2NyeDCYj06j54dTeLW+R2cmUPtkfhps4/Gm0KUr8=; b=THzDOBDW0J0xU7z3AUtAahSjTU
	g8lV+VVLjU6Nvv/vGyfdYBfoRg2hAUCiwKGmdd/CtFv0NblDY3K0LWyx6DcHokpR4hIPPXNFJE3uq
	hjsQb23cUX6UQiZ8fQWAjp++Ic2b2LlzvFZOBHls1orP/r2X/bjVMbNWAcEUOQukNvmWOwxpR8d7s
	Eb+hErz0naWC5QADtrCtTIlwXJYug/cc5G6YX2+FJ/5ICxSqodq+g6ao8BXyK8nkADEJeHzV7acU3
	b/NzLnGQaN3G9kJQ5Cw/knwOemRTnIXMurjTwbjRcFWNZo//NB1z7+QEMAHr/dFjLYLrkw6Wb1hKq
	/NreJVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBDM-00000008E7q-1TRo;
	Thu, 05 Sep 2024 12:03:52 +0000
Received: from mxe-1-aa2.seznam.cz ([2a02:598:128:8a00::1000:aa2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBDI-00000008E69-3oQG
	for ath10k@lists.infradead.org;
	Thu, 05 Sep 2024 12:03:50 +0000
Received: from email.seznam.cz
	by smtpc-mxe-85b96b7dcc-v4qq7
	(smtpc-mxe-85b96b7dcc-v4qq7 [2a02:598:128:8a00::1000:aa2])
	id 7bb5008e8541b2247b3b8e96;
	Thu, 05 Sep 2024 14:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1725537818;
	bh=2Gu2NyeDCYj06j54dTeLW+R2cmUPtkfhps4/Gm0KUr8=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding;
	b=sG+kevS6Jv4bw0fG4tfwPK636cIn6pw4Fq7qMoFo5wBsmiBtUW7njm1gE9fw4sRSh
	 DCOZzcOkAWv+QJCVWyD5a8LhCja1sxelxY64dTKNgpVMVwKq+zI2ol+bp4IHcn7Lh6
	 CdB6bTahKyoKQP/DRzb65/fbWN0c0rIZ76mL34vhshgHLMtDg6S0C/r+g09Vd+NHCB
	 3YeDtTcUSH3YnKH7hLk67ihnnA6jV+toQ2Txzo1MjcTzkh3IbXy9v24OPlLmRdWJX2
	 26RYtH0I2LS5VM8aSPOfvU3S3lVBYe856uG4X3pmgtVvCnIWYyIf3t4mw5YG2XDyvl
	 cZ2fEoL1O+Kmg==
Received: from 215-143.ktuo.cz (215-143.ktuo.cz [82.144.143.215])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Thu, 05 Sep 2024 14:03:35 +0200 (CEST)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: <ath10k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath10k: add hw_params for Atheros QCA9377-7 
Date: Thu, 05 Sep 2024 14:03:35 +0200 (CEST)
Message-Id: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.1.61)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_050349_469714_CB6C662F 
X-CRM114-Status: UNSURE (   4.69  )
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

Add hw_params for modules based on Atheros QCA9377-7 chipset like
8devices BLUE bean or SparkLAN WUBQ-159ACN.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111

Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/core.c | 42 +++++++++++++++++++++++++++++=
+++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless=
/ath/ath10k/core.c
index b329428..e2ababf 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -629,6 +629,48 @@ static const struct ath10k_hw_params ath10k_hw_params=
_list[] =3D {
 	},
 	{
 		.id =3D QCA9377_HW_1_1_DEV_VERSION,
+		.dev_id =3D 0x9378,
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
+		.mcast_frame_registration =3D false,
+	},
+	{
+		.id =3D QCA9377_HW_1_1_DEV_VERSION,
 		.dev_id =3D QCA9377_1_0_DEVICE_ID,
 		.bus =3D ATH10K_BUS_SDIO,
 		.name =3D "qca9377 hw1.1 sdio",
-- 
2.7.4
 


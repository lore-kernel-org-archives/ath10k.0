Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E4FC2D0CD
	for <ath10k@archiver.kernel.org>; Wed, 21 May 2025 05:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=HoM42lN/ZmSYPV5QWNoYY/PM0agilLhn8mm3H3//o0U=; b=Lm8mihUvCW7AhawZ7odTwX4dQt
	3JAq9nIttTmrorfPhf/RNpfm3NH9J/lFcNeQmmc1T4yzThGNmb5u7X9DFoH8L5Q/meR828nQdddbr
	Upt9xSTFhizxxOPyNAU8V27S0SbtSjI88jYKXitMTmuFXRdZZoqWFmsnd1ooCjI1DDQYHdY7AlI2b
	N7q8DXJX0eVGlgZfSwWvTZ+tt2kzbNGChyliA7QxjayFEbEtNHiv4J/9tj69ZF5oPyKht/hEHVT1p
	WufNmEJCEIFAzuSuoNCjNqX88PWE0v8UpFdOfTkvSUyNpuu6k02IdtGYT4Gj0SRsCL/jXCkxpb9iI
	MhCvMoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcPO-0000000Et5R-3fIx;
	Wed, 21 May 2025 05:54:30 +0000
Received: from sonic314-21.consmr.mail.sg3.yahoo.com ([106.10.240.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcPL-0000000Et50-3hSC
	for ath10k@lists.infradead.org;
	Wed, 21 May 2025 05:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747806861; bh=HoM42lN/ZmSYPV5QWNoYY/PM0agilLhn8mm3H3//o0U=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=DA/9vUrMbIdbOY6QOOLE/HWXkG1ZdE/hITBY5i0z947JgIRusEWCcIBfCKDnJa+e8xr7fgzMRhDWsRlXFclpU/OxBFelJde8y6DOUdi05mbl8Xg+rCZL069Dc2VIkg5wMr8vbA12faItppRcYqBjXHmLJMSBeQL331ENymFpm1Bt3Bru3E9Wv62wo9esfGd3Tc3RJOOc/0OMzfA3YAs1JOioeFwlya9dKpnzs6nzx2cYa12x1pjUDF2AQvsatTOJQS9NA3wkh4tHCQsj1uWBcCoB5kD3EFZej+WthzfNzG/RTQ2e+IQOfRV8ehov+6YQTxUIeEaMLM9yYf/YLiTAKA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747806861; bh=gSCVpqCZoQvOhSdCjAkGdtf6WSL+HZaR5zB3ERDmB/T=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=qkItRLeXsPf6XKUa4HVVjnbeGaA+eDPLxPpJhGxkQt9QAU5jOQy2L6tD1DHAzVzK4/ZrFeMpfgmv5yvgQufbX/onfabNmuEQwJ+z5Xgz5oG6BNJln8tRy5k5y8YfL58vV4CgsEl0xPdz3jQz9xnTL1yGzelz+a2Y80U5p0WlkHgTh0p+JQokXn7DheVnNs/7HD0Sv/jFW3vSHv79jRossKtgvspb3JnSjelAd1Kt7EmhQiuH9Qux0rZuhP2+V7XyeK8/JcfFk55bAYnuxVlRqv4sigpDz3X014vt2Ks4jaGdmQhv8jfYYRArXKXURnPTYRNmlbjClS8pLlF2vBqOow==
X-YMail-OSG: 7l5hZHUVM1m_zszb.rol9Br6eJdeFxI.1soThVwUGCpxZino0vklXr8hYk9SvQx
 td2Vq62..mBF21eO2HdnZNIq7yifx.xoxd5.sBDRTZ9Hngmap5H_Z0JTcGrrfE7mdcmyXWIafE_s
 WSZ5_6Nrw79Dl8.h7aA6lf0g6MiC6i8KrSrYBjWE.KSoHKU1gEOcSQClZ.OZnVzjGDsdU8YD00d1
 P_wIt4jxTlOcaOXK_b6VNyy3eluUc7EmqWr3q_1lATj2xc46af8pscTciXEzepZ85l9zP_nAwg_r
 hYRBszKDqjZuWbmUEWWge.EqL_vofmdtQ1myXAZirv6_d8TjNsAR14_bDL3mj2gfQGXhhUgcFTBq
 ZU1tXvena62Ts8B8PXN8vpbHNB3S9OL_hWGigmnC01J000Ljx0Zp9gcKH3M3Y2bMstxbZWpysDLS
 cVQPIZ44OZRKLeZWLpam8rIamcT9V_uq2kDik.bW7iaemIiH5BTLAN_lv7gzFJYLPStArzNJzADK
 n3AmZoFd3fnTYVrR9w_7tdmrahK8id3m3WUuaXef5cFsVraNsiSn1E_9GuOfEeasL8EJh0F9uxUz
 xojegxVqflgvylsmm7622BgQC7oxZ9wkFGhvX5B1Hr0N8w6Ygi_ErnrDl2DUWL07L8ZeZbkrTu2u
 IXPfpIvVylX6i6csj.sxVfb1LR_giYrznQ2CfX3ixqNt6IM9P8j_Gjj3o4pPEYGmd_LtaybdrJ_U
 WZwa9kktqxjGx0HIjHAfATlAKWcj4MjlwWrZNbb84swXIXta6h5_69QbnNBCUAhhrMhbjedhy22x
 SYXjpK_nr0eGuBCaDOlobLtOmPuhJPwJxydivSsSkIpQsWp_Mm26Wnmf2tfvvdNyfHpJaos.wkTW
 EUml4S5R8gS4WxMmSmNiMrWcgyzN9gRjnjlOXOt_zrilBa6JEOgyjnewDujzuLhCBEdh58vlOzAn
 ydKSM2UOHaBIZcBmPt45gvTiltWN3R3qC2OWDBfX4Cm.ORG9Anw9YCOh.4oZR6tE6MT_v78viSQc
 sZvAZN111f8rVsA3Rj590bfnfFbVfFeb3D2Y265Z5WRmF7zgGYFhhFRh.tpfIRBMO6PuVVqwF8Up
 Y2bFNdk_zzeV1k86r2aj0HB4JsrKuPPMaZoJENuIUYUrh1o5_70Pvw.Sijy24zysLA5.QN8fA21C
 pygCRP5r.HAT6ZilRUGpju9SScQEv6z7fbO_WuBCPySgHl.B00ZHDnX12CDHqUvIFu5pHfD6xQfj
 gs1W2B9j2l48UXAaO2A2SCBWUTJTXKjZyC18oxpZg7YmD18vg5kgUJR7FXASdih1IunaLVCl8pvy
 ZoTIjL6FP00n9ILJXx4MemUSK.TbieskaiAMfN.A9iYRknRNkmg_Y9ztMXHafV6W99pgLOVieBtz
 ZSSBQmG6gdnbM8o2R1Qw5YNMsLqfVbQiqkaqsPbZGRaI_ATZp8i0MKeEe7opEihvJ5Unx3SlVi7j
 3E7UxhYUPhU7RLFIRU2nEYuaeFQHfTbZC06SOt1nGfBtAj52XEO7Sjg9W5AozKupkZj8ZCRjw8xx
 ut5yDTn5jZD0Ojb1BFyQGh3QbN8_1p.OcKJp7Yf7yQUD3Xj3_0ULP_zpLiiUrLqlFooyF_qF3ZUk
 W35isFE.FGVW8BpjOkOX3fpQH28gs0XZxojLWlIuvkxupfOCt4xQrsnKGbKq0YDEY9qOcCtz5buZ
 2kE2U6BiwhAq7wGh3NAK7_x.qx_KUoBJB3D9e.34iHaqPig0DIFwcJ2H9pnBtwaKvYvjZ2zC8JEU
 b7aZ6f3uTr6rXmz1mIjvYBqfOhsakhnMUQMQNAeTj23gW1LadbVA_SzFfW439JwWXdudNY1M5mnK
 ja6oJIrWuc3FxELPKF60cN_7CTFC7Y06E2lvobw2KZuN92h4iVyLs0IJqGxrh.O5Gdc1SI3WbSIL
 MO1T2I4KcTq_crHQPueaQq4iHDGqRBqUeeI1qtXR6yELhz6Yg2kyT87P_KB79xaFNjSzX_h7PShS
 H6EhBtJRzIiAJcax7z2RYdVbZWlp1AyKs67VNNAF3dLQNWbly_JP6Fr5XxRa_IVwTIqYiFRoBq3P
 .Oat2oC9eNLAuCKl_E4YCHqW4N_KW109cQeSYKWXzaeuD8zbzTEKC6Gd72JZnYnWKNPDXc3VEfqr
 b5RMUuTh6ab0AmdTmcnTupuuW1XRJ5sYbH7NIHt1cp7xOErWpSS3_.n6s_fbJXJ0sOX2SUtdQzGf
 O.cPi8rbPZgw.TZ3ztSsYC7qpLI60qD_cLm5vV1fgWi1y7ZgMsEdrviOTsJlUtxBxqMdtDyoegOm
 wG4jyobzJ3Zy1NAjioXcbFNnAcOa6
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: a7a13db3-da2f-4cf6-ba5c-e0e27320fb9f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.sg3.yahoo.com with HTTP; Wed, 21 May 2025 05:54:21 +0000
Received: by hermes--production-gq1-74d64bb7d7-5wzx5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3e7a6bd0605f353d52f1d2e817d79069;
          Wed, 21 May 2025 05:54:15 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: jjohnson@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath10k: Fix Spelling
Date: Tue, 20 May 2025 22:54:09 -0700
Message-ID: <20250521055411.288724-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250521055411.288724-1-sumanth.gavini.ref@yahoo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_225428_094259_DB4544BB 
X-CRM114-Status: UNSURE (   7.53  )
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

Fix "trasmitting" to "transmitting"

Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 446dca74f06a..5fab10f55c5d 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -779,7 +779,7 @@ enum ath10k_fw_features {
 	/* Firmware supports bypassing PLL setting on init. */
 	ATH10K_FW_FEATURE_SUPPORTS_SKIP_CLOCK_INIT = 9,
 
-	/* Raw mode support. If supported, FW supports receiving and trasmitting
+	/* Raw mode support. If supported, FW supports receiving and transmitting
 	 * frames in raw mode.
 	 */
 	ATH10K_FW_FEATURE_RAW_MODE_SUPPORT = 10,
-- 
2.43.0



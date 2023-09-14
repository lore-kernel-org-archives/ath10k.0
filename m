Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFE7CA5506
	for <ath10k@archiver.kernel.org>; Thu, 14 Sep 2023 04:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=feItg2f5F2c9+vP+Y0XFnJeaBU8y9q7ATzMNcDZqYR8=; b=IOeLWZSLVjWC0P
	wu+rWcPjkM6hjjkGUNivdMRXOgKa2FIiKs4b/8XutCbYJzMhDaD2RWV3KU1zHxlIYG11my9YtCvjD
	SskKEc7VWqdL2t3ITKLuVehUTZDWdqbzDGg+DvH8tsDdAlXkKvylM2ThTvS6u5bhRysNTehJF42yE
	ogYPs7gMACnvwdDUTGscBOu0cn9sRLYXKEt9ptdkBMuENqtqxBtR2iBxCic12hun4wFOtYHw3sfVK
	m25/d6EYGtzGNUYD2KRjP1fiRqlofXUsRTIgXUvrFp82i9IKyDwgNSRlIffKFqd2qgMv8DJ2wf2GM
	OxYvje7J2yn4edWsM3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgdba-007Jg8-0D;
	Thu, 14 Sep 2023 04:05:26 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgdbX-007Jf2-0y
	for ath10k@lists.infradead.org;
	Thu, 14 Sep 2023 04:05:24 +0000
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 9B255606080EF;
	Thu, 14 Sep 2023 12:05:18 +0800 (CST)
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Wu Yunchuan <yunchuan@nfschina.com>
To: kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	toke@toke.dk
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Wu Yunchuan <yunchuan@nfschina.com>
Subject: [PATCH wireless-next 6/9] wifi: ath10k: Remove unnecessary (void*) conversions
Date: Thu, 14 Sep 2023 12:05:17 +0800
Message-Id: <20230914040517.1170024-1-yunchuan@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_210523_536444_0795A8E2 
X-CRM114-Status: UNSURE (   7.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

No need cast (void*) to (struct htt_rx_ring_setup_ring32 *),
(struct htt_rx_ring_setup_ring64 *), (struct ath_softc *)
or (struct ath_hw *).

Signed-off-by: Wu Yunchuan <yunchuan@nfschina.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 6 ++----
 drivers/net/wireless/ath/ath9k/pci.c     | 6 +++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index bd603feb7953..31f08db8a42f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -798,16 +798,14 @@ static int ath10k_htt_send_frag_desc_bank_cfg_64(struct ath10k_htt *htt)
 
 static void ath10k_htt_fill_rx_desc_offset_32(struct ath10k_hw_params *hw, void *rx_ring)
 {
-	struct htt_rx_ring_setup_ring32 *ring =
-			(struct htt_rx_ring_setup_ring32 *)rx_ring;
+	struct htt_rx_ring_setup_ring32 *ring = rx_ring;
 
 	ath10k_htt_rx_desc_get_offsets(hw, &ring->offsets);
 }
 
 static void ath10k_htt_fill_rx_desc_offset_64(struct ath10k_hw_params *hw, void *rx_ring)
 {
-	struct htt_rx_ring_setup_ring64 *ring =
-			(struct htt_rx_ring_setup_ring64 *)rx_ring;
+	struct htt_rx_ring_setup_ring64 *ring = rx_ring;
 
 	ath10k_htt_rx_desc_get_offsets(hw, &ring->offsets);
 }
diff --git a/drivers/net/wireless/ath/ath9k/pci.c b/drivers/net/wireless/ath/ath9k/pci.c
index 0633589b85c2..e655cd8bbf94 100644
--- a/drivers/net/wireless/ath/ath9k/pci.c
+++ b/drivers/net/wireless/ath/ath9k/pci.c
@@ -781,7 +781,7 @@ static const struct pci_device_id ath_pci_id_table[] = {
 /* return bus cachesize in 4B word units */
 static void ath_pci_read_cachesize(struct ath_common *common, int *csz)
 {
-	struct ath_softc *sc = (struct ath_softc *) common->priv;
+	struct ath_softc *sc = common->priv;
 	u8 u8tmp;
 
 	pci_read_config_byte(to_pci_dev(sc->dev), PCI_CACHE_LINE_SIZE, &u8tmp);
@@ -799,7 +799,7 @@ static void ath_pci_read_cachesize(struct ath_common *common, int *csz)
 
 static bool ath_pci_eeprom_read(struct ath_common *common, u32 off, u16 *data)
 {
-	struct ath_hw *ah = (struct ath_hw *) common->ah;
+	struct ath_hw *ah = common->ah;
 
 	common->ops->read(ah, AR5416_EEPROM_OFFSET + (off << AR5416_EEPROM_S));
 
@@ -820,7 +820,7 @@ static bool ath_pci_eeprom_read(struct ath_common *common, u32 off, u16 *data)
 /* Need to be called after we discover btcoex capabilities */
 static void ath_pci_aspm_init(struct ath_common *common)
 {
-	struct ath_softc *sc = (struct ath_softc *) common->priv;
+	struct ath_softc *sc = common->priv;
 	struct ath_hw *ah = sc->sc_ah;
 	struct pci_dev *pdev = to_pci_dev(sc->dev);
 	struct pci_dev *parent;
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

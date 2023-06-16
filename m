Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF3CEB64DA
	for <ath10k@archiver.kernel.org>; Fri, 16 Jun 2023 09:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AjEqjjr5i+lKxltZe5r16tGC0QBHbb1IKJaTlwNYG4g=; b=0bZoryKhA6wsy7
	RdOqqSCoQV1FN8s8PmHgpElyKRP0MN4dMIupaIRCXL4ZNNgt/Y0COvAsG8wD74YynDKnkCpPjx4z/
	rB0rSrPtl95/CtoFSp7SxVjb/U21Aj+iVX6p3A6AiMWwoxngKOcxpwNXQPzeL18GNm872QbZ+Y2E+
	KkNZJZtjP8Dtw6/aEpU8uSHH3+g8jkhh7eTUJz44k7V8vNsxkLKI35P2ockFBTceO5fFQptM/GUUM
	hccSbfc19ulO3vqHlqvCET7DrjX1rhBptOm80HgQYx46hewWeheOE8bjkKYD/n85MA3Ds5z7laMtf
	LRGsoLmf6Sdw6y6gnDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA5Nw-00HPCa-1T;
	Fri, 16 Jun 2023 09:04:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA5Nu-00HPBq-1T
	for ath10k@lists.infradead.org;
	Fri, 16 Jun 2023 09:04:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C49061840;
	Fri, 16 Jun 2023 09:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A29AC433C8;
	Fri, 16 Jun 2023 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686906284;
	bh=ZIfwN7dOKIbw077DPRJk3QvTD8i+PX9joN3XwIVd+S4=;
	h=From:To:Cc:Subject:Date:From;
	b=niagvxX+xZgRBkm7C+5UOsMAzDVNBPf2P6YfN8GJVEbuR9LLPyGBI1Ze0/8OkqPHH
	 5Eo2SLeUs+boCURI5yINU2SZdHjASmTKRE31nhPUCf+oBHbPwXolxGkpJN/G18WPf2
	 xr1sBtcTkFPgWblY+xRVvXHqtp5tTvd2TwjcfttzxQyJ6cy5Aqrnh67dgzVNIsL3ap
	 0Uq4gXNrl1nl/qT2KOwe6MPKv+la4iwplFfir2ZoySdn/VixobzkILcvyaUTP07W0B
	 nk4IikvGP5tH+pN+9Ee8QV7KEAoax2XB3PHXluqu/s675J2Rjfs7e1idrGFcLJbXWa
	 gKas7TYDSeE0g==
From: Arnd Bergmann <arnd@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ath10k: improve structure padding
Date: Fri, 16 Jun 2023 11:04:21 +0200
Message-Id: <20230616090439.2484857-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_020446_590396_2D442922 
X-CRM114-Status: GOOD (  11.68  )
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

From: Arnd Bergmann <arnd@arndb.de>

Including an aligned structure inside of a packed one is ambiguous
and can lead to misaligned data, as pointed out by this clang warning:

drivers/net/wireless/ath/ath10k/htt.h:715:34: error: field prefix within 'struct htt_rx_indication' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
        struct htt_rx_indication_prefix prefix;
                                        ^
drivers/net/wireless/ath/ath10k/htt.h:736:34: error: field prefix within 'struct htt_rx_indication_hl' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication_hl' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
        struct htt_rx_indication_prefix prefix;
                                        ^
drivers/net/wireless/ath/ath10k/htt.h:1564:2: error: field  within 'struct htt_tx_fetch_ind' is less aligned than 'union htt_tx_fetch_ind::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1564:2)' and is usually due to 'struct htt_tx_fetch_ind' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
        union {
        ^
drivers/net/wireless/ath/ath10k/htt.h:1702:2: error: field  within 'struct htt_resp' is less aligned than 'union htt_resp::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1702:2)' and is usually due to 'struct htt_resp' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]

These structures appear to actually need the packing since they
are embedded at misaligned offsets. Add even more such annotations
here to enforce bytewise access throughout the driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/htt.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index c051a22fce145..e0c9f45e74761 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -707,7 +707,7 @@ struct htt_rx_indication_prefix {
 	__le16 fw_rx_desc_bytes;
 	u8 pad0;
 	u8 pad1;
-};
+} __packed;
 
 struct htt_rx_indication {
 	struct htt_rx_indication_hdr hdr;
@@ -1565,7 +1565,7 @@ struct htt_tx_fetch_ind {
 		/* ath10k_htt_get_tx_fetch_ind_resp_ids() */
 		DECLARE_FLEX_ARRAY(__le32, resp_ids);
 		DECLARE_FLEX_ARRAY(struct htt_tx_fetch_record, records);
-	};
+	} __packed;
 } __packed;
 
 static inline void *
@@ -1723,7 +1723,7 @@ struct htt_resp {
 		struct htt_tx_mode_switch_ind tx_mode_switch_ind;
 		struct htt_channel_change chan_change;
 		struct htt_peer_tx_stats peer_tx_stats;
-	};
+	} __packed;
 } __packed;
 
 /*** host side structures follow ***/
-- 
2.39.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

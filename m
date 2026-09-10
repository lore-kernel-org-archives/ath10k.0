Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26251C79FB9
	for <ath10k@archiver.kernel.org>; Thu, 10 Sep 2026 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMJLA/efZolJ/s2ULV6M9FfSxybkuBS9TaHpKmSFOSM=; b=o+8dER+f/TY9PWWLUrm0OvPx5C
	W2Q7zVG2nR1z8F8KRezw1Yazd9j27NjhKGFMs3tVN7w/x5Xm0tFJgZOVzxLhkoxVZokaoNpEGwYnE
	BxnkMQfy4wb96rU8qTnc4euVzhn2cudawxgJHC6HM9awjVPwb95G4A7rKYMSaRccmn+/9RZRyVhfM
	LPtrL4+W2WtvBM6+Ypm2tutfY8ztJPzX1jXFkg+1bQ57PyGyMvGwFyUo/hogH7i0pBXceX+1LmFq6
	0z7SKTqBoPaVh6MiY65ocmK30cgJVEcYu18uzJ0cQfRciBSbu3ZuNGaggb0PB5byjjPDgiD61oJnt
	1WH7W3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZqC-0000000Dh0X-0wzv;
	Thu, 10 Sep 2026 08:09:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZqA-0000000Dgzr-278X
	for ath10k@bombadil.infradead.org;
	Thu, 10 Sep 2026 08:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mMJLA/efZolJ/s2ULV6M9FfSxybkuBS9TaHpKmSFOSM=; b=LovpKcRmfkPCYgEnwJayvx1CVf
	bv5GpVOpx7oTR3xtXV6SmTRc2msHBirnK6PiHO0B1Tp5yv5vPjcB3GIi5xYKwJ2P0xNM+n+qL0pbY
	RDu4fzK1zWNP1ztlj+Kiw4PycbCRuDcTf39aYE7XLm+OkSX4EqDh2ZWQkBN1MFGt4gPaZmGZ9N4Jg
	qyq0IXSQ2DUs7DvT38iXcAIpP0I+vUzWzltgHYqR4E2Anq7JCY1fGxgRYM/X4f1FM/vnt4qYOtGO3
	xKYeqEk/QDeVEAdyYH8Y/lbdZWsyaXHXL5JpCSvP9HPZhxkZwrUErGIx6N7TnUALxEWVhSJqNYRj5
	bxMMcIAQ==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Zq7-00000002AgM-3CqR
	for ath10k@lists.infradead.org;
	Thu, 10 Sep 2026 08:09:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-398b3c37877so6365032a91.0
        for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 01:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789027737; x=1789632537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMJLA/efZolJ/s2ULV6M9FfSxybkuBS9TaHpKmSFOSM=;
        b=e2QKXUbIF8ewXJwYGa3xHbCVNrEviNREcmh81JDhxUy0N45vzsVycNPOKod9y2bUan
         pjBVXRQf7YN+DgSIybzbBbUYDl6AtxvNcj4pvI8u604bNWXo1zbGdIdeqn75+zlK+8DJ
         JTjvIiYwPSvjiF4q6L77NCl1kxEupY2sTMXL7vUstoBPgMqVFpDjB7Ec0tAELSRINOoq
         UeaXvW76CQII/DoW1xgXVQKkXS1BVJMzdrAZuq47pIS9QCoN+xW/YFzVDITq8jigxWr7
         0e7V/2s2WRgSa4sEtGtWLundMJLTkulPe1KSdoc+1fRQVh57XWPNU+UArvjEaiX98Wos
         M9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027737; x=1789632537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMJLA/efZolJ/s2ULV6M9FfSxybkuBS9TaHpKmSFOSM=;
        b=MGJ4A2RL1Bmusz8od1yXSISOJoKnH5eYuiiECf477wGw+JMw+5SIc85TmedN2EZPmk
         F9b/8G+3O94U2tDrrTNjIfvlE6w0F5Y02ZTEea440mEYNsl47duDegXywWCMRptPQKwn
         x3DEQ0GsJ6INUM+kc5glxE9N6WJKmCXqf/nSoDmiD26Sr9em/3JRWWczDmk0Cpiw9cTa
         qjMsmTeh09cd9TmyjHJ+NvAErJvr0W1uUyOrg02HI1V7UqZ4sNP5gnWf6cE4wcZUSY0Y
         cpTZpkF4k8tK1ZmnEukdpLXrdlsSFQJ0JImlwK8MH7a6vaAmvQYX3WsOb8VVvDOrvRBn
         ptmw==
X-Forwarded-Encrypted: i=1; AKwUvByzcT9CkfxNPgGSWTQn2xoAuVRvgVQ9QvuS/a/m9PpMRCX00IvvU1hS2JfG2C3NXQTR4Yu/5Qo=@lists.infradead.org
X-Gm-Message-State: AFuF++mUB6SjWhxQq3Ds2R2EAs19EYyYHOs1ph1SsAaOrbx5NLj+Tc0V
	tQfoEb7BlM12XUo/HEl6C9GeQ9EBE9aDV1mZVebg4OsdijR+GUKLtDnc
X-Gm-Gg: AYBFou2F1njkNSRS/jcEDha7A/uVOLHX5pmiqlL/b8K/Jo+a5C3sNQwmZ7N5swJPxPZ
	fjaZU8cROgOAVX24zkgCOpbNtLqDB9TGcL844JzjKFfL+tNaKtpiVsLp8YJTj/s6nC8HEHZvwFa
	G+yqsJEuOmzntPjwSB7iRmaDonGIeUfxwU8jPtKfj5pcZ4vRWXCoR6V6Rz6DH5GVVeeBkKqWya8
	RTWEZY5qIh/egZPSOa5J4H2A2CXyLLvQt3md17Ux2Nu8ABtgrYTKF8ZslRFYuOwZQ1vInRckV2R
	e/qewMKpaD5JcSwvfCV/CAovuEyAyVIpZw1lyPvCGNvRT7TtuV8MYW72k5J7c7re1fLPtzKGA8r
	96gA8KdBLknK8wuExXCDQKckK8m5iMsyroNWpJaeITHkPxbstIyq1qSo+qyeglM1clptInIpJk7
	cdpwqBXZHVdzLfDwxSrGsxxIu/ZQFPyutiK5PfaSHcD1gHF6pW83MRQiQZkowyzzz2eB2F7pOe1
	163acp2sEmyzbGvVt+fHPXE/YDFaS9gwukdZf0JyF8qVf+YN4JrXTjvwS6IQRz0z434GuN11m+X
	GQ==
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr61169626a91.1.1789027737071;
        Thu, 10 Sep 2026 01:08:57 -0700 (PDT)
Received: from codespaces-1adab9.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77486a1esm4607521a91.12.2026.09.10.01.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:08:56 -0700 (PDT)
From: Rivaldi Hormat <rivaldihormat@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kvalo@kernel.org,
	ath10k@lists.infradead.org,
	Rivaldi Hormat <rivaldihormat@gmail.com>
Subject: [PATCH 2/2] wifi: ath10k: Add missing validation in ath10k_htt_rx_proc_rx_frag_ind_hl
Date: Thu, 10 Sep 2026 08:06:59 +0000
Message-ID: <20260910080659.20831-2-rivaldihormat@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910080659.20831-1-rivaldihormat@gmail.com>
References: <20260910080659.20831-1-rivaldihormat@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_090859_943673_BAA651E8 
X-CRM114-Status: GOOD (  10.56  )
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

The ath10k_htt_rx_proc_rx_frag_ind_hl function processes fragment
indications sent by the WiFi firmware. It performs pointer arithmetic
without validating the skb length:

1. skb_pull(skb, HTT_RX_FRAG_IND_INFO0_HEADER_LEN) without checking
   that skb->len >= HTT_RX_FRAG_IND_INFO0_HEADER_LEN.

2. hdr = (struct ieee80211_hdr *)((u8 *)rx_desc + rx_hl->fw_desc.len)
   without checking that fw_desc.len does not exceed the remaining
   skb length.

If the firmware sends a malformed fragment indication with a small
payload, this can lead to an integer underflow in skb->len and an
out-of-bounds read in hdr->addr1.

Fix this by adding the missing validation:
- Validate skb->len before skb_pull.
- Validate num_mpdu_ranges to be <= 1.
- Validate tot_hdr_len against skb->len.
- Validate fw_desc.len against remaining skb length.

This prevents out-of-bounds read if the firmware sends malformed data.

Signed-off-by: Rivaldi Hormat <rivaldihormat@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index ab2d373b4..4fabb9264 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2775,6 +2775,13 @@ static bool ath10k_htt_rx_proc_rx_frag_ind_hl(struct ath10k_htt *htt,
 	struct htt_resp *resp;
 	size_t tot_hdr_len;
 
+
+	/* FIX: Validate skb length before skb_pull */
+	if (skb->len < HTT_RX_FRAG_IND_INFO0_HEADER_LEN) {
+		ath10k_warn(ar, "Invalid skb len %d for RX_FRAG_IND\n", skb->len);
+		return false;
+	}
+
 	resp = (struct htt_resp *)(skb->data + HTT_RX_FRAG_IND_INFO0_HEADER_LEN);
 	skb_pull(skb, HTT_RX_FRAG_IND_INFO0_HEADER_LEN);
 	skb_trim(skb, skb->len - FCS_LEN);
@@ -2792,6 +2799,13 @@ static bool ath10k_htt_rx_proc_rx_frag_ind_hl(struct ath10k_htt *htt,
 	num_mpdu_ranges = MS(__le32_to_cpu(rx_hl->hdr.info1),
 			     HTT_RX_INDICATION_INFO1_NUM_MPDU_RANGES);
 
+	/* FIX: Validate num_mpdu_ranges */
+	if (num_mpdu_ranges > 1) {
+		ath10k_warn(ar, "Invalid num_mpdu_ranges %d\n", num_mpdu_ranges);
+		goto err;
+	}
+
+
 	tot_hdr_len = sizeof(struct htt_resp_hdr) +
 		      sizeof(rx_hl->hdr) +
 		      sizeof(rx_hl->ppdu) +
@@ -2799,10 +2813,26 @@ static bool ath10k_htt_rx_proc_rx_frag_ind_hl(struct ath10k_htt *htt,
 		      sizeof(rx_hl->fw_desc) +
 		      sizeof(struct htt_rx_indication_mpdu_range) * num_mpdu_ranges;
 
+	/* FIX: Validate tot_hdr_len against skb length */
+	if (tot_hdr_len > skb->len) {
+		ath10k_warn(ar, "Invalid tot_hdr_len %zu > skb->len %u\n",
+			    tot_hdr_len, skb->len);
+		goto err;
+	}
+
+
 	tid =  MS(rx_hl->hdr.info0, HTT_RX_INDICATION_INFO0_EXT_TID);
 	rx_desc = (struct htt_hl_rx_desc *)(skb->data + tot_hdr_len);
 	rx_desc_info = __le32_to_cpu(rx_desc->info);
 
+
+	/* FIX: Validate fw_desc.len against remaining skb length */
+	if (rx_hl->fw_desc.len > skb->len - tot_hdr_len) {
+		ath10k_warn(ar, "Invalid fw_desc.len %u > remaining skb len\n",
+			    rx_hl->fw_desc.len);
+		goto err;
+	}
+
 	hdr = (struct ieee80211_hdr *)((u8 *)rx_desc + rx_hl->fw_desc.len);
 
 	if (is_multicast_ether_addr(hdr->addr1)) {
-- 
2.53.0



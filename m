Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD5DC79FA1
	for <ath10k@archiver.kernel.org>; Fri, 11 Sep 2026 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNkNpvPXXOsHCrRH3dp5EJvTni7q+cIYOriXNedPssg=; b=gKMnOcDpyOIppL0DUxNKx6oy+x
	CNiDrfH5WkDCqMrtaP2OvHDcC+SV2XtcM0iuCntQX4XZYqUG3jHZmUvWwgV7LFPK1diAYQ9d/9coQ
	NKq/2F3jPIY+hDlxx5i9C4PXrXOPXWLYw+mjT3mPD1UMHMzaCpmF+t5hIMRMZ4SBAACsUoiSDit5b
	Y74HA4Kpbv/kxBBZc3/FXfHAiy8fR5q+9yc+DSkq3rW61ocuuM6pIIQDNmYZPrcpDPAuv6WWRKwIY
	vOg7epWd8LQ9y7OIsnuYM2008ul5RKyYjKsYOEA+HrQDRznB+UCKaWfmMT4RfbNFTa9G6Y6dQFt1I
	SQpDPToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vcc-0000000G0tC-03AC;
	Fri, 11 Sep 2026 07:24:30 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vcZ-0000000G0sO-0aQc
	for ath10k@lists.infradead.org;
	Fri, 11 Sep 2026 07:24:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so551224a91.2
        for <ath10k@lists.infradead.org>; Fri, 11 Sep 2026 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789111466; x=1789716266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNkNpvPXXOsHCrRH3dp5EJvTni7q+cIYOriXNedPssg=;
        b=g+1J83ettS2kvBsbhS42UVAG3VVft4VglZ6DV7Xi0XMalkPMyGhqhB7Rg0ookjJ+Wr
         mPtNx8ie7vSunsfo3n6WPzeI220Xi13+9gSuQ6JytDALfhc97dUog3C7B1wfbv7tTd7n
         frpuCar3lWUmF/FpctQ3Ur6YwkLAS04C1eDonw33iE4IzSOK5k08k0or+hNNsJ8avhQ/
         EP9en/xXt0oVw2m9K5AuY96fyqaXO/6b0m6dWdqrCVzwZZvsaawFgiKaJILA7EOnkr0N
         Iz7UW1e5Q6o8U+CZvnXqeY5pEgpXBXM9sEadO9FBPiZMG5PgDwDza3LgvkWzPsEKe1zc
         ypJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111466; x=1789716266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNkNpvPXXOsHCrRH3dp5EJvTni7q+cIYOriXNedPssg=;
        b=QHkKMcTanjgQfuib+GRS2yRmakUd0lHIwLMhoG+k0q4pyZk/dCN9oFQaNeRBNJVySA
         e8mx5Dsb905pkY89npwOBanbyoMtpiIWTD6JOQWkF110AxxufmnmLmHc05jvAjbThLcw
         /ZoEzplzSI/q2jy3XJ82KyM3fc7/E9HTsBX6EtZucTpv9sYdqZr1MGHz7QycRo2PP5cT
         YIEb5OZOsLgnuQAml81K8ybAowuZ9W0S9KXqcbaqgXRg5mTWu+6/OIW79Eg3YBMCLKMs
         dGUdzgSuXOBqxKvYGZvrLKwh9c84HIjnERqkf9K/tANBZJKHkoj9+Wk6NwyGbn9jeSkt
         dQsw==
X-Forwarded-Encrypted: i=1; AKwUvBy6LNPj5tbOOBk44zY+Ma8yJ5fZbiCWcvDsv/bZD/Lp86pQ/UqA30SgMUgv1WV6z1m7zgPKDGk=@lists.infradead.org
X-Gm-Message-State: AFuF++mEW5l2MnoV9gg0+yDTs6H55eOOBUeZ8Nh1qkmJxUuFuGkPOGey
	sAiIZG0EZz58Nis9A9pR3Sq3081qNLSSlLOtenlQv+S/unK90BiZydjO
X-Gm-Gg: AYBFou00MIq3QTN32WJtz0+Wwrb1P1DmWYmOzsY3O4kO3aH+oevTnJHzE1fn18vaQeF
	Vux0JPS4YyMi/yhDICipCVI8UgybESknCvPbWSHcMplA41neGM9gNEzDwovGNKTko3SY/iqKtGh
	bbEB+6kgnYHCdDGpmgKPOMQjChRzWx8h+ABhzUZokqaEXOdq+tfhOu3ypo9Kbyx+QuPibhnHLcj
	mD1wtvm2+iEJ1CEwiJCu7yZY3TigvM2diUUCjlb/kjKbZT6ZSgx4yb0PyZ9rcMz/SKhvhDQRp5t
	m2TAWXCsrjVyDkZvHbLQgMEFk6HoMXSOojteNLrkRFTQtQbfX7DFzG+8TeovfOvgWrDR7edYlEx
	GotTfy3tLZIpuxZTC9BB0Nqx5kwKt5Eko1xzZzm7Z7x29F7WtFOLOnpeLuWUsTeImZx0a/5iFPD
	vqcx5XdeSxNi3KAJ5W2WESlT8UWmcpVc268a6/4F96YFEw4MX2hlNI6pKq2KsJDv/C1BGulOHlw
	Hpf93iwaE20EZLAlG1eWNjaAjm5pV+tI9r0oa+mQqstOo8OEhg3DOfuAKuD4qlPfEskDi52pLOZ
	8g==
X-Received: by 2002:a17:90b:35d2:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39d9bc0dca0mr4927613a91.3.1789111466067;
        Fri, 11 Sep 2026 00:24:26 -0700 (PDT)
Received: from codespaces-1adab9.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da1ad5d79sm1984815a91.12.2026.09.11.00.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:24:25 -0700 (PDT)
From: Rivaldi Hormat <rivaldihormat@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kvalo@kernel.org,
	ath10k@lists.infradead.org,
	Rivaldi Hormat <rivaldihormat@gmail.com>
Subject: [PATCH 2/2] wifi: ath10k: Add missing validation in ath10k_htt_rx_proc_rx_frag_ind_hl
Date: Fri, 11 Sep 2026 07:23:17 +0000
Message-ID: <20260911072318.5232-2-rivaldihormat@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911072318.5232-1-rivaldihormat@gmail.com>
References: <20260911072318.5232-1-rivaldihormat@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_002427_196156_020B1E13 
X-CRM114-Status: UNSURE (   9.05  )
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

ath10k_htt_rx_proc_rx_frag_ind_hl() doesn't handle undersized packets.
This can lead to an integer underflow and an out-of-bounds read.

Fix this by adding the missing validation.

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



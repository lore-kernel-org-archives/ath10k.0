Return-Path: <SRS0=4uJM=KJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF90C433B4
	for <ath10k@archiver.kernel.org>; Fri, 14 May 2021 22:10:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 033566145A
	for <ath10k@archiver.kernel.org>; Fri, 14 May 2021 22:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 033566145A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3JXaG4cEoL6mbn3z4iFbGtOpkJmTdkmZGTAHKOdl6NQ=; b=VcCaMc1AtiCXtyJrgguEhP+lhz
	apCsRsigcR5eCyJRl6GAp3cCwoJUyTC5rTQo1UQExc4eOAlpMZsM0IEXJ+FC7EXaqbxMOLTukYgox
	yYCQn51yqywXvWFm0RDdDZF5Kc80TMvc2P26E5gZiL60IaOA8WWtf+VrnkH3eulU236QSqWCFxSE3
	VW/R1v+Xr1W64f2bHI8mDWHzwQBfmMeFotYrRRoXhXeyJqQfVRFCFryRPVAuLvZQzIVecjcTll23F
	kWOe0BychJ+IQEHeSn91QJRrdy/Ci1uhnNxkycwZp5l1355xMD0K6xamLbGLiM/bZP4En2+BWehgu
	lh5nD0yg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhg0S-00987W-2S; Fri, 14 May 2021 22:10:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhg0O-009875-LQ
 for ath10k@desiato.infradead.org; Fri, 14 May 2021 22:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=EVEwKEdVLlVVJVxedoNBc4BWAXFfR9V6+rvEkmkqNqo=; b=AFJXk7e+7M6XCC5M2GI5DFQUum
 HBgvas5VpurmRPZeE4wjzUIklSM/rMXmbWqNHZ5QDG/vBv4dQeHQprSoJtrhgrpdDGjAFgs0Q8/K7
 fecVOfQSVCSUNYktP/WwcBE38++H2GC4KTPbGmsiu6K6V1ExtNmhL+S3hKVkexeKJhpyIUK0Yopw4
 I0kyVNzwpsWAdKEhLL1gjIBTaFz4boosWMfrnBqYAL79vuCbxSyGKFwXm0llT0FcemxamLiUpYrzt
 TNL8VyyjtiIeNcIwh5rL/t8umuIa9GHcHdZ5Zd2mZ4ZzEbjrqLSig4GicnCCYwcg8mp/WoxZi/QK0
 CQz5uH3g==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhg0M-00CI8R-2I
 for ath10k@lists.infradead.org; Fri, 14 May 2021 22:09:59 +0000
Received: by mail-pf1-x429.google.com with SMTP id c13so715186pfv.4
 for <ath10k@lists.infradead.org>; Fri, 14 May 2021 15:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVEwKEdVLlVVJVxedoNBc4BWAXFfR9V6+rvEkmkqNqo=;
 b=lf/df1n6657u4+dZTrwF6xxCFyjzE5ovnQgCJaDGuK17YTXI0MQoYgqn2DBtrXTM9y
 6qmBCVv4NMVI9HnQMblrhm2Y8iWZpF12WPu40pq/Vru87pc9BbgDit95m2cv8C4RmXY5
 i6IBr1nP44ztPdfmUclXOAZkOG/tjzQ5koJ1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVEwKEdVLlVVJVxedoNBc4BWAXFfR9V6+rvEkmkqNqo=;
 b=ZK1rEte18LzIvCgZYm9Gk9E8Lzvs/A4c+vBMj+quMLI35Iss3haFtSEiAo5Qp7BOpJ
 bRUa7bQ0XrapRrIhEKmW/fvMlCaslpSnDh919ycJpIpye5FsxHa7rmz4xjL7vPku1ePO
 /aMoQn9UOFJt+YqwtUoLYQahFUfrbjRZ1JF0VKofDwNSqvNkWUFg7sMzYNTRJvXO3dx2
 skwmNMVWhr6paY2QEdjb/5r/PJGvFAOWvVDdHAV4cqr7wag2SDfi9lEHx9a7D9j+fhon
 vHkmvDPz5XBlMJ3sogD38fFAXODcgHYJmI6n0BaeODBFxx4a1bYHE234SWD2iR3TeByw
 tBpQ==
X-Gm-Message-State: AOAM533zN18c68ObN8rV8r7vJXasoLm4lhLMOmAxZShRYBCnI9p7tAuC
 7oP123qUw00Cijw744ds4QIB/ijMvLjwJQ==
X-Google-Smtp-Source: ABdhPJwq18GMShSHikNPymoScSOxvtF7YXVCscqGBVyyUnLW5CUGpxUPQ8en98R5qUf4KEmP5j2zxw==
X-Received: by 2002:a63:d64f:: with SMTP id d15mr48686658pgj.137.1621030191378; 
 Fri, 14 May 2021 15:09:51 -0700 (PDT)
Received: from kuabhs-cdev.c.googlers.com.com
 (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
 by smtp.gmail.com with ESMTPSA id j4sm6446156pjm.10.2021.05.14.15.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 15:09:51 -0700 (PDT)
From: Abhishek Kumar <kuabhs@chromium.org>
To: Johannes Berg <johannes.berg@intel.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: briannorris@chromium.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Jouni Malinen <jouni@codeaurora.org>,
 Wen Gong <wgong@codeaurora.org>, kuabhs@chromium.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH] ath10k: remove unused variable in
 ath10k_htt_rx_h_frag_pn_check
Date: Fri, 14 May 2021 22:07:42 +0000
Message-Id: <20210514220644.1.Iad576de95836b74aba80a5fc28d7131940eca190@changeid>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_150958_144626_32F6E9C5 
X-CRM114-Status: UNSURE (   8.63  )
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

The local variable more_frags in ath10k_htt_rx_h_frag_pn_check is not
used. This patch is to remove that.

Fixes: a1166b2653db ("ath10k: add CCMP PN replay protection for fragmented
frames for PCIe")
Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 7ffb5d5b2a70..adbaeb67eedf 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1787,7 +1787,6 @@ static bool ath10k_htt_rx_h_frag_pn_check(struct ath10k *ar,
 	struct ath10k_peer *peer;
 	union htt_rx_pn_t *last_pn, new_pn = {0};
 	struct ieee80211_hdr *hdr;
-	bool more_frags;
 	u8 tid, frag_number;
 	u32 seq;
 
@@ -1805,7 +1804,6 @@ static bool ath10k_htt_rx_h_frag_pn_check(struct ath10k *ar,
 
 	last_pn = &peer->frag_tids_last_pn[tid];
 	new_pn.pn48 = ath10k_htt_rx_h_get_pn(ar, skb, offset, enctype);
-	more_frags = ieee80211_has_morefrags(hdr->frame_control);
 	frag_number = le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
 	seq = (__le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
 
-- 
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

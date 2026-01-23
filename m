Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB78D7789E
	for <ath10k@archiver.kernel.org>; Fri, 23 Jan 2026 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CFDEOmaGngrWuic2vWW8nkHShPa2cF6a+SEkB8r9KMU=; b=V6J8Fnc08WwHTgZ/F38/fdSobs
	bilOTbQdQWhfaJ1PEQ3gY9SKetBz8TYxkjeM//M15aUdLV118BvSCtlvMrHsw2UiK8K5Ekfe9IyjB
	Wa6LCZXiHivmJ2x06hdizd4x3pYd/FnaemIeT1YJHJ+jvKjr0eXTPCjL6ONT8Tm/noV9VgKlzXX+L
	vtqBi+0mqvKyrg4sNdIRJeKpldPcsgBcLiQY3z/yBHanjSznmLCyKwAmlQwBueiBp+E0V9hiwUitz
	3HUr/zsn9TL1pPcbc3FTkNlcrmgS30P/ULtPpXDXw1NUMzf8iJPGFPAWqhs1LK2xVIj/Vg6PeVVdJ
	uUQtxRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLOT-00000009JyW-1Rr2;
	Fri, 23 Jan 2026 17:56:25 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLOP-00000009JyC-0IE4
	for ath10k@lists.infradead.org;
	Fri, 23 Jan 2026 17:56:23 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-65f59501dacso1802481eaf.0
        for <ath10k@lists.infradead.org>; Fri, 23 Jan 2026 09:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769190979; x=1769795779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFDEOmaGngrWuic2vWW8nkHShPa2cF6a+SEkB8r9KMU=;
        b=ASJmZdVEr397RIeLXzDVYUDs63rrErxcM8zDISt76q7pXoILCFP6kBZ412umZzLFEc
         1FLRlMoWdu5cPxIb7U6MFFZ+mPRrFweJIrQ3Mi2PsJyZHFeXw88NqdJZ46AgoIu4WWR6
         y7aYCqs/4XzcEutIB/ELCKDIP3+gZci6zchPegc+TMS7mJuIxYZf6A6xqChn7KYpU431
         Pqq8S8zZu0udm+9WLUAeAp7XSDyM6GIZ1BQh2PD51jA1dh0bdGUXPRVBBdLSLkCBbPOP
         2tAHIO11i3p/fFj4mjBktydy48wPySQul8jE4vD49GnTQxjPRbIgMpspneYWG628iTum
         SZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769190979; x=1769795779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFDEOmaGngrWuic2vWW8nkHShPa2cF6a+SEkB8r9KMU=;
        b=VIo9NMhIm6q/e9D8LCSWpQOOp4qvPnYQOFL4KuAz+evu1Wq0o6Xwhhwo8Zynnj3b6C
         HxUV7JICvGNh+vuwKe2GFPttYmz54go9EKE55LvIA0p+fNE/n5llZO5AotXjPZIJ/C04
         TKv58DJ+9SSSPpCo6JM7Rd5QJAGoI9Kr4SZBxDIh4He0vmQP2EMg1ZEvl2vDr8uTlJaC
         ypxXQ2LfQNjc1/4fYnZIJUCd7zv/3uvuBxAeNp/iqpZeDbPI76KwT3jrSGv76KSNfNEz
         nT77MyUMKtJw6/Jz/xURQWqhg425zGrTjcH5WeJWRmAHJCmc3r44D18MJHTlKx92XD8K
         /0QA==
X-Forwarded-Encrypted: i=1; AJvYcCXQgvUpfOdyrYu8LAOT5YRCWxqCoTVHTCZTPyL2/B+UiEsbO/gqtB3kS6t4Ta+ok39A4XlF9ok=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmP5DI/6Wdm2nolH3UXsldQfAuYoorVHpEM9+HotXeboD98dTI
	SsrYgQLq4TVUeqWHO/6s+O1cABMm9ZJXagSUdApCNV0qntiw4qOeN9D/bBPp7p/rJsG0Ty0VShJ
	hdU+V
X-Gm-Gg: AZuq6aIZzWgAnC+FcspkJpnViHi/42UAeajjG61FQxoFK9nkaftG/SGklm14kXLy77V
	R/ZaYXZruwtAtaFVSJuJA6gGlV0ONrL01PaNzitvJWw/v2ET59IshJgiYNz3QJi2cJLmbAuj7GV
	FLQmQprracgpyQJOfhfw7/5hfS2zsxeg6tD7I6eJtuFONsMUOEVPvFeZ1x2PYqdMiPORno0+Xm8
	yeuroxUmxoOowKhNeW7cbmxIdXjdafbeE3d7BKCZgKXl22MrMJuOTc5MtVeNpN2J218LJ1FazT/
	DD9hHHiQvTvkB1alJdKy5u/+ZJT09q1QLfrkW39x09LSXk9qSg9apGSiM1p4LSzi4f7h6tZZPYj
	mjPAptB3a39FgyoUfaJzTWhbQZRn23qSVO6q2xnTZAgBmel/6UaW/ky9GdQd86t3JgRyNsTlI2s
	X4ifd0A8V1wswqsDCoCBEJapjyfOKtPDQxd0jxmIZGQMvfozO6VnTpLP22bnF6FG44BUdBx3rJp
	pInVaQhuVKxWAk2Ttc4zSfXNlXQIyg=
X-Received: by 2002:a05:6820:1794:b0:65f:27dd:f565 with SMTP id 006d021491bc7-662caaefbddmr1770681eaf.22.1769190979584;
        Fri, 23 Jan 2026 09:56:19 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662cb666c45sm1354143eaf.15.2026.01.23.09.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:56:19 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH v2] wifi: ath10k: fix lock protection in ath10k_wmi_event_peer_sta_ps_state_chg()
Date: Fri, 23 Jan 2026 17:56:11 +0000
Message-Id: <20260123175611.767731-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_095621_133132_330D2D9A 
X-CRM114-Status: UNSURE (   9.57  )
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

ath10k_wmi_event_peer_sta_ps_state_chg() uses lockdep_assert_held() to
assert that ar->data_lock should be held by the caller, but neither
ath10k_wmi_10_2_op_rx() nor ath10k_wmi_10_4_op_rx() acquire this lock
before calling this function.

The field arsta->peer_ps_state is documented as protected by
ar->data_lock in core.h, and other accessors (ath10k_peer_ps_state_disable,
ath10k_dbg_sta_read_peer_ps_state) properly acquire this lock.

Add spin_lock_bh()/spin_unlock_bh() around the peer_ps_state update,
and remove the lockdep_assert_held() to be aligned with new locking,
following the pattern used by other WMI event handlers in the driver.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
v2:
 - Remove lockdep_assert_held() as suggested, since
   we are now taking the lock internally.

 drivers/net/wireless/ath/ath10k/wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index b4aad6604d6d..061a2fa8f00f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5289,7 +5289,6 @@ ath10k_wmi_event_peer_sta_ps_state_chg(struct ath10k *ar, struct sk_buff *skb)
 	struct ath10k_sta *arsta;
 	u8 peer_addr[ETH_ALEN];
 
-	lockdep_assert_held(&ar->data_lock);
 
 	ev = (struct wmi_peer_sta_ps_state_chg_event *)skb->data;
 	ether_addr_copy(peer_addr, ev->peer_macaddr.addr);
@@ -5305,7 +5304,9 @@ ath10k_wmi_event_peer_sta_ps_state_chg(struct ath10k *ar, struct sk_buff *skb)
 	}
 
 	arsta = (struct ath10k_sta *)sta->drv_priv;
+	spin_lock_bh(&ar->data_lock);
 	arsta->peer_ps_state = __le32_to_cpu(ev->peer_ps_state);
+	spin_unlock_bh(&ar->data_lock);
 
 exit:
 	rcu_read_unlock();
-- 
2.34.1



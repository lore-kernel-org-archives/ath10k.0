Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0E6C87FCA
	for <ath10k@archiver.kernel.org>; Wed,  6 Aug 2025 07:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+PJ2Y4D5wbasdWs8LHDv5pP2x0H5risjGvi7zm5xR5M=; b=lsRV36m/5+5gDcRgByAOTdfG87
	TYq72uiPwCPp7qlcNfdax2NYxWouQ+piVIP74I1zSQNG2yY70Eseji2ns7kq9sW/U8dWPm7BWLoUy
	5tbJ3ZXb01WS7+ZXScE5v8LAoj3iGSAi4aQz5v8wjNlAL+Sv0P9Qvg4r3BwyB72+y1zuk64nT/s8v
	mn58WGTBK0OvpY4dXnc6lJAu1pmkrsS0SfxT+AeLYoULXvQJadEbF1PKDDTNh9wd/TWyapE/gqYA5
	SC82vDySyxlwYKwCAOAIIyUJ43hUuTrLDJUL+gY7tHq4FqRB4pKMQBhaRgVW3/3YGj29DyOMmhefD
	0l+7RpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYDh-0000000ETYd-1rv9;
	Wed, 06 Aug 2025 07:05:53 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujY8G-0000000ESYa-1o5q
	for ath10k@lists.infradead.org;
	Wed, 06 Aug 2025 07:00:17 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2429d9d3755so7089275ad.3
        for <ath10k@lists.infradead.org>; Wed, 06 Aug 2025 00:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754463615; x=1755068415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+PJ2Y4D5wbasdWs8LHDv5pP2x0H5risjGvi7zm5xR5M=;
        b=kRSu52T2kAc5aH4KOSQzFSsaPHzYEbg0f9Ad2SCX9+2iusGYVFrCdtxLGBaw5kkK9c
         tCdYBvKuU2dsPxMW2SKEChC54Hy/4tDHUJ71dt/NIbAxiRdQifOwRevt9Max7xAiwpUd
         btMiKXHEhlQ0cK6YwepQ/w5bcTs61Ud+hgBiRXNIP6aIihLsRsK98PbvnVrtUhyyyz6v
         qXRxxLImlsAvKTgXebasfyT6o/XHKa0OyHV21uCaU3f4t5vrwoB/38d10s1t6ERjPNMY
         fpOwL40qp3Nv43aSxD1JrTNJTkhI5Geg97dvPIJfS1rMiJqTvnDT0ff09XIOv/1zqG/y
         SR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754463615; x=1755068415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PJ2Y4D5wbasdWs8LHDv5pP2x0H5risjGvi7zm5xR5M=;
        b=MDDKtWaT65zh/VhpaOZYVaB7YOFenvtJRlwpH0NKVzhvjPhTnyG7p+iQn9Mg2na3Mi
         Drk3jPNKOzmmaOxilfrRk+oZacnaAM6UwZ2tTeoc9nPkTHG4ieqdRLFxkws+qNtwBZ3A
         bV7UfiniL0IpbbIxGEZSiC/5aUD5KpTGYkNpgeacH6KYbpaLSUk62tePMXxk4lxCZMob
         VAsEGezCuOeJLeQEZwV0p2vcNzdUd5TXbBI7DnEQf2DaG1AVIIFLO3zQ+3u6ADKZU2y1
         LNuVbL2UmKhx0hm/GyiD6EJDcDzE43Tqn7V6q9jvbjQx0BsEzmrPam2BDae7Z+FC7X2l
         W7sQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8z/zjHUp9yq0Gs+2qF4tP+whqlztfuJwnxgYmOH8irhScz2wtB0sE+ZdZpDvastl5guRPvFY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYWFNkNOwbVuiiXMKKGbh48AnHcL3Gfrr9CauYwnFjQYk/lIwJ
	iIcelG/eRgiCTcA6+i4LMnxXN1jXQPWV/9UibqZr6wGHTZ4IFzpY0vt81nSzxw5K
X-Gm-Gg: ASbGnctwJz+wna/UKyAUPt7FCqtrF7rtOINcYxJ4FRJFDmQMD5zs9am0EWi0igB+0Ca
	8UhELcCWWk95LsXonfbKitInbfa618T7iLJ8j9bev7TQoSS24a23lXthO7JmFWNGsGm1WUEKXz9
	4SkVDZC/mBin7fPJ2Yq2P66j6NfydnAv0ATMFkq23qFJCNx0Ymbyop0xGKsXPZyZLpvRQKnq3kv
	xWvldgMW8HnerkcWLu/u9f9PIKQgxzXZa1XqG3AApdc6lEFdRCDzz9k5CL88MwdFSlKCenftZZp
	5z1u5+JB8P+AbIoD5Hkk5bDGuxGFavAJbzAonCnPdf20xRNQ2IaP7mTBvKmInBCAO02wlv41aMK
	H3CEc9TAORl51P2kVeQwg3x66XH0pz0Hc4AizmCDvTbTHpcu39N8YP1w/5NeWRUcq6U8qaNU=
X-Google-Smtp-Source: AGHT+IGSiEGveSXvbNV7nv1GqbabWBisxgG67FjmM9mmfQlGUUDu3fktEJqByYD62CtQBDJOH43LEg==
X-Received: by 2002:a17:902:c94b:b0:240:22af:91c7 with SMTP id d9443c01a7336-2429ee84360mr21550685ad.14.1754463614823;
        Wed, 06 Aug 2025 00:00:14 -0700 (PDT)
Received: from NT123328-PC02.ZyXEL.com (114-33-191-187.hinet-ip.hinet.net. [114.33.191.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f36311sm18692998a91.34.2025.08.06.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 00:00:14 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [RFC PATCH] wifi: ath10k: support flush_sta method
Date: Wed,  6 Aug 2025 15:00:05 +0800
Message-ID: <20250806070005.1429-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_000016_471879_3D0930BA 
X-CRM114-Status: GOOD (  12.32  )
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

When a STA is marked as no longer authorized, if the driver doesn't
implement flush_sta(), mac80211 calls ieee80211_flush_queues() to
flush hardware queues to avoid sending unencrypted frames.

This has became a problem for ath10k because ieee80211_flush_queues()
will stop all traffic and call ath10k_flush, which waits until the
whole HW queue is empty. In a busy environment this will trigger a
timeout warning and stalls other STAs.

Fix this by implementing flush_sta method using WMI command to flush
frames of a specific STA.
Flushed frames will be marked as discard in tx complete indication.

ops->flush_sta will be set to NULL if htt.disable_tx_comp is set to
true.

Tested-on: QCA9984 hw1.0 PCI 10.4-3.9.0.2-00157

Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 24dd794e31ea..6959f20334a7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8135,6 +8135,20 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mutex_unlock(&ar->conf_mutex);
 }
 
+static void ath10k_mac_op_flush_sta(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			     struct ieee80211_sta *sta)
+{
+	struct ath10k_vif *arvif = (void *)vif->drv_priv;
+	struct ath10k *ar = hw->priv;
+	u32 bitmap = 0xFFFFFFFF;
+	int ret = 0;
+
+	ret = ath10k_wmi_peer_flush(ar, arvif->vdev_id, sta->addr, bitmap);
+	if (ret)
+		ath10k_warn(ar, "failed to flush sta (sta %pM)\n",
+			    sta->addr);
+}
+
 /* TODO: Implement this function properly
  * For now it is needed to reply to Probe Requests in IBSS mode.
  * Probably we need this information from FW.
@@ -9487,6 +9501,7 @@ static const struct ieee80211_ops ath10k_ops = {
 	.set_rts_threshold		= ath10k_set_rts_threshold,
 	.set_frag_threshold		= ath10k_mac_op_set_frag_threshold,
 	.flush				= ath10k_flush,
+	.flush_sta			= ath10k_mac_op_flush_sta,
 	.tx_last_beacon			= ath10k_tx_last_beacon,
 	.set_antenna			= ath10k_set_antenna,
 	.get_antenna			= ath10k_get_antenna,
@@ -10294,6 +10309,9 @@ int ath10k_mac_register(struct ath10k *ar)
 	if (!ar->hw_params.hw_ops->set_coverage_class)
 		ar->ops->set_coverage_class = NULL;
 
+	if (ar->htt.disable_tx_comp)
+		ar->ops->flush_sta = NULL;
+
 	ret = ath_regd_init(&ar->ath_common.regulatory, ar->hw->wiphy,
 			    ath10k_reg_notifier);
 	if (ret) {
-- 
2.50.1



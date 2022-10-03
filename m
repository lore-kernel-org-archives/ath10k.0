Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090B6C433FE
	for <ath10k@archiver.kernel.org>; Mon,  3 Oct 2022 09:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nMNvR4El+PpF0nGiUV3//Vw5ZYyo9ytYp8UuLrE7Ndo=; b=QyKt+yUwalGpt/
	sCudPbErqjnSg44xvg3UAj/ynyWGQR511kk0z1oJQ3l5AvzpE6TrdI1VmUfwRjefbIeNGtBdbgj+K
	A/828RVPrcG2dq0QgfhwHigdqtNhgi16di0PZCmoDfNmpmkbGb1lW3MO7X2WPMySHkqN0oA1csZ/t
	ZJmwuxYZPfokEd2G58v0WdMAutMdu4rwJXlMyY2zg73NAG307WpNbK4APqtHsso29JEk+Dm6Sccdh
	mKD5x2mqmG1s4kk4OYK8snqG1jLFaB62ytMn5J4XWfF/WXk8aEUQmlAgAngo+D5C0D/DAUu0vp30a
	zYA0EKRbTmWs5gdSCjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofHV5-004xmI-4m; Mon, 03 Oct 2022 09:12:35 +0000
Received: from forward102j.mail.yandex.net ([5.45.198.243])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofHV1-004xdC-Qf
	for ath10k@lists.infradead.org; Mon, 03 Oct 2022 09:12:33 +0000
Received: from myt6-efff10c3476a.qloud-c.yandex.net (myt6-efff10c3476a.qloud-c.yandex.net [IPv6:2a02:6b8:c12:13a3:0:640:efff:10c3])
	by forward102j.mail.yandex.net (Yandex) with ESMTP id 3FA244BE8DF0;
	Mon,  3 Oct 2022 12:12:23 +0300 (MSK)
Received: by myt6-efff10c3476a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 0vVcFmtQu1-CLhOiAOp;
	Mon, 03 Oct 2022 12:12:22 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1664788342;
	bh=SNMppGXILPRmAUGOgbtHH6mka3pq7302+CIsjfv+mvU=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=j/8XpG/vRJ95g7cR8cjmCTuWByl5baHB+IvPMFdyNoGKi0RQvsKRyuux/SOyt4x32
	 4n6/2gVSNBb0fGNHqwidEv54SW8fN6kWRfbEC4tn4qEN34jMYZM7tmpz9gdjFzhOro
	 2uSlZnyJIgRf3TyFmSr0KQ1wFgYXQBYZ1vujIEWc=
Authentication-Results: myt6-efff10c3476a.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Peter Kosyh <pkosyh@yandex.ru>
To: Kalle Valo <kvalo@kernel.org>
Cc: Peter Kosyh <pkosyh@yandex.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ath10k: Check return value of ath10k_get_arvif in ath10k_wmi_event_tdls_peer
Date: Mon,  3 Oct 2022 12:12:17 +0300
Message-Id: <20221003091217.322598-1-pkosyh@yandex.ru>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_021232_088189_1962EAFB 
X-CRM114-Status: GOOD (  10.09  )
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

Return value of a function 'ath10k_get_arvif' is dereferenced without
checking for null in ath10k_wmi_event_tdls_peer, but it is usually checked
for this function.

Make ath10k_wmi_event_tdls_peer do check retval of ath10k_get_arvif.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Peter Kosyh <pkosyh@yandex.ru>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 876410a47d1d..1f2c37c642ff 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -585,6 +585,11 @@ static void ath10k_wmi_event_tdls_peer(struct ath10k *ar, struct sk_buff *skb)
 			goto exit;
 		}
 		arvif = ath10k_get_arvif(ar, __le32_to_cpu(ev->vdev_id));
+		if (!arvif) {
+			ath10k_warn(ar, "no vif for vdev_id %d found\n",
+				__le32_to_cpu(ev->vdev_id));
+			goto exit;
+		}
 		ieee80211_tdls_oper_request(
 					arvif->vif, station->addr,
 					NL80211_TDLS_TEARDOWN,
-- 
2.37.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

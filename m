Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0328D2AB3F
	for <ath10k@archiver.kernel.org>; Tue, 29 Oct 2024 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6r8k08nfNU0BjonzWGfRlb9unupSG36bdp5/08Z5bcw=; b=DBxoyNtidmpZWlPgfTRDUKyzJL
	rJtAuTVExMGXZeyHq0HVN07uMLz+luSH7oBvc3rV/WQ35piVvrwoKwMIW7eKuduqM9wGYIWOSiMzH
	pJkBFQa4aVZzxPGPtDZrrBnqIn08DURWTQSZVjEuBX+TZ8ejoNRCEkciSqruZcNt3lms7YqpUd+TO
	/REW0ciR804XPKxJuGh18097UNAUPGbkrRH4jrJ8eLKy8LNxZ2DrmSdmy8Z7OKs9cknZl3VVvNArY
	iUgxfT5X8hPz7v2OvHW1UpmfX5AI75HA8Yu2wzA2euydUy0sGo946iB0FLZRthR8aakWxeQeax5G4
	6VsWchFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mIH-0000000EZp4-3s0o;
	Tue, 29 Oct 2024 13:29:57 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lpZ-0000000EUqF-32ov
	for ath10k@lists.infradead.org;
	Tue, 29 Oct 2024 13:00:19 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539f7606199so5833990e87.0
        for <ath10k@lists.infradead.org>; Tue, 29 Oct 2024 06:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730206816; x=1730811616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6r8k08nfNU0BjonzWGfRlb9unupSG36bdp5/08Z5bcw=;
        b=c1CfzXEsPLIalAp04iVUqEkpbKaQiGJSXN86Af6jHHZuPKcUVH5wq+QFJB8/fZSiwV
         mr/R1lUEwY+B1TVRceBDElVPDkj4k4gqOG1r7YfTZum+0riOIJ4eJ0gPHLz1UaFn3ekN
         TiH0eWxY13tqkUsiLzbH+qmswi7tvLqCQlNc44U/UF3AKr3+5VqGQLt1D7p3Rt80B19k
         T54tMwrD0oD7LaKsx9Yv+3bTKxFePfxi/mVKb3KpQASbLKX0V/qGUcHSl44Ti96cnIuv
         33zbhsGv2jORwmmz9Z54LXigiixILN283eT3V5gf/AMaCjIyqKn1EapdzDc2U3VO3AKF
         kf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730206816; x=1730811616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6r8k08nfNU0BjonzWGfRlb9unupSG36bdp5/08Z5bcw=;
        b=S9zR8MGZNRgyhL0UsqeqMjw+cbhWUGC9RJTK7f91/1wuo/+qqWljXIXORfhg/mKbat
         /RxS3apYxQTJnnPEgv+0Db82Efl1M29IpAzWlcjGuRdff2Z0NOJKjKVj2MFyPYvjKEPh
         xCh2gjgz8C1ExeZnVre9qc2DD4osagtovfGcfXqIL15vYRb+cuFW50lTrCOREkn6tkVE
         nN774UBo7lLw+HPbxDWNo9kDrTyLY9oP++E0q47jnjEfKOgo2NkRm3MXgZhktGx37WGd
         0orv7Ug18IsHAWNbdg6Z1CMNVh6UnD2bTJPkueGdpuTwSnJAm/R3jRlkaiPofqZHxCz2
         E8jA==
X-Forwarded-Encrypted: i=1; AJvYcCUrB+ekn1vF3kMzx99OJ0hctE77Wzz7ZEtc256xBCz/vB3WeTwvTS8DG9sxAEe9EtS0XEm4BCM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCPiqTpyqvV/XsvvSCyrC9hryuKspqFirn0oQZDiGCiKsDoJT5
	l7v07+eL7KNUVssqkOTNzo3FXEhiw36vlizCXysgnpZIexFx/Lis
X-Google-Smtp-Source: AGHT+IH7BxiE2+elBEtNece5JanndPqtr2bn5pcJZE8uhcoVy7E9tVpE/96YpKV0V8tgZQkx03HkDQ==
X-Received: by 2002:a05:6512:3510:b0:53b:4899:9be9 with SMTP id 2adb3069b0e04-53b48999ec1mr969614e87.59.1730206815637;
        Tue, 29 Oct 2024 06:00:15 -0700 (PDT)
Received: from localhost.localdomain ([178.219.169.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b48999d30sm214911e87.115.2024.10.29.06.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 06:00:14 -0700 (PDT)
From: Dmitry Kandybka <d.kandybka@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Kandybka <d.kandybka@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Peter Kosyh <pkosyh@yandex.ru>,
	Kalle Valo <quic_kvalo@quicinc.com>
Subject: [PATCH 5.10/5.15/6.1 1/1] wifi: ath10k: Check return value of ath10k_get_arvif() in ath10k_wmi_event_tdls_peer()
Date: Tue, 29 Oct 2024 15:59:25 +0300
Message-ID: <20241029125929.288059-2-d.kandybka@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241029125929.288059-1-d.kandybka@gmail.com>
References: <20241029125929.288059-1-d.kandybka@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_060017_800018_9792E821 
X-CRM114-Status: GOOD (  10.07  )
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

From: Peter Kosyh <pkosyh@yandex.ru>

commit 473118917cc33b98510880458c724bd833653db6 upstream.

Return value of a function ath10k_get_arvif() is dereferenced without
checking for null in ath10k_wmi_event_tdls_peer(), but it is usually checked
for this function.

Make ath10k_wmi_event_tdls_peer() do check retval of ath10k_get_arvif().

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Peter Kosyh <pkosyh@yandex.ru>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20221003091217.322598-1-pkosyh@yandex.ru
Signed-off-by: Dmitry Kandybka <d.kandybka@gmail.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 0eeb74245372..72da02fc68ea 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -584,7 +584,14 @@ static void ath10k_wmi_event_tdls_peer(struct ath10k *ar, struct sk_buff *skb)
 			ath10k_warn(ar, "did not find station from tdls peer event");
 			goto exit;
 		}
+
 		arvif = ath10k_get_arvif(ar, __le32_to_cpu(ev->vdev_id));
+		if (!arvif) {
+			ath10k_warn(ar, "no vif for vdev_id %d found",
+				    __le32_to_cpu(ev->vdev_id));
+			goto exit;
+		}
+
 		ieee80211_tdls_oper_request(
 					arvif->vif, station->addr,
 					NL80211_TDLS_TEARDOWN,
-- 
2.43.5



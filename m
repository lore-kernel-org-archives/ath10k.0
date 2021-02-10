Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA6BC433E0
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 21:21:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD3564E25
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 21:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BD3564E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9gHuF4qCWlySkaFybYCWU1bZORX/H4Ryy3RHokX3dgI=; b=u7EHHhlMCADXeTkMmoiBgIU6I9
	3WBWihT+aVLBOXhywCEh4rwYSSP711k8/1xdbk0a0zUQLcJUHAskPRfrDpAp6NTb00my2K83Rkg3d
	+C0K2lwNpm1iEf7y8anmtbUt7+uJDe/Nzpzq0jpcRg3EhI5RySPXnMca0VxW8zY+CuxIClwA+8JEu
	xoV+7zpGv/G7RicLMoJMTvrtrVtqiE3AOk70Q4Kv0x62wpkc+yfQYQEefIAXuL2fcypIIhX4oKLO/
	PYTo3U94jHDsIcX4uFxmRIZywjWE+vgI9MF1c7NxgudqdB1m0cQ83WnQlgV2XrXEGNKOQ3U0SbcAX
	hayECA+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9wvE-0005ol-3s; Wed, 10 Feb 2021 21:21:16 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9wv9-0005oJ-Nj
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 21:21:13 +0000
Received: by mail-oi1-x234.google.com with SMTP id i3so3736635oif.1
 for <ath10k@lists.infradead.org>; Wed, 10 Feb 2021 13:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ip1AHGKwKY2VNyKo96TDsETMQmOB/EbZSzj9oNoDO2U=;
 b=NWB5+chUooMs3Trh8sFoEbpC18itlf2XkqapW5z3nrQz7shRIGfGWseyQcnnL4V85x
 HEpqNisHFxn8XKsIDQ144kk61XB2k82rqs9qxy63/SOGXYSfKhqht1LTRZJBKORiMt+t
 +sHQua3NFMbahX/45R5RmXGkcX/rKvYPvc5E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ip1AHGKwKY2VNyKo96TDsETMQmOB/EbZSzj9oNoDO2U=;
 b=kfFgyQx0ynyN/C+Z4CJBoYFIv8Oj1Jgy1DP/dzaZtIaI8Ips6n7l4GByL9vIQKDUVS
 LNKE5lg5zU4nN9g8bTIxYDLNDciRk6/Wg2Ezl6A+pEjlLJuXrNe4ORJNwktw6T+x7fGk
 1D6sa0P51xV0hDWh8Z9Kmyu/Ri97ZkSUWsIiIcUtVOemgypyNXAX4d7FIKRNEFBcLRA7
 nFEvHbuH2j8IBgXSPWB9MkCw7RN9L4jCplZ5gWFvGqsAW84pOTxIY4gN8X8vm1U73fwq
 +nNg0jLeL/7FaKE3C7CyLU5Th+KoC+ToNmZA/hN48o82nhRONytWJnN0wmoeauxZ/nDj
 fQpQ==
X-Gm-Message-State: AOAM5322pgr5EqP3ZSexrzO2Ykl+NzWIhYeCkhBH1I0lSFrckVu2URgN
 wz73pstjRF3n9ZlcUGC5TIzbrShZrGBjBA==
X-Google-Smtp-Source: ABdhPJxrT8FYtLTqI2w9XouF8Nl/Ld4dzKncBZAgYE5/OdBRp3ZyZcfZDRKJ9fkokKBDb8panqyRpA==
X-Received: by 2002:aca:af91:: with SMTP id y139mr718825oie.88.1612992069497; 
 Wed, 10 Feb 2021 13:21:09 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id l4sm597454oou.8.2021.02.10.13.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 13:21:09 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH v2] ath10k: hold RCU lock when calling
 ieee80211_find_sta_by_ifaddr()
Date: Wed, 10 Feb 2021 14:21:07 -0700
Message-Id: <20210210212107.40373-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_162112_012395_683513C1 
X-CRM114-Status: GOOD (  11.69  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

ieee80211_find_sta_by_ifaddr() must be called under the RCU lock and
the resulting pointer is only valid under RCU lock as well.

Fix ath10k_wmi_tlv_op_pull_peer_stats_info() to hold RCU lock before it
calls ieee80211_find_sta_by_ifaddr() and release it when the resulting
pointer is no longer needed.

This problem was found while reviewing code to debug RCU warn from
ath10k_wmi_tlv_parse_peer_stats_info().

Link: https://lore.kernel.org/linux-wireless/7230c9e5-2632-b77e-c4f9-10eca557a5bb@linuxfoundation.org/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
Changes since v1:
- v1 also included fix to ath10k_wmi_tlv_parse_peer_stats_info()
  RCU wrn which was already fixed. v2 drops that and fixes just
  ath10k_wmi_event_tdls_peer()
 
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index bfdd017f1405..d97b33f789e4 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -576,13 +576,13 @@ static void ath10k_wmi_event_tdls_peer(struct ath10k *ar, struct sk_buff *skb)
 	case WMI_TDLS_TEARDOWN_REASON_TX:
 	case WMI_TDLS_TEARDOWN_REASON_RSSI:
 	case WMI_TDLS_TEARDOWN_REASON_PTR_TIMEOUT:
+		rcu_read_lock();
 		station = ieee80211_find_sta_by_ifaddr(ar->hw,
 						       ev->peer_macaddr.addr,
 						       NULL);
 		if (!station) {
 			ath10k_warn(ar, "did not find station from tdls peer event");
-			kfree(tb);
-			return;
+			goto exit;
 		}
 		arvif = ath10k_get_arvif(ar, __le32_to_cpu(ev->vdev_id));
 		ieee80211_tdls_oper_request(
@@ -593,6 +593,9 @@ static void ath10k_wmi_event_tdls_peer(struct ath10k *ar, struct sk_buff *skb)
 					);
 		break;
 	}
+
+exit:
+	rcu_read_unlock();
 	kfree(tb);
 }
 
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

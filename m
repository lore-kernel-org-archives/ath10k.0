Return-Path: <SRS0=wRNp=JD=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB6FC433ED
	for <ath10k@archiver.kernel.org>; Tue,  6 Apr 2021 23:03:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8034613A0
	for <ath10k@archiver.kernel.org>; Tue,  6 Apr 2021 23:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8034613A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tfyZtvzL5jYSWXOMorWThadNbwLkBSww9Zv6Hz8isD8=; b=ENb6Ra0UlqWwrjDeaYKT6xbCPT
	mL5FtI0Ft1gw3JiZ+RzcriEr1vk5W4+cNZVAeHfnOGi2+mfZ+su2jmW8gfGWLK+m31sb/cWeDZk19
	lo90Uv2bMriBkn5CuHCwdj7oKhMrLIWHPSOWhAKcmT2A3ciWcwkyXsnw5sRRbCB/bFSenwYm0s29y
	+YLXl/tY9izgRH2k00U3fBkCLfRS+t3ftkamDsKAzdM3hzS0C1/Z2KssboTakWHpDQDw3iiaNtr5K
	Fv+a19URP3Ith2TAmClFWAGaN/rnKPXaZeOJSd9oNTRc9esbaIEbCinXJ554M1Px8dWnMJQgNgH/J
	j3R3klzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTuiW-003Zya-TJ; Tue, 06 Apr 2021 23:02:41 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTuiP-003ZxU-NP
 for ath10k@lists.infradead.org; Tue, 06 Apr 2021 23:02:36 +0000
Received: by mail-io1-xd2a.google.com with SMTP id k25so10392840iob.6
 for <ath10k@lists.infradead.org>; Tue, 06 Apr 2021 16:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rj2YYKWiwju3STdIjVvck7gwFTWKqKlbS/8vOJQzblA=;
 b=LjPAMgX4jEAvs46Pjf+qHRP61100oZ9gBFh8LuXJOqZ/+4s8Zd7eKgheo4sK3oKHxp
 sERChtROH5w8X7WVNvCbc9ajll7IY7lboMEg6i3jClONPUzB2iYndamvcV+rGEXvyM0V
 /w8r4v1KClZJ774YmtCVlMsESIJiTR57hldq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rj2YYKWiwju3STdIjVvck7gwFTWKqKlbS/8vOJQzblA=;
 b=qEHns2gW0iplbjnEM3d2dxYAP0s9Kr6c3x4C/SlAboYXygDIxmkZ3Ql2tYC/47nL6W
 daEmk0soppyEeeSrp7dOZn+JixTT+PfJyDN9E5pzacpCjUKJKefWnyWvOLSssroUEeuO
 tt8FxjBCqSQhOGOJQ0TXT6JVGlAt2vj+I1b6EEI0OZqafauP0ncEHHfgxmyVQOHlu54G
 r4V+hNLMMC4NYbSlcDiMsSSrNNExmt9UtWh+rygVNNa9m7rstKl2dYpcwT7xOELQyj/I
 1Yp+BBHisY4GHlWPU878ia+wale2N43VB/JeF6RytSTjYNU0/1WLu/rwvAoFxNt2V0gY
 S4Tg==
X-Gm-Message-State: AOAM532Ai/V+E6Vl0z5V3kgcPx2fOlXCIaNeaea7Q6f1kbrAXDUtjXvh
 LIA+GiBhke8ACmZRWQfqqNDceA==
X-Google-Smtp-Source: ABdhPJyIpJDK8H7I6Uevy94NM3CzpZpJax71iCAYlQWB3ZvcOLnBm9cU/gL+ZTjIV0swPVXh0JIGew==
X-Received: by 2002:a05:6638:343:: with SMTP id x3mr522607jap.44.1617750151432; 
 Tue, 06 Apr 2021 16:02:31 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id z10sm13186097ilq.38.2021.04.06.16.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 16:02:30 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pavel@ucw.cz
Subject: [PATCH] ath10k: Fix ath10k_wmi_tlv_op_pull_peer_stats_info() unlock
 without lock
Date: Tue,  6 Apr 2021 17:02:28 -0600
Message-Id: <20210406230228.31301-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_000234_072593_BE13D4DB 
X-CRM114-Status: UNSURE (   8.62  )
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

ath10k_wmi_tlv_op_pull_peer_stats_info() could try to unlock RCU lock
winthout locking it first when peer reason doesn't match the valid
cases for this function.

Add a default case to return without unlocking.

Fixes: 09078368d516 ("ath10k: hold RCU lock when calling ieee80211_find_sta_by_ifaddr()")
Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index d97b33f789e4..7efbe03fbca8 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -592,6 +592,9 @@ static void ath10k_wmi_event_tdls_peer(struct ath10k *ar, struct sk_buff *skb)
 					GFP_ATOMIC
 					);
 		break;
+	default:
+		kfree(tb);
+		return;
 	}
 
 exit:
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

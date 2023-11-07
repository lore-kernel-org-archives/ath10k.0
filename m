Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C55C4332F
	for <ath10k@archiver.kernel.org>; Tue,  7 Nov 2023 12:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1hzKJWIgmHoQ9ZEIAgPmQBQDJkII+LENbD/OCAsS2A=; b=pCPDnkmCdnnaz5
	umltOPrQVsyEO75Kl5zu+GSgg3orQI+IqmzPgkkYHewedtWpkRczLUMsZsJQxdjjyAIdK0mjBtpu6
	68ZVWKkKqffVu1yZkEsd2XTeajgwFtQI709Ixoy2YxLBxLH0WnLz+g330sWCdwhdCou3vd98ObqbK
	E76jfIjXOB4QXyVE5pAH7tP12Fs8J3ECkFs78kVqr434sugkU+nxGjeHlrEd198J5y0T3zPEI4+0J
	qNh6S0mKUP1ODmHcFxeadXMr5/q44nVHi0bviBcE5trZPyAt3V7SU17bs6/Rjvu6llNwi2hQFJ+ls
	H3vKMoxGqhq2DQG4c9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KxW-001RWH-1c;
	Tue, 07 Nov 2023 12:13:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KxT-001RTl-1z
	for ath10k@lists.infradead.org;
	Tue, 07 Nov 2023 12:13:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B2F00B816AD;
	Tue,  7 Nov 2023 12:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235E6C433C8;
	Tue,  7 Nov 2023 12:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699359205;
	bh=VaqDE6fQVZ2X6Is7bxsXHIppiyotbmLorYPzvQNc/tw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EeaxGuaum+vBM/9GcUJ9DtW1NsvDvAZEUAR+vAz3mI+LrH5IhGyDCyWtyMbOVffRn
	 0e6tifR2Yzut0rSDKhWkK2jBYon2zkF/CBjTbOrcKEvOBpAjI/3EIPFWmR9rOS7yNt
	 sdm59poOVH+qhuptM1/UFVT4mA2itofq8XOhEbNmEpD780ymM+eN8oq0B274GOJ0ef
	 zm1n2S6vhXEeazjOuetRfNZ2zX9X4FyKN/tIOr5lxLyaW04DM6v1FXQK0nMBklTjMD
	 hokOjOkaPFrSjhrO1Rrac342xS0iw2Ri7XqJuPYHwH1GU/3M31R5mjoEggX8083VI6
	 MrgJB9XfydHjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Antipov <dmantipov@yandex.ru>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 4.19 3/7] wifi: ath10k: fix clang-specific fortify warning
Date: Tue,  7 Nov 2023 07:13:11 -0500
Message-ID: <20231107121318.3759058-3-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107121318.3759058-1-sashal@kernel.org>
References: <20231107121318.3759058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_041327_956475_DCCF0357 
X-CRM114-Status: GOOD (  12.67  )
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

From: Dmitry Antipov <dmantipov@yandex.ru>

[ Upstream commit cb4c132ebfeac5962f7258ffc831caa0c4dada1a ]

When compiling with clang 16.0.6 and CONFIG_FORTIFY_SOURCE=y, I've
noticed the following (somewhat confusing due to absence of an actual
source code location):

In file included from drivers/net/wireless/ath/ath10k/debug.c:8:
In file included from ./include/linux/module.h:13:
In file included from ./include/linux/stat.h:19:
In file included from ./include/linux/time.h:60:
In file included from ./include/linux/time32.h:13:
In file included from ./include/linux/timex.h:67:
In file included from ./arch/x86/include/asm/timex.h:5:
In file included from ./arch/x86/include/asm/processor.h:23:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:254:
./include/linux/fortify-string.h:592:4: warning: call to '__read_overflow2_field'
declared with 'warning' attribute: detected read beyond size of field (2nd
parameter); maybe use struct_group()? [-Wattribute-warning]
                        __read_overflow2_field(q_size_field, size);

The compiler actually complains on 'ath10k_debug_get_et_strings()' where
fortification logic inteprets call to 'memcpy()' as an attempt to copy
the whole 'ath10k_gstrings_stats' array from it's first member and so
issues an overread warning. This warning may be silenced by passing
an address of the whole array and not the first member to 'memcpy()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230829093652.234537-1-dmantipov@yandex.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 4e980e78ba95c..9586deab5c004 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1146,7 +1146,7 @@ void ath10k_debug_get_et_strings(struct ieee80211_hw *hw,
 				 u32 sset, u8 *data)
 {
 	if (sset == ETH_SS_STATS)
-		memcpy(data, *ath10k_gstrings_stats,
+		memcpy(data, ath10k_gstrings_stats,
 		       sizeof(ath10k_gstrings_stats));
 }
 
-- 
2.42.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

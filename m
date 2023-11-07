Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7007C4332F
	for <ath10k@archiver.kernel.org>; Tue,  7 Nov 2023 12:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0IhAjZQ0sZBszfLdIHeewyDHRzicE8rUgFKgA6Q16k=; b=B6RZUxBl69aoQZ
	9OlisiMZfe4oN0OOGDTAICkAH3XEDFj2nin2u7qtmPfuX43dKFzS1iXi27NzNUJ5fj2mEUOqCNluk
	QIHIWYd4foI8aPXA7fpDbAV7CTkPxbX/NoiQvDgJbJRzwB4jD1lEQp86WQtPn4FIfcwTyWUhD5Mln
	9X1gQBetPFgyJ0tHCUOILil3tYislMf/ujS5cNatbRi/ud3hNFTnHWzGyt44EpSTn5GZDYdmjMX2P
	fD/4HhWNNQLywensNFvWf71ErZlRffGckNgkq5V2649PLt/WnySFxwkN54EhRzOz2BPvJlsTniIuu
	NTOfZH1nKMrP6TQBOp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Krh-001POh-24;
	Tue, 07 Nov 2023 12:07:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Kre-001PMk-16
	for ath10k@lists.infradead.org;
	Tue, 07 Nov 2023 12:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94393611DD;
	Tue,  7 Nov 2023 12:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8ACAC433CB;
	Tue,  7 Nov 2023 12:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699358845;
	bh=PRcKEfrDmfEZMYzlayV0vY7Jb6LNenowCohlfa6ojHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m3hhLqVEZHtlliICXE0HpSs0brlt9Qv/KBFL8aObQF5CiQ94YMnhPFr6V7nUc+NyX
	 VbWL/NPZt7PEtAftqPoQwvGk5jLCzKjdIJdmvGBxQITeYKGy+fdht1jfenDt0Q4mKx
	 mgxxYBsWy5DHQ9xBXFB4gxGwRcnxbde4qjRuuM2ApJnfYQo+ReO6eiVaZUtyjz8YxH
	 bNMDz8Bc2JBrK60tkXE0IXiK/d3wvgGeY31rmuc6U7RSwuYgYUB9a0/eKaj/xsXybj
	 GBWrbnEcSAlKtQQ19NKXMZdNUPwCqHZGP2GVS9sTDE6yN4AD6ZshmPc7WKZm4fB4EJ
	 Yeugg96wHHlSQ==
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
Subject: [PATCH AUTOSEL 6.6 09/31] wifi: ath10k: fix clang-specific fortify warning
Date: Tue,  7 Nov 2023 07:05:56 -0500
Message-ID: <20231107120704.3756327-9-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120704.3756327-1-sashal@kernel.org>
References: <20231107120704.3756327-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_040726_515539_DD65EECB 
X-CRM114-Status: GOOD (  12.57  )
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
index f9518e1c99039..fe89bc61e5317 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1140,7 +1140,7 @@ void ath10k_debug_get_et_strings(struct ieee80211_hw *hw,
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

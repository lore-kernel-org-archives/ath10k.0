Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821A7D6CFC5
	for <ath10k@archiver.kernel.org>; Fri, 23 Jan 2026 04:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7TaN6HO4UpfTa5x1GQ53EAUUeL9sRzG0T0kFV13YYQg=; b=on+3Fe3YxeM6zmAUKjHFsSJQma
	Ir/VHpJfLElHn0pwjEzdfRYvRLGcOBaHkJru1qOXwVQx4lZai1xVQy/d9pnqEMxpcGKpcbvnFN3Cl
	KQttQ+aaxZdKj3mvhHwNUxHV86xRQ5Di4vtYkrDtRhX5CF6PX6/swJvVG311W5eyS3NFtMXhj1shZ
	5rgqR0hEuMap/s+nqpMCxmO4UcqTm0lB0ozMLS1UIRUCX9vzZH3vBF5DJiBrVHdtBHn+MgGNR7qQv
	aJCqmRuM4AkB/tdQEnVKuE6hyLPGR9rGaqadN8YBWYAbuY6hmoGLJCMNtpy6msvatwg0fs8C40vTE
	kMHZv65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj9Fh-00000008DXV-0sPH;
	Fri, 23 Jan 2026 04:58:33 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj9Fd-00000008DX1-1aTZ
	for ath10k@lists.infradead.org;
	Fri, 23 Jan 2026 04:58:30 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6611cab8ca3so618219eaf.3
        for <ath10k@lists.infradead.org>; Thu, 22 Jan 2026 20:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769144307; x=1769749107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TaN6HO4UpfTa5x1GQ53EAUUeL9sRzG0T0kFV13YYQg=;
        b=ctNZ6T2nE4v7GbUdlFm/mF3HogeNpOSPidxS/Q73E0L9rBghepsq+GvMbxKx0Ct5wu
         4545L0YmZMs0bUwlxdbY7PUzD8dzGG7PClP+c8SUD7ctNmMmGBjDQZNfDpovvv8/NJN/
         3Ct3Nze4pyWcQiyLw1beAOxjeF0MWvX6JNmh/sXFjwrghg4Eie4XthquxLSOEYv+1VNH
         +yH2WA6bF+Kv3COuqtEXuH08AsaTO1GPcvf0a/nG7HavjZ4W3NaNLclR3Nlptn5Qt0LS
         KMEnbg49q/QE7gOC0pFuvBmzFdDVNqa2ZajUdC09Gqa+0DLLA4HGOuB7lqqMnj+Dh9Y1
         XIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769144307; x=1769749107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TaN6HO4UpfTa5x1GQ53EAUUeL9sRzG0T0kFV13YYQg=;
        b=RBsztTyalfoumL5CiGJqSVGujmNNbkn/9csYCt7RcOGBfmvHYAJ3FvFfCimXARbPNM
         82laM2wGeoqWs2ZHoBavYgfxGkWr8W1Hl8g5qYZksAe4xz02PQeqC17b1sQVPGJj75mF
         vQU73jgAsb94lqVYAc0036JEJzEaU7koGmQ6+xcRsnBB3B66xdZK9XYoUDIZPwDc65x6
         ExJ7x5nei3qzV2352saIZIxNfopmB6HUyVBfpOtM/XEuhXhgfz/6Ygx5bghyKSGayBwI
         NCGv7CjfSQyBRvzicOYcIC3+8pQUWfWTko+oAWB25zKKWaaT+s5EVtg/6/gjqZeXLPwa
         K+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWRujaFq8b7NKyCbwyGh+49ZNx7JE+2nHM1KPEmlfDqqWGRDYaSw/n0TkAemZpadNoaERxkP+o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/ucZd7MWHaWhQ3KKK6+EjdROsmKfHs0TtgcnCcAoJQ2f/Lwoy
	ZJ2KLb3idL5Y8zTrRqe6TwsNxWtMp7Vfn7EPcoekPLW1v8TlAsla6k+4sqjELSEVSTo=
X-Gm-Gg: AZuq6aJFGwm3KM8ZDsNRD4LNLboJLcqJeryiUimJPlBuJzDOZP03ykpSZW4qTO8dpd2
	I7ZFfTUtY7Ch/C6oSVnTbf18+vu3GX2XT2CbkVn0b8x+CjMQJpC4SkaWuC7Rle4r7d+JYWwxQgK
	1rqy2q1RlvMUywaZ3SAPk1YBqeKtL27p2Ez2D3A/d52lRR8xCZx59yWoLhWe7enaOquOvcgqBXG
	UsbIX8CvKkrU2R35RALB/YbnH09WtfFw1fM088MLZg5A/yIeRi+bPwKs919IV13M8bO7Gs5fUzH
	3jCrnE27l7EZh0h89IH9+7w5637gc1oNLeMXTTjQkx+2Lz4pF5dfLwonk/qT6RzmkNEvOaCzvkW
	H4ivIFIgibQu84MAYUqNIPrOIUpQ8nE6tR0g3t1BFB7Irfu+t8s9W76tOkgOpAbiOhtIsn/IZxm
	3dMWs7PIpaTLEV2fABPDUsSHSNtq3Ti+lPu3yhxbTLGew4rt4jc/Fghye9dm3JjE3i79Ob3CSCu
	5xd7l5d6lwUCB6laSSfEzoVcUeX/jkhk2w23HFJQQ==
X-Received: by 2002:a05:6820:4c17:b0:659:9a49:8f04 with SMTP id 006d021491bc7-662cab0991fmr870166eaf.21.1769144307361;
        Thu, 22 Jan 2026 20:58:27 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662cb662e90sm600579eaf.14.2026.01.22.20.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 20:58:27 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] wifi: ath10k: sdio: add missing lock protection in ath10k_sdio_fw_crashed_dump()
Date: Fri, 23 Jan 2026 04:58:22 +0000
Message-Id: <20260123045822.2221549-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_205829_670904_AFA408CB 
X-CRM114-Status: UNSURE (   7.71  )
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

ath10k_sdio_fw_crashed_dump() calls ath10k_coredump_new() which requires
ar->dump_mutex to be held, as indicated by lockdep_assert_held() in that
function. However, the SDIO implementation does not acquire this lock,
unlike the PCI and SNOC implementations which properly hold the mutex.

Additionally, ar->stats.fw_crash_counter is documented as protected by
ar->data_lock in core.h, but the SDIO implementation modifies it without
holding this spinlock.

Add the missing mutex_lock()/mutex_unlock() around the coredump
operations, and add spin_lock_bh()/spin_unlock_bh() around the
fw_crash_counter increment, following the pattern used in
ath10k_pci_fw_dump_work() and ath10k_snoc_fw_crashed_dump().

Fixes: 3c45f21af84e ("ath10k: sdio: add firmware coredump support")
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index c06d50db40b8..00d0556dafef 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2487,7 +2487,11 @@ void ath10k_sdio_fw_crashed_dump(struct ath10k *ar)
 	if (fast_dump)
 		ath10k_bmi_start(ar);
 
+	mutex_lock(&ar->dump_mutex);
+
+	spin_lock_bh(&ar->data_lock);
 	ar->stats.fw_crash_counter++;
+	spin_unlock_bh(&ar->data_lock);
 
 	ath10k_sdio_disable_intrs(ar);
 
@@ -2505,6 +2509,8 @@ void ath10k_sdio_fw_crashed_dump(struct ath10k *ar)
 
 	ath10k_sdio_enable_intrs(ar);
 
+	mutex_unlock(&ar->dump_mutex);
+
 	ath10k_core_start_recovery(ar);
 }
 
-- 
2.34.1



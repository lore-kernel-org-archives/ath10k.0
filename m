Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A332C433E0
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 03:41:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98BEC64DA8
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 03:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98BEC64DA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BYM/Ula6EQtO4wTWZ/JMMHQ1TDz0VKXRV3bz3G+FDHE=; b=DzhxatEcWfAckTiu0it94Bnq6/
	QxyUOUtc6xmR5U5tf83c4jNdIYFzFPJ7rLRM8EdwfO9NVqKlmVVLe8ccancGHsBxr36s0E9HCR/6x
	Qzy0WpyfrY+TskT3Hxa401yLAR105S6NkDh+P64J2j1H/Ho8B99IpF1/rnDo5PaSNYniFJ9hh8aFZ
	6SF7J5V7ecI7QyItikfkWbAV3/YnZ6lKxALydsO8K3XwgeN0NYEHjWMM/hiR2081XtCEajhivCeaW
	FT0FhXW9nU9TpKKhz5xYbYjJIQqipz5H9JE9VC6wg4u09fm8AGao5klQnCsa8OS9EsO0S9x/jkljE
	uivJVpbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6mYu-0000ig-Qz; Tue, 02 Feb 2021 03:41:08 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6mYs-0000hc-CB
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 03:41:07 +0000
Received: by mail-yb1-xb49.google.com with SMTP id f8so19087795ybc.18
 for <ath10k@lists.infradead.org>; Mon, 01 Feb 2021 19:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=D+oCaSH/egr+du/U15EDzXJujV6XfQaQ8BeRYeS+FOw=;
 b=Z2iGEcqXRzha0hs4uB18on6WXhNOiwH5oIuNWxO7+i9pFgG4yO5+PNFxSpdi2OX1we
 mejdIp3pPbvVGoWEQF+PhFNM6gKtNqSKTclDzgyIr0M4r25ZhZWlrk1+AwDAFFbmK7gd
 5Sr3tHstKgYdbZnTngG8XYBvXNTeToAFoq9H7+dF47qS6NC/pKY5lCR9kYqVNPx2eCKR
 6GMTSRnyu661BY4iIzYCW2+gUWl3J9KBu8REjzX7/kGgVjbwsjGvDQSbpbZ6icivZsMx
 SUT9OD6R9PyTP8VRC3MeM6jLrBUPgeA4KhypXyhaZO51v5/6gh8icG6yyz8pPbBmMGUm
 98fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc:content-transfer-encoding;
 bh=D+oCaSH/egr+du/U15EDzXJujV6XfQaQ8BeRYeS+FOw=;
 b=SmZjX+X93Q22nGB4m9bqHuRdMcNlnaTOzQlcVXAnFsKVX9STFh3mALeOrgbT620M1X
 RCxAT/uQfdnEf4IOtvzr/gXRFJn9mqJ0A0DvGbYb9rODSj1Z38vbaViZgyE6Z+FOnKpO
 G0fNgeUQTWFkJFsclsPohWoiZUQl9LPO7yDnBeWHyrf8dKPJNHHuaBbp/LXIQii/hJoR
 7HpdiLgBYWETJ8zHdt5Cq1Mblk2oeTSpxUVXTmozx9dO2OWQbylyarri3gwXjeVLge4I
 fN3gKrYS0J7qitQleV+XEha+3N9b2+DmIaXMUkOQ1agnOpTxyI5UEwat367EJtvY22x5
 7bHQ==
X-Gm-Message-State: AOAM530PnzOWzKJCV9HLZ8uaL8y+0UcyMKys+q1QGXEH3y/R8WuCLJor
 a29BKdRWmrC4C/etn/j4sb21WKkcqMVFSHH0p+Z28oRyHQuyVjYf3AwxbQ7Vc0L5kLLYp8T7aX/
 RePWU++s8q4282ZzgA3skCbmfBcJlo35SD3JolU+bPmTN8+I8a2eGhuBaIIKDuqJML26NZw==
X-Google-Smtp-Source: ABdhPJw2ETAX1hsONKJlzEjpJMMlOH2itMPuxoZlT4BvLRw3NBtE9/epg4w/92S2E6Cx0SVNqFt2xCUeCq7k
X-Received: from nandos.syd.corp.google.com
 ([2401:fa00:9:14:243a:8f72:7104:7a64])
 (user=amistry job=sendgmr) by 2002:a25:2d43:: with SMTP id
 s3mr14022034ybe.33.1612237262751; Mon, 01 Feb 2021 19:41:02 -0800 (PST)
Date: Tue,  2 Feb 2021 14:40:55 +1100
Message-Id: <20210202144033.1.I9e556f9fb1110d58c31d04a8a1293995fb8bb678@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH] ath10k: Fix lockdep assertion warning in ath10k_sta_statistics
From: Anand K Mistry <amistry@google.com>
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_224106_473320_9FEB9E65 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: Anand K Mistry <amistry@google.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

ath10k_debug_fw_stats_request just be called with conf_mutex held,
otherwise the following warning is seen when lock debugging is enabled:

WARNING: CPU: 0 PID: 793 at drivers/net/wireless/ath/ath10k/debug.c:357 ath10k_debug_fw_stats_request+0x12c/0x133 [ath10k_core]
Modules linked in: snd_hda_codec_hdmi designware_i2s snd_hda_intel snd_intel_dspcfg snd_hda_codec i2c_piix4 snd_hwdep snd_hda_core acpi_als kfifo_buf industrialio snd_soc_max98357a snd_soc_adau7002 snd_soc_acp_da7219mx98357_mach snd_soc_da7219 acp_audio_dma ccm xt_MASQUERADE fuse ath10k_pci ath10k_core lzo_rle ath lzo_compress mac80211 zram cfg80211 r8152 mii joydev
CPU: 0 PID: 793 Comm: wpa_supplicant Tainted: G        W         5.10.9 #5
Hardware name: HP Grunt/Grunt, BIOS Google_Grunt.11031.104.0 09/05/2019
RIP: 0010:ath10k_debug_fw_stats_request+0x12c/0x133 [ath10k_core]
Code: 1e bb a1 ff ff ff 4c 89 ef 48 c7 c6 d3 31 2e c0 89 da 31 c0 e8 bd f8 ff ff 89 d8 eb 02 31 c0 5b 41 5c 41 5d 41 5e 41 5f 5d c3 <0f> 0b e9 04 ff ff ff 0f 1f 44 00 00 55 48 89 e5 41 56 53 48 89 fb
RSP: 0018:ffffb2478099f7d0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff9e432700cce0 RCX: 11c85cfd6b8e3b00
RDX: ffff9e432700cce0 RSI: ffff9e43127c5668 RDI: ffff9e4318deddf0
RBP: ffffb2478099f7f8 R08: 0000000000000002 R09: 00000003fd7068cc
R10: ffffffffc01b2749 R11: ffffffffc029efaf R12: ffff9e432700c000
R13: ffff9e43127c33e0 R14: ffffb2478099f918 R15: ffff9e43127c33e0
FS:  00007f7ea48e2740(0000) GS:ffff9e432aa00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000059aa799ddf38 CR3: 0000000118de2000 CR4: 00000000001506f0
Call Trace:
 ath10k_sta_statistics+0x4d/0x270 [ath10k_core]
 sta_set_sinfo+0x1be/0xaec [mac80211]
 ieee80211_get_station+0x58/0x76 [mac80211]
 rdev_get_station+0xf1/0x11e [cfg80211]
 nl80211_get_station+0x7f/0x146 [cfg80211]
 genl_rcv_msg+0x32e/0x35e
 ? nl80211_stop_ap+0x19/0x19 [cfg80211]
 ? nl80211_get_station+0x146/0x146 [cfg80211]
 ? genl_rcv+0x19/0x36
 ? genl_rcv+0x36/0x36
 netlink_rcv_skb+0x89/0xfb
 genl_rcv+0x28/0x36
 netlink_unicast+0x169/0x23b
 netlink_sendmsg+0x38a/0x402
 sock_sendmsg+0x72/0x76
 ____sys_sendmsg+0x153/0x1cc
 ? copy_msghdr_from_user+0x5d/0x85
 ___sys_sendmsg+0x7c/0xb5
 ? lock_acquire+0x181/0x23d
 ? syscall_trace_enter+0x15e/0x160
 ? find_held_lock+0x3d/0xb2
 ? syscall_trace_enter+0x15e/0x160
 ? sched_clock_cpu+0x15/0xc6
 __sys_sendmsg+0x62/0x9a
 do_syscall_64+0x43/0x55
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Fixes: 4913e675630e ("ath10k: enable rx duration report default for wmi tlv")

Signed-off-by: Anand K Mistry <amistry@google.com>
---

 drivers/net/wireless/ath/ath10k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7d98250380ec..e815aab412d7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -9117,7 +9117,9 @@ static void ath10k_sta_statistics(struct ieee80211_hw *hw,
 	if (!ath10k_peer_stats_enabled(ar))
 		return;
 
+	mutex_lock(&ar->conf_mutex);
 	ath10k_debug_fw_stats_request(ar);
+	mutex_unlock(&ar->conf_mutex);
 
 	sinfo->rx_duration = arsta->rx_duration;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

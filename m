Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06AAC433DB
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 02:46:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 646E564DBA
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 02:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 646E564DBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/C6exl+jROm5kwpOPkQO4Egjf+ythMPciP9kioUwPOg=; b=CvTkizHSSl44Jcu/2blxTRrT1A
	ak5IGL6CyGIe82IBdaEF8iLtDwyHbrEo6SwzshUKmwun2QGNE6v4+HwHUMjO46ZaiP2Ao33QERyfn
	KbdbDwQktdYCp/Zqj/8yQY/AP406JwksT7wX8biXOHtAFL5BolmEgWtbQrsAxRFlh9uEmpMma8DEx
	A5xC1EqlzJ0Sv7ZS57fWM3r480e+nWk4lXxoZ7y9cO0m2Qx5M3qTqgV/0sas7y0UUXCco3rtH9Ha1
	alSRdEimKqxPLH0Ci8oz5Rqrh9ymcKUHCqFkN9cgFwCiN80KBk4/q8TrtEY9l19Z5Sa9+xEVnOy4H
	1WHOXw1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6lgz-0007LO-26; Tue, 02 Feb 2021 02:45:25 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6lgw-0007L2-Fb
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 02:45:23 +0000
Received: by mail-qk1-x74a.google.com with SMTP id 185so14854779qkl.6
 for <ath10k@lists.infradead.org>; Mon, 01 Feb 2021 18:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=uITZIRq2V6q5qSCUOLhj43gM7pGs59qTkMOHdBiHBX8=;
 b=gY1tDyWFRuA+U5J8SpkhoZAtl/n+BQZ0jU2IUH2scTEb4ip7k5UGLfgxJPpv955Yu3
 y+1YAECTkbOnp8JEoqqhASRyBzzArynhp12Ha0mMBwTAulG7q0SiqsKNpwNOOD1gddaR
 +3NFolkMuHoMwiU2oOe77Kbrf4ORhdry8Tmb87qBN8VFI25Z+ztQOnDjnwsDVyO2XZIa
 PdIu5rPupfsBdnOPTPIxXP4zgFFY4kxAJBU2Ce2cAald0Zko38i4vfzSermB9qxVK4QD
 I7b22E3s2HubXZwNk1x8oq+Mn5mOXth/A352X4mEm6lJfO8xOv7hSA/hBI+c3BsTEsU2
 4NHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=uITZIRq2V6q5qSCUOLhj43gM7pGs59qTkMOHdBiHBX8=;
 b=bZpFTYc8MdwVHQbReWOmreeNj4HnYVU9uy8EDakpCSZCbRr2n3feMcd7ERsfGB/AZD
 +zkYOxLFYBJwokheY4Jv20XS8RWeu4OaHzhRasj0KSfokE4u2oxS2hX21lF57gcGSv+n
 8zd50JPZ5Qv/XYWd3JaR9ebgRsMmB0xF1sPcKy8zJdv86XymzV6tjoYq6Aeuwm9xZgmN
 BNk9PGbsGCCcf4k7GBur/fX/ty3q3c3gXS04SbuP/sB8UDVLd3sE/nrNYLVlwK1/tC5B
 HvE6qaX+DvXj0KF3QUa7ox7jr8TYjgPLsUWjF57CpsMSopAICQZQ4uJiLxQ/Ov2M+Dox
 hKJA==
X-Gm-Message-State: AOAM530xHr5AhKJd/k0W6CYEvY1f7TPhZb2GrPdH3Jo3hJdxU2bG8+Yn
 XAuKtAgiNbc+L3Ue1yElAiJqoCL0oPiYrxZvZZFQlJtE1VczpW9liGZ8OdoHz4gwQpwSu4RuFGn
 MCBA7Mc+RFcVFnIt+k56WPoiFjnyAjjqpCaFR/IiyGj/Sx4o1v8954ZDLmEB66Bam33+BNg==
X-Google-Smtp-Source: ABdhPJydLxnjH3haxCI9g+KQinhtQamnimB5PgiU1eLyouVWd1b/ZdMwmDL8bJ4OYtbFmYyMYlgLc/uVW6WI
X-Received: from nandos.syd.corp.google.com
 ([2401:fa00:9:14:243a:8f72:7104:7a64])
 (user=amistry job=sendgmr) by 2002:a0c:b912:: with SMTP id
 u18mr7724925qvf.2.1612233918714; Mon, 01 Feb 2021 18:45:18 -0800 (PST)
Date: Tue,  2 Feb 2021 13:45:09 +1100
Message-Id: <20210202134451.1.I0d2e83c42755671b7143504b62787fd06cd914ed@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH] ath10k: Fix suspicious RCU usage warning in
 ath10k_wmi_tlv_parse_peer_stats_info()
From: Anand K Mistry <amistry@google.com>
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_214522_576741_158D8264 
X-CRM114-Status: GOOD (  12.21  )
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

The ieee80211_find_sta_by_ifaddr call in
ath10k_wmi_tlv_parse_peer_stats_info must be called while holding the
RCU read lock. Otherwise, the following warning will be seen when RCU
usage checking is enabled:

=============================
WARNING: suspicious RCU usage
5.10.3 #8 Tainted: G        W
-----------------------------
include/linux/rhashtable.h:594 suspicious rcu_dereference_check() usage!

other info that might help us debug this:

rcu_scheduler_active = 2, debug_locks = 1
no locks held by ksoftirqd/1/16.

stack backtrace:
CPU: 1 PID: 16 Comm: ksoftirqd/1 Tainted: G        W         5.10.3 #8
Hardware name: HP Grunt/Grunt, BIOS Google_Grunt.11031.104.0 09/05/2019
Call Trace:
 dump_stack+0xab/0x115
 sta_info_hash_lookup+0x71/0x1e9 [mac80211]
 ? lock_is_held_type+0xe6/0x12f
 ? __kasan_kmalloc+0xfb/0x112
 ieee80211_find_sta_by_ifaddr+0x12/0x61 [mac80211]
 ath10k_wmi_tlv_parse_peer_stats_info+0xbd/0x10b [ath10k_core]
 ath10k_wmi_tlv_iter+0x8b/0x1a1 [ath10k_core]
 ? ath10k_wmi_tlv_iter+0x1a1/0x1a1 [ath10k_core]
 ath10k_wmi_tlv_event_peer_stats_info+0x103/0x13b [ath10k_core]
 ath10k_wmi_tlv_op_rx+0x722/0x80d [ath10k_core]
 ath10k_htc_rx_completion_handler+0x16e/0x1d7 [ath10k_core]
 ath10k_pci_process_rx_cb+0x116/0x22c [ath10k_pci]
 ? ath10k_htc_process_trailer+0x332/0x332 [ath10k_core]
 ? _raw_spin_unlock_irqrestore+0x34/0x61
 ? lockdep_hardirqs_on+0x8e/0x12e
 ath10k_ce_per_engine_service+0x55/0x74 [ath10k_core]
 ath10k_ce_per_engine_service_any+0x76/0x84 [ath10k_core]
 ath10k_pci_napi_poll+0x49/0x141 [ath10k_pci]
 net_rx_action+0x11a/0x347
 __do_softirq+0x2d3/0x539
 run_ksoftirqd+0x4b/0x86
 smpboot_thread_fn+0x1d0/0x2ab
 ? cpu_report_death+0x7f/0x7f
 kthread+0x189/0x191
 ? cpu_report_death+0x7f/0x7f
 ? kthread_blkcg+0x31/0x31
 ret_from_fork+0x22/0x30

Fixes: 0f7cb26830a6e ("ath10k: add rx bitrate report for SDIO")

Signed-off-by: Anand K Mistry <amistry@google.com>
---

 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 7b5834157fe5..e6135795719a 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -240,8 +240,10 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar, u16 tag, u16
 		   __le32_to_cpu(stat->last_tx_rate_code),
 		   __le32_to_cpu(stat->last_tx_bitrate_kbps));
 
+	rcu_read_lock();
 	sta = ieee80211_find_sta_by_ifaddr(ar->hw, stat->peer_macaddr.addr, NULL);
 	if (!sta) {
+		rcu_read_unlock();
 		ath10k_warn(ar, "not found station for peer stats\n");
 		return -EINVAL;
 	}
@@ -251,6 +253,7 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar, u16 tag, u16
 	arsta->rx_bitrate_kbps = __le32_to_cpu(stat->last_rx_bitrate_kbps);
 	arsta->tx_rate_code = __le32_to_cpu(stat->last_tx_rate_code);
 	arsta->tx_bitrate_kbps = __le32_to_cpu(stat->last_tx_bitrate_kbps);
+	rcu_read_unlock();
 
 	return 0;
 }
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

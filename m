Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D80FC433DB
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 08:14:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFAD764E42
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 08:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFAD764E42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kx55rxhjp4Fl24JOBTq4hFlmkdh5siC7WTsW6irHDwg=; b=otRKx/z3ju7B7EOTzP/JKAyO/
	cUAvdmJh++FbVpGEqPiyDu/ib5GvJv1EMys47dOKX8qn9uDlIPLSV0c0qajPIgT02rpXQlTUG+ROD
	TMrjXJuniLOpyq7KCsNXMEoS33AC4ixfdWYa2yWUTgtEHdVgHMCJbwbEJ/HZCo65lIHpmtm7EXRq5
	vzQGbEOHXzdvf5kn6wdUmsXdGy05rPEBLbdeN5JouJWlajL7wODHOVcVVL8mjziPCAcCPnGz1eBrT
	UDebsIiPFnmrYBAeSKu4lfDzOYkbGmmIKvmDsyAhtomsfUIjov+vUpf7uc9rK1aQiHFHYWP8fEeuJ
	CTlpi+Vxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9kcw-0002gJ-3s; Wed, 10 Feb 2021 08:13:34 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9kco-0002dN-BM
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 08:13:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612944808; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=IRzUsolklWJ8q/rjQMpMiYe3i/nQFmXbBRtsW+ljWFg=;
 b=jqzKT/m/1iPZad7F3EPny1OILpKFniA6zemRiGEYAgsD3f3G+KzLfJ7cxWIkA20zOrIlWF6e
 nXbaBSQESKEnIE5wIPrKrAzQhNNl9D+XG1KN77Gofc+UGf805SUlZbr0H1paL9RaqdSa+GBi
 E1v2pub/WoYLauN1eZADgkUOpyY=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 602395a081f6c45dce07a8a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 08:13:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CD3FBC433C6; Wed, 10 Feb 2021 08:13:19 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 78FE0C433CA;
 Wed, 10 Feb 2021 08:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78FE0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] ath10k: fix WARNING: suspicious RCU usage
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <23a1333dfb0367cc69e7177a2e373df0b6d42980.1612915444.git.skhan@linuxfoundation.org>
References: <23a1333dfb0367cc69e7177a2e373df0b6d42980.1612915444.git.skhan@linuxfoundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210210081319.CD3FBC433C6@smtp.codeaurora.org>
Date: Wed, 10 Feb 2021 08:13:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_031328_508547_D4DF603F 
X-CRM114-Status: GOOD (  12.68  )
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
 Shuah Khan <skhan@linuxfoundation.org>, kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Shuah Khan <skhan@linuxfoundation.org> wrote:

> ieee80211_find_sta_by_ifaddr() must be called under the RCU lock and
> the resulting pointer is only valid under RCU lock as well.
> 
> Fix ath10k_wmi_tlv_parse_peer_stats_info() to hold RCU lock before it
> calls ieee80211_find_sta_by_ifaddr() and release it when the resulting
> pointer is no longer needed. The log below shows the problem.
> 
> While at it, fix ath10k_wmi_tlv_op_pull_peer_stats_info() to do the same.
> 
> =============================
> WARNING: suspicious RCU usage
> 5.11.0-rc7+ #20 Tainted: G        W
> -----------------------------
> include/linux/rhashtable.h:594 suspicious rcu_dereference_check() usage!
> other info that might help us debug this:
>                rcu_scheduler_active = 2, debug_locks = 1
> no locks held by ksoftirqd/5/44.
> 
> stack backtrace:
> CPU: 5 PID: 44 Comm: ksoftirqd/5 Tainted: G        W         5.11.0-rc7+ #20
> Hardware name: LENOVO 10VGCTO1WW/3130, BIOS M1XKT45A 08/21/2019
> Call Trace:
>  dump_stack+0x7d/0x9f
>  lockdep_rcu_suspicious+0xdb/0xe5
>  __rhashtable_lookup+0x1eb/0x260 [mac80211]
>  ieee80211_find_sta_by_ifaddr+0x5b/0xc0 [mac80211]
>  ath10k_wmi_tlv_parse_peer_stats_info+0x3e/0x90 [ath10k_core]
>  ath10k_wmi_tlv_iter+0x6a/0xc0 [ath10k_core]
>  ? ath10k_wmi_tlv_op_pull_mgmt_tx_bundle_compl_ev+0xe0/0xe0 [ath10k_core]
>  ath10k_wmi_tlv_op_rx+0x5da/0xda0 [ath10k_core]
>  ? trace_hardirqs_on+0x54/0xf0
>  ? ath10k_ce_completed_recv_next+0x4e/0x60 [ath10k_core]
>  ath10k_wmi_process_rx+0x1d/0x40 [ath10k_core]
>  ath10k_htc_rx_completion_handler+0x115/0x180 [ath10k_core]
>  ath10k_pci_process_rx_cb+0x149/0x1b0 [ath10k_pci]
>  ? ath10k_htc_process_trailer+0x2d0/0x2d0 [ath10k_core]
>  ? ath10k_pci_sleep.part.0+0x6a/0x80 [ath10k_pci]
>  ath10k_pci_htc_rx_cb+0x15/0x20 [ath10k_pci]
>  ath10k_ce_per_engine_service+0x61/0x80 [ath10k_core]
>  ath10k_ce_per_engine_service_any+0x7d/0xa0 [ath10k_core]
>  ath10k_pci_napi_poll+0x48/0x120 [ath10k_pci]
>  net_rx_action+0x136/0x500
>  __do_softirq+0xc6/0x459
>  ? smpboot_thread_fn+0x2b/0x1f0
>  run_ksoftirqd+0x2b/0x60
>  smpboot_thread_fn+0x116/0x1f0
>  kthread+0x14b/0x170
>  ? smpboot_register_percpu_thread+0xe0/0xe0
>  ? __kthread_bind_mask+0x70/0x70
>  ret_from_fork+0x22/0x30
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

Unlucky timing also on this one, it conflicts with a patch I applied yesterday:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=2615e3cdbd9c0e864f5906279c952a309871d225

Can you redo the patch to only change ath10k_wmi_event_tdls_peer()?

error: patch failed: drivers/net/wireless/ath/ath10k/wmi-tlv.c:240
error: drivers/net/wireless/ath/ath10k/wmi-tlv.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/23a1333dfb0367cc69e7177a2e373df0b6d42980.1612915444.git.skhan@linuxfoundation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

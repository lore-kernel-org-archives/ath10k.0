Return-Path: <SRS0=gWg/=HL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69216C433DB
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 07:18:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0012A64EC2
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 07:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0012A64EC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HAX01T9a3XLSFih5h9R/bz8HOx9xfA8tl/f7ho1Yugo=; b=HYICeMuecJfmasCmmpX8Lir4w
	5vR/LqueRr7k7cM7tNMUBk+yzqoGuFmmb80TIu+TMZr8t4IJYKbARMDn1eHm4Eik10QInX0owdOs/
	NybjgGJ0tUfE2TdQGlPTUtJ12D19ArFzOD3iVnq/vQt+bcV+IMN8KyOFgCFro25QZHBKezjVlCnuj
	zp1ZOw/2lVPe1fZAH94qL5JiLhs1M2BwZ+tR6kpp6vYf57jWRr3efWB8TWlAOiNxwetcGKqK9fe/K
	b+ciLs9iqXGdalYeXsHfNCxDMWUtNtpqtukV1CJsh7Nja/99jqrO0cHaeWpudXgylbtqjAHQRuaQj
	A6bwEPCvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9NHY-00022Z-3I; Tue, 09 Feb 2021 07:17:56 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9NHS-00020V-E5
 for ath10k@lists.infradead.org; Tue, 09 Feb 2021 07:17:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612855063; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=mK5kpgAF6AMLuw5RtubhdeZQP/uo/1+WEDAN+fkDY9I=;
 b=iobn0ivuvc+2tqdZgxWNQuF2vHlU7ZKWJsesefKEbq/lsFTy/IM7JvF+TnQrgq+aUUpBcu40
 INwNCcXIxTk+8DhNCeSEvt4HzhuehrJPawuLp5LMl3244oCSkinwSyB338CwphIv+MFXPj2R
 arF9XVRpINl+x77EXVm0qJetN7A=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60223716d5a7a3baae60542d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 07:17:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E75BAC43461; Tue,  9 Feb 2021 07:17:41 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CC4ACC433CA;
 Tue,  9 Feb 2021 07:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CC4ACC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix suspicious RCU usage warning in
 ath10k_wmi_tlv_parse_peer_stats_info()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210202134451.1.I0d2e83c42755671b7143504b62787fd06cd914ed@changeid>
References: <20210202134451.1.I0d2e83c42755671b7143504b62787fd06cd914ed@changeid>
To: Anand K Mistry <amistry@google.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210209071741.E75BAC43461@smtp.codeaurora.org>
Date: Tue,  9 Feb 2021 07:17:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_021750_679574_F7B212F4 
X-CRM114-Status: GOOD (  11.25  )
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
 ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Anand K Mistry <amistry@google.com> wrote:

> The ieee80211_find_sta_by_ifaddr call in
> ath10k_wmi_tlv_parse_peer_stats_info must be called while holding the
> RCU read lock. Otherwise, the following warning will be seen when RCU
> usage checking is enabled:
> 
> =============================
> WARNING: suspicious RCU usage
> 5.10.3 #8 Tainted: G        W
> -----------------------------
> include/linux/rhashtable.h:594 suspicious rcu_dereference_check() usage!
> 
> other info that might help us debug this:
> 
> rcu_scheduler_active = 2, debug_locks = 1
> no locks held by ksoftirqd/1/16.
> 
> stack backtrace:
> CPU: 1 PID: 16 Comm: ksoftirqd/1 Tainted: G        W         5.10.3 #8
> Hardware name: HP Grunt/Grunt, BIOS Google_Grunt.11031.104.0 09/05/2019
> Call Trace:
>  dump_stack+0xab/0x115
>  sta_info_hash_lookup+0x71/0x1e9 [mac80211]
>  ? lock_is_held_type+0xe6/0x12f
>  ? __kasan_kmalloc+0xfb/0x112
>  ieee80211_find_sta_by_ifaddr+0x12/0x61 [mac80211]
>  ath10k_wmi_tlv_parse_peer_stats_info+0xbd/0x10b [ath10k_core]
>  ath10k_wmi_tlv_iter+0x8b/0x1a1 [ath10k_core]
>  ? ath10k_wmi_tlv_iter+0x1a1/0x1a1 [ath10k_core]
>  ath10k_wmi_tlv_event_peer_stats_info+0x103/0x13b [ath10k_core]
>  ath10k_wmi_tlv_op_rx+0x722/0x80d [ath10k_core]
>  ath10k_htc_rx_completion_handler+0x16e/0x1d7 [ath10k_core]
>  ath10k_pci_process_rx_cb+0x116/0x22c [ath10k_pci]
>  ? ath10k_htc_process_trailer+0x332/0x332 [ath10k_core]
>  ? _raw_spin_unlock_irqrestore+0x34/0x61
>  ? lockdep_hardirqs_on+0x8e/0x12e
>  ath10k_ce_per_engine_service+0x55/0x74 [ath10k_core]
>  ath10k_ce_per_engine_service_any+0x76/0x84 [ath10k_core]
>  ath10k_pci_napi_poll+0x49/0x141 [ath10k_pci]
>  net_rx_action+0x11a/0x347
>  __do_softirq+0x2d3/0x539
>  run_ksoftirqd+0x4b/0x86
>  smpboot_thread_fn+0x1d0/0x2ab
>  ? cpu_report_death+0x7f/0x7f
>  kthread+0x189/0x191
>  ? cpu_report_death+0x7f/0x7f
>  ? kthread_blkcg+0x31/0x31
>  ret_from_fork+0x22/0x30
> 
> Fixes: 0f7cb26830a6e ("ath10k: add rx bitrate report for SDIO")
> Signed-off-by: Anand K Mistry <amistry@google.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2615e3cdbd9c ath10k: Fix suspicious RCU usage warning in ath10k_wmi_tlv_parse_peer_stats_info()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210202134451.1.I0d2e83c42755671b7143504b62787fd06cd914ed@changeid/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

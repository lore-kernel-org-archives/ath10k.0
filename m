Return-Path: <SRS0=gWg/=HL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC04AC433DB
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 11:55:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35D7564E3B
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 11:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35D7564E3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fxI2ZOw2BcWnxX+TWrpJjrjrCqfQyBydYVTdvw+gjFk=; b=YOp1Eg2/aZZyWVzgJ6r9UEIKH
	+ADKzVqc4En+VThPIWIjjT1ItO39s1kTOLUSBKsQZpF0khCy0+AbyPaLJUHTagd2BUKViLcdc3SbW
	qoCzpEi+3YK/+ilL208VubdXS/vVBCmTfJ8snhJof49VDb+BELbpcit0IjIW9xhOQuZCvUQbw8lrJ
	6SqwZwA8bFUbxU3fAMrH0y2b4NYzhX2xPpHnPWbTk9Aql+RjosyyOg/yY3epI1S/eWbBAt5ZBuwnF
	0+W+xbw+lT9RNmpy+pbDKLfauNst5iOJfr3jD0irxjMYXsxCsEEYcupVb/3laf0Qwggsakqs8c1gQ
	e84vZucZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9RbW-00041l-Ih; Tue, 09 Feb 2021 11:54:50 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9RbT-000411-Fr
 for ath10k@lists.infradead.org; Tue, 09 Feb 2021 11:54:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612871688; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=mKOm6IrftCn4ATYzpQ1U8rnx38JnhjwWLt4nKoCVH4I=;
 b=jQvY0fW/8Kvhvehe1oCQghEkX/8cT5xvaDyIP41+N7/+m6cIorOMTexCxtpKuDVPof5cGM20
 xJh2DKnrG55GUNPDQnjHrd08mouYkNcJdXXBCeh0oQy3LwWFh2rhnCDpWbB51bCeYoHC0cdh
 rzeus6WC5Bx5+Gl2MJBA0RdXo3Y=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60227801e3df861f4b03b85d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 11:54:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B2F5DC43461; Tue,  9 Feb 2021 11:54:40 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A723C433CA;
 Tue,  9 Feb 2021 11:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7A723C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: WARNING: suspicious RCU usage (5.11.0-rc7+ #1812 Tainted: G)
References: <2578278.ATerS0GEoy@kreacher>
 <YCJyJgEeiQqBRgzL@hirez.programming.kicks-ass.net>
Date: Tue, 09 Feb 2021 13:54:35 +0200
In-Reply-To: <YCJyJgEeiQqBRgzL@hirez.programming.kicks-ass.net> (Peter
 Zijlstra's message of "Tue, 9 Feb 2021 12:29:42 +0100")
Message-ID: <877dnhv4lg.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_065448_876717_284CDEA4 
X-CRM114-Status: GOOD (  16.51  )
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
Cc: Paul McKenney <paulmck@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 ath10k@lists.infradead.org, johannes@sipsolutions.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

+ ath10k list

Peter Zijlstra <peterz@infradead.org> writes:

> On Mon, Feb 08, 2021 at 08:04:27PM +0100, Rafael J. Wysocki wrote:
>> Hi Peter & Paul,
>> 
>> The traces below are present in the boot dmesg log on my Dell XPS13 9360.
>> 
>> I haven't had the time to look into this in detail yet, but here it goes in
>> case you know what's going on already.
>> 
>> Cheers!
>> 
>> 
>> [   86.762542] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
>> 
>> [   86.764298] =============================
>> [   86.764300] WARNING: suspicious RCU usage
>> [   86.764302] 5.11.0-rc7+ #1812 Tainted: G          I      
>> [   86.764305] -----------------------------
>> [ 86.764307]
>> /scratch/rafael/work/linux-pm/include/linux/rhashtable.h:594
>> suspicious rcu_dereference_check() usage!
>> [   86.764309] 
>>                other info that might help us debug this:
>> 
>> [   86.764311] 
>>                rcu_scheduler_active = 2, debug_locks = 1
>> [   86.764313] no locks held by swapper/1/0.
>> [   86.764316] 
>>                stack backtrace:
>> [ 86.764318] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G I 5.11.0-rc7+
>> #1812
>> [   86.764321] Hardware name: Dell Inc. XPS 13 9360/, BIOS 1.3.5 05/08/2017
>> [   86.764323] Call Trace:
>> [   86.764325]  <IRQ>
>> [   86.764328]  dump_stack+0x77/0x97
>> [   86.764336]  ieee80211_find_sta_by_ifaddr+0x218/0x2e0 [mac80211]
>> [ 86.764380] ?
>> ath10k_wmi_tlv_op_pull_mgmt_tx_bundle_compl_ev+0xe0/0xe0
>> [ath10k_core]
>> [   86.764399]  ath10k_wmi_tlv_parse_peer_stats_info+0x2a/0x70 [ath10k_core]
>> [   86.764411]  ath10k_wmi_tlv_iter+0x56/0xd0 [ath10k_core]
>> [   86.764424]  ath10k_wmi_tlv_op_rx+0x75a/0xa30 [ath10k_core]
>> [   86.764438]  ath10k_htc_rx_completion_handler+0xe8/0x120 [ath10k_core]
>> [   86.764452]  ? ath10k_htc_process_trailer+0x290/0x290 [ath10k_core]
>> [   86.764462]  ath10k_pci_process_rx_cb+0x117/0x180 [ath10k_pci]
>> [   86.764472]  ? ath10k_ce_per_engine_service+0x4c/0x80 [ath10k_core]
>> [   86.764490]  ? _raw_spin_unlock_irqrestore+0x47/0x60
>> [   86.764504]  ath10k_ce_per_engine_service+0x5d/0x80 [ath10k_core]
>> [   86.764524]  ath10k_ce_per_engine_service_any+0x6a/0xa0 [ath10k_core]
>> [   86.764543]  ath10k_pci_napi_poll+0x44/0x110 [ath10k_pci]
>> [   86.764552]  net_rx_action+0x15d/0x4e0
>> [   86.764570]  __do_softirq+0xeb/0x492
>> [   86.764583]  ? handle_fasteoi_irq+0x150/0x150
>> [   86.764591]  asm_call_irq_on_stack+0x12/0x20
>> [   86.764598]  </IRQ>
>> [   86.764602]  do_softirq_own_stack+0x81/0xa0
>> [   86.764609]  irq_exit_rcu+0xcd/0xe0
>> [   86.764614]  common_interrupt+0xfe/0x230
>> [   86.764623]  asm_common_interrupt+0x1e/0x40
>> [   86.764626] RIP: 0010:cpuidle_enter_state+0x109/0x4a0
>> [ 86.764631] Code: 02 00 00 31 ff e8 b7 40 8e ff 45 84 ff 74 12 9c
>> 58 f6 c4 02 0f 85 10 03 00 00 31 ff e8 70 42 96 ff e8 bb a2 9d ff fb
>> 45 85 f6 <0f> 88 12 01 00 00 49 63 d6 4c 2b 24 24 48 8d 04 52 48 8d
>> 04 82 49
>> [   86.764634] RSP: 0018:ffffc900000e3e80 EFLAGS: 00000202
>> [   86.764638] RAX: 00000000000e8d89 RBX: 0000000000000002 RCX: 0000000000000000
>> [   86.764641] RDX: 0000000000000000 RSI: ffffffff82392561 RDI: ffffffff82344126
>> [   86.764643] RBP: ffffe8ffffc93300 R08: 0000000000000001 R09: 0000000000000001
>> [   86.764645] R10: ffffc900000e3e60 R11: 0000000000000002 R12: 00000014338d5797
>> [   86.764647] R13: ffffffff827e6d60 R14: 0000000000000002 R15: 0000000000000000
>> [   86.764667]  cpuidle_enter+0x29/0x40
>> [   86.764672]  do_idle+0x22d/0x2b0
>> [   86.764682]  cpu_startup_entry+0x19/0x20
>> [   86.764686]  start_secondary+0x125/0x160
>> [   86.764691]  secondary_startup_64_no_verify+0xb0/0xbb
>> 
>
> AFAICT that's a simple 'use RCU without holding rcu_read_lock' warning.
> I've not dug through ath10k to see who should be doing rcu_read_lock,
> but the few places I did look at don't seem to have changed recently.

Just this morning I applied a patch which should fix this:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=2615e3cdbd9c0e864f5906279c952a309871d225

Please let me know if it fixes the issue.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

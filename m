Return-Path: <SRS0=gWg/=HL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAF7C433DB
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 17:45:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21FD264E9C
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 17:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21FD264E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SLDmkc/qHDnuf7od1OXzwVPW3z5S1iXc8mInXTLM4qw=; b=J94+Y6xsHmd0dHM1162KZq6Ii
	0e7RAnnV3W+o4q6crIglDlTBnzd8NAR/hpGxY1Z/TUVt3BPsD0arv2cedzK5EZuLNt9QqdkEkhzOu
	OYyl8GbbFCyNPqjlpdE14zGjk4DikKTRpCxbDvFYVZslf7ragHc7v0lv9dP4EzQWlND9WjtzhkKRf
	+DaXh20wIlSHcmr3F8t0AWwc0oK+uXn6BQwk18JdRoxKh5+jsj2fk8mSJIWhpYOVlN9iZgIiSlIfQ
	TzKlS8297NoIZ2Utaw79LQ4HGG4vXTzTjZ+aRgr/kw1mdh+DogkUBl7er73/NkiaqrsX9y2ZW9GSb
	BRHIq9Snw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9X42-0000gW-Gw; Tue, 09 Feb 2021 17:44:38 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9X3z-0000fl-N9
 for ath10k@lists.infradead.org; Tue, 09 Feb 2021 17:44:36 +0000
Received: by mail-oi1-f177.google.com with SMTP id l19so7811605oih.6
 for <ath10k@lists.infradead.org>; Tue, 09 Feb 2021 09:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JtXdLx7QlA0Hn7jRs0rtA6L/r/My3x/LjkODXAI/ZOI=;
 b=mLwXNokYv28hEXXIvbSjtEIxlwW5UTKHZJcOnGb2QfJy9dbTD4za69fUGwT/B6AAOg
 asgeBP46/Rn3wS7rnJFWAwzM2WHDnKXjqclC9JbBj8fNeqsskFHRBgrXpJxaz+PqoEPm
 OFQPn1Tli/d5rp5Tf/fzkaA8MlzJUxem26LTuMAN00gCKt5cwuN5LBqmmxcPVJ5ddf46
 hOR5NcmIj+Mc55mw9TA6fkB9cqbfrHIhS/UlEEvjSD9ryMHrpjjjvtL+vYW14uSrVjGv
 44Q4Waj45Pgy7igjseVfUM0vnpdwtONKASIOckkUn9UYHBqoCxwq0aLDoUoEMIl5c7k9
 GaCA==
X-Gm-Message-State: AOAM5327yMbcxo58gKL4rbyAtXgojGiL9MVvZxEUy54rlbbZJcIAZQIN
 7TJJaJ75YbVeCNJl3a5iM9qeByBLm8BCWRpVOzc=
X-Google-Smtp-Source: ABdhPJzvatBRRP9QCg3hWjuREYuGegpUTJw/ZdMXqcue86G/3sT32HdOXCN6FcQCHTbSD9e+iBL4Ycr1573AUX0yf3w=
X-Received: by 2002:aca:d14:: with SMTP id 20mr3398663oin.157.1612892672828;
 Tue, 09 Feb 2021 09:44:32 -0800 (PST)
MIME-Version: 1.0
References: <2578278.ATerS0GEoy@kreacher>
 <YCJyJgEeiQqBRgzL@hirez.programming.kicks-ass.net>
 <877dnhv4lg.fsf@codeaurora.org>
In-Reply-To: <877dnhv4lg.fsf@codeaurora.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 9 Feb 2021 18:44:21 +0100
Message-ID: <CAJZ5v0iX0Bn7qjTB6S8exox_NYujAupUy4XkJAyFVNDjvnnZXg@mail.gmail.com>
Subject: Re: WARNING: suspicious RCU usage (5.11.0-rc7+ #1812 Tainted: G)
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_124435_773915_81952D38 
X-CRM114-Status: GOOD (  18.71  )
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
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 ath10k@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, Feb 9, 2021 at 12:57 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> + ath10k list
>
> Peter Zijlstra <peterz@infradead.org> writes:
>
> > On Mon, Feb 08, 2021 at 08:04:27PM +0100, Rafael J. Wysocki wrote:
> >> Hi Peter & Paul,
> >>
> >> The traces below are present in the boot dmesg log on my Dell XPS13 9360.
> >>
> >> I haven't had the time to look into this in detail yet, but here it goes in
> >> case you know what's going on already.
> >>
> >> Cheers!
> >>
> >>
> >> [   86.762542] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> >>
> >> [   86.764298] =============================
> >> [   86.764300] WARNING: suspicious RCU usage
> >> [   86.764302] 5.11.0-rc7+ #1812 Tainted: G          I
> >> [   86.764305] -----------------------------
> >> [ 86.764307]
> >> /scratch/rafael/work/linux-pm/include/linux/rhashtable.h:594
> >> suspicious rcu_dereference_check() usage!
> >> [   86.764309]
> >>                other info that might help us debug this:
> >>
> >> [   86.764311]
> >>                rcu_scheduler_active = 2, debug_locks = 1
> >> [   86.764313] no locks held by swapper/1/0.
> >> [   86.764316]
> >>                stack backtrace:
> >> [ 86.764318] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G I 5.11.0-rc7+
> >> #1812
> >> [   86.764321] Hardware name: Dell Inc. XPS 13 9360/, BIOS 1.3.5 05/08/2017
> >> [   86.764323] Call Trace:
> >> [   86.764325]  <IRQ>
> >> [   86.764328]  dump_stack+0x77/0x97
> >> [   86.764336]  ieee80211_find_sta_by_ifaddr+0x218/0x2e0 [mac80211]
> >> [ 86.764380] ?
> >> ath10k_wmi_tlv_op_pull_mgmt_tx_bundle_compl_ev+0xe0/0xe0
> >> [ath10k_core]
> >> [   86.764399]  ath10k_wmi_tlv_parse_peer_stats_info+0x2a/0x70 [ath10k_core]
> >> [   86.764411]  ath10k_wmi_tlv_iter+0x56/0xd0 [ath10k_core]
> >> [   86.764424]  ath10k_wmi_tlv_op_rx+0x75a/0xa30 [ath10k_core]
> >> [   86.764438]  ath10k_htc_rx_completion_handler+0xe8/0x120 [ath10k_core]
> >> [   86.764452]  ? ath10k_htc_process_trailer+0x290/0x290 [ath10k_core]
> >> [   86.764462]  ath10k_pci_process_rx_cb+0x117/0x180 [ath10k_pci]
> >> [   86.764472]  ? ath10k_ce_per_engine_service+0x4c/0x80 [ath10k_core]
> >> [   86.764490]  ? _raw_spin_unlock_irqrestore+0x47/0x60
> >> [   86.764504]  ath10k_ce_per_engine_service+0x5d/0x80 [ath10k_core]
> >> [   86.764524]  ath10k_ce_per_engine_service_any+0x6a/0xa0 [ath10k_core]
> >> [   86.764543]  ath10k_pci_napi_poll+0x44/0x110 [ath10k_pci]
> >> [   86.764552]  net_rx_action+0x15d/0x4e0
> >> [   86.764570]  __do_softirq+0xeb/0x492
> >> [   86.764583]  ? handle_fasteoi_irq+0x150/0x150
> >> [   86.764591]  asm_call_irq_on_stack+0x12/0x20
> >> [   86.764598]  </IRQ>
> >> [   86.764602]  do_softirq_own_stack+0x81/0xa0
> >> [   86.764609]  irq_exit_rcu+0xcd/0xe0
> >> [   86.764614]  common_interrupt+0xfe/0x230
> >> [   86.764623]  asm_common_interrupt+0x1e/0x40
> >> [   86.764626] RIP: 0010:cpuidle_enter_state+0x109/0x4a0
> >> [ 86.764631] Code: 02 00 00 31 ff e8 b7 40 8e ff 45 84 ff 74 12 9c
> >> 58 f6 c4 02 0f 85 10 03 00 00 31 ff e8 70 42 96 ff e8 bb a2 9d ff fb
> >> 45 85 f6 <0f> 88 12 01 00 00 49 63 d6 4c 2b 24 24 48 8d 04 52 48 8d
> >> 04 82 49
> >> [   86.764634] RSP: 0018:ffffc900000e3e80 EFLAGS: 00000202
> >> [   86.764638] RAX: 00000000000e8d89 RBX: 0000000000000002 RCX: 0000000000000000
> >> [   86.764641] RDX: 0000000000000000 RSI: ffffffff82392561 RDI: ffffffff82344126
> >> [   86.764643] RBP: ffffe8ffffc93300 R08: 0000000000000001 R09: 0000000000000001
> >> [   86.764645] R10: ffffc900000e3e60 R11: 0000000000000002 R12: 00000014338d5797
> >> [   86.764647] R13: ffffffff827e6d60 R14: 0000000000000002 R15: 0000000000000000
> >> [   86.764667]  cpuidle_enter+0x29/0x40
> >> [   86.764672]  do_idle+0x22d/0x2b0
> >> [   86.764682]  cpu_startup_entry+0x19/0x20
> >> [   86.764686]  start_secondary+0x125/0x160
> >> [   86.764691]  secondary_startup_64_no_verify+0xb0/0xbb
> >>
> >
> > AFAICT that's a simple 'use RCU without holding rcu_read_lock' warning.
> > I've not dug through ath10k to see who should be doing rcu_read_lock,
> > but the few places I did look at don't seem to have changed recently.
>
> Just this morning I applied a patch which should fix this:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=2615e3cdbd9c0e864f5906279c952a309871d225
>
> Please let me know if it fixes the issue.

The traces are gone after applying this patch, so it does help:

Tested-by: Rafael J. Wysocki <rafael@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

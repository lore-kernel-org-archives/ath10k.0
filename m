Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755FAC433E0
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 16:22:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2441264E25
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 16:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2441264E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TP5Vh/VpWObC8Dl0RyuhQTjH4SnEY++DozRFB9D5/8g=; b=RDdPxi6QEqUwXOMprVwIjO2Mh
	FORs6FjczWisZ1f9Ik5aQ6YERkbm74p9vZsRWAUVrpefRyse6b2q+rfYtWaHbujCT0tqa2yeYvQiE
	llimlgs2jwq4AV9EtMtEuGXIwESc3JAARlcg0CErsE2wIxotBXdrxW48W1na4iksxZ3X1ueDoXKjq
	u6Rj2WK1lMhFSdVUIulBtff3f9U/O1xIZYA3rqOTrRadn6JG+Cn5Sk8tpftN9xKNk2BHcZhlkYwRE
	ZjFg9gQfpH/ZvCAfaRHXcV6bThZSb/ruYFOs2DQASWmR9xhZ8XYDYB6sJaczWhEjvVn4AT1tJVJHy
	5d5ajc4Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9sGP-0006r1-P1; Wed, 10 Feb 2021 16:22:49 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9sGL-0006pb-TR
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 16:22:46 +0000
Received: by mail-il1-x133.google.com with SMTP id e1so2394532ilu.0
 for <ath10k@lists.infradead.org>; Wed, 10 Feb 2021 08:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JSh8ExYxdty8HZ11KujafrMp7iovLQF4x5Wy4WPKtFY=;
 b=MqBF5ZEr+daNm21Pgbp5M3xc3FrA2e2xhHAo0Dk1bkOF988nmvj/JIs0ba1jcPJ203
 rl6mzOsv2xikvam4uDDIWkXM2lxulDO5Pw/Sz92l1FqLWb4bICKwNCirxhULXoxgy6w7
 RnfuncRvRYQFUiRv98y3Apa/O2gIu6jPfC9xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JSh8ExYxdty8HZ11KujafrMp7iovLQF4x5Wy4WPKtFY=;
 b=fSDatAmxb38qPDbQlAClOD1ggsNPsf0oy3CoovIuxlor1YvkK3/ZxxiQnYA66FJJ9q
 IBHWXlD49VmjfAnsrwgcowqCfXVCQ7WNIU+C5uKo/fhaZN4m0JS7TfHR1+3JoZp7mSvZ
 KKa6peBVYHB5D8hkm0BotRdCxY5ynYHAMgNnKRddlR0Wl7hgdnTiW3mIQprrbSjGKgQ+
 xjQ/MwKWZ42pGpsMSnI+BMNnXyHWIpWV7YtsPQs0Xhgoc+s9nhKR3q/U1jXgMM6KrhuJ
 MK91fM4c8HuVC/oac+fORjMyh+M1mnTj9Vze7m372QtrSi+XEirRXJKHZuYiS9TfHSmf
 /ujw==
X-Gm-Message-State: AOAM530ap6MdbqD2rJg2UpyjW7ryyedroIPULfquuu6mPIQam6yV0sr5
 zo88y5xqyUD8F7vXeqAJNvcUiw==
X-Google-Smtp-Source: ABdhPJzXyC8AmV48saKbwVck5pzWW/8Ry9H6e0li1SH7HuPENRqrnsNCXgsFgCru0G3RWsdbnHR4Nw==
X-Received: by 2002:a92:dcc6:: with SMTP id b6mr1836908ilr.295.1612974163736; 
 Wed, 10 Feb 2021 08:22:43 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id k11sm1129540iop.45.2021.02.10.08.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 08:22:43 -0800 (PST)
Subject: Re: [PATCH 2/5] ath10k: fix WARNING: suspicious RCU usage
To: Kalle Valo <kvalo@codeaurora.org>
References: <23a1333dfb0367cc69e7177a2e373df0b6d42980.1612915444.git.skhan@linuxfoundation.org>
 <20210210081320.2FBE5C433CA@smtp.codeaurora.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7230c9e5-2632-b77e-c4f9-10eca557a5bb@linuxfoundation.org>
Date: Wed, 10 Feb 2021 09:22:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210210081320.2FBE5C433CA@smtp.codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_112245_986534_C5387EAE 
X-CRM114-Status: GOOD (  17.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/10/21 1:13 AM, Kalle Valo wrote:
> Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>> ieee80211_find_sta_by_ifaddr() must be called under the RCU lock and
>> the resulting pointer is only valid under RCU lock as well.
>>
>> Fix ath10k_wmi_tlv_parse_peer_stats_info() to hold RCU lock before it
>> calls ieee80211_find_sta_by_ifaddr() and release it when the resulting
>> pointer is no longer needed. The log below shows the problem.
>>
>> While at it, fix ath10k_wmi_tlv_op_pull_peer_stats_info() to do the same.
>>
>> =============================
>> WARNING: suspicious RCU usage
>> 5.11.0-rc7+ #20 Tainted: G        W
>> -----------------------------
>> include/linux/rhashtable.h:594 suspicious rcu_dereference_check() usage!
>> other info that might help us debug this:
>>                 rcu_scheduler_active = 2, debug_locks = 1
>> no locks held by ksoftirqd/5/44.
>>
>> stack backtrace:
>> CPU: 5 PID: 44 Comm: ksoftirqd/5 Tainted: G        W         5.11.0-rc7+ #20
>> Hardware name: LENOVO 10VGCTO1WW/3130, BIOS M1XKT45A 08/21/2019
>> Call Trace:
>>   dump_stack+0x7d/0x9f
>>   lockdep_rcu_suspicious+0xdb/0xe5
>>   __rhashtable_lookup+0x1eb/0x260 [mac80211]
>>   ieee80211_find_sta_by_ifaddr+0x5b/0xc0 [mac80211]
>>   ath10k_wmi_tlv_parse_peer_stats_info+0x3e/0x90 [ath10k_core]
>>   ath10k_wmi_tlv_iter+0x6a/0xc0 [ath10k_core]
>>   ? ath10k_wmi_tlv_op_pull_mgmt_tx_bundle_compl_ev+0xe0/0xe0 [ath10k_core]
>>   ath10k_wmi_tlv_op_rx+0x5da/0xda0 [ath10k_core]
>>   ? trace_hardirqs_on+0x54/0xf0
>>   ? ath10k_ce_completed_recv_next+0x4e/0x60 [ath10k_core]
>>   ath10k_wmi_process_rx+0x1d/0x40 [ath10k_core]
>>   ath10k_htc_rx_completion_handler+0x115/0x180 [ath10k_core]
>>   ath10k_pci_process_rx_cb+0x149/0x1b0 [ath10k_pci]
>>   ? ath10k_htc_process_trailer+0x2d0/0x2d0 [ath10k_core]
>>   ? ath10k_pci_sleep.part.0+0x6a/0x80 [ath10k_pci]
>>   ath10k_pci_htc_rx_cb+0x15/0x20 [ath10k_pci]
>>   ath10k_ce_per_engine_service+0x61/0x80 [ath10k_core]
>>   ath10k_ce_per_engine_service_any+0x7d/0xa0 [ath10k_core]
>>   ath10k_pci_napi_poll+0x48/0x120 [ath10k_pci]
>>   net_rx_action+0x136/0x500
>>   __do_softirq+0xc6/0x459
>>   ? smpboot_thread_fn+0x2b/0x1f0
>>   run_ksoftirqd+0x2b/0x60
>>   smpboot_thread_fn+0x116/0x1f0
>>   kthread+0x14b/0x170
>>   ? smpboot_register_percpu_thread+0xe0/0xe0
>>   ? __kthread_bind_mask+0x70/0x70
>>   ret_from_fork+0x22/0x30
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Unlucky timing also on this one, it conflicts with a patch I applied yesterday:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=2615e3cdbd9c0e864f5906279c952a309871d225
> 
> Can you redo the patch to only change ath10k_wmi_event_tdls_peer()?
> 

Yes. I will send the patch just for ath10k_wmi_event_tdls_peer()
on top of your patch.

> error: patch failed: drivers/net/wireless/ath/ath10k/wmi-tlv.c:240
> error: drivers/net/wireless/ath/ath10k/wmi-tlv.c: patch does not apply
> stg import: Diff does not apply cleanly
> 
> Patch set to Changes Requested.
> 

thanks,
-- Shuah

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

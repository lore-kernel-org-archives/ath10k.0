Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DBCC433E6
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 16:21:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8E864E6B
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 16:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8E864E6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xxqzMdfRLlQUJEVxh1tgXDDTluadz2QPharJ80ksGJE=; b=EwBzygjl4fQM+GTZmuK5JbCdX
	tELYZUAVrigMrgBroGQ0VS3KZa4oE8k7kEmJmymicz8ErmW9fIUW+l/P/ox3ksXRRpYrsRDCPcJ/q
	vAmXE8VFCLYtfcczgCObhpZaeNdTQxMkBlBQedkL342iUAfnf7KMIsWq6fKT0NX48vG4T/UhJ7OWf
	h9RBnoqhNOAmlP5UtgPifKZEw0ZVZnAyX144iihm1wmWqFbhraAtBXUD6jxHQEsLP4ri7iwYkmzTh
	1Di7fCzt5KjUAGB+W6gT3QPpAmihbT4yfw+TPOseRW9ZbKiCwEVXqNIRLjr590IlIigcNKJzlwRiO
	oXsTR1jtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9sFC-0006gs-OG; Wed, 10 Feb 2021 16:21:34 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9sF9-0006fx-Up
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 16:21:33 +0000
Received: by mail-il1-x12c.google.com with SMTP id o7so2382749ils.2
 for <ath10k@lists.infradead.org>; Wed, 10 Feb 2021 08:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6yXKjsN1ka+2Uf+fhuWUwyAZEKGHcH+AM6Ok5R7l2IA=;
 b=ZD7qNj0/qiurT5I91xkCFuk2ZPqk+UWwJEOjygOAUvONVgHkt/R4W1QbyBH/rJjtE4
 E+xzQkw98OYFUqAY1C2tcUwClhFAVJ8NUJ/Py2B9JI6QWovPexwMXgU30ajnhhjXFRj7
 m0J4QSN10DdQY4o3tD74Bes+CxwJqY9OCheJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6yXKjsN1ka+2Uf+fhuWUwyAZEKGHcH+AM6Ok5R7l2IA=;
 b=fw8HpJkmajKTn9H+t5rp4nwqhK/CS8u2KK46f8D4V+/A72LhvfxUUKFmPwHmezG6rX
 Vadxjnx/WIwXJowaMI0DdxCX1WRAzF3Z1gRlR4LgFmhcPABiQSjihGHkmzHhasVFOz8/
 BHuNcadBirEgOFa9Eps85NJM+O9OGFC4iuwdgByVM6GWgxhVP0kYTHY9NZDW6jBRAdqb
 kVoU3eD2oC7ijf2ftao5Gsmkw9bVZItZ7+9tKsmhUXpVARpF/8PvlzNlPUb/dtA9ufMp
 4GDs3sQB9ZoAtCW8BPcn2RESF5YE1Z3aAFm9j7bvTcN1SSiUqEaoac+RakPLseCn0IZ/
 xmwg==
X-Gm-Message-State: AOAM533pFnHp0QCNaqpLLrnTHJ09zCZLIT86Vdk1bCasW5az/0aUW4kz
 rRlUqAiN9ljLE/72ZVpjdZDNKg==
X-Google-Smtp-Source: ABdhPJwFoPNwp2dKSESSIhUH4JNUpb2aVVXoVj2FhH8+5ai3LgyD1SkadM7uZbq9E23FrecOZnxXiA==
X-Received: by 2002:a92:b744:: with SMTP id c4mr1725790ilm.175.1612974089545; 
 Wed, 10 Feb 2021 08:21:29 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id g6sm1219735ilf.3.2021.02.10.08.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 08:21:29 -0800 (PST)
Subject: Re: [PATCH 1/5] ath10k: fix conf_mutex lock assert in
 ath10k_debug_fw_stats_request()
To: Kalle Valo <kvalo@codeaurora.org>
References: <1c38ef6d39ed89a564bc817d964d923ff0676c53.1612915444.git.skhan@linuxfoundation.org>
 <20210210080915.8A81AC433C6@smtp.codeaurora.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <627512c6-7008-a1a0-fb04-e7e1d41e8cbe@linuxfoundation.org>
Date: Wed, 10 Feb 2021 09:21:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210210080915.8A81AC433C6@smtp.codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_112132_042282_D17C7364 
X-CRM114-Status: GOOD (  12.27  )
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

On 2/10/21 1:09 AM, Kalle Valo wrote:
> Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>> ath10k_debug_fw_stats_request() is called ath10k_sta_statistics()
>> without holding conf_mutex. ath10k_debug_fw_stats_request() simply
>> returns when CONFIG_ATH10K_DEBUGFS is disabled.
>>
>> When CONFIG_ATH10K_DEBUGFS is enabled, ath10k_debug_fw_stats_request()
>> code path isn't protected. This assert is triggered when CONFIG_LOCKDEP
>> and CONFIG_ATH10K_DEBUGFS are enabled.
>>
>> All other ath10k_debug_fw_stats_request() callers hold conf_mutex.
>> Fix ath10k_sta_statistics() to do the same.
>>
>> WARNING: CPU: 5 PID: 696 at drivers/net/wireless/ath/ath10k/debug.c:357 ath10k_debug_fw_stats_request+0x29a/0x2d0 [ath10k_core]
>> Modules linked in: rfcomm ccm fuse cmac algif_hash algif_skcipher af_alg bnep binfmt_misc nls_iso8859_1 intel_rapl_msr intel_rapl_common snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_pcm amdgpu snd_seq_midi snd_seq_midi_event snd_rawmidi edac_mce_amd snd_seq ath10k_pci ath10k_core aesni_intel gpu_sched drm_ttm_helper btusb ttm glue_helper crypto_simd btrtl ath cryptd drm_kms_helper snd_seq_device btbcm snd_timer rapl btintel cec i2c_algo_bit mac80211 bluetooth fb_sys_fops input_leds ecdh_generic snd wmi_bmof syscopyarea ecc serio_raw efi_pstore ccp k10temp sysfillrect soundcore sysimgblt snd_pci_acp3x cfg80211 ipmi_devintf libarc4 ipmi_msghandler mac_hid sch_fq_codel parport_pc ppdev lp parport drm ip_tables x_tables autofs4 hid_generic usbhid hid crc32_pclmul psmouse ahci nvme libahci i2c_piix4 nvme_core r8169 realtek wmi video
>> CPU: 5 PID: 696 Comm: NetworkManager Tainted: G        W         5.11.0-rc7+ #20
>> Hardware name: LENOVO 10VGCTO1WW/3130, BIOS M1XKT45A 08/21/2019
>> RIP: 0010:ath10k_debug_fw_stats_request+0x29a/0x2d0 [ath10k_core]
>> Code: 83 c4 10 44 89 f8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 48 8d bf e8 20 00 00 be ff ff ff ff e8 de 2d 47 fa 85 c0 0f 85 8d fd ff ff <0f> 0b e9 86 fd ff ff 41 bf a1 ff ff ff 44 89 fa 48 c7 c6 2c 71 c4
>> RSP: 0018:ffffaffbc124b7d0 EFLAGS: 00010246
>> RAX: 0000000000000000 RBX: ffff93d02e4fec70 RCX: 0000000000000001
>> RDX: 0000000000000000 RSI: ffff93d00cba5248 RDI: ffff93d00ab309a0
>> RBP: ffffaffbc124b808 R08: 0000000000000000 R09: ffff93d02e4fec70
>> R10: 0000000000000001 R11: 0000000000000246 R12: ffff93d00cba3160
>> R13: ffff93d00cba3160 R14: ffff93d02e4fe4f0 R15: 0000000000000001
>> FS:  00007f7ce8d50bc0(0000) GS:ffff93d137d40000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007fc3595ad160 CR3: 000000010d492000 CR4: 00000000003506e0
>> Call Trace:
>>   ? sta_info_get_bss+0xeb/0x1f0 [mac80211]
>>   ath10k_sta_statistics+0x4f/0x280 [ath10k_core]
>>   sta_set_sinfo+0xda/0xd20 [mac80211]
>>   ieee80211_get_station+0x58/0x80 [mac80211]
>>   nl80211_get_station+0xbd/0x340 [cfg80211]
>>   genl_family_rcv_msg_doit+0xe7/0x150
>>   genl_rcv_msg+0xe2/0x1e0
>>   ? nl80211_dump_station+0x3a0/0x3a0 [cfg80211]
>>   ? nl80211_send_station+0xef0/0xef0 [cfg80211]
>>   ? genl_get_cmd+0xd0/0xd0
>>   netlink_rcv_skb+0x55/0x100
>>   genl_rcv+0x29/0x40
>>   netlink_unicast+0x1a8/0x270
>>   netlink_sendmsg+0x253/0x480
>>   sock_sendmsg+0x65/0x70
>>   ____sys_sendmsg+0x219/0x260
>>   ? __import_iovec+0x32/0x170
>>   ___sys_sendmsg+0xb7/0x100
>>   ? end_opal_session+0x39/0xd0
>>   ? __fget_files+0xe0/0x1d0
>>   ? find_held_lock+0x31/0x90
>>   ? __fget_files+0xe0/0x1d0
>>   ? __fget_files+0x103/0x1d0
>>   ? __fget_light+0x32/0x80
>>   __sys_sendmsg+0x5a/0xa0
>>   ? syscall_enter_from_user_mode+0x21/0x60
>>   __x64_sys_sendmsg+0x1f/0x30
>>   do_syscall_64+0x38/0x50
>>   entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> RIP: 0033:0x7f7cea2c791d
>> Code: 28 89 54 24 1c 48 89 74 24 10 89 7c 24 08 e8 4a ee ff ff 8b 54 24 1c 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 2e 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 33 44 89 c7 48 89 44 24 08 e8 9e ee ff ff 48
>> RSP: 002b:00007ffedf612a30 EFLAGS: 00000293 ORIG_RAX: 000000000000002e
>> RAX: ffffffffffffffda RBX: 00005618c4cfec00 RCX: 00007f7cea2c791d
>> RDX: 0000000000000000 RSI: 00007ffedf612a80 RDI: 000000000000000b
>> RBP: 00007ffedf612a80 R08: 0000000000000000 R09: 00005618c4e74000
>> R10: 00005618c4da0590 R11: 0000000000000293 R12: 00005618c4cfec00
>> R13: 00005618c4cfe2c0 R14: 00007f7cea32ef80 R15: 00005618c4cff340
>> irq event stamp: 520897
>> hardirqs last  enabled at (520903): [<ffffffffba501cc5>] console_unlock+0x4e5/0x5d0
>> hardirqs last disabled at (520908): [<ffffffffba501c38>] console_unlock+0x458/0x5d0
>> softirqs last  enabled at (520722): [<ffffffffbb201002>] asm_call_irq_on_stack+0x12/0x20
>> softirqs last disabled at (520717): [<ffffffffbb201002>] asm_call_irq_on_stack+0x12/0x20
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Bad timing, just yesterday I applied an identical patch:
> 

Yes it is.

> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=7df28718928d08034b36168200d67b558ce36f3d
> 

No worries. I will apply yours to my repo

thanks,
-- Shuah


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

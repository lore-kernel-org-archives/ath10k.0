Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FBCC433E0
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 02:12:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B8CB64E42
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 02:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B8CB64E42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kFSEd8p/pRWm7xwh6saakDbW6fnbK0/LbZ/12+MONxQ=; b=wAQS71TYVogp+LKSaIv9frbmR
	YpfRNnjzLmWOYwR8J8k950XGJhDg3CeYudzTYlv0GAgEWYceZbQ31n+oXjfXV9BU1IKUQqrLi0bpx
	ozsmZHALbl9NmlS/6tAtGQmkJIFaM7tY+JpQg+bEAo6z0qyt6C2rnjZAyB+trfcJJ0VS2FczYDIHd
	ROeko5TIV3haQe/2Dxlau4Zo77oRDzYfxXnxRPdEJtx1rcI9fmRRUE25Y6fFfe/B03/Oi5h2TXVTL
	Nm3x01JSC7hEQN2HbnSxMnEcNdyZd6RrVdKulG7Czo2D68+PFtJyp8sZTE61FXFc22qFSQ9anmR97
	cLAI42spA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ez7-0001Es-EI; Wed, 10 Feb 2021 02:12:05 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9ez2-0001EN-UV
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 02:12:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612923122; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rPQJZTrg1mOyXDXVX3wmGnneb1R6HB/8qj87QmbUn3A=;
 b=e18equLH6l+O8o647AsmwbTdNujHIA1Hv3xxtJnS4IEgu9oqJaWLmBZFoef7XdalLioQ6TsY
 2Yz2UMPlGXQgcedls5KKMGtNwE4HW2tNItR0WMG1IPc8KlhbM2EaH0KEn5SdYC2HY4YsKeM0
 kkwtKVvjIiHmIzaHjmESgOruRg8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 602340e8e4842e912810865f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 02:11:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 098E6C43467; Wed, 10 Feb 2021 02:11:52 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BC40FC433ED;
 Wed, 10 Feb 2021 02:11:50 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 10 Feb 2021 10:11:50 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: change len of trace_ath10k_log_dbg_dump for large
 buffer size
In-Reply-To: <CA+ASDXN1V2HYA7C6s-q5bQNSxE7L5GCJiqfiJ_67R_hpUn4b_g@mail.gmail.com>
References: <1612839593-2308-1-git-send-email-wgong@codeaurora.org>
 <CA+ASDXN1V2HYA7C6s-q5bQNSxE7L5GCJiqfiJ_67R_hpUn4b_g@mail.gmail.com>
Message-ID: <19b6ad684a01718c3823f882581fca36@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_211202_818922_96B845D9 
X-CRM114-Status: GOOD (  27.72  )
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, ath10k <ath10k@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2021-02-10 03:35, Brian Norris wrote:
> + Steven Rostedt
> 
> Hi Wen,
> 
> (Trimming down the description a bit:)
> 
> On Mon, Feb 8, 2021 at 6:59 PM Wen Gong <wgong@codeaurora.org> wrote:
>> 
>> Kernel panic every time in kernel when running below case:
>> steps:
>> 1. connect to an AP with good signal strength
>> 2. echo 0x7f > /sys/kernel/debug/ieee80211/phy0/ath10k/pktlog_filter
>> 3. echo 0xffff 0 > /sys/kernel/debug/ieee80211/phy0/ath10k/fw_dbglog
>> 4. echo 0 > /sys/module/ath10k_core/parameters/debug_mask
>> 5. sudo trace-cmd record  -e ath10k
>> 6. run "iperf -c 192.168.1.1 -u -b 100m -i 1 -t 30"
>> 7. kernel panic immeditely
>> 
>> It always crash at trace_event_raw_event_ath10k_xxx, below is 2 
>> sample:
> ...
>> The value of prog in filter_match_preds of 
>> kernel/trace/trace_events_filter.c
>> is overwrite to the content of the UDP packets's content like this
>> 0x0039383736353433, it is a invalid address, so crash.
> ...
>> ath10k_htc_send_bundle_skbs allocate skb with size 49792(1556*32), it
>> is bigger than PAGE_SIZE which is normally 4096, then 
>> ath10k_sdio_write
>> call ath10k_dbg_dump to trace the large size skb and corrupt the trace
>> data of tracing and lead crash. When disable the TX bundle of SDIO, it
>> does not crash, but TX bundle is for improve throughput, so it is 
>> enabled
>> by default. It is useless to call ath10k_dbg_dump to trace the large
>> bundled skb, so this patch trace the top part of large bundled skb.
> ...
>> trace_event_raw_event_ath10k_log_dbg_dump is generated by compiler, it
>> call trace_event_buffer_reserve got get a struct pointer *entry, its
>> type is trace_event_raw_ath10k_log_dbg_dump which is also generated by
>> compiler, trace_event_buffer_reserve of kernel/trace/trace_events.c
>> call trace_event_buffer_lock_reserve to get ring_buffer_event.
>> 
>> In function trace_event_buffer_lock_reserve of kernel/trace/trace.c,
>> the ring_buffer_time_stamp_abs is false and trace_file->flags is 0x40b
>> which is set bit of EVENT_FILE_FL_FILTERED by debugging, so it use the
>> temp buffer this_cpu_read(trace_buffered_event), and the buffer size
>> is 1 page size which allocatee in trace_buffered_event_enable by
>> alloc_pages_node, and then ath10k pass the buffer size > 1 page 
>> trigger
>> overflow and crash.
>> 
>> Based on upper test, try and debugging, pass large buff size to 
>> function
>> trace_ath10k_log_dbg_dump cause crash, and it has ath10k_dbg in
>> ath10k_sdio_write to print the length of skb/buffer, it is not 
>> necessary
>> to trace all content of the large skb.
> 
> Is this the same issue noted in this thread?
Hi Norris,
Yes, but it is not the total same issue.
> 
> [for-next][PATCH 2/2] tracing: Use temp buffer when filtering events
> https://lore.kernel.org/lkml/f16b14066317f6a926b6636df6974966@codeaurora.org/
> 
> It seems like we should still try to get that fixed somehow, even if
> the below change is fine on its own (it probably doesn't make sense to
> such a large amount of data via tracepoints). It would be unfortunate
> for next poor soul to hit the same issues, just because they wanted to
> dump a few KB.
For ath10k, we do not want to dump content which size > 1024.
otherwise it will generate a much big file while collecting log, it make 
us much
hard to analyze the log.
so this patch is to dump the top 1024 bytes only,
its 1st goal is make log smaller.
its 2nd effect is fix the crash issue,
> 
> Brian
> 
>>  drivers/net/wireless/ath/ath10k/debug.c | 2 +-
>>  drivers/net/wireless/ath/ath10k/debug.h | 2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath10k/debug.c 
>> b/drivers/net/wireless/ath/ath10k/debug.c
>> index e8250a665433..5433dbdde0e5 100644
>> --- a/drivers/net/wireless/ath/ath10k/debug.c
>> +++ b/drivers/net/wireless/ath/ath10k/debug.c
>> @@ -2718,7 +2718,7 @@ void ath10k_dbg_dump(struct ath10k *ar,
>> 
>>         /* tracing code doesn't like null strings :/ */
>>         trace_ath10k_log_dbg_dump(ar, msg ? msg : "", prefix ? prefix 
>> : "",
>> -                                 buf, len);
>> +                                 buf, min_t(size_t, len, 
>> ATH10K_LOG_DUMP_MAX));
>>  }
>>  EXPORT_SYMBOL(ath10k_dbg_dump);
>> 
>> diff --git a/drivers/net/wireless/ath/ath10k/debug.h 
>> b/drivers/net/wireless/ath/ath10k/debug.h
>> index 997c1c80aba7..cec9ba92f28f 100644
>> --- a/drivers/net/wireless/ath/ath10k/debug.h
>> +++ b/drivers/net/wireless/ath/ath10k/debug.h
>> @@ -11,6 +11,8 @@
>>  #include <linux/types.h>
>>  #include "trace.h"
>> 
>> +#define ATH10K_LOG_DUMP_MAX 1024
>> +
>>  enum ath10k_debug_mask {
>>         ATH10K_DBG_PCI          = 0x00000001,
>>         ATH10K_DBG_WMI          = 0x00000002,
>> --
>> 2.23.0
>> 
>> 
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

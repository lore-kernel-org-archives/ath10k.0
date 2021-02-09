Return-Path: <SRS0=gWg/=HL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A422C433E0
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 19:36:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1897B64E7D
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 19:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1897B64E7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=plPY0KoDBY5aexvEizzW9dYESDpzlnkBanWuCNxoFbc=; b=is6xc7N10Pa+oA4s9r8HjdT7H
	DYXRTox8HabCS5md04DEpx5rB6IYbGjF3cyd4tOodqAxuGppzNueVn76kWue6Y7VHY2ZA6IHDm+Qk
	3I/aMD9F1z+29C5ovac0AKE5ZvQdkYBw3K6Tj86RgLBQ48uYMu7GTRL9cedcn7f1bCZ6JUABkj9wr
	R/TxWzleQeApDCmPvVmAA8eq/DZSe9XYlciF7GdgcUGcBH3K0cCEjGY0KQUmgdU2ojkhudtM21Qww
	OpqjOlE2Ex3SNnk3z9YSrWCHBpQPP1lh+N4fLPB24rWedlZ+Us5XOhtWHdppkPxTL2J9XXaAUvhak
	gFJtH5vXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9YnI-0007Yx-HP; Tue, 09 Feb 2021 19:35:28 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9YnF-0007YY-CU
 for ath10k@lists.infradead.org; Tue, 09 Feb 2021 19:35:26 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 18so9558523oiz.7
 for <ath10k@lists.infradead.org>; Tue, 09 Feb 2021 11:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imaDHBwrWHrUd/4hjqmb301LjKtIq5cfc5kt3uXuSxk=;
 b=C7eKAiokkWt6A7HOHS9gByMMufBWqEk5MDfnpZ2L3ebZPxCjbiXireg24UpiAqxW14
 kwX6SfH6aenZPjflM/lk393VBAtv7gTfb7a2oFXkTE3iXIQVcyEntqxU2/igjvxoa12B
 h86Q9fXmLifDCjJzEORBTGjhhi6oJjCxIQqCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imaDHBwrWHrUd/4hjqmb301LjKtIq5cfc5kt3uXuSxk=;
 b=qaBHN1/q2yvsybytB+o4E4ZtBO/Z+olsbT/qggtsfPmyQM1FNNhjz4ISFV+Th8P2Fu
 q+z3GKJu1LJyQsG2sNgT8qkRJqRpxQZvtBMDR6Q9Kt5zhBZ8OV2t3e6tVOe9KA7qh5zN
 W0KppMncRnc4LLh5/3hD2gmgd16jnDxpkgO5RmIlNtZavIicc6sBXb0fiQ0a+7PY45BO
 1mbTHnJk5Ky8kNJtt/TVQl2k3PhKB3BLd1chgAbZWBveVh+hdKzXM8u3qimTRCWX15Os
 TcKgYA3AISKiQIPYtPSrI82NA0Nxmu8xuudH4ijxBqIDR8BLI4CGHy0CjGfgKSb/RiDL
 156w==
X-Gm-Message-State: AOAM532ukBYdT2pKzzTrLq/fwp7/4qbzHyEJ6gdwVPxR6hFANM3IqNd1
 lBqEL2rltceVE/v8KL5+/CLtuZlb7YJifA==
X-Google-Smtp-Source: ABdhPJw1YP1EUiM9PpENFt4FWxsrAddBIln7e/ovDGtUXZQFa5lihf/7eYMMTr/dnXm5vCm4qDQstg==
X-Received: by 2002:aca:4356:: with SMTP id q83mr3517218oia.26.1612899320771; 
 Tue, 09 Feb 2021 11:35:20 -0800 (PST)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
 [209.85.167.171])
 by smtp.gmail.com with ESMTPSA id k32sm4513531otc.74.2021.02.09.11.35.19
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 11:35:20 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id h6so20694782oie.5
 for <ath10k@lists.infradead.org>; Tue, 09 Feb 2021 11:35:19 -0800 (PST)
X-Received: by 2002:aca:43c3:: with SMTP id q186mr3465463oia.77.1612899319280; 
 Tue, 09 Feb 2021 11:35:19 -0800 (PST)
MIME-Version: 1.0
References: <1612839593-2308-1-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1612839593-2308-1-git-send-email-wgong@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 9 Feb 2021 11:35:07 -0800
X-Gmail-Original-Message-ID: <CA+ASDXN1V2HYA7C6s-q5bQNSxE7L5GCJiqfiJ_67R_hpUn4b_g@mail.gmail.com>
Message-ID: <CA+ASDXN1V2HYA7C6s-q5bQNSxE7L5GCJiqfiJ_67R_hpUn4b_g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: change len of trace_ath10k_log_dbg_dump for large
 buffer size
To: Wen Gong <wgong@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_143525_466420_8BC15F22 
X-CRM114-Status: GOOD (  29.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

+ Steven Rostedt

Hi Wen,

(Trimming down the description a bit:)

On Mon, Feb 8, 2021 at 6:59 PM Wen Gong <wgong@codeaurora.org> wrote:
>
> Kernel panic every time in kernel when running below case:
> steps:
> 1. connect to an AP with good signal strength
> 2. echo 0x7f > /sys/kernel/debug/ieee80211/phy0/ath10k/pktlog_filter
> 3. echo 0xffff 0 > /sys/kernel/debug/ieee80211/phy0/ath10k/fw_dbglog
> 4. echo 0 > /sys/module/ath10k_core/parameters/debug_mask
> 5. sudo trace-cmd record  -e ath10k
> 6. run "iperf -c 192.168.1.1 -u -b 100m -i 1 -t 30"
> 7. kernel panic immeditely
>
> It always crash at trace_event_raw_event_ath10k_xxx, below is 2 sample:
...
> The value of prog in filter_match_preds of kernel/trace/trace_events_filter.c
> is overwrite to the content of the UDP packets's content like this
> 0x0039383736353433, it is a invalid address, so crash.
...
> ath10k_htc_send_bundle_skbs allocate skb with size 49792(1556*32), it
> is bigger than PAGE_SIZE which is normally 4096, then ath10k_sdio_write
> call ath10k_dbg_dump to trace the large size skb and corrupt the trace
> data of tracing and lead crash. When disable the TX bundle of SDIO, it
> does not crash, but TX bundle is for improve throughput, so it is enabled
> by default. It is useless to call ath10k_dbg_dump to trace the large
> bundled skb, so this patch trace the top part of large bundled skb.
...
> trace_event_raw_event_ath10k_log_dbg_dump is generated by compiler, it
> call trace_event_buffer_reserve got get a struct pointer *entry, its
> type is trace_event_raw_ath10k_log_dbg_dump which is also generated by
> compiler, trace_event_buffer_reserve of kernel/trace/trace_events.c
> call trace_event_buffer_lock_reserve to get ring_buffer_event.
>
> In function trace_event_buffer_lock_reserve of kernel/trace/trace.c,
> the ring_buffer_time_stamp_abs is false and trace_file->flags is 0x40b
> which is set bit of EVENT_FILE_FL_FILTERED by debugging, so it use the
> temp buffer this_cpu_read(trace_buffered_event), and the buffer size
> is 1 page size which allocatee in trace_buffered_event_enable by
> alloc_pages_node, and then ath10k pass the buffer size > 1 page trigger
> overflow and crash.
>
> Based on upper test, try and debugging, pass large buff size to function
> trace_ath10k_log_dbg_dump cause crash, and it has ath10k_dbg in
> ath10k_sdio_write to print the length of skb/buffer, it is not necessary
> to trace all content of the large skb.

Is this the same issue noted in this thread?

[for-next][PATCH 2/2] tracing: Use temp buffer when filtering events
https://lore.kernel.org/lkml/f16b14066317f6a926b6636df6974966@codeaurora.org/

It seems like we should still try to get that fixed somehow, even if
the below change is fine on its own (it probably doesn't make sense to
such a large amount of data via tracepoints). It would be unfortunate
for next poor soul to hit the same issues, just because they wanted to
dump a few KB.

Brian

>  drivers/net/wireless/ath/ath10k/debug.c | 2 +-
>  drivers/net/wireless/ath/ath10k/debug.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
> index e8250a665433..5433dbdde0e5 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -2718,7 +2718,7 @@ void ath10k_dbg_dump(struct ath10k *ar,
>
>         /* tracing code doesn't like null strings :/ */
>         trace_ath10k_log_dbg_dump(ar, msg ? msg : "", prefix ? prefix : "",
> -                                 buf, len);
> +                                 buf, min_t(size_t, len, ATH10K_LOG_DUMP_MAX));
>  }
>  EXPORT_SYMBOL(ath10k_dbg_dump);
>
> diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
> index 997c1c80aba7..cec9ba92f28f 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.h
> +++ b/drivers/net/wireless/ath/ath10k/debug.h
> @@ -11,6 +11,8 @@
>  #include <linux/types.h>
>  #include "trace.h"
>
> +#define ATH10K_LOG_DUMP_MAX 1024
> +
>  enum ath10k_debug_mask {
>         ATH10K_DBG_PCI          = 0x00000001,
>         ATH10K_DBG_WMI          = 0x00000002,
> --
> 2.23.0
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

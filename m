Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF26C433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Dec 2021 08:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TFqCKj8bPOXZnVEhO/bToTQ637MSG+CbxVW0sktUnE=; b=Tnm2z0gfuguhyZ
	lyS2L0MwOvluZN71k/InMFLerqzggvKmJjfrEnwsXMGs57n8l5Zf/NCYb2k4yitInIzKNU4ZpXLe3
	JTmrFGJGleqGZ8tD8EPRvlsmoO6bpCpjM64hyWBzhtR+eeezfYXWXeGOvWT2RfLjD4I3AG5v0KPLQ
	kXvtJV8/zKaYDzVNgDaYW6ulW0BXxGu2A5KLWpDQ5vthjbZs6/CUROw7OEOcZgmhPYvJp8yW9Pf2J
	JOG78g5htL/rgThAhwIpLLnnLuLBlw9UpFh089obDXK4GmnrX5T4YOBk1gnhjiONmqDlf5awRsQzS
	4RybkYVCEZFuPCRO0E2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1musTS-00BkYq-GI; Wed, 08 Dec 2021 08:38:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musTO-00BkWG-3A
 for ath10k@lists.infradead.org; Wed, 08 Dec 2021 08:38:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BDAF6B81FDA;
 Wed,  8 Dec 2021 08:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891EEC00446;
 Wed,  8 Dec 2021 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638952723;
 bh=Q567TgICxgp57/1WOkK2zHHTkIEc7Sqbzk/3ECXwHFM=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=r3ncYkGSWLGMcbn/brW8cQrNUWtq2WNiq7FoGNUWey2nFKwVlNbX+KQmET42x/Cmy
 QeCW8lk9XGTXuEz2bSF0/Q8oFUQiWItHaAdBfuUASofyPJybMvG2BF1swbjot9ABhg
 MiqaowyrOKqSo9MszcS1JvNLpRFdHgYlXsLiAI565bmc1hgvfxDnr4/VEok/MvAaic
 oKmArtp+68lTOApinAEoV2V6KqDD7Cl7++31sifRHopuyCXXZl0diIpd9as1XtswaS
 3SD4i4YT94ThTYRC6EChVsFbX/Qc03ZbPD1uKLLNQulHMaJNj/c5xHuwrJKF5jGTA/
 fyIXWHgnHqUlQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix scan abort when duration is set for hw scan
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211026025902.26621-1-quic_wgong@quicinc.com>
References: <20211026025902.26621-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163895272089.29041.8698612176646139830.kvalo@kernel.org>
Date: Wed,  8 Dec 2021 08:38:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_003846_459264_29DE9FD0 
X-CRM114-Status: GOOD (  10.21  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> When request scan with duration 120ms on channel 1, it failed with
> scan abort easily. Because scan_timeout is set to 130ms for the scan
> in ath10k_hw_scan(), and timed out before scan complete, so lead
> scan abort.
> 
> failed log of ath10k:
> 2021-04-14T14:43:29.936058Z DEBUG kernel: [67384.594846] ath10k_sdio mmc1:0001:1: wmi tlv start scan
> 2021-04-14T14:43:29.937896Z DEBUG kernel: [67384.595820] ath10k_sdio mmc1:0001:1: scan event started type 1 reason 7 freq 2437 req_id 40961 scan_id 40960 vdev_id 0 state starting (1)
> 2021-04-14T14:43:29.938357Z DEBUG kernel: [67384.596761] ath10k_sdio mmc1:0001:1: scan event bss channel type 4 reason 7 freq 2437 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
> 2021-04-14T14:43:29.992497Z DEBUG kernel: [67384.651013] ath10k_sdio mmc1:0001:1: scan event foreign channel type 8 reason 7 freq 2412 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
> 2021-04-14T14:43:30.063530Z DEBUG kernel: [67384.722139] ath10k_sdio mmc1:0001:1: wmi tlv stop scan
> 2021-04-14T14:43:30.066592Z DEBUG kernel: [67384.724403] ath10k_sdio mmc1:0001:1: scan event completed [cancelled] type 2 reason 1 freq 2412 req_id 40961 scan_id 40960 vdev_id 0 state aborting (3)
> 
> failed log of wpa_supplicant:
> 2021-04-14T14:43:29.981842Z DEBUG wpa_supplicant[887]: wlan0: nl80211: scan request
> 2021-04-14T14:43:29.981988Z DEBUG wpa_supplicant[887]: nl80211: Passive scan requested
> 2021-04-14T14:43:29.982202Z DEBUG wpa_supplicant[887]: nl80211: Add NL80211_SCAN_FLAG_FLUSH
> 2021-04-14T14:43:29.982339Z DEBUG wpa_supplicant[887]: Scan requested (ret=0) - scan timeout 30 seconds
> 2021-04-14T14:43:29.982491Z DEBUG wpa_supplicant[887]: nl80211: Drv Event 33 (NL80211_CMD_TRIGGER_SCAN) received for wlan0
> 2021-04-14T14:43:29.982629Z DEBUG wpa_supplicant[887]: wlan0: nl80211: Scan trigger
> 2021-04-14T14:43:29.982779Z DEBUG wpa_supplicant[887]: wlan0: Event SCAN_STARTED (47) received
> 2021-04-14T14:43:29.982920Z DEBUG wpa_supplicant[887]: wlan0: Own scan request started a scan in 0.000175 seconds
> 2021-04-14T14:43:30.082401Z DEBUG wpa_supplicant[887]: nl80211: Drv Event 35 (NL80211_CMD_SCAN_ABORTED) received for wlan0
> 2021-04-14T14:43:30.082704Z DEBUG wpa_supplicant[887]: wlan0: nl80211: Scan aborted
> 2021-04-14T14:43:30.082905Z DEBUG wpa_supplicant[887]: nl80211: Scan included frequencies: 2412
> 2021-04-14T14:43:30.083123Z DEBUG wpa_supplicant[887]: wlan0: Event SCAN_RESULTS (3) received
> 2021-04-14T14:43:30.083310Z DEBUG wpa_supplicant[887]: wlan0: Scan completed in 0.128655 seconds
> 
> This is to increase the scan_timeout with 200ms for this situation,
> then scan will not timed out for this situation.
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

5a10537cbfc5 ath10k: fix scan abort when duration is set for hw scan

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211026025902.26621-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

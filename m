Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19342C00140
	for <ath10k@archiver.kernel.org>; Tue,  2 Aug 2022 06:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQAi8VFxjfse9ZjDxEOENBy7V2DJy4RNuYmgfLWhEro=; b=FvBFDmde849QVG
	ZOPnn4/l+KCUKvinGEgnWffpNFIvooSC/dKtJektd+jQLpYDdDMxWvz7btZSr8lu4PN6UFUbZ7PLF
	dlYv8DeTpe10Q4j6BmOnuegDgT2g99F3oDhOYeswgthdFGMQ29gZ6789W79B27cL2cPCrPFWzvkUb
	Rq+DWcAh7adHmzrGQtGdyjB4Q+RJAdW3egjpoXSDJGSDjNQOOvebjJgCns2BUIZYh11ZHB4AfqpGL
	D5kNZVLiVqRPAfX/nJWBqnkLwl/GyOvtbhnit3CPTQ3L7CBBWqoseVPv0SEEySesrUGMdPUfErnUX
	oRE3oUDw23cxigkLgBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIlqn-00B8Bp-D8; Tue, 02 Aug 2022 06:57:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIlqh-00B860-Cg
	for ath10k@lists.infradead.org; Tue, 02 Aug 2022 06:57:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0978BB819A5;
	Tue,  2 Aug 2022 06:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F4FC43470;
	Tue,  2 Aug 2022 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659423465;
	bh=2ga5/i8pNVnB0/lRZCk3qam/9Qc9PPx04rhGzvzLMDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VlsEeq2HQJAwRH+Jv+PttEE5/RUZdqx1OH62A79W6oMAmrepCibUKEehZ9Cqnk4Og
	 hMUDGboF2Tn8LKru+T2fstsh4QzIa+7BwZ6WgGAZ/LoMaU6EjsHgO/HLUf8VuH1HGy
	 qnwrUNGqVG5CBd/8CA1jOgKOCmDz07WQdDDQh4+Bgk3P8vp0xf+eLpujVjYYSvBhls
	 qwKhaNHbfpfeOqxVAWvS+trQxZZy4yEslEz6f9xAF/4ja32GDg10pqG/org260CbQV
	 FMCclu+I1t4/i8h8iam3xHk6pGpVB/MU8JStDA6luDkbLDZmwc6BeCgkSrMytMglFj
	 PSnK+kQ9Cqung==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath10k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath10k: add peer map clean up for peer delete in ath10k_sta_state()
In-Reply-To: <20220801141930.16794-1-quic_wgong@quicinc.com> (Wen Gong's
	message of "Mon, 1 Aug 2022 10:19:30 -0400")
References: <20220801141930.16794-1-quic_wgong@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 02 Aug 2022 09:57:39 +0300
Message-ID: <87sfmfm8t8.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_235752_079475_E4FE4F4E 
X-CRM114-Status: GOOD (  13.79  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> When peer delete failed in a disconnect operation, use-after-free
> detected by KFENCE in below log. It is because for each vdev_id and
> address, it has only one struct ath10k_peer, it is allocated in
> ath10k_peer_map_event(). When connected to an AP, it has more than
> one HTT_T2H_MSG_TYPE_PEER_MAP reported from firmware, then the
> array peer_map of struct ath10k will be set muti-elements to the
> same ath10k_peer in ath10k_peer_map_event(). When peer delete failed
> in ath10k_sta_state(), the ath10k_peer will be free for the 1st peer
> id in array peer_map of struct ath10k, and then use-after-free happened
> for the 2nd peer id because they map to the same ath10k_peer.
>
> And clean up all peers in array peer_map for the ath10k_peer, then
> user-after-free disappeared
>
> peer map event log:
> [  306.911021] wlan0: authenticate with b0:2a:43:e6:75:0e
> [  306.957187] ath10k_pci 0000:01:00.0: mac vdev 0 peer create b0:2a:43:e6:75:0e (new sta) sta 1 / 32 peer 1 / 33
> [  306.957395] ath10k_pci 0000:01:00.0: htt peer map vdev 0 peer b0:2a:43:e6:75:0e id 246
> [  306.957404] ath10k_pci 0000:01:00.0: htt peer map vdev 0 peer b0:2a:43:e6:75:0e id 198
> [  306.986924] ath10k_pci 0000:01:00.0: htt peer map vdev 0 peer b0:2a:43:e6:75:0e id 166
>
> peer unmap event log:
> [  435.715691] wlan0: deauthenticating from b0:2a:43:e6:75:0e by local choice (Reason: 3=DEAUTH_LEAVING)
> [  435.716802] ath10k_pci 0000:01:00.0: mac vdev 0 peer delete b0:2a:43:e6:75:0e sta ffff990e0e9c2b50 (sta gone)
> [  435.717177] ath10k_pci 0000:01:00.0: htt peer unmap vdev 0 peer b0:2a:43:e6:75:0e id 246
> [  435.717186] ath10k_pci 0000:01:00.0: htt peer unmap vdev 0 peer b0:2a:43:e6:75:0e id 198
> [  435.717193] ath10k_pci 0000:01:00.0: htt peer unmap vdev 0 peer b0:2a:43:e6:75:0e id 166
>
> use-after-free log:
> <6>[21705.888627] wlan0: deauthenticating from d0:76:8f:82:be:75 by local choice (Reason: 3=DEAUTH_LEAVING)
> <4>[21713.799910] ath10k_pci 0000:01:00.0: failed to delete peer d0:76:8f:82:be:75 for vdev 0: -110
> <4>[21713.799925] ath10k_pci 0000:01:00.0: found sta peer d0:76:8f:82:be:75 (ptr 0000000000000000 id 102) entry on vdev 0 after it was supposedly removed
> <3>[21713.799968] ==================================================================
> <3>[21713.799991] BUG: KFENCE: use-after-free read in ath10k_sta_state+0x265/0xb8a [ath10k_core]
> <3>[21713.799991]

In the pending branch I removed the log level numbers, they just make
the commit log harder to read.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

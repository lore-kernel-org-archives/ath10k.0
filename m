Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449A5C433EF
	for <ath10k@archiver.kernel.org>; Tue,  7 Dec 2021 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAUoq8uPYkTdfdLxM7x41IIlzjebw4IuIUIW5okog38=; b=4QjlEkvKfksqxm
	+WwqCVX+svFt5x8ZWpmhD5veEHob3bWdoxMyL6sNOVXuEjZh1mBtyIg5ykA0DLdGAfpL4m4OvGWS1
	V7ReGN9Bf1lZLtGRwBFNqgZmNB3RFwK0rn/BJZFgzwTbc4ywVwUBQThZmJVAWS6mrmFBr8ZN42yRi
	R6VRsU0e3MkAuxpnGqLfYc+HnzZPhc9CnQmGiRrJMpUQmtlnROBo/1e82Xh3WTleu6RhPe1UXG4Ll
	sLH/IMOHaLDTM0afhfsUEaeBjXIDaaZviqCfnKb9qaY3Z46PZbC5421l069VofoI35RtCaHXERpV7
	+hUgMYfKM3TujrgXZaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muej7-009c7e-Uq; Tue, 07 Dec 2021 17:58:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muej5-009c6j-RN
 for ath10k@lists.infradead.org; Tue, 07 Dec 2021 17:58:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 36F22CE1D53;
 Tue,  7 Dec 2021 17:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A1CC341C1;
 Tue,  7 Dec 2021 17:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638899879;
 bh=fz2nEJk5rFpWz4JegCbvPXaQuPKi9Cp81JShqbULKqI=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=hS5wK5xnyEEFGjyO7T6SPiwH5fUqd9iLr4ZvN2fZFyKfYEWkTdS6qJT/68b1pMgrb
 WaC4G62Aj419ye0AEFeJd9zxigy6WeBIw4iTwClF27urKZlt66DZdkdlYZuf5BeQnk
 xl194dHnRFMdJYw5DF/DMyVtJN5VVeFzQkEnE3qbyNPnWFgEUDSI7pJ+UqA5RWEisf
 3i7JVCos8xBBmUOdnbzey2Rod52ADqqv/wTKDLjOSNN4uR70WWW7Z3RPJeISTNiiaU
 y/hbBOhp1VdQBhT4fXzHBg7g58QpNOwZCBT0/bxMoW0olgd4dPh9sJA64yoQnNtRi2
 7JOEZrskz/WTA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: drop beacon and probe response which leak from
 other channel
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211026025114.26313-1-quic_wgong@quicinc.com>
References: <20211026025114.26313-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163889987494.24891.11641687858291703677.kvalo@kernel.org>
Date: Tue,  7 Dec 2021 17:57:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_095804_105922_EEA8A117 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

> When scan request on channel 1, it also receive beacon from other
> channels, and the beacon also indicate to mac80211 and wpa_supplicant,
> and then the bss info appears in radio measurement report of radio
> measurement sent from wpa_supplicant, thus lead RRM case fail.
> 
> This is to drop the beacon and probe response which is not the same
> channel of scanning.
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>

Fails to apply:

error: patch failed: drivers/net/wireless/ath/ath10k/wmi.c:2610
error: drivers/net/wireless/ath/ath10k/wmi.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211026025114.26313-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

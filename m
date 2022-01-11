Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A35C433EF
	for <ath10k@archiver.kernel.org>; Tue, 11 Jan 2022 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNYUtTvLcyLvYd7QBvaFjjBWC2cltG+69yZmKsoZO4k=; b=YzQvNiJZExSzoF
	1GHMFwSL8nlXPSwIkRiVbiy83X85YS/wPYt3reHIKblnwfryMOd+o4vP/M3qevi0v2I/hNOnnUSM5
	nqf0tMoNpKl9Ebv/4/0RtPkXCyg9EtENd54vkk9kvmg0nIyRdm+wlNx7z+ysQ1yVCKFh6sO6aP2q6
	qEOx5DW9w61n4yPDWyM0y9rvGRm/AM/zSWJj8vkZOhRSXlTLCDxtYyIOtk7eXPVD0apwBfoQQYj4S
	7CnegQZ6GoY61J0Ew6kSFM838nZOjOOTjMGgtjz9yjHacLlytjZ4Za2cKcpNckBtkPMlHLGmjhSHW
	fGB6rx8WdGvpVxX/aZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7IAN-00GZVL-Lc; Tue, 11 Jan 2022 14:30:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7IAL-00GZUv-0B
 for ath10k@lists.infradead.org; Tue, 11 Jan 2022 14:30:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9E362B81AE7;
 Tue, 11 Jan 2022 14:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4D8C36AE3;
 Tue, 11 Jan 2022 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641911422;
 bh=3YbvXQFmoeKr2zfRncYcsBgKf0u9oU4rKKvV8f5NIlc=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=OYshFZk95oY2p64CHl23tb8JQMXUmqR8SN8OD5QPbpSMAFcIB28Jfr6hDkfrRe4XM
 /dP14IcarB12CBlctSPQJPhNgC8vNS1kfM9VfCif9Jh/oGqM7uw4/515lAruEMQ5AE
 q7/iF2lkIal3Ll43QxmrEzuZTzlOdX3h+lmtRM4u2vnT+Rou3XX1e0Qu9LbEwY6tW5
 szqYEuYHnHXv9OAzGZQ0fKoVBY18+g32yu1rtxaMcda3J9NvMdd0feE8RldlO6/HbN
 nYZ6htPbEbKpW8X3oWEQwT7t7ka6PtFQ2zZth+N8prlQ3K3jh5LIghFLgMraCpBDq2
 Ce6Y5t3Gv9NUQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix memory overwrite of the WoWLAN wakeup packet
 pattern
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211222031347.25463-1-quic_wgong@quicinc.com>
References: <20211222031347.25463-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164191141967.24158.14971399294793691071.kvalo@kernel.org>
Date: Tue, 11 Jan 2022 14:30:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_063025_218358_7DDDA99D 
X-CRM114-Status: GOOD (  10.58  )
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

> In function ath10k_wow_convert_8023_to_80211(), it will do memcpy for
> the new->pattern, and currently the new->pattern and new->mask is same
> with the old, then the memcpy of new->pattern will also overwrite the
> old->pattern, because the header format of new->pattern is 802.11,
> its length is larger than the old->pattern which is 802.3. Then the
> operation of "Copy frame body" will copy a mistake value because the
> body memory has been overwrite when memcpy the new->pattern.
> 
> Assign another empty value to new_pattern to avoid the overwrite issue.
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
> 
> Fixes: fa3440fa2fa1 ("ath10k: convert wow pattern from 802.3 to 802.11")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e3fb3d4418fc ath10k: fix memory overwrite of the WoWLAN wakeup packet pattern

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211222031347.25463-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

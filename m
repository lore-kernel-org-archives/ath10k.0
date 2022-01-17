Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20C1C433EF
	for <ath10k@archiver.kernel.org>; Mon, 17 Jan 2022 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFhKwxs+EqQV432XVr8s1szXIIDdAdB9T44h7t8ue4s=; b=LgI176U0+6boxh
	ZRsWQ2t2tqL40iPDaNMdlzkwa5s7mFPZ1gX0cuY1ts2MEgezZKztcEBbmfW4FMKVLUVzL3+wpTPQ2
	3lFBE+dt8WuUpBHzXfbY6Gc9Uoaz0MfJreQ5raM0gcDQM0v6ztdK3gXakJMsyuWY3Aj9XS1Umn20U
	GQFp76+bZJPi9/1n7lis1PWoml9v+RKD+18+Un3XkO0kWS/y5I12j7SQWHkddoB+LQs4huDXWkUpc
	c7+Cw7kgwNNwpqa2VmzIOWNsM7uAVqLalWvNA40PN2VdemaZmkxmVE6/TgdLp0goTeoJ+m8Ndz9dJ
	ADwkfl3VtqFabv5fs4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9ROX-00Ex2M-2k; Mon, 17 Jan 2022 12:45:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9RO3-00Ewrs-GG
 for ath10k@lists.infradead.org; Mon, 17 Jan 2022 12:45:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C6C7611BB;
 Mon, 17 Jan 2022 12:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6063C36AEC;
 Mon, 17 Jan 2022 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642423525;
 bh=diarlsjyUeuHowtNNVWY50r6KaQgdnsyfvtUVtB0cRk=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=f945m6NRc/sDfkf+EqVFH+3i5UY+QfdPJEs7DNmMrT2nYK5dlHe8sNrAIHRIKDEFc
 oGwLziwfH0szK9dYa3NBHuP/walWmjHKcL9qYhxZ+baYL2WDhxq9SVE2OfnkF+Vh42
 a2qW5V977A+51f7b2jEnMKm8iXY88b+lXN65bjXxMohMjrwDkqol1kLnMx8j6inM+0
 g9eCP0GAkFl1WRotqMa7DoNC+xZee7VfVHmLtUNUIQxXbFE2A97c+yPipkts34dwK+
 dMBsSpUYrvcvbrSDVMGsRoQXzurLUqPBzNfQvKvFESmSQSbuND1txI4fHXLplYBl/V
 ZxfG9qBiXpJVg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: abstract htt_rx_desc structure
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211216151823.68878-1-franciman12@gmail.com>
References: <20211216151823.68878-1-franciman12@gmail.com>
To: Francesco Magliocca <franciman12@gmail.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 enrico@fracta.dev, Francesco Magliocca <franciman12@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164242352076.27899.16661550947975191712.kvalo@kernel.org>
Date: Mon, 17 Jan 2022 12:45:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_044527_617373_CFDBF2AF 
X-CRM114-Status: GOOD (  10.50  )
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

Francesco Magliocca <franciman12@gmail.com> wrote:

> QCA6174 card often hangs with the current htt_rx_desc
> memory layout in some circumstances, because its firmware
> fails to handle length differences.
> Therefore we must abstract the htt_rx_desc structure
> and operations on it, to allow different wireless cards
> to use different, unrelated rx descriptor structures.
> 
> Define a base htt_rx_desc structure and htt_rx_desc_v1
> for use with the QCA family of ath10k supported cards
> and htt_rx_desc_v2 for use with the WCN3990 card.
> 
> Define htt_rx_desc_ops which contains the abstract operations
> to access the generic htt_rx_desc, give implementations
> for each card and update htt_rx.c to use the defined
> abstract interface to rx descriptors.
> 
> Fixes: e3def6f7ddf8 ("ath10k: Update rx descriptor for WCN3990 target")
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
> 
> Co-developed-by: Enrico Lumetti <enrico@fracta.dev>
> Signed-off-by: Enrico Lumetti <enrico@fracta.dev>
> Signed-off-by: Francesco Magliocca <franciman12@gmail.com>
> Link: https://lore.kernel.org/ath10k/CAH4F6usFu8-A6k5Z7rU9__iENcSC6Zr-NtRhh_aypR74UvN1uQ@mail.gmail.com/
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

6bae9de622d3 ath10k: abstract htt_rx_desc structure

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211216151823.68878-1-franciman12@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

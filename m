Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C209C433F5
	for <ath10k@archiver.kernel.org>; Mon, 21 Feb 2022 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uYt+xUdYLF/EXlRUDrv0V+MBPNc56a0J5oGTVn6MBo=; b=ugPbhvpwk47K0o
	K9i+biWcINQxoczTt90YWX7nwWP8KgUsqXdSlQnvAIH97jnQYDkydmiQFpjPqtEm/PSS7UAvC6Sgm
	tizwSpH249Nqokv0t8s7cKR8B4tlyTIiW0sDJ2dw/VODmFVv9CWhCz34jeKQg+Wxye27AwF7gJonV
	m4GcG2ndDS8tbscVlHmWkKA7cyiOMDuTdmOKx3lipUbOCc93kj8WsMA5jlQJFLb5JTqzmHTtEROAz
	fjeikMk81o1eZcGPlPP6ljEIgJOC7YI80tKFjHPY35eLF15PfLHTZkO5c5S0hgT6NphoqxlkZf/Rb
	mruR2BurSVvRrShHvJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM6K9-0058iD-SG; Mon, 21 Feb 2022 10:53:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM65W-0051Jr-T5
 for ath10k@lists.infradead.org; Mon, 21 Feb 2022 10:38:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A634610FB;
 Mon, 21 Feb 2022 10:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E85AC340E9;
 Mon, 21 Feb 2022 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645439917;
 bh=k67oTdFxyxFIxvYJ9Sn6gF8YVh449cAmOqjQ8+8GbgQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=vRrgryJeNAKoZb19AT5jv/LYNeQClPvQBT2qVAU5/n8hoWfWffXPOSUwkUDTeCt1S
 e5FLvn+kMuI/MmVOE4ti1hNwolDhwnI1WoI74icB902bykFiofFqEZ1MjgpxF4KMUR
 HtUFyhkyfxRexQ0gE+YMaEsvWfccS9GUli/L6DNB1ODHjgr87mtg2cZdUCfsTWjfzz
 Zapq1Z0nPfnUhbJZmUvJ+tnnNcjDjeOJb5TNGV5Qp5nAd6Ob2p56zKRnDptSv9rvkB
 3HXeg/Syt8lDSgESAERVtrZCJ/A3Xac8sIZ4SKp35iZ690kvhWtrHHPwjQG0P1bam5
 YLJCiJUnsFevQ==
From: Kalle Valo <kvalo@kernel.org>
To: Francesco Magliocca <franciman12@gmail.com>
Cc: ath10k@lists.infradead.org, dan.carpenter@oracle.com,
 rmanohar@qti.qualcomm.com, 
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath10k: fix pointer arithmetic error in trace call
References: <20220219113257.5459-1-franciman12@gmail.com>
Date: Mon, 21 Feb 2022 12:38:33 +0200
In-Reply-To: <20220219113257.5459-1-franciman12@gmail.com> (Francesco
 Magliocca's message of "Sat, 19 Feb 2022 12:32:57 +0100")
Message-ID: <87r17wwlli.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_023839_023308_66116CA8 
X-CRM114-Status: GOOD (  19.86  )
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

+ linux-wireless

Francesco Magliocca <franciman12@gmail.com> writes:

> Reading through the commit history, it looks like
> there is no special need why we must skip the first 4 bytes
> in this trace call:
>
> trace_ath10k_htt_rx_desc(ar, (void*)rx_desc + sizeof(u32),
> 			 hw->rx_desc_ops->rx_desc_size - sizeof(u32));
>
> found in the function ath10k_htt_rx_amsdu_pop in the file htt_rx.c
>
> i think the original author
> (who is also the one who added rx_desc tracing capabilities
> in a0883cf7e75a) just wanted to trace the rx_desc contents,
> ignoring the fw_rx_desc_base info field
> (which is the part being skipped over).
> But the trace_ath10k_htt_rx_desc later added
> don't care about skipping it, so it may be good
> to uniform this call to the others in the file.
> But this would change the output of the trace and
> thus it may be a problem for tools that rely on it.
> Therefore I propose until further discussion
> to just keep it as it is and just fix the pointer arithmetic bug.
>
> Add missing void* cast to rx descriptor pointer in order to
> properly skip the initial 4 bytes of the rx descriptor
> when passing it to trace_ath10k_htt_rx_desc trace function.
>
> This fixes the pointer arithmetic error detected
> by Dan Carpenter's static analysis tool.
>
> Fixes: 6bae9de622d3 ("ath10k: abstract htt_rx_desc structure")
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
>
> Signed-off-by: Francesco Magliocca <franciman12@gmail.com>
> Link: https://lore.kernel.org/ath10k/20220201130900.GD22458@kili/

Please submit v2 and CC also linux-wireless, otherwise patchwork won't
see the patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

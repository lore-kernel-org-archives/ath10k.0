Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A390DC433F5
	for <ath10k@archiver.kernel.org>; Tue,  7 Dec 2021 18:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bzs0wh0J6pn849OfrTpfu6JrrIV/UGM4bOy69xCl24A=; b=ifW+0RrZcqystp
	a+k4k1pjZAxlqVUGFu5iMJNBGpkfRzjW8dgR6TPNyfNLINK6jXhxEZ33Nq3lwcR5k1nVDBZhaCHut
	6gHMRQ5P7XtQrWauhQw7fHyckWiC2GdgHJq/7vPKLfxx25BreKrweBsXRkEaTez9FC4+yO+rtjakL
	HIZ8uiyCMKQUzf6apHRK1D8HTMcVHEcqJd4bXQxqrNZu/MPwCzBzD5FWMZkNfOKH+jsj7zKlBTr5Y
	LYfkCI22dqO5HtpQae7ZLPveo8ktMOs3R6iKEA20tuMxDtCACRlDENgrqu15IjWudvbcbVLHrKlrE
	kKzfnriiXyfjjucS2qJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muemI-009cbq-2S; Tue, 07 Dec 2021 18:01:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muemE-009caN-VR
 for ath10k@lists.infradead.org; Tue, 07 Dec 2021 18:01:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 48725CE1B1D;
 Tue,  7 Dec 2021 18:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A323C341C3;
 Tue,  7 Dec 2021 18:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638900066;
 bh=d1e8wK8u23dH/uMREW1nl9bpvWdgauhYNxNZbO1wBPs=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=K4Ir9RhSzDymQjcuSQ0VMIcEacHXj1wAeNk36gHVe/d8TXrhJNMbVIq+GuW3Akjq3
 6ylpy0lggF3XV+72yaS5owaC3+vZQZWV9Zu/oIOEMUYgpjsxx1tz75+PobsXtdAtpi
 iEkqUqwC48LhOapGw0ASAAaq0WeLI5vX/ohixcfQi1xp88ZMffMPHirAXdbRadByH2
 EVWpXFoQbL/GjnyFmNrObv/my4/hh4rYUWBxc9I/ZkPvnnh4NRIibP09Li6YIIDC4Y
 Gx2wURZ1MY/Fz8qOnuI+BSeaPR4eppjh7cNKui4HHLcBH9U9HTlAhkPduIVTtcgdJS
 cG0cNzuRuMjMw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: abstract htt_rx_desc structure
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <CAH4F6us6kLs4WZVKVNQV69wZ=BA2AzOyacyKLB3RfVme=9uKvA@mail.gmail.com>
References: <CAH4F6us6kLs4WZVKVNQV69wZ=BA2AzOyacyKLB3RfVme=9uKvA@mail.gmail.com>
To: Francesco Magliocca <franciman12@gmail.com>
Cc: ath10k@lists.infradead.org, Thorsten Leemhuis <regressions@leemhuis.info>, 
 linux-wireless@vger.kernel.org, enrico@fracta.dev
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163890006140.24891.14844374347226252991.kvalo@kernel.org>
Date: Tue,  7 Dec 2021 18:01:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_100119_220083_A366CAB0 
X-CRM114-Status: GOOD (  11.60  )
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
> Define a base htt_rx_desc structure and htt_rx_desc_qca_old
> for use with the QCA family of ath10k supported cards
> and htt_rx_desc_new for use with the WCN3990 card.
> 
> Define htt_rx_desc_ops which contains the abstract operations
> to access the generic htt_rx_desc, give implementations
> for each card and update htt_rx.c to use the defined
> abstract interface to rx descriptors.
> 
> Fixes: e3def6f7 ("ath10k: Update rx descriptor for WCN3990 target")
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
> 
> Co-developed-by: Enrico Lumetti <enrico@fracta.dev>
> Signed-off-by: Enrico Lumetti <enrico@fracta.dev>
> Signed-off-by: Francesco Magliocca <franciman12@gmail.com>

The patch is corrupted and I'm not able to apply it.

error: corrupt patch at line 19
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/CAH4F6us6kLs4WZVKVNQV69wZ=BA2AzOyacyKLB3RfVme=9uKvA@mail.gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

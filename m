Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9726C3DA4A
	for <ath10k@archiver.kernel.org>; Thu,  8 Aug 2024 05:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oah9Nsq2vtusdmmG6mZW8kyy4H0tJbga5lN6BsaLcOM=; b=YZwgdkjFQ4A4rOkHb/KYjVQ02r
	HUXyYivBdF9mT1W4P6qlew9KWV9cYimH0RWGmzk3EvTxnn0Ks+x4KKS15txBDa7UMAe3mQgmTTAhD
	08eGu53SeF+vXEkvIDa52K0HanA8JgmrFxxwX9T5SEgQacX8UvR2NEsKd/T5cGbZ606wyFW2W13+w
	WASYcXp0gPbHiIH+RiJKTQ9iqfFuPzjtHQrjGn38fyMO3SRjownEy5b0/IGqKlnZvrDlPNceNfMZI
	NAfBCkbc50+B8AtPJINK8izFMjf40NI5YTVjZf+Eh7DLBJczU2DA0vOqdFlhQ/oSGVEKBB3BbLLeL
	+ouEkpOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbvT8-000000076b6-1AMp;
	Thu, 08 Aug 2024 05:13:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbvT4-000000076aW-42a2
	for ath10k@lists.infradead.org;
	Thu, 08 Aug 2024 05:13:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 427E5CE1177;
	Thu,  8 Aug 2024 05:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EECC32782;
	Thu,  8 Aug 2024 05:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723094020;
	bh=XDWKiKw680UJ/nB02bQsAOwQGdekxTDwsxI6MBT1WIA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=f+w0BUkorOcoarbcE49MOwrzjLqg8bVbdLmVjcf9DbsEuXXmQYQ596Gt/m8HL2i8T
	 PmCxFA1q6z5fu4/bD7nm85uZLtLs/AhoHvaAhqE8hYwJL+RBVG8dJTWNI+bdJue2zs
	 DWBoBSOOGQW1pJU6OVCUcg07Kf5fL5ChfPGEsE2q7G3RS+e+cC4LymSBDRVna6Yjx2
	 q/p7dbdKRQAJv630LpjdLPlYbIt3b+PKVNfUh7GCrhzIdE6X3a1F52nGG1tVvTdZra
	 BVxjwZgTCRYtCnUKR+Mu0j3kzBPXlQ9mXLOJ8xRNZ0Db/NgJYKhkO7Wt9jgkhiw9CX
	 KbuXZOfwwIF8g==
From: Kalle Valo <kvalo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Johnson <jjohnson@kernel.org>,  Ath10k List
 <ath10k@lists.infradead.org>,  Aditya Kumar Singh
 <quic_adisi@quicinc.com>,  Baochen Qiang <quic_bqiang@quicinc.com>,  Kalle
 Valo <quic_kvalo@quicinc.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ath-next tree with the ath tree
References: <20240808104348.6846e064@canb.auug.org.au>
Date: Thu, 08 Aug 2024 08:13:36 +0300
In-Reply-To: <20240808104348.6846e064@canb.auug.org.au> (Stephen Rothwell's
	message of "Thu, 8 Aug 2024 10:43:48 +1000")
Message-ID: <87bk234mwv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_221343_197926_F7244335 
X-CRM114-Status: GOOD (  16.62  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the ath-next tree got a conflict in:
>
>   drivers/net/wireless/ath/ath12k/hw.c
>
> between commit:
>
>   38055789d151 ("wifi: ath12k: use 128 bytes aligned iova in transmit
> path for WCN7850")
>
> from the ath tree and commit:
>
>   8be12629b428 ("wifi: ath12k: restore ASPM for supported hardwares only")
>
> from the ath-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, the fix looks correct to me.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


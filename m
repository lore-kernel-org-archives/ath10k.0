Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F5DECAAD8
	for <ath10k@archiver.kernel.org>; Fri, 16 Sep 2022 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etkK0cFROs4ZcSyUcSb0HWF1+Bz60R9WSiydqcASck0=; b=qkim8+B/kShTqD
	r9KIYZDRz/18tPOYocHfRW85CEo+Jgoj8fg0I1aKNghrHzB0w89uHmDTe4J5em8C5Oo5rwThcJBXf
	fgxt9cI0bzEwHU5Jhn3vFnaWKmB9QkCV3r7ZvCxY1godIGhhiVLF0wOpJjoMGSwPEiX3fKlCLU3cm
	7XO8EiA8Ch0Hpfg8MX5dgi1T5CjebwYlBQ1GbNw93uFouT7zWz2YYleb8c2PdhGP4rWVxU92OWPH2
	TXYW3UXyQPxEBGJFsWqS6OJiQh4XNoIgOeEGUFqr6qpiCuClK00S9ALlLSiAli5K4080vB7wN+8ir
	B6OL14Umw3yGc4hr0log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7V6-00BckW-Ex; Fri, 16 Sep 2022 09:19:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7V3-00Bcig-4L
	for ath10k@lists.infradead.org; Fri, 16 Sep 2022 09:19:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C3D2FB8249C;
	Fri, 16 Sep 2022 09:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98032C433D6;
	Fri, 16 Sep 2022 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663319942;
	bh=aiE0aNs/n84c+xuU+XoKoBmHaYfUU8+iVr1pUZCDPTg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ZMb2L73zBT8/jNipi1PHoOjPT+X2yU5J6G9Z5JPRUSLmShMm58j55f74drDjCDLO6
	 5rXCGi5Hf1WKQwCMSSJT2VX+8LrBJTdgwlCD9IZR9VseqrgbGh8AsKGa5SftvHybGP
	 NFqSZBB0GE4Eu4X6OQc/SxG3917mT/p9ofJyvAjT4AIly7tP7WtHLjLKSqBJcSBrle
	 S8JwCrbsPHTkCXndH6RMGM3PZFM5fJxHDkM5MKQsRZF8Ky3SH3X0sFDb+UwpnbuIf6
	 5sstBBHiRv81lIn6fUYOtVwgRB2L0YFZMnjP6U/kLHqE3tcg065sV0S+JEFGynbsnB
	 4//V9RSeRZiSQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: Fix miscellaneous spelling errors
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220909145300.19223-1-quic_jjohnson@quicinc.com>
References: <20220909145300.19223-1-quic_jjohnson@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, <ath10k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166331993629.3127.6990826637982175822.kvalo@kernel.org>
Date: Fri, 16 Sep 2022 09:19:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_021905_359343_997126A0 
X-CRM114-Status: UNSURE (   5.72  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Fix misspellings flagged by 'codespell'.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b8a71b953653 wifi: ath10k: Fix miscellaneous spelling errors

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220909145300.19223-1-quic_jjohnson@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

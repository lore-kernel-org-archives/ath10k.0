Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2E5C433F5
	for <ath10k@archiver.kernel.org>; Mon,  2 May 2022 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnNfZy+yXMIc7tdEY+cX1Nsl2NYSFILPau+rdu1ZolQ=; b=a0tLTcEwd1jqW2
	Rg8gLuN+vFyqpqfDk3iNQBTqnP/uEUw9fVRSfLP4FHCsOccXu8g/Kox3PCbeMU+mLBh7zaGld7FRB
	M+YR6L7YE2dzFksxfwJk8WgXEi45QDGhDIBCT6abjhg3/Y/d5i2GbkpLallEDn3R7ZpGj4okR6PMs
	u3z5HyslUpwXmVr6iC5a1/1gYkXoYwmT3mc5oYWWwAFdc0QUlWYipxIJTWysksnPYcWwK8eEbo5mG
	o6sSZhCPlcKbYjRrDfpxLT/ghBCChR9PsdSO/dsDf8O+T5blF5XNn4PHL58V2V9qwhKZzM8Nz4EEx
	1LKfwWCexQhQKne1pp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlWbM-001KhX-Iz; Mon, 02 May 2022 14:00:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlWbI-001Kgy-SM
 for ath10k@lists.infradead.org; Mon, 02 May 2022 14:00:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65A3C60BA7
 for <ath10k@lists.infradead.org>; Mon,  2 May 2022 14:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A22C385A4;
 Mon,  2 May 2022 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651500031;
 bh=Kdi+0fTwzL/PkfV5aJDO2b+5i3BnraJliQJBvXkWYT8=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=n6Nn4aJP7+ktUx/3/V6gu+foCSSGxQSXt/2SnyM55J87BtGX++l5P1689QHMc3Spg
 DcK1RXXyGsGtl9D6JiV62U4Pp8O1E3Uy0wpFhHEZdRnV1z/V011si5KCNgh3lY3j7n
 2TngyGN9dPVI2CtuhTR12MmyAucjvGpDjWGqwBrGVxKf0fWcLF/5NDNQPj5qvleC3/
 6+JbwR5+a8kEsCZE3PaGh7qi9ZW0MedYXIrnJjKoPgo9sfzjPCqlmZyw3tYK48IRw0
 wjCfEOJmfxpnEcL9qvohaoOSpWQMeB0H0da2KCI8mDYfZ43nutaVPY4+worIgfbAJw
 j08N4Cz4F4UxQ==
MIME-Version: 1.0
Subject: Re: [PATCH wireless-next 2/3] wifi: ath10k: remove a copy of the
 NAPI_POLL_WEIGHT define
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220429174643.196994-3-kuba@kernel.org>
References: <20220429174643.196994-3-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 ath10k@lists.infradead.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165150002658.16977.2818999103130463906.kvalo@kernel.org>
Date: Mon,  2 May 2022 14:00:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_070033_006185_D2FB04FF 
X-CRM114-Status: UNSURE (   7.41  )
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

Jakub Kicinski <kuba@kernel.org> wrote:

> Defining local versions of NAPI_POLL_WEIGHT with the same
> values in the drivers just makes refactoring harder.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

52bcfd1b239b ath10k: remove a copy of the NAPI_POLL_WEIGHT define
3b3299a1080e wil6210: use NAPI_POLL_WEIGHT for napi budget

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220429174643.196994-3-kuba@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

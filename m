Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E2BC433F5
	for <ath10k@archiver.kernel.org>; Mon, 10 Jan 2022 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9Vufr8XVfNYqBy5R3TXm0vcsbysP6WNTPdsciPvpao=; b=iF7SGClLcnOBym
	wEUXBfwQndow5+dtH87ykzwkQQDVs53yX6iUYq0UMO/qZQ6Ma8yb+HCnNKQLPyvoMAyEftg/rFYVu
	G8TbkJWXBQfIYaWcIVZ0veB3jy0mlgAzo3x81L400UfnbYSZHDjObkxkyFAnIO8TteQYnaUrja193
	RJt3zmxe4HEMP0SIXVe4oBijeoYHMBZcz55ck8nL99ELJDGXfSm7Z8hgKRA0KlammwXcvsU+PCQMU
	uTLShp/T7tA+Yl8p6JGXU7r0OFMFlEqyRv01BVMKWFtk/AvXPJfAwiFN34+RW27QYbg9s9mg22cex
	TLP91IBVLv//n0Hmr+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rkp-00Ajiu-K2; Mon, 10 Jan 2022 10:18:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rkm-00Aji3-QD
 for ath10k@lists.infradead.org; Mon, 10 Jan 2022 10:18:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC308B80E3F;
 Mon, 10 Jan 2022 10:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A40C36AEF;
 Mon, 10 Jan 2022 10:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641809893;
 bh=BZo15StAkByqX0uv90iAfnL4AMqF0l/eyPPVS/zwN2Y=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=r5ugoXVB1Q2HkO2wPGFs6AG7AX8wjlsIbb5k++SVMklThxdH5xYLo8PZG1WLfGt42
 bN5D+G9vSG7ki/+C1qqZJKsOQl9Z3WJd7DzCqm5s0xYLDpXT3dpn/osblvdYVohqe9
 6g1WLRBNn/M1PY1O66EkRXQSztAVWRBOoFj/3IxkP3oJKwXvR+R0D9ZjzSDx+nAs6x
 8PVEVm2VhcBxmjBrWDbMpad+EpeCnWc6x/SEkQ0mv+AOq9QGgeZH3YDWCG9WadMwIG
 7uaqN5lqHzu3EStFQ1IWk5lwPiLhaRIBNps84hNkDATFrFCoJ9g1D520e845+fg/ye
 z5/NE6nEmxQgQ==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: dianders@chromium.org, pillair@codeaurora.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: [PATCH 2/2] dt: bindings: add dt entry for ath10k default BDF name
References: <20220107200417.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <20220107200417.2.Ia0365467994f8f9085c86b5674b57ff507c669f8@changeid>
Date: Mon, 10 Jan 2022 12:18:08 +0200
In-Reply-To: <20220107200417.2.Ia0365467994f8f9085c86b5674b57ff507c669f8@changeid>
 (Abhishek Kumar's message of "Fri, 7 Jan 2022 20:04:31 +0000")
Message-ID: <87pmozvqqn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_021817_041616_6D76207F 
X-CRM114-Status: GOOD (  14.19  )
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

Abhishek Kumar <kuabhs@chromium.org> writes:

> It is possible that BDF name with board-id+chip-id+variant
> combination is not found in the board-2.bin. Such cases can
> cause wlan probe to fail and completely break wifi. In such
> case there can be an optional property to define a default
> BDF name to search for in the board-2.bin file when none of
> the combinations (board-id,chip-id,variant) match.
> To address the above concern provide an optional proptery:
> qcom,ath10k-default-bdf
>
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> ---
>
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 4 ++++
>  1 file changed, 4 insertions(+)

Please CC ath10k list on all ath10k related patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

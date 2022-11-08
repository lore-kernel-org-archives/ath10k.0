Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D148C4332F
	for <ath10k@archiver.kernel.org>; Tue,  8 Nov 2022 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhEVlzFqvKm95UmzrNne0IrwiretwIr3XRsCw4gmlhE=; b=ss5F6im5U7KZ/v
	RJMY/4Rsged9BA2aSmyMSKzxuGW04awzf/kjmLy4LmQ/KIt4SSNYG3YSp9f5vxQSOX0lT+f9MxgqC
	httYNdIHdX1Qraon/d4JCyDBA4BbYxR7DeMoSFrpPk1TP0ajj27QV2shRDFEtU8NVMX08xsQd8iR6
	0GGyTNhfwAq5TPuUxc9+ck6ccA3HFoqkAoviFFP+j/kZNyzSvYHOpkFtIn5ygeL/vf4PGGX1D2XBK
	ZrFXBRypbNrxDT/04yyFZWjzKKQxXFqT2Q65t5u125HA4Fu2l4ukjh2+iqVSUPlYT1ZWezIdVtNNv
	wi5syuRSmTouc1qyMJrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJCj-003SlN-W7; Tue, 08 Nov 2022 07:39:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJCg-003Skf-Qb
	for ath10k@lists.infradead.org; Tue, 08 Nov 2022 07:39:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A45561479;
	Tue,  8 Nov 2022 07:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8171FC433C1;
	Tue,  8 Nov 2022 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667893164;
	bh=bTfnB6EcwsGLzj9IXfp53wlX77b240UHcHwLQ+HQpZU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Y/DFi/DD/MSlII3DS9DdtUs52h1KXDBl3hug/F1aJrgh6RR+ouBCB5KD8u8QHXBKV
	 YSbOdDNj3IFCiHQHbcYLg+Ce/TTl/KaVNcQQjDWcxAVvPiJm7DLRveI6LbwYyXykdc
	 mu308Xxsms2jv+BFJnuLHLZIf7j9nuJDRC5vZ/9pcj6JirIeegKYxsskRIKI4ux/Cy
	 7a2Zqeqi2xyj00KwPCP5MJAgFmwrbR6z/9UDf2x2o1pkRD9jIjturKidQCQ0rcL0Mo
	 SZrTOkEZTGkvdr2MoqzZqYuw4nRde0bAX1e6htCqUAAKDLrcVR32Nm6xV5W+tw03GS
	 iojyJSrF104lA==
MIME-Version: 1.0
Subject: Re: [PATCH 02/30] wifi: Use kstrtobool() instead of strtobool()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To:  <1ff34549af5ad6f7c80d5b9e11872b5499065fc1.1667336095.git.christophe.jaillet@wanadoo.fr>
References:  <1ff34549af5ad6f7c80d5b9e11872b5499065fc1.1667336095.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Amitkumar Karwar <amitkarwar@gmail.com>,
 Ganapathi Bhat <ganapathi017@gmail.com>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>,
 Xinming Hu <huxinming820@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166789315924.4985.15656557899615153469.kvalo@kernel.org>
Date: Tue,  8 Nov 2022 07:39:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_233926_945288_BFD0D283 
X-CRM114-Status: UNSURE (   9.39  )
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
> 
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
> 
> While at it, include the corresponding header file (<linux/kstrtox.h>)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied to wireless-next.git, thanks.

417f173532cc wifi: Use kstrtobool() instead of strtobool()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1ff34549af5ad6f7c80d5b9e11872b5499065fc1.1667336095.git.christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

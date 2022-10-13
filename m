Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4FCC433FE
	for <ath10k@archiver.kernel.org>; Thu, 13 Oct 2022 06:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4f6YczIxnMNJ/OCg2r9ajKIwCSYqi6R1ZicmWScE7t8=; b=Rvefn4+arkPJNb
	WpTRymUHOQD/XQBdFKmQWcxb8mOYPG/X3xLJYI8lMTF/xLN/SMgsXH2Ln5VEdY1EOmLd2Rhzgs4sW
	hKwdLe426quhNuHxXKRA4zCLwnkqBm/iwf70lSNpTKTjloFa8eoH2lq5N+LYpUr2cCvcCAS/9l3pD
	JzW5tsll78miZ/XtyMsSv/Y6yT6fX9MN/QCtK/iF6R/8n4iyWMADS8hVICiMwdG4wPrZDU+cBYm0P
	OqcHmwvOnPcn/I31VqMDohDyHNgx1f8P74kAyaMIYuzQD17UDX/B92IK04SMRneMjN2e8DHbZdck/
	lsw5KVtUT3r91WvRqPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiraj-00ApxV-Tu; Thu, 13 Oct 2022 06:21:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oirah-00ApvU-3E
	for ath10k@lists.infradead.org; Thu, 13 Oct 2022 06:21:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A3A1CB81CC2;
	Thu, 13 Oct 2022 06:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E38BC433D6;
	Thu, 13 Oct 2022 06:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665642066;
	bh=Bwb+BgWIiWUfcFQmLH+wu7qHsq3YyIot3Bf4iOUxlo0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=IUKGpHWVe95nt+aTub3tQEFM3adfLRl2vxXekWcTccAFzZV1/uYO7RPCK4ApbNq04
	 otO6mhE/N24UCT+JGHj3QK7I6ll6vWjh6jDJxYw+1WrIc46xuidNF77BO0fyXsivRd
	 HR5g/RKOyCcbmPoPALv8XvwX8cXyKYrDoJjV0wsBxZ2zzyxUwj+5oEUfbpMcN9tj2r
	 j/UpRCsTOdKXEd4fjxdNpimQ44vKyE7af2aA7VkeWqj3ODdEericyCWU4KZUmiI45l
	 Mc20F+rep2s4d/5fEKbxtDEULQ5f6if/h15Mis16gVwaWWBDuH4L0hn2z3IfXIp89o
	 HC9B+AsUHxqtQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Check return value of ath10k_get_arvif in
 ath10k_wmi_event_tdls_peer
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221003091217.322598-1-pkosyh@yandex.ru>
References: <20221003091217.322598-1-pkosyh@yandex.ru>
To: Peter Kosyh <pkosyh@yandex.ru>
Cc: Peter Kosyh <pkosyh@yandex.ru>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166564206242.7747.3762641081323577228.kvalo@kernel.org>
Date: Thu, 13 Oct 2022 06:21:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_232111_312773_B3193529 
X-CRM114-Status: UNSURE (   9.48  )
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

Peter Kosyh <pkosyh@yandex.ru> wrote:

> Return value of a function ath10k_get_arvif() is dereferenced without
> checking for null in ath10k_wmi_event_tdls_peer(), but it is usually checked
> for this function.
> 
> Make ath10k_wmi_event_tdls_peer() do check retval of ath10k_get_arvif().
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Peter Kosyh <pkosyh@yandex.ru>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

473118917cc3 wifi: ath10k: Check return value of ath10k_get_arvif() in ath10k_wmi_event_tdls_peer()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221003091217.322598-1-pkosyh@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

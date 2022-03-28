Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3E5C433F5
	for <ath10k@archiver.kernel.org>; Mon, 28 Mar 2022 05:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1nRIm92eDBbz0Guif2r+OcIu/gYxKnmvkIQEhpNaqg=; b=j9HaadgmdOgeKm
	YZG4+V9Ons8YzTxXPGoK0HOa7ZF+1ooirYGCIg85B8ExyJl2IYQK4gaQg3KCxDWnmMXSLRm7oVrlf
	UgS5+tL4VUZ7kXiQJS6GKPhIDSCNdoJcc0jfpLoYiyLHB2pOpWC3VhOnaA/iFnowNrYGTLXHTslTZ
	W8UqJnvriIOaG8WlhHj9+nFWxRcRp/0IvBlONDR/NDSluDKz3yulekBqYhH97MWhkJF+ZQLpeIKwN
	ZF9xBpxEBi8+MJPbjXg0tx5Yf4a1yNLmg0xJ5peHpn5rl/96XLKrDdscxDwXZ0j9ykgTnibXnYBVD
	wy7FKvsxoBEJ+HjJo3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYhvr-007L4h-M1; Mon, 28 Mar 2022 05:28:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYhvp-007L4P-AS
 for ath10k@lists.infradead.org; Mon, 28 Mar 2022 05:28:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1EC4DB80DAD;
 Mon, 28 Mar 2022 05:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CE8C004DD;
 Mon, 28 Mar 2022 05:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648445321;
 bh=qXT1RYdRQWNvWIkjhT87RVxW12795qxkxnxn8PZSQfs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=aqK1klfmvho6ViPfpW1Cc+uiQIndShUr0QP79ovz5SbKaYm0dolznTLIo0TGZumV5
 5t4PIu2PBHsFP9H54YQDvmgrgjiMt/3h0rkCiPl/ADZnqOo/qUwfQTHnb8S0u0Ly1S
 czGdH7hJMQCQa1iaBDXB7sWF+CSK/57lR5m1mQtuBkQlXcMR95tNO56KmLkIUFKRPz
 6B8SMEmLtMreWXWYbcbPLkX9M1aC/U4u0drR6RtUcOkm2sAAbVMNAFIREInauod42q
 WMjhUEHXBO955mjN5eXVstT7aLbMu4SsuT48d+lO6QYHchdD2VkP13i+yw41b73KW3
 gfLcLrtlZyLoQ==
From: Kalle Valo <kvalo@kernel.org>
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 davem@davemloft.net, kuba@kernel.org
Subject: Re: [PATCH 1/2] ath10k: add support for MSDU IDs for USB devices
References: <20220327171340.7893-1-erik.stromdahl@gmail.com>
Date: Mon, 28 Mar 2022 08:28:34 +0300
In-Reply-To: <20220327171340.7893-1-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Sun, 27 Mar 2022 19:13:39 +0200")
Message-ID: <875yny1w8t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_222845_558514_E216C021 
X-CRM114-Status: UNSURE (   9.25  )
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

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> commit 93bbdec6683e1c8ba2cc4e6 ("ath10k: htt: support MSDU ids with
> SDIO") introduced MSDU ID allocation in the htt TX path for high latency
> devices. This feature needs to be enabled for USB as well in order to
> have a functional TX path.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

On what hardware and firmware version did you test these patches? I'll
then add the Tested-on tag:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

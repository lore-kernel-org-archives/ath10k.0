Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A651EB64D7
	for <ath10k@archiver.kernel.org>; Fri, 16 Jun 2023 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JQsHS4J8s1eQDB8W7aZ66KRsDKc9OtxArS3Zllwhmg=; b=V9tQjG3VP8dC6H
	xgyWP/RQu/k6oZwGtf60lpzrUcif76Dh9o8284rK1codIqJo16d/yvdomGjaaROdm3F+2yUCxf4kV
	sy3VdaQhEVP30W9zbu8XBCJbTJlyjPY11DV2emq7dzC+3raD/nTx0L7wos33k8V6RKuB5KyxviCVf
	5i1tO+o/P98y8gQU9D7yqMRp6O4n5qgvjEATDnUPkdUJhVuDRImpMJpBvXPYdB8C13NWTqeQKumm2
	4tgnF5ZACiiGRlKiwzyXLXhBwSkH4pMivfQBoi/vUe6hjcEsKjSKZmsYrk+RAbI5UjAwWoOkM391X
	1/hbzbkz7gaTIdLeJemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAC8W-0015IE-06;
	Fri, 16 Jun 2023 16:17:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAC8T-0015HO-11
	for ath10k@lists.infradead.org;
	Fri, 16 Jun 2023 16:17:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D505561479;
	Fri, 16 Jun 2023 16:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2B5C433C0;
	Fri, 16 Jun 2023 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686932236;
	bh=S8SFMN20YyS2xfNsshsCq2Vavr7dBJyysliO/cqZNrU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=R2lEKsTaJ7pU9XW5bEXWrWcENH87NMvBZQ6kh6ZDyw4EWNSx5YkNe09F346U4CpQy
	 YUiz6c1JoMVGLU8w6h7hF9Z3NlkqFKKcMffZ+bh0oUzSeyL2JcusKqCCL120KltSm1
	 xgxyH8411xSdvqkBA0YByAZyac3v8faQsrjwrmM03BZIL/YXKVgHDcumvjuiT08+lQ
	 H1Q56N9Scx9mfF9Qjy1X/k/s6Q+sefQSXwbQy1WxKvuYcZEubSYC0BpGlToGE/YBFA
	 yyVDNpCZN/KPE4EUrScVNJOzutoc27C+i1pzuRKp+4DSLuqvWywoxgHUoExszJQdFM
	 X7LFkyWwHuZQw==
MIME-Version: 1.0
Subject: Re: [PATCH v2] dt-bindings: net: wireless: ath10k: add
 ieee80211-freq-limit property
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <c33c928b7c6c9bb4e7abe84eb8df9f440add275b.1686486464.git.chunkeey@gmail.com>
References: <c33c928b7c6c9bb4e7abe84eb8df9f440add275b.1686486464.git.chunkeey@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168693223258.12400.17129558152991659679.kvalo@kernel.org>
Date: Fri, 16 Jun 2023 16:17:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_091717_387253_AAB52543 
X-CRM114-Status: GOOD (  11.43  )
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

Christian Lamparter <chunkeey@gmail.com> wrote:

> This is an existing optional property that ieee80211.yaml/cfg80211
> provides. It's useful to further restrict supported frequencies
> for a specified device through device-tree.
> 
> For testing the addition, I added the ieee80211-freq-limit
> property with values from an OpenMesh A62 device. This is
> because the OpenMesh A62 has "special filters in front of
> the RX+TX paths to the 5GHz PHYs. These filtered channel
> can in theory still be used by the hardware but the signal
> strength is reduced so much that it makes no sense."
> 
> The driver supported this since ~2018 by
> commit 34d5629d2ca8 ("ath10k: limit available channels via DT ieee80211-freq-limit")
> 
> Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commit;h=e3b8ae2b09e137ce2eae33551923daf302293a0c
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7f6ee56ca0df dt-bindings: net: wireless: ath10k: add ieee80211-freq-limit property

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/c33c928b7c6c9bb4e7abe84eb8df9f440add275b.1686486464.git.chunkeey@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

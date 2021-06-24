Return-Path: <SRS0=YzMu=LS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AC8C48BDF
	for <ath10k@archiver.kernel.org>; Thu, 24 Jun 2021 06:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4265160FF2
	for <ath10k@archiver.kernel.org>; Thu, 24 Jun 2021 06:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4265160FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUnfvMZZZMqlaNsPCGCkqB19Wv10c9XCA2h6YGQp6L8=; b=K5NJwepzxsmn6v
	kjB8vyDIxsBjsMN6h3yoSZtk7i60f9R5fvuO+SybmV8hOLfmptuBuHMfcb69MOvawdZIuGP0+hKcU
	S2xjG+gYayP0JSEDrKdF13r+lKfvDjF7EAZ2L6Smasq/wNwLdYZxu7SyQCIz72WhN2lcIIehhJvHQ
	Pfe+CuXvyMOOx0Twnq2YQKWK33XBlMrIlFIH4WOYhIuqvBeTLKWTIJBSa2Xh990bD0odIAmKxudY7
	peSYHjIEtZo1JAC/mXozIyQjzC1jmhah1MI+CCFzxVdz1sDNKzn0l956ZOxuEu0gl5G7vnjQa+sbv
	+uOAl/36sR90c6J45rjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwIcP-00CvFg-M8; Thu, 24 Jun 2021 06:13:41 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwIcM-00CvEo-L7
 for ath10k@lists.infradead.org; Thu, 24 Jun 2021 06:13:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624515217; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=mgjoAktbr4Uw+4QleB7HqWrhEn+xU2tzcnaEMEP1Z3M=;
 b=N/e3i5sXKMrPfXoMkHUWiFvk3kiYeSyf625S/kaP0rRMeZUi3LIj20O7U9IFs9bnlIE1fY0o
 Wyx/yXnV/a+UCdU1TzFCNWnwoEE1tQpB0/ZJkrXLazDzYO/tmUeCfc00SCwZxXQbbibh903/
 JA4rUG3HnGSuYB+sHeRb1+Qyiv0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60d422915d0d101e389159e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 06:13:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E5B18C433D3; Thu, 24 Jun 2021 06:13:36 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A494CC433F1;
 Thu, 24 Jun 2021 06:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A494CC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove unused variable in
 ath10k_htt_rx_h_frag_pn_check
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210514220644.1.Iad576de95836b74aba80a5fc28d7131940eca190@changeid>
References: <20210514220644.1.Iad576de95836b74aba80a5fc28d7131940eca190@changeid>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: Johannes Berg <johannes.berg@intel.com>, briannorris@chromium.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Jouni Malinen <jouni@codeaurora.org>, Wen Gong <wgong@codeaurora.org>,
 kuabhs@chromium.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210624061336.E5B18C433D3@smtp.codeaurora.org>
Date: Thu, 24 Jun 2021 06:13:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_231338_791982_3C68F5A9 
X-CRM114-Status: UNSURE (   8.10  )
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

Abhishek Kumar <kuabhs@chromium.org> wrote:

> The local variable more_frags in ath10k_htt_rx_h_frag_pn_check is not
> used. This patch is to remove that.
> 
> Fixes: a1166b2653db ("ath10k: add CCMP PN replay protection for fragmented
> frames for PCIe")
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>

Fixed already by another identical commit:

https://git.kernel.org/linus/e0a6120f6816

Patch set to Superseded.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210514220644.1.Iad576de95836b74aba80a5fc28d7131940eca190@changeid/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

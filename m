Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E1DC433F5
	for <ath10k@archiver.kernel.org>; Mon, 21 Mar 2022 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBMDhHGiKlibgHt5epgZfdw5DJbzDyIvGA+v5oSPo8Y=; b=0IbxMMJju13hnY
	NpWjYzkCb77T5SU1QwY+OWPuH4ms1phP8maB2BDXQfyNy58+tqTZIJ0xgM9IkJmxLZQBgWbvyVPRG
	FC9V5iTGoGFvZMguaqIxN6HRHth79UrTG44OOexmqQhL01jX8Ij7TNK9us5Ge+K8y6APggby/pN/r
	7jCNB5B2BvugmDlPafPOexPwVIKNA/KadW2GF3dbdOPLcNKFxFF5mnjRvhlkAVwVbH48/QKezkBh6
	N5Mh48SroRsJPs061hRvBBCgIC6RP4ybMh2nEOzxpfbk7qf1P2A9+35CW/abdBlJFSGNebtyEcPqI
	AmpEJkCRnf1XzYEpl9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWFb6-007MVc-PJ; Mon, 21 Mar 2022 10:49:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWFb4-007MV7-76
 for ath10k@lists.infradead.org; Mon, 21 Mar 2022 10:49:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73D5A6130E;
 Mon, 21 Mar 2022 10:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A74AC340E8;
 Mon, 21 Mar 2022 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647859748;
 bh=1XzuE1mkXqD0j+4Q6vb5nPgTLU+T40IwB7OS0cmE41E=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=jxohsmgScROjOx85jDEqGMztdXQq8/DLeu3aFQfwptRnRgeFtQH1YWGM3yTWDBx9K
 zMxGlD0vYnAyF4Vwg3lTgTSwpTh1Kyd2BG6VgxwU0Pvbhfg9XYfVziESgLMPHb9mOn
 cxzq7eKGhdzz1qZr7xs349r+WX4BMRtSSmI5VT793T+bNZ7zyuFSv4NZ4wkUyoVM+T
 22bawrFISzckuS7OBrH8H/5Th0ss1sgNh63kfwyKVetlOfZ5C+jHtShIkkI6Vpv0L2
 pCzpbzOWumN5Ed37EtWk9U5S+ZEj7lKQ+hOCcjdWQvKU80W06aUjKYc1zQTVrwYtOl
 w86Nlt22iHEpg==
MIME-Version: 1.0
Subject: Re: [PATCH] net: wireless: ath10k: Use of_device_get_match_data()
 helper
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220318025331.23030-1-tangmeng@uniontech.com>
References: <20220318025331.23030-1-tangmeng@uniontech.com>
To: Meng Tang <tangmeng@uniontech.com>
Cc: davem@davemloft.net, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Meng Tang <tangmeng@uniontech.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164785974519.19083.15212520438409516614.kvalo@kernel.org>
Date: Mon, 21 Mar 2022 10:49:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_034910_332839_00EB3B60 
X-CRM114-Status: UNSURE (   7.13  )
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

Meng Tang <tangmeng@uniontech.com> wrote:

> Only the device data is needed, not the entire struct of_device_id.
> Use of_device_get_match_data() instead of of_match_device().
> 
> Signed-off-by: Meng Tang <tangmeng@uniontech.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c4e9705c5012 ath10k: Use of_device_get_match_data() helper

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220318025331.23030-1-tangmeng@uniontech.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

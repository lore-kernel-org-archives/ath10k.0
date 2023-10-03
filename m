Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922CBE7AD58
	for <ath10k@archiver.kernel.org>; Tue,  3 Oct 2023 14:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jo+7u51r+0aLpsbgqUCiDdzIpUFy5B2nhhfsOgw7eh8=; b=OWYI0dZnqqiQlX
	g+G0ATxXgiENL/w6u7gW68edfv40GewQ1jztCTkTCN2lUR+Dp6YZD70Un0XWDkIgcdIvrkyaCAP/y
	GTZYzLLoC5e5blVyZcghqrel1pPU3O4oJImqMbpMSb9kApqQIbGh5E2PmkWw4bFQafErY4vtXHWSw
	xcZwhSEzE/nGT9gww4kW9AM2HRZqawYMggETpIQbL5NymemdGEvhe+MxLIrdfU3VZOGQDX0+a+sl/
	4Jyp5J+zN7f7pFlQ9Ai8CLhVykXTGim7DZKk15Z1Bti82y7nbRY/HajKtfhc6lNkf41emL1SS/PHR
	hAuiSB8/99FFvfHDM9cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qngdW-00Eol3-1D;
	Tue, 03 Oct 2023 14:44:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qngdT-00EokJ-0u
	for ath10k@lists.infradead.org;
	Tue, 03 Oct 2023 14:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A636F61230;
	Tue,  3 Oct 2023 14:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5D0C433C7;
	Tue,  3 Oct 2023 14:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696344270;
	bh=/B3cve6YrGk+HiByt3eCtzticC+G5KGeINugbxRXa+0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=G9ra3rfOvF81SNltY0+7rB9LU2lNRMkOpcFYKiesBTdxVqnBcstMgJaMm8OKYuyzE
	 fhCd/gNuADS31jGfMzsRQVgDa0XjzkUH7PIWqzOyhLAHc9hVFGtSXWiqNUdhcoTcuY
	 0834LPN9Fy1QfcgTUQc1RVcqXa41TU6G3F3BOAQYb50kZJycXoIB1dPNp9W+L0Sr4v
	 uycxxBmg2sRItx23zyRM9uMGWcB3n04SMsL73yA4vAmjQvP4/yssGu7azBtiTN+h01
	 YXHydglDNUwkE918pxqTIKWiXem2aqyDrAeLLcdc0W3Q/q8UjNExAmxCrM68ii2c4c
	 HPA4nrMmYdxQw==
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath10k: mac: enable
 WIPHY_FLAG_CHANNEL_CHANGE_ON_BEACON
 on ath10k
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230629035254.2.I23c5e51afcc6173299bb2806c8c38364ad15dd63@changeid>
References: <20230629035254.2.I23c5e51afcc6173299bb2806c8c38364ad15dd63@changeid>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: johannes.berg@intel.com, linux-kernel@vger.kernel.org,
 kuabhs@chromium.org, netdev@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169634426707.121370.9448850980134728319.kvalo@kernel.org>
Date: Tue,  3 Oct 2023 14:44:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_074431_362883_29B13504 
X-CRM114-Status: UNSURE (   7.99  )
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

> Enabling this flag, ensures that reg_call_notifier is called
> on beacon hints from handle_reg_beacon in cfg80211. This call
> propagates the channel property changes to ath10k driver, thus
> changing the channel property from passive scan to active scan
> based on beacon hints.
> Once the channels are rightly changed from passive to active,the
> connection to hidden SSID does not fail.
> 
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>

There's no Tested-on tag, on which hardware/firmware did you test this?

This flag is now enabled on ALL ath10k supported hardware: SNOC, PCI, SDIO and
maybe soon USB. I'm just wondering can we trust that this doesn't break
anything.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230629035254.2.I23c5e51afcc6173299bb2806c8c38364ad15dd63@changeid/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

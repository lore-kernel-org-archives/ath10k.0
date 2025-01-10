Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEF4E7719F
	for <ath10k@archiver.kernel.org>; Fri, 10 Jan 2025 13:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvpAoHY60h7MOy6i+B28lZjSdkaIDZZ0NhhCLmqalMg=; b=lTBRRG5bCaml8iUMV6/cn84Rh1
	1/0GsGNArKfbvl6oaScbXw0I8SJuzpecimq3K7WhLRz3CwfEsF+ww+WIl3FzM+idL8QNUTR0+Xj7c
	91DlvdY8phP3DAEA7IydY8dikWkHjAOrah4GApslfwgC6yY0O5hsuBrcv/eDcF8DXFbUnvWnPKOZA
	2XH9dm+Oye+HQ4TTswaPRKrX6Ug7wr0/454sXkRm9D26Cu9cyHJkVeLljBGMDXphCMTPWrHvV3/Ds
	LHRrVAt0b4OVJGhEdc0hhBM/2K3bZUlH3xAMb1ac3HaNVP4Ij93wneC/eFp2+3LV6BLgeZl3yAdUs
	DZMDpMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEpl-0000000FQdp-1dA1;
	Fri, 10 Jan 2025 13:13:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWERN-0000000FLYX-1Xhz
	for ath10k@lists.infradead.org;
	Fri, 10 Jan 2025 12:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03C6CA403A2;
	Fri, 10 Jan 2025 12:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E31FC4CED6;
	Fri, 10 Jan 2025 12:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736513320;
	bh=3fQ2h4Pt/uqWLkiK7e7VGOOcXJfXhwzLCd84M4/rp5Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=j4yyJ1yofByWb3zLnLfpxVnJmR2DwX2dXJ/i9VgB0x1XMs1eVJY6CfU+OZKunWIpZ
	 wylLsHs+w6TILie2J4cN75e4mDzk3yg2ll3fftR8p+qMkMf2o35XWFUhl3DNT3RrIL
	 7d4FoORFBFKBvws3SeT/8PUBup+cB5aKoUBcqHwaYxtXw4bj7rNMsBvzNGPNWQWSN6
	 g2UOHiSJoBp0Eb70NOhYXhnhRmbR/lxcrjnIzbuBMRijhln1hormbLc1zA5ZKF52D4
	 KFyhcqs76MC8nk3HB9EFXgkFnNRZpEBkCOAsdSYiukP+4vL0KO+jsu5l22RNePQTNQ
	 etQAr+JyftpwQ==
From: Kalle Valo <kvalo@kernel.org>
To: smaxxx <smaxxx@protonmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: Re: Slow WiFi speed on QC9377
References: <jLGAMZpgr-fd7mc1F0QKdZ5SEd6keErnKsICO7NTMf5vTYUjkkYdY4MlFB0wml6KiLQYodK135tt04AOtaw9HowJWXlelIEa2C7ieZvjhpk=@protonmail.com>
	<ph8MqbGHbHR3_t7MZ-gpZF_RF9NQemCzXCHlkN4lcd0ZWZ_u5axS-5G39iWfuxoIpUV3VMxT7zTduKbyu9MOXMb__A6GJOVBFBkfn9crNUE=@protonmail.com>
Date: Fri, 10 Jan 2025 14:48:37 +0200
In-Reply-To: <ph8MqbGHbHR3_t7MZ-gpZF_RF9NQemCzXCHlkN4lcd0ZWZ_u5axS-5G39iWfuxoIpUV3VMxT7zTduKbyu9MOXMb__A6GJOVBFBkfn9crNUE=@protonmail.com>
	(smaxxx@protonmail.com's message of "Fri, 10 Jan 2025 10:43:24 +0000")
Message-ID: <87a5bysul6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_044841_522146_7556921D 
X-CRM114-Status: UNSURE (   9.80  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

smaxxx <smaxxx@protonmail.com> writes:

> Hi everyone,
>
> it seems that this is not a ath10k firmware issue but rather a kernel issue. I tried following:
>
> Live boot newest Manjaro: Problem
>
> Live boot Ubuntu 18.04: Full WiFi speed as expected
>
> Live boot Ubuntu 20.04: Problem
>
> Ubuntu 18.04 had kernel 5.4.0-84 and WLAN.TF.2.1-00021-QCARMSWP api 6 - no problem.
>
> Ubuntu 20.04 had same firmware but kernel 5.15 - problem. I am gonna
> try to downgrade the kernel and see if that fixes my problem.

What's the full speed you are expecting?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


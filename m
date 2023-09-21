Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E07FE706E5
	for <ath10k@archiver.kernel.org>; Thu, 21 Sep 2023 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Etoe1fjWOVvFuhLbxjgJwOJUyVRlrLUAa503K7MHiCc=; b=k65d+GTskVWA3v
	UbdE4klXr1WM50VC6bEeIA88TGoqC1egZg3wVMIydTpe8i5hQxxuHKsy36sgillt+XlCEHM2UHnKK
	CXPksXunRko7hUcz9JAT0VMg9UaqXByF4yC70hSvE+ScnuRFLDK74IqrZqBlS5tLPn9ifdmgLa9kw
	JsMzRlvMJKw+PL3VhdyZ4XVYkJ1fWXSFbG61FDOiwmk7Hkzd9XGU5y90tvavO0tlUxsaR4un+afas
	RK+P2mFoP+ZltF+AyH8J0pcyWqrikCDNBtl5CoekaTiByXjChKieSjCX0+wpiNKnvBCmnJt8Hn4VF
	LD9sv3vogzw0eLt6Ohlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEmH-005SyS-35;
	Thu, 21 Sep 2023 08:11:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEmF-005SwD-0K
	for ath10k@lists.infradead.org;
	Thu, 21 Sep 2023 08:11:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 70A9FB81F97;
	Thu, 21 Sep 2023 08:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D205FC116B5;
	Thu, 21 Sep 2023 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695283868;
	bh=BF5T2JUpulkKw7ZaTHQ7jYNUb96c3nyDhbUTrlFhR+k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=AH8XaTC3X8eulTN2GAW+nx+kJTnDVN5Lk13e29I4hCbVQO/2hKx3Y0x38XlWGzXom
	 UEs587qrjFgh9oeW7JmL41081t+ik76ock2lq2FRLOhEJ6WLug16rm8UPDuGv1b1qr
	 HdTJ4wgXNgWpiGSNhb2k3j5RZ85lTA3YDjA7USSqYilFhqIwh/EtIYkVAcQcQxa3i/
	 rrQrnyHofwJeNR1psysby/ju2tLfqZo17S8//7kHRv1t3I4FIgvGI7JZ2utXMgmARR
	 h0smcRAe8lRjfWQ2jgrmkzsBpqDn3ilj70PM+hVSLwT9CoSw68lRZr6fJB/EN6ukcJ
	 jgQqTcq/XQR0g==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: drop HTT_DATA_TX_STATUS_DOWNLOAD_FAIL
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230914160744.155903-1-dmantipov@yandex.ru>
References: <20230914160744.155903-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, linux-wireless@vger.kernel.org,
 lvc-project@linuxtesting.org, ath10k@lists.infradead.org,
 Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169528386511.1539628.17402529453391015773.kvalo@kernel.org>
Date: Thu, 21 Sep 2023 08:11:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_011111_282827_5437F565 
X-CRM114-Status: UNSURE (   8.50  )
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

Dmitry Antipov <dmantipov@yandex.ru> wrote:

> According to Jeff, 'HTT_DATA_TX_STATUS_DOWNLOAD_FAIL' from
> 'enum htt_data_tx_status' is never actually used by the
> firmware code and so may be dropped, with the related
> adjustment to 'ath10k_htt_rx_tx_compl_ind()'.
> 
> Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

30e7099a6dc9 wifi: ath10k: drop HTT_DATA_TX_STATUS_DOWNLOAD_FAIL

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230914160744.155903-1-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

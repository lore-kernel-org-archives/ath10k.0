Return-Path: <SRS0=tAHh=PN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D797C433EF
	for <ath10k@archiver.kernel.org>; Mon, 25 Oct 2021 13:05:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D93760F92
	for <ath10k@archiver.kernel.org>; Mon, 25 Oct 2021 13:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D93760F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7q4zG38OY51D/drKgZwhZNIhw8ctyxUIR6hDJPksFmc=; b=t3t8de5VtOnBcN
	wIKyUap/ARsNXJG0Qel7/vf+osN2QQHzQGzn0XRmFQyOfqNi+C9yfo/24+ad9bFFLF61fXPMkX1C6
	M9VwmGm1AZObZ3f/99Y0EYHFx0qvpQV6mjMNh/QNBNq1niiQBr5EHaCHOA8p2aliGY3E4AyCLxtfo
	uclM0IJD2sKJl8khLQ5qD5tYudoXm2O0VYmabDTDwxQ0Dhaqn0Mg35I40PeJVTWgu2ra1/lQMdNQJ
	0DVbjY2NqO+0ixwy0zH6J/Fpuu+cFvAok3tWtz1aHS73VjO/T8brbdQcO+Pkm7Uz/XJxitG2TDgJj
	iWsPK7yqByXarNj+MUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mezed-00GUC1-SQ; Mon, 25 Oct 2021 13:04:43 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezeN-00GTtl-3Z
 for ath10k@lists.infradead.org; Mon, 25 Oct 2021 13:04:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635167069; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=kuLbeuqX9KK+/DlxCOlCZThwrFG8XXXwlh08K36ZZ5s=;
 b=sZjXJ2ChMntkJhmMLjEOebJ3gnPbGbWmUI+IRtZ8D3XiBCC8oeZ2ckljP7YleiSG4nMqd5LU
 LEnyCUMcgCNg1qqzlOQTtbyEsunuwBwjcdWvIgv+syHDSyVcQmZ8YWA/RTo1jFxT6DX07Awp
 Rmj2EjkYyUg5r/6PPs2vasj/J/w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6176ab54b03398c06c78cf54 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Oct 2021 13:04:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1DBA3C43460; Mon, 25 Oct 2021 13:04:19 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 864E6C4338F;
 Mon, 25 Oct 2021 13:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 864E6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix invalid dma_addr_t token assignment
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211014075153.3655910-1-arnd@kernel.org>
References: <20211014075153.3655910-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Alagu Sankar <alagusankar@silex-india.com>, Arnd Bergmann <arnd@arndb.de>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, Wen Gong <wgong@codeaurora.org>, 
 Tamizh Chelvam <tamizhr@codeaurora.org>,
 Carl Huang <cjhuang@codeaurora.org>, 
 Miaoqing Pan <miaoqing@codeaurora.org>, Ben Greear <greearb@candelatech.com>, 
 Erik Stromdahl <erik.stromdahl@gmail.com>, Fabio Estevam <festevam@denx.de>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163516705229.3976.16508438608512725859.kvalo@codeaurora.org>
Date: Mon, 25 Oct 2021 13:04:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_060429_605943_3ABAC147 
X-CRM114-Status: GOOD (  14.28  )
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

Arnd Bergmann <arnd@kernel.org> wrote:

> Using a kernel pointer in place of a dma_addr_t token can
> lead to undefined behavior if that makes it into cache
> management functions. The compiler caught one such attempt
> in a cast:
> 
> drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_add_interface':
> drivers/net/wireless/ath/ath10k/mac.c:5586:47: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>  5586 |                         arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
>       |                                               ^
> 
> Looking through how this gets used down the way, I'm fairly
> sure that beacon_paddr is never accessed again for ATH10K_DEV_TYPE_HL
> devices, and if it was accessed, that would be a bug.
> 
> Change the assignment to use a known-invalid address token
> instead, which avoids the warning and makes it easier to catch
> bugs if it does end up getting used.
> 
> Fixes: e263bdab9c0e ("ath10k: high latency fixes for beacon buffer")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

937e79c67740 ath10k: fix invalid dma_addr_t token assignment

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211014075153.3655910-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

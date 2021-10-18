Return-Path: <SRS0=x2CT=PG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC59C433EF
	for <ath10k@archiver.kernel.org>; Mon, 18 Oct 2021 13:12:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F07786103C
	for <ath10k@archiver.kernel.org>; Mon, 18 Oct 2021 13:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F07786103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsDegR6coo++KWEyOdXQtcK83WZ0rqGWoqCTaW8oRjY=; b=4zdn67kyc9amWk
	21w5AmNb4Ahw9NSIo/hgpjFWohsbNFwEjaQq9sUcZ5jffEFCn8bwGAW1/uZHyNx9uf74IESnNR4Dv
	kiVAdozxVV3rrcYWQNL0F2XLP8xfCi9qmo3GHykuLaQj0x1RqL7h3TaskdNUlB0BhyPPgSaedZCU6
	NGpNBmgh74XSUYtHUod1eYnw49BRFFXUkuNsX0fusfp8DMTChKrvgL69KdIdXBoVcFVEVC9j59f/L
	4h3Cn7ZVlQ08n7usDY7Tb1X9EfS1AYnnC+sOr7PvVeLtOvVLoQXGZOq99Dl1o5b3sXbgCCQPrUuRy
	ca4GVCcd1L5Z8CC7eDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcSPw-00FkcX-3u; Mon, 18 Oct 2021 13:11:04 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcSPn-00FkaK-Vh
 for ath10k@lists.infradead.org; Mon, 18 Oct 2021 13:11:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634562661; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=2iZh5xPrIPUDbVFXGh7W2cb2/hGVEE7gEkCaxI5tQ2Y=;
 b=c7XSPftTA/ElKDAgIJrY04DoZwEdjx+xCpOe2VxWynXeeRERHQzQe5ghGKUdFHIwYsQd4HQi
 GaQVCbHSFN6AZqTbDoKuiGsRIbyYXiGNboKcKTXNRFqCs+oXgaTzzMakrlMtMhOBKolOdbIv
 YjfTKlBdYFk4HYxcneD44Y25DhM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 616d7248ea41a97c24c0ad31 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Oct 2021 13:10:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A2A4CC4361B; Mon, 18 Oct 2021 13:10:32 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D04D4C4338F;
 Mon, 18 Oct 2021 13:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D04D4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Alagu Sankar <alagusankar@silex-india.com>, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Brian Norris <briannorris@chromium.org>, Wen Gong <wgong@codeaurora.org>,
 Tamizh Chelvam <tamizhr@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>,
 Miaoqing Pan <miaoqing@codeaurora.org>, Ben Greear <greearb@candelatech.com>,
 Erik Stromdahl <erik.stromdahl@gmail.com>, Fabio Estevam <festevam@denx.de>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath10k: fix invalid dma_addr_t token assignment
References: <20211014075153.3655910-1-arnd@kernel.org>
Date: Mon, 18 Oct 2021 16:10:21 +0300
In-Reply-To: <20211014075153.3655910-1-arnd@kernel.org> (Arnd Bergmann's
 message of "Thu, 14 Oct 2021 09:51:15 +0200")
Message-ID: <87fssytr5u.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_061101_517176_DEE9B94E 
X-CRM114-Status: GOOD (  25.20  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
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

That's my understanding as well. beacon_paddr is only accessed in
ath10k_wmi_event_host_swba() and only low latency (ATH10K_DEV_TYPE_LL)
should use that function.

> Change the assignment to use a known-invalid address token
> instead, which avoids the warning and makes it easier to catch
> bugs if it does end up getting used.
>
> Fixes: e263bdab9c0e ("ath10k: high latency fixes for beacon buffer")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 7ca68c81d9b6..c0e78eaa65f8 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5583,7 +5583,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>  		if (ar->bus_param.dev_type == ATH10K_DEV_TYPE_HL) {
>  			arvif->beacon_buf = kmalloc(IEEE80211_MAX_FRAME_LEN,
>  						    GFP_KERNEL);
> -			arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
> +			arvif->beacon_paddr = DMA_MAPPING_ERROR;

In the pending branch I added a comment here:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=02a383c9bf959147a95c4efeaa4edf35c4450fac

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

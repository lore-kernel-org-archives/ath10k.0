Return-Path: <SRS0=+Z/7=LJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E19DC48BE5
	for <ath10k@archiver.kernel.org>; Tue, 15 Jun 2021 16:23:17 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039CD61443
	for <ath10k@archiver.kernel.org>; Tue, 15 Jun 2021 16:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 039CD61443
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEqYaErk+70rSSV75mQpbpjfxNj5dvG7ZvNzzrw4/e4=; b=cA+XI5IAoUolva
	wZ/3qTMnZj4sEnl3NMEi7lGQzUPJD3HPRHGWuNtAgli8HFnp7vcpoP6YSs1mBCF17bQngiI3u9z+7
	Kw6HUE1ilq60Zwbgccm+Hx1jmPFO0R8AmejWf3EdKf4Klsi/xvrn6yZalbasz0pkU/R0/q4oz0iAg
	begMfH9X0eX5pB8H6Ko0VsOj1WVfx3ggjMM4T/E0wat0tkKajc1fV/EPdHT6EFGsFcFZAGeqiIhDw
	PTltYYBqIC7qC+VgGXJMKk4e+b+iTn/w/WbSoTI8lgreRYTDru+vaIDieBAAKBqm3qw30Y2pDMvu3
	7K9GVu2Xu4UmlVFcrazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltBqB-001K8y-RP; Tue, 15 Jun 2021 16:23:04 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9iS-000S9a-VY
 for ath10k@lists.infradead.org; Tue, 15 Jun 2021 14:07:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623766021; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=taXBYyfoEZsgbWtAduieW5mkQkokeO4e0zurDPuaqE4=;
 b=luJRMtjyDec3sAmDwcw2czWsYKWS+oiGdqi9WTDwJNckFgd5HoRrXViTVQaVlloMz8glcBhF
 It/+ubVyVdAkxGBm43Vi9La5ulDTPtRlS/3dsrDvjGcZSa7eM1tSTs25asUFTis+55HhVvtp
 FFbsqxHKQ77DXScBGpJF1jKnJWs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60c8b38dabfd22a3dcb4743d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 14:05:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 82AFBC433F1; Tue, 15 Jun 2021 14:05:00 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 78BD9C43460;
 Tue, 15 Jun 2021 14:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78BD9C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ath10k: Use
 devm_platform_get_and_ioremap_resource()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210605110227.2429420-1-yangyingliang@huawei.com>
References: <20210605110227.2429420-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <davem@davemloft.net>, <kuba@kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210615140500.82AFBC433F1@smtp.codeaurora.org>
Date: Tue, 15 Jun 2021 14:05:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_070701_417321_18D3F68D 
X-CRM114-Status: UNSURE (   6.64  )
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

Yang Yingliang <yangyingliang@huawei.com> wrote:

> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ea1c2023efbc ath10k: Use devm_platform_get_and_ioremap_resource()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210605110227.2429420-1-yangyingliang@huawei.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

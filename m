Return-Path: <SRS0=+Z/7=LJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A505C48BE8
	for <ath10k@archiver.kernel.org>; Tue, 15 Jun 2021 16:16:52 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20E3608FE
	for <ath10k@archiver.kernel.org>; Tue, 15 Jun 2021 16:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E20E3608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxfj+PWeKr7uBNvmeC9tHBv3GWnZgo4TY7X3GxVwHHI=; b=vfbLg8K0gVI03X
	5JnczUOLewjyaG4UGKWNAsSwxE8hhNYX0lwK34WwJnbYilqntnujG2oBQA8sUCQGZAHYAoeuZ8Pel
	M5nsNBYCIc9gx0lHiXRrA5y2uLXfiJWks2iJD6K0MXOlFrx9YImc1eUA7LLIQ0QRvGHh8qDle1xMh
	iP1xnwrMHgItImnA780uYo0vn1U07CET7sd18+cVKfx8txNKxG5q6somxXp3oP3ktEQtctjc4ExZb
	Q7HMSuLlHXK++ZQImgt6UJ0P2macdiW16YYiDdRjjN0vILz2XKmOI5xs6hQWi2sWq/91I3f257gnv
	UBr9yAFeoZ54HhF9TfNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltBhS-001GcA-Dr; Tue, 15 Jun 2021 16:14:02 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9gD-000QQY-4l
 for ath10k@lists.infradead.org; Tue, 15 Jun 2021 14:04:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623765881; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=6gTr9j1nBUFiHxj5nPNVd48BotsR10twO1JUZtyLItc=;
 b=RZgtYmvaPvXAbrEm7YSvmq8gugv4ak0qkSUjlaRrhBxGafMHcrJD4z7ARI3AZjXP5klqaaCY
 91UC5jKP4r6o258Pa4a1vQBuxIuZBAToCWwyyl/yB68rJwlSbpIiTTKqWYPIsH84V6IpLtpf
 EIpJSrh1fk71FZoi37Dk1krfKjE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60c8b334e27c0cc77f4b1b1e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 14:03:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 09D7BC433F1; Tue, 15 Jun 2021 14:03:31 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D690C4338A;
 Tue, 15 Jun 2021 14:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D690C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix an error code in ath10k_add_interface()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1621939577-62218-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1621939577-62218-1-git-send-email-yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: davem@davemloft.net, kuba@kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210615140331.09D7BC433F1@smtp.codeaurora.org>
Date: Tue, 15 Jun 2021 14:03:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_070441_374065_7D75A1EA 
X-CRM114-Status: GOOD (  10.74  )
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

Yang Li <yang.lee@linux.alibaba.com> wrote:

> When the code execute this if statement, the value of ret is 0.
> However, we can see from the ath10k_warn() log that the value of
> ret should be -EINVAL.
> 
> Clean up smatch warning:
> 
> drivers/net/wireless/ath/ath10k/mac.c:5596 ath10k_add_interface() warn:
> missing error code 'ret'
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: ccec9038c721 ("ath10k: enable raw encap mode and software crypto engine")
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e9ca70c735ce ath10k: Fix an error code in ath10k_add_interface()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1621939577-62218-1-git-send-email-yang.lee@linux.alibaba.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

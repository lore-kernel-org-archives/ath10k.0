Return-Path: <SRS0=ZGrE=GV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F2BC433DB
	for <ath10k@archiver.kernel.org>; Mon, 18 Jan 2021 16:12:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 925CC222F9
	for <ath10k@archiver.kernel.org>; Mon, 18 Jan 2021 16:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 925CC222F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eXGCNHPaYPaXSndXdHMTCyhtXhLxG5isgOcijF6umHE=; b=UoJ6Xq8bx1jIXykZfLIvcbEUj
	BFN/oIBidHA9jFDBNwQz3hK4V6858PO6denwt7zyDtlmqKzUND3cyjn8CL6z7cJMqizclnE5Yzkft
	jazD0bhxZvi8WjPjN96IMV65agsvEqDrxxNFZp7evE/FKc7qDsItHl7Q2Fnkrzio4vnHa0fhe6hvD
	8olT4R/dqMgQhh/K/xScIjkJadAS6kXN5F2sEaQumOumnuoyfVMS4ujC5ipzjtW+PdqzJ5GqbtTjY
	qYOF3XQ8RmWFfyRu5TUHc5prxS96qe3dbAzNHQsDotvEyqPTeblayyckIbZtmdHuFMtQT/BhgzhER
	NVVBKOseA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1X8p-00034j-BK; Mon, 18 Jan 2021 16:12:31 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1X8k-00033e-V2
 for ath10k@lists.infradead.org; Mon, 18 Jan 2021 16:12:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610986348; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Q9RgQi1NfhSWcXWKXnEXRNmguhniM+q+vJm2+2IGXLY=;
 b=WIFl8rnp0iXeALy2cXPwZ2rl4wFIyr82Yhgx9QUNk2GuPGpPycAbKRCh6E68Ir6tqeObhcux
 iJJBDidu+OFsb7ZBecgPZuUW22Y3OPAtAjs1skUZqCO+CqqK+x0SQ+pW56QcsIBSYq4OzmYV
 WVRv5Amuahjco/k4YIq7YzWsecA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6005b3647086580d3246403b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Jan 2021 16:12:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 40658C43463; Mon, 18 Jan 2021 16:12:20 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 81B13C433CA;
 Mon, 18 Jan 2021 16:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81B13C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] net: ath10k: santity check for ep connectivity
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200622022055.16028-1-bruceshenzk@gmail.com>
References: <20200622022055.16028-1-bruceshenzk@gmail.com>
To: Zekun Shen <bruceshenzk@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210118161220.40658C43463@smtp.codeaurora.org>
Date: Mon, 18 Jan 2021 16:12:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_111228_443903_B852B23C 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: , netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Zekun Shen <bruceshenzk@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Zekun Shen <bruceshenzk@gmail.com> wrote:

> Function ep_rx_complete is being called without NULL checking
> in ath10k_htc_rx_completion_handler. Without such check, mal-
> formed packet is able to cause jump to NULL.
> 
> ep->service_id seems a good candidate for sanity check as it is
> used in usb.c.
> 
> Signed-off-by: Zekun Shen <bruceshenzk@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d18ba9f1351c ath10k: sanitity check for ep connectivity

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20200622022055.16028-1-bruceshenzk@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

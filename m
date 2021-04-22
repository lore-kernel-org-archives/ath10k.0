Return-Path: <SRS0=Pgi6=JT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD77C433B4
	for <ath10k@archiver.kernel.org>; Thu, 22 Apr 2021 13:55:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B45A60725
	for <ath10k@archiver.kernel.org>; Thu, 22 Apr 2021 13:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B45A60725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y1uIyWm2Vt/uboeoXTtzBfDeN4vOPvIvaBcaYFSl0VY=; b=fQrhvlN0bpzJTZfezJsm0NHa3
	kYdcgz1BgwVuKqYoZK+pwHvBgbBp1ZlxPI6dPTbCbFIhKBJjIfHKovZpdS9rvf/W1lL7savfP65EP
	05EltHL6fEzoqRZBaAqgDQw/VYERaffaGBmj1xt2qar5cJD0EenpGQ03RWH6Ktm2Zi3ATnL/5njnQ
	XxZt1S7E5ngDAHH9Jrak4YlcfCrgDn0Bd/PytogSnE3G3KuP+QykgIvSeQ0mdd46y6JTs2vSzMgeC
	pKfY9LpB3ZKDmq3vwKeCrB1iG5wnro8waAPkDOV74iwjQ4flFe5kdH2C9iB3qOOKxtZWMwnF7tG+F
	XnM0oeXnw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZZn2-00GpwG-6r; Thu, 22 Apr 2021 13:54:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZmy-00Gpw1-QZ
 for ath10k@desiato.infradead.org; Thu, 22 Apr 2021 13:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:Message-Id:Cc:To:References:
 In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=uv2qyrmEi4TwpCp1U2TqtW6eqajB9ZYNrKzSmO0EAjo=; b=yzZ3heXXGYr00fphNMaSXqPuLz
 j3qIwhOdvaCSJFYu+J9vgxXXauYFf6v3Pl0qFvGGqFJEwA44syvcZz6b/EF84mRDOEa10hnGOGfDd
 ivLjqvlAad10jYLb4xH6uZYq7B19lWvM9CAPDQGvjMcX/RsoemudVN6ZgZs1npjBNiAAfFbMJMYPZ
 VgTdzRY3osCSe40M61DbzhbYJouCya7kdygK9ESID+s20H2qnjkYBGqRkKke+5iu39IhP1H8sOoFt
 hhdN/6RRc3jlX5V1kX8g0Jzv/VIiGf00+YhDs94dFHvH6ogZFe59PulTVAbjnq+SdlE1j8yD8EUDN
 stO1JHDQ==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZmv-00DjhX-Uf
 for ath10k@lists.infradead.org; Thu, 22 Apr 2021 13:54:39 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619099673; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=uv2qyrmEi4TwpCp1U2TqtW6eqajB9ZYNrKzSmO0EAjo=;
 b=XLaNpN4LQmxi6UeXwjN/Kk/Z4MrhS42jCsLG3Whg3qO7WSYfvldkxOxd1EjmCoVFlG54Fd/S
 r+oNUy7xFWQjov+XuUMpC61+W9piZnn+415YwrdD4np05c73Tv1TWZw/IOQn6zFVBQNx+S9J
 jM11ItrFCBcP+ShTXJp0dLNI2eE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60818018215b831afb0b06cd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Apr 2021 13:54:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 86793C43460; Thu, 22 Apr 2021 13:54:32 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BB23DC433D3;
 Thu, 22 Apr 2021 13:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BB23DC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] wireless: ath10k: Fix a use after free in
 ath10k_htc_send_bundle
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210329120154.8963-1-lyl2019@mail.ustc.edu.cn>
References: <20210329120154.8963-1-lyl2019@mail.ustc.edu.cn>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Cc: davem@davemloft.net, kuba@kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lv Yunlong <lyl2019@mail.ustc.edu.cn>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210422135432.86793C43460@smtp.codeaurora.org>
Date: Thu, 22 Apr 2021 13:54:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_065438_067102_890BD99C 
X-CRM114-Status: UNSURE (   8.07  )
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

Lv Yunlong <lyl2019@mail.ustc.edu.cn> wrote:

> In ath10k_htc_send_bundle, the bundle_skb could be freed by
> dev_kfree_skb_any(bundle_skb). But the bundle_skb is used later
> by bundle_skb->len.
> 
> As skb_len = bundle_skb->len, my patch replaces bundle_skb->len to
> skb_len after the bundle_skb was freed.
> 
> Fixes: c8334512f3dd1 ("ath10k: add htt TX bundle for sdio")
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

8392df5d7e0b ath10k: Fix a use after free in ath10k_htc_send_bundle

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210329120154.8963-1-lyl2019@mail.ustc.edu.cn/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

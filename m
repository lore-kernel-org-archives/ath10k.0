Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7579C433E0
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 18:16:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FA9D22D08
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 18:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FA9D22D08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KSDoP7vl18A9w27bECqxQBX8LtrSq/lRzMa9ePIin6k=; b=aEASDPiBp9Ev3CNnP3/Vp4DGX
	FqZXt4Jw9x7/pxe0dMMGE/LE2Fx7HfHXjon0ZNYBwI0ER6Gd8db6LLgsuSdLY4QUa2NXTIcR2AKqb
	AW/uqJKNNj0ww0C0jYiMQixR7I6AFxaajil14G+iAVD242tqyBNorGbkedwk9Fv858cA0unHpepJ7
	rWt6jSfFSRkw7VTg+PZeNB/8MAzQp53fZIRkLeaz1IDH1suvdhZ7B0QC8kl/t6OvM3H5X7xA69Ug7
	M8Km3OI9ANTQxGYeIWc6wryxyyjgU2ufHCSpjClBixAx07MzcZ12TWcdWSWqI+hMrfGWw7lG/me0Z
	D89Bsrd0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krPid-0002ho-KY; Mon, 21 Dec 2020 18:15:39 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krPiZ-0002fn-Ty
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 18:15:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608574536; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=advVr5rSg5zOOn4yjOEJUBXVBEt3L/mvo2faQIC58Bc=;
 b=ex69mKPpCvs3uh1Yzxz3Afrya6sXM+l8MhZhaKGEY9ImOwmgWWcHW9q/C3Et4QL2NTjvsOZz
 LxN/3tQe0FxppRDuywslLWRKt0EIMTpshcCVIeR9JEN3l0Oo5EqCR+e5fJgmMZTB5BB48uiV
 XHW/L2YdxuL9jcnGG37Ct2xublc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fe0e63fb00c0d7ad4a76029 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 18:15:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29479C433CA; Mon, 21 Dec 2020 18:15:27 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E500AC433ED;
 Mon, 21 Dec 2020 18:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E500AC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Zekun Shen <bruceshenzk@gmail.com>
Subject: Re: [PATCH] net: ath10k: santity check for ep connectivity
References: <20200622022055.16028-1-bruceshenzk@gmail.com>
Date: Mon, 21 Dec 2020 20:15:22 +0200
In-Reply-To: <20200622022055.16028-1-bruceshenzk@gmail.com> (Zekun Shen's
 message of "Sun, 21 Jun 2020 22:20:54 -0400")
Message-ID: <87sg7znhz9.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_131536_604263_B7D97DB1 
X-CRM114-Status: GOOD (  20.28  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Zekun Shen <bruceshenzk@gmail.com> writes:

> Function ep_rx_complete is being called without NULL checking
> in ath10k_htc_rx_completion_handler. Without such check, mal-
> formed packet is able to cause jump to NULL.
>
> ep->service_id seems a good candidate for sanity check as it is
> used in usb.c.
>
> Signed-off-by: Zekun Shen <bruceshenzk@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/htc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
> index 31df6dd04..e00794d97 100644
> --- a/drivers/net/wireless/ath/ath10k/htc.c
> +++ b/drivers/net/wireless/ath/ath10k/htc.c
> @@ -450,6 +450,11 @@ void ath10k_htc_rx_completion_handler(struct ath10k *ar, struct sk_buff *skb)
>  
>  	ep = &htc->endpoint[eid];
>  
> +	if (ep->service_id == 0) {
> +		ath10k_warn(ar, "HTC Rx: ep %d is not connect\n", eid);
> +		goto out;
> +	}

I think using ATH10K_HTC_SVC_ID_UNUSED is more descriptive than zero, as
ath10k_htc_reset_endpoint_states() uses it. I fixed in the pending
branch.

I think also ath10k_htc_process_credit_report() might have a similar
problem, can you take a look?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

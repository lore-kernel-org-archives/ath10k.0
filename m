Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0694AC433E0
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 18:26:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668E522D08
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 18:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668E522D08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KVFBvIgPghl7YULxQBmijjAvmCZGyS8uJ/OKUElWjCQ=; b=KO0q5OkZHCna34jq7q7hWvL+G
	KUkzq05nQNZE/9Ot5ioczKswDMyI+z0cW3WfHN9iEzkbOWO8ZYJPL7NH2SdhVjCrhNlXSCzOjRmBV
	DNNaA8XUzHGQaD8265unSGyADi3T6NXpr1fUO1TOds1MuKyONd2Eucw5yNm0XjhWRZS0iKPd5bvvs
	vD6IN67dEs9qpWQjrHaYfnap+TX12CCTpStojHsEVIlw9NhIJykox/kkkkNZW66KnKDunYeox4e5d
	Gtbz4/TvboJpj9981mr4MoP6cq4sM8BMVnYi8nu24aEae7n7ZM8iXj3+iYAIsLehRaNj+77ztZmkB
	VCVx/1W3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krPsi-0004Md-0r; Mon, 21 Dec 2020 18:26:04 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krPsd-0004MD-K7
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 18:26:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608575161; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=boae/yFyzMFV2fHDNm4V+5RRF34ofFyV7fKG+W+/I6w=;
 b=mriuQqAKDZx6zqu+pOzkymm6vyDQx8dJy/7ejD/AMSVi7XwgScKTb9yr/lvWw+iCFYVQtIVC
 V4VLy6gSSzFDgNvUjTCG4+gFjh07BjhpnRT3AfPUIJBUSWQNTed/X5pebZTd3o9SF7IJMcSo
 Lh/fVzmHzCo/b8vSgDqv7avQTCo=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fe0e8adcfd94dd32892317f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 18:25:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 761F8C43461; Mon, 21 Dec 2020 18:25:48 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EE30CC433ED;
 Mon, 21 Dec 2020 18:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EE30CC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Isaac Hermida <isaac.hermida@digi.com>
Subject: Re: [PATCH][master/pending] ath10k: assign new interfaces type to
 parent type
References: <20190712100846.11158-1-isaac.hermida@digi.com>
Date: Mon, 21 Dec 2020 20:25:44 +0200
In-Reply-To: <20190712100846.11158-1-isaac.hermida@digi.com> (Isaac Hermida's
 message of "Fri, 12 Jul 2019 12:08:46 +0200")
Message-ID: <87o8innhhz.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_132601_715544_F4055DC1 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Isaac Hermida <isaac.hermida@digi.com> writes:

> This is needed to have the AP mode working for SDIO.
> Tested with lastest master/pending code on a QCA6564 chip with firmware
> firmware-sdio-6.bin_WLAN.RMH.4.4.1-00011-QCARMSWP-2
>
> Signed-off-by: Isaac Hermida <isaac.hermida@digi.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index e43a566eef77..2c4f8da98b24 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5150,6 +5150,9 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>  	arvif->ar = ar;
>  	arvif->vif = vif;
>  
> +	// assign type of the new interface to the parent type (SDIO, PCI, etc)
> +	ar->dev_type = arvif->ar->bus_param.dev_type;

ar->dev_type is unused in ath10k, I don't understand how this patch
could change any functionality.

But I submitted a patch to remove ar->dev_type:

https://lore.kernel.org/ath10k/1608574994-30706-1-git-send-email-kvalo@codeaurora.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

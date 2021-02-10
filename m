Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44BFC433E0
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 08:26:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3904D64E25
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 08:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3904D64E25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cTzvskLbBINRZHt/wN5hRpL3FOMmlcgk3zq0fpywIEk=; b=IWWd3b0dosO+marWNqT9UrWVY
	BGWTK5hYeUyHWhpfsktQciVCDYOGDJ9qVOzkEooVFUXJRF69D24Le1JEZVvRlrwdkhICdZqyli1c3
	GvOnY/lhl00q3LMIa3Wynq7eAUHyd7ZZDc8kh9aiMHyigkSpTReRBKq1N9Wo5JoYOjaj6lwqKY0pB
	5UB0WWgVZ6Nz4mw285mh+gatc06U3SM4nFImcT/1vnFOodeqaKM01FutnmQzMEAQIdQJ98CfGKkEs
	COj3yQohnzklZpYITAf2VmfLcmalewrmfWRc+qoZO+nFsrNBuElERJ0nroBMYoEB6Ov5sMQkT88zQ
	TMLWnGyBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9koq-00053p-7u; Wed, 10 Feb 2021 08:25:52 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9kom-00052o-PN
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 08:25:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612945549; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=9EoJ98RLCOjfNGA9m9IWMD0BBEcL08tR1uiW4fkuRXk=;
 b=NJHyMIjm8rWteUl9Tqtn/jeMJmweAI9RgBjjzPoDsghcZ2DKYr73bj8EslWGgsrhT2lmk65w
 IY/8H4oCf9Nf4eo0SjUVodUtQ1WnlXzFPbofRpiQ78aFs6ULp/GlYr+qLx7N4dZtyUusbfen
 UwMc8kFT4pQJe/D1CUCfECtUN8U=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60239884f112b7872c5c7697 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 08:25:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F148FC43465; Wed, 10 Feb 2021 08:25:39 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F74CC433ED;
 Wed, 10 Feb 2021 08:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F74CC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 4/5] ath10k: detect conf_mutex held ath10k_drain_tx() calls
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <a980abfb143f5240375f3f1046f0f26971c695e6.1612915444.git.skhan@linuxfoundation.org>
Date: Wed, 10 Feb 2021 10:25:35 +0200
In-Reply-To: <a980abfb143f5240375f3f1046f0f26971c695e6.1612915444.git.skhan@linuxfoundation.org>
 (Shuah Khan's message of "Tue, 9 Feb 2021 17:42:25 -0700")
Message-ID: <87lfbwtjls.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_032549_840117_CCF689C0 
X-CRM114-Status: GOOD (  19.43  )
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
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, kuba@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Shuah Khan <skhan@linuxfoundation.org> writes:

> ath10k_drain_tx() must not be called with conf_mutex held as workers can
> use that also. Add check to detect conf_mutex held calls.
>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

The commit log does not answer to "Why?". How did you find this? What
actual problem are you trying to solve?

> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 53f92945006f..3545ce7dce0a 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -4566,6 +4566,7 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
>  /* Must not be called with conf_mutex held as workers can use that also. */
>  void ath10k_drain_tx(struct ath10k *ar)
>  {
> +	WARN_ON(lockdep_is_held(&ar->conf_mutex));

Empty line after WARN_ON().

Shouldn't this check debug_locks similarly lockdep_assert_held() does?

#define lockdep_assert_held(l)	do {				\
		WARN_ON(debug_locks && !lockdep_is_held(l));	\
	} while (0)

And I suspect you need #ifdef CONFIG_LOCKDEP which should fix the kbuild
bot error.

But honestly I would prefer to have lockdep_assert_not_held() in
include/linux/lockdep.h, much cleaner that way. Also
i915_gem_object_lookup_rcu() could then use the same macro.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

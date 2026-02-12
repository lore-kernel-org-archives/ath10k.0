Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1D6ECD6F7
	for <ath10k@archiver.kernel.org>; Thu, 12 Feb 2026 02:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMeKCXYa0BHuMAh+/NngREOlmrHv2zRJEiibcrVQlgc=; b=Ynejq50wQwCmaVkFsxItVjlu3K
	uVE2NY+Jzlgq3WE1ZsjlqI8D5Igcmhjk0jxtgQgk3afT7WFVsLXTwf3UIstCO29aesJfWaJiyp0Rz
	Hq7WtnsVG/YBGHh7HDwfx39QI3ruCC6sAHmO4bQ+MGLg1h9SGJsFAjgUpqTKBADapcK7e+mkbsUKX
	QbFBNuv680T9eWniLQQJetIrQNkI1dMNT8u8f05fejGqAniSi5s6FI7m3ZsmU6W65N8sNnp0DSH7w
	JqlZnS4A7Lq6e/DSLbOhQsksnaY2xt9CtVS/NDsF3PUTYQLMKutSbkv7FOWNBV/wpVy3kBBvQzAXV
	5oEp5exA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMBP-00000001ImQ-36NN;
	Thu, 12 Feb 2026 02:11:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMBM-00000001Ilu-2eKb
	for ath10k@lists.infradead.org;
	Thu, 12 Feb 2026 02:11:54 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3562e98d533so2845833a91.0
        for <ath10k@lists.infradead.org>; Wed, 11 Feb 2026 18:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770862311; x=1771467111; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IMeKCXYa0BHuMAh+/NngREOlmrHv2zRJEiibcrVQlgc=;
        b=GcjrH8yMilwwKIqVw0MWauy08Djdw4iLmcRZ404LO4c0wHJIdSCHjZcVP2eSRHDjJ5
         zRja12+UYUjEbDJdaCa4JAz0Yowv5eAYsU9MSv2WGcknmx6RxunKGygGyvlPO3Ul9cWc
         adEEBIC3vSwRKIFWyJiAnnyLgc6xeM0NE/dXgn56pwexDrm0cwum46s4kgNxPnizPA0N
         IoVKM+JQisLfLfZjau9HbEPlF0spTedVZ+3HsvKgvcZ2OZIeDvkVHxiLmdRuS3MmbT0h
         4Rq25z50fmm+FPV2NdWsY2ZzjmgXVsD3HPBg2AxjxoDLbnb2DgZNpAPGrHdBvsVspS2H
         bSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770862311; x=1771467111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMeKCXYa0BHuMAh+/NngREOlmrHv2zRJEiibcrVQlgc=;
        b=qLKqGI/IrNNZ5+u2N5K2sRLFI++LerzWK2ZRCbqs4jhlWPAjpqgtuhGM8mDAJQE3Fd
         b8XkdABI2K9Tt9S7bg6gH9do0h2SyxJ0hTlmhs99ryEnCqYTUBjAnCXjrpu+0lfcpPB1
         Fn1lzsE4yBwSV5dYv2u6fl6IID+neY8czNOZzROLAi0Je9GDCGaKGHDgr0NqvR5Q2DQz
         aRfO3iicsnp1rGA7B2cqbAoolEG8iiNrDHPYxGMLQBbjOmQ7bKb2bSa021cGKr3UltFG
         COX6xTOLpkUV7XtnAzeYRaqm1HgML8p9GrDoSAqdVUHBEHvP2upPW5k/LxJZoPcHATj6
         Gi0A==
X-Forwarded-Encrypted: i=1; AJvYcCUrFLN3T0ido8Hh8BJIQ75sc0mA/MGJn1OyElNgclJXYC6nwK2VpbiqhnHI7PE87LNKnDOJg68=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf5CYUsgCNZvSSi7ly0D6H7KKXqJwTPCTf8XYjdZBt5UXs82mE
	oHV5bOtNMSU9U4awaP7wF4H/MmiZHela2lSgqgbQJ2ktNDpa4+sw92G6
X-Gm-Gg: AZuq6aJnmW4j59F0n7FRJ4ekVX8asxS+/nNNhBlbILmuHaMODOqyLiG4hT2lAcyUb6m
	HhbSAvGCZYdhrLQ9d2u8Ac/0ZhAOxWYtFlIc220dXx1UyI9OEdd+VegOFgtjBdbhkppm5HGsYeS
	qBYlE5+v1sohTsThz2ITFFKG00KWA7jEEmFjkKPnm9+BiwdLe/NbqQJctF/B+nD126W78as3kll
	+Sp9PwLnopY8nV+b5WKJJo53pBjbA+AeKzMfzpidNe1yGd61zhLqJbSMXjWevg91dTXFv0kKFb9
	ExXAkpr00fmb0Aed/aXIXfqB2D7UIwzxJKed+oblq6GSULbANHgsbYzSUxsfRPJGv0tk2MC1ynY
	8q4lvsWVxq9K5ajXmSc2ySZ1z0ytSKbGzO+eU0mZsNmLmu7bY5Hg/dUb7iW+mi5Jx2ydFxxYpjc
	IOGbcu1AwDzz3lSVSq8lg2fc3NGoxZcvhcp0qdvxih5ljNlJR2TfM+j5BV
X-Received: by 2002:a17:90b:180c:b0:349:9d63:8511 with SMTP id 98e67ed59e1d1-3568f40439dmr799838a91.25.1770862311053;
        Wed, 11 Feb 2026 18:11:51 -0800 (PST)
Received: from [10.100.120.15] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567cf57f81sm1563151a91.13.2026.02.11.18.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 18:11:50 -0800 (PST)
Message-ID: <dd019903-f8d9-4bd3-a90d-b4d505f489f3@gmail.com>
Date: Wed, 11 Feb 2026 18:11:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] wifi: ath10k: only wait for response to SET_KEY
To: Richard Acayan <mailingradian@gmail.com>,
 Jeff Johnson <jjohnson@kernel.org>, Michal Kazior <michal.kazior@tieto.com>,
 Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <20260210021249.12132-1-mailingradian@gmail.com>
 <20260210021249.12132-3-mailingradian@gmail.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20260210021249.12132-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_181152_701420_B64BF3E5 
X-CRM114-Status: GOOD (  15.56  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/9/26 6:12 PM, Richard Acayan wrote:
> When sending DELETE_KEY, the driver times out waiting for a response
> that doesn't come. Only wait for a response when sending SET_KEY.

We've run into the exact same thing on the QCA6174 and have been 
carrying an identical patch to this for at least a year.

https://lore.kernel.org/linux-wireless/b2838a23-ea30-4dee-b513-f5471d486af2@gmail.com/

>
> Sample dmesg:
>
> 	[  117.285854] wlan0: deauthenticating from XX:XX:XX:XX:XX:XX by local choice (Reason: 3=DEAUTH_LEAVING)
> 	[  120.302934] ath10k_snoc 18800000.wifi: failed to install key for vdev 0 peer XX:XX:XX:XX:XX:XX: -110
> 	[  120.302996] wlan0: failed to remove key (0, XX:XX:XX:XX:XX:XX) from hardware (-110)
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/net/wireless/ath/ath10k/mac.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index da6f7957a0ae..73aa93043f8a 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -324,9 +324,11 @@ static int ath10k_install_key(struct ath10k_vif *arvif,
>   	if (ret)
>   		return ret;
>   
> -	time_left = wait_for_completion_timeout(&ar->install_key_done, 3 * HZ);
> -	if (time_left == 0)
> -		return -ETIMEDOUT;
> +	if (cmd != DISABLE_KEY) {
> +		time_left = wait_for_completion_timeout(&ar->install_key_done, 3 * HZ);
> +		if (time_left == 0)
> +			return -ETIMEDOUT;
> +	}
>   
>   	return 0;
>   }


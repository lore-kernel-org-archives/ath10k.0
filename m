Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA4CC433EF
	for <ath10k@archiver.kernel.org>; Mon, 25 Apr 2022 23:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVfcTmGjb3SXirnPTfZuTWZsU8uiPlSCcXxt+HD0ElA=; b=uUeWny3Ot2Hd42
	81DvvxdvSy2z8bPqlVIZz2EzafdKstQVGP6MJvudld06VC8euwaFzbC7/5vSSkvXhyVBir2twP5Dz
	JMkQwT89zqU5Kx3lhCOAboJ85X8JJN9KbYfldrUnnmy2+RXtgVUUcLOT1YJwAWdCJR4yiv3mEYve+
	TO5424dOl0lGZxSdqmZKvFKkHGMEuPfnFG/grTmtrVIsoGk9zZFxDuV5Cknjq2hGXdUEi+qHilymP
	I6R/pMesAemsSS9pS7QX2DFKTag84IQuKi7bGaF9GAk9Smv4d1td3cO+0tAU/P9YrWm0CXNlE7ZYG
	G5eOIzHRaRIxFWdL9Zkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj7rz-00BhsP-In; Mon, 25 Apr 2022 23:11:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj7rx-00Bhry-7T
 for ath10k@lists.infradead.org; Mon, 25 Apr 2022 23:11:50 +0000
Received: by mail-pl1-x62b.google.com with SMTP id n18so28601155plg.5
 for <ath10k@lists.infradead.org>; Mon, 25 Apr 2022 16:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7qfaiS7UptGcLjv78D3MJ3R6HW7ht14Xm/IpQ4WlFks=;
 b=MmhFoO2V8w9wi8xpsU1YJ3SIL+O1UDp6+GMDMyeQp/HYO0bw9etoHhAaDiQhGx+kCo
 9/zrw47FA6hWwth8/g/FVpkVz2aRxuLT2fHCJhSEgPH4TXyXv9Rhv+jTf2zyAbGQTK2X
 lgZ8uSIrgQAY/M9WgRVxk0xSYXDZ7ttngcP3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7qfaiS7UptGcLjv78D3MJ3R6HW7ht14Xm/IpQ4WlFks=;
 b=Dx2WDTuSdMhH6TyiIUXmbKzwoaSrlAfUMjSQOxo9LEoqYZ9nBp4FLy8MckjPZjjsPr
 g8Yyxmg0XDiIARrpha+ID0S1t8Fv5jVP12qssmJteq8biufPso6xO7fGafTLHT5UJJSv
 JnV+H1HvKWJl8ZcEezqDeDn21ctUBNaSt6X+Xwy3s/V25m9uuK/rl9MrLQxrrowP1ZCp
 Fb6h+cOcIHPX6MiNEG04fZHN++Cnskbg+LTFBHIfnEJMd5ZY460GesMF3j7/D1uFzgL3
 k4Wucsdu4i+fHnYnnW61t7uOQ8sR8b75z4nRLvKlX4rfZoPxnX8GThV+45Lgq7YhpS0t
 1l9A==
X-Gm-Message-State: AOAM5320SDfEiwuXh+KxOX87V3+4Jog728y3OaB+plqSEYfospFezxUI
 hxVl3XY6khs1dmFSPso40+mCZQ==
X-Google-Smtp-Source: ABdhPJxq8tSG81ZERtNbzC6rp5Tzf57SH9Vgo2lZtFXB6AkCwnY/CL5q9qLUlUQbRHBd70yLFSRgyg==
X-Received: by 2002:a17:90a:a82:b0:1c9:ef95:486 with SMTP id
 2-20020a17090a0a8200b001c9ef950486mr34213615pjw.93.1650928307416; 
 Mon, 25 Apr 2022 16:11:47 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:84c6:2d6d:c16:1a1b])
 by smtp.gmail.com with ESMTPSA id
 f4-20020aa782c4000000b00505da6251ebsm12495302pfn.154.2022.04.25.16.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 16:11:46 -0700 (PDT)
Date: Mon, 25 Apr 2022 16:11:44 -0700
From: Brian Norris <briannorris@chromium.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: kvalo@kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 netdev@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] ath10k: skip ath10k_halt during suspend for driver state
 RESTARTING
Message-ID: <YmcqsFyCMqcWAEMM@google.com>
References: <20220425021442.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425021442.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_161149_385044_AED6D994 
X-CRM114-Status: GOOD (  16.48  )
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

On Mon, Apr 25, 2022 at 02:15:20AM +0000, Abhishek Kumar wrote:
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5345,8 +5345,22 @@ static void ath10k_stop(struct ieee80211_hw *hw)
>  
>  	mutex_lock(&ar->conf_mutex);
>  	if (ar->state != ATH10K_STATE_OFF) {
> -		if (!ar->hw_rfkill_on)
> -			ath10k_halt(ar);
> +		if (!ar->hw_rfkill_on) {
> +			/* If the current driver state is RESTARTING but not yet
> +			 * fully RESTARTED because of incoming suspend event,
> +			 * then ath11k_halt is already called via

s/ath11k/ath10k/

I know ath11k is the hot new thing, but this is ath10k ;)

> +			 * ath10k_core_restart and should not be called here.

s/ath10k/ath11k/

> +			 */
> +			if (ar->state != ATH10K_STATE_RESTARTING)
> +				ath10k_halt(ar);
> +			else
> +				/* Suspending here, because when in RESTARTING
> +				 * state, ath11k_core_stop skips

s/ath10k/ath11k/

> +				 * ath10k_wait_for_suspend.
> +				 */
> +				ath10k_wait_for_suspend(ar,
> +							WMI_PDEV_SUSPEND_AND_DISABLE_INTR);
> +		}
>  		ar->state = ATH10K_STATE_OFF;
>  	}
>  	mutex_unlock(&ar->conf_mutex);

Otherwise, I believe this is the right solution to the problem pointed
out in the commit message:

Reviewed-by: Brian Norris <briannorris@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

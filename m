Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BADC07E9D
	for <ath10k@archiver.kernel.org>; Mon, 26 Sep 2022 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kf+6zr3m/hD9Ukh41LaHjvCjLmJwmWMG64iEL9W8++U=; b=quvH8rN0a82BBv
	JuqksaM31max73OJfRQXZdn5YbkK3/PQ5WY0Ayheg4Cpoll1/Sze0PvWaqrmwLiCRyxqMl/xwLe8h
	oE5QnkjMhglgqrU+j/ZWhPZIZi1UftX/b+R4FtQXxTol6QQ7hmjfURoisHZ1goBw04yVc+hJhune8
	zDcYsQz0RWtosME95w4LC2jV8Pexc3MBpWFQSqrM8bUZVsiMQuSJpv1xdrNr8f0IyGSP/QyI8MQ73
	tWC8V6Xf6aEaLYvmRjcML7EkUyLAU9QqDrgqyQeYiRWpkYmFcOsIcPxn2Izac/ChLwI+3pdRtbC9L
	VEiVWneOr81oZUB39piQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw9V-0077aW-EO; Mon, 26 Sep 2022 22:00:37 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw9S-0077ZP-Ni
	for ath10k@lists.infradead.org; Mon, 26 Sep 2022 22:00:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id e68so8042644pfe.1
        for <ath10k@lists.infradead.org>; Mon, 26 Sep 2022 15:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=vA/6myQNQnJHYk+EUx6DGwR93ze/m7/gJ74a1YFBZ2E=;
        b=U8sJtotxHMan7w/+4cTY25Ek0IfBdX5nCMlrmk+usONkjHNzmc7aD7dc0o8CYs171r
         tQ/XiitLYP4hzQ8L64lYJumQEojtI9TgQluFVjbRZDcyZ4/NDftB8giHUEk0o/af7Yca
         4HFZaiM/0R/tiAmzw0SY5Bbr5mQZqxk6Esb7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=vA/6myQNQnJHYk+EUx6DGwR93ze/m7/gJ74a1YFBZ2E=;
        b=ShEA4OsONtAxJq+e8ZUblc+MamzS/4En6TCXsk97Js/mPS5cV5iY6RgEWlmRFOLCwI
         Q2HejRjeWN4veO+V2JMhkpi2HHrrgcJjG4vtOnz5xHw1d/+DOK9X6yd2rGgeC/cInKGx
         JGZEEbD1YbsmKAq21yRBXMW2ArNRrK/b/Kr2Tkk65IfyDcZ9TinMoOJMzNmTf+0aitUu
         h8aTbWdKJHHvshuMnxoDY61HJTbc1zh62XeikzF2gPlt1TDgyxvhSBVhEBWtitldCQnI
         v1jJLLHpBibbO2f+fZBiNE4bEWmRsox5vjQBIIj9OGAZ7ybBbifffcgjix9lWZ8cRL3+
         VnnQ==
X-Gm-Message-State: ACrzQf1mQrX9gb/UXVWId8xEZLOlvtrtn0uKsg7eTUiFC3QUmgXhwXRk
	d6p9BrarRV55VlVwDV61wLtj8A==
X-Google-Smtp-Source: AMsMyM5JiIgVIgSTi23Z1w9ajKUhq1aAliulpHYeL13NSOYqKW4HOG61sl4hc17hHP8PREpsKCyqHA==
X-Received: by 2002:a63:fc5b:0:b0:43c:3f90:ca07 with SMTP id r27-20020a63fc5b000000b0043c3f90ca07mr18295865pgk.110.1664229632744;
        Mon, 26 Sep 2022 15:00:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 7-20020a621507000000b0053e80515df8sm12685410pfv.202.2022.09.26.15.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 15:00:32 -0700 (PDT)
Date: Mon, 26 Sep 2022 15:00:31 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ath10k: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <202209261500.38CBB07FB0@keescook>
References: <YzIcoloIQBDqGlgc@work>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YzIcoloIQBDqGlgc@work>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_150034_793744_3347E6B5 
X-CRM114-Status: UNSURE (   7.92  )
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

On Mon, Sep 26, 2022 at 04:41:54PM -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/212
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

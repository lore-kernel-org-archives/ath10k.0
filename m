Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC85CFD368
	for <ath10k@archiver.kernel.org>; Tue, 25 Nov 2025 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUudSo+Hu+T3sFFrzKApdVsT231wP8h5fao4Ts27aN4=; b=aAUivA9GNvrNEg1IjqJ0GIN8GD
	qNbQfOfy56LLxi8rWEc6KctUm/W6+ZdexTPvwLt5rhFO69jA93OGqbohVhW+oddMiPXYemj+LaRrL
	wA28JIionyPWIWBEvh9Q9biZQFJyrDW4V0VYQ5yuu2lukKZ17ZrUWtDkmXlDofwUc9XkjyOJI86oA
	n8iq/n+3mqy63pGFotAy3HWWt8TP/Eh5/VU5TL70HoFVtw38NXVD+25bF3XkO45h3pUbTmbqJZ88U
	UbgrH8ltgZEVDzdLin/4PGuPxJjIo9pm5M2+8JJd4QxTmvnVNXkz7CuD1XAgY8fzMtJnS3bycL4aB
	GMefdcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNn1R-0000000CqoS-3PiW;
	Tue, 25 Nov 2025 06:59:33 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNn1O-0000000Cqn9-2y5y
	for ath10k@lists.infradead.org;
	Tue, 25 Nov 2025 06:59:32 +0000
Message-ID: <b0a488db-7965-4b3d-9f12-5effb7b0e3e6@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764053950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XUudSo+Hu+T3sFFrzKApdVsT231wP8h5fao4Ts27aN4=;
	b=RbFACwaLxsaWTyOYQRYz4fdRVzcmJ2Cd7kJu9xehcZ/GrLyeXBm7FUlkg1vqRjL66xibg4
	31/PKuuRA9SSZR9p9cikw8w1dhMMIkHWD6/z9Fx2t4HK6DY8sJEZGwiZRWtXEKX8QIkv5Z
	v5jDkyLuoQ09DL1tjY7pPYoEi1ohOGAL7G0wfZI650ta2lNBDThb7px1uc5NWZU9KpFxMd
	b5fFYN2Etq0UZYf8rMs+JwD79yVokSULHUfwdD+XgM0lXseiGCBRKyYHfgOiVF3YyD+Skv
	914qgtSl5zi6w8z6igVxZhNAbTOTEoIuVQQMXbTpgC77YVgg+UJRWdxYmYYTDQ==
Date: Mon, 24 Nov 2025 22:59:04 -0800
MIME-Version: 1.0
To: amit.pundir@linaro.org
Cc: ath10k@lists.infradead.org, bjorn.andersson@linaro.org,
 davem@davemloft.net, devicetree@vger.kernel.org, jeffrey.l.hugo@gmail.com,
 john.stultz@linaro.org, konradybcio@gmail.com, kuba@kernel.org,
 kvalo@codeaurora.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, robh+dt@kernel.org,
 sumit.semwal@linaro.org
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
Subject: Re: [PATCH] ath10k: Introduce a devicetree quirk to skip host cap QMI
 requests
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Paul Sajna <sajattack@postmarketos.org>
In-Reply-To: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_225931_033839_E38CCEB5 
X-CRM114-Status: UNSURE (   3.11  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

+1 on this from me. I need it for my patch-series for LG G7 ThinQ 
(judyln) as well.

https://lore.kernel.org/all/20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org/T/#m90e8087d4388e588b71a0eff01b88f1721f73b73



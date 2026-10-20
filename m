Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578F9606A319
	for <ath10k@archiver.kernel.org>; Tue, 20 Oct 2026 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FB63oroh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IVf7Prsx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=; b=FB63oroh0Ley2gv7uWm5anQPfr
	u5QSE6iCzJwea4FNVnIbMBrOTXO2nPT6unqjlxtKbAjklfsoemF3E0QriAN/zHW0Cf9Bku8viY4uB
	F0xCOpEg63kZGNNp0Fg+eCnQ2La/18mwN7yOEH7R7cqh0JX1VgVpnRmQGFiE8aiBzGoklahyIfifR
	LFP4YrCCHC8cRBR20Da79m6m4RPWnODaLa3RIAnHwIUGcB8dHf5CQE2CpP6SNsK5YlDBNS7a7Z2FQ
	7nnG8fEug+4P2r/4rTJbm8yZed789HovQxU0gOdjY18+0FstdnQSZerJex7a4NNm97GtSqvzspnZK
	p+2BnxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJGRl-0000000Ac2g-3Azf;
	Tue, 20 Oct 2026 20:28:33 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJGRj-0000000Ac2N-4Avy
	for ath10k@lists.infradead.org;
	Tue, 20 Oct 2026 20:28:33 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso614951fa.1
        for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792528110; x=1793132910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
        b=IVf7PrsxsNIWkuL1/x0nECpWLro38UOE9g3xWjarMa0w4tsoytmxzOo+sH+DZtNMax
         rIm/SwWoekum5JUGs/oB30vjv1lLDwWTBSWE1m3mko7Qx3sQ/LURVcCkocRuB5lDbUwv
         CukC5Z6UHyFhnOowba8dDQyUOd1xsW1nKePwioN0ZAFqCTVN03O8jU9V531uKbTVZKkD
         uyzIhUhOoDLXyJ7NblejJ5yAeZoWYdcbFqFclyzSOllbidOlITo8rSCIsba1OuzO5LLV
         02saJppHPLxXTnknRvjyrHOxFvP5zgzR2nzG8TT70Ek9JWvlutuvR3ICCPpovR0HB9Tz
         HOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528110; x=1793132910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
        b=M3HZneqrpytKNcMiHxrb9D5rm5cKX8RAUMxZUoI6l6bl6M560aZGHUefWvZVQUAcxb
         olp84YvO/CsVXavlcT/+sD8JExxTl3jZ8AxKgkMl2o6JgXcNbCqyDXMZMQyaLzasKeGH
         YSNCY6O+rgNulonTkHBW0QcCGo6eq0Ij2qCgPoixBJC1nT09T+a5vHz0TEhhw6/pYnMM
         qHtT0qX2DOjb8VSHvCyhi8Y+ql6Tsjf8ucvz4wy0vLiwvC0UU1/1axmyEWfPfE+UCiVT
         Cb0u5Lg6P/Zt0VMea3ubM41FflQe9+f9VYt/0Js4uYPdOh1vqZPIkbDdX9XlaLlDoRVX
         Lx0A==
X-Forwarded-Encrypted: i=1; AKwUvBxDYSDykxdZdw+rWwSaMRHd+AUzUCDVb5B8Xpdok9ufgWFavBpn338O/fb0WypOpwazNPkbbv4=@lists.infradead.org
X-Gm-Message-State: AFq9FYJKCXA0cNOMnk6ajQy/wdoXa4nhvgNRTPfgByPXGnWfQgKr6AbY
	A53n0D2sxKe+oZoCVsS/jzC2GPOxbKZzLxwAlz1xFgVw1NRa15GkaYUQ
X-Gm-Gg: AYBFou2P9oxJYo6iQea7VizObdXQ1hsvBRu55YOONLif4aEtswJvxl9Mz7aSguSPC9J
	+spC6SdCag2I1M5PGG/wG2aQQxu6WQi9VGcx/Aa+0qSe1gTDiYyH6ob6a10gh1xPv5gR55ItIB3
	XsHX/8f3qqa9iP0nRijuHbPnizk2ivndYv7H1izZIvYr4mcyxNXZ6bPSJpur9HlIA601bAdhvqv
	RfWBoq7UrRSJhudtqbJcsh2gpOvzpqg7xCEcYRRtUAmzBR9ypcsZDY/tpcJQcfnzXzlUAPWCopG
	UPy/850mTSmMiUf8/o75dVjfm5a6xg0/toTU+QTUqz0RUgPY8tHSua4FEUCDxFYxm9xU9yZQNux
	pWDT6g/huBsONVulglnbcz3FEkK/yjQfYOoyeO3k7qxBA72HNwHUqM2NbFtAlj3ZtMisOYa9R+5
	ZlqPFqYVJfyPd8QSv9Ny/zYOde1BGj8SAiTucOOKaNNtnz2lWDajpWwqSt2WiVwZ35LGDdrMhYs
	AQIx2BdY4LIR69vJTiuMndD+XOqasV/Tx0sLbatyYdJCWMFHbIn7onKpbI3z0UKhMgEeGvmObMr
	Nt4cdR7O0gvBCt7ymMjipURZiIkgsc0akLr/FoE+LqW+Da1lcgQGzf9FMZYZCW6YkDCsW6gpLtW
	qIg==
X-Received: by 2002:a05:6512:1589:b0:5be:680d:6e18 with SMTP id 2adb3069b0e04-5bfa1be6184mr25360e87.10.1792528109517;
        Tue, 20 Oct 2026 13:28:29 -0700 (PDT)
Received: from kompukter-Systems ([83.142.235.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1230c48sm88136e87.66.2026.10.20.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:28:29 -0700 (PDT)
From: Andrey Derkach <gabin278@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] wifi: ath10k: make in-order rx amsdu buffers persistent
Date: Tue, 20 Oct 2026 23:28:25 +0300
Message-ID: <20261020202825.1178464-1-gabin278@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020195021.1133728-1-gabin278@gmail.com>
References: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz> <20261020195021.1133728-1-gabin278@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_132832_042122_D9870EC3 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 22:50:20 +0300, Andrey Derkach wrote:
> Throughput is the same as with the old version, about
> 60 Mbit/s here.

The 60 Mbit/s was a board data problem on my side, unrelated to this
patch. With the right board data the link runs at VHT-MCS 9, which
exercises the patch much more: during a 120 s TCP download at
172 Mbit/s the firmware split an A-MSDU 211 times in 62,700 in-order
indications. The patch resumed all 211, with no warning and no
recovery.

My Tested-by above stands.


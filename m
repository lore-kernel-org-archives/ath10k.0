Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D2B606A31E
	for <ath10k@archiver.kernel.org>; Wed, 25 Nov 2026 17:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yp5Qu7Rh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsC2GHsq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e41widtp5DMmdFFeX2AWf3mpay/8eXwXnXNPU/S4dOI=; b=yp5Qu7RhhiRWSg
	tx8deZCipCEVg8GrJDP3TpBrfQMABMMuv6mD+z4FmhV8bk324Xhm7khKP67R3Z76agXcS712CPJ+A
	pC3hONiweuUydGXbNJMtbpFfIwLHvk+9xCMyINbsH3g+kg5ygbNAbBubO1APaYZ6xWlOkanmBaAQc
	y8ZLBtPm2vUp8GhRMnQpRTkCatIGpuOxIdZQrMDc0Xo8ljAxdrFWvxmsUiZccjUdc8Dc8Kpbtr7BP
	x8YtUkySx6B/SE32KmbmQhJsIha2TamrKc1pYSzwY50VH1X2VXrPgybty7QYEALDm1rqCmXeUGN0N
	Lp28j/AjPcDLjQyGAf0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGZr-0000000AhEW-3IZt;
	Wed, 25 Nov 2026 17:14:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGZj-0000000AhAU-3PWw
	for ath10k@lists.infradead.org;
	Wed, 25 Nov 2026 17:14:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so54249315e9.1
        for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 09:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795626868; x=1796231668; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e41widtp5DMmdFFeX2AWf3mpay/8eXwXnXNPU/S4dOI=;
        b=tsC2GHsq7omMBGw1nr4FqT6pTGb4OLFQLgvRIFGGafKwOwhBYm+N0ThSAvLMYsV+tL
         f635edFx5KjdUVSoq4Yv8BzoG28LcV0FpwKiQ8j7SdWs47f13TohBgQZQqspIB+48qxj
         0avmO3f2dBgFYXqyfSafi3xXH6cYg8Q/6tH1xHXf8plBAs0f54rXdYbkZezAesJvMxjP
         S/8xtlTEPIgzA2poUNcoMK80m+t7m/zvaXqEox6TCwhRhacjSFEz1en9GNp9rJQvjqe6
         tBzLFnJyYzWaOgP1WDI43L+0/6h0TCNIn7bZ7XP6h7HQ1+GTGa3jFP0uE+zEH1EAXDvh
         6m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626868; x=1796231668;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e41widtp5DMmdFFeX2AWf3mpay/8eXwXnXNPU/S4dOI=;
        b=r7dt+EiZQ84HpKEmTUogh4R91cAYqlApLmQXjIgXPu//BNaE0pNqGfmTNK4JYEDDO6
         2ZHttlyQ5BAw5LVdN3lptmwJ1+7vWYjjC2fzPuZSCRr2TE9tT1bL1DYDxGQ7MDX23yqX
         WvSCoPMkiyN2LQTIdaW7jw3tEPZDxAljIyaTHiXdpfSX4kU+3jjiCIwQbmIEeMRfNX1P
         sJnaxiLbizDgycA1zWYT1fhpBdiKkBsyKuLP/uS+D0E/3sVKjiKVqpf0R9Bp0d67fmq4
         RLYRjjYWUmRsQjD/T37Sw2k+69jIrzD2HZpy8l4b02khb4yc8FPtGagZa2afR2wbvNWZ
         vmvA==
X-Forwarded-Encrypted: i=1; AL+hErFaahYbxw0ts3D+8UMC3adwY0A56FIomH17NU+mCLIFRIQMO+Yg+Wi0nQ6J38ls0/q32kYZnL0=@lists.infradead.org
X-Gm-Message-State: APuU4Z+vggxExOJ8rtibA34sW5td+WwYHgsqMteBpBq3eweQ7Kibp0Jp
	+2iII/rRe21iok2oKjkgq50RpLCvulQNhC7rGmT+i2nkODzCo+0g6fZx
X-Gm-Gg: AZFdTZeeZuQF8ZIMw73fH+T9UfWmcIlj/6tYCUVEh4geoKzbjhyh2zqdjTLOadSZUXN
	0Obsv1H/i5Fq8hi/xefkUhSTBcjhyIaIankpD2ZoUBD6I+w7agWDepg56ik8VFL/Nf1b8p5rt76
	DC7A3/wzTnOTibzkB7iVDk3OT2K6ZpnYKk4YFL2wxyg7zdxmH544HbJXUEH5t2NZYCpIibq+kgC
	+xZ8gYCAF+MXH+p8uWiW+RR9grLh2BdUbZ99FTiHD4s3WUkx0tKHIQ42awJ1wy7cP56KSACTLXI
	rn6YZh3ClYJ/cFfpsA5Jxf1AvOjs5z38IhIKqB7FxgjaspsaC6KDCSz74UHNNbn0NEXvqxNj0Nb
	KZ+GNk2KOdVxJVmoax6Dv1BkNh/dI09qW3p4fE9m0MuJQ2dWNhnWdypUZeZ9PB/Zox8dHVUQZYm
	wRNZEsJAZQz9gv41rf7m+GEow7QL9Rnv+lixkG5E/BJvV2oDf5Y6r8jI29BO4eRDbh21h9xq1Fg
	KX4FOwsAjtPKyPwDzxgCkGZittUlW8dq9OZsZUAIxwot7KnHjmwWcsjkHDYYsgwaKeSiMMxS6m2
	+wm6x9WkRKlsw6MZ2sxJ224hCGekUH87VncZJZc=
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr398107485e9.13.1795626867730;
        Wed, 25 Nov 2026 09:14:27 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:11:8cbf:d366:a6fc:52dc:af7a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm244377725e9.3.2026.11.25.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:14:27 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath10k: add firmware feature bit to skip channel stats events
Date: Wed, 25 Nov 2026 18:13:29 +0100
Message-ID: <20261125171411.96431-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CAFEp6-3cQBaC1Ob1B8v8ZmQcMd_KfyABXxV81M9u0RkBY=Z0Ng@mail.gmail.com>
References: <20261121194939.3647400-1-morf3089@gmail.com> <20261121194939.3647400-2-morf3089@gmail.com> <CAFEp6-3cQBaC1Ob1B8v8ZmQcMd_KfyABXxV81M9u0RkBY=Z0Ng@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_091431_881871_B6FDCDCF 
X-CRM114-Status: UNSURE (   7.81  )
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

Hi Loic,

On Wed, Nov 25, 2026 Loic Poulain wrote:
> Are we handling or using the CHAN_STAT_EVENT data in the driver? If
> so, which event handler or function currently consumes it?

Yes. With WMI_SCAN_CHAN_STAT_EVENT set, the firmware sends
WMI_TLV_CHAN_INFO_EVENTID for each scanned channel.
ath10k_wmi_event_chan_info() handles it and parses it with
ath10k_wmi_tlv_op_pull_ch_info_ev(). The default WCN3990
firmware-5.bin doesn't set single-chan-info-per-channel, so on SDM660
the event goes through ath10k_wmi_event_chan_info_paired(). That fills
ar->survey[] with noise floor, active time and busy time.

ath10k_get_survey() reports ar->survey[] to mac80211 for survey dump
and ACS.

With the bit set, survey data for scanned channels isn't populated on
these devices. I accept that to avoid the firmware crash on every scan.

Regards,
Gianluca


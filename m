Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D01C369B4
	for <ath10k@archiver.kernel.org>; Mon, 14 Apr 2025 19:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=; b=C8Zv73vmoEaY3i4xLYbrGHmCWE
	MnUf0V/WSDvgRr2JGo6w5sUHpwQWN1HAbGEhjwo7n41WIhvoU4zICuRL6Di6CCPDAd8za9dBVsrlp
	czaxvXnjTpPiS7N69OLngcnoG6xmDKCdnESr9q/FqJZOG66nXxEn1074hn/vuxx+6+gk2bzEYsqeW
	xuaWVW/IvWz+6/sfKqrUVHXcxUQZgaCtCjemoAa99NZCDcriCspBwpzSsLIwTlOFEP/T98DySuGF5
	wXMHXsZGTGMncwuOA/BFe+CDa6iInW0Wbi5lB4GoEBWQ9xaOqvor8LX2YGQgcLOqgQ0GtsKM74Srj
	6Ob15+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PD9-00000003Eoz-1XEC;
	Mon, 14 Apr 2025 19:11:15 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OnG-000000039YX-0L2E
	for ath10k@lists.infradead.org;
	Mon, 14 Apr 2025 18:44:32 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4048830a12.3
        for <ath10k@lists.infradead.org>; Mon, 14 Apr 2025 11:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744656269; x=1745261069; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=;
        b=KNDb+73A5TzuqB4z0jvGdsjDjmmCbYFKmN1im6jhxImSRfVtn9d+V6WZtJ5AXTsp/Q
         ZiU1nrwTM/4jYiokNwLN/DUiFUK7t2BGJS/irKRmBDlmdd4hgNmNnju+/ZOeJWBaGa4J
         jbEE1LY77wrfSSe96otTWAsNDnz5NPBJs5y5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744656269; x=1745261069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=;
        b=FJY66sxcpfXcdKQzMdBByKqqfZr5GQp1MM7nm2dBIkdZa2OKZPGjBWv7ywdiBGIBz2
         DmUfCA0A6NXK+CEZ3y8mma6sCR1iqhw3NKy+rpigwDkqbibs+loYb8AeT3jbWwX6G/pl
         sVf6WkLRpATTRXfkwEu5eRtx1TqN6sDGwf9fAzblTsd9rbuiXdFpswFkjolAxPYSO5eu
         JWF5mTIebpTvowt5nKMHDo1piTjl+LmoO8M1bjuq4fsnJK/0nYyATl7JLt4/ZFBsB3z2
         L132VBefseec4RHYX7L5qajYvo5t6mNGN9cTROP3qLElS8VKkButi+jdBiPZdgE3D4Qy
         UcJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq817PcPOj9wiRv5RMwvEdUD2+Xqc6XqmMehzHNrB+d7r8q+NRUslYTwv3cXbtpDKNSH6n77Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw21eEg7/+RBp8Sl34NnqzhmFsWiuRk4d09irvOJ7EuHi5IP5uA
	+X66p8KmKcPsllq5/UjSL2M9df5mYkKteiXlPXEAn56kivxn7Dus7SI9RGJUNA==
X-Gm-Gg: ASbGncvUbPZ1u4QyeWzm7H6LxcO1SUQ9hGAqCyA03cImANPlcmcKDDwBj8tFy17Uwgx
	Tao64dK/KqF5mCzhG8b3AOyRZiqhWPPcKGd7PbUXf/c9LaGOhQ3ZHmCpyPOE2af3A8nunabf6Gf
	Zu5fY6mhNfHwRo+ON4tLgE2ep+oxYZ5MgOG7TwZUcjFsrv1F7fKN6FkivZpEuObZ6koQ1NkR6Pb
	w20q1t2P1N/4T+IW+JlzRFzxBlryzWTigTSx48ZFrBaG7WVjY4aci9QiuXvKpZSDENORwr8F0WN
	4O7WtEaZwaOAwd2qBpX+dPr1+maaIU/PZ22hXRjA4H3YEMMxh/Q7LiWJiKOj6U6jZre4cGL9WTn
	5SA==
X-Google-Smtp-Source: AGHT+IHRnGevNVFCEzzLtuARDY+GV3b1ySMboNdXjtt9nCxP859MMeYdEqvd7RpkkuyGR22MEOT6ZQ==
X-Received: by 2002:a17:90b:2752:b0:301:1bce:c255 with SMTP id 98e67ed59e1d1-308237ba788mr18304386a91.27.1744656268888;
        Mon, 14 Apr 2025 11:44:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cfd0:cb73:1c0:728a])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-306df082327sm11386410a91.15.2025.04.14.11.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:44:27 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:44:24 -0700
From: Brian Norris <briannorris@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 0/7] net: Don't use %pK through printk
Message-ID: <Z_1XiNY2ujreEo69@google.com>
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_114430_134936_5B74CD3B 
X-CRM114-Status: UNSURE (   9.22  )
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

On Mon, Apr 14, 2025 at 10:26:01AM +0200, Thomas Weißschuh wrote:
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk().

Is this really true? Documentation/admin-guide/sysctl/kernel.rst still
has a section on kptr_restrict which talks about dmesg, CAP_SYSLOG, and
%pK, which sounds like it's intended. But I'm not highly familiar with
this space, so maybe I'm misreading something.

(I do see that commit a48849e2358e ("printk: clarify the documentation
for plain pointer printing") updated
Documentation/core-api/printk-formats.rst.)

In any case, even if the advice has changed, it seems (again, to an
outsider) a bit much to say it was "never" meant to be used through
printk().

Brian


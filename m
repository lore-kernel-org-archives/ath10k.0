Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E9AC4332F
	for <ath10k@archiver.kernel.org>; Sat, 31 Dec 2022 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQ7EVDiWVPz63itJ9YW4Hll5UqCCWvjVYN59nLGHrXc=; b=h34L4NpAyJ6bUT
	o0CQAxCtmErJh8DrRRAcrWZG1k8YCPb1c815t85yu65DWnFJcWXYki2qJzCKm6kxrOoPjrMbKWtrw
	TDah/Yy3xu5uqiwHhc74XlrLx2dL/rbUr0MTmG4HpURsCA1tTSLKXLQ5kodMA0T7Zwc431QZlqldi
	PYUKCJMPsRyurXFNbluMM2wcr/fuRkjm3B4MU5fmnUVB9wVkd63VKyhIhY/ZFUUOZUe5O04PrQ15W
	1BypYcFCK2jKGfXEhhMmTINcamfTrMGc/epPmBDXI21rkYsXsGopwAqXPllLhCusZvlTb28FYeIQb
	x0oQljGEfUXAUKJB1KJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBVzb-001j5k-La; Sat, 31 Dec 2022 07:09:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBVzW-001j1z-Tz
	for ath10k@lists.infradead.org; Sat, 31 Dec 2022 07:09:18 +0000
Received: by mail-pl1-x62c.google.com with SMTP id y19so4918586plb.2
        for <ath10k@lists.infradead.org>; Fri, 30 Dec 2022 23:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01QSWb+vNnF1t8OcBQm5Ba9XSixXs+321OcoswGaF1w=;
        b=hqDl3Qlrzp3knQuM2//IhJB7vwv/CZ2DLunfYvyeBqZJds8M10rhz+F0cfjHR/2wPf
         AkPSATUS5uPvnPGZBR2M5J/1VvGsEn4Q3tMiB8X5IMISJiQRnWMrxrKT54qnBgkLyo2/
         dz8dHlDZZIHAPnbikgwgDBmndx5Ly02rJ6ZCr4ut2c049Ds+SVzKT4XWGbkZZ2QlhHbn
         Ch0JCfrBgxaN4dP58BQYJY/j2HoDrxfztD/WA90sRci9qMTgBYQ6U9KArBJT9AAPjiZm
         AUIU6LQp1MwJHOmV0s9DyC7FbLzcSaDBhrybWJcFpXIZlfla31IoN1BY+yeAY7SBzbUH
         EEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01QSWb+vNnF1t8OcBQm5Ba9XSixXs+321OcoswGaF1w=;
        b=ztBtQEGZDAZrAkgRxMhzQtKpae2jXZIrvN4oR/+dMT1KvRSqDTU/lrY5JdpbmnGiQ+
         /EwyhGm7Reg5s54t5hHcVRyaJUdSiJ0ScDJ1nm4b8LgrIcT0z0y85FUu5k6Hyodn+Snu
         oRbmu9HZbeae3RhBI1ce+cs6Wfkc4LDgOpI3n685cWKv+YKlChJwawiD6FJ10oXGpMCp
         XQUTBS4he8/CEueSOaDp2puOSyCeC80p9fQ5lUI5HCWDk6pl6wGfA10yrS01HHEZy1MA
         wA/cMGc5RljXMc6WGbxFT9b0lEW1nyyXeNSE2g4UU86tErTkbxytSiciq60pVVkFwORI
         WJJw==
X-Gm-Message-State: AFqh2kr3QuvPSRIIDHt6OntRSpEHqLAZshFlLQI6+YL1bqcBZQTZRi8o
	8RIYLLOrsPO/eydgJkzlyBJvqvFwvfM=
X-Google-Smtp-Source: AMrXdXt0X5Q3B4HgnYPV25Oz8eVLTLtO6vGtLiod3VI4/Q99g2yJR+4SWUy9YLiHKHVOsK0ZBsXOHg==
X-Received: by 2002:a17:902:ce08:b0:189:81dd:6b8b with SMTP id k8-20020a170902ce0800b0018981dd6b8bmr49109895plg.63.1672470547602;
        Fri, 30 Dec 2022 23:09:07 -0800 (PST)
Received: from localhost ([2600:1700:38c1:1d7f:f66d:4ff:fe3c:3ceb])
        by smtp.gmail.com with ESMTPSA id v1-20020a1709028d8100b0019269969d19sm13293129plo.255.2022.12.30.23.09.07
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 23:09:07 -0800 (PST)
Date: Fri, 30 Dec 2022 23:09:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA988X hw2.0: Add TP-Link OnHub BDF
Message-ID: <Y6/gEaom9Oy4MsFj@localhost>
References: <Y6/b8G9CBSgRcyZR@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y6/b8G9CBSgRcyZR@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_230916_982607_FDE6E570 
X-CRM114-Status: UNSURE (   8.31  )
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

On Fri, Dec 30, 2022 at 10:51:28PM -0800, Brian Norris wrote:
> In preparing OpenWrt support for the TP-Link OnHub, I've extracted its
> BDF for inclusion in the mainline board-2.bin.

Apologies, I just realized that:
(a) QCA988X devices have a board.bin file upstream, not a board-2.bin.
(b) They're all using the same board.bin file. (And, the one I pulled
    from the TP-Link filesystem is the same as the upstream one.)

So ignore this one. Sorry for the noise.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <SRS0=hVdf=HH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A29C433E0
	for <ath10k@archiver.kernel.org>; Fri,  5 Feb 2021 22:01:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BDC864E4E
	for <ath10k@archiver.kernel.org>; Fri,  5 Feb 2021 22:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BDC864E4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=39wYHlYsI2/yG3+aJh2GjVWmKtZlR7vJ0sXo5sq0IDY=; b=Ya2CodZkLAo8lF84zn1QEQLmx
	qyasOJZkiocIlSo23AbIlynvyG4l9TmuwW6BCQrCl0LotOuS5SveGG5LTLTGtSzsXqKmVbJLufLee
	mU1yedeQVaSsOUvfnAxm4l9xWlYGOb7HxY1m27JcWPCxZYoor7mXDDkgrhrJmp2YRgWMc+F9gzWug
	fWr7Naa9CCEO/D2kTLN7MQJQ8RP+Bu7SbnQo//RnacxLzJ/YiTL3iM8lvyVRp0yrNkNzMSDzOrnJD
	Fr0Ob5jBlXVdo6hfP1kBgm6awUg9xJHLmc7ovU/FKuskItTABzluAvp9o7aP9UnrjYqtwlBGHYUPw
	EaxpcA3pA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l899v-0002m1-Jv; Fri, 05 Feb 2021 22:00:59 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l899t-0002lF-Ec
 for ath10k@lists.infradead.org; Fri, 05 Feb 2021 22:00:58 +0000
Received: by mail-io1-xd2c.google.com with SMTP id u20so8716784iot.9
 for <ath10k@lists.infradead.org>; Fri, 05 Feb 2021 14:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TjFoIlWrQQ6SMzxidSIU20LEs4MBYZ8U+Hbs2kdSGcY=;
 b=E3xQASvh1UTu1+ew985C5nGgz+dZqjVwunktw31qnGEZjNfL0hXKiFy796OgliRWeF
 AM7eZB+peG0BOA6Q31/k/yQy/UlzzkcFDtqmmzlmkXNuDZ0nZexQkVABdzuVCWUFV6xA
 LSFXFaXdd9Fk9X9vhzetmL0b+meOsrs9iEGB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TjFoIlWrQQ6SMzxidSIU20LEs4MBYZ8U+Hbs2kdSGcY=;
 b=GSz4ez4Qm1k0GHqYZbasE164p0M2aA9SE0QrhVEh6jfj6ZuaY9vSbQv57raedDzw0f
 KXpT7UiGp5atQuQ6520EOla7VpvNYhpkXtEs6YIjw0eMoGSfzERgljfuMmSdQVPmc7TP
 pCKlthcvC6TCiZMVgaJyLt/M9gdfKe81DSQABzhaQU0rmUIpbYhtQcPLxoceDKALSXcf
 9GPpGGpuR9TbdkcJDmzQZDu+d3Fz++N1FGSx7Qq7J3dxAPmK0Kjb3DxHvTwVZLyBlj1C
 oiS9dKtthGQsW5HVyubt6ylFhBh+rLsowEHyel+JeB+NnzwWmT2P8gZ6TrU7XMmbAAk3
 RhYQ==
X-Gm-Message-State: AOAM530BRPULZWdv50/yswHouieUOvw177cblrq8OIquNGAnc2lKzHPG
 hIMFWmtLzxwN8/v/rkDrDIF96ffdAaOWdDu1uolo1A==
X-Google-Smtp-Source: ABdhPJzQUJC+nALEv8999zWpWOq1rvvD0E2d2qR4O0M77d01+4sHlR2oV3jrZwnpdiQYYzQs2xGAJc7nwLwmlRRo3rI=
X-Received: by 2002:a02:84e8:: with SMTP id f95mr7031738jai.4.1612562448532;
 Fri, 05 Feb 2021 14:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20201215172435.5388-1-youghand@codeaurora.org>
 <CACTWRwsM_RJnssBpxDpRSbex4_1T9QDv3+ZT7eLnYsgOgtGFQw@mail.gmail.com>
 <878s9o6aqa.fsf@codeaurora.org>
In-Reply-To: <878s9o6aqa.fsf@codeaurora.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Fri, 5 Feb 2021 14:00:37 -0800
Message-ID: <CACTWRwuGj-kriu10aOix-McK3G_934E=UMa4KzL0yeqtsJRV3A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ath10k: Set wiphy flag to trigger sta disconnect on
 hardware restart
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_170057_546273_0831C55A 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: Youghandhar Chintala <youghand@codeaurora.org>,
 netdev <netdev@vger.kernel.org>, Brian Norris <briannorris@chromium.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rakesh Pillai <pillair@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

> I'm not sure what you mean. But if you are saying that we should move
> ath10k_hw_params_list entirely to firmware then that is a huge task as
> we would need to make changes in every firmware branch, and there are so
> many different branches that I have lost count. And due to backwards
> compatibility we still need to have ath10k_hw_params_list in ath10k for
> few years.
>
 Apologies for late reply on this thread. Yes you got me right( to
move ath10k_hw_params_list entirely to firmware ). I wanted to trigger
an idea and know what other people's views are, or atleast what are
the challenges. As you said the task is much bigger with so many
firmware branches. As long as you feel it is scalable for coming
years, we should be good.

As far as the patch is concerned, it LGTM.

Reviewed-by: Abhishek Kumar <kuabhs@chromium.org>

Thanks
Abhishek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

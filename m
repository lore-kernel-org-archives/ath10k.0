Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1F5C6FA8B
	for <ath10k@archiver.kernel.org>; Mon, 19 Sep 2022 23:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7PELWD9V7ryjOvgc01H/lcmAaIWFhMS3RjfmmiKRUs=; b=l/80+4Ra2k8kYU
	a9m4TK0rbuQTP/OZYHA5dLTGBbHna5DXL2OGg/HWpKEYt+zZRQeHjdW+elmyhGOPccUJ3s8Azi03V
	uyv6yZS5uC+kkrV8gEIHhyNPy5IL1qjTqM2Qf/LPBVRSm3H9MGLcIahfjU6OrJeRDEwepMTPj0rZw
	Jp28WlK6w96WurOy6MaJSryBg+9HJibapqpVGrPCjrTNJYZFvGKFynp5Koom9aTAGU1vFN+rrh6N6
	BIgId2VeuWgOwRgU1L7olNRR9H7POKWYb2XPt9cys1XQd4LwMCsbyXDpSomQpmtUyDdiLtBKSlGRN
	ugnUto6NwD8kM0/ZlRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaQPQ-00GPM1-Uj; Mon, 19 Sep 2022 23:42:40 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaQPM-00GPJq-SG
	for ath10k@lists.infradead.org; Mon, 19 Sep 2022 23:42:38 +0000
Received: by mail-io1-xd35.google.com with SMTP id p3so874673iof.13
        for <ath10k@lists.infradead.org>; Mon, 19 Sep 2022 16:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=H6YHZH+jPDcccemitFjtnmIKNgFF4gCHv4dK5y+d7CU=;
        b=OgAm/NF5dYygMRvGiDjG6n33euz8Woc60hkRM8MQe7E2MjPXdQszKdbDhJbGl9QSQk
         gTMThg/eG/Ydm7bMyH8nUBOY6RJ0awx/Thfjg3+gFBM4Ny3riL7SHHCFVXUOWEnfEFGO
         j/XKOnC81cCwwxTBRGnLYhxtgMdwO5nZXpRGUJGTZHoBA6otbs5iVkF9ClvgojAzzKRR
         cee2XfiNM6JWHY0Nlgj9UqGTOIUhd60DR8QgShQBHh35zNd6rHU/ZVL3Ep8xX0Z69yvp
         dRXsjBVaMGrN461k9PcYw/6h8KwVeaT0+QGQ+Uy2BLaK3BprqqSZvU5t6PopgwYF/eZA
         9AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=H6YHZH+jPDcccemitFjtnmIKNgFF4gCHv4dK5y+d7CU=;
        b=sZntTVWi35h6YEuhQoH9WYrmj8jwECl9AulIdtQSmBjvFrOqiey4xp3ursw/3tyavd
         3/7L7rbLCITMxlcELYytP9BfmUICQIl0USMjRbDEayVTm4oHe7mgrlqdIkXLJDAkl9da
         mBDYBocaPBkxyaQ9/eFxsN5BXgQvvhHfdQr1L58X+0O0xbOk17kbRb2gCig/2yCghOaF
         wZhyD8SbV+MMY6USqyS1QOD9WxYDqeeVyRhDbom0YlNkBvdGl9JXrYu5nad5yx3U6jec
         Fz+5bPG0cyl4nsVlSs7HqO7G5gvUfQT14GhVaMHow8gJI7u8ob07/m8MxOzGQkZAWlOA
         d2Sw==
X-Gm-Message-State: ACrzQf23CyMwKlNM5hk//ZS3Qdu/ez8dygr6R3sq3q/raatWubEOeeXB
	qCm0vpn16KpeQKfbgUYIHov+6LnxTI7mkQksFjo=
X-Google-Smtp-Source: AMsMyM5rQlLxZskd9cq+QRXjkjYUXUxsTLiTx38siVDVmBLHAcYRSX18R8+xAmMyH9khjMfm3rUhfii9rLh750hxDYo=
X-Received: by 2002:a05:6638:4987:b0:358:448d:ec40 with SMTP id
 cv7-20020a056638498700b00358448dec40mr9419320jab.288.1663630954470; Mon, 19
 Sep 2022 16:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200527165718.129307-1-briannorris@chromium.org>
 <YmPadTu8CfEARfWs@xps> <CA+ASDXPeJ6fD9hvc0Nq_RY05YRdSP77U_96vUZcTYgkQKY9Bvg@mail.gmail.com>
 <CAG2Q2vXce2V3Y6MnPhV6obcNWyQzyusMTL=5oCQLRNh2_ffNYA@mail.gmail.com>
 <CAG2Q2vXFcSVwF4CbU5o3VP1MWwrdqrZjTHgfBj_Q0t3nNipJRw@mail.gmail.com>
 <CA+ASDXNx30A3=BA9b-tiAQzYHP=nV_eLw1QFpJij=F=JgWZ5sg@mail.gmail.com> <CAJ+vNU38WyC=FFZVgqyKunEnjXid6vXqkorv8a8+ywjJBk_0NA@mail.gmail.com>
In-Reply-To: <CAJ+vNU38WyC=FFZVgqyKunEnjXid6vXqkorv8a8+ywjJBk_0NA@mail.gmail.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Tue, 20 Sep 2022 02:42:27 +0300
Message-ID: <CAHNKnsTEBr4m1SpZxnfFPWiSgxBg5HhqYCdWwm=9gp7qHXg=Pg@mail.gmail.com>
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory domain"
To: Tim Harvey <tharvey@gateworks.com>
Cc: Brian Norris <briannorris@chromium.org>, Cale Collins <ccollins@gateworks.com>, kvalo@kernel.org, 
	Patrick Steinhardt <ps@pks.im>, ath10k <ath10k@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	Linux Kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, 
	Stephen McCarthy <stephen.mccarthy@pctel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_164236_948329_DC58925D 
X-CRM114-Status: UNSURE (   9.91  )
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

Hello,

I would like to add my 2c.

On Mon, Sep 19, 2022 at 8:25 PM Tim Harvey <tharvey@gateworks.com> wrote:
> I'm not clear if
> there are many other cards that have this same issue.

The list of cards with unprogrammed regdomain can be extended with
several relatively modern models:
  * MikroTik R11e-5HacD (QCA9882 based)
  * MikroTik R11e-5HacT (QCA9880 based)
  * QNAP QWA-AC2600 (QCA9984 based) [1]

As you can see these are powerful and massive cards for WISPs. Or at
least to run as an AP. I also know a bunch of .11a/b/g/n cards with
zero regdomain and the same target audience. Except maybe for the
legacy Wistorn CM9, which is a relatively compact card.

Also, a huge number of wireless routers and access points have
unprogrammed regdomain. But probably this is not the case, since they
anyway can not run a stock kernel.

1. https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1895333

-- 
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

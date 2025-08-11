Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3583DCA0EE0
	for <ath10k@archiver.kernel.org>; Mon, 11 Aug 2025 23:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBXQBxGfZ1zpntH+TOiqrJLsBk8tkPN10Nu3SVV4di8=; b=sjVtJHEb6V6BVsjNgrdtMoCdlJ
	zDhjlK8tI48O8njO6ruWyYAN2qQKs2PSiqYZZUZueGl9rfX6PFmzNS1Si8brl+TK/Dcg9mf6oHzam
	XwL1KESbC+iCNM1Ch2Z3BFlktOHf/NCW2hquGH8f8p7HuI2ISNUR3j0I7gZMvXKrajCDjKjuInUF6
	28v3BnubqoGkIp+7W76kr2tx0J/19EElp9/b2WRdcb1pF2TE7rGcaWOPuylWHkqAXSYEgm1yXhx/u
	0HD5Yllaq+TihxlgBps2CNR+11rjuzlymIec7hkUN5sU/Zy95A00PP75TO+VKAPorjbXc5akpX3jM
	59bHSH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulbkz-00000009MNy-0kyX;
	Mon, 11 Aug 2025 23:16:45 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulZ5A-000000090lS-1nAX
	for ath10k@lists.infradead.org;
	Mon, 11 Aug 2025 20:25:25 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-71c42f1b4e7so3335057b3.1
        for <ath10k@lists.infradead.org>; Mon, 11 Aug 2025 13:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754943923; x=1755548723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBXQBxGfZ1zpntH+TOiqrJLsBk8tkPN10Nu3SVV4di8=;
        b=lgYSQ11YjlHROmbT6awtfdTWIfJhX7sQc1AmR61Lr3vHG+gy6heo3Fysw/jAe1woQ+
         zV5JktI+DysmOiF0r2HMu0qPgmIWfBhRC3xYJwaD+USKp1xtFRx4NwrHqVbec8FNzKdP
         fjT1M6Z4+NwC9iGzNJgc1a03yqmouc6RLVRMGq5KbabvTZjp0OIj7TrmydMJfMblC3NU
         VO0VTPpIdzg0mrPPpd20csa6nQAurTHEgWLkY8fFBwTg+ImAyO8Gk5oNZ52agDlbz8eu
         83ila+83/OZKFSKFrPG8ZTjCDdzm/wddaAYJsmQmZ4cv9HZwXH75ygZnupOFrAYRBUu8
         3dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754943923; x=1755548723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBXQBxGfZ1zpntH+TOiqrJLsBk8tkPN10Nu3SVV4di8=;
        b=B+JLOvDqO1BAUHhQ1AQd2TEmE5z3fCkkeCi4zuqj9Z+Sw11wp94BKRX/j2KMyQlgLj
         L0wdvQk/B+BvslVM1FgyKkB6gPFv9q9TuEnRwSaSsB2PB8VNQVfyc4VoAmtDW2AbltR3
         aLvvce1ryuJdqaT2Fyq+9krd9XVinX49DAlsX2bUFo3TUsxWPvTqgZw8vR/HAzI3OfBF
         zBfNQp1C+BZbCXVbutUMxqVvk0vGxH9KHTiYC9FiupY69J4AJdIcdFcLpg9CTguGdzHn
         USAKdr8/bUMhdbiYJyuc3ujP2cq41Oz8mXivU2e9RJAlmtKbVYsltr8RZenlQyVrLUjF
         3grQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwHW3lsYiC5xJbx1xpAn2Z01bYQOwVIkjUGzyidKkRw1AqbEHvwAk4xMYDqgJysxGIyigl8PE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+tTPYokj2HkDd7UeR4ckDqovuYCX4Jy6YkpqZ2qUMrpLwUXtX
	HK0nYZGbVAOCUcD8E6DNiiyl0CWMZBI2JjHkNCAw4PnJXgdXmu1dfRGlIS2uPYE5hqtS1Sq3j1y
	rEcg/sJCN3CCiZ8Rll1W1yQ0oJArQN64=
X-Gm-Gg: ASbGnct0uTH2MmKjxbxuZKiZKRqTRSgwQil6anx1u05lBmrzepU+fsT5cXchxraW/mH
	ZAtqpnPY7RRKqB0vnTZz/oq0aKbkNLatujQox0+7qVZ3ND4lLRXq7iLhCkdOiK4EgZXgmvYEfAu
	p9Iu5kL2zmJj/YsVL9cZAHjH/k4c2dKBUcp/WLneP6vfqutWLra7r3JO4RC+tJpLThBpY8JW78N
	JsykN4W/vOSV1IHJO5y
X-Google-Smtp-Source: AGHT+IGT6zgJrI+bwB8rpn6s+VJg0y2XQvjU11F/NMNvCcXTBbAqPiT0BUy1aINV8dMOssmCRvrZmQOBZRc5rglA2U0=
X-Received: by 2002:a05:690c:350f:b0:71c:149b:869a with SMTP id
 00721157ae682-71c4286f33dmr17279787b3.0.1754943922701; Mon, 11 Aug 2025
 13:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250809031517.5535-1-rosenp@gmail.com> <adf6d126-1f80-4590-a9f6-171b7feaf656@oss.qualcomm.com>
In-Reply-To: <adf6d126-1f80-4590-a9f6-171b7feaf656@oss.qualcomm.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 11 Aug 2025 13:25:11 -0700
X-Gm-Features: Ac12FXwdnaim6R97XiHA8gvSEBp7k4c9rBg3M3JXjfO7r7BbFC0AH16IyBnLB64
Message-ID: <CAKxU2N8=B8JHNppr+RbOBbzBztXs1f2wLVn3ZtwDHSpokCNf0Q@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: switch to of_get_mac_address
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>, 
	"open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_132524_475090_BE7E1A07 
X-CRM114-Status: GOOD (  31.50  )
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

On Mon, Aug 11, 2025 at 12:55=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 8/8/2025 8:15 PM, Rosen Penev wrote:
> > In 9d5804662ce1f9bdde0a14c3c40940acbbf09538 , device_get_mac_address wa=
s
>
> see
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#de=
scribe-your-changes
>
> specifically: If you want to refer to a specific commit, don=E2=80=99t ju=
st refer to
> the SHA-1 ID of the commit. Please also include the oneline summary of th=
e
> commit, to make it easier for reviewers to know what it is about.
>
> So in this case:
> 9d5804662ce1 ("ath10k: retrieve MAC address from system firmware if provi=
ded")
>
> > introduced as a generic way to get MAC addresses from anywhere.
> > Unfortunately since then, the landscape has changed and the OF version
>
> when did the landscape change? if using device_get_mac_address() is break=
ing
> folks, it would be nice to know which versions of the kernel have the bad
> behavior so that the patch can be backported to any broken LTS kernels.
>
> > is required for NVMEM support. The second problem is that with NVMEM
> > it's possible that it loads after ath10k. For that reason, check for
> > deferred errors and exit out of probe in such a case.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath10k/core.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wirel=
ess/ath/ath10k/core.c
> > index 6f78f1752cd6..76747eb0925b 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/module.h>
> >  #include <linux/firmware.h>
> >  #include <linux/of.h>
> > +#include <linux/of_net.h>
> >  #include <linux/property.h>
> >  #include <linux/dmi.h>
> >  #include <linux/ctype.h>
> > @@ -3456,7 +3457,9 @@ static int ath10k_core_probe_fw(struct ath10k *ar=
)
> >               ath10k_debug_print_board_info(ar);
> >       }
> >
> > -     device_get_mac_address(ar->dev, ar->mac_addr);
> > +     ret =3D of_get_mac_address(ar->dev->of_node, ar->mac_addr);
> > +     if (ret =3D=3D -EPROBE_DEFER)
> > +             goto err_free_firmware_files;
>
> Note a similar proposal for ath11k was deferred since it seems to break x=
86
> attachment when there isn't a device tree node:
> https://msgid.link/ec974dc0-962b-f611-7bbb-c07a3872f70f@oss.qualcomm.com
In response to this, I'll change this patch to only add NVMEM support
>
> I'd have the same concerns here.
> (but I didn't dig into how the fwnode items are set if there isn't a DT)
I have no idea either. I assume for pcie cards the MAC is set from the EEPR=
OM.
>
> >
> >       ret =3D ath10k_core_init_firmware_features(ar);
> >       if (ret) {
>


Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325A1C35FF9
	for <ath10k@archiver.kernel.org>; Mon, 17 Mar 2025 18:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EacML+x4s/wSIPn0rGtSnoLLwHaSAeJ+TE5HYYP5+Q=; b=Y+0kZBwJh0YMmBYqGwzYppj2OX
	6/xqGxGfeps9fFmv5jl5/hUqdoRLD46A0a8ME2D05z8nhN0Lb0vwDLYFEtsScZ/Wm+9xBnF3hShGm
	IdRD2ShVU4+vf03lXyBUnzfolh8gpRFx/ff3TMt7YE6SSJA8rc6jzm91+u8pWM+5ttwTDbeYVA4n7
	KN114Afp5D2H/YjwBCQSv6xUaNPFiCUu6CvGaGU0T+W8lL4i5X15XdRUOVUoI/+rCVn3PdCKPLvJH
	BkGVCMAKTmoTnxSxyxoLvnhaX4Vu9AHwCRHzUGQ2KJXSG/O2uneUGgjwp2oXQC3F0QLRtynsLyn18
	gCC8M86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFHi-00000003hao-2GD0;
	Mon, 17 Mar 2025 18:33:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE7q-00000003XdB-0B2i
	for ath10k@bombadil.infradead.org;
	Mon, 17 Mar 2025 17:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4EacML+x4s/wSIPn0rGtSnoLLwHaSAeJ+TE5HYYP5+Q=; b=pBW1y7h+W7/eNOwV0z4mEVLmZA
	LQfsG3qX6I4xVeOdRB7fdkODfUUzycLMA0fscDSmyWdTzdzw8EWXN6CS+mcX4HyVnRR0MK8UY5Vf8
	Ze9b0+wtd5yMlezn3WpplvTb+ioM9zW5OEnlNKfrU1tha8Sy4S4qvLHc/7X/zfkJKsgKIp0DPVYbv
	1WMTyo75tFjlQHTqDmfJbjursZNVgsaj54aMNz1kAUHs4wQ+XisYsAbZlPZnzkl1y3+yx/j4RHCLq
	2+Fc0hDfshX2XC5L69QYHY6P8OV7/0PoaICnByfjBMBK+NmJ1pkeUBcPqMhXBq+qpnXwn2x1FIos+
	9+cbGJCg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE7n-00000003Vlu-0t2i
	for ath10k@lists.infradead.org;
	Mon, 17 Mar 2025 17:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4029A48A9A
	for <ath10k@lists.infradead.org>; Mon, 17 Mar 2025 17:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A850C4CEE3
	for <ath10k@lists.infradead.org>; Mon, 17 Mar 2025 17:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742231976;
	bh=ZEAT6RFypcPN7L/ki3+46/Vv2kxpEG6Ybgc4eh+vFoo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b3mS6RQkrtJGb10kNAUFbhlWCr7o83NPgrxmqdG4GEt9eclcKu/5/TLcZhhasdTf+
	 4elpQdWsr05S02wW2h2CmXf6SiEp7/XhMh2Lg+9XT4bfKVfyR4s/0brKM0ViR6AgXw
	 CZuAYwHQiA97ce6tMAPe9QM6J0XpUcRYS4V6Z46NaoISE21+hSrx3lPFSmwprM9D82
	 zFP/vnmHpfZx+aVrrJW+m1NhNzK2hpSQNhI8G3l5BuZqHO9YNQXvVJOcOhpTzuy6/m
	 bSLpC7oMTRB5Kt5eO3FfJAsPQfm1LR8NYS+sIQYO4oD2lsDPInaaZhwBlZuMn/U2Pa
	 stpywV2sloKtg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so8019865a12.0
        for <ath10k@lists.infradead.org>; Mon, 17 Mar 2025 10:19:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQhYnQf6hswcaTC8QWOU7Fz7LAfb/oweVWioqDXmTDXPAWlnx41iaIqJrg72+AbynHYZCK7/M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPVFofmq2+oTIpgj1NNiDtri/E3z3dSRZGvSe3uMhq6pyYjxAf
	yx5YpLgBZ7RRMfEbiL+JPPal8R3HwS9esrSIWPLybGZIy/Jld/6MMh6f/Zgprmtcn20pQC7z+lQ
	9EVusN27nelPpKQYdnS5ffcjYfg==
X-Google-Smtp-Source: AGHT+IHci5hAASurc/lxodNyDclZIUpIuFlvwsFb/ZFbzWYKAntadGtYvqA1Ubo84Yz/rBl32SRf+JP56TiMbCS2Sng=
X-Received: by 2002:a05:6402:4301:b0:5e5:bcd6:4ad8 with SMTP id
 4fb4d7f45d1cf-5e89f24c63fmr12982673a12.9.1742231974609; Mon, 17 Mar 2025
 10:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250314233831.2535170-1-robh@kernel.org> <CAOiHx=mr+MFE_7Krue4BPrtvtyJW0pWUBXCrqbViVH5oOTT2Hw@mail.gmail.com>
In-Reply-To: <CAOiHx=mr+MFE_7Krue4BPrtvtyJW0pWUBXCrqbViVH5oOTT2Hw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Mar 2025 12:19:23 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+L2W-=4m2c2zAKNAP9vsrbZkOBHUYqPevcdM9L_3xHtA@mail.gmail.com>
X-Gm-Features: AQ5f1Jp7GjAUd9blnwfMaOZafCeEHVPVcCYh5g6hLxjUn1VGcrND5MvV8CKr6T0
Message-ID: <CAL_Jsq+L2W-=4m2c2zAKNAP9vsrbZkOBHUYqPevcdM9L_3xHtA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Drop of_get_property() call
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_171939_489242_109389D4 
X-CRM114-Status: GOOD (  24.98  )
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

On Sat, Mar 15, 2025 at 5:07=E2=80=AFAM Jonas Gorski <jonas.gorski@gmail.co=
m> wrote:
>
> Hi,
>
> On Sat, Mar 15, 2025 at 12:39=E2=80=AFAM Rob Herring (Arm) <robh@kernel.o=
rg> wrote:
> >
> > There's no need to check the property presence and length before callin=
g
> > of_property_read_u8_array() as it will return an error if the property
> > is missing or the length is too small. The return errno doesn't matter
> > to the caller, so no change in behavior there.
> >
> > Change of_property_read_u8_array() to of_property_read_variable_u8_arra=
y()
> > as the former allows properties to be longer than the requested length.
> > Now the property has to be the exact length requested as the removed
> > check required.
> >
> > This part of a larger effort to remove DT functions like
> > of_get_property() and of_find_property() which return raw DT data
> > having no reference counting.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >  - Add check that cal_data_len is non-zero
> > ---
> >  drivers/net/wireless/ath/ath10k/core.c | 24 +++++++-----------------
> >  1 file changed, 7 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wirel=
ess/ath/ath10k/core.c
> > index b3294287bce1..47206b171aa5 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -1889,39 +1889,29 @@ static int ath10k_download_cal_file(struct ath1=
0k *ar,
> >  static int ath10k_download_cal_dt(struct ath10k *ar, const char *dt_na=
me)
> >  {
> >         struct device_node *node;
> > -       int data_len;
> > +       int data_len =3D ar->hw_params.cal_data_len;
> >         void *data;
> >         int ret;
> >
> >         node =3D ar->dev->of_node;
> > -       if (!node)
> > +       if (!node || !data_len)
> >                 /* Device Tree is optional, don't print any warnings if
> >                  * there's no node for ath10k.
> >                  */
> >                 return -ENOENT;
> >
> > -       if (!of_get_property(node, dt_name, &data_len)) {
> > -               /* The calibration data node is optional */
> > -               return -ENOENT;
> > -       }
> > -
> > -       if (data_len !=3D ar->hw_params.cal_data_len) {
> > -               ath10k_warn(ar, "invalid calibration data length in DT:=
 %d\n",
> > -                           data_len);
> > -               ret =3D -EMSGSIZE;
> > -               goto out;
> > -       }
> > -
> >         data =3D kmalloc(data_len, GFP_KERNEL);
> >         if (!data) {
> >                 ret =3D -ENOMEM;
> >                 goto out;
> >         }
> >
> > -       ret =3D of_property_read_u8_array(node, dt_name, data, data_len=
);
> > +       ret =3D of_property_read_variable_u8_array(node, dt_name, data,=
 data_len, data_len);
> >         if (ret) {
>
> of_property_read_u8_array() returns 0 on success, but
> of_property_read_variable_u8_array() returns the number of elements
> read on success, so this check needs to be ret < 0 now.

Indeed. Thanks for catching that.

Rob


Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11984CD8CBD
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sX9ATTxluLYTPpyn9xT27ptWmmBF8CPbs0HcxCOGLE=; b=JQkXaznWfc4fNH4m7Mfh/WG56u
	A+uIEB1kUzPqqJMJKSZ+iclPfc6nYF7trqHo8qbwQPe1gvpV1TNOkVV20z9QmSU7RIakHVGbYgcxh
	MKg242o8iiXFz0r0qhnFpTcN7I4bpkn9BsrZuYQ70ZZSJIzQna85yqPGCJ4Q5NyHvk5JFF3b5DLUn
	151Lt/HyBC/e0B4w84JT5J6Sgdu5J0dlsr4LhiNSw0qyeP/SYfyPOu3te6+BNlRrWI1Zjgmjc4dA3
	BHC1r8Hh2aW/kKjRWYgiwnQciFEIEKFH84XNPcJxqahQQXYTwz2dH7dRohc1ls8gmqO/dNdS4ofMy
	mEpUFBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuGh-00000005PMj-2ERO;
	Tue, 09 Jun 2026 11:05:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuGg-00000005PMV-10DZ
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 11:05:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FCA9445C4
	for <ath10k@lists.infradead.org>; Tue,  9 Jun 2026 11:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F9E1F008A1
	for <ath10k@lists.infradead.org>; Tue,  9 Jun 2026 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781003113;
	bh=+sX9ATTxluLYTPpyn9xT27ptWmmBF8CPbs0HcxCOGLE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RGDhzDndKBB2dkoo2ExWmstsyWaeZ8qJ18zZpU/Zh0vnaXRYAMzekOdsxjslSMmMP
	 Zz8+CTH0TaVqx9FQtV3+0bfwMumlGnwVxTC4XbD3pQ9vXv5cjQPwxw+p/urFIYe+M1
	 23mhKFfJTqrlZpJV745TVZPiLITUlVY6C7d5E8xA1cDZC81W784rbDYRkz7hR5lGZL
	 64Iy0/HNkiWIMrL9ECwoHOiIF9wCFEfpU8Auj711VfrHHZui/L8EP/HRqjhrowKr2W
	 OxVlAEX7eB4eXwfcJe6BQDfh51Xjtyo6bbEDsj8hF5jBGM4+Ii4e2FKcVqq3Vj0HgK
	 9xuzxLAHXn0zA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa6792e7b8so5373068e87.1
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 04:05:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+KaXcJ3awZQtISM2mXCagyxkD8vddwYdZslERrkmph9IeJoljeCQTKBKLXD3naN027484W+r0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/qLRSk3HYo4EGxW1TSKDoIKG+Lul6T7udReD2/eJrG2nLZf00
	xUYKYoSZbAV5hUXSWvdRJ4Wp6ZQmvn2W6sZsURmVisP2wO4pxCtOEWm/wa+qDCJYJQ3XeTgxUef
	1aTjJUNlYPbIslZq4AUFMo8YjSh84eQECLF/3H8EYzA==
X-Received: by 2002:a05:6512:2253:b0:5aa:5c8c:9cf4 with SMTP id
 2adb3069b0e04-5aa87b5f803mr5428916e87.17.1781003111998; Tue, 09 Jun 2026
 04:05:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 07:05:10 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 07:05:10 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAFEp6-1syMQsvuQ+dLU39bnDeL5Ok7vK1mA7CS0v1m7cjhyMQw@mail.gmail.com>
MIME-Version: 1.0
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-4-45712e6b22c6@oss.qualcomm.com>
 <CAMRc=MfuiPMkSm=-G6VEJpqKhos0TD_pf0ScBGqfwLHT0uk8yQ@mail.gmail.com> <CAFEp6-1syMQsvuQ+dLU39bnDeL5Ok7vK1mA7CS0v1m7cjhyMQw@mail.gmail.com>
Date: Tue, 9 Jun 2026 07:05:10 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc=-G0+ESPJUUgxd+jJWwuEzBcVXSJyAbAhx6BFkHeimA@mail.gmail.com>
X-Gm-Features: AVVi8CdBM8fdpM7hiE50yrSmJrPYo7K9sdF-J87b4PfgsolvJ2MbyT4LVehGYdI
Message-ID: <CAMRc=Mc=-G0+ESPJUUgxd+jJWwuEzBcVXSJyAbAhx6BFkHeimA@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] block: implement NVMEM provider
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 9 Jun 2026 12:13:08 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Hi bartosz,
>

...

>>
>> On the other hand, we don't want to not provide the block device just be=
cause
>> someone added a DT property on one that's too big. I'd say: warn, but re=
turn 0.
>> Does it make sense?
>
> It=E2=80=99s still technically an error in the sense that we cannot provi=
de
> the required nvmem feature. However, it only becomes a real issue if a
> consumer actually attempts to use it.
> Also, the block device should still be added, since the return code
> from add_dev is not checked. In any case, I=E2=80=99m fine with either
> approach, as long as we emit a warning message.
>

We don't check the return value now (why?) but if we ever do, the safer opt=
ion
is to return 0 IMO.

>>
>> > +     }
>> > +
>> > +     config.id =3D NVMEM_DEVID_NONE;
>> > +     config.dev =3D dev;
>> > +     config.name =3D dev_name(dev);
>> > +     config.owner =3D THIS_MODULE;
>> > +     config.priv =3D (void *)(uintptr_t)dev->devt;
>> > +     config.reg_read =3D blk_nvmem_reg_read;
>> > +     config.size =3D bdev_nr_bytes(bdev);
>> > +     config.word_size =3D 1;
>> > +     config.stride =3D 1;
>> > +     config.read_only =3D true;
>> > +     config.root_only =3D true;
>> > +     config.ignore_wp =3D true;
>> > +     config.of_node =3D to_of_node(dev->fwnode);
>> > +
>> > +     return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
>>
>> And that was a wrong suggestion on my part too because I was under the
>> impression that we're in the probe() path, not device_add(). You can't u=
se
>> devres here as the device at this point is not yet bound and may never b=
e.
>
> So I understand The bd_device is purely a class device with no bus, no dr=
iver.
> For driverless devices, devres_release_all() is called explicitly
> within device_del() .
>

Right.

>>
>> Which leads me to the second point: this is not the moment to add the nv=
mem
>> provider. This should happen at or after probe(). Once nvmem_register()
>> returns, you have a visible nvmem resource but nothing backing it in the=
 block
>> layer.
>
> There is a short window during which a read attempt will 'properly'
> fail, but this does seem somewhat fragile indeed.
>
>> Either do this in block core when registering a new device or schedule
>> a notifier here for the BUS_NOTIFY_BOUND_DRIVER event and do it in the n=
otifier
>> callback.
>
> So in the end, it seems that the simpler and more robust approach is
> probably to move away from the class_interface driver and instead
> register/unregister the nvmem directly in add_disk/del_gendisk.
> If that's ok I will move to this approach in the next version.
>

Yes, I think it's the right approach.

Bart


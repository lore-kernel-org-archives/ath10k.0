Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD07C43458
	for <ath10k@archiver.kernel.org>; Tue, 30 Jun 2026 21:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUvDaNXzQAJTqE61fbo+DfZd1bDU6D/qLMCG5IKiMGk=; b=iUnCcPB9uidYuMWUO20Hm2phzF
	Kb3pee5UM5ThOhVnigAta8M9fMTwCqWlcWcg+YSP1ChjnjW+6BNFzQm3A8MOv0VA87br/XBqF9h5J
	W4TltPMVgkdZkrDF0rZpuE2QT2tSivlUwqG6zqc14wA1T82MvDUBg0l5RjpAclu/0ddVx8iXXjqK8
	W//8XJEqJ9rqkESBflKWQ3zzbK3djRf7Wltbb3LPNM1Se/JhK5avzW7ZmAv4mD0K+jnPeNOnMtlwu
	ryL7Yh38SFXBByXALcnOSsGvTN3D8OuXAFPSb5ciaQ1J3nmZFSPFNoQYhp/oandRql/WSxT7kRw9p
	bZ47rRAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegHT-00000000GWi-14aT;
	Tue, 30 Jun 2026 21:46:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegHR-00000000GWD-1c99
	for ath10k@lists.infradead.org;
	Tue, 30 Jun 2026 21:46:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C397B44031
	for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 21:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACAA1F000E9
	for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 21:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782855968;
	bh=pUvDaNXzQAJTqE61fbo+DfZd1bDU6D/qLMCG5IKiMGk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D7/fwntI/3EHRu1rhEkf/Sxm5cxtWYBPvIyeiHr4BbeE+U3AC8KziRAH/U9R2kZMS
	 qnVlrScxXMTR+aij1253AguCwtOB36ZJlqGONrgVB0aIem+0zGFOPt2bkghO19pNQA
	 0L11F8QdXG3xIS9oH+cULaOedAwOQpsrBZ8+RmrxF+WXYCsMkF8ip8T0M2sh/dSMah
	 zEJrNBRx53ziG79D5Bk6qHq/Ay1OkwovDv8nf9b1+5iqiKFwvZNA6/ZlQIlt+gGpli
	 OcoR5vcOBHqTjCfrBl6hNTosFoPsoO5PxYZ505Drx/3wDSyHCEo3Fw7RyinOJ8sFFX
	 N8ihdn7Dk2vHA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso1782975a12.0
        for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 14:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rry97t8bTKbPV7bJq4rMW1fd7n6Zmg2kaoTWhD/sJx1IzvqbivaYHqwn9j0rxHijIK7e+Exd4Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGU/zhUhTn7gHJmEvX5ckHbqRJqs1DINmwlO9OS/BrCRbBruUA
	irAhkk4ON+FlyRaS32xZVV0R2oCkhQSw1e+tg16/0Q398z+v2sW7pEuEfpUjpVn7TRJ2OPL+pD4
	J0rwyJnt1I6fXkcA0/0xq16EMoBWfGg==
X-Received: by 2002:a17:907:6d06:b0:c08:580e:899a with SMTP id
 a640c23a62f3a-c129042e82emr232092166b.10.1782855967114; Tue, 30 Jun 2026
 14:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
 <20260629-block-as-nvmem-v6-1-f02513dcd46d@oss.qualcomm.com>
 <20260630180219.GA4139943-robh@kernel.org> <CAFEp6-163adAq8-H_pCzGnq+Fo4jpyKGs6Jv25j3fSpZg3COjQ@mail.gmail.com>
In-Reply-To: <CAFEp6-163adAq8-H_pCzGnq+Fo4jpyKGs6Jv25j3fSpZg3COjQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Jun 2026 16:45:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKFjk-mdaAAOzNB6rFiJbw5gd4eDpRBLQL-4q+uJKnp3g@mail.gmail.com>
X-Gm-Features: AVVi8Cc4MorOqwfKhUItBpWtyYeUsNNDkbig_T10OqzF2nSF1JgV4ariSeJFQ-w
Message-ID: <CAL_JsqKFjk-mdaAAOzNB6rFiJbw5gd4eDpRBLQL-4q+uJKnp3g@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] block: partitions: of: Skip child nodes without
 reg property
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	daniel@makrotopia.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

On Tue, Jun 30, 2026 at 2:59=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Hi Rob,
>
> On Tue, Jun 30, 2026 at 8:02=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Mon, Jun 29, 2026 at 10:55:20AM +0200, Loic Poulain wrote:
> > > Child nodes of a fixed-partitions node are not necessarily partition
> > > entries, for example an nvmem-layout node has no reg property. The
> > > current code passes a NULL reg pointer and uninitialized len to the
> > > length check, which can result in a kernel panic or silent failure to
> > > register any partitions.
> >
> > That does not sound right to me. A fixed-partitions node should only be
> > defining partitions with address ranges. I would expect a partition nod=
e
> > could be nvmem-layout, but not the whole address range. If you wanted
> > the latter, then just do:
> >
> > partitions {
> >   ...
> > };
> >
> > nvmem-layout {
> >   ...
> > };
>
> In our case, the nvmem-layout needs to be associated with a specific
> eMMC hardware partition, nvmem cells can be a simple sub-range within
> the global eMMC, each hardware partition (boot0, boot1, user...)
> having its own address spaces.
>
> That said, your point about not abusing fixed-partitions is valid. I
> initially dropped the compatible =3D "fixed-partitions" from the
> partitions-boot1 node when it only carries an nvmem-layout and no
> actual partition entries, making it a plain named container node. But
> it's a bit fragile if we want to support both nvmem-layout and
> fixed-partitions.
>
> Regarding your expectation of a partition node being a nvmem-layout,
> do you mean that the nvmem-layout should live under a fixed-partitions
> node? Something along these lines:
>
> partitions-boot1 {
>       compatible =3D "fixed-partitions";
>       #address-cells =3D <1>;
>       #size-cells =3D <1>;
>
>       nvmem@4400 {

partition@4400

>           reg =3D <0x4400 0x1000>;
>
>           nvmem-layout {
>               compatible =3D "fixed-layout";
>               #address-cells =3D <1>;
>               #size-cells =3D <1>;
>
>               wifi_mac_addr: mac-addr@0 {
>                   compatible =3D "mac-base";
>                   reg =3D <0x0 0x6>;
>                   #nvmem-cell-cells =3D <1>;
>               };
>       [...]

Either this or replacing "fixed-partitions" with "fixed-layout" if you
want to make the whole boot1 partition nvmem-layout looks like the
right way to me.

> That makes some sense, this would require extra work for the
> emmc/block layer to also associate fwnodes with logical partitions,
> not just the whole disk/hw (hw part), Is that the direction you'd like
> us to go?

Yes.

> Also, Note that regardless of which approach we settle on, this
> specific fix/patch remains necessary to validate the partition node
> and prevent NULL-deref.

Fair enough, though the reasoning for it would be different and
perhaps should give a warning.

Rob


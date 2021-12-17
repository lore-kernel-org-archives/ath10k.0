Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D49C433EF
	for <ath10k@archiver.kernel.org>; Fri, 17 Dec 2021 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqBTdyVLihOt1d3hsyO5hGktprjAwHrcCRA+abo05D4=; b=IK2NSskdf/79zN
	EvEj/2Xhc9Jj0ftYVey6h15/JeRgyJy8n+Naw6zH3rbbpcxnAFJWUPq5tCyTRzscgufkPd3tFUikj
	BVwCsxVHPGtIOWT2HIOSt1Ss1GYRguFvb3tKiDZflDtazIV3xczyOryISqonuUy89twhPRZtcUctc
	ESpppoVYPmbA0QydTF4ocFQNSL2bZI7T3K4Vo0QJVPXR2ploiBOvOFZqYpmHK2JSxsCt7A6XFvKd1
	CrI0/g4m85AVIy1F4uGFm+sOa9SRN5C2jRF+HvgKvinhKhwc42qF71ftXy1nsJ1u+mdvUtQND6XlE
	Qfmy3ypghNqpramJz/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myC0Z-00A12N-Ka; Fri, 17 Dec 2021 12:06:43 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myC0W-00A10j-4I
 for ath10k@lists.infradead.org; Fri, 17 Dec 2021 12:06:41 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id ke6so2121819qvb.1
 for <ath10k@lists.infradead.org>; Fri, 17 Dec 2021 04:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NwgjbNTF2AWawWSd7aciZMtjNd2TAYgTWjwPPG2Ao+k=;
 b=WLDcyhSUVMyrmIGZVETG9Wal7qkdSO780y5q60sYc9FufGb/O32XqI9O/lOaVGIyMs
 0AIgCVT1OzT4EOv9cczRYi8ZIc0KsygZDCZ5cGVI8Cg6I0KWUJY6zVJ3WFlUr2UM4RrJ
 IZAyOrqfOaW0rUquoO0ImR9e4xbrqMhWirlRLzn8cqrQIcAEtCCUFv4wXH+h6EehUPBg
 k7RtjdXFPVcIsEp3z3EmIfu0AYSYxAhGOxyyJZyfE107bHBFSi2S9aGc3YlI42Qn2vnL
 d2Pbm8O+wZjknX9eqpwlF0itqPEMrYgdmPnKNtSANsnCcxP7Yb0U+e5TunVKf2MdoNs2
 umqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NwgjbNTF2AWawWSd7aciZMtjNd2TAYgTWjwPPG2Ao+k=;
 b=GObhZtXATJZogQl39KpwDti5pA+I2Ff7hrNN2dyuTpdAuYvvsM/aOMk9IRtbgjPUPV
 ikQii2VXD4cQu8o2Bq1bNtm25dO0tCiTVxlUDapm32DCxH2Vdu/aKMSZtE+ZnvioFIdk
 sS0NealRn2KGQyo85z3EBUPCqa0kE0v8hKteLGYTdjMbZYHPMka1JV4W/U0DYly0fJ+k
 YvGJ0vTES8qtzlZ42jUSQRM0nxQhrRXFw5tpAdRLhRb44sRKgSh7/YvkUQAdCDFPCaCO
 mzBGrs1fyWNd+Yr9C0tvUZD89/DeRBbD1ThNvgCd7JGgTsPHAUZoDv807Pqtwp46tw/5
 lpQw==
X-Gm-Message-State: AOAM533t6MJB51MeIKGI29QwfFU+MzC12c2TdQMEwIwdb2vs12ATULg8
 roLnlFbOLnxpMye/2MccNl73QGaG5qUrVRA6LCs=
X-Google-Smtp-Source: ABdhPJwe96itCmXKag5ptWEiDyxw39VJXuH5D00/SrEDhhWF8d6dkOji7lVebUQhnuDBQ24ULsyNs3z2PAHJgCRYjoI=
X-Received: by 2002:a0c:e808:: with SMTP id y8mr2009792qvn.48.1639742798029;
 Fri, 17 Dec 2021 04:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
 <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
 <09a27912-9ea4-fe75-df72-41ba0fa5fd4e@gmail.com>
In-Reply-To: <09a27912-9ea4-fe75-df72-41ba0fa5fd4e@gmail.com>
From: Robert Marko <robimarko@gmail.com>
Date: Fri, 17 Dec 2021 13:06:26 +0100
Message-ID: <CAOX2RU6qaZ7NkeRe1bukgH6OxXOPvJS=z9PRp=UYAxMfzwD2oQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, kvalo@codeaurora.org, davem@davemloft.net, 
 kuba@kernel.org, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
 Thibaut <hacks@slashdirt.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_040640_195656_49616D6D 
X-CRM114-Status: GOOD (  28.48  )
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

On Wed, 8 Dec 2021 at 15:07, Christian Lamparter <chunkeey@gmail.com> wrote:
>
> On 08/12/2021 13:21, Robert Marko wrote:
> > On Tue, 7 Dec 2021 at 19:06, Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Robert Marko <robimarko@gmail.com> wrote:
> >>
> >>> Some ath10k IPQ40xx devices like the MikroTik hAP ac2 and ac3 require the
> >>> BDF-s to be extracted from the device storage instead of shipping packaged
> >>> API 2 BDF-s.
> >>>
> >>> This is required as MikroTik has started shipping boards that require BDF-s
> >>> to be updated, as otherwise their WLAN performance really suffers.
> >>> This is however impossible as the devices that require this are release
> >>> under the same revision and its not possible to differentiate them from
> >>> devices using the older BDF-s.
> >>>
> >>> In OpenWrt we are extracting the calibration data during runtime and we are
> >>> able to extract the BDF-s in the same manner, however we cannot package the
> >>> BDF-s to API 2 format on the fly and can only use API 1 to provide BDF-s on
> >>> the fly.
> >>> This is an issue as the ath10k driver explicitly looks only for the
> >>> board.bin file and not for something like board-bus-device.bin like it does
> >>> for pre-cal data.
> >>> Due to this we have no way of providing correct BDF-s on the fly, so lets
> >>> extend the ath10k driver to first look for BDF-s in the
> >>> board-bus-device.bin format, for example: board-ahb-a800000.wifi.bin
> >>> If that fails, look for the default board file name as defined previously.
> >>>
> >>> Signed-off-by: Robert Marko <robimarko@gmail.com>
> >>
> >> Can someone review this, please? I understand the need for this, but the board
> >> handling is getting quite complex in ath10k so I'm hesitant.
> >>
> >> What about QCA6390 and other devices. Will they still work?
> > Hi Kalle,
> > everything else should just continue working as before unless the
> > board-bus-device.bin file
> > exists it will just use the current method to fetch the BDF.
> >
> > Also, this only applies to API1 BDF-s.
> >
> > We are really needing this as currently there are devices with the
> > wrong BDF being loaded as
> > we have no way of knowing where MikroTik changed it and dynamic
> > loading would resolve
> > all of that since they are one of the rare vendors that embed the
> > BDF-s next to calibration data.
>
> Isn't the only user of this the non-upstreamable rb_hardconfig
> mikrotik platform driver? So, in your case the devices in question
> needs to setup a detour through the userspace firmware (helper+scripts)
> to pull on the sysfs of that mikrotik platform driver? Wouldn't it
> be possible to do this more directly?

Yes, its the sole current user as its the only vendor shipping the BDF
as part of the
factory data and not like a userspace blob.

I don't see how can it be more direct, its the same setup as when
getting pre-cal
data for most devices currently.

I am adding Thibaut who is the author of the platform driver.

Regards,
Robert
>
> Cheers,
> Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <SRS0=RSRu=PC=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1DCC433FE
	for <ath10k@archiver.kernel.org>; Thu, 14 Oct 2021 12:02:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BD0E60E96
	for <ath10k@archiver.kernel.org>; Thu, 14 Oct 2021 12:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BD0E60E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7g8ljPqGwCup2I/RxD+8+lwbouJY2qsSaBZ4WFaB4oM=; b=eWomRoMutGoVJ0
	u5fySmNaiKSQV1ZbRDXgNDHQkYAdt37gBdazSoxbx7XxH2iZ7GGTViZO933USILY22G/j6QWHkFQr
	ECKpHZS/rbajcCnSVymHcGrNvVu6irUn9ej4Bmk+T7MoBEQzuQ3zxbUj69IjTcO+ugt44RpYN/+Xs
	S+4mg3WnlcMp21W6c22y4Kf4MKmaGKi9upN3wh6xf1w6/14gsGnUrGLNuTbCKOo5qA0BvmKl7FNVu
	PiPf+v/dmU2HBkEiT+QOAUSPBqZ2Y/4m7uPIiBltN2gWdyhqBHqyjEbL+b8tEbVMi4VCYkGB9rvKM
	e932LE2kNwl9vSiagIlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mazR9-002z8a-Qz; Thu, 14 Oct 2021 12:02:15 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mazR6-002z6f-Ts
 for ath10k@lists.infradead.org; Thu, 14 Oct 2021 12:02:14 +0000
Received: by mail-qv1-xf30.google.com with SMTP id cv2so3565126qvb.5
 for <ath10k@lists.infradead.org>; Thu, 14 Oct 2021 05:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LCGYTM8PrlK3nTDqb32h7V9GbZN6iE4UEGwF+ksTF7g=;
 b=LHxfpUO5m1fZ68k4WTsL3KrR/mn3qL0AwvVMvG+QVzQt1YyGm+dA2VgCHpPiJy3JWB
 OTGTrR8pegPXPLXT8M71FeDuvPUMnX/zhbJoztwC/akn4KGWzVyZC1gjM4yg5XbqHdkc
 3aGT7wfBhacqBakv9JsOjVTpSQUzv4bkaQrojCaY+eHH8zKYB3EPtI+LMNxhPU8Cg1yM
 Ua2SL+0hMsOF1ItVfZtoq+ZdNGJQgJAAborNSCO0zLGgpcPQDuWEDnoB6Jwpu2a3nK8B
 3W6yxM++UPDX8rLA2qyVJvdDoFLPbqHh8GKM4bDAmW6RyiJ+3U2cr6z8rm4O6/qmjDig
 /PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LCGYTM8PrlK3nTDqb32h7V9GbZN6iE4UEGwF+ksTF7g=;
 b=1UHeM4tcRGfLPsBMggZk779FAJqR4pVgisxT2Pv2QSxFgVn3UDBA41ShPab/T0vs30
 w6StCqnHjpjiNbQKa84im4B7oWsoEPETB7hFr3+6gKhTEIVtZ/tZZPUexSSMMXzOB7ax
 F65P5lK6bu0uI+C1J0okLgeS/Ssm+TO8oGpZEhlSkNmRl1MT9G8YnMnFRJtvWUFDOSMF
 PpTCp8b0BqTEAsq1umgPkDE86EsYMWr8T9ewFGPL0xIKeynW8GsvfiXiDuKu/dzseN2F
 QIx5j8ZVA6PZFmAc90M7crf03gjEXiZwLj1pVtOntQs6VFOHZC/xPPMmphpeYqJtDoJy
 kOkg==
X-Gm-Message-State: AOAM532wQrpEmXO4RV7JT37UwDHD8MPJlQuirMC0Pr+cpj7wDfgCMvhP
 RiDybz/kO0KgDw7CxvG8B3IquLe5UcXrP/6Ntk4=
X-Google-Smtp-Source: ABdhPJywqS5I4lc7tpAbXjXvHGk7VgfSjByPwdbpbD31qdl77TMxwCQTAXtbZL791keVv8Hu9089h+xd7nsTbThQtgU=
X-Received: by 2002:a0c:c24c:: with SMTP id w12mr4849547qvh.48.1634212929738; 
 Thu, 14 Oct 2021 05:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <ba520cf0-480e-245b-395f-7d3a5f771521@gmail.com>
In-Reply-To: <ba520cf0-480e-245b-395f-7d3a5f771521@gmail.com>
From: Robert Marko <robimarko@gmail.com>
Date: Thu, 14 Oct 2021 14:01:58 +0200
Message-ID: <CAOX2RU7VaxdU3VykTZER-pdpu6pnk3tbVrBmkGU=jPQo6rL3Xg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
To: Christian Lamparter <chunkeey@gmail.com>
Cc: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_050213_008416_8140B6F9 
X-CRM114-Status: GOOD (  25.88  )
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

On Thu, 14 Oct 2021 at 13:54, Christian Lamparter <chunkeey@gmail.com> wrote:
>
> On 10/10/2021 00:17, Robert Marko wrote:
> > Some ath10k IPQ40xx devices like the MikroTik hAP ac2 and ac3 require the
> > BDF-s to be extracted from the device storage instead of shipping packaged
> > API 2 BDF-s.
> >
> > This is required as MikroTik has started shipping boards that require BDF-s
> > to be updated, as otherwise their WLAN performance really suffers.
> > This is however impossible as the devices that require this are release
> > under the same revision and its not possible to differentiate them from
> > devices using the older BDF-s.
> >
> > In OpenWrt we are extracting the calibration data during runtime and we are
> > able to extract the BDF-s in the same manner, however we cannot package the
> > BDF-s to API 2 format on the fly and can only use API 1 to provide BDF-s on
> > the fly.
> > This is an issue as the ath10k driver explicitly looks only for the
> > board.bin file and not for something like board-bus-device.bin like it does
> > for pre-cal data.
> > Due to this we have no way of providing correct BDF-s on the fly, so lets
> > extend the ath10k driver to first look for BDF-s in the
> > board-bus-device.bin format, for example: board-ahb-a800000.wifi.bin
> > If that fails, look for the default board file name as defined previously.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
>
> As mentioned in Robert's OpenWrt Pull request:
> https://github.com/openwrt/openwrt/pull/4679
>
> It looks like the data comes from an mtd-partition parser.
> So the board data takes an extra detour through userspace
> for this.
>
> Maybe it would be great, if that BDF (and likewise pre-cal)
> files could be fetched via an nvmem-consumer there?
> (Kalle: like the ath9k-nvmem patches)

Christian, in this case, NVMEM wont work as this is not just read from
an MTD device, it first needs to be parsed from the MikroTik TLV, and
then decompressed as they use LZO with RLE to compress the caldata
and BDF-s.

>
> This would help with many other devices as well, since currently
> in OpenWrt all pre-cal data has to be extracted by userspace
> helpers, while it could be easily accessible through nvmem.

Yeah, for non-MikroTik stuff pre-cal data via NVMEM would be great.

Regards,
Robert
>
> What do you think?
>
> Cheers,
> Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5BBC87FCB
	for <ath10k@archiver.kernel.org>; Wed,  6 Aug 2025 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKRsyb59sI/Pq3XkM5WY2NBv4R8Bed8UvR0P+pyoDtk=; b=MVihtbuJIoSCC6ShIwTSOp9kXW
	mKloqkJb1f00frqx04J/zrjjBpslRuql/EAZgeMZUeI2iHMfcHs2A79LEyrVbfVE+Qc4FVvhkHehT
	OC4Kj94/vFWVDFZQs9FHp5XKi7ejOwNCgW2SmMGKW5sNArRdC7QnCA2YemTw3ReDzHJhITtc4CcYl
	XdtcgnIIgPmRLWXTUbZrs6xuJ1mJL8mIpgzmL20MQ2jZRW3a6s/sS+Q7n/JVYYoSkldVlI1Kdcyn1
	jpDm/QN+E4jaZpPxixmxLb+KCzxuSYsLFMsRxRl61Rqup75Iva0MrzU4YE/2hvz2LqLw6dM38V7k3
	PDPRcZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgzE-0000000Fl4n-0eo7;
	Wed, 06 Aug 2025 16:27:32 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgzB-0000000Fl3k-2qLC
	for ath10k@lists.infradead.org;
	Wed, 06 Aug 2025 16:27:30 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-615460d9897so87822a12.0
        for <ath10k@lists.infradead.org>; Wed, 06 Aug 2025 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754497648; x=1755102448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKRsyb59sI/Pq3XkM5WY2NBv4R8Bed8UvR0P+pyoDtk=;
        b=S5yTpIpsMVSrjGf5CFYKcIdo4EzVpKUPDwHrhvajdzT7Nj6ErwfATTOIdSwNpr/5eZ
         +MTwAXbSA0+Jh1vfknPWuhSMcZHb04u9/0UwFhdtK71Dlh55IKATygGLNZZccvRtqHvC
         srbU24Iv7u3e5pe05d/jIQWbVlSO+wmDTzU0BX2pZL9zoT1GzhpYd6rfN96JR0qYBIwf
         HZNMgnnV6fsUFlqGP/K9tC+iyFJClXnp3ycVyttHD+oJIa/d/57XLQJ4t+azxFFzD1Bv
         y/o8RuFU6sUyXDlgiCh4jctmmWqKIHMSXq0EzGn3dF1q/j7R9MyQxwRLCd+g366RECJA
         WtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754497648; x=1755102448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKRsyb59sI/Pq3XkM5WY2NBv4R8Bed8UvR0P+pyoDtk=;
        b=IcpKsf4ggerRovM2iDRQqx/d5MUjBYNK1hSjxTvkPV+HB/FJfHq+nPjvUVELlcbLgn
         AGzcwj5CaLrVpNJe5QFGDO2WzroZ9XFEyeSaiF5msbgcPEf5dcyUw5WuuNE70rVvJQob
         Dbh25/sPv8mt9LIh7TouTB3hngiyANniBwkgDqLVUHnxL8wzRlpfU07vWmYg0GkWRB6+
         USElqUt6ePgwXHFkyXOj/P6dczJCfUsXGxF3/SsRBBbC0i5zfIdIxURPKTCwlwmKLUW4
         7p5TMJPz9ljnduPXhzSwnEJU7Br+/GqEKUNrmHcRICZpDGiopnYfLA64CSkwxjGNBnIC
         I3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVMbQUbfwMiE4VpTg8qURl/G9zaZggraPJ2Ap4t8mQSdGlv6GYsavqovKHt2eovBT95/1WU+bc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDRTD7uMrZ6ifo5677qGIpi6SUUKLC4Dpb+UWn7rzHb4cLFvhz
	c6rNhrK851QekLKONGPDLUUgf5frGyxmulr4qft0wWDpeBW7jeI5MSbA4zdMqlmyhLRj0sWAxL+
	WcErHo2FhfN9Q2gm0BF7ZaKG65Jp0mT5a0eaklro=
X-Gm-Gg: ASbGncvJ1ZXo+FCkOloqwty8YpoAYmzEXWx2PF36ZzJAFR6g3/TlRo5kGMDJV8tFYUh
	JfrzVzDPrV60CK/WNrl6gUvKrEf/ewzqKxw4AgUAcSnMvAc7NHDV1o4ssyPZB0m45aGUq+W6Mol
	iWL8fLyYWRyn1GPDYG1kBLBdGscDg1jFYAXi3myMwhlPDUndX8VQBnFt8Eh7Q7RGNZBAYJWznkI
	XaWMA4=
X-Google-Smtp-Source: AGHT+IH6vL77K0F+FOI5EapxF6X+Udy6LtotpCRryDr1e1TWyn3yq7qNdb1xLXgvzbAi+AhvixzSiVNN9mxhuN+HGUU=
X-Received: by 2002:a05:6402:4558:b0:612:b742:5bba with SMTP id
 4fb4d7f45d1cf-617960d32cfmr2794188a12.13.1754497647805; Wed, 06 Aug 2025
 09:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250806070005.1429-1-hujy652@gmail.com> <DBVFA7TPXKHU.33YF5JEOR1ZLT@gmail.com>
In-Reply-To: <DBVFA7TPXKHU.33YF5JEOR1ZLT@gmail.com>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Thu, 7 Aug 2025 00:27:16 +0800
X-Gm-Features: Ac12FXyqQkfo1UOOBM-sReiwGwPCnQZ1-Yn7USfnfD30_SCYmcpO17i7YRBiyXU
Message-ID: <CAHGaMk_N5+YUwW99GoMp5Zv+-ueZWdyqfRNrJPQkRsyqkQcRTg@mail.gmail.com>
Subject: Re: [RFC PATCH] wifi: ath10k: support flush_sta method
To: Nicolas Escande <nico.escande@gmail.com>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_092729_715014_71BF622A 
X-CRM114-Status: GOOD (  24.43  )
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

Hi Nicolas,

AFAIK there's no easy way to tell if it works.
According to another commit [0] after sending the command it still
needs to go through tx completion->ath10k_txrx_tx_unref.

Best you can do is the debug message.(ATH10K_DBG_WMI, ATH10K_DBG_HTT)

[0]: https://lore.kernel.org/linux-wireless/20200415233730.10581-1-wgong@co=
deaurora.org/

Best regards,
Zhi-Jun You


On Wed, Aug 6, 2025 at 10:42=E2=80=AFPM Nicolas Escande <nico.escande@gmail=
.com> wrote:
>
> On Wed Aug 6, 2025 at 9:00 AM CEST, Zhi-Jun You wrote:
> > When a STA is marked as no longer authorized, if the driver doesn't
> > implement flush_sta(), mac80211 calls ieee80211_flush_queues() to
> > flush hardware queues to avoid sending unencrypted frames.
> >
> > This has became a problem for ath10k because ieee80211_flush_queues()
> > will stop all traffic and call ath10k_flush, which waits until the
> > whole HW queue is empty. In a busy environment this will trigger a
> > timeout warning and stalls other STAs.
> >
> > Fix this by implementing flush_sta method using WMI command to flush
> > frames of a specific STA.
> > Flushed frames will be marked as discard in tx complete indication.
> >
> > ops->flush_sta will be set to NULL if htt.disable_tx_comp is set to
> > true.
> >
> > Tested-on: QCA9984 hw1.0 PCI 10.4-3.9.0.2-00157
> >
> > Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath10k/mac.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wirele=
ss/ath/ath10k/mac.c
> > index 24dd794e31ea..6959f20334a7 100644
> > --- a/drivers/net/wireless/ath/ath10k/mac.c
> > +++ b/drivers/net/wireless/ath/ath10k/mac.c
> > @@ -8135,6 +8135,20 @@ static void ath10k_flush(struct ieee80211_hw *hw=
, struct ieee80211_vif *vif,
> >       mutex_unlock(&ar->conf_mutex);
> >  }
> >
> > +static void ath10k_mac_op_flush_sta(struct ieee80211_hw *hw, struct ie=
ee80211_vif *vif,
> > +                          struct ieee80211_sta *sta)
> > +{
> > +     struct ath10k_vif *arvif =3D (void *)vif->drv_priv;
> > +     struct ath10k *ar =3D hw->priv;
> > +     u32 bitmap =3D 0xFFFFFFFF;
> > +     int ret =3D 0;
> > +
> > +     ret =3D ath10k_wmi_peer_flush(ar, arvif->vdev_id, sta->addr, bitm=
ap);
> > +     if (ret)
> > +             ath10k_warn(ar, "failed to flush sta (sta %pM)\n",
> > +                         sta->addr);
>
> Hello,
>
> Just to be sure, you have seen real improvements from this ?
> Because I remember trying this exact WMI command two years ago and I coul=
dn't be
> sure it was actually doing something. That's one of the reasons why we en=
ded up
> doing the per peer frame accounting as posted by remi here
> https://lore.kernel.org/linux-wireless/17d26d6a3e80ff03939ee7935fdc07f979=
b61a4f.1732293922.git.repk@triplefau.lt/
>
> Thanks


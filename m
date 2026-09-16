Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE57C88E5C
	for <ath10k@archiver.kernel.org>; Wed, 16 Sep 2026 06:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSGe38PhJmGSFK46iAJT77WdJWyV03W3gLiL5YZ41tI=; b=KaW5PEpy9B8LoIw95MYVfgS0eR
	K15/Q0PQKToLDdLhKjk2ph1o9GNhP1nJIV2buiw/PtMwagpZ3hcre8vAXX2mJzSiBmoQ36ft0xv2b
	1ES33NwINkm1ceasFqoOm0y6VkphoqXDYkhLd+JMhd24Ghe/rPC+asPP5nE7zCmRzgm2wtQgdjsT0
	in1BgL6GefEPB42e/UVU2osxAwPhJqK9ZcePShLcZJiioPEeUwVCroWHwOf60pWe+tMaz2BDqFw/h
	O3VxUwE7ZfEvdaqnoRxzHv9lIKW94EzTb78bGT0N+mXcCNF6Xhm4nvOoK4fJ0ts+MmPq1WIur9Auo
	NRYQQ/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jZE-00000008XIk-278E;
	Wed, 16 Sep 2026 06:56:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jZ0-00000008XGD-0Xx4
	for ath10k@lists.infradead.org;
	Wed, 16 Sep 2026 06:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789541768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OSGe38PhJmGSFK46iAJT77WdJWyV03W3gLiL5YZ41tI=;
	b=eJ5ZdNzcSPKfhShyN/0hU5skgzhAu9BH9ySDCCS26mKlIpRfk0l4C382CgxwOlyTtJpA8L
	yLENuWQU0b47cYUITH5v+J2FJBirhfUmHyyPlWOJuyVJHJ0IHjyezRk7oDujQ7/daOmsRc
	jjMyiLEdUtaB11WLdGEiJwmdGT6jV3g=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-JGhPn03ZPI-OZPERs10Z4g-1; Wed, 16 Sep 2026 02:56:04 -0400
X-MC-Unique: JGhPn03ZPI-OZPERs10Z4g-1
X-Mimecast-MFC-AGG-ID: JGhPn03ZPI-OZPERs10Z4g_1789541764
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-89244a51e62so3357957b3.1
        for <ath10k@lists.infradead.org>; Tue, 15 Sep 2026 23:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541764; x=1790146564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSGe38PhJmGSFK46iAJT77WdJWyV03W3gLiL5YZ41tI=;
        b=DlUFB1n7+VxSLHgv39+dyP3WLd27TkyEev5EWuJz7vSKyKVWk6BUKYZnXej5LCZwm+
         TuNGPCWs+a+HTifSscVTLE/uXCsQOj9vltba81rgHCsMIpki2rtm+ig/s/uTFnCctbI/
         ZJzOxBjMyaEWpQFqYoWAukDgum0+o2v1odtSv0gm9gRrhrJYmU9e9CIe5QCnfC+yZj5v
         FBy8voEkE465qcDYnqeGUYUFro9szlYdBDHrm0Ioh+X1uDqaixL3uTlw6tEKtWCs2yYP
         DZSw4E2qsUy0h7jtZMZlwAeRVFgXm2N4cVaj9Wrl9L/G8ivErU0I1KOjo4zn0y9efBW4
         Ek+g==
X-Forwarded-Encrypted: i=1; AKwUvBwBM4DTwRj0DHjywh0x0ifL71/rrwmFg7m+c0xQbMwkNB10DTZrS3UPdxVcUVcHn2+bIIKyz6Q=@lists.infradead.org
X-Gm-Message-State: AFuF++lyw9tCTJVGvpm7ZYFN8l6koKLPrJEiNy8VPBCoNBrdz5GPBEhz
	PvzjSQdKueQpPUJ44QXDCgP93h/Tgb3c1FdyYF0QPrKN/ZiOqN3sCX7DhzwLi55zBPWJlu262L6
	ac03tMjdfGs00PrCPc25G9EJZEd619HriX5CXKpqaBWjtkmeWGGHGM9+dPMZ2g8wOug1fOdw3rs
	piiIX5D1/lPZYXA7Sd04H4YR5WsvPSHTik++3b1w==
X-Gm-Gg: AYBFou0tdFr3j3DYmeNyUpw1ErabGJlxgtcqeLWYAANe74/a/HlqdfoJmGtQ8AODhnK
	4J5blMB/6Mv23seosW1soNn77mKzbe5VGa1Br0YNrAxx478Iz3kNsfm9hckAROIzKhdkl4lWgfd
	d1ELEAYVdZY+iF4lrvHwdlpjr4+md0LJzAJL6Vh+zaoGpyAZafjhNB8Q==
X-Received: by 2002:a05:690c:f05:b0:873:5c6b:a303 with SMTP id 00721157ae682-892287f189fmr4701817b3.49.1789541763830;
        Tue, 15 Sep 2026 23:56:03 -0700 (PDT)
X-Received: by 2002:a05:690c:f05:b0:873:5c6b:a303 with SMTP id
 00721157ae682-892287f189fmr4701707b3.49.1789541763437; Tue, 15 Sep 2026
 23:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com> <aql_xwEy5POcVmyU@google.com>
In-Reply-To: <aql_xwEy5POcVmyU@google.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 16 Sep 2026 08:55:52 +0200
X-Gm-Features: AcwNN1W5FaZULdrsdUU_R6G0qyPldCKGYGglzM9AHIv81gsd1ujgPjiFMobViKg
Message-ID: <CADSE00JiEr+k3ykLq+D9C-WxAcPpzXdF3uJnv_P47G1V_-jeNQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: clear QMI if failed during init
To: Brian Norris <briannorris@chromium.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Govind Singh <govinds@codeaurora.org>, 
	Niklas Cassel <niklas.cassel@linaro.org>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vGOYh37y9_zK6v2bxh9ywZqzDhUX50AxX17XxCU-5xQ_1789541764
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_235625_462964_74A5C1FC 
X-CRM114-Status: GOOD (  22.87  )
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

On Tue, Sep 15, 2026 at 7:26=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> On Mon, Sep 14, 2026 at 03:05:19PM +0200, Albert Esteve wrote:
> > A failed ath10k_qmi_init() left a dangling
> > pointer (ar_snoc->qmi) in the cleanup path.
> > Clear the pointer on the way out for hygiene
> > and consistency with deinit().
> >
> > Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 cli=
ent")
>
> It's all going away (probe failure / removal) if we get here anyway, so
> this hardly qualifies as a "fix". In fact, in a cursory check of the
> driver, it seems the NULL-ability of the ar_snoc->qmi field is totally
> irrelevant to this driver -- it never is actually checked.

Yes, I agree...

>
> I suppose you can still call it "hygiene" though, and it's probably
> reasonable to do the same here as we do in deinit().

... that's why I phrased the patch body that way. I hesitated about
using the Fixes tag here. I can send a follow-up removing the tag if
you'd prefer.

BR,
Albert

>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
>
> > ---
> >  drivers/net/wireless/ath/ath10k/qmi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wirele=
ss/ath/ath10k/qmi.c
> > index 0d74548a5f34..08a64f737fb4 100644
> > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > @@ -1128,6 +1128,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_si=
ze)
> >
> >  err:
> >       kfree(qmi);
> > +     ar_snoc->qmi =3D NULL;
> >       return ret;
> >  }
> >
> >
> > ---
> > base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> > change-id: 20260914-fix-ath10k-dangling-15676d427cbb
> >
> > Best regards,
> > --
> > Albert Esteve <aesteve@redhat.com>
> >
>



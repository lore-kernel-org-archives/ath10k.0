Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0AFC9830E
	for <ath10k@archiver.kernel.org>; Thu, 24 Sep 2026 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=; b=opkcO0hU7lXOEwWNuYm9ncZT/3
	wGdn2fUNrb11YihQn7adLoNwLFv51JI72UwEcLHyZCTwK7r6cVjzv1Xpe/AuEc8HSQTyN7tHyZFR2
	Vp96y8zzXuqBjfuuaWCsv31fooJ/hlhNubjKuU9yRQ43r6mmzyLdK3t8uJsk3MgNgQ+1Xphdt5BGG
	JKsTUxGY+XzdhTZyr+zrIcZKOjU6Y8tD1/FDIzj8bgzN6sSLSzpgYYtiFrm88yMhYQzGZDfnQhQJD
	57rdFukj7cNMd/BzZADmMcTC9O6LIOhd7Njc0p1HAIXA/TeVuKaNzdGnnscUaMZpOwdqlCbe7yefZ
	T3iBSqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kwN-0000000BKFo-34MF;
	Thu, 24 Sep 2026 15:00:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kwJ-0000000BKEX-2oTt
	for ath10k@lists.infradead.org;
	Thu, 24 Sep 2026 15:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790262044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
	b=TLHqpmOP/v8DhuvblEffEV93YjOTJxSFZLEs+RwfgB+NxVdTz/ygl97ONXzAbvTGfZCPgk
	eMTv6y8GtvNgLa1EC7HTLUxt2chtIVfXhXdkx5XXP8YyvZ+mePv41vBysotpRqobDBQjc/
	7FHbD5YMNAz4EW9ZRjZ3QSnNM9+xHRo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-DXz9IZapONyBtPV4whWV8Q-1; Thu, 24 Sep 2026 11:00:40 -0400
X-MC-Unique: DXz9IZapONyBtPV4whWV8Q-1
X-Mimecast-MFC-AGG-ID: DXz9IZapONyBtPV4whWV8Q_1790262040
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-837aaa9a3f6so21866837b3.0
        for <ath10k@lists.infradead.org>; Thu, 24 Sep 2026 08:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262040; x=1790866840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=VDeqYu2v5WMTskjANu8JD4cD1SEgZMeF3MCiwPi3nTCo06StjoSGdpnlUNmXvpqs6K
         K7vmjXaSjTxUG48261uru6oFFzlQA2o9Ep/wxML1oVqBLxhTeJj+jqpXiCV79uGP4jaK
         Yh9mvwCxN6JWNC4dggs6tDQMEYiKPv2PIdxcloBjjzhAqc71GmUaU2igBU9/R5jipmSj
         scL/mEae8PXem6h9N2Kcx4BfPwgWCYUbWI7zt/PwsTIPV1yrqVh5uCEj5A42sMBx2c8A
         FXaeBiR95rBE5sBkX64FJbu9xhb+SwLs0Qto+lGLqf4XP3RZPpsonhpCPzna0gToXy0T
         JABw==
X-Forwarded-Encrypted: i=1; AKwUvBwTC9NzmgMg3+Xv0x5Rc+yZwvRBI+1G5U3vdfZz456vjrZnox7X4xXPWTGeSZReS9oes/nppZE=@lists.infradead.org
X-Gm-Message-State: AFuF++mPbu8wdyV8sdA3NhLrTobIC5nikH7AI9uWkjc/AcrijBRHHmNR
	v6O4nAFheQ2DNMI1DBhUEHXlp+4noenM6BZsqOfAsa2jod24hmtIFAOvoj4hYRTwemDCmWCQlTC
	dAOgwGUlETw7z2qXSv/cf5FJajAmdnKbM39/bL903kqFo0XRoXJho2WfmRz0mwtOl02um4GEI71
	RHTR+8a9uItMO9Gb+A+O9yXe7ZmEhdX6SM42OO/w==
X-Gm-Gg: AYBFou3mqdTTy/mJ2+/87B+NOljUFMjqMbLWXFrsAJTaS9p73I+z+0DQJbcLJqQ+fM1
	1rnaetMr/XYF1GUEocaGdXBy+g+5oGiJ7CfqRVmn1r4JvtxjcDeUe2/zGGox5gT5kgB21Ddy8DA
	SIxGrl7Ustbfvu/vErloDQkGfC0iF5K9BUpi0HF1LShw/Gb+3FLrI++g==
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id 00721157ae682-8a64e5d7328mr16132027b3.20.1790262039518;
        Thu, 24 Sep 2026 08:00:39 -0700 (PDT)
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id
 00721157ae682-8a64e5d7328mr16131377b3.20.1790262038827; Thu, 24 Sep 2026
 08:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
 <EKwbCgCnxbNX4p95qJ3xoytzeNBBLc2L_HOVWr-S-y8n7pNOIToj37TyoXRcLyIK1gjq_IvbreQ331gw6jIK9Q==@protonmail.internalid>
 <20260914-scm-device-api-v1-1-3573e2596c51@redhat.com> <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
In-Reply-To: <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 17:00:27 +0200
X-Gm-Features: AclHuK_S1nrFMWot6v8DC6klfULfaNk07isgmJtfP7BYAekyrR84kzWx2Uw9qhE
Message-ID: <CADSE00JhFYhDV2cuVxZwVTX6LTe8zH0-BR=-Fhv+6UXeFxq_Zw@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: qcom: scm: pass qcom_scm to internal helpers
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Jens Wiklander <jenswi@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Brian Norris <briannorris@chromium.org>, 
	Govind Singh <govinds@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	Maxime Ripard <mripard@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: slTKDmW9l5vMMbpHOkQBMK2gSb0jK6NDFpW7mkBOVSM_1790262040
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_080047_798238_2D93F5E9 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed, Sep 23, 2026 at 11:00=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 14/09/2026 13:41, Albert Esteve wrote:
> >   int qcom_scm_pas_auth_and_reset(u32 pas_id)
> >   {
> > -     return __qcom_scm_pas_auth_and_reset(__scm->dev, pas_id);
> > +     struct qcom_scm *scm =3D __scm;
> > +
> > +     return __qcom_scm_pas_auth_and_reset(scm->dev, pas_id);
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>
> Why make this change at all though ?
>
> It takes a pointer to the file static _scm
>
> The reset of the patch looks straight-forward to me but this change
> caught my eye.

Yeah, this change isn't useful. I aimed to avoid passing __scm to
function calls but it does nothing in this patch, it'd be better to
change it directly in the next patch that changes the signature.

BR,
Albert

>
> ---
> bod
>



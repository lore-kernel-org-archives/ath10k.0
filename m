Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CE6C48BF6
	for <ath10k@archiver.kernel.org>; Mon,  4 Mar 2024 19:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8fbNX2+d4xJt/r4hFrd8+YanInaSaY5k4I1MnWjcGk=; b=sCpbm3TWeJ8Shu+uWYRlCr5H3G
	zFdYj46dzxtNYwgDPis1Zdd1IgD5NwF5rcPbS3l5kUNBDyc7QeHnWWdeE+FePahZTtSomLk5/6Wwc
	ounEayStbviVj4+SC0pLK8osTHvjbiJTrvSqMledugBoe+m3vL4d/f6ro33tBZKWyxiSnprR337Mx
	BvmmHRlnVaeIqTN/nx8rVkhu3isTjoQMfRofIzJvvHKzCpyV1TeS0b2/l/cvcn7frJKwr5X8tF8nL
	v0WJ9LiKUCAEit2WuByYkTkbusU+9jF3WirxmO87iptOPoTgM7iOaaR33MhNaw1cXyFzezpyrX34k
	V1ZFT1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhE7j-0000000ASyA-3XDW;
	Mon, 04 Mar 2024 19:37:19 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhE7e-0000000ASxl-0V7S
	for ath10k@lists.infradead.org;
	Mon, 04 Mar 2024 19:37:17 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso5395265276.0
        for <ath10k@lists.infradead.org>; Mon, 04 Mar 2024 11:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709581031; x=1710185831; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J8fbNX2+d4xJt/r4hFrd8+YanInaSaY5k4I1MnWjcGk=;
        b=q2PuvmRMh0Vd49nQZANapYUIEu9smXLtcCwsIA9T/KkuOTdHkTYHuijxKg04j79Q4o
         /dBnQeaWhnoq4R2EDLYdSr84mwNUFwetzlmwXeIkDnYUIgASIpMLVDRbGNtjH7AFwNQd
         Dg09oNiaa5O65/yItSVjwxnk+eGcVucHpbTipDbr05CkFDxXHJAzlUf2jXgv9CdDHzQh
         5UEzZg2Kl4GCN/HnkSvGYTBu7cTsEfRp4bCN3tLHFVi1G53nT/q8Rjb8JgSauEs59eD7
         s5mRxQphgrjJlNpDebutBJibYOSykf+WvVQTLJ3i4r4Wn95rs+TOUJvAtcSnfvEPkc1K
         ZlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709581031; x=1710185831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8fbNX2+d4xJt/r4hFrd8+YanInaSaY5k4I1MnWjcGk=;
        b=mexObdm3RUW5hZM5K6e86XtcDqxvHKQ7s3Zb97slFnjEqx0r7ErHwKBCpixioyLiTJ
         nxcrlCIE9eLMp/1QP+aVunVA5dm66L9lHGus72siuyj2W0agcX5PJzcZHGaI21i5Rqm6
         KkRu4yWGYeCj4PQoS4jMjbSy4qd29EVtF7Ul6Z9iy1I7phoKoKnkbuO8MoUMH8FuBka4
         bQCpZ2huke3yUlj7YkaRNjU4WvePc2wE/dl3oxgZR/dIvy6qyRjvKR60blgI7JWG3h/8
         LZmQ2AAi79wHXMUBtxEzRydwPlmnL9cIuhF/+Z2j+DTjy8mfTcZLfcPD3q/uyZYWWuAa
         urVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjrALnAiBeLVRty8UCVrL6EkN8lrGejoV1iZC1axJMOOTLujFiP+KMm8WOmcdu6LPyEUmLIiacm52NfYiIkKON1Hs3p4sr7ZrGeQ==
X-Gm-Message-State: AOJu0YwisEro+hwZePuFFG4HXkQQSB8dkWga5LIYHZRj/j0YbPAUVrSW
	kaOkdlEPWcmTvywDMzHa+ERF3DuppV5TGdlUE+q7t/2z2/Go/CFd3DNBSFu2APbE8lXGSJ4txxQ
	pTOrcxvyvaJNvry4pVyqnU9y62fNxf6vgjoyxKQ==
X-Google-Smtp-Source: AGHT+IFskfMkvbhuL7lWERfrGXnJYipiwsI8cQNOg7iPvazOr109t1rBNvJLaoiLtPJsynrOADgfWnkXxFwLlxr+9KE=
X-Received: by 2002:a05:6902:544:b0:dcc:9e88:b15 with SMTP id
 z4-20020a056902054400b00dcc9e880b15mr7619178ybs.41.1709581031338; Mon, 04 Mar
 2024 11:37:11 -0800 (PST)
MIME-Version: 1.0
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <20240229-ageless-primal-7a0544420949@spud> <68a49964-7c05-4575-a4f3-35848c08fefc@freebox.fr>
 <20240304-component-animator-e2ee0ab7574a@spud>
In-Reply-To: <20240304-component-animator-e2ee0ab7574a@spud>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 21:37:00 +0200
Message-ID: <CAA8EJpq5HQaO2E2Pd7yqUTsWyQ_pLDdyoWng8QmWTzYn5fv3PQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Conor Dooley <conor@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>, 
	wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Jami Kettunen <jamipkettunen@gmail.com>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_113714_261568_94CD66B0 
X-CRM114-Status: GOOD (  32.93  )
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

On Mon, 4 Mar 2024 at 21:34, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Mar 04, 2024 at 05:21:37PM +0100, Marc Gonzalez wrote:
> > On 29/02/2024 19:40, Conor Dooley wrote:
> >
> > > On Wed, Feb 28, 2024 at 06:37:08PM +0200, Kalle Valo wrote:
> > >
> > >> Marc Gonzalez wrote:
> > >>
> > >>> As mentioned in my other reply, there are several msm8998-based
> > >>> devices affected by this issue. Is it not appropriate to consider
> > >>> a kernel-based work-around?
> > >>
> > >> Sorry, not following you here. But I'll try to answer anyway:
> > >>
> > >> I have understood that Device Tree is supposed to describe hardware, not
> > >> software. This is why having this property in DT does not look right
> > >> place for this. For example, if the ath10k firmware is fixed then DT
> > >> would have to be changed even though nothing changed in hardware. But of
> > >> course DT maintainers have the final say.
> > >
> > > I dunno, if the firmware affects the functionality of the hardware in a
> > > way that cannot be detected from the operating system at runtime how
> > > else is it supposed to deal with that?
> > > The devicetree is supposed to describe hardware, yes, but at a certain
> > > point the line between firmware and hardware is invisible :)
> > > Not describing software is mostly about not using it to determine
> > > software policy in the operating system.
> >
> > Recording here what was discussed a few days ago on IRC:
> >
> > If all msm8998 boards are affected, then it /might/ make sense
> > to work around the issue for ALL msm8998 boards:
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> > index 0776e79b25f3a..9da06da518fb6 100644
> > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > @@ -1076,6 +1076,9 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
> >       qmi->ar = ar;
> >       ar_snoc->qmi = qmi;
> >
> > +     if (of_device_is_compatible(of_root, "qcom,msm8998")
> > +             qmi->no_point_in_waiting_for_msa_ready_indicator = true;
> > +
> >       if (of_property_read_bool(dev->of_node, "qcom,msa-fixed-perm"))
> >               qmi->msa_fixed_perm = true;
> >
> >
> > Thus, anyone porting an msm8998 board to mainline would automatically
> > get the work-around, without having to hunt down the feature bit,
> > and tweak the FW files.
>
> How come the root node comes into this, don't you have a soc-specific
> compatible for the integration on this SoC?

No. Ath10k uses WiFi SoC as an SoC designator rather than the main SoC.

My 2c: I think it's easier to fix the firmware features bits, it's
more future proof (and error proof).

> (I am assuming that this is not the SDIO variant, given then it'd not be
> fixed to this particular implementation)



-- 
With best wishes
Dmitry


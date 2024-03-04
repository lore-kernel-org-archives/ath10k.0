Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E621CC48BF6
	for <ath10k@archiver.kernel.org>; Mon,  4 Mar 2024 19:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7ApIryQlDH5kdwqHRhQLsTZp2nthteXM5vapyQjPNI=; b=DAQ2UISXLSr12HygAgs74qlFqm
	NvMjHEBigQC49OAjue5AEwzImWvvz9VZHa31yPNetf1tFhQ9bHQc3wylK46DIC5huEzyDcUBX1rtF
	VMdXA6oE89lWXH6jXuEoU/W8AK3rqKbBDmAnBt77wgz0/17Dr5m28G/C71rgajBlhWN+4kgrqIuNj
	QQe1hNU3NUY6MmczMTT7surld7jqgH9JOdYFgTkI9tIr5Wq4DsSx7a2WBWxxKlU9CnXA+5DkFgLjc
	3tzp9h0wFusuqrbaA0vBr46UKNwheuqzcWr9zLLJ1wz6a7wARS0IoL07PXoWuNV1rmi4DHmgb0tmc
	++gZylOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhETA-0000000AVmw-2kSk;
	Mon, 04 Mar 2024 19:59:28 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhET8-0000000AVmG-04kx
	for ath10k@lists.infradead.org;
	Mon, 04 Mar 2024 19:59:27 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso4863689276.2
        for <ath10k@lists.infradead.org>; Mon, 04 Mar 2024 11:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709582364; x=1710187164; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O7ApIryQlDH5kdwqHRhQLsTZp2nthteXM5vapyQjPNI=;
        b=RR51eVsN+rVhnzpKbBNqVPNNMKkDmwMTV1rmXZ5WWRpeF/QSOJ9IBLpQ6p9kqYpqbZ
         9ObJWJCN+NaR1uhpq02xZLY9CyBYHWsAPLOpV9b6/QZgg63UP2ikmji2HDS2y6BTDUNb
         47kYERi1p33H7lunH2KKVReLnKJrZZud2Jv2dqZpabnur6l4c9OTwoegoGDZxzyveLGZ
         /tozxIz/HmYjBCHcm6nn9k1CcnUX4YRnitBXzckEBC+IXoCJu/HabgRswPj59weDVZLy
         aYtIwbxOrCInSXV/CVobr4iMkJqmGTs3ybgQOU+ZjYQx+/zGoEf3hJXRMp6OcZSrSt+0
         fMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709582364; x=1710187164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7ApIryQlDH5kdwqHRhQLsTZp2nthteXM5vapyQjPNI=;
        b=glJ6a0WrS+w+2lcPz1tr3WoIfpkhRReUkjOfscafFMkfQ6YpkQy1Q/+tUIk+rb45YE
         XDdqbCq+pI0IH7AlEcijh3QzeDsOTySl8XfpifUqfr/JLe7h+1u9YsUbCaHmEdPN5lfh
         pT1FnK68jwCYpLBZ5ahmKphp1ONKOMmCNjN0NP95lRgJ2MVDioh3gI70eGGvGLMPF2KS
         N4IJaKUF+gt9Z4MP2ybr7YlJjsZOglaCHSBU5AKGHGwZh+L0N+RPja41fsk4d9ZHXVJK
         l3AgdYaRwJFSI6vXQMvqO3VPdU8aMyET4ryjB7cd5C5SB2US9DCDjE8XRdKfpK3gBPMH
         h++w==
X-Forwarded-Encrypted: i=1; AJvYcCWGDG10srI9+VqS0yWxDJrF1XSGGvemXakMei/A3am2zR5un278s3fkrfQwD/aH8D7YWJhxnBmy99CKUELiNCjpdkyCX0M87BRN8w==
X-Gm-Message-State: AOJu0YzkyIUB/3tlFIRYqmYQtYcc71v4E6HbdbnZf/iSpLJaJ8hYzuIh
	8/C11x6XFyXYtG8b7TnCLyuLzwqVcGj14uKTMVghQm6lZLWbmGRVYclTaVf9CWIIU3dHHoK8GnT
	P3euH0t6ParnB+bBjl9sHBJ+m/Xj+zeYK3gTkxg==
X-Google-Smtp-Source: AGHT+IFnQw6N1M8E9h2cK2eBp9EVBI/pDE+40vH46B3fNHuxcXlR4tfux0fKhMgrMwCn2qTbqbQZ+zbrI98PG/Y2Aek=
X-Received: by 2002:a25:4b05:0:b0:dcc:7b05:4cbb with SMTP id
 y5-20020a254b05000000b00dcc7b054cbbmr7295644yba.31.1709582364453; Mon, 04 Mar
 2024 11:59:24 -0800 (PST)
MIME-Version: 1.0
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <20240229-ageless-primal-7a0544420949@spud> <68a49964-7c05-4575-a4f3-35848c08fefc@freebox.fr>
 <20240304-component-animator-e2ee0ab7574a@spud> <CAA8EJpq5HQaO2E2Pd7yqUTsWyQ_pLDdyoWng8QmWTzYn5fv3PQ@mail.gmail.com>
 <20240304-superior-vicinity-3dc6ca88141a@spud>
In-Reply-To: <20240304-superior-vicinity-3dc6ca88141a@spud>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 21:59:13 +0200
Message-ID: <CAA8EJprMG=fY-G-X03bm7MMhcua9axjw5ULZz0efgHxwzgrdVg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240304_115926_253654_5D9FA500 
X-CRM114-Status: GOOD (  36.60  )
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

On Mon, 4 Mar 2024 at 21:46, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Mar 04, 2024 at 09:37:00PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 4 Mar 2024 at 21:34, Conor Dooley <conor@kernel.org> wrote:
> > >
> > > On Mon, Mar 04, 2024 at 05:21:37PM +0100, Marc Gonzalez wrote:
> > > > On 29/02/2024 19:40, Conor Dooley wrote:
> > > >
> > > > > On Wed, Feb 28, 2024 at 06:37:08PM +0200, Kalle Valo wrote:
> > > > >
> > > > >> Marc Gonzalez wrote:
> > > > >>
> > > > >>> As mentioned in my other reply, there are several msm8998-based
> > > > >>> devices affected by this issue. Is it not appropriate to consider
> > > > >>> a kernel-based work-around?
> > > > >>
> > > > >> Sorry, not following you here. But I'll try to answer anyway:
> > > > >>
> > > > >> I have understood that Device Tree is supposed to describe hardware, not
> > > > >> software. This is why having this property in DT does not look right
> > > > >> place for this. For example, if the ath10k firmware is fixed then DT
> > > > >> would have to be changed even though nothing changed in hardware. But of
> > > > >> course DT maintainers have the final say.
> > > > >
> > > > > I dunno, if the firmware affects the functionality of the hardware in a
> > > > > way that cannot be detected from the operating system at runtime how
> > > > > else is it supposed to deal with that?
> > > > > The devicetree is supposed to describe hardware, yes, but at a certain
> > > > > point the line between firmware and hardware is invisible :)
> > > > > Not describing software is mostly about not using it to determine
> > > > > software policy in the operating system.
> > > >
> > > > Recording here what was discussed a few days ago on IRC:
> > > >
> > > > If all msm8998 boards are affected, then it /might/ make sense
> > > > to work around the issue for ALL msm8998 boards:
> > > >
> > > > diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> > > > index 0776e79b25f3a..9da06da518fb6 100644
> > > > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > > > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > > > @@ -1076,6 +1076,9 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
> > > >       qmi->ar = ar;
> > > >       ar_snoc->qmi = qmi;
> > > >
> > > > +     if (of_device_is_compatible(of_root, "qcom,msm8998")
> > > > +             qmi->no_point_in_waiting_for_msa_ready_indicator = true;
> > > > +
> > > >       if (of_property_read_bool(dev->of_node, "qcom,msa-fixed-perm"))
> > > >               qmi->msa_fixed_perm = true;
> > > >
> > > >
> > > > Thus, anyone porting an msm8998 board to mainline would automatically
> > > > get the work-around, without having to hunt down the feature bit,
> > > > and tweak the FW files.
> > >
> > > How come the root node comes into this, don't you have a soc-specific
> > > compatible for the integration on this SoC?
> >
> > No. Ath10k uses WiFi SoC as an SoC designator rather than the main SoC.
>
> Suitability of either fix aside, can you explain this to me? Is the "WiFi
> SoC" accessible from the "main SoC" at a regular MMIO address? The
> "ath10k" compatible says it is SDIO-based & the other two compatibles
> seem to be MMIO.

Yes, this is correct. MSM8996 uses PCI to access WiFi chip, MSM8998 uses MMIO.

-- 
With best wishes
Dmitry


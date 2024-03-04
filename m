Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2495C48BF6
	for <ath10k@archiver.kernel.org>; Mon,  4 Mar 2024 20:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXtl30v0bU2lNsKD86GDf5XsqAJnzL0Xmw5DBF9rviw=; b=r8vDG8YMtDfpG3tpKmQmNLGvsD
	8JZS900UQ47R0ZHPD/P1SszHKlwvYpVmHHleJY2KEzGQ1uOsoGR4vVxcmtHxJSfTDcz1q79UlJUNg
	7HklPhrcOkP0S4UMPJRLBL7NtP3qZmEQv/jKyFUTYgzBbPFX+NaDLMpkvJ1DefTpo/yRyRXC2olso
	9r5AgnnO78ExFfAygQIa9rvywh3u3iGwPde6s0tembTMXyoTejlzoKuKR0HishcXchD9rXj0BbsBI
	rYeMgHkCuvBdlWvwIHuPb9ozuLyn0RHNmXquyqe6GvT9rfPG4vhWuhc9Y/c/DFNFmx5Y/vJMSGc/2
	iKwbveDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEoZ-0000000Aa5U-2sy9;
	Mon, 04 Mar 2024 20:21:35 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEoV-0000000Aa3f-0HrR
	for ath10k@lists.infradead.org;
	Mon, 04 Mar 2024 20:21:34 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso5103767276.2
        for <ath10k@lists.infradead.org>; Mon, 04 Mar 2024 12:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709583689; x=1710188489; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rXtl30v0bU2lNsKD86GDf5XsqAJnzL0Xmw5DBF9rviw=;
        b=uDD/RwfoY4R0DECU3H53fMpA2Pw/r4aq+SMSMLdIJnmj4YkWq0bxZrh5RBiefUPupr
         25kqmSzOVgsn581ezS/qrFbOP287pHqeCvmhEFsdYNJq6XP4GfbXsk88p5CD0KTeSNP9
         O7pAMGZTDHrsWKSXw4SK/5MytaVGHnfMLXBHbOkBI7pg5nA5VEQ1Ui5JSGJxtMC/GpsZ
         alGFEoOPcDvYj2IJTHw+N6Owh1UhXA/8NYqhxbuUjvBOvhV9wZRjaWcXtjq9XRj8nQTZ
         n9402SFoyS0nvO/GHKjSXL2KkTTvj43swSbMohUeVGAINbqh8/jkj3NTPPo7lIHAdBJJ
         Z3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709583689; x=1710188489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXtl30v0bU2lNsKD86GDf5XsqAJnzL0Xmw5DBF9rviw=;
        b=sJcNoRvuRA8ft2N79W8A1/eBruHuKOSITLF/10PlN0qD2mTUihyrF4x1zRBNwkLImq
         VObZ2aJV0oHDAYzVjCfpoAsCFsoUR0CqJ8m1MwHZht4q/B682UTjA0DmQk+PI9Kj1YL/
         zJ7eDkMlvAoCePMZf/sOpVKyouytxm6Qm7siM2BfNOTG3xa0EXw12EzOJLZScbd7aca3
         ojYHd4f9j0ZqbQFnU8xOXUNstVOO4MGgnpNYlhk8lOKvL12IUJ9Ga8qY711dwHBu9Z0S
         TPHWrjpQxV4mhwatenA+Ms+pHIo4m5MnbXnhN4HL8pCwnZYFr5/lWsrWHLxCZ2oYcp1q
         bDmw==
X-Forwarded-Encrypted: i=1; AJvYcCXz0FhnssFiTKXaX2S89DevoVimuJYs7/LzQUQgVr3AixGmarjlSXeAn92L2laQgybFWW8MukSpR2+gLkPp7rPO1Knhz7KBa6kcvg==
X-Gm-Message-State: AOJu0YyNjnfbuMpNJwAA3PAYkI7GVlLf20LSx/4qko9R7a/3btXuxSPN
	OSk7S5HWSwkuXHPsBgEfH9YPcGYMieha8tQv+RutEHRESNIecY8GjQ1wRm8zTaDOTsP/7q4SGhv
	B57EqCph0MYvWexFFNRfchLIlZ96gXgU0x4NhXw==
X-Google-Smtp-Source: AGHT+IHXFskhQBCYX0ZjV07+Eg01r4LfoVVUIYLqmdjQDu/b1QYB54OHk+PP1qlUIzJDtcxzfd0mGHMC4CwKQSXt8zw=
X-Received: by 2002:a5b:a01:0:b0:dc2:1dd0:1d1b with SMTP id
 k1-20020a5b0a01000000b00dc21dd01d1bmr6664631ybq.19.1709583689256; Mon, 04 Mar
 2024 12:21:29 -0800 (PST)
MIME-Version: 1.0
References: <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
 <871q8wk7o3.fsf@kernel.org> <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr>
 <87wmqoilzf.fsf@kernel.org> <20240229-ageless-primal-7a0544420949@spud>
 <68a49964-7c05-4575-a4f3-35848c08fefc@freebox.fr> <20240304-component-animator-e2ee0ab7574a@spud>
 <CAA8EJpq5HQaO2E2Pd7yqUTsWyQ_pLDdyoWng8QmWTzYn5fv3PQ@mail.gmail.com>
 <20240304-superior-vicinity-3dc6ca88141a@spud> <CAA8EJprMG=fY-G-X03bm7MMhcua9axjw5ULZz0efgHxwzgrdVg@mail.gmail.com>
 <20240304-privacy-registrar-93c48ab1b9c5@spud>
In-Reply-To: <20240304-privacy-registrar-93c48ab1b9c5@spud>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 22:21:17 +0200
Message-ID: <CAA8EJppoc9Mu7s8bzXjW_NJDQ5go2+MvoFG_JCnwP-6hC1SRow@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240304_122131_267200_F79CDAEB 
X-CRM114-Status: GOOD (  23.49  )
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

On Mon, 4 Mar 2024 at 22:17, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Mar 04, 2024 at 09:59:13PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 4 Mar 2024 at 21:46, Conor Dooley <conor@kernel.org> wrote:
> > > On Mon, Mar 04, 2024 at 09:37:00PM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, 4 Mar 2024 at 21:34, Conor Dooley <conor@kernel.org> wrote:
> > > > > On Mon, Mar 04, 2024 at 05:21:37PM +0100, Marc Gonzalez wrote:
>
> > > > > > Thus, anyone porting an msm8998 board to mainline would automatically
> > > > > > get the work-around, without having to hunt down the feature bit,
> > > > > > and tweak the FW files.
> > > > >
> > > > > How come the root node comes into this, don't you have a soc-specific
> > > > > compatible for the integration on this SoC?
> > > >
> > > > No. Ath10k uses WiFi SoC as an SoC designator rather than the main SoC.
> > >
> > > Suitability of either fix aside, can you explain this to me? Is the "WiFi
> > > SoC" accessible from the "main SoC" at a regular MMIO address? The
> > > "ath10k" compatible says it is SDIO-based & the other two compatibles
> > > seem to be MMIO.
> >
> > Yes, this is correct. MSM8996 uses PCI to access WiFi chip, MSM8998 uses MMIO.
>
> Thanks.
>
> A SoC-specific compatible sounds like it would be suitable in that case
> then, to deal with integration quirks for that specific SoC? I usually
> leave the ins and outs of these qcom SoCs to Krzysztof, but I can't help
> but wanna know what the justification is here for not using one.

We can probably start with "historically established" here. From the
hardware point of view msm8998, sdm845 and several other chipsets use
a variant of the same wcn3990 WiFi+BT chip. The actual issue is in the
DSP firmware, so it can be handled via the firmware-related means.

On the other hand, I see qcom,snoc-host-cap-8bit-quirk property, so
one can use DT properties to describe the issue.

-- 
With best wishes
Dmitry


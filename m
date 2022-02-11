Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498A6C433F5
	for <ath10k@archiver.kernel.org>; Fri, 11 Feb 2022 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxrSvkswJaFE7Za4Q/utNnbNJqEPgz3C0Sp6mSLLDRI=; b=2o7ZqcAs/VEtQH
	6b67Zfudb/HPVtZ/0125ZH5tUbC5BGXJvYKa3uJQTRPMsUuwI1pHkFblEp07PV1DFaG9iDcFJILTx
	2Ypgy7V1fCZm3yYBuwNocZ37yOw7j43FFGKkar/q1HoKv1k0jvpuaomNte/WhPmBhK+bXe8s2KxaR
	DuhYitG39bjsQEVnZkClFbdb8NZ+s3sYrzc5hVFSmEEa4iisc/cjS4vF4GSB1wjnFRa+Q3Dxj+obt
	BiggripbGMpkWIFTmJWafx51LfAlVp8XbTIo+uELxyIWOtvzqhU890gB3f4mdYzTL3Sb1IHgQGXb6
	SJVKa4uPXCfGwitxzYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIZHa-0089fo-Fi; Fri, 11 Feb 2022 17:00:30 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIZHY-0089ej-FZ
 for ath10k@lists.infradead.org; Fri, 11 Feb 2022 17:00:29 +0000
Received: by mail-qt1-x82b.google.com with SMTP id s1so9551534qtw.9
 for <ath10k@lists.infradead.org>; Fri, 11 Feb 2022 09:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UHdwTc8HbwiS1eXfTfbmUklSTOU037OQVrZg+11HvEE=;
 b=bjrhXYFpC0v+pxgvnIyAjejICFsiHEe/pHsBEEtrY5Up+7gJsF7aR9MRpcH3OE+13M
 GRHTwxdro5wu8y8PDpFqDpQP/NldLtCmlgMxyASp7SB/eE4AJ3qsABy5ADA8ehSn+RBw
 xcqTRnJ+Nt/5j678eoYZfjKrjTrbUwKUaapgHiJsm6XNaQs0okH+J92JxJ6m+iQWHtF3
 bPS+dapLepOtN9bRNjrW2r5XX9TXXEHACnoDXeyygkhh6aDNO9puXvy5x+UpzzpOrERb
 7P6KBpZltzIAHTeZqkl3/5tmMruR/9+LjwacSE5v6aqHNcPKYZW7UPesnolKJq57nL38
 3v3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UHdwTc8HbwiS1eXfTfbmUklSTOU037OQVrZg+11HvEE=;
 b=XcF9a8x8DotNfJgz+5zz1RtDgtfiQToV0Lcr31H5UWhupgJdx+fhDia3w05vRJe899
 nlBe8gEeWkkDNjJsTR9R+kxfDyQ/X+kOsTueMUmx3ROKg54YzDaqpGWPloqDDjWcPvzA
 MtuzSH3LHKxwW6Y+yaKZ/BEVVM+6cW4/jRGnscbXJ+Qcs1hmt5ulN22CmlecoWoZb/ei
 OnGtbCL226H2NLOJU37kZMknLOISv77AmDanuYPSr/HNoNrYqsQ81qzZSlyciiUSNNGn
 V2QJlLRRbPQV7OYjANR0m7bIkKum+rREoGcaH5xR8qCxv8OEKoVgsBFOEw7O/fYvete8
 h8yQ==
X-Gm-Message-State: AOAM532ySZMHUj/+6+OP+qqIBcNsWvO2fp1oiGhpEr+9z+G5mebDASzZ
 Su+l978UDlVcTnxWx4ouyVA99imoB1HPtleuPYRLRwvb
X-Google-Smtp-Source: ABdhPJxLEbGRvbeoMwfVnqM7+0sJU3duWrYsi1i/Q08Sn6V0lEVTY6ufLUWr+hB18zEpFqwlIF4mW9bfsOmhLtOGmsw=
X-Received: by 2002:a05:622a:407:: with SMTP id
 n7mr1795048qtx.600.1644598827020; 
 Fri, 11 Feb 2022 09:00:27 -0800 (PST)
MIME-Version: 1.0
References: <CAKBt_AeMSV8Z98bZh3saK8G61e9m8JNXZrLmNT2oJsvAHJNTZg@mail.gmail.com>
 <e2adadf1ff5d26eddd657c3b5e6f5d547bd0270a.camel@freebox.fr>
 <CAKBt_AdkDqj+wocWM3CSNA7Fh1DRYEHz-vJCGQpR6woY2WAH7w@mail.gmail.com>
 <5b1bc5867346e67a746d87c099b0826c0169a84f.camel@freebox.fr>
In-Reply-To: <5b1bc5867346e67a746d87c099b0826c0169a84f.camel@freebox.fr>
From: Guilherme Weidle <guileweidle@gmail.com>
Date: Fri, 11 Feb 2022 14:00:16 -0300
Message-ID: <CAKBt_Acz8=UG_4AeoPCQ4ed5fc4JjHfou9RF8MsgSSf1qW0wQA@mail.gmail.com>
Subject: Re: push-pull stalls (QCA 9888)
To: mbizon@freebox.fr
Cc: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_090028_545367_F8940A70 
X-CRM114-Status: GOOD (  12.88  )
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

On Fri, Feb 11, 2022 at 1:03 PM Maxime Bizon <mbizon@freebox.fr> wrote:
>
>
> On Fri, 2022-02-11 at 11:51 -0300, Guilherme Weidle wrote:
>
> >
> > The kernel I'm using here (v4.4.60) does not have this patch. I
> > believe this issue has been around for a long time now and is still
> > there...
>
> Sorry I thought you would have it since you use backport, but you run a
> version that predates this patch
>
> --
> Maxime

That's alright. Thanks anyway!

Let's see if anyone has another clue about this issue.

BTW: Did you fix your problem by removing that patch?

--
Guilherme Weidle

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

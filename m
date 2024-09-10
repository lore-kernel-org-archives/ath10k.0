Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3875ECE564
	for <ath10k@archiver.kernel.org>; Tue, 10 Sep 2024 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3cVdTlyiLbROx6VtFK10wvApSZ87I0tXOB74QiLmi4=; b=42FKHDowiQuovJUuh84QEL2lun
	CTf+XInJu3B3W3ttaIcwBB2mE4hHKXgfxvSeh6gGV/j3nVI5rDc/imYeVpC+spoI4pt7SCEBuqmaN
	DJ+X+969h9kn3z2ZPkn+eM7/jLyYRFIv+kov2fvd9z3LHcq+zjHWmdohLizLmw+VpB/JeTJhQwY/C
	SiEkOMFGPwWuuQDl3Foc+sIeRUNCfch//uHya8GYUkFz6t2jDkg5FATUUvixvCckJp4RqoUJt+GHV
	ZuKl2FFKN5i6HxLP9fA2vXWrLDc8yfrj2wRXRv0ZuvrKxewnS/46Bq3d3waDnBRBX9e2S59EMMGv9
	7vf2Dfjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzKk-00000005Qoa-2eCb;
	Tue, 10 Sep 2024 11:46:58 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzKh-00000005QmH-1ftw
	for ath10k@lists.infradead.org;
	Tue, 10 Sep 2024 11:46:57 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3365454a12.0
        for <ath10k@lists.infradead.org>; Tue, 10 Sep 2024 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1725968814; x=1726573614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3cVdTlyiLbROx6VtFK10wvApSZ87I0tXOB74QiLmi4=;
        b=GpeAFRDqa8afjRrHbLA6CXP7NN0OM/b89T4HlTzlx39MdfwYteLo0vzsrQIqayuqEH
         Z7YUisl/mPTpKWBVJBs9uSNsVlj5o3ropb0T69xhn7+VC0WqODGUNpv0mdP7tKJoe0Ud
         j7AZVgdLymfFn3sRkjc+GlaJNv0myT69HHJUf3ePNhU2H2TmJjioyiZJbK6h4wuRxaui
         ufDMLHnEd9HMHu41A/58cJItwqgwwYkdVbTTqEoR6tJQsnoUabErcJss/b6RygxQacYd
         fvUrrKzNiFXaoeyQ5GW8ej6R3oAXnhlt3UkCa2TlDsfkxNTgAFBEEIV93AJpKM8HyIGf
         n6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725968814; x=1726573614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3cVdTlyiLbROx6VtFK10wvApSZ87I0tXOB74QiLmi4=;
        b=SyN7YjZIMwcc8m7ZxAQUoyo/NXmBlIkJaWBUc0OPAhuWAI2fOW0mdTmAKWnP6sOeW1
         WfVbVzzpGkYovOfUodgw+MmzBDepWaoz8ZnldeDJoyl6xDhzEu665yrw1wo4jr8gtOP+
         AMR99baGlvDVhkd24knQgATpjY94d1g96vJ/k9NYM+V+URE5fMlehznLgi2O8MBpW30I
         nsQqiEYxGEfMM9Jeq2iJ/KDV0BWJHrPQ6GTlvKUDbhUUcupWLvYmY7rxSdG4QBTgoiRN
         GD3NelkBMXOYj1BB5/uMfbqHdV8hnnAmag9AOlaSCSJ/qPvpM7YwBZ7qEbPAktL3YbEi
         TLOg==
X-Forwarded-Encrypted: i=1; AJvYcCVD306q4b2cQsOTTsrIPMUGOWOqYdxxk/orsNUhHuwUZIGhZmpC/jJeQBic0Nta+qXF85hzoQk=@lists.infradead.org
X-Gm-Message-State: AOJu0YytfPOAg9IR2OvwsHFQbNOZwKhnX2SVCab0tGfTNv1XOyzBJ1+A
	74jonLFWDVlvBd678y1yXMiC+DgUTkpiEre0ydJ9ZGv/A3Mt65WzvFvA9EdC3vl/aK8Tflq16vU
	4N9vFE29FPTJDd1JWd8cgMPnuFtcLzjdUXNcCgQ==
X-Google-Smtp-Source: AGHT+IFWMlF1n0oib92jKUMP9migRt2KT8rXo9OZgHZh3G/xI2ifvrcMjWGowcMeFpb/4QlwzzC/qdpkQMcerpb58U0=
X-Received: by 2002:a05:6300:4043:b0:1cc:de9b:1ca with SMTP id
 adf61e73a8af0-1cf5e11fcd8mr724101637.30.1725968813821; Tue, 10 Sep 2024
 04:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
 <3772134.MHq7AAxBmi@ripper> <87h6ang8v3.fsf@kernel.org> <2248097.72vocr9iq0@ripper>
In-Reply-To: <2248097.72vocr9iq0@ripper>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 10 Sep 2024 13:46:42 +0200
Message-ID: <CA+HBbNEOSMFWiRYxQwaH2DMEYuvccCG+Prt3R7dE2acfqpYJZA@mail.gmail.com>
Subject: Re: New staging repos for ath1*k firmware
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	ath10k <ath10k@lists.infradead.org>, ath12k <ath12k@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_044655_447085_519D6BA3 
X-CRM114-Status: GOOD (  19.51  )
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

On Tue, Sep 10, 2024 at 1:39=E2=80=AFPM Sven Eckelmann <sven@narfation.org>=
 wrote:
>
> On Tuesday, 10 September 2024 11:23:44 CEST Kalle Valo wrote:
> > As there are so many different branches I have lost track, do you have =
a
> > list of missing firmware updates? We could try to push for updates on
> > our own end as well.
>
> Afaik, ath10k is missing various security updates - but I don't know the
> firmware version which has these security updates.
>
> ath11k is missing the 2.9.0.1 release - which seems to be still required =
to
> get various APs working correctly (without a crash). Maybe Robert Marko h=
as
> the newest firmware version (not the file - the version) somewhere.

Hi Sven,
I have actually found WLAN.HK.2.12-01368-QCAHKSWPL_SILICONZ-1 v1 ath11k FW =
for
IPQ8074, IPQ6018 and QCN9074 online and after looking into it, that is
actually the latest version
from QSDK 12.5.

Multiple people have contacted me since the FW spread our various
communities stating that
they have tested it out on IPQ6018 and unlike the current public FW
versions we have available
and use in OpenWrt it works stable.

So, it would help to see the new FW for IPQ6018 especially as it is
quite unstable with the current
public FW that we have to use in OpenWrt.

Regards,
Robert
>
> Afaik, there are even newer ath11k versions - for example for IPQ9574 (wh=
ich
> is completely missing at the moment in the repositories).
>
> For the completely missing ones, I've submitted following list to QCA:
>
> * ath11k/IPQ5018_QCN6122 (that might be rather complicated due to the way=
 how
>   QCA designed this)
> * ath11k/IPQ5018_QCN6122_QCN6122 (that might be rather complicated due to=
 the
>   way how QCA designed this)
> * ath11k/IPQ9574
> * ath12k/IPQ5322
> * ath12k/IPQ5322_QCN6432_QCN6432 (sounds a little bit like the QCN6122
>   situation)
> * ath12k/QCN9274
>
> Kind regards,
>         Sven



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr


Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609C8C25B75
	for <ath10k@archiver.kernel.org>; Wed, 15 May 2024 04:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjAHKpbAbC8fH73KCgh7NQ/biqRfLcHvH5C44oBVTHQ=; b=n9SW7tF2aAZgzeT7O6M3yrprlm
	02v6v8hNsEwMDl8oGbPXBWSR/32wLbF/7wwOoS7zAinfhDF77cX+5OpGZBbUHW0SJVnFPaIFK0RHx
	r5nKyOleABmK+ZdWQ4xc+QM6lpOqFP4DlBvRrHjYCmoKYzcPVEIJF2kE0RfHYlUhfN6NRWPDKnz7f
	Ot3sfZ9qMbQJgjZhoZOoPdlb0I54u7ZUy/CgF7cle13q96poqPlWqRmhf6q1VxTLqHcw5POXQkz24
	ZZRXJXzMHez6E0ipIQtsAwTNaHKOHnXGV8wdBobwFVgd074iI99VSKTkpD9dOP4Pgi6FZWxtYWUQG
	ktwiR2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s75zO-00000000Oqk-3s9i;
	Wed, 15 May 2024 04:11:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s75zL-00000000Oq4-2UEW
	for ath10k@lists.infradead.org;
	Wed, 15 May 2024 04:11:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D8426CE1394
	for <ath10k@lists.infradead.org>; Wed, 15 May 2024 04:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FF6C4AF09
	for <ath10k@lists.infradead.org>; Wed, 15 May 2024 04:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715746292;
	bh=DGpteUQnXnqvaSKjiFXXMNv3ukrcO+rgBe/rtRI4AB4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c6nOp28h9UgCQ/9V/gB8GZ8CcNsIglcFQOG8kkRMYXqyKEIb63q1EY+hCULiwhNAm
	 3pr8Vpxmwod7wKy74JwGyBc0T8RzAXaChIYleyrjRNtxUAUuX/DLrjeI0rEhizMm3n
	 K9SP7SbX1+9ZEDq428fypjpG5ewFFjHgv96G8zBIxj9GyVygBdITs/kwqLO528jrJD
	 PLPW3CcjvQhZxlPKAMJrHSXo2mpDheT7frOp+1EHBQQIyY2RCfVl4R88P1uewxBdl8
	 7Qt2FDobkvpW4A53Ql7nc4rHYmSAWBfTQ/LjQYDPrIgc4XhH26xp8vGzeNHCvRHcnE
	 CTy7b7WNYM1MA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51f99f9e0faso7277871e87.2
        for <ath10k@lists.infradead.org>; Tue, 14 May 2024 21:11:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0HCK/wr5hQU3tQD7fCkvCagjWxEdaDRFEi2vunz+NweGdrXnea06Fx4XAR8udzsV/RUQSNSoj6P4msdJr4XBy4IhV1d34XmDEMg==
X-Gm-Message-State: AOJu0Yyd3gMIq1IimtH1zbVOiVXHu3SUN9NFWBEXOMCAbxVNbNTBbzAs
	AzPEJlzxUT0EEmcoyNye7YICRUy6D8N384QVYs2udAn+OdHs6SGNJirE4ab8aIvFpKEikYXw2q2
	JCNwHplCYLYcmDpThtT6M4YEWHR8=
X-Google-Smtp-Source: AGHT+IGf9KkaZ1XrLk3QFuoMxHqz0TLUmdPdwogXPls6TDspk0lP3qpJ++Cgv3dhmSh/1dfrghgI7eC7j7ZRMW6xKWM=
X-Received: by 2002:a05:6512:1304:b0:51c:5171:bbed with SMTP id
 2adb3069b0e04-5221006e625mr12124467e87.15.1715746290716; Tue, 14 May 2024
 21:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240511-ath10k-snoc-dep-v1-1-9666e3af5c27@linaro.org>
 <12a208d7-f36b-4953-abff-323a15452b3c@quicinc.com> <CAK7LNASyBNbxm-e+iZ=7pOJg-a-Zm84O6RNcqiUjZQH7f9r3Lw@mail.gmail.com>
 <e5edd92e-ab47-4a55-9276-5a7d160fd399@quicinc.com>
In-Reply-To: <e5edd92e-ab47-4a55-9276-5a7d160fd399@quicinc.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 15 May 2024 13:10:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ11Pt85_T9kvYYbqfnjMSH_Yjwvz52E+Tcmw8jS-wvDw@mail.gmail.com>
Message-ID: <CAK7LNAQ11Pt85_T9kvYYbqfnjMSH_Yjwvz52E+Tcmw8jS-wvDw@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: fix QCOM_RPROC_COMMON dependency
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Rakesh Pillai <quic_pillair@quicinc.com>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_211136_018612_6AC2EF06 
X-CRM114-Status: GOOD (  24.28  )
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

On Wed, May 15, 2024 at 3:14=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> On 5/14/2024 10:45 AM, Masahiro Yamada wrote:
> > On Tue, May 14, 2024 at 11:43=E2=80=AFPM Jeff Johnson <quic_jjohnson@qu=
icinc.com> wrote:
> >>
> >> On 5/11/2024 3:49 AM, Dmitry Baryshkov wrote:
> >>> If ath10k_snoc is built-in, while Qualcomm remoteprocs are built as
> >>> modules, compilation fails with:
> >>>
> >>> /usr/bin/aarch64-linux-gnu-ld: drivers/net/wireless/ath/ath10k/snoc.o=
: in function `ath10k_modem_init':
> >>> drivers/net/wireless/ath/ath10k/snoc.c:1534: undefined reference to `=
qcom_register_ssr_notifier'
> >>> /usr/bin/aarch64-linux-gnu-ld: drivers/net/wireless/ath/ath10k/snoc.o=
: in function `ath10k_modem_deinit':
> >>> drivers/net/wireless/ath/ath10k/snoc.c:1551: undefined reference to `=
qcom_unregister_ssr_notifier'
> >>>
> >>> Add corresponding dependency to ATH10K_SNOC Kconfig entry so that it'=
s
> >>> built as module if QCOM_RPROC_COMMON is built as module too.
> >>>
> >>> Fixes: 747ff7d3d742 ("ath10k: Don't always treat modem stop events as=
 crashes")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>  drivers/net/wireless/ath/ath10k/Kconfig | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wi=
reless/ath/ath10k/Kconfig
> >>> index e6ea884cafc1..4f385f4a8cef 100644
> >>> --- a/drivers/net/wireless/ath/ath10k/Kconfig
> >>> +++ b/drivers/net/wireless/ath/ath10k/Kconfig
> >>> @@ -45,6 +45,7 @@ config ATH10K_SNOC
> >>>       depends on ATH10K
> >>>       depends on ARCH_QCOM || COMPILE_TEST
> >>>       depends on QCOM_SMEM
> >>> +     depends on QCOM_RPROC_COMMON || QCOM_RPROC_COMMON=3Dn
> >>>       select QCOM_SCM
> >>>       select QCOM_QMI_HELPERS
> >>>       help
> >>>
> >>> ---
> >>> base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
> >>> change-id: 20240511-ath10k-snoc-dep-862a9da2e6bb
> >>
> >> I see how this fixes the problem, but this doesn't seem like an ideal
> >> solution. The fact that the *_ssr_notifier() functions are correctly p=
rotected
> >> by conditional compilation ideally should mean that clients don't need=
 to call
> >> call out this as a dependency. Otherwise, it would mean we'd need to d=
o this
> >> for all feature flags.
> >
> >
> > It depends on if qcom_common.c is optional for ath10k_snoc.
> >
> > If it is optional, this patch is correct.
>
> At least from a build perspective it is optional



You need to make a decision from a run-time perspective
(that is, whether you are fine with having
ar_snoc->notifier =3D=3D NULL)


If you are able to build the kernel successfully
but you get a run-time error (e.g. NULL pointer dereference),
it is even worse because run-time debugging is generally more
difficult than compile-time debugging.




--=20
Best Regards
Masahiro Yamada


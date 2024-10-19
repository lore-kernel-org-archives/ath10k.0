Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB93D3C919
	for <ath10k@archiver.kernel.org>; Sat, 19 Oct 2024 15:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMbXRc4YDc45MT1d2qKMPKKlX3fx86b90pw720KiDfI=; b=PxDMHohmA48wE7+7SUuVgnOF5g
	nTAZ2PkThwugSQ4fzR+v9FjrVI7/t1VKelX2eV2dPVF4R/WkD3fCYzbZGvsANMCw9wee1vRVElSsh
	xME9V9cjnYcQ1HwnPzkdjAdHQwAQALBsmxyV2vbgeeq2i5gX8py6Rjn4ZrkO61YRgzUlXRliRnC1k
	AxShcDc8GBV+aPV2IqEdiWmdW+WXnzMoAOynYFGHXxCwDtTwAb0DNFdYW+Hpqc4sKaPNTUj/BbjTi
	m+lebE1+mDYfQB3U1cIP4J3toyyj2zZnY2Q+DFDYZq/tVf7F0o4y8UTUHvJ4jJu1ZKssgWyD0uYY2
	d9nyqNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2BRK-00000003Vxe-2VQq;
	Sat, 19 Oct 2024 15:32:26 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2BRH-00000003VxA-2zRL
	for ath10k@lists.infradead.org;
	Sat, 19 Oct 2024 15:32:25 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e681bc315so2042232b3a.0
        for <ath10k@lists.infradead.org>; Sat, 19 Oct 2024 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729351942; x=1729956742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMbXRc4YDc45MT1d2qKMPKKlX3fx86b90pw720KiDfI=;
        b=Pg5wBoNOr78jenuiOj6DfXpohpFgIjhdvLqxHTV56I2+pcYJH2VsqUHmwu4fo7BG+b
         LgH3g3ojZnKlNG5+DUlZvqvKu8VjHCBJEytcsoQlVUMNbkLj9DCVp+rb+Ua/ADtoNfKu
         9ckw2swn3CGwuWXaoOOlNN5SPIiJXLI4fD91K0vXqNjxw3255QYepu+C4ehi+6iqLR/v
         Ve7vchyCK/5xKUnmA1vthxV2YnHlT4kYLqUwb8QAe0S34FwnvbWM+OBP4P58qZDIwMRi
         apq1Khhe4JXFfYR4s94koapsQ72u1+DRprJauP7sEaPGS4KKjSid5PffTDpoBZDWwD0p
         HD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729351942; x=1729956742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMbXRc4YDc45MT1d2qKMPKKlX3fx86b90pw720KiDfI=;
        b=ueknYx5EDFtoQYhU+0oFwdz88pOch2ftwhbEXYawOk4tQtM7zjIVGA1F4Dbe+NLE66
         RxNZOv0CMAk6fTqiYRaVI/P2UhbTVDHmCatzaWdjBRYMEZXabEfG0p5jnpl196ls3P4X
         sGkwj7w0WW2ZQHIhO9Ef9VXc/4s2yQ8LkU5H2tVGN6PFz1CHXVaQP1io1atyeL4Kj/+6
         B3KksZj73ETI/n+jmu/6eZfC9rfLFeqySabSoXpborJL+pKf98L6cc4nhbEdVhbqlHgY
         zRP+YZ4juqWtKL0/2W0WOhm26uk1hNXIK3nf5zJyiv6bAyYoB/9NzZjYILPgFdFjsxvo
         kG3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCjk44ja67CaB2AqAdetg8Ph9A4euSMhF3sejUFehPEqxNxUZNm06fZLSLGIkg0nQGMwRzoRg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu9gnl/EvI+s0gln9+UZhH+OyE7H5SxZQJmzP1l1UHvqWdZL36
	S76mTi87B1+p6q0hRDt07hIEteY6LliYcn2e/+VmaxZJgtWucsXRskVoO47Adbw3zqNnc7X/kxD
	7aHGsf053ka9j46Z3SMR8KKWufA==
X-Google-Smtp-Source: AGHT+IFJna+hBKXImW8Ukhf2hjuSYeoPJcv9SN4RAswAP5PzwhWWEEM29I8Tn+A3FSx/U4+sO1kd59bFe5ksAV0udi4=
X-Received: by 2002:a05:6a00:2da2:b0:71e:6a99:4732 with SMTP id
 d2e1a72fcca58-71ea4255c3emr7246225b3a.11.1729351942310; Sat, 19 Oct 2024
 08:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240801202359.794035-1-frut3k7@gmail.com> <20241009065051.51143-1-frut3k7@gmail.com>
 <b58b5b2e-bf9f-480c-810b-2cef29aab82c@quicinc.com> <CAKEyCaDUfn4jtCdTt9JJ-Qe+CCudORPwcjj5i5=G28ANc+eCRg@mail.gmail.com>
 <87ed4dr5pj.fsf@kernel.org>
In-Reply-To: <87ed4dr5pj.fsf@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Owoc?= <frut3k7@gmail.com>
Date: Sat, 19 Oct 2024 17:32:10 +0200
Message-ID: <CAKEyCaD-1GO1NL-=1E92BE9=XKa2PymOAY14vMmtwYGLsPjeUg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: add channel 177 for 5 GHz band
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_083223_770817_8307BA53 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 18, 2024 at 1:49=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> I wonder how this works with QCA6174, unfortunately I'm not able to test
> that.
>
I only tested on QCA988X, QCA9984 and IPQ4019 as clients.
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches


Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C481BC83F13
	for <ath10k@archiver.kernel.org>; Sat, 26 Aug 2023 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyqC4SgTLi6PRuFyQsF3oSnor6OGas09M9DgDczP2po=; b=G2D52JGZyceNcB
	MTPJf91hBlHQKNNP2/TLj7+Zc7Ncp7VE0DoA12A6tUqABerObfPkzF8NpfQOuzCpte6fgLgTHENk3
	AMSBIlZ56wMB0qv08ogqy9PGQWIaoYUv8K0VwtjwlFE28u0hcD7c+QZSlAVztbGdPHBuQnKEcgzaq
	il4oZkVYL8za0QnV0d/4BHdVAIMHY0AQFaugumytKYxRrm7UyW8zfn4fDjaRD8lzlkwteaXcZgVZ0
	wp+wjUHOsOJsm/WwBvopRhIT3Mko+oQZH4ysqEl2QmD+/Fkdg0F8K+fX/bTJdk14BmjGnsmPPnEmZ
	GGuyyTWZ6GOfRTsqYRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZtme-006xj6-3D;
	Sat, 26 Aug 2023 13:57:00 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZtmb-006xid-1U
	for ath10k@lists.infradead.org;
	Sat, 26 Aug 2023 13:56:59 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d743a5fe05aso1759137276.2
        for <ath10k@lists.infradead.org>; Sat, 26 Aug 2023 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693058214; x=1693663014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UIk3Ss+Jl+QQzMUaKkMUyViIyvPKScuq86cEEqHGusE=;
        b=pF6IfdIC2LkR3KDGmGGrGxTW1+eUnx4ikbUOn77tIRl0qFZABWvzSIAIqLJjGMIwxN
         BUTpJublL9H0IFm9wgfzF4U52AfgcNtUxJmoZlXOJWiUmPafyUK2tbo67hWCV5hooi0w
         jwBRETfr0m41OiX4/BXQm48GxIiBl/HbnnSXWA8BgfNk5YIm80jQbJRGu7uFwo/RZ8MM
         e4m7Rua64LJUjX5M6y21ENxPbi0P60T99PYACJYcIf9ouKTY/9O+jtEOz5ZAsZGNGK2d
         ebU+Dz5MQU9R2k8RVvFYknOyXL1tI/XRo8IqLrm7DHp79gRwD/u3GuvPD/pZZCfWAUrq
         0P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693058214; x=1693663014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIk3Ss+Jl+QQzMUaKkMUyViIyvPKScuq86cEEqHGusE=;
        b=Bo74kUAo6rCyt3dDQW9Duuis8bwS23WPeHGkIIwlidGAqV7A3w3gBeWmlhV5YR7L5y
         IpcuhKps4b2Oc6WvKiGsC72ZYRGwMvFDgDUflUdZ4w1F4pZHK0vAbgOCTnNLN3hhGYpO
         /8KI2dGyExEQdnbn7Qydfy6d/pUMTbYgEjClwSxIsZAqutTuDUmhrlb6f+KGuY3Iqtnx
         yckEFFCrC6kP5AikdFH3HSa9l69EOUgomgh5HbTFSFIADyu9x0+gbc+Z1jPK0rq1IQH3
         ocpfho9fDTVft3kn3uXJsnlkmh0QFnjRf1e7+pEJyVwtn9i/fc3kOg2FVAnfroxdd8xL
         marg==
X-Gm-Message-State: AOJu0YzVKWwUEyJ0oQ0qtNcC7hgkdpbcOPESMMaddKsYMogsZgQqe04I
	7QO+up+WON0VCjnNu4p3R1r5DDO7EbP8tirzeXh39Q==
X-Google-Smtp-Source: AGHT+IG47fSKGFN3TIP1Ic8FLulbn7bmOtvFuvS8F3UvcPCC212ktImUAKfUM5AqVL2axxJ7JyvAM+CJK5JQB7eErVc=
X-Received: by 2002:a25:c5c6:0:b0:d7a:def7:b96a with SMTP id
 v189-20020a25c5c6000000b00d7adef7b96amr493222ybe.53.1693058214578; Sat, 26
 Aug 2023 06:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230825202610.1580132-1-dmitry.baryshkov@linaro.org> <87pm3afjda.fsf@kernel.org>
In-Reply-To: <87pm3afjda.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Aug 2023 16:56:43 +0300
Message-ID: <CAA8EJprZvCtCKoV4J=21=2+fDM1gTfJBOThj13J3sE0w5AqpPw@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: Default to board.bin for legacy board data file
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_065657_520110_BCCD5498 
X-CRM114-Status: GOOD (  12.90  )
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

On Sat, 26 Aug 2023 at 08:44, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > Default to 'board.bin' for the legacy board data file, in case the
> > hw_params array doesn't list hw-specific board data file name (e.g. for
> > WCN3990).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Could you provide more background _why_ this is needed. What are you
> trying to fix?

Sure. For wcn3990 we do not have the
`ath10k_hw_params_list[].fw.board' set. So if the board data is not
present in `board-2.bin', the driver will skip looking into
`board.bin' and will error out.

I had two options: either to set the `.fw.board' in
`ath10k_hw_params_list', or to provide this default. Granted that the
check for `fw.board' also prevents the `board-%s-%s.bin' lookup, I
opted for the second option.

Maybe I should just set the .fw.board to "board.bin" and
.fw.board_size to 26328 (?)

-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

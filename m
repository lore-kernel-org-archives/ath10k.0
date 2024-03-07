Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F1EC48BF6
	for <ath10k@archiver.kernel.org>; Thu,  7 Mar 2024 08:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTCDlQMgEr5UEnpV5mDn3dJxhyjjt0R5yPNztDHuRWA=; b=Q5ThwT84PdKaf4CIMfXV65DrLB
	ojQIQ6BERo40ZGZf0uK6MPCYmaVTov4zkdR5tj0OfOfY5mJsFwUzWqRsOFzyfwJr+lpuYAoI+N/yX
	whcM0/2FVO6ItFpoAJJrgrO3HWWa7jdL4Gk4gyyZ9hlMqNyv9udk6+k4gr3+ls+VsJNyb3GcdG5ZP
	iY+kjUoBCX7ofRhP+0gy7os4qkSdK/1KwehLOJOmSZPA8ZJMpREKf6vWRjTIH5KVvx/R9XMXj6hyl
	BtyHmq6DiG2iXyQZUC6yRjXP8ZCP+DtKahp5J9quwZlPjEUIuyJXQznOhPJ8yejcqXV9jI4H0HnhJ
	PH5kAu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri91w-00000003bc5-3UTm;
	Thu, 07 Mar 2024 08:23:08 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri91u-00000003baw-1Lxe
	for ath10k@lists.infradead.org;
	Thu, 07 Mar 2024 08:23:08 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-609ed7ca444so5186017b3.1
        for <ath10k@lists.infradead.org>; Thu, 07 Mar 2024 00:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709799784; x=1710404584; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BTCDlQMgEr5UEnpV5mDn3dJxhyjjt0R5yPNztDHuRWA=;
        b=t/S5uEacD6yNZgg9M431LLCtxH0EL8tHYJRhj2VHTeMOTSFOuuzRx5K8H3j5YKzt0K
         +ED4cl+cvputIgClT6OrYSRYlW/aJWLpXGLdsxTFQp9HqGQVVoBO+qkYHTDBL0l4aJwF
         lsB/9Zqnwg4qse8CzDtT7d9cTkGu5l+sXeBYw62o62F/pepX+4N3RR/PXCLlFO6JHimg
         Uf1wUDN8SJwSN2zekFbI+CFbnWVHaPTRufbYZwCU4XcOFL5G0erRbQAohIfxU+2+IoBT
         IG5Tu2GZHb5CtQwPVdStYPkn98eliQkHU2vPo2xCp34QVP0xzmhPA+EOkep91cW6GZVW
         Lwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709799784; x=1710404584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTCDlQMgEr5UEnpV5mDn3dJxhyjjt0R5yPNztDHuRWA=;
        b=mBlPj+SiCl40ygSQqXhUayy9onVnVCjryP+H0IldblSGdhceyN5ue5WfpkQt/XGU5s
         O4q/fGwTOOePfaSDT6wmbl6va4Etg1CVTN65ilwD/ac4LpHMqoOCG8hee8IuAoIbXNeq
         xwR8qo0q8IdbrWa61dQwZxhKW3s3j38rujvKy20pVErir6macP0a2VVBfHXsjClG14PZ
         uJCNaFA5ytsug/1Uij1mU/IuSQuKmHBnT/qw3c77l/z0xse253ekbg0d5/a4MgaAxEAl
         2o+OZVrFFc5aZnwnany0eK8RTZqvfKDcA+NC48A2EUxfIWUcNGunjoQGmYso6MlEouZE
         MV6g==
X-Forwarded-Encrypted: i=1; AJvYcCUWQj/obaJQnCer27PDMynWZ0SGze/QmxPTad4jZBpQBPncPM0EwB0uqodmmDwybKnIP6ea/FkwL9ENDtwmFwAgfq7PtmhzrpZHxw==
X-Gm-Message-State: AOJu0YwXqKvOKImNW+v6B+Hb0zBY7vq5Rjsg+HPcml0uVAIqHt0ix4Yy
	A51KANTq1YwZfxGkiSMu3V4xwTRJm8OJEpIAhRSyLJHdEV7Av7LyaJ9XvEkpEDIPXejppYTfb5C
	3wdsnAyW33gWJwjGp7hNqs6nNFNG96BSj3iM3Fg==
X-Google-Smtp-Source: AGHT+IGtlINLMOBpnSyCH2ZmpwWY+N46YIj+jpgvXOKi2Jcaj1+sVPOFaJ/lVWVfwLTv+DvW59tvQrS42RXoxx6CtmY=
X-Received: by 2002:a0d:d882:0:b0:607:834f:b4c4 with SMTP id
 a124-20020a0dd882000000b00607834fb4c4mr1560071ywe.29.1709799784322; Thu, 07
 Mar 2024 00:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
 <87plw7hgt4.fsf@kernel.org> <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
 <87cys7hard.fsf@kernel.org> <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
 <baa7a017-ee4b-4e8f-9bb8-1e3857e18855@quicinc.com>
In-Reply-To: <baa7a017-ee4b-4e8f-9bb8-1e3857e18855@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 10:22:53 +0200
Message-ID: <CAA8EJpq780+=b-XEShsS4ixtpOJxwigvR-E0nPJ1Xz0CV_eO4Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_002306_623235_0D8BCEC3 
X-CRM114-Status: GOOD (  13.47  )
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

On Thu, 7 Mar 2024 at 00:25, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> On 3/6/2024 6:23 AM, Dmitry Baryshkov wrote:
> > After some thought, I'd suggest to follow approach taken by the rest
> > of qcom firmware:
> > put a default (accepted by non-secured hardware) firmware to SoC dir
> > and then put a vendor-specific firmware into subdir. If any of such
> > vendors appear, we might even implement structural fallback: first
> > look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
> > finally just under hw1.0.
>
> are there existing examples in linux-firmware?

Yes. QCM2290 / QRB4210 platforms have "updated" wlanmdsp.mbn file,
which actually prompted us to work on these overrides. I have opened
the MR against linux-firmware, marked as draft for now, until all
discussions are finished:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/165

> or is the whole point being only the default firmware is in
> linux-firmware and vendors would follow this pattern if they add their
> own firmware?

Unfortunately not.

-- 
With best wishes
Dmitry


Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC59C67861
	for <ath10k@archiver.kernel.org>; Fri,  5 Apr 2024 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2N0mn42V43jKjndtGzZY3LzMYKGKo3zYQTHJIkNMpNM=; b=0U8f49UPc3+BbNeOpfm32sY44F
	5/9xaq0G66nwEehdkGW6h2EJCy2rnruFJ4BRkTF8yplV/JUTseuBHDqE9uze0u1Witd+QDO3RBOWD
	sJOwC7DD1BSMTBnq3/Aos+sb3rIdy0oHs1Rrxyxn5JmEOJZcx+Ju3XjbkTY+uPIWcLMFgJ5hqKC7c
	KJWSCk3KPMkyVlP20rZ7jTh40p2QAZUU6oPOC22+JrmZJj3/maQyt1eMakzfwvcKBrqXZNsKoHcqn
	0p1cLCnIr2pfgQl8guf68Enc7CfZd8vRN1uKbUYqly+9T8VKkIWJvyrGHV6r/KNhS9eD7yfX+cpQh
	VfMjr8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsimL-00000006yAH-37eX;
	Fri, 05 Apr 2024 12:34:45 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsimI-00000006y8m-2Msm
	for ath10k@lists.infradead.org;
	Fri, 05 Apr 2024 12:34:44 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6152088aa81so22685057b3.0
        for <ath10k@lists.infradead.org>; Fri, 05 Apr 2024 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712320480; x=1712925280; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2N0mn42V43jKjndtGzZY3LzMYKGKo3zYQTHJIkNMpNM=;
        b=ogvPE8iAnW1yK+DnsIBEEUoBZkQY4WAVsl3w1pxGQH/eIQ26rtXIkntdYPX/1eK99+
         G3p910b+Ong0MvfFWZ8v7qyNIoTW+iTZtpkVp7JSGHF8AcxZQLzXBx6G6azni/V8JbvO
         x3xXt8pG19ke9gnKmzflqNB6DgQlY5byuCLHYhzny9lssyzFl1y9CbcQlnIit5Lf3X6j
         MY/4OuVGI0B6HvAfHWv1kVHRfzICCFhns4Yu11HEpctcWneGwiWRxXEPvcd3uIc9XpSg
         OO7gXXSP2su6Lfl+3UjYIDR7oHJefy0jNBCY7syq+g8BhOvZIl0HUel+QNT6V9MIHL2M
         nCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712320480; x=1712925280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N0mn42V43jKjndtGzZY3LzMYKGKo3zYQTHJIkNMpNM=;
        b=sK/nhXKhwCMeRMeI8xY+/q8RAaUshBXlyGSQ+GUjtPliZsuMfBpKSyl89JsMakEwcs
         vz43H8GMd9EZEKdpJCmrs1zjF4YPH1QJci6z0v6vz2/Rk7+V4Sx3Pj0wD1zfyi2/jyK9
         B5oPik3g4IekrjlEmJmZF2ZpXtRw3DT1StnUMOXVl4Ln1/UxO7tzEL/wJLzLgerpEjmw
         OEXxvauiUYsbjqYZ6vQPNcb1iPY/mrGCiymMpwop2zzN5UNfN73NyBdD4fYZwoJYNybt
         8ti4E5vYHOZwHMrKg2Cuu2OKL2ceD1HhcAHO14D5RiRTIfvKDZh6JGboHWJ3DbONbe9/
         FBMg==
X-Forwarded-Encrypted: i=1; AJvYcCWMZPLlWnmky4LTb1YHdpDh6pmmOojAKkO3M3qJxsUJA59sV+1F/oT+kARR3O0DBcR7pksHbarwwI2szuYD9QO0VNw0Y+mwuXytEg==
X-Gm-Message-State: AOJu0Yygp8Um2y0zR2OHTwtwS6HeFVQt4BB9I4qDCLMjpah2nZDoA7id
	vk1X/FQ7ibT1xP6i6DD7WV+ypGStlMu6qj/MsLozy7GF5pjjJtP3hjpc6te1CaHBCp1G2DrALlh
	nJNWcOekQN3Ibv8DVKTTjCb9XvP7auupfQT8lmg==
X-Google-Smtp-Source: AGHT+IE9DTe1wMuQT2hdnEiCQgQhxlwsyKj6itvCyFDOKo18zC+YU88RGgr44hqjEdcdyfD3OgM/EC6WOGEFKxTjcZ0=
X-Received: by 2002:a25:800c:0:b0:dc7:4367:2527 with SMTP id
 m12-20020a25800c000000b00dc743672527mr1236431ybk.49.1712320480356; Fri, 05
 Apr 2024 05:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
 <87plw7hgt4.fsf@kernel.org> <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
 <87cys7hard.fsf@kernel.org> <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
 <87v85wg39y.fsf@kernel.org> <CAA8EJpq_XLUEMC67ck2tZRjqS0PazCkQWWMGmwydeWxTETHwcg@mail.gmail.com>
 <871q7k3tnq.fsf@kernel.org>
In-Reply-To: <871q7k3tnq.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 15:34:29 +0300
Message-ID: <CAA8EJppASEmj6-Jt7OCABAeqr8umSgXaDDha9nn2nRafuZ-Gvw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
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
X-CRM114-CacheID: sfid-20240405_053442_673573_A1ADB93C 
X-CRM114-Status: GOOD (  31.45  )
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

On Fri, 5 Apr 2024 at 15:01, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Fri, 8 Mar 2024 at 17:19, Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> >> To be on the safe side using 'qcom-rb1' makes sense but on the other
> >> >> hand that means we need to update linux-firmware (basically add a new
> >> >> symlink) everytime a new product is added. But are there going to be
> >> >> that many new ath10k based products?
> >> >>
> >> >> Using 'qcm2290' is easier because for a new product then there only
> >> >> needs to be a change in DTS and no need to change anything
> >> >> linux-firmware. But here the risk is that if there's actually two
> >> >> different ath10k firmware branches for 'qcm2290'. If that ever happens
> >> >> (I hope not) I guess we could solve that by adding new 'qcm2290-foo'
> >> >> directory?
> >> >>
> >> >> But I don't really know, thoughts?
> >> >
> >> > After some thought, I'd suggest to follow approach taken by the rest
> >> > of qcom firmware:
> >>
> >> Can you provide pointers to those cases?
> >
> > https://gitlab.com/kernel-firmware/linux-firmware/-/tree/main/qcom/sc8280xp/LENOVO/21BX
> >
> >>
> >> > put a default (accepted by non-secured hardware) firmware to SoC dir
> >> > and then put a vendor-specific firmware into subdir. If any of such
> >> > vendors appear, we might even implement structural fallback: first
> >> > look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
> >> > finally just under hw1.0.
> >>
> >> Honestly that looks quite compilicated compared to having just one
> >> sub-directory. How will ath10k find the directory names (or I vendor and
> >> model names) like 'Google' or 'blueline' in this example?
> >
> > I was thinking about the firmware-name = "sdm845/Google/blueline". But
> > this can be really simpler, firmware-name = "blueline" or
> > "sdm845/blueline" with no need for fallbacks.
>
> I have been also thinking about this and I would prefer not to have the
> fallbacks. But good if you agree with that.
>
> IMHO just "sdm845-blueline" would be the most simple. I don't see the
> point of having a directory structure when there are not that many
> directories really. But this is just cosmetics.

It is "not many directories" if we are thinking about the
linux-firmware or open devices. But once embedded distros start
picking this up for the supported devices, this can quickly become a
nuisance. We have been there for Qualcomm DSP firmware and we ended up
adopting the SoC/vendor/device structure, because otherwise it becomes
a bedlam.

> > My point is that the firmware-name provides the possibility to handle
> > that in different ways.
>
> Very good, thanks.

Thanks for your suggestions and for picking the patches.

Bjorn, could you please pick up the DT patches now?

-- 
With best wishes
Dmitry


Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A1AC67861
	for <ath10k@archiver.kernel.org>; Fri,  5 Apr 2024 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/h5ZKUyP0Cry0+mHbTzooNJMYvg5n+9KMU/0TdwKBUE=; b=Zl+LDVWTwu1JyjNfFC2XVda0ny
	doBn8oblKmojxKBtiW1F7jsDs3So+cML1eR41iol51GVczXNA0riRL5j5y5f3E68MqL2hh03Foq3T
	u1EagdqIBPoAVXP/RsEjCt43MVaFE0Qivk37/r5ZULzHVkTRBzB0Xn6TQfga7c9PejXoFSXukbDDb
	f+rPcKFVsOAT8gyhWEsimIljjTZIjGJLLURjoS8ZXfY5YWurwBQ8zRCYr6snlZk+kYjLbnix+8Qeu
	2iy6s5AL+O3+B863k8ad4ElVS16WdMbN0cs/g6EHjyR1/uN2nXyqtLXVkdkUJfKLghgdWmtCR92hZ
	jBYsq5tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj1E-000000072Ug-2u0p;
	Fri, 05 Apr 2024 12:50:08 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj1A-000000072RF-3yEF
	for ath10k@lists.infradead.org;
	Fri, 05 Apr 2024 12:50:06 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dcc71031680so2125963276.2
        for <ath10k@lists.infradead.org>; Fri, 05 Apr 2024 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712321399; x=1712926199; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/h5ZKUyP0Cry0+mHbTzooNJMYvg5n+9KMU/0TdwKBUE=;
        b=D2vkFT9k9Uwngh2p04UztbMD+81VGFaTtksaUPpf5CPwwP50t4Ecwh2XY9vSVhL3jC
         NYliWcEnZ+/IvrO+hIU6+XtYkWhqm7oq284mywFLErNEehF9aeHoVvb3L8SqAhWZCxdG
         xTrvxM/iNb0COC7aaQM9AyB/RP/0FDzalkVD3cHk2kdKSIgWU/nWUbL+v6/Z+bDBWWQQ
         1wCrfMoMlgKKZJMT0H4vjg8GDt/YnMSB0eBAHGfjtNypdEK9UbBFV+d3FKd8/w6zuoUk
         KayC6XAHuIPubsyL5MWBvtX93zB0Qet8ITYDb67LzXzfjGqSutMP+6lm4tF47wtx8TOB
         Wy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712321399; x=1712926199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/h5ZKUyP0Cry0+mHbTzooNJMYvg5n+9KMU/0TdwKBUE=;
        b=v8VOw0SW91O49p8jEJ+FaAfdZ9WYVW5x/TaR9Sohnh1T/UkTcZTBLqM9oNNWSWCmqi
         /3cgVG2jgeoO/mZtlQUhplgspvRTWI9gWgV25d5hz4KHZyFn4DhATjl6SW0CSvLUGwR+
         70KLCEByR12su7fzEW7h0piZZIxSNgSnMvjbq3oHx5LVc50xK3REpZXl73e59sngftdn
         oLRcWfqzv8PTDonwW6RPZEcfPvgHnx/SSWBvw6cXDE/o0eLSYdAZB2x3cl4NcoN/NzZ8
         lioTHh8NNQJxYQxETCBOffu2Bf6g0YMps3QgYiiafY2yAgkbPmD/dCjA/61xT8pySOPf
         B/kg==
X-Forwarded-Encrypted: i=1; AJvYcCVFGJ0IP5C1QT8TlnJvIDsNJlLH05lgga39Zp5Qs8uDgmxYwNikGNYptAatqebvVvfNC7Qke026i+qnE5BXDQiACfpdWz1X79jlzA==
X-Gm-Message-State: AOJu0Yz+9WWHz24f8JG59b8mNpYxUuhNinOYpjmP17SuPc+1FASsm/zp
	gGjXDrrN9GcaEXm4QgrKViT2BxB1EV2pGwqUkcNt2Cj9S62zSbcKfJopcbePvWjCZymw064N+wo
	B9EhzdfSI8t4Wzprmk3E4IA7ALM79e0d//t9sKA==
X-Google-Smtp-Source: AGHT+IF+uYN0V7kj1WIHdUIWItVzS1wQ6IV2lWWc/0drhKwFzKBD2YiWPAiRHKjXhywplhFwsAgFyDg/DQC+/Ij0EOk=
X-Received: by 2002:a5b:9c5:0:b0:dcc:4b84:67cd with SMTP id
 y5-20020a5b09c5000000b00dcc4b8467cdmr937832ybq.9.1712321399265; Fri, 05 Apr
 2024 05:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
 <87plw7hgt4.fsf@kernel.org> <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
 <87cys7hard.fsf@kernel.org> <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
 <87v85wg39y.fsf@kernel.org> <CAA8EJpq_XLUEMC67ck2tZRjqS0PazCkQWWMGmwydeWxTETHwcg@mail.gmail.com>
 <871q7k3tnq.fsf@kernel.org> <CAA8EJppASEmj6-Jt7OCABAeqr8umSgXaDDha9nn2nRafuZ-Gvw@mail.gmail.com>
 <87sf002d8d.fsf@kernel.org>
In-Reply-To: <87sf002d8d.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 15:49:48 +0300
Message-ID: <CAA8EJpp4J4b1mpkkeVCsnjVw83E7jmu+3yHActTNEeGcOKHPrQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240405_055005_073735_E22BF3B7 
X-CRM114-Status: GOOD (  32.87  )
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

On Fri, 5 Apr 2024 at 15:41, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Fri, 5 Apr 2024 at 15:01, Kalle Valo <kvalo@kernel.org> wrote:
> >
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> > On Fri, 8 Mar 2024 at 17:19, Kalle Valo <kvalo@kernel.org> wrote:
> >> >>
> >> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >> >>
> >> >> >> To be on the safe side using 'qcom-rb1' makes sense but on the other
> >> >> >> hand that means we need to update linux-firmware (basically add a new
> >> >> >> symlink) everytime a new product is added. But are there going to be
> >> >> >> that many new ath10k based products?
> >> >> >>
> >> >> >> Using 'qcm2290' is easier because for a new product then there only
> >> >> >> needs to be a change in DTS and no need to change anything
> >> >> >> linux-firmware. But here the risk is that if there's actually two
> >> >> >> different ath10k firmware branches for 'qcm2290'. If that ever happens
> >> >> >> (I hope not) I guess we could solve that by adding new 'qcm2290-foo'
> >> >> >> directory?
> >> >> >>
> >> >> >> But I don't really know, thoughts?
> >> >> >
> >> >> > After some thought, I'd suggest to follow approach taken by the rest
> >> >> > of qcom firmware:
> >> >>
> >> >> Can you provide pointers to those cases?
> >> >
> >> > https://gitlab.com/kernel-firmware/linux-firmware/-/tree/main/qcom/sc8280xp/LENOVO/21BX
> >> >
> >> >>
> >> >> > put a default (accepted by non-secured hardware) firmware to SoC dir
> >> >> > and then put a vendor-specific firmware into subdir. If any of such
> >> >> > vendors appear, we might even implement structural fallback: first
> >> >> > look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
> >> >> > finally just under hw1.0.
> >> >>
> >> >> Honestly that looks quite compilicated compared to having just one
> >> >> sub-directory. How will ath10k find the directory names (or I vendor and
> >> >> model names) like 'Google' or 'blueline' in this example?
> >> >
> >> > I was thinking about the firmware-name = "sdm845/Google/blueline". But
> >> > this can be really simpler, firmware-name = "blueline" or
> >> > "sdm845/blueline" with no need for fallbacks.
> >>
> >> I have been also thinking about this and I would prefer not to have the
> >> fallbacks. But good if you agree with that.
> >>
> >> IMHO just "sdm845-blueline" would be the most simple. I don't see the
> >> point of having a directory structure when there are not that many
> >> directories really. But this is just cosmetics.
> >
> > It is "not many directories" if we are thinking about the
> > linux-firmware or open devices. But once embedded distros start
> > picking this up for the supported devices, this can quickly become a
> > nuisance.
>
> Ok. Just out of curiosity, any ideas how many devices/products are there
> with wcn3990 who want to use ath10k?

Just for the DT in mainline I can count about 30 devices that have
ath10k WiFi node:

arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi:&wifi {
arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts:&wifi {
arch/arm64/boot/dts/qcom/msm8998-mtp.dts:&wifi {
arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi:&wifi {
arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts:&wifi {
arch/arm64/boot/dts/qcom/qcs404-evb.dtsi:&wifi {
arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts:&wifi {
arch/arm64/boot/dts/qcom/sc7180-idp.dts:&wifi {
arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:&wifi {
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi:&wifi {
arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dts:&wifi {
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi:&wifi {
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi:&wifi {
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi:&wifi {
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi:&wifi {
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts:&wifi {
arch/arm64/boot/dts/qcom/sc8180x-primus.dts:&wifi {
arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:&wifi {
arch/arm64/boot/dts/qcom/sdm845-db845c.dts:&wifi {
arch/arm64/boot/dts/qcom/sdm845-mtp.dts:&wifi {
arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi:&wifi {
arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts:&wifi {
arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts:&wifi {
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi:&wifi {
arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts:&wifi {
arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts:&wifi {
arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts:&wifi {
arch/arm64/boot/dts/qcom/sm8150-mtp.dts:&wifi {
arch/arm64/boot/dts/qcom/qrb2210-rb1.dts:&wifi {
arch/arm64/boot/dts/qcom/qrb4210-rb2.dts:&wifi {

The list doesn't include e.g. PIxel 2-3-4-5 or some other phones which
are still on their way for the proper mainline support.
--
With best wishes
Dmitry


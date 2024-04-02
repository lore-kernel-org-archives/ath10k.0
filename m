Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAB1C6FD1F
	for <ath10k@archiver.kernel.org>; Tue,  2 Apr 2024 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeV/0olw1/tQOoEzRbn7wneEZCNZI4OAG5EO13F9t/U=; b=T81oL+Fy/ELnf3W2iXPOghWPJx
	YcbdRPJhSbH/aG7H8T2yDEVcpFJ7eDDZchZuB9X7bEHPdI9FS6XQSnj/NYIUflTI2hkn2LAHbeM/W
	k8KvBKdUnsNkfbYSd3siKpULlg3aE5gD4j6dIPeWTJsL9Z733Ef79MPsDaqo9HuoOtZudn4TWusll
	ts5N7ndKLRrtL2do6B2hlf2CKq34I9a8pjaCe/2sJsnphmSriSB88+644ZfZsQNyjAV/c3NoSaQyI
	7gZg1TWugJJlSEiGrG+oR3YiZkby9JDux+L3iyXoKtVLamhPt0TdmLE0BhXAmmTVZlSwcawr6JDBb
	5zS37+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgUo-0000000BuvH-290C;
	Tue, 02 Apr 2024 15:56:22 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgUb-0000000But8-1uRG
	for ath10k@lists.infradead.org;
	Tue, 02 Apr 2024 15:56:11 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e6fb9a494aso4302971b3a.0
        for <ath10k@lists.infradead.org>; Tue, 02 Apr 2024 08:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712073368; x=1712678168; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xeV/0olw1/tQOoEzRbn7wneEZCNZI4OAG5EO13F9t/U=;
        b=DrKFU4260H299WiKwyLpCjXQGypnRNbfvGOEGfKd/FNhFWQjTrzYpG9X6zi9uLjyd9
         MBpZ4XSCjjSjbnYhNip2utzbirpcQY6rvmJTivycTPFgm22DPmpRpVeAwoqVNq0EZBBk
         q+sNoxpof+j3qfhAcuym9S5DS83b+pnTwA2sWYnlXh8nOVYZUEDlAH2II7CMZACq3o8y
         fywlWXskUlVDHne32LONDYcr9nvuIn/ripxjPaC5nmOu1+YpKSp3QH7DKZDdlyvMRSi2
         h+YgzRJxC8CK1tIjuRsNjHzuAjF/H9zR2DYbwE5LaFdf2kTVAr8jfgbhHkHxcgiFfvMe
         kWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712073368; x=1712678168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeV/0olw1/tQOoEzRbn7wneEZCNZI4OAG5EO13F9t/U=;
        b=n3UsJTynk8kLkldIRL+pP4x9kH4x9h1kPEMyvYIy73Cx5yMbJ5hQVCPElZLVJ6Eolo
         XmRsvRDthP3fOyWczWleDq5lTCZhxVd/TQ4LOZZnPITpNVOjmbNPwNLdkiw/NWgWzw39
         cQaAgLSSRbpzKpcEhgni12omUWUKVSTuroP5m1GGa1MbduWP07FAVgqVJz5MGkKHyD+O
         BrDLeFKgI4cULtnwj2TpQYUR4ZO1bPXpFU06jAzG06wUkXE2I2ccdZ166mYSyGfZ7g1D
         BaqYLmTOfV0zSxlOB811DsEv6zg7Z6OybxcfIvl9g/Sryp1wzwJwwCfbyrxMawxDnZTz
         5BWw==
X-Forwarded-Encrypted: i=1; AJvYcCWdGSTCbclEaL9E4wxPjBz8rbzFI13EL7ypBKeLnfl3LzlqEe0OLMJgdfkX/N5fgeLAFfRnuumzEZ0WGgPmD6v6udGXTk632Opf4w==
X-Gm-Message-State: AOJu0Yxz4Ah/3Lc0xLLtcNJEGrVGKnME89EC/yMhjhojFLE3h5amQC7s
	Zkb785El+L5WXwFz4a8QW7R+KFBhEz4Ic5j6XZGGyg7VdfvBd0YkAmamZUNA4dziOjTJgIJI+13
	0b2h5XOTvlys8a4eK0xTkDH6sWFxyIqXd0DijSg==
X-Google-Smtp-Source: AGHT+IH6biaoyoyXGVcuVSEJ64ktCWPrzGD+BguHOuhX547CoHoNCMxaDcDjufoVG68y80EXUw7JQLAEWOsngyWHeXo=
X-Received: by 2002:a05:6a21:9992:b0:1a3:6ee9:305 with SMTP id
 ve18-20020a056a21999200b001a36ee90305mr12284409pzb.2.1712073368128; Tue, 02
 Apr 2024 08:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr> <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org> <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
In-Reply-To: <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 18:55:56 +0300
Message-ID: <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator
 for wifi
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>, 
	wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	Bjorn Andersson <andersson@kernel.org>, Jami Kettunen <jamipkettunen@gmail.com>, 
	Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_085610_014580_5C65CBB1 
X-CRM114-Status: GOOD (  34.79  )
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

On Tue, 2 Apr 2024 at 18:31, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 02/04/2024 16:34, Konrad Dybcio wrote:
>
> > On 30.03.2024 7:25 PM, Krzysztof Kozlowski wrote:
> >
> >> On 28/03/2024 18:39, Marc Gonzalez wrote:
> >>
> >>> The ath10k driver waits for an "MSA_READY" indicator
> >>> to complete initialization. If the indicator is not
> >>> received, then the device remains unusable.
> >>>
> >>> cf. ath10k_qmi_driver_event_work()
> >>>
> >>> Several msm8998-based devices are affected by this issue.
> >>> Oddly, it seems safe to NOT wait for the indicator, and
> >>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
> >>>
> >>> Jeff Johnson wrote:
> >>>
> >>>   The feedback I received was "it might be ok to change all ath10k qmi
> >>>   to skip waiting for msa_ready", and it was pointed out that ath11k
> >>>   (and ath12k) do not wait for it.
> >>>
> >>>   However with so many deployed devices, "might be ok" isn't a strong
> >>>   argument for changing the default behavior.
> >>
> >> I think you got pretty clear comments:
> >>
> >> "This sounds more like a firmware feature, not a hardware feature."
> >>
> >> "This is why having this property in DT does not look right
> >> place for this."
> >
> > Translating from dt maintainer speak to English, a functionally-equivalent
> > resolution of adding an of_machine_is_compatible("qcom,msm8998") is more
> > in line with the guidelines of not sprinkling firmware specifics in DTs
>
> I'm not so sure about that, as I had proposed
>
> +       if (of_device_is_compatible(of_root, "qcom,msm8998")
> +               qmi->no_point_in_waiting_for_msa_ready_indicator = true;
> +
>
> To which Conor replied:
>
> > How come the root node comes into this, don't you have a soc-specific
> > compatible for the integration on this SoC?
> > (I am assuming that this is not the SDIO variant, given then it'd not be
> > fixed to this particular implementation)
>
>
> Then added:
>
> > A SoC-specific compatible sounds like it would be suitable in that case
> > then, to deal with integration quirks for that specific SoC? I usually
> > leave the ins and outs of these qcom SoCs to Krzysztof, but I can't help
> > but wanna know what the justification is here for not using one.
>
>
> Then Krzysztof added:
>
> > The WiFi+BT chips are separate products, so they are not usually
> > considered part of the SoC, even though they can be integrated into the
> > SoC like here. I guess correct approach would be to add SoC-specific
> > compatible for them.
>
>
> So, if I understand correctly, I take this to mean that I should:
>
> 1) DELETE the qcom,no-msa-ready-indicator boolean property,
> 2) ADD a "qcom,msm8998-wifi" (name OK?) compatible,

I'd say, this is not correct. There is no "msm8998-wifi".

> 3) ADD that compatible to the wifi node in msm8998.dtsi
>    compatible = "qcom,wcn3990-wifi", "qcom,msm8998-wifi";
> 4) In the driver, set qmi->fake_msa_ready_indicator to true if we detect "qcom,msm8998-wifi"
>
> And this approach would be acceptable to both ath10k & DT maintainers?

I'd say, we should take a step back and actually verify how this was
handled in the vendor kernel.

>
> Bjarne, Konrad: is it OK to apply the work-around for all msm8998 boards?


-- 
With best wishes
Dmitry


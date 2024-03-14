Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ED6C54E67
	for <ath10k@archiver.kernel.org>; Thu, 14 Mar 2024 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpakeXG7lnYh4AwqEGI18Zf+2/wDYzbFbSRJoPHhJPI=; b=CC1eiCZ9cVr5ODpDjXts76PYT4
	DxIZj5006E+FleFNbzftH+AoaCtu32Tu+3uma/Zts5CVh2ZcEWwVk3mOzZ+K8d+4xG0uecJ4Cc3cg
	LxXl9IGxMJ0nS80fhf/RnMI6lJ/p58I+k+DTOWcF8fpq7TuF/vJQFWi7W89WUXP1GDW2PeJ+vzX7U
	aWy0SVn+Wqlx0QmNObWJxkDEpr/4WP8ird6mdlAa18slcEocU5C430QpUC671EEEWxfajrJft0SMT
	dn2BSCf909BqquEJkhGyRSNxBw3e+Or7GRCqeMxH7tj9/XwYWEoFauGHTMyk4j46auzYRmwgLHSxV
	jSfi9izQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkZP-0000000EJ98-4AGp;
	Thu, 14 Mar 2024 12:52:27 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkZM-0000000EJ8T-2ImV
	for ath10k@lists.infradead.org;
	Thu, 14 Mar 2024 12:52:26 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso792920276.3
        for <ath10k@lists.infradead.org>; Thu, 14 Mar 2024 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710420742; x=1711025542; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OpakeXG7lnYh4AwqEGI18Zf+2/wDYzbFbSRJoPHhJPI=;
        b=rYRzAzE+6N9ihRdteW1yQDX+y3CK0vZBpJjygfUV1ZhGYJgIHH0YWt7ZP1cklA67KT
         A9gWJo6SS+I/Co6JvD+bWTbFqHAlXoDKLbR+/gvywCJZ89VhAn28hc1DDpDKnuq+djsB
         92FoKDCti2oBrFPNjYf6jNA2iZoXLC4DzlLFXgXVZ0+t+k6kRWgEhX2g2i5h83aBR/wv
         npu6x8Jlf/dSGqvibkzI6RYIRCr4YcDBE+nN3c9U0adrNpxMt9GM5a5bKzgqhxiCckEm
         5sEjmeAMKuUykyCeXUDFO0L13bg0Q1s8ACAwJpd8WcBcRyoCYC79IRxDCIjDtdKxEir0
         0ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710420742; x=1711025542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpakeXG7lnYh4AwqEGI18Zf+2/wDYzbFbSRJoPHhJPI=;
        b=p4rANYeNmk7VOnC2iSwRjyezPQx+fIZVjTBa+6XkA7l7ikp21OwQNp+q80ZRXnGbm9
         4WLYDoBACAPKheYz4jZikkaPm03bVASkWHhik0ebLihn91KTeRMA7TFE9WuLu/dkYIwE
         aTBym20ZJCIylTwSFlpfZffWcf7dHDuqoe1IMRY74XsmoMC4Yy5x1IaU53yO9VfmXxBM
         sWMZkbc0PUzyN5H/SnUtpkoKHscoiQN872vOOQ0Hy6XA7bD54q/7ubU3RAQlmMe8xTi9
         32zLFuX66eRFtsks4ZrOiZ0+xnhY+4zlKXwMZF6sMJ8jI8z3fP5tqY2cX4nZkvMg3Jqu
         4XPA==
X-Forwarded-Encrypted: i=1; AJvYcCUFdti55SV0ZpSXobnyU83Z/czQ8PjPx6R0aEKg3wodXGIwvzIE2sOtJxuhEzr4nQcPP7yyKiW8klcOab6Tvz/TGvogZktDpnySUA==
X-Gm-Message-State: AOJu0Yx2UhykJijKwhva8YBF1bPyO9Z6whLKMHvHF8V2No8jGfos9CDN
	LGGD9Ak2FW8J5tLhBaI2RLwPBeL75mg1sdxG453zzievZJDOhqactE7Okk6+rcP+Zra850kDy0U
	hP+6b73cfMe9nkGLgmqIGPmdxT0IxAPJ7L7KgkQ==
X-Google-Smtp-Source: AGHT+IH+AbXJKIsJ0K+qf80CaawJtfQeiqz1IfY0TFyU81iVTRDOnCMRBXQi+u9EeWwxdv5UGjnYpNKHt4w0xxHRDWA=
X-Received: by 2002:a05:6902:e13:b0:dcc:9e88:b15 with SMTP id
 df19-20020a0569020e1300b00dcc9e880b15mr1697730ybb.41.1710420742226; Thu, 14
 Mar 2024 05:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org>
 <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr> <CAA8EJppHa=qEkKbSVs9hMCBXfhiC9MyAQO+v+6TCWhg==4CpOQ@mail.gmail.com>
 <d23b5fc5-9fc2-4841-8eb9-b22a28f05f69@freebox.fr>
In-Reply-To: <d23b5fc5-9fc2-4841-8eb9-b22a28f05f69@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 14:52:10 +0200
Message-ID: <CAA8EJprgZkZcesT7WNwpYx_Lg3w9xkTxQmq5-bPyhbvECLkQCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>, 
	wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Jami Kettunen <jamipkettunen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_055224_629496_FE5205E8 
X-CRM114-Status: GOOD (  29.91  )
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

On Thu, 14 Mar 2024 at 14:31, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 13/03/2024 16:53, Dmitry Baryshkov wrote:
>
> > On Wed, 13 Mar 2024 at 17:09, Marc Gonzalez wrote:
> >
> >> On 05/03/2024 20:20, Kalle Valo wrote:
> >>
> >>> Marc Gonzalez wrote:
> >>>
> >>>> I need to build a kernel + rootfs + FW to test the proposed solution,
> >>>> then I can spin a formal submission.
> >>>
> >>> Yeah, please do test this to make sure we are not missing anything :)
> >>
> >> I used buildroot ( https://buildroot.org ) to generate a kernel + rootfs
> >> for my board (a variation of qcom/msm8998-mtp.dts)
> >>
> >> Not sure if I must use the vendor FW blobs? Or if I can use the blobs
> >> from linux-firmware-20240115.tar.xz (as supported by BR2).
> >>
> >>
> >> All I see from the ath10k driver (with debugging cranked to the max) is:
> >>
> >> [    0.539801] ath10k_snoc 18800000.wifi: Adding to iommu group 0
> >> [    0.541941] ath10k_snoc 18800000.wifi: snoc xo-cal-data return -22
> >> [    0.543633] ath10k_snoc 18800000.wifi: supply vdd-3.3-ch1 not found, using dummy regulator
> >> [    0.544002] ath10k_snoc 18800000.wifi: qmi msa.paddr: 0x0000000094400000 , msa.vaddr: 0x(____ptrval____)
> >> [    0.544271] ath10k_snoc 18800000.wifi: snoc probe
> >>
> >>
> >> # ip link
> >> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
> >>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
> >> 2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
> >>     link/ether 34:27:92:82:48:ec brd ff:ff:ff:ff:ff:ff
> >>
> >> No wlan device at this point.
> >
> > Do you have pd-mapper, rmtfs and tqftpserv running? You also need to
> > have wlanmdsp.mbn in the same directory as modem.mbn for your platform
> > (see how this is handled for sdm845).
> > If these points are implemented and you still don't have the wlan,
> > please check for tqftpserv messages in syslog.
>
> I first tried using buildroot, which doesn't package these tools AFAICT.
> I have now generated a debian rootfs, which does package them.
>
>
> >> I got shell-shock from reading these setup steps:
> >>
> >> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN
> >> https://github.com/jhugo/linux/blob/5.5rc2_wifi/README
> >
> > These readmes are mostly correct. You don't need qrtr now, it is
> > provided by the kernel.  pd-mapper (protection-domain-mapper),
> > tqftpserv and rmtfs usually can be installed from your distro.
>
> Can you explain a little bit why all the steps are required
> just to be able to talk to the ath10k IP block?
>
> It's just an MMIO device, right?
>
>                 wifi: wifi@18800000 {
>                         compatible = "qcom,wcn3990-wifi";
>                         reg = <0x18800000 0x800000>;
>                         reg-names = "membase";
>
> Is the IP block behind some kind of switch that must be programmed
> by a remote processor on the SoC?

It has a separate core, with the firmware to load, etc. For some
reason the firmware is loaded in a complex way, via the modem
remoteproc.


-- 
With best wishes
Dmitry


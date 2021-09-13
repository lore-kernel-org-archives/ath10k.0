Return-Path: <SRS0=Js5E=OD=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C4BC433EF
	for <ath10k@archiver.kernel.org>; Mon, 13 Sep 2021 13:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78AF86142A
	for <ath10k@archiver.kernel.org>; Mon, 13 Sep 2021 13:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78AF86142A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtRyCHoDfoIEffzo1gCKEbHagl490SaFY+6W0FLiy6U=; b=jdsGLt00hFikDx
	uyPl6FZEgVHAMNbE4rxHrod8gdYkca56dynYZQJCiH2HOHlMQuEx9r8qsZ2aEdHHZqhZq7B/PMKVs
	lMngJrQ8XyPaHI1UjVhcs2eU8s7TonjuthHZnVBqpRo1ZbzBq3XV0pdTKUPKcCef7Jb3WEj7FaPNj
	S4UCXxN2iH9gwcrL5j9DM6nIXvcxqmW+rT+ZOvq+1UN4NTALOUpaU1TI1LGu80lc8M1TwYiRvYOt4
	R4UOQYMZTTi/Ne7NA2wZCVUTrRujequv0pPpunWHTJlOYif4/kANchaPUYJhYrCrGX/EeuhxmegJQ
	xdhaZIzZPIITMg5rN06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPmEr-001tay-GR; Mon, 13 Sep 2021 13:43:13 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPmEp-001taP-0D
 for ath10k@lists.infradead.org; Mon, 13 Sep 2021 13:43:12 +0000
Received: by mail-lf1-x12b.google.com with SMTP id c8so21254397lfi.3
 for <ath10k@lists.infradead.org>; Mon, 13 Sep 2021 06:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tQAMjy8VRvJI6lW4tYB0PDHpx0tw8jGULSmN/FaNG+g=;
 b=Bbb/S9bUWOBSsQ3pUMTVPvPM3mELyvG1d1Lp39NxhVgmVk+79l6sqgb6LzWCOb4L0G
 4xOUKFakiyAC6nrltsn+MB6bUBos4WlUB0nm7FHkp2RF21NdRLUEm4sunjTSdshoRv4K
 eNLAmdHSnHkdwraYqYyvKCPiIaApFzA0oCxB65b4ONd9T/nu22W+N71E6gYzBiva34CW
 IgswZYwE132B2XWdZPaLFJFxywQZsw2cZ4gmU7fM6bSCADjsWz2QqrQNXrytfyNxu0Ed
 QWM6q7ZowPchznXUFAyvgGnmTOZr9Qu57dB5+Rp0N50r+t46TxzQtEkrBzX3RfDkuaUN
 gsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tQAMjy8VRvJI6lW4tYB0PDHpx0tw8jGULSmN/FaNG+g=;
 b=gF89pg1cfeHjpGD+plsPOIlcXxYrCAGCH9GAzLgsty2sPyclrtOrktigTVXWAWRoLm
 etgqc5ukUXnVt2dh9vYrT+clY/8Olg+LjOVWuxuxWUjARF4eRFv97DkygC03DwcQes1D
 PIN6lN/JxcG0onTdRTCrtfmyfrVKqZaRXmnIUij/8vjTuhsgA7clOm+nXGGsPV/Zkqj8
 BYqbO8uHzkThOAuyuGID7Dl1FSf7QWeG5/sanM9OvajLdST3x4PhYNpKibLkKBSc7pwy
 7NwR548Qn+mFfm4pt3bHB32XQmHgkig7sw3aLfZ2hNxQggQxDEZCKdJd6ZpBoG2nIluu
 jqyQ==
X-Gm-Message-State: AOAM533cME9l3TVjPHJUr3wLmComdR/Z0e4abDlXQipaPseo1w/WDSY5
 buPBGL9JrgO/VML9MjYLi1bnWROZ4xcLrybOaBF12w==
X-Google-Smtp-Source: ABdhPJy07GBvfOdosgOPOaGQzsGX2CjzdZ3iQjt2WHHbgd+CW+rDXGN21SD5O2GYnEG/e8C/opszahQX3cMDMdCSpjk=
X-Received: by 2002:a05:6512:6cd:: with SMTP id
 u13mr8847405lff.184.1631540588087; 
 Mon, 13 Sep 2021 06:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
 <20210829131305.534417-2-dmitry.baryshkov@linaro.org>
 <CAPDyKFp9CM+x505URK=hcO0QFqcZrpqzQ6uJQ=ZLR6uq-_d5Ew@mail.gmail.com>
 <a0f8766a-7810-0ca5-229a-a40f73041dd9@linaro.org>
In-Reply-To: <a0f8766a-7810-0ca5-229a-a40f73041dd9@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Sep 2021 15:42:31 +0200
Message-ID: <CAPDyKFrfEQr0czXeNeJbKSfP0toKuowwOX7yb89c723BORRqCA@mail.gmail.com>
Subject: Re: [RFC v2 01/13] power: add power sequencer subsystem
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-bluetooth@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>, 
 netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_064311_097436_0FE42934 
X-CRM114-Status: GOOD (  21.36  )
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

[...]

> >> +
> >> +struct pwrseq *of_pwrseq_xlate_onecell(void *data, struct of_phandle_args *args)
> >> +{
> >> +       struct pwrseq_onecell_data *pwrseq_data = data;
> >> +       unsigned int idx;
> >> +
> >> +       if (args->args_count != 1)
> >> +               return ERR_PTR(-EINVAL);
> >> +
> >> +       idx = args->args[0];
> >> +       if (idx >= pwrseq_data->num) {
> >> +               pr_err("%s: invalid index %u\n", __func__, idx);
> >> +               return ERR_PTR(-EINVAL);
> >> +       }
> >
> > In many cases it's reasonable to leave room for future extensions, so
> > that a provider could serve with more than one power-sequencer. I
> > guess that is what you intend to do here, right?
> >
> > In my opinion, I don't think what would happen, especially since a
> > power-sequence is something that should be specific to one particular
> > device (a Qcom WiFi/Blutooth chip, for example).
> >
> > That said, I suggest limiting this to a 1:1 mapping between the device
> > node and power-sequencer. I think that should simplify the code a bit.
>
> In fact the WiFi/BT example itself provides a non 1:1 mapping. In my
> current design the power sequencer provides two instances (one for WiFi,
> one for BT). This allows us to move the knowledge about "enable" pins to
> the pwrseq. Once the QCA BT driver acquires and powers up the pwrseq,
> the BT part is ready. No need to toggle any additional pins. Once the
> WiFi pwrseq is powered up, the WiFi part is present on the bus and
> ready, without any additional pin toggling.

Aha, that seems reasonable.

>
> I can move onecell support to the separate patch if you think this might
> simplify the code review.

It doesn't matter, both options work for me.

[...]

Kind regards
Uffe

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

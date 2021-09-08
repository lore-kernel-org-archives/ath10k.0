Return-Path: <SRS0=6ef7=N6=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA49CC433F5
	for <ath10k@archiver.kernel.org>; Wed,  8 Sep 2021 22:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB34F60F5E
	for <ath10k@archiver.kernel.org>; Wed,  8 Sep 2021 22:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB34F60F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eu5+llFBJ1G8BiYUk8GFyDTrvpc3U2nA1BzakWg5xI=; b=yrLBxdxyMHrHyx
	J/OBeMhk5j2PUYzd3iG4qVUXDbKRX87xgZq+/UqKtZbAeLxBo+PBYygDxl8L5q8F30Xq5Fig4MHka
	Pfc5AErc7kaQ1FDLkSugXbEq/a5LoeMArSlvXeuNsHp2x2H0bOHP2FpPMpEo6EGChaP53wvth3Pod
	YTBAIlivtdBRgyrrjUqZWOmwh2POU+msIxDIJDUGR+AnSWMgBwJzzzk6Gvs7i7tHmu3EJDObtWXOL
	qpszyoSuTBx1KhqI6Pk0v51n81VbWgf6oMmQfCH+e/aupMUYE2bOboZukss4STBtLjrEdJGPis++y
	Xa0i+/THS9QbmmGMAjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO6C3-007jTC-P6; Wed, 08 Sep 2021 22:37:23 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO6C0-007jSS-Ms
 for ath10k@lists.infradead.org; Wed, 08 Sep 2021 22:37:22 +0000
Received: by mail-io1-xd29.google.com with SMTP id g9so5363636ioq.11
 for <ath10k@lists.infradead.org>; Wed, 08 Sep 2021 15:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fJ3ihx4At7jgHYb3j4mYdDe9G4uE+v4pbaUUjca10is=;
 b=Q75NbNDpBphtBp+PKFLy985Z4TTGj4ihZPMVooF8G2q+TppHtpDID51jmQAp5DG4jc
 ZGHcVuPWy0owAmiNaf/M9z4/2p+UBiaOdW6CiL1yfw3ia3UJiklAankiuBOipM5srSP+
 bqi5n2KdIRWO/1X+cu2BWHrYtmVBrfhDHGbL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fJ3ihx4At7jgHYb3j4mYdDe9G4uE+v4pbaUUjca10is=;
 b=zd2HbngOdWRlws0EwJ1njckqZA/PrMPxRwFPBQbDXoLBnJ63jDdndzhEP0R6npZ916
 9lnpQ+6ZjB2Ie9V2NXcBaJh65KqdMqTeuW5Si+jJBQFwhxC02SM92Ndrb6kmUQV1urgX
 q5SAEtDMJtVGOYI9Ag4ui8mdWafS7rsPUZQAXjSZ4iXHdsaBEq1keinkAWZWF5Iv5rlU
 A76L2tihkMExbdWDC93IOqYL5yoTu7179YHdF6uHnVwB75VTGRDgj9qxmP+a6QbZtwZP
 FJMpUJXEtIjBHIallyYKNLef6qXPn2YjIGNMkaK90q5ahPonxmWmCKqonNLI4dorvEuO
 Od1A==
X-Gm-Message-State: AOAM533+zIa/bJQuf6NTHMqL8n5v2u8BQ2p+XqEgQOwW23S9otyYdZPL
 NUZNMkh//kjw5nqd/2xv9qlQ4iiV+7FhrgcLUDCvLQ==
X-Google-Smtp-Source: ABdhPJzwDblF0Ih7VdiBmyr77yCQeqfj4l4itTfLgiElnagK5TDnK04rTWAknk1pCDtaGemvtTa13cAdWAvzwWeHTxQ=
X-Received: by 2002:a05:6602:20ce:: with SMTP id
 14mr478898ioz.204.1631140638724; 
 Wed, 08 Sep 2021 15:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210905210400.1157870-1-swboyd@chromium.org>
 <YTe+a0Gu7O6MEy2d@google.com>
 <CAE-0n52d_GBh70pSDXTrVkD5S6akP4O9YcE4tVRKZcvLtLZSmg@mail.gmail.com>
In-Reply-To: <CAE-0n52d_GBh70pSDXTrVkD5S6akP4O9YcE4tVRKZcvLtLZSmg@mail.gmail.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Wed, 8 Sep 2021 15:37:07 -0700
Message-ID: <CACTWRwsRLrKHRWVoHHyrU2DEc_VkhqSi66tdD2OBWs_y8J2LPw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Don't always treat modem stop events as crashes
To: Stephen Boyd <swboyd@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, 
 LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 netdev <netdev@vger.kernel.org>, Govind Singh <govinds@codeaurora.org>, 
 Youghandhar Chintala <youghand@codeaurora.org>,
 Rakesh Pillai <pillair@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_153720_796435_A57A81A7 
X-CRM114-Status: GOOD (  22.20  )
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

The way I see this, this issue is happening because of a much bigger
design constraint. On integrated(modem+wifi) solutions, if remote proc
service is shutdown, it has a trickle down effect. It deinitializes
the modem processor (which controls wifi as its subsystem) and the
wifi FW. As the fw de-initializes, we see the Delete server generated
by the wifi FW. The FW generates delete server qmi event and there is
no way on the host wifi driver to differentiate between delete event
generated from a FW crash and de-initialization due to remoteproc and
so we see the FW crash logs even during shutdown.

I would like to know what are Qualcomm's views on the design
constraint and any plans to reduce the rigidity. Also, will the FW
broadcast other qmi events(QRTR_TYPE_BYE for e.g.) during shutdown
(different from crash) ? If so then we can utilize that event and then
we don't even have to add dependency on remoteproc.

Overall this change should fix the issue, additionally I have one
comment below and would like other reviewers views.

>  #include <linux/regulator/consumer.h>
> +#include <linux/remoteproc/qcom_rproc.h>
>  #include <linux/of_address.h>
We are adding an external dependency here but since this is added in
snoc.c (which is for integrated solution only), I can expect if SNOC
is enabled, remote proc will be enabled as well, so it should be fine.

Reviewed-by: Abhishek Kumar <kuabhs@chromium.org>

On Tue, Sep 7, 2021 at 12:48 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Matthias Kaehlcke (2021-09-07 12:32:59)
> > On Sun, Sep 05, 2021 at 02:04:00PM -0700, Stephen Boyd wrote:
> > > @@ -1740,10 +1805,19 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
> > >               goto err_fw_deinit;
> > >       }
> > >
> > > +     ret = ath10k_modem_init(ar);
> > > +     if (ret) {
> > > +             ath10k_err(ar, "failed to initialize modem notifier: %d\n", ret);
> >
> > nit: ath10k_modem_init() encapsulates/hides the setup of the notifier,
> > the error message should be inside the function, as for _deinit()
>
> Sure. I can fix it. I was also wondering if I should drop the debug
> prints for the cases that don't matter in the switch statement but I'll
> just leave that alone unless someone complains about it.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

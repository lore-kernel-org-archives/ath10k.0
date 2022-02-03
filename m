Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB209C433F5
	for <ath10k@archiver.kernel.org>; Thu,  3 Feb 2022 14:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhZpxsK+OgPIHp5Fes0jFR5jP43J4DcBvQApIgnnSxE=; b=Q3tLiZUIOoVYxY
	jUIgeU4UhKP1PAlSNa54HPnIQxEsylpzvh2KBWvBjQdZ1nrPk1NVoni8wz01Gr2Kv2KqybFfMyvdi
	UvQmhPoMTJ6lRq/dh/smogq6dMplQY7vXD2oMvcEuXqo/aVRDyT90hguanpaaaIYGhQaFXRwJIf+E
	riebsB4pd3765i7EBE/eNQiBxbEy97bj4faw1prpkD/q6T3Xer6suPfqIIz1JAm3Ie7rY0Bq8u9if
	DGyYqfSnSAl7ucMw4wEOT8qhX64Kc6Ytc4AvApyHOR4LveNCVsxEkjVAX0bcNa5CnfeSneuE1SMVw
	lVXra8id0pkejJ0qL5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFdLg-001gPL-DJ; Thu, 03 Feb 2022 14:44:36 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFdLd-001gOX-Da
 for ath10k@lists.infradead.org; Thu, 03 Feb 2022 14:44:34 +0000
Received: by mail-io1-xd36.google.com with SMTP id n17so3505659iod.4
 for <ath10k@lists.infradead.org>; Thu, 03 Feb 2022 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tbhWRIOFYjgUC3Vb98+hQGA2AlTDbAX5g/E/ZuVec74=;
 b=E27QQ6wJuL3UmwpE9CQ6NCKwnrzvDVkIRvP3x9Jl3bZ48yhcJ5NgrprOkYYGCFF2dj
 sU7eOgR6FVApzEGit7UGjFPEK98K9huPKdypWNhgcRz72QgkP8NMMaPtSaQG8Y/DZFcw
 jV9Er86XWBIaAYokQXo3xujUImU9yG4PKbqDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tbhWRIOFYjgUC3Vb98+hQGA2AlTDbAX5g/E/ZuVec74=;
 b=inWalAZ60ZPu53jYwdfKnuzPx7EMudbreih3bPuvqlAHP9T3j3MoO95VCZLwhVfYUv
 daIgfCrGcRX8MrQ9y4ITlqcNkWoHEP8XE9/8b7Mxw2n6r63+CDnvIzaclzpkdKJNSk+K
 4EMZt9xmoQ6WrtW0tyqXmOb935TqQAQ0Z0h+fhGHkEwCW2h5wI0GMAK79uGGuVwQG9l/
 SKWWV4eWJmWdWHXJz3q/YhF++xouA5zQP2t4xmX7SdpvX9/iDuWqlkvvFdJL/zPyuAKp
 Gfr0IaQ0WBNrjbZdLkhBNkjCrS2sndZwzCJTptnIvQ4nMorSk/kCtCqIY1b5kyaeYcSS
 zOZA==
X-Gm-Message-State: AOAM531TfJwaOYT1zssw9bwjqnGI1v7VyhgnCHHrMVlEcc+OP+w/Rcw9
 QQHtyRlOXyHWdHCL+B0GpGCqdfHZItCUZA==
X-Google-Smtp-Source: ABdhPJx4zPyyOFWB9PJTM3UHJuagTa9EYSXFfdkgUqGOcv6dTKpls812HwhnliYP3fO1czGwxXXeGg==
X-Received: by 2002:a05:6602:2c47:: with SMTP id
 x7mr18798865iov.94.1643899472113; 
 Thu, 03 Feb 2022 06:44:32 -0800 (PST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id b5sm22335626iln.54.2022.02.03.06.44.31
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 06:44:31 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id q204so3486263iod.8
 for <ath10k@lists.infradead.org>; Thu, 03 Feb 2022 06:44:31 -0800 (PST)
X-Received: by 2002:a02:3b67:: with SMTP id i39mr17234458jaf.50.1643899470709; 
 Thu, 03 Feb 2022 06:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20220121064427.32059-1-quic_youghand@quicinc.com>
 <20220121064427.32059-2-quic_youghand@quicinc.com>
In-Reply-To: <20220121064427.32059-2-quic_youghand@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Feb 2022 06:44:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W-kPfnL2jB7bw4SSC=8hBfZg4kq7=rsHHCxDRj6yaSeQ@mail.gmail.com>
Message-ID: <CAD=FV=W-kPfnL2jB7bw4SSC=8hBfZg4kq7=rsHHCxDRj6yaSeQ@mail.gmail.com>
Subject: Re: [RFC 1/2] ath10k: Set tx credit to one for wcn3990 snoc based
 devices
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: ath10k <ath10k@lists.infradead.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 quic_pillair@quicinc.com, Abhishek Kumar <kuabhs@chromium.org>, 
 Brian Norris <briannorris@chromium.org>, Guenter Roeck <groeck@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_064433_511055_5D9A48A3 
X-CRM114-Status: UNSURE (   8.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Jan 20, 2022 at 10:44 PM Youghandhar Chintala
<quic_youghand@quicinc.com> wrote:
>
> -       htc->total_transmit_credits = __le16_to_cpu(msg->ready.credit_count);
> +       if (ar->hw_params.tx_credit_limit)
> +               htc->total_transmit_credits =
> +                       __le16_to_cpu(HTC_HOST_MAX_CREDIT_COUNT);
> +       else
> +               htc->total_transmit_credits =
> +                       __le16_to_cpu(msg->ready.credit_count);

Apparently 0-day had a bit of a problem with the syntax above. See
<https://crrev.com/c/3435607>. Basically you don't need the
__le16_to_cpu() around the constant HTC_HOST_MAX_CREDIT_COUNT.

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09A9C433F5
	for <ath10k@archiver.kernel.org>; Wed, 24 Nov 2021 03:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LCg62772wS9kSSZMzM719wL5YFWb6UOTxwGwcAsC0Xo=; b=frelmNpy82Xg7I
	oumeOqbYcrwT5TIJ3yeLf6P2DW7XVALv6RG/in/YCxOCYNAkS7IGECUM7bVb3Mmo/RqzsnoGUjZ5H
	RcODGiJlYk20abBcdGT1wQU93hPZvFhD2WfDSc6lI6ycHEchA5PLVBGwBGSh7m8fILFDUV1CtCtKw
	dE41ZvDb6FbCHDF37y2d5M94QJXFW80E0lqAwj2l55bUrrsF0RD5VIyO7LfeTw4TNeKFruE9WAyzj
	Pi7RHzbJf7Xo2sWq2GLOfk48Gbf0KzDUzf0wF7fjrULaQKkuukxwLWtDrj7pR9WWyC55qHdFDFcw3
	gYhsWa0pzHpTP6LE6SsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpivn-003rrW-F2; Wed, 24 Nov 2021 03:26:47 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpivk-003rr7-IF
 for ath10k@lists.infradead.org; Wed, 24 Nov 2021 03:26:45 +0000
Received: by mail-ua1-x933.google.com with SMTP id n6so2217350uak.1
 for <ath10k@lists.infradead.org>; Tue, 23 Nov 2021 19:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=klGilqjUZU6ZdsmEtW9xvGC+xGkfpuphyvZBpG8MLiQ=;
 b=AWAjlDSuB3LCOnhqmu/VryPoQeaK3mhGhREEWvvfsTc5j1YNhwFkT+8Pgsqqp45uTa
 yh0+BBAuWZLNVr364YPujdIQtelYFg9X25eWoKA7Pki+SX8a/N+RxylRlPwwUYIqP+D2
 X9QfgeXiZmGGrZAPGrzB4dkSPwuTfD4y7Wea5mtxa+um2c1csyAtyApGT5blfYDZxUYO
 QgtWStWY646NC+hTa90YVYTzPsmBQyrfCLGooVUV5QoKLEBhSZ/LqRGdfdnI8eKYQczM
 iD6cWj3AVbKZQ9qarzZ6KFPGaqFgTUgQwc9WnqLONQQIJsInb+vbouHaDnKufVY0h40x
 EjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=klGilqjUZU6ZdsmEtW9xvGC+xGkfpuphyvZBpG8MLiQ=;
 b=4fqLnxPD6r7ZXV7RGfJZtBpYkuNHk+OYO2ZIc+huCdB4gMb6GV7j1kLYPGqAYECBlV
 LgLQIqjaFbyXdJDaLyl52vHTdsQvvjTDq5K7VH9P0BH6Kdr0sEOzt9dPZnsYvatGwTKt
 uwjH4C7nhwWHt7wv6PYuLExYiGMkzT/uqxmwB3Tj54URD+rW6smUwk0hEecFkI3Fo0Y1
 1HQi+JiyJYWVQO9bOxAXIZLUxy51Myz0F0cpl5c7X4Bhx2csEHCNdbqWCzG2pb6A7rgb
 YVZ7KyLhsvGl91Gc33fmF0FuI1QR862LjyaqQlrzNPlSez+zvtIpTx1LBaUh9vBruZB/
 LTdw==
X-Gm-Message-State: AOAM532RYaJeDD6rzKXUHdvOsAM5IXojFnu1XocfamEKsZq7ZCuQ7Af7
 N34CHVW1tMS8qPV4M+PNDq3pP8iDYqYgTH5iAno=
X-Google-Smtp-Source: ABdhPJz7DGhq8oqHGaOwKJW8EzBZqDhs2Y7wDuLhPhPq/CDuRyyctNW0yvUP4FA+VeBEUydRMAmcdhpjteTQupJhDa0=
X-Received: by 2002:ab0:6eca:: with SMTP id c10mr4698623uav.118.1637724402914; 
 Tue, 23 Nov 2021 19:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20210915160422.2839595-1-festevam@denx.de>
 <CAOMZO5AYUxJg4bWudT3L1P=qNR2UBcNR1zmjCf5O9_ExyPw4ww@mail.gmail.com>
In-Reply-To: <CAOMZO5AYUxJg4bWudT3L1P=qNR2UBcNR1zmjCf5O9_ExyPw4ww@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 24 Nov 2021 00:26:32 -0300
Message-ID: <CAOMZO5AJ8q06YTHP=p84nJnKOYU+=MKVqJ3qz3XnUGcAg0xo=g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Clean the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE flag
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Fabio Estevam <festevam@denx.de>, wgong@codeaurora.org,
 ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, erik.stromdahl@gmail.com, 
 alagusankar@silex-india.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_192644_647554_98351543 
X-CRM114-Status: GOOD (  20.10  )
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

Hi Kalle,

On Mon, Nov 15, 2021 at 3:06 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Kalle,
>
> On Wed, Sep 15, 2021 at 1:05 PM Fabio Estevam <festevam@denx.de> wrote:
> >
> > On an imx6dl-pico-pi board with a QCA9377 SDIO chip, the following
> > errors are observed when the board works in STA mode:
> >
> > Simply running "ssh user@192.168.0.1" causes:
> >
> > [   55.824159] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
> > [   55.832169] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
> > [   55.838529] ath10k_sdio mmc1:0001:1: failed to push frame: -12
> > [   55.905863] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
> > [   55.913650] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
> > [   55.919887] ath10k_sdio mmc1:0001:1: failed to push frame: -12
> >
> > and it is not possible to connect via ssh to the other machine.
> >
> > One user inspected the size of frames on Wireshark and reported
> > the followig:
> >
> > "I was able to narrow the issue down to the mtu. If I set the mtu for
> > the wlan0 device to 1486 instead of 1500, the issue does not happen.
> >
> > The size of frames that I see on Wireshark is exactly 1500 after
> > setting it to 1486."
> >
> > Clearing the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE avoids the problem and
> > the ssh command works successfully after that.
> >
> > Tested with QCA9377 SDIO with firmware WLAN.TF.1.1.1-00061-QCATFSWPZ-1.
> >
> > Fixes: 2f918ea98606 ("ath10k: enable alt data of TX path for sdio")
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
>
> A gentle ping on this one.

Any comments, please? Without this fix, we can not log via ssh to other machine.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

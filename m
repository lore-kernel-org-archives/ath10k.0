Return-Path: <SRS0=MUiD=OF=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A399C433F5
	for <ath10k@archiver.kernel.org>; Wed, 15 Sep 2021 00:04:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6C8A61216
	for <ath10k@archiver.kernel.org>; Wed, 15 Sep 2021 00:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6C8A61216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ehwq+CCjz/kB+zAtZhuAlp8apTpWWT/HG6GAsPpFFIA=; b=rOVZN4REd3gVoH
	BORy4SZnRNVRPKOoIss6kTHUQ3xbTFNSYJLPcDlpM26lTFYbIsdviZw+kAm2X12T8pYHSx2tIByJs
	gTZoyrzkvYD9LH/5y1oOXtoaQkyZHbllq04bT6uDCiCWgTz8eESMI5f81qjgUagYwglwcBPJ8Wf+D
	OTiCphvsZrF8/e41I2rmBw4hvRClYE8UMVV9mo+b6KaEdEdx3hNxFguBHHiMtxDjNu7S6YamKHR2e
	wGldJv3PQWeEzfVCSKM3Whzmq24vL6WUtYoSa/6z0q+l+bqwfyUnZuev6PNtpqPV2IE22fc6Rnu68
	RiMROrPvKX+UeCEYWu6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQIPf-007dY8-6s; Wed, 15 Sep 2021 00:04:31 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQIPc-007dXo-Tr
 for ath10k@lists.infradead.org; Wed, 15 Sep 2021 00:04:30 +0000
Received: by mail-lf1-x12c.google.com with SMTP id i25so2153777lfg.6
 for <ath10k@lists.infradead.org>; Tue, 14 Sep 2021 17:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rrb0i3CrOqHfXZi44d5xQhz/TU/wsHws6K9w0KwaZk4=;
 b=a5BTOa1TpN15iamVfg+z5MCp4yaNefjbXka6teLp6ZWJmCi6nHr6ipzy51PiNx/J9h
 ibLhy50bZZzDKvO5W3rbeHtyIBMQzFJFnj+vQxfllen/cWfrB6M9IY7Bly5EOWIMvFD/
 qKCVcXs5z/gkdjLtarXdkkftVVS82p+zXI//YrFwdaYtgHTYoXVCzd0IZ/5dHe9YtisT
 mtg+x4t9/LXGpbO8SycopNCgdOqLBsyst6cwVTab+l7ylPNkaOoO26YQvY487cOqurDy
 0XurbEqeqh+Zv/5an4aHJ0r2b1U7dV1PJgeSlIgf/vK96EcADqmNs1Potg6MhztFvUh1
 a+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rrb0i3CrOqHfXZi44d5xQhz/TU/wsHws6K9w0KwaZk4=;
 b=J36nAI2BHXVxGDHXCaNexingI+SU/TO7js0iYcSeUloSnKEFyRtz2LC4KJH0BOWOuV
 vuLs11f/m6O8kwSLuIDNevEDDkETJqbabTd7J3lO9bLhvJ0/3huNbe2XZivDgitXfRzX
 sEroe8WI585wjs6GekoK69fR7Zc2EZ9KFzl8sdv4YGT3F+Q9mpi++jdq7ht0WX16Us1O
 xD0s6GjcUG0gSRoI4F7t3YG+qfUEQ1RFUdIqO5oPQWM2c1SfxdE6lz2ARrv69thcrUea
 +jQpZeHV/HDCcumY3aI0g/yI/KnpcdfRQCbPg05lnOG8CmSr4U9Rkm24TCEG8zmlTzuN
 ix3Q==
X-Gm-Message-State: AOAM532pLTX5sQxJvUxmAPBjTJNRlSUzJnbSACiiy48Nk9HZBN9lvGS2
 EYetzdoYlZccDmOyukhhB0pOeN2qNPT0VKTBDkc=
X-Google-Smtp-Source: ABdhPJz7nP5paeSvQxWcJ39K2jYlhUAtcbwJQnUm8N0/44tFeorVrFxa9wNKI/ACiohLyPYRsBIz4Ce4UZTB2Ec2NRo=
X-Received: by 2002:a05:6512:21b0:: with SMTP id
 c16mr15403821lft.100.1631664266278; 
 Tue, 14 Sep 2021 17:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CHuYX6heA-3+jJ+wHUOBFcLsiy43E9qOoOx3WuJ_kP_g@mail.gmail.com>
In-Reply-To: <CAOMZO5CHuYX6heA-3+jJ+wHUOBFcLsiy43E9qOoOx3WuJ_kP_g@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Sep 2021 21:04:15 -0300
Message-ID: <CAOMZO5CiWXEDKt6gJAUBkPjtogrHQtBcr0e3pn1+w1JiFqrw7Q@mail.gmail.com>
Subject: Re: ath10k: Incorrect MTU size for SDIO
To: alagusankar@silex-india.com, erik.stromdahl@gmail.com
Cc: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>, wgong@codeaurora.org, 
 Peter Oh <peter.oh@eero.com>, jouni@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_170429_033201_94D32D19 
X-CRM114-Status: GOOD (  18.89  )
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

On Thu, Aug 19, 2021 at 2:29 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> On a i.MX7-based board with QCA9377 chip, I received the following
> report from a user running kernel 5.10.48:
>
> "Doing scp or just pipe through files with >10 lines I get stalls and
> error logs. The ath10k_sdio errors look like this:
> [  196.822363] ath10k_sdio mmc2:0001:1: failed to transmit packet, dropping: -12
> [  196.830109] ath10k_sdio mmc2:0001:1: failed to submit frame: -12
> [  196.836279] ath10k_sdio mmc2:0001:1: failed to push frame: -12
> [  196.925452] ath10k_sdio mmc2:0001:1: failed to transmit packet, dropping: -12
> [  196.933090] ath10k_sdio mmc2:0001:1: failed to submit frame: -12
> [  196.939334] ath10k_sdio mmc2:0001:1: failed to push frame: -12
>
> I am able to reliably reproduce the issue by sending a lot of data
> from the i.MX7 board to a host connected via the AP:
> printf '=%.0s' {1..24000} | nc 192.168.0.2 1234
>
> I was able to narrow the issue down to the mtu. If I set the mtu for
> the wlan0 device to 1486 instead of 1500, the issue does not happen.
>
> The size of frames that I see on Wireshark is exactly 1500 after
> setting it to 1486."

I am able to reproduce this locally on an imx6dl-pico-pi board with a
QCA9377 SDIO chip
running kernel 5.15-rc1.

[   10.383463] ath10k_sdio mmc1:0001:1: qca9377 hw1.1 sdio target
0x05020001 chip_id 0x00000000 sub 0000:0000
[   10.393717] ath10k_sdio mmc1:0001:1: kconfig debug 0 debugfs 0
tracing 0 dfs 0 testmode 0
[   10.405764] ath10k_sdio mmc1:0001:1: firmware ver
WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32
7746e551
[   10.640195] ath10k_sdio mmc1:0001:1: failed to fetch board data for
bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000
from ath10k/QCA9377/hw1.0/board-2.bin
[   10.664515] ath10k_sdio mmc1:0001:1: board_file api 1 bmi_id N/A
crc32 544289f7

The QCA9377 operates in STA mode.

Simply doing "ssh user@192.168.0.1" causes:

[   55.824159] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
[   55.832169] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
[   55.838529] ath10k_sdio mmc1:0001:1: failed to push frame: -12
[   55.905863] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
[   55.913650] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
[   55.919887] ath10k_sdio mmc1:0001:1: failed to push frame: -12

and it is not possible to connect via ssh to the other machine.

Changing the MTU size to 1486:

# ifconfig wlan0 mtu 1486

and trying the ssh connection again, it is possible to connect to the
other machine.

Any logs I should capture to help to analyze this problem?

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

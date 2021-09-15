Return-Path: <SRS0=MUiD=OF=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7B2C433EF
	for <ath10k@archiver.kernel.org>; Wed, 15 Sep 2021 00:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B9D561184
	for <ath10k@archiver.kernel.org>; Wed, 15 Sep 2021 00:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B9D561184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfpU/8wlDdMQ+R4Qcuqc/i1cWsfmO5OSyhh4gP2aXms=; b=woEsIuJC/A21u/
	/IiPg305iSf+kYao6K3uTB+LczluEWkc8RRNZtRlrA8krvJiT7BwHKx6IIVnbO9SWOkWvTTqMgy1b
	uK5qzFF6HAEe3pkKn44imjPs/SU2c1+5zALkqFoWqr63Ztwkeqe9wyEiP1w/mb4tG9STbUebqSAM4
	Ya3QpP9hEKv8aaTTL+Qw/YXkTu110bhqWDJREV1N+xFGyXQvG25HMsOpqneLm7aydoiskQq+luXs2
	ToU9mo3hcYpkd7pzXsjI+75q4kAXnJbR0SrboyvR+oe0fL6+2VR7bcsbzES/8X86c2PFEqQoLAs2Y
	jfLsTimWeZc965ZZtdlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQJEg-007iYY-I0; Wed, 15 Sep 2021 00:57:14 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQJEd-007iYD-Rg
 for ath10k@lists.infradead.org; Wed, 15 Sep 2021 00:57:13 +0000
Received: by mail-lf1-x136.google.com with SMTP id i25so2393518lfg.6
 for <ath10k@lists.infradead.org>; Tue, 14 Sep 2021 17:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nHrXpPpHxb8RmEqtjOabX0oNrFPU7C3TtcrOUaqGtBk=;
 b=VV7wQc92BEeCYJ7VBja4PoGDMAVqMC6CqfYl4NDmeJaYw/YrAM4uwae3iOXs5A3V0w
 k+8fp0wDxKZ4vNczkvMplY4JHQyWgghQrTa3js4AT62U9qLej4txKZX6/rl1TA/lqXK5
 yBj7MGxz2WKG57VL+QtY6/sSarX+imutB1E60xiJkkjwczSsmMRpjCDW6SEk+pb/Tz05
 d8sOcHvDRSgwgNKf5FabQ2hMrzUHWr5cIkJQP+8uCRQMN+7EMudco8pMfqA8RIxnDmlO
 jjZDTv8xWdAtrYLBFRkbALiDY5gKb5J2Y92AkC1aqepW/7wnOHc/Xt3plDe4vviLYTyD
 7zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nHrXpPpHxb8RmEqtjOabX0oNrFPU7C3TtcrOUaqGtBk=;
 b=6uPp2sZIIyi44Bi0Kp/GoQr2xp6PO/hMvy7ApDfiWWiGLzIkbIr1mZJpRjAH04p102
 5bU3fJtCXdw+ZB0FkU6b3P5H6ins8Z6w8mT31IstMKR+4bG87ip9izd6dqxpZABv2ZJu
 ibFHO2DaSpLIn9g1CLDseDPYvIghhx/p08nXyq2PUTBv5ut66q84o5+S7C5YXrQuOLJR
 NkdQL7MPdvLAfrqmVcOR7UPAfNLUxDzpuUHS+3T8Ie9pUvE6cdwkYgPWblZIYdxRnETG
 rM0QU3G9UKMpj073WslukB3MdXDuWAcIKsmLNKRAV8K7AK2C32dBIGu8TP7CoBteJPSd
 AP2Q==
X-Gm-Message-State: AOAM530c5LRf/l4xecyA0rN+b+jmgEs/pcgLd5vKUJhB7L5/pZiXPDPj
 /ZiWtVxPV2oFduVVNDFRlDhyxx/uzsPtGvghbTKKxLElEEg=
X-Google-Smtp-Source: ABdhPJwCzgKQ6HiD3TdXFGf5J1ZGdteEz9HVEndFutfTLjP46nRacoVhV0zU7zLgercywpVubkudxgTKugtkeEaN+4M=
X-Received: by 2002:a05:6512:21b0:: with SMTP id
 c16mr15546095lft.100.1631667430112; 
 Tue, 14 Sep 2021 17:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CHuYX6heA-3+jJ+wHUOBFcLsiy43E9qOoOx3WuJ_kP_g@mail.gmail.com>
 <CAOMZO5CiWXEDKt6gJAUBkPjtogrHQtBcr0e3pn1+w1JiFqrw7Q@mail.gmail.com>
In-Reply-To: <CAOMZO5CiWXEDKt6gJAUBkPjtogrHQtBcr0e3pn1+w1JiFqrw7Q@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Sep 2021 21:56:59 -0300
Message-ID: <CAOMZO5CbRjPLnnD2yHrbupMPZ90bYZOWEuN2KY5-9aN6YCYUWQ@mail.gmail.com>
Subject: Re: ath10k: Incorrect MTU size for SDIO
To: alagusankar@silex-india.com, erik.stromdahl@gmail.com
Cc: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>, wgong@codeaurora.org, 
 Peter Oh <peter.oh@eero.com>, jouni@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_175711_969498_72CF39F4 
X-CRM114-Status: GOOD (  26.25  )
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

On Tue, Sep 14, 2021 at 9:04 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Thu, Aug 19, 2021 at 2:29 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi,
> >
> > On a i.MX7-based board with QCA9377 chip, I received the following
> > report from a user running kernel 5.10.48:
> >
> > "Doing scp or just pipe through files with >10 lines I get stalls and
> > error logs. The ath10k_sdio errors look like this:
> > [  196.822363] ath10k_sdio mmc2:0001:1: failed to transmit packet, dropping: -12
> > [  196.830109] ath10k_sdio mmc2:0001:1: failed to submit frame: -12
> > [  196.836279] ath10k_sdio mmc2:0001:1: failed to push frame: -12
> > [  196.925452] ath10k_sdio mmc2:0001:1: failed to transmit packet, dropping: -12
> > [  196.933090] ath10k_sdio mmc2:0001:1: failed to submit frame: -12
> > [  196.939334] ath10k_sdio mmc2:0001:1: failed to push frame: -12
> >
> > I am able to reliably reproduce the issue by sending a lot of data
> > from the i.MX7 board to a host connected via the AP:
> > printf '=%.0s' {1..24000} | nc 192.168.0.2 1234
> >
> > I was able to narrow the issue down to the mtu. If I set the mtu for
> > the wlan0 device to 1486 instead of 1500, the issue does not happen.
> >
> > The size of frames that I see on Wireshark is exactly 1500 after
> > setting it to 1486."
>
> I am able to reproduce this locally on an imx6dl-pico-pi board with a
> QCA9377 SDIO chip
> running kernel 5.15-rc1.
>
> [   10.383463] ath10k_sdio mmc1:0001:1: qca9377 hw1.1 sdio target
> 0x05020001 chip_id 0x00000000 sub 0000:0000
> [   10.393717] ath10k_sdio mmc1:0001:1: kconfig debug 0 debugfs 0
> tracing 0 dfs 0 testmode 0
> [   10.405764] ath10k_sdio mmc1:0001:1: firmware ver
> WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32
> 7746e551
> [   10.640195] ath10k_sdio mmc1:0001:1: failed to fetch board data for
> bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000
> from ath10k/QCA9377/hw1.0/board-2.bin
> [   10.664515] ath10k_sdio mmc1:0001:1: board_file api 1 bmi_id N/A
> crc32 544289f7
>
> The QCA9377 operates in STA mode.
>
> Simply doing "ssh user@192.168.0.1" causes:
>
> [   55.824159] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
> [   55.832169] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
> [   55.838529] ath10k_sdio mmc1:0001:1: failed to push frame: -12
> [   55.905863] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
> [   55.913650] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
> [   55.919887] ath10k_sdio mmc1:0001:1: failed to push frame: -12
>
> and it is not possible to connect via ssh to the other machine.
>
> Changing the MTU size to 1486:
>
> # ifconfig wlan0 mtu 1486
>
> and trying the ssh connection again, it is possible to connect to the
> other machine.
>
> Any logs I should capture to help to analyze this problem?

If I clear HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE, I don't see the error:

diff --git a/drivers/net/wireless/ath/ath10k/core.c
b/drivers/net/wireless/ath/ath10k/core.c
index 2f9be182fbfb..728a18b3b462 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -730,11 +730,7 @@ static int ath10k_init_sdio(struct ath10k *ar,
enum ath10k_firmware_mode mode)
  return ret;

  param |= HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET;
-
- if (mode == ATH10K_FIRMWARE_MODE_NORMAL)
- param |= HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
- else
- param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
+ param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;

  if (mode == ATH10K_FIRMWARE_MODE_UTF)
  param &= ~HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;

Any comments, please?

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

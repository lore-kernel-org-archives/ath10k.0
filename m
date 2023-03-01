Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E278C64ED6
	for <ath10k@archiver.kernel.org>; Wed,  1 Mar 2023 08:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OHR8BLaUmhhtKOcURXuTCCDfxmd27E2svUKkh2Pvvc=; b=1c2THnZpJUdqAN
	+NcIhIUxs3ghNMgAw+MmmkD8NpWCmGHfv+lOlu0jp+eg+LD8LjsBm4L1RftHUGB4S/gqU6bAd2SY1
	8+WdNywAPvYonWMV+2Sa7Q1EJJ+DVE44WerDN25y5j4sj03NstgprfZQ1MziBGhlFaUEPw7ix5BRT
	JYtz1q3b4h2NxLjayp5L9xeX0oBxjmgVJf0aB5vd/f1L8jqyjeMrmFlG7rYtWfHiF4SJ2PUf3l9AP
	mdQW7snEgi4oo4iMUE5jC+CqOZYM3KhB8JOtLBDrg/mvoR+m+MAwiQEEqPxSSgohod6V3jpjAFLsb
	pmKl2JnKZb+Bk+A0ixJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHf0-00FR66-Ru; Wed, 01 Mar 2023 08:18:02 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHew-00FR3V-94
	for ath10k@lists.infradead.org; Wed, 01 Mar 2023 08:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677658678; x=1709194678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FWeHY8fcd0cSFhXWZizDGcsqg2Tv5UalzCBsb0/6y80=;
  b=NjYiJEGH2EwIOuEEKLYwlK4fXIor2PFjGvhCxDx3evc9grlKOfwb2QxQ
   G9xbzOIk56AoWO+FiRzNbZ33wNMeMBf84/02x22PJV+/McCPHWz7I/yzw
   +9FExOJQVrQm5TLEyHo0NfBX+ByKIlsYy58y8cP29mpeAhWmtqnSkssT7
   Xsk7gsqaLDBos7qQ+KhcSvP/Vd+/jYJgIeZIIutDmDfHR22Gej96pnRXw
   /793XMR1T4ywQFqlVl2HUQmY7iirW3PDpCUZUA5YPlzqgW264nRNUhrny
   UfU8jWJ1tW843LZZK6lLKfC88sSd8P0LZ34l6jX+fVNqiIznY5bBmND28
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673910000"; 
   d="scan'208";a="29386920"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 01 Mar 2023 09:17:53 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 01 Mar 2023 09:17:53 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 01 Mar 2023 09:17:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677658673; x=1709194673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FWeHY8fcd0cSFhXWZizDGcsqg2Tv5UalzCBsb0/6y80=;
  b=kZhKxr2QOBN2csBA+goakWFRKF/A9T46K1hKy1/8Z0U0/u6xAh8UfOcB
   I2WNX/82iVZcqbMnj12R84pirzVH5PPJE0jYTrBRD0mFuv/RDoAQwNR7S
   c0djQ+XxTvuQt+U6mzoZjohZNAt5f/79wNE68DzEhlvgn2j6Ii5GBNEi9
   8U3mGLUQWPSWf7OfKms7Nbtw+kQDJeTlXAzQj4HgVmC50kwehLjcXm5wI
   NOCVjNWBLyl9cGSnFhhe9mOlRkLmx4nc8LAQ9mXsJh0V7POvXZ6b+iptq
   1zyD10DyKpsKigiEcznoQwcZ9vFYCtPAuYrE861Pmk/+m85hzqmwe82fu
   A==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673910000"; 
   d="scan'208";a="29386919"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 01 Mar 2023 09:17:52 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6BDB8280056;
	Wed,  1 Mar 2023 09:17:52 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Matthias Kaehlcke <mka@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1 00/15] create power sequencing subsystem
Date: Wed, 01 Mar 2023 09:17:50 +0100
Message-ID: <10237323.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAA8EJppuGbDGb1D-yf2WL77U1bqx1QQStQeDArWmGFCUiOtnww@mail.gmail.com>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org> <Y0hr9XTGAg8Q6K6y@google.com> <CAA8EJppuGbDGb1D-yf2WL77U1bqx1QQStQeDArWmGFCUiOtnww@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_001758_738030_AF15A3BF 
X-CRM114-Status: GOOD (  37.21  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

sorry for being late to the party.

Am Mittwoch, 19. Oktober 2022, 08:03:22 CET schrieb Dmitry Baryshkov:
> Ho,
> =

> On Thu, 13 Oct 2022 at 22:50, Matthias Kaehlcke <mka@chromium.org> wrote:
> > Do you still plan to refresh this series?
> > =

> > I know there have been multiple attempts to get something similar
> > landed in the past 10 year or so. Your series didn't seem to get
> > much pushback from maintainers, might be worth sending a refresh :)
> =

> Yes, I hope to return to it eventually. I just had no time for it lately.

I just found this thread while searching for power sequencing devices in =

Linux. From what I understand this is transforming the existing mmc pwrseq =

drivers into generic ones. What is the intention of this new subsystem? Wha=
t =

is it supposed to address?
In my case I have an LTE module attached via USB, but in order to use it I =

need to perform several steps:
1. apply power supply
2. Issue a reset pulse(!), the length actually defines whether its a reset =
or =

poweroff/on
3a. wait for a GPIO to toggle
3b. wait a minimum time
4a. device will enumerate on USB
4b. device can be access using UART

This is something required to actually see/detect the device in the first =

place, thus it cannot be part of the device driver side.
Is this something pwrseq is supposed to address?

Best regards,
Alexander

> > On Wed, Oct 06, 2021 at 06:53:52AM +0300, Dmitry Baryshkov wrote:
> > > This is a proposed power sequencer subsystem. This is a
> > > generification of the MMC pwrseq code. The subsystem tries to abstract
> > > the idea of complex power-up/power-down/reset of the devices.
> > > =

> > > The primary set of devices that promted me to create this patchset is
> > > the Qualcomm BT+WiFi family of chips. They reside on serial+platform
> > > or serial + SDIO interfaces (older generations) or on serial+PCIe (ne=
wer
> > > generations).  They require a set of external voltage regulators to be
> > > powered on and (some of them) have separate WiFi and Bluetooth enable
> > > GPIOs.
> > > =

> > > The major drawback for now is the lack of proper PCIe integration
> > > At this moment support for PCIe is hacked up to be able to test the
> > > PCIe part of qca6390. Proper PCIe support would require automatically
> > > powering up the devices before the scan basing on the proper device
> > > structure in the device tree. This two last patches are noted as WIP =
and
> > > are included into the patchset for the purpose of testing WiFi on new=
er
> > > chips (like qca6390/qca6391).
> > > =

> > > Changes since RFC v2:
> > >  - Add documentation for the pwrseq code. Document data structures,
> > >  =

> > >    macros and exported functions.
> > >  =

> > >  - Export of_pwrseq_xlate_onecell()
> > >  - Add separate pwrseq_set_drvdata() function to follow the typical A=
PI
> > >  =

> > >    design
> > >  =

> > >  - Remove pwrseq_get_optional()/devm_pwrseq_get_optional()
> > >  - Moved code to handle old mmc-pwrseq binding to the MMC patch
> > >  - Split of_pwrseq_xlate_onecell() support to a separate patch
> > > =

> > > Changes since RFC v1:
> > >  - Provider pwrseq fallback support
> > >  - Implement fallback support in pwrseq_qca.
> > >  - Mmove susclk handling to pwrseq_qca.
> > >  - Significantly simplify hci_qca.c changes, by dropping all legacy
> > >  =

> > >    code. Now hci_qca uses only pwrseq calls to power up/down bluetooth
> > >    parts of the chip.
> > > =

> > > _______________________________________________
> > > ath10k mailing list
> > > ath10k@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/ath10k


-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED37C7EE2A
	for <ath10k@archiver.kernel.org>; Wed, 25 Jun 2025 21:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8403cEKgjhhrx1TsMbshffovgr9tyzdkU6aIUKCINXk=; b=Rm9ePEoQgJ4Ii+bZq7LxJQJsw/
	Mc0OcBHtcze/j1bYTW8Fb+Zdp1fSfKfJLsXaQU8CagLf9zLQQJmdBalLhr+nMXa31PND9Ou96lCPb
	5bUDCrkRh/4zWzo2MuiUBv35mGkUfPg/f/rdC/pCkL+PGVgL5Mq2xWWcyevICn8iUBeo+iVtKlqp1
	Q4vypDQ5Z3XABc827aHGMrXySuJieWn5aGPm9UOogvD342p3sWNOC/NBUU+z0f4SF6PxbU0rnjItL
	eJXaa7waFxgvMfTuI+lh92Z7TVaU9RxEICWXcId80nz+CkXE8q2/uxPRxkJ6m165hvoM8/2A3aYf9
	JwlkY3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXpW-00000009ygd-3ypa;
	Wed, 25 Jun 2025 21:38:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVdH-00000009jRh-2rNv
	for ath10k@bombadil.infradead.org;
	Wed, 25 Jun 2025 19:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8403cEKgjhhrx1TsMbshffovgr9tyzdkU6aIUKCINXk=; b=axSkCMNFrgugUIu5qwlHiFgCff
	1mcKq5U3wjEhPdOT7dsaCO2rpwgDj8zYSAXQdBwwjpceGfSYTGnMwqTSzgx6QvkZVX7T4g2hI0Wx6
	/wA6hw9cqV1DGRq0OZl1qTNUSguVCKvdIUhnC0bjPx2GaSOg9ru0MqPQZ9FpmvVJx8bzXSREHolum
	R6seyoyKYfELDA99fC5W1M84vg/rqXdnJs3i83ajmqD7raDu2vj6rUOYFu5kbw2fO20hsSu+ojrgv
	t2EVMbWgr9IHNCRB87yfVyhqtiLZ6NuQNK1Y876jOkZEsniYaL8UII6mL6TRSHoI1yS/QXXHuMmqu
	vE7HZKcw==;
Received: from mail-yw1-x1141.google.com ([2607:f8b0:4864:20::1141])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVdE-00000005xNc-19pA
	for ath10k@lists.infradead.org;
	Wed, 25 Jun 2025 19:18:06 +0000
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-714067ecea3so2415687b3.0
        for <ath10k@lists.infradead.org>; Wed, 25 Jun 2025 12:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750879081; x=1751483881; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8403cEKgjhhrx1TsMbshffovgr9tyzdkU6aIUKCINXk=;
        b=m4eDhlhNqlqqk6PtsM3wIZXQUUwfHgSjeN3VyoSXOMipHERU3X89/43G9t/TuUYef4
         vdgSmWIyGEbM7QIYrTcP9ZYviIITN9bmBN3vsWtkmGUDcs3VJIh8u2q0Th8qSdPhxxZF
         3vbQBaNpBoHAuFs+d6IQk6Bqu7UF8tUFFGyvHx8A5EJJx4YYgu8TqwrbKfwR+udOLJJQ
         dete6jo73+pQig/BgV7VhrK3swSAAa63SBHToMYSdq3A9/+XNu5T95lScHoVIkqPq2h6
         i7eKxLr2MXQx6YL45fv388FIdDcRGXMIxgHIP2At2+JPzG+xU6VdlBkNteQv5njfPQsb
         rb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750879081; x=1751483881;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8403cEKgjhhrx1TsMbshffovgr9tyzdkU6aIUKCINXk=;
        b=nFU5tTqMHNi23Tmq1a6d8UNJ7/GPAxF+Aa08aSWNMXt0BBBN37wfKNTI4NCydo/mc9
         WdzMUHuwUhNozUsUiXg52ztjrlDLNUSrCc3m63n9OJFJ7UgumicGOySSor4UE1OnWE9C
         89bpebxclzxtkwDAAYsM5j3jshPmML8gGnso7gjBbS7/5TnPRYD0wh34ybTbWX1gkgdX
         LcddTYBP4GWXBmZg9Fy2ytmLVfJxHJD99/H6WTOeI0yJDPIDcBdRCFOASf/tu3aPGfTr
         Tc6BNU/ffp+fwtTLlVU6GwYoqBuJR8T+xRlZ5xfKIi0FrZ+uGBy3MQd8Ae3oioMdEbda
         NU+w==
X-Gm-Message-State: AOJu0YwuLgumTnYCtahpuF5LXtpwYpiv2i418mfm4oAwh74Jx7wMAD8a
	54JViBXvMOy0yG1MaYaWPdz6a8j25IVYLw1Ex4+LeNs+uroQgt3SBs1KUFDlBM9sTYaPodKZ7Bk
	gsA3lYyUKdyhuwR4CsSxEPnG/C/zhbvk=
X-Gm-Gg: ASbGnct2px4Shqo1vouO+HCcgVOg+cMGPVgrfH6xob77VgTKlfXBdAg2VIBXxJHyK13
	L3OBHrrdhyr0j6xwkw+Q4STRj22CnypO6m6Lv75dPXKoRf8+5BiYsFc7OqHQP4/1BTlugtnCmq4
	jiSSAeCl4fHWBvNZb72aipxTtsD95b/3KoIGTKIF/Aa+0tyQ==
X-Google-Smtp-Source: AGHT+IEBJ1HQs0iJN6i2v3yoEYIATq1lJulVqezGwirJwda+5IVis0IKTmDBeXLkkfhMuPo/Gu6h1RQpTOE45CdVKtA=
X-Received: by 2002:a05:690c:3804:b0:714:13:357a with SMTP id
 00721157ae682-71406db2354mr62440497b3.20.1750879080340; Wed, 25 Jun 2025
 12:18:00 -0700 (PDT)
MIME-Version: 1.0
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Date: Thu, 26 Jun 2025 00:47:49 +0530
X-Gm-Features: AX0GCFvRn0BDXlBswPH6d5ky9QP8oDFSJMjA4U3BLjHSMHUHJF7QbU0sAtdUwJ4
Message-ID: <CAEmM+Qi-Waxk5qcR+nfip-QGXaKk0-Kq7QSq890e9oYOPjW+bA@mail.gmail.com>
Subject: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
To: linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_201804_617244_62DD18D3 
X-CRM114-Status: GOOD (  10.77  )
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

Hello,

The following is the original thread, where a bug was reported to the
linux-wireless and ath10k mailing lists. The specific bug has been
detailed clearly here.

https://lore.kernel.org/linux-wireless/690B1DB2-C9DC-4FAD-8063-4CED659B1701@gmail.com/T/#t

There is also a Bugzilla report by me, which was opened later:
https://bugzilla.kernel.org/show_bug.cgi?id=220264

As stated, it is highly encouraged to check out all the logs,
especially the line of IRQ #16 in /proc/interrupts.

Here is where all the logs are:
https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180
(these logs are taken from an Arch liveboot)

On my daily driver, I found these on my IRQ #16:

  16:     173210          0          0          0 IR-IO-APIC
16-fasteoi   i2c_designware.0, idma64.0, i801_smbus

The fixes stated on the Reddit post for this Wi-Fi card didn't quite
work. (But git-cloning the firmware files did give me some more time
to have stable internet)

This time, I had to go for the GRUB kernel parameters.

Right now, I'm using "irqpoll" to curb the errors caused.
"intel_iommu=off" did not work, and the Wi-Fi was constantly crashing
even then. Did not try out "pci=noaer" this time.

If it's of any concern, there is a very weird error in Chromium-based
browsers which has only happened after I started using irqpoll. When I
Google something, the background of the individual result boxes shows
as pure black, while the surrounding space is the usual
greyish-blackish, like we see in Dark Mode. Here is a picture of the
exact thing I'm experiencing: https://files.catbox.moe/mjew6g.png

If you notice anything in my logs/bug reports, please let me know.
(Because it seems like Wi-Fi errors are just a red herring, there are
some ACPI or PCIe-related errors in the computers of this model - just
a naive speculation, though.)

Thanking you,
Bandhan Pramanik


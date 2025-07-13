Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C908C83F1D
	for <ath10k@archiver.kernel.org>; Sun, 13 Jul 2025 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0l/VqiYxdBHMF99eNFwntJM2bY7LDqgmFNd0DnCAi4=; b=rvQSaLFqnCllM/UGsY7IN8UJ2Z
	nEm63rwA+r7m9pgZcVEhx1+hivkftIerce65iNBzR497DIkXZ2Rx4/kY1rPB3Bcdn+KYJNpC2X/mi
	UN+Mq4diNUXl9S5NxozSodi7UPmSVxUhLj7AvPT53H692MFIdT8DPd+d2/jP2y7imhyY9RCJgX9E/
	XgP/rBBWT/lzpY/dQjAxagh1QGMyAzh/cw1DeWRm6FxxZHj2VzmDCtQZ4q5Bq4wr25QO5MjAsTdVf
	AK5yhZRgz3KIotT3JOis4X05ztOZ6Y5tEAb0dNLQK1feXVmDBW8X/wJr4VqRBU8ZEj4P9AEnsTC1S
	wKv/FArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazCM-00000000MLI-1SgB;
	Sun, 13 Jul 2025 16:05:06 +0000
Received: from mail-yw1-x1144.google.com ([2607:f8b0:4864:20::1144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazCJ-00000000MKn-3Bwy
	for ath10k@lists.infradead.org;
	Sun, 13 Jul 2025 16:05:04 +0000
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-713fba639f3so29896377b3.1
        for <ath10k@lists.infradead.org>; Sun, 13 Jul 2025 09:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752422702; x=1753027502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0l/VqiYxdBHMF99eNFwntJM2bY7LDqgmFNd0DnCAi4=;
        b=hc1AW6+VYLn0HMMZa2GCHmcKm09dRifOUOc46kRP1zBiYHNW6Iz5z0si5nrMZH1M91
         ZiOCqCLfvGaZCOfVDfuoiFswtzIJ7WhQVQJONRPcoc22HAGLWGDfojuchUZGoF065o6T
         KoB+6L5/YFyh/Cc38a0seF37kqBA5x/EUQGm0/Nqv+xKd9lZ6vPejDBjZ0tHbXg32jWD
         pbxXGYOcgoHeueJwJ4OrRjqP/y09nphgZunLpp3nZPs7NnfJLGaOnV5L8UzBopwJXFD8
         LPcUEmY0RJfVHNznMBg3C9lXNbid5Gwwt+R0aA0DU3Gimi01ZAAvfOF8zx18Bm08ezGe
         OBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752422702; x=1753027502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0l/VqiYxdBHMF99eNFwntJM2bY7LDqgmFNd0DnCAi4=;
        b=pdUBBxrcBa2n2a0p7kIKcLp4ZsO9RMO12eFk7a4K+9k3vVL/T38b8VvF61qFf7qT/6
         +BCTFUJG59Jgcn8oWCAub3r+TmND8OpUPXQVFlQ7EjQcAa5/+FoggWDHbG6Y6aCOqyiS
         vzMYaCqFnSsIs4iAKyy6KtH661hHhADlEPjapJKi9IW5WLf9G3UYv4pYB4LA6kPF8va4
         XX2qu67mgnU50fNjK94AApvriR/5FL7Asmwjs+MPcB/emQewxF60gPWQvOohtkUrsERA
         t7ZS2s96PDI/RAE+Pfq2IBZ7q+lVIy5O2ohyFqWNR/gxyleVmCJPEEYnoR34vySw1m45
         p/9A==
X-Gm-Message-State: AOJu0YxlvWv7JZZ+SAhkETAqaYFKB75BmlbIwqGOfXG37LouaLTY6m2a
	GWRizgGlB9SxODdfgbAjTc5ef885/02FbJypVif38eA1QSUmP7ofq1wa5RpH/XMBF5/9ICbqTGU
	wPuX1SK6zSY5PBCKNdqPXHhovcNMQ+/A=
X-Gm-Gg: ASbGnctFPYsyXep9qKJxWVo/u0X1SgKS5zgk1rk9d6YwntXdyDpEy/JtsN2FS1oZ/Pw
	sEPGH3El66XSjeTwAonsLBADPTq5Us54tRPL+Xg9zXJDkXjXc3Wtx0UrEcbG3cgJhOFeqYcHutv
	BnS9JdgaOenCzPwdm/Je1ocJbF0khEpdGqg41+Ep+i8MvEPqGQVe/xzG4aKPzs03O4JsT/O3SMN
	nVruJoQwQ==
X-Google-Smtp-Source: AGHT+IH2LeIiglYC9Tun6YOS0JGqjbS6y7L8l2v4pYn+yw4nEo+noWt27UHB4T0XUvebiJpgOLMtt6+dbcW6ZN3bMKI=
X-Received: by 2002:a05:690c:6713:b0:6fb:b1dd:a00d with SMTP id
 00721157ae682-717d5ee1ddbmr173765917b3.30.1752422702009; Sun, 13 Jul 2025
 09:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAEmM+Qi-Waxk5qcR+nfip-QGXaKk0-Kq7QSq890e9oYOPjW+bA@mail.gmail.com>
 <20250712191805.5238-1-safinaskar@zohomail.com>
In-Reply-To: <20250712191805.5238-1-safinaskar@zohomail.com>
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Date: Sun, 13 Jul 2025 21:34:50 +0530
X-Gm-Features: Ac12FXxwluBZCmPP36mlKAZmIh6T5KqX9xngXXsjA_2HI0FsRYjIiDSQjP17RPs
Message-ID: <CAEmM+Qij=SYXmt=Ea+gK3jMoeY=Sn=0QD17q9jn5YS0BupbXrA@mail.gmail.com>
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
To: Askar Safin <safinaskar@zohomail.com>
Cc: ath10k@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_090503_820276_2FF78422 
X-CRM114-Status: GOOD (  14.19  )
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

Hello Askar,

I appreciate your response. However, we're mainly trying to find out
exactly 'why' this problem occurs. You might say that it's some kind
of "Root Cause Analysis," so that this error goes away from the
Inspiron laptops once and for all. If you keep on reading the messages
in the other thread, you'll realise just how deep this error goes.

But still, thanks a lot for the response.

Bandhan

On Sun, Jul 13, 2025 at 12:48=E2=80=AFAM Askar Safin <safinaskar@zohomail.c=
om> wrote:
>
> I saw problems with Atheros on my Dell Inspiron, too.
>
> These instructions helped me to reset the device without reboot:
>
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1730331/comments/40
>
> I used modified script based on the one above (run as root):
>
> set -e
> rmmod ath10k_pci 2> /dev/null || :
> rmmod ath10k_core 2> /dev/null || :
> rmmod ath 2> /dev/null || :
> { echo 1 > /sys/bus/pci/devices/0000\:03\:00.0/remove; } 2> /dev/null || =
:
> sleep 2
> echo 1 > /sys/bus/pci/rescan
>
> Try both scripts, one of them should work.
>
> If still doesn't work, try to run original script, then do hibernate, if =
still doesn't work, run script again.
>
> I finally was able to solve my problem by replacing Wi-Fi adapter. :) Her=
e is my new Wi-Fi adapter:
>
> [    7.136347] iwlwifi 0000:03:00.0: Detected Intel(R) Dual Band Wireless=
 AC 3160, REV=3D0x164
>
> --
> Askar Safin


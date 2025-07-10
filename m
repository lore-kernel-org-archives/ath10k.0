Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039FAC83F22
	for <ath10k@archiver.kernel.org>; Thu, 10 Jul 2025 20:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/CJm8Q37Va3Ls9gDwlRWmfbEFB9jggb2Srg/9czkzM=; b=anwYIPmdIGuUzY7EwjyVaGHMHd
	PLhktJ1W7vsQBzNQkUPo+PR8CJ9iW208sJqzXNVDwntIr2sYgBB4t4QF8nMDZNyU9+6hcv8KqfliB
	bG85VLGjatn99vgXs/Fbq/7vEF1oYsvZBOozE7mUrjdNHp+y/BUDUk/jr163pzVNSgPPOmrXsOJf7
	8FmDZ0EI8Tru787j85IaTueBLDlNawKSSP931dDTgYSxBxBlAFrLqyDLYcYWtYrzxAZ/rO1vqyuKD
	94OIlv+qaQuKxEaFQMxJ7Mc3SIiVF7iYktvkazgaqyaZmnGKgK6BxyLn3aNAxCAAxOnI70yFZOgL0
	KWNK0i5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyI3-0000000Cz7S-0aPE;
	Thu, 10 Jul 2025 20:54:47 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwbB-0000000Cm9Q-3aKX
	for ath10k@lists.infradead.org;
	Thu, 10 Jul 2025 19:06:27 +0000
Received: by mail-yb1-xb44.google.com with SMTP id 3f1490d57ef6-e84207a8aa3so934943276.3
        for <ath10k@lists.infradead.org>; Thu, 10 Jul 2025 12:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752174384; x=1752779184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/CJm8Q37Va3Ls9gDwlRWmfbEFB9jggb2Srg/9czkzM=;
        b=H0/A+70T0atpbyOyJumOyLfj/zR8ZuaIf+wyJQqb0h7Es/zyZMHX/P1L7k6kcMg0ZR
         7GBqmQnpOROoRfmwYJbhqSwESDsDHZ+HIQqhkHNOnKQhvYjULehns3qzDIfy2GvuOrG9
         jdStIcMWk6E/8R65YchiuGCBUjmemT+5QNTHVEfKeGtKwrkvADrYgMvDPVfGr7w8Zv8e
         qvtM1/HvSr5qboc5r0kl0LFBC3lSMdprU97WHk7WxGIYIAdXXs97sOt9m9kWM5fyv35v
         9yEfGQ7LlaysTWN2NGCaFG6/qStJxzKaN7JVR1BolQyJbVkMm+0Wnyqty0Ayrxc1f8LR
         aXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752174384; x=1752779184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/CJm8Q37Va3Ls9gDwlRWmfbEFB9jggb2Srg/9czkzM=;
        b=JAQ4lpzP64Urnp96ex/X7o5GbDWg9PnVKyOZgCQlK7XjpRMvguaF9kvmHP/R1+W7iT
         rijj0iiytPuoZG3Ze0+o9vzbv/FeXjRgvFZ8APDUey21heSCPaHwkI2gdg9tJ4DMHwph
         q19TJKF6WXvNsoz/07oZ8dKLOb6TLjhrJL9x4xODJFI/YxMIvd/QCpAsrZplshhET9yA
         qOfdFX80PRDHkHScQ+TXn8AafcopyoL8e1NVduZBUJVPcPukMe4gaJFH+T31FFCoU+4w
         MvXaQJMewVsvnATcA1rPYl6SVxnzj1p5BlhqJyo1D0s6eDDouPxKEkE1uotfSiUJtbGm
         zNmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxfojYH2LnV7NPKqEJsVgTOb/k+JFR7zw3rBjqu+MoqjllRo8ffte8McMjmHvRfvXx13Pdj3o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbzVei776njwoOXO8UYuS7y2zNa+dKuUpafezNpFRo82lhWEAc
	o74aUg9g1Ph4fTLx2m62lg814sCNqjHYAdTAU45QzjTJmWVBd9WUfPz1l6gJF2OLAiAgU0eofn/
	o9JKvLVRl/kiw+3cIDMqo+ksQKoTULY4=
X-Gm-Gg: ASbGncv6Or5CQtuDJO2ap1loOIBxd8drdirTetfTBNcKQB5jbsYcJDHWgjQBTQJEjM0
	MrwhWx7WwQATd306pWJoaBZBnpoM1CUhwkq0M/+FchxvdVsE+GRY7dFUMkZihnNsZPypYkCR7q4
	1uMEBlYMMyGkVg+tGHPNtcbUjWjq2Hiayu/kC4P2qEAGz32A==
X-Google-Smtp-Source: AGHT+IH/La36AZil68VOGEY6oXvInjSrZkyqxX4Csk+T+jPPRq31W1rogvQyxXSOBTCvOC1EsXl5hSyqgohVEvW5L04=
X-Received: by 2002:a05:690c:38b:b0:710:f39f:4d66 with SMTP id
 00721157ae682-717d78b6564mr4126457b3.13.1752174384216; Thu, 10 Jul 2025
 12:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250705195846.GA2011829@bhelgaas> <9D9D9375-1BD0-46EA-9E85-47A2D8325F98@gmail.com>
 <2cq6jeywii5fscozazz2epugh6zflcpfbo4ffhjt2lyk76cq4m@vg2jcsmlhtho> <FB89ECA8-93E2-4015-8DCF-6D362A53D825@gmail.com>
In-Reply-To: <FB89ECA8-93E2-4015-8DCF-6D362A53D825@gmail.com>
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Date: Fri, 11 Jul 2025 00:36:12 +0530
X-Gm-Features: Ac12FXyPTlLwATY_CErqME9P_iG-GcCgUwb6H3kdzCI5TuYyYXv0SfmzVne8uYY
Message-ID: <CAEmM+Qj=TA=WtQAXQZx6wCUpdsOQ4j66Kpyze3KNZHC79KfyRA@mail.gmail.com>
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_120625_889923_EBFBBC51 
X-CRM114-Status: UNSURE (   9.33  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Ok, we did it. Could reproduce the errors properly.

Here are the journalctl logs:

Kernel level: https://gist.githubusercontent.com/BandhanPramanik/ddb0cb23ec=
a03ca2ea43a1d832a16180/raw/a9e93c4ba41fb0b3d7602e6bfddce9aa5f3a19b2/KERNEL%=
2520journalctl%2520v6.16-rc4
User level: https://gist.githubusercontent.com/BandhanPramanik/ddb0cb23eca0=
3ca2ea43a1d832a16180/raw/a9e93c4ba41fb0b3d7602e6bfddce9aa5f3a19b2/NON-KERNE=
L%2520journalctl%2520v6.16-rc4

Just so you know, I have used v6.16-rc4.

Bandhan.

On Wed, Jul 9, 2025 at 11:00=E2=80=AFPM Bandhan Pramanik
<bandhanpramanik06.foss@gmail.com> wrote:
>
> Hello,
>
> I was actually a bit distracted by the things caused by the Automatic Par=
titioning of Fedora. I'll inform that in Fedora Bugzilla... anyway.
>
> I realised that making the modules will take 8-9 hours, I didn't even hav=
e much of a success (because all the modules didn't properly load, particul=
arly the firmware-N.bin files couldn't be found).
>
> But I'll try to recompile the kernel, I'll just have to give it overnight=
 time.
>
> Bandhan


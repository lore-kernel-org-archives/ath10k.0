Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19423C7EE2A
	for <ath10k@archiver.kernel.org>; Wed, 25 Jun 2025 22:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Odcr2IXToJcH3WZvPRdy6npsgtwYiC3dZ0TLDI/R+kI=; b=CY/oaN8rn0kTYvgNxjoOClCzqH
	ynZnJaxB+cRq9/WzxBnqtnNnkkHVTgkxSRd8GgPQ58tq6MgK7zGaPjX/oiTvFIAvWKiZkW59tGC/I
	S415fALc5h/U+WZfLrVY//xpRHqNMKni3YdbHFn7s3xWObHlY2xAjvNBOQYeD1MtcIOwAriHbs8MF
	wyTy0rZEq366V9y0GHZkiGdCuEf721W3zThkYoqeaHSMjbAM/pYyiPyiJmq3+ZKbcCfOrIljv/26N
	Kq6nnHrk3u2UVSDoMAL7Uft52Jwp9MzE/2/wgKGeRrB0vIIA6Bui0C7ujgCinW1dnS/zvt8nK047C
	M/v8hOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUZ5A-0000000A8q1-1fGq;
	Wed, 25 Jun 2025 22:59:08 +0000
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYwj-0000000A76i-3y2D
	for ath10k@lists.infradead.org;
	Wed, 25 Jun 2025 22:50:27 +0000
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-711d4689084so5081757b3.0
        for <ath10k@lists.infradead.org>; Wed, 25 Jun 2025 15:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750891824; x=1751496624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Odcr2IXToJcH3WZvPRdy6npsgtwYiC3dZ0TLDI/R+kI=;
        b=GF6QGqGLDqPUQxZl7qeIfk45zuELqMOMGjEUXcRjBPYIjYCP275xTf0fisFcA1gVVp
         1YcU5YY0oZV60cO4BkmXyjC58t4rowCUTKihGZOMEnXLE/yIp9SFW0rJSb24E/fMKA4T
         XU7iEIhNZYozov4OK7+5aiFxtAvpnhhYb/ka1r3pXP2vrub70iQ0TacVIAjrH2RgnWyR
         NfsG8F5pLpH53ZuxFwMxJi8S/jSkwMeIAjbWoms8QSnUM6+7s6NBhtk7j/OAnB2LV8ON
         nh5GyOnVFzJoj6SftpqQpMvfXN1OrVUXdh+y9yWYtiG6H7hb7kriB6zfMyTymcOjI8YV
         zxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750891824; x=1751496624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Odcr2IXToJcH3WZvPRdy6npsgtwYiC3dZ0TLDI/R+kI=;
        b=qaOhaKoWHKdfkeq6vNWejbR+ApzZBdhySp1QOmDHTgSzdmlHL4nUcwEe3DEH5GhPab
         6XCBotK1rMfFNnOANFBQTaIzqz4qpNN9wN4jBVcwK4UfoqEnFOtQK63GXBBA3HDlqCXb
         RXPOheqtOHDAcbyPdsQO6AmS7BJ/L6lLb0d2NejngSONWTohlfDj4MELI10HtwSgUN1L
         oKvrEf+QpEEGHRzD4+a9AJpl1gitvpdN4JF+SUPx9kep/iErXP8K66+rq9JStgWzVWAZ
         5V6e5aSCKaS6VwmSmnwbO0dJ8s681KF9oe1zIxNsubZNGE/xm7n4Zw+Y6ozfdA8CGOVU
         kKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN2X+eR6CuiniIIodCM56Za2BcfkWkerL1D28CbYoaEfo1yjLIwwaXjBBzNUS5ErqM7uEnd5I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj2KJ0EASTiEBosVnk0c+tDuHBFfiTy5ABQatBgaqzu9hLIqGa
	feBkVy3XFbYwuBNlGr9gPPQGb6Wq5HgehtgSqGZ9RHtvbrcNJ9WHLoUIOWwHxamPqLQCqZ5/P0U
	ifz70VOMTwm6iFGASQ2g5aYy+EqTVC6I=
X-Gm-Gg: ASbGncuZxtjzSd9RYBCnaHPmXgX5Y+5TSkR3pSwEf6kQRU60ork6xRmAAeGpYOblx2h
	DLJCaK4aoolA/XhR//1bRU0c0NQ6FOqYMN+/aXRbheL8MMUjv5vkxDJz2zr/zU3yxRYbPke0QZp
	BNmiIUxqYBLFK+HpQORjOkBvP3ADn2rLeUz5MW+4GVCE6bOA==
X-Google-Smtp-Source: AGHT+IEWMzRYVR/8DjIj8kv2lGIl6tYWdeN3jHUuAkZgA1ELBZpMVFlCSRuAVegIdJVWaHMWkrlVbvNBmOkVU75K8pU=
X-Received: by 2002:a05:690c:18:b0:70e:2d30:43d6 with SMTP id
 00721157ae682-71406e153a3mr69077877b3.38.1750891824548; Wed, 25 Jun 2025
 15:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAEmM+Qi-Waxk5qcR+nfip-QGXaKk0-Kq7QSq890e9oYOPjW+bA@mail.gmail.com>
 <20250625202014.GA1585022@bhelgaas>
In-Reply-To: <20250625202014.GA1585022@bhelgaas>
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Date: Thu, 26 Jun 2025 04:20:13 +0530
X-Gm-Features: AX0GCFtqDnIARUFNXElc5Ra0vQgsvoERbrRzoUN4UINQwlpAAhvtUlBUtNIQzx0
Message-ID: <CAEmM+Qg+xxMfXb=704OfwYLou7Mh_BNaTevLaGfiG2peZotJoA@mail.gmail.com>
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_155025_991457_92887CD2 
X-CRM114-Status: GOOD (  14.43  )
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

Please ignore the last email (I haven't replied to everyone). Also,
here's the actual updated dmesg (the previous one was the old one):
https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180/ra=
w/78460e6931a055b6776afe756a95d467913d5ebd/updated-dmesg

On Thu, Jun 26, 2025 at 4:16=E2=80=AFAM Bandhan Pramanik
<bandhanpramanik06.foss@gmail.com> wrote:
>
> Hello Bjorn,
>
> First of all, thanks a LOT for replying.
>
> I have included the files in my previous GitHub Gist. Sharing the raw
> files for easier analysis.
>
> lspci -vv: https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1=
d832a16180/raw/78460e6931a055b6776afe756a95d467913d5ebd/detailed-lspci.txt
> dmesg: https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832=
a16180/raw/78460e6931a055b6776afe756a95d467913d5ebd/dmesg.log
>
> On a different note, I had to use pci=3Dnoaer, so that the ring buffer
> wouldn't get cleared that fast.
>
> Regarding the ath10k thing, none of the fixes worked this time. Only
> irqpoll worked. I don't know if it's because of a disparity b/w GNOME
> and KDE (because my daily driver is Fedora 42), but I'm 300% sure that
> it's not just the Wi-Fi that's the issue here. It's most probably a
> lot of issues here, and the harder issues to fix are usually the ones
> closer to the hardware.
>
> Anyway, if you get something, please let me know.
>
> Bandhan
>


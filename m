Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902F9C8303C
	for <ath10k@archiver.kernel.org>; Sat,  5 Jul 2025 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSoy42jE8oSTsRV8nhC5XWMdIM4lCHhuTojjQ5lYN7Q=; b=zZ+mQf1GoOgKMXFrfBvOEt0afC
	7nXg/AipRoijYjdUBvKLVJKWizzUlcv0xhirmmimtzKpGax3AndMvHIRXcBUeQ2qHSb6/Bpxrc/kA
	kh2WH3kl4PLNDbxrNIw0+wu14qhm/U3mNT5pssyHdFrL4PxDLyBQH8k7hKwo7AKOM6lNyODZ9gV6/
	1UAmspgC8VcHa+X+ayuNFXAoFzU7Wov9D29BA5Yo+s5WwH3aa2IhOi7gA/3RK6iY5uSQE0c3wak1d
	oQ1YDqRzeE5mh0ECZssKsCn3knkxBMlh2tpd5BQvGkRgrHKWS2ZOXulwRyYJ6eLD1tq56GtCUc3px
	vY7ijkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY4Nw-0000000GglU-44KA;
	Sat, 05 Jul 2025 15:01:00 +0000
Received: from mail-yw1-x1144.google.com ([2607:f8b0:4864:20::1144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY4Nu-0000000GgkQ-3g5R
	for ath10k@lists.infradead.org;
	Sat, 05 Jul 2025 15:01:00 +0000
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-711a3dda147so15484937b3.2
        for <ath10k@lists.infradead.org>; Sat, 05 Jul 2025 08:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751727658; x=1752332458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSoy42jE8oSTsRV8nhC5XWMdIM4lCHhuTojjQ5lYN7Q=;
        b=D31rMRz4LdNouGHNr9JYHJyYeGU8aloNB/pJZKHIlkxzOFKA93Im/USgh4rhic7+gU
         4LJLKpwO9k6oOSMnkH3IFlmjU9+aTLaQOq7wXa42UQtds3j4OZaKYi9tj3QUrtrbDJRL
         Dj+TvHh2Macg/DfgfJs0vlVat4T1WLRDRfSxA7/7yxfccKuvEK94GhJEaplhaNm9xwkX
         OwENcPVom5gA+DsXWAkM+55zIWV4Jc7DB8iupSy+0vWULeMiBIl5f6PmlewJKdUy49Yi
         p3Z+y1xNdop2858OvxChfuA4qF3Fa8VmoV9hXrvhSlpKTMkeeI1G3aVWBVPIZDk3PbcB
         /Yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751727658; x=1752332458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSoy42jE8oSTsRV8nhC5XWMdIM4lCHhuTojjQ5lYN7Q=;
        b=VtGJdSOiW+YzQbEoujqPD5OoHxDVBLpDa+GFAmfhuuS1yb+0cf1c7D5ctufnmaCYXr
         KFDirzoOxFXO9C3JWZ69on+INgut4HdTDyMXZBAdo3wTskkgizXDHl29ennwVBWNWhzC
         4om4HnZK7NA1OzfbnFqaJA2U0eodrW+N0pJM/KFK7Dg32/G855oadTT+SbdpRdeQPT+q
         H9fUA0FGZmDySwtkdo69g+nL6jjzGePqCGewV88tiAM+gaKCJFptaNB3XuS28ixFd1KO
         5aYsJXKAm2f4SIQLE1Ihc8jdyenF8ccR97UrkneyJop2n8dHJ/SGCdj9f61eXctm+v5N
         1YUg==
X-Forwarded-Encrypted: i=1; AJvYcCWIiz20+cPzUvPAm74/RWc1hVccOa4SxH8ok668yA8xaBkZhvLhXEKbohlTcwizk4IvhETds4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaqAvu9JqR05yaQkv3hd8qEykgVBk0Qykhy5cX43V7U9BzCjGi
	Ue+MxeP/eYX3wCWHxeSwZJvkDZ33vErZ62mPYTFI80T5lz2E7oLjXPgwaEWDqtBF0YB9I8U+G2x
	59r4i5+WiqmHW2S4McXvrAItuPWF0NHA=
X-Gm-Gg: ASbGnct9GsQPCzPWXGH1LpBMkbzeutDs77ytOirwIbj43eDcSaUYHD/4MFy7yoqLwwr
	aNSbdHeHBqhXm2XSiiJeDkjghEUOrvPCF75H1Zgiv1Z41vccXBQsKurcG2n6BKSoH3NYsulBkxE
	uTyjHhvFlc0ovGja36c2LK8zP6XT8HY4CdLErEHBliX7OwKQ==
X-Google-Smtp-Source: AGHT+IHwNGLhGtdbfnWLVGJVusTre3vOxTxJKxjsn9yuE6owvpAXDFW41hV64HRaaDHx5FjdBgIq01PfFHw8A7cM/R4=
X-Received: by 2002:a05:690c:4a05:b0:711:406f:7735 with SMTP id
 00721157ae682-7176c9f94c5mr31300827b3.13.1751727657667; Sat, 05 Jul 2025
 08:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <B0A6D9B4-086F-4D58-8284-485B9FF4B31A@gmail.com> <20250705135020.GA2006390@bhelgaas>
In-Reply-To: <20250705135020.GA2006390@bhelgaas>
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Date: Sat, 5 Jul 2025 20:30:46 +0530
X-Gm-Features: Ac12FXxu3GajXzRL8jbJqYv42LXNHTyi6qR_NX0yFSQpcNrZEs4Tg0ZYynZacQA
Message-ID: <CAEmM+QjHnU0h3HtWH8AXP05k2dTYozu81eRxn45HVEUSRG8jLw@mail.gmail.com>
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_080058_920847_BDC8D330 
X-CRM114-Status: GOOD (  23.23  )
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

The dmesg log (the older one) is present here:
https://gist.githubusercontent.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d8=
32a16180/raw/78460e6931a055b6776afe756a95d467913d5ebd/dmesg.log

The newer dmesg log includes the first line and is not overwritten by
the ring buffer (used pci=3Dnoaer in this case):
https://gist.githubusercontent.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d8=
32a16180/raw/78460e6931a055b6776afe756a95d467913d5ebd/updated-dmesg
 (The newer one doesn't have the error recorded).

You should check out the older dmesg, the quoted line was taken from
there verbatim, including any additional details.

Bandhan

On Sat, Jul 5, 2025 at 7:20=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Sat, Jul 05, 2025 at 01:00:23AM +0530, Bandhan Pramanik wrote:
> > Hi everyone,
> >
> > Here after a week. I did my research.
> >
> > I talked to some folks on IRC and the glaring issue was basically this:
> >
> > > [ 1146.810055] pcieport 0000:00:1c.0: AER: Uncorrectable (Fatal) erro=
r message received from 0000:01:00.0
>
> Where is the complete dmesg log from which this is extracted?
>
> > This basically means that the root port (that 1c thing written with
> > colons) of PCIe is the main problem here.
> >
> > One particular note: this issue can be reproduced on the models of
> > this same laptop. Therefore, this happens in most if not all of the
> > laptops of the same model.
> >
> > For starters, the root port basically manages the communication
> > between the CPU and the device. Now, this root port itself is
> > reporting fatal errors.
> >
> > This is not a Wi-Fi error, but something deeper.
>
> Devices that support AER have extra log registers to capture details
> about an error.  A device that detects an error sends a PCIe Error
> Message upstream to a Root Port.  The Root Port generates an
> interrupt, which is handled by the aer driver.  In this case, the
> 01:00.0 device detected an error and sent an ERR_FATAL message
> upstream, and the 00:1c.0 Root Port received it and generated an
> interrupt.  The ERR_FATAL message doesn't contain any details about
> the error itself, so the aer driver looks for the AER registers in the
> 01:00.0 device and logs those details to the dmesg log.  Normally
> there would be a few lines after the one you quoted that would include
> those details.
>
> Bjorn


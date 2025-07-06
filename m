Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F192C83F07
	for <ath10k@archiver.kernel.org>; Sun,  6 Jul 2025 23:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zturyjfI2N9e2c/AG3k9CJQA3JKr2kQzkhiHb/r8Khs=; b=HwvLDQ6bj7iMVwQi1zeO457t9K
	DBFvvdEqB3pIp1A6+NuPsF1J+PCIZAFFQyG/vxHnkKZEVpr5JcRHTq0nZ45P4v3T3N1f80YpcGGAc
	cZK2vZy8gVaOydEr/ji+7Y6M9nA47dkOORek+2z0CLzV71Noul1ulSLO8qDAozYVqgTxmZVji32P3
	XQVSf3EN6PMrAZxVx7tdzaaHetQBsYr3WhUw0UzZeTF2R09EWiDVkDFIHXeUjCMDcgYyN/EUty7V1
	amA5endXoFXXYpqTXJ8mwF2JqbD1IqGbl3LMbEyK4aOAgF0OqxjZ0c4FfE2itZYxdpLCxAovuIvOi
	fVkGuEcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYMU-00000000v4t-2RpJ;
	Sun, 06 Jul 2025 23:01:30 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYMR-00000000v3I-428R
	for ath10k@lists.infradead.org;
	Sun, 06 Jul 2025 23:01:29 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-b34ab678931so1627059a12.0
        for <ath10k@lists.infradead.org>; Sun, 06 Jul 2025 16:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751842887; x=1752447687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zturyjfI2N9e2c/AG3k9CJQA3JKr2kQzkhiHb/r8Khs=;
        b=i5MjdSe8DNKUcWpAGPE4XBf3/gltYfPkldcsmNeK3jEgGFjLz+w6uDkkdNISWeV/sZ
         VqmilaptZFfFThakz8CnYl/K4JXT25wPehSYisN/TTWch8RC3C5mefPIR/XEDdDO9XLn
         xs1Pl31GGrQpn/cy+jOJqM1E6uZ0pinisup5Vs+0XBZBfIlguqnDY7BTjv07sWVVknIG
         FiG7b3WX4Umecs8moXqFYFTc8vpPzZRWms/uICYBmOIu0Qvv6pFfQ563EqDptLwBLAUG
         FBn5ZsGtljgOZT7InV9TEy0qD+ePw83+FZzOxDezuTmfRrmOjxwfzxznHilcZQlALX0A
         7smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751842887; x=1752447687;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zturyjfI2N9e2c/AG3k9CJQA3JKr2kQzkhiHb/r8Khs=;
        b=t/lsJxpR8wCuhf7+w9LHi1zlNa5dwv2N2VSlfSAmFTML9rbEnno9eLMwb6aEGs6UfB
         2y4FePdNfSK+MRI1pOkqbmSwgXxDlqLDe4YQl7H9EGZOCX3kMrCHwYZR8LNoebm9SoR9
         H6TMIm80q8LFoZErrKQL5zCxKIX9eK4kczdmjHqTEdGpspXy3sx1ptDPIxnAqLU2YXyR
         YvAFzWTJSQvqK7iUXyP7kywUDGgj+kpGY8thuT/FdCNFknoGAyvqRDgZQhoknoLzfqAL
         rzYHZoBirpMLzjsTwPwAXijd9EzuGiAx7i5uUryojkxFe+lss9denNEjgj9NCVwQG3HC
         b2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWN+houacXkuKkAXFBSab4mpfVlPXHYSPRebAKa3Mxi42p/wRedDNG/NH0dYfLWT0Adew06Kpo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yws6zhT+bxQ+X1qOeD/1YT5KrzXiOzmzxpdXF4grnzRll6a0kkV
	51VzhcEwmGI0YYsc2rKKP6YDU5SCPlfF3iP9H7sKJD+NLCgWv0g7ta/7
X-Gm-Gg: ASbGncvTCVR4dUUSYi/2CV4zFplG99KJU+5O/QONrQJN2bPyytKjeznDXai744dO3kZ
	D/JnticV+JobVMyOTBjuCnIGGdO+AjABkQ4dWHyxrkS1B+/TlpjD239E01xX4WcOxxJMsMkir9l
	k++t4ihbyRJio7q173YoXrgzYnf0u98dW25k8So5VqaFMVWSSSqKnUIJDwc9Qq49aavM9DVyfkx
	3zwKnfYdC0c/FWy7PYnl+YNaD4ACZNn08mf11qlRlYBArRi/nGlVjFtDWV5nx7EO/ZKZzqcvgrR
	rXQ6ecAr+f6JUp6YCTHGlu4/xUORcre4CiNHcjv7EAuZWzEezgYK05+GiNpJuuP33ikt/eyzhNK
	sLlo=
X-Google-Smtp-Source: AGHT+IGAJIAPUxPwiRpQD8RGqbgSJ3Srthut5cwID5L28xg/vABhqLkk3Ayb4sm+d6UnVkJoYDakGQ==
X-Received: by 2002:a17:90b:3ece:b0:311:c1ec:7cfd with SMTP id 98e67ed59e1d1-31aba8d323amr7588550a91.26.1751842886617;
        Sun, 06 Jul 2025 16:01:26 -0700 (PDT)
Received: from [127.0.0.1] ([116.206.223.154])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431e1b0sm70869455ad.44.2025.07.06.16.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 16:01:26 -0700 (PDT)
Date: Mon, 07 Jul 2025 04:31:22 +0530
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
 linux-acpi@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_Instability_in_ALL_stable_an?=
 =?US-ASCII?Q?d_LTS_distro_kernels_=28IRQ_=2316_be?=
 =?US-ASCII?Q?ing_disabled=2C_PCIe_bus_errors=2C_a?=
 =?US-ASCII?Q?th10k=5Fpci=29_in_Dell_Inspiron_5567?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250705195846.GA2011829@bhelgaas>
References: <20250705195846.GA2011829@bhelgaas>
Message-ID: <9D9D9375-1BD0-46EA-9E85-47A2D8325F98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_160128_016918_894A1A19 
X-CRM114-Status: UNSURE (   6.62  )
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

Hi Bjorn,

I have downloaded 6=2E16-rc4, and I have a bootable pendrive having the ar=
ch iso, but I really don't know how to rebuild the kernel on a bootable dri=
ve=2E

Any tips on how to do that?

Bandhan


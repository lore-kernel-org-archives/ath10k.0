Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE76C83F17
	for <ath10k@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOj2lMga9i8OFABYK+OrsxlcZW0fasgfoQmLIBdlGY8=; b=v4/meecNUHb2vXBv2j/A+WF1gt
	aOSD/h3xC3w0nPjMzKlbwY2ZDP0+gDh+oyrwX0KrWLmVKDKKe0EaTj6x0M991S5yhVEe3z35pKHB1
	wPMC/6gDAOQG9jJof6g+9bgZ0gFosJUsDSXV1iRedXP7oNSQQ3ldyYL6cTkmEppVnfQNxS/uw1INL
	Dxe+YM0TrysfAPFuHWTDMSXTF27l4JqWTI25kuphR9NWNHtzrUZg35GUT6uvlLk33DK/8ucph+TU5
	vINI2rfhM4FmINzHRxm2r7Q6et0ezJO7axqRSSEoRdlecSac4XL/OLeXm5rI22LN3HKAzdgfL1gAN
	oa8l5kKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoI-00000009xa1-0hrP;
	Wed, 09 Jul 2025 21:58:38 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZYcP-00000009R9O-3ngp
	for ath10k@lists.infradead.org;
	Wed, 09 Jul 2025 17:30:07 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-742c7a52e97so139928b3a.3
        for <ath10k@lists.infradead.org>; Wed, 09 Jul 2025 10:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082204; x=1752687004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EOj2lMga9i8OFABYK+OrsxlcZW0fasgfoQmLIBdlGY8=;
        b=CsdvMeAtHPymziepMFvUsiEAm7zmHAOQrzKYHa2g8i8qTmQjdtWBf/at4kI3LCW/HS
         Ipve9Ru+2ZjcA77Go4yQszAdAT7WWX8YsPdOKFqavtdw5xvcfCr5dFHpHUxiX70Rlc0A
         zS3fF8TSru3hyy6+jNWTlyN88TNh/GjZjtc8BdhfriaxTiBEzbApAnwBjjl8g9vkXAPz
         Z03v9B2WwZD1CD6zOAVM5F0PL1vuTJENqWleGiZ4W2PMKErSGYyUR2h00XiPguWtlOsO
         iGeaGOxLK1hJlrJbFTvWe5Z4QhkijGoilnhr4V3QGPAwjX+2puhuaIj6EIGrZ5jLIy7t
         FqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082204; x=1752687004;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOj2lMga9i8OFABYK+OrsxlcZW0fasgfoQmLIBdlGY8=;
        b=N9fJ4dDQGRz1YLuHX7Pe6x8TAwAr2EuspnyXh1YhXjYjX2xUMMEabOvRqkyokojNxf
         PLjBVDnjx4HIrggJBR/Bx5MJvnB1E7q0Y85CJ0PtR+0HZdlOvUobJKsrkIwN3igF9Jhv
         KM2l8ec85yYnMKe3W2X/4E7g+j0pYwVLD6/EQQ0flmC4zN1TFJpmw20mgoTWpYdEeFh5
         BrmW9/I3XtbmanXczUGszVgunSde6Vdt0t41TmNItio8MiqhBkHh7wZvZIwf1wVJs9mu
         XKe9TkiX4shtSqxW/dpImBDlyDVisNcEtdW08PUAEqxiTSsBTpjMdG5v/e1ktmoKa92S
         KwsA==
X-Forwarded-Encrypted: i=1; AJvYcCV/MuqQyr1bdeywfTRoheYy6J+FQuLTurs30zjpn2wFAtuu4jNQwrmK1W21JdOhWItWImQLGOo=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi1ERjMrEYVZ6e7YOQGorrCP0oWnw/iWJkfoYoaHO4bncMOush
	UyHrXArp4cfqkyWacQkSkwLhpnqAGLNUeLDK4TmbLtbKg8NSrS8Oykaz
X-Gm-Gg: ASbGncuVvkeAJlYTCQGwh/xXrDrexsXgcsr+7jAOswQHV3FwqF+3T/q1wPGuvjv0mHY
	AUoTzdSsJ/9NRqYt8BVEeJ0XhF4WPz32LxP2jpuqpn/JQz/A4DovEfdCeAjFx1ZP6SV6OhjuL5i
	QWUW46tlZs0g0BeNiobN7PrHot6ls/gPI2tWBYhUYvaQ6v82lDienJ8UUeqmmtFQvst6o+xAvJJ
	H8JD45plrIjmEvsc/0PxYzdCMLziA00ZrmmRUf9MZF8qhDlyRwg9SfjvGuzLV5cqSVa6cBy4Uvj
	kyZCiNAq0+EhLbUFFPqcMiq+WFrGUyKAgYQJ+9ijZlYEVzwufWHHNXViRf8Kou8yIS5AeAHvOY6
	8ZIs=
X-Google-Smtp-Source: AGHT+IEoFN970f2Vz3fFerySBIi17puKzAo07Z7Kh48d+A/W1u5hYXGzjL22Gwcfkwgr1/kvAHijhg==
X-Received: by 2002:a05:6a20:d8a:b0:220:3024:3d05 with SMTP id adf61e73a8af0-22fb444fe14mr912911637.16.1752082204448;
        Wed, 09 Jul 2025 10:30:04 -0700 (PDT)
Received: from [127.0.0.1] ([116.206.223.154])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b39c64f4e51sm3548305a12.36.2025.07.09.10.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 10:30:04 -0700 (PDT)
Date: Wed, 09 Jul 2025 23:00:00 +0530
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_Instability_in_ALL_stable_an?=
 =?US-ASCII?Q?d_LTS_distro_kernels_=28IRQ_=2316_be?=
 =?US-ASCII?Q?ing_disabled=2C_PCIe_bus_errors=2C_a?=
 =?US-ASCII?Q?th10k=5Fpci=29_in_Dell_Inspiron_5567?=
User-Agent: Thunderbird for Android
In-Reply-To: <2cq6jeywii5fscozazz2epugh6zflcpfbo4ffhjt2lyk76cq4m@vg2jcsmlhtho>
References: <20250705195846.GA2011829@bhelgaas> <9D9D9375-1BD0-46EA-9E85-47A2D8325F98@gmail.com> <2cq6jeywii5fscozazz2epugh6zflcpfbo4ffhjt2lyk76cq4m@vg2jcsmlhtho>
Message-ID: <FB89ECA8-93E2-4015-8DCF-6D362A53D825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_103005_963732_E6C772BA 
X-CRM114-Status: UNSURE (   4.86  )
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

Hello,=20

I was actually a bit distracted by the things caused by the Automatic Part=
itioning of Fedora=2E I'll inform that in Fedora Bugzilla=2E=2E=2E anyway=
=2E

I realised that making the modules will take 8-9 hours, I didn't even have=
 much of a success (because all the modules didn't properly load, particula=
rly the firmware-N=2Ebin files couldn't be found)=2E=20

But I'll try to recompile the kernel, I'll just have to give it overnight =
time=2E

Bandhan


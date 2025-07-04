Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ED4C83F03
	for <ath10k@archiver.kernel.org>; Fri,  4 Jul 2025 19:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YeMduycNr0ucx71qBoH/BU6xLYTkm+mYjA1vKxf/iU=; b=aoypTX6GgXp0i6bzhLVWFARrUF
	/BDVR4CUcXr1CPzmfq05dTaJo7YKGfk2b4X/7sNAQMt87+3UOKtE4qjNL/kDdUnl8cHWpGyM453Wc
	WByH5ulwCyq/6W4gqNgiwrmmDWLCajkUgKpAZYTA39B16aie+0li/pYYgesU51PKFx1mrs7ETRj06
	jdKlOHwxGv2dN9AX3j3pbW7AQiHW0dc8hGvgyEq7WKnQT6Lk7dA3R6nJGKCp8UjUd69x5hBJwdRGe
	mdLZErkjOgrqDTPRxLDFk3nqoSh81dFcHk7zDTK2ukXU1H8Jzeox/k58p9RkXLOiUVZO8UBBmGpQu
	zi/cxTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXm7C-0000000FLFH-3bP2;
	Fri, 04 Jul 2025 19:30:30 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXm7A-0000000FLEV-3ORP
	for ath10k@lists.infradead.org;
	Fri, 04 Jul 2025 19:30:29 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2349f096605so17251715ad.3
        for <ath10k@lists.infradead.org>; Fri, 04 Jul 2025 12:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751657428; x=1752262228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6YeMduycNr0ucx71qBoH/BU6xLYTkm+mYjA1vKxf/iU=;
        b=fMQ/kuXfAzq/SXEX82+F+5xlcVxorGn822tO24nvCAUuNIIQeZsV6G2fD6K7YLMKBn
         hLnSUSVQvpA5CeIeDuOK7zVjpU89XzaO8I/DjJhvLxBlbWV451IIwI1lB7JY1zT2WAte
         RPqOWt/QIeUsZ+b5L4ze89zRn6Bk4yR3eKop26lY/bgRbcxUpDO32wOp/aWuQXPg5QBH
         H2Tfkd28q2i87rgErkIzcdiUYiGJCXO9esVjB5hG4UcyG62DLDRxbXLSnWnQIr/8MDQP
         bSTu2G+dEiidsNyQy00TMmS0NjClVvuVABK+PJl6/V1KUrvOny9HUemeWH+exsTeJ/9F
         g5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751657428; x=1752262228;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YeMduycNr0ucx71qBoH/BU6xLYTkm+mYjA1vKxf/iU=;
        b=aw5e9rKxPLGYhXqe/08rGSnaiSnoornQtGC4D74m2TcwyGy1NOeLfNIYwc9XI5PwE/
         BikCUniEHIXrfeK6j6YCK/Rm1O+03P1DcTYmZGsNGQSCl140SQXzuifUFHf7WhvNGlCl
         e8wzyLY9LTLD65wxmBuSDPyY4AAfH6EW82PjKGsNo44NNWcqu4o5fzzR6vuJnk4byh/l
         RqYuMRzQIuAVtxwc7VGeE9mHKo75Fn2DcO/wkx+JNKOeuz7lmYLvc8OCYWnMBiKFqPrf
         P7xvYFn5VPGIUc1MGI+kX6MERkwJiQcAzrw+7yzrocOALnscQCJKll9A4TzgX5z9osF0
         s+ew==
X-Forwarded-Encrypted: i=1; AJvYcCV2/n+0wHDlLmDjniRzYnuv5vmjP8Ys43420cykpdu+1o/sjvx9nxNOfoCAxacgLRZqDlzluSM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/t4OKsjOP50X65Ck+KP2oMpBhInjzf0+slxHY3sxumkqvSpDZ
	qXzn070d9+VV66zITxxvjQS6zaEaVU0gmF+C9qnqYqdKmpihsUfAA4142JZXxVXKZRs=
X-Gm-Gg: ASbGnctmb8YJVBWVH7zxZQrqv0orVNol99sk+g5+M8jb3QyvhE3an/nsfDpKwi4RaV8
	lvP0wK2EmnJJrVqaVAYM+jnf7setOUKtI1Ax837t11rJF8+ItblQQYIBxJn7/cIltyFiyFEtDuL
	crLlheCzU6u/sBtplh6RdrsbsvyV8MqpvaQdp6xNJyXeGvTJ9qK6vyRoJhzrPPMYhPkSPN7ispy
	4d6MOuT1U8OyQqSfJ638tRdc4tTwu7Phc46pJ+p7Ckido8afv98jaNrjfLQSq88j9aLcq+8KfBK
	9ZmEUp6nJBne9ghklGXL4oqVPcmUUYTjq89cY6L+ZzhXplR/Xmghhw4wCg68S35mWELIYyC35uQ
	XuudUaxA3pgDoGQ==
X-Google-Smtp-Source: AGHT+IFk6QKQkW35P7FONxRvG31BHVykVFqw4PTl1hx8QxKZED0AtutT4llwQsSg6/TFW1FvopSL5g==
X-Received: by 2002:a17:902:d511:b0:237:ed38:a5b3 with SMTP id d9443c01a7336-23c8746d7eamr45141015ad.8.1751657427664;
        Fri, 04 Jul 2025 12:30:27 -0700 (PDT)
Received: from [127.0.0.1] ([116.206.223.154])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8419269dsm25587255ad.0.2025.07.04.12.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 12:30:27 -0700 (PDT)
Date: Sat, 05 Jul 2025 01:00:23 +0530
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
In-Reply-To: <3214E8BE-0A5D-40E7-A4DC-C1027CD052EC@gmail.com>
References: <CAEmM+Qi-Waxk5qcR+nfip-QGXaKk0-Kq7QSq890e9oYOPjW+bA@mail.gmail.com> <20250625202014.GA1585022@bhelgaas> <CAEmM+Qg+xxMfXb=704OfwYLou7Mh_BNaTevLaGfiG2peZotJoA@mail.gmail.com> <E8A26FD9-13E3-474A-87FF-ED8D27A1F27B@gmail.com> <3214E8BE-0A5D-40E7-A4DC-C1027CD052EC@gmail.com>
Message-ID: <B0A6D9B4-086F-4D58-8284-485B9FF4B31A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_123028_846610_C3E84FDF 
X-CRM114-Status: UNSURE (   7.17  )
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

Hi everyone,

Here after a week=2E I did my research=2E

I talked to some folks on IRC and the glaring issue was basically this:=20

> [ 1146=2E810055] pcieport 0000:00:1c=2E0: AER: Uncorrectable (Fatal) err=
or message received from 0000:01:00=2E0

This basically means that the root port (that 1c thing written with colons=
) of PCIe is the main problem here=2E=20

One particular note: this issue can be reproduced on the models of this sa=
me laptop=2E Therefore, this happens in most if not all of the laptops of t=
he same model=2E

For starters, the root port basically manages the communication between th=
e CPU and the device=2E Now, this root port itself is reporting fatal error=
s=2E

This is not a Wi-Fi error, but something deeper=2E=20

Any tips on what to do?

Bandhan


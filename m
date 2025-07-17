Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AEDC83F1A
	for <ath10k@archiver.kernel.org>; Thu, 17 Jul 2025 23:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Boz1NnANL68jZFSj5utovY8CrOn3qt7bAPUypNpOzTM=; b=dYQCsaD2L1FHk7BT9mWpo8DDFK
	NkZ8I51igia/BpSmOUAmEco6vFqqF62bUtieoS6CBJCZIXmSA8udwqfLT4F5C2iQJhHGDsz4tfClt
	39wQy1U8ge+dlvRJ8o4++Rd99NI8qp5DmEwSVmfZTpwdsrmwBjs7bMR62ekxloGH1/SWzlRixcnFg
	PBA0yV9gSGHEnrQDPRKhm0kX0k66HPhs3GC5lkWFTOe/C8JBQuDlIw7E31BIaBvZW/bE+sO6VvYZj
	OahDwkoxHint9yI75qKNyasGiHaYmzVA/amvgF9f33yP8ovNpBf3LWKHgpDnP75npWlAJ9YOt6Vjv
	z1asZYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucXoE-0000000BG6v-1Opc;
	Thu, 17 Jul 2025 23:14:38 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucXoB-0000000BG6b-3Z3m
	for ath10k@lists.infradead.org;
	Thu, 17 Jul 2025 23:14:37 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-747fba9f962so1650454b3a.0
        for <ath10k@lists.infradead.org>; Thu, 17 Jul 2025 16:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752794074; x=1753398874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Boz1NnANL68jZFSj5utovY8CrOn3qt7bAPUypNpOzTM=;
        b=feQ4Foci7zKbQ1B+i549kZ6aAEK0RaTKqgHSh5x5/BwzwAJ1021sTuc6Rq19JXVnAO
         F21Ba26lbhkEv8POGswkkhGpo7y3SLCuuQamvxObIM9yBfg7YkFCVXMS9wPu3WvEUO9U
         TzXPw32FI7rWBcL9nULt4bNZ567nUhor6NdGr6X7F6nLNH9ExCCs+BAPPnoDKM9Oqh6Y
         kXdFg6Jo85FSHrUX6D0Ncw1JK8V3yilfcPFPHNghI2PGctd6ixYNk9b6sVgapKv2NQyv
         J07+Oca4IINg+TnXoGrMH9X7IUMcyF/nOX8lywmPL7auHoYS6bpuK9aQglOEcqJdHbCj
         ShYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752794074; x=1753398874;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Boz1NnANL68jZFSj5utovY8CrOn3qt7bAPUypNpOzTM=;
        b=jzl8RkB/D2CqIMs2FdgJdrn2QAhMCOeRxzPxCJKkdrXdAzsCUciuazp28X6ojYseUv
         imErwotOz03mVk1ksYhGWWy3ZvJujP7vfMCAdatXIod3VrUW1NvdfCAb4Gyzjzs1GRjD
         ZESwPM5qnczMSlcmEakfng2TbjD5JUmtJzD7eWnppAU/w/FXEaAYxNsTBeccWUtmoAS0
         dotM+qWDhF8o9WDh0e5uN84TfO7Ck4cN7ERYCZ9Hj+wj+iXMAnuevqWf0bSm1VayB662
         yZvzIG0nA3I4eKLsFT/4fndiZ1etjfnYhucpTkZ9kcL8c6oYXDzlCTjoiaswOFb5Z1wN
         MzfA==
X-Gm-Message-State: AOJu0YznnY8a+u8gfIVjSiDoJS7qY5KBbkrV/+qIPxb6Eq6lPQs05rdc
	72jPkJHA6xdfg89vl4yrVUOyZ/JbZwyoL4QfeLJ1bFLvgAz3FADvuizxdZyqWSMoaW8=
X-Gm-Gg: ASbGncuXnxt7Qtea7Tkht1TYcYEpjcTBit+Qd6xCpsZcVfSOBEKQBryzCRfA+Jqx7Yk
	JvYyitxpInZVXpE+J0LTxZu4f+f0t1JnWyiava1bCZaEw96F0ymqXuSk4vDb1b8brklfoQiYrIg
	uJJULDPvXvTOl9tCXUmq7gHpT/7bXszjastZgDkjHE+eM9/RCJ27ygx6OxZGtQSa9XW7ZOJGlsh
	bQOawSZOmWgo92THdbuo4z16fkkRetrxqZaI0YMZiIRmdmakd3QfF39aNnPDHqaiHjE3fYw6Q6/
	PomVnxUnREmwB/nL670ilAa3lTG7Hutm/YLzwUZ8UM95VgYhjMc6Gon70eA5pFAGL9G6Ia5QmlH
	5b2UELG84cMjz38xNl2DkutNh017QYtAEzYEEDYI=
X-Google-Smtp-Source: AGHT+IGqxUgt2M7kl0/VxWjAcj+d9qWEHTt2Cy17UaLhAJdy0zmaf5a76BKuMYJ7ItuMr/jiUnopIw==
X-Received: by 2002:a05:6a21:998b:b0:238:351a:f960 with SMTP id adf61e73a8af0-2390c84dd57mr8247735637.23.1752794074432;
        Thu, 17 Jul 2025 16:14:34 -0700 (PDT)
Received: from [127.0.0.1] ([116.206.223.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc6c16esm81623b3a.149.2025.07.17.16.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 16:14:33 -0700 (PDT)
Date: Fri, 18 Jul 2025 04:44:23 +0530
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
CC: stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Bath10k=5D=5BQCA9377=5D_Firmware_crashes_on_Dell_I?=
 =?US-ASCII?Q?nspiron_5567_=28IRQ_=2316=2C_all_modern_distro_kernels=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <690B1DB2-C9DC-4FAD-8063-4CED659B1701@gmail.com>
References: <CAEmM+Qh=8tm55Ypa2w3ZtOFFrGXTpKqxue59mVAo_5TVy0RJ6g@mail.gmail.com> <CD81F065-CDDD-41F6-AECD-167B509F57C6@gmail.com> <2DC25FD4-0EA4-41CE-BA17-BFF84C1C5F7E@gmail.com> <690B1DB2-C9DC-4FAD-8063-4CED659B1701@gmail.com>
Message-ID: <D048183F-E342-4505-9891-8F35D09812FA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_161435_889544_1B36BA54 
X-CRM114-Status: UNSURE (   4.51  )
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

Hello everyone,

Sending this on the initial email thread to the ath10k mailing list=2E

I have built the kernel using Bjorn's patch=2E The kernel is still tainted=
 but certain issues could be pinpointed (for example, ath10k_pci mishandlin=
g write32)=2E

Here it is:
https://gist=2Egithubusercontent=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea4=
3a1d832a16180/raw/07b34aa3fa19da5afa4bb161454e3cb2081b9880/journalctl%2520v=
6=2E16-rc4-PATCH1

It would be highly beneficial if the matter is looked into=2E

Bandhan


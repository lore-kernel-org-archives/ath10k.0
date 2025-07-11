Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2089C83F1A
	for <ath10k@archiver.kernel.org>; Fri, 11 Jul 2025 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BGqM330Q0S9LfM4RTN9305y8KJx7EcufJSqEP9f9Nw=; b=WNrX7J6ARN57xr4lV/AY1O7Y8Z
	eJIK1qSNWNQkffJUg3kKswNKbKR4aQvjNOi4vm58h1GAez6YljfteyuKAgEXNBH4+GcG/ymB23Anu
	l7JwpePDEy4L7nYnR/5RZScd5BzuASItdPfVBmfLdRZj9mw6oPJRkSitMPcDWMOg+0yE5jQnKdwKc
	sQBzxflrwgE7jZoAU7E0O43CHY6yLAIl579ERC3Y7VDIvykBKN8WFiPAALlpO9For8hsRV81rZ2nT
	fFzYtuuZ0X6YQ3PUpW62BfhuIYNJXYJ8tpHrY3bf4m6rCVDyYQi7s7tJSTz5ZCH1d+OsfPib/53OZ
	YHJciPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGvc-0000000FKhV-0fmM;
	Fri, 11 Jul 2025 16:48:52 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGF2-0000000FDzd-0Xr2
	for ath10k@lists.infradead.org;
	Fri, 11 Jul 2025 16:04:53 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-235f9ea8d08so21592485ad.1
        for <ath10k@lists.infradead.org>; Fri, 11 Jul 2025 09:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752249891; x=1752854691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/BGqM330Q0S9LfM4RTN9305y8KJx7EcufJSqEP9f9Nw=;
        b=GymbWaFFqa6rvr1sGaMOFp3bXRsVz6u5h/G7WONmu/NR6Wl4Pn3Df8EEchwZ+QfFsR
         d6vv2asEPbH2ug9sWR6cw4pAc0PsyTzAyv68bQ5KTT1MBLuU4h52Vnn1dKzQWJvp8/cS
         zWFXxEslYDODGuE9OzdAsUdg3tMO4qJrU/iWcSkx95jPpYya4ggJUWfvfuoVXKH929in
         9MDlBKCWcfB/x7/3eFdvTLxVhn5P+adT95t0UEkaBhnvkjXKSB+6QkzOvVOkdewKoxXl
         DCsvufN8LixjKE00zWx31gh5V0bFaFqjdELPzI9Kxx2xyMI2FYy4swhIfM4ViXh51cM0
         XWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752249891; x=1752854691;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/BGqM330Q0S9LfM4RTN9305y8KJx7EcufJSqEP9f9Nw=;
        b=U0M7dMqHBPCHybWTwYW6nTpqchC35CHkzGVvnKaUwqFhL7bq8dgEg9aUUxQGi1iU2+
         1Fp2VinRV/LgFBJks8S6at7fc/eC6AsWSZpMbS/JJdLmlSJCOBSWSBseTDSyyFmz6ooI
         A0bS0Tmw439YW63qTqqp4jDlM1Gd8tnNwiohGw+n5p8QNYJntAxe4y97/qZI+9yZW4pV
         N/u0WdQxBXY7wbl4nigx0ze/QZC34qiEoYH8ia82Dc6tw8gCA74jlX+gD9zRTbXgh67j
         uADWm8bYblolFSr3Mmm8GARG/OjPKrpL9HAkekSOYzxZnmMQf7Czp/gFG5U/yRz7WqXn
         RWQg==
X-Forwarded-Encrypted: i=1; AJvYcCVH82RD8KG6AX2JLVz33FswzYbSqF/ZHZNYswl/ldueu5NTN4z0kykNOv2M0GGVkLKvmLu2RXQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzINjZe7i11RQF2FS2mkWLRSMdR4TEoBsOjEwArVFYUUPEUHy7P
	x4pBbYo2Vv2pzRlY+g/CSejuswfp84oc+CaxD8ng2qL5k2vw/RZZTE4E
X-Gm-Gg: ASbGncvsNR2UhpjS4f6GCJOTwFGXGzhiLV+sJKMinflO8o8tzhGQdUf0wTAz5wKbHCE
	qgq+ZTsnXkFU+0mvocUTaldRVmC/su6VoMuafF4h0rc9HPORxrikV/wvUAbUbBKcbDLwEILLzi7
	SxM/lNrRDUpbrzhvTqCmSFIm4vWs5rczSLXwNAQ8vQl4q/DohfbFkkbDFJ1/OrwLGlGxAWo8Ls5
	MO/MOQs/pHFwks69dQL9MyuxW/DpS3ASu2KW+0XYEjt6CMGWG/cYkGX+pTcuKlBgjQf/OMR8fIR
	GDTTC5/yF2+S6lbB8qfdYetTt60QdXZgyjx1r7XHvkfiX5ViT22rRXz7XfbCvOU2Ngta+z7L/GF
	cCWCJzuc4AB/eK4n2FWk4jJxfww+hBDX1ziArJ+M=
X-Google-Smtp-Source: AGHT+IEJ3oNx5cIlUjLOmHFUNTHkmdkqAsMISfC7Mxkw9B+ThDVLGY3uFMXn7GPvV+fHnVNaD+WHOg==
X-Received: by 2002:a17:902:db0e:b0:234:9656:7db9 with SMTP id d9443c01a7336-23dede7d62emr65105805ad.32.1752249891094;
        Fri, 11 Jul 2025 09:04:51 -0700 (PDT)
Received: from [127.0.0.1] ([116.206.223.154])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4346187sm55118985ad.193.2025.07.11.09.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 09:04:50 -0700 (PDT)
Date: Fri, 11 Jul 2025 21:34:43 +0530
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Manivannan Sadhasivam <mani@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_Instability_in_ALL_stable_an?=
 =?US-ASCII?Q?d_LTS_distro_kernels_=28IRQ_=2316_be?=
 =?US-ASCII?Q?ing_disabled=2C_PCIe_bus_errors=2C_a?=
 =?US-ASCII?Q?th10k=5Fpci=29_in_Dell_Inspiron_5567?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250711121537.GA2289649@bhelgaas>
References: <20250711121537.GA2289649@bhelgaas>
Message-ID: <FB546B0D-2209-4FA0-9DC9-A75C0BC9FA4F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_090452_185912_0037F7D0 
X-CRM114-Status: UNSURE (   4.34  )
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

Hello,

I really couldn't find on the internet how to compile a single file now th=
at I have compiled the whole kernel=2E

Any ways to do that?


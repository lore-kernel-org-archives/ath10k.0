Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2B4C87FD2
	for <ath10k@archiver.kernel.org>; Thu,  7 Aug 2025 06:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mgm3+Zt+sdADRkXhMMYxJzDIxJVuJ0elzR4ohr+MinQ=; b=t+RVAbk2Je4/jI/R4b9H+WpwAM
	ZdJ0JWxy5M0dHpr8+IK899wAO/QzZkDy1hoajz/4Sstajf5zBh1PE7sp21mw4Ot40yGwDAMCUSiib
	efFee0bGnNPS6G/j11wwG/IqS85Ve9YodPqdLdQ5IzClQTalqcA3sAP9WQH5vX+rf1DlzJZZNW+kb
	HHZDCCo/kNAo0BuzC0GJK8P6T1PPzQc+QHlNDVWjpecapk20Gwh1CWJJ5QdFXBNiOV7Pveo/5RjXO
	zfTC6bvY8AsJ1zmgYjs+GQXLT+SG10O6rVgTgS9rUok5TFDTP6yqcA4ZDLCfWIUF371Jw+ZSg6Iyi
	8foxatxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujtii-0000000HLW6-0wkk;
	Thu, 07 Aug 2025 06:03:20 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujtif-0000000HLV4-2Dnx
	for ath10k@lists.infradead.org;
	Thu, 07 Aug 2025 06:03:18 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-76bde897110so587507b3a.3
        for <ath10k@lists.infradead.org>; Wed, 06 Aug 2025 23:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754546596; x=1755151396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mgm3+Zt+sdADRkXhMMYxJzDIxJVuJ0elzR4ohr+MinQ=;
        b=Nc/0Ttr9EM3nQRscIKMhrHWzMn6Z4EW6+qm8HBNn/XPVVmX1f5K48RwGzJilE4YAkP
         Lc7FBtC8/bDpE8QXGOHKJg93c0fS7amMzaj6DUfuYl6sjR5+KGqjBctLZpRaTSXrHkHg
         FOfDCLcbPH2HVN+oBKqrZ0MC9tUdYOhGVepClTzyrcFJwKmFATVhHpkU2BVDaqbpf5bH
         GkCmSQ/aWI8UUhtGB7VpUAopc5E5+HlOBvoou4W8ZdrgU+VgQwYyA+eS3weGmcJkZdhL
         e2fybdyDHJKaIT3Mri6wouvb14qIpuEm8jZjaPFBk3GP29xVbDxeoiqPk7v+P+f5o4f0
         I7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754546596; x=1755151396;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mgm3+Zt+sdADRkXhMMYxJzDIxJVuJ0elzR4ohr+MinQ=;
        b=kD3uSCQ4KKXxcVxOVPxdwXLjy33cuqEOofHX7g6mMXhzk0g9GaHgja99PT5miRD7C4
         7RC6ih/4VoupT2ozKzt76LGD2Obno73SZFfS6ilGf4PGm0biTwl9HI8XXczdUO3zgksy
         C2h0nI+ap2xEyqOZWPTMbAG7nlr3YMDn26PGqAp9j/GIQeihkTvt1loveMmLa/7DKSEP
         JYon5EydF/hzN2iA5ALrvNwyscdYcCGBanbu68MR+R4YFxJ+p8ub/QWUkL8cPAGB3o+h
         BKdTZgTstScjomyloBLHvI8x9B7NQIT/e5j2TO6FnmtKQkmhF9DCzr339f30pCU78f28
         wyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEw9AUnLmXHhFdIfYaPUofsEvGQlUAzaxfODGxHAVG/LxwpqRmsum46yWeOCIcR++f9MIl9Ug=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh3JvoqiOQQoVFVawhNLtNbA2Mo99IvMx7MR80aCALfsnwMeXG
	dHK0tFon498ueBQ2azkyUFXTN+13lBaoorgGjnmLe5XejR/09t5S1PI5YhKj14jE
X-Gm-Gg: ASbGncuCTOfIeSbVd46vAsNfRr4XMioGpu92Yzc7sLf0oyuKXhI43xTGDjkdHLzwuS6
	ARy1nj6d/I4GbZgTMAulomsdvAUVofES4rkNQAYCz5zLH76GGEPpkIMgtU6JsGloBkJXtrI8uyb
	Nvx5YGGDdSky8rwiet39sf9fH/u/KuaKxrVubwdm0aqXesNLWyME1RwziN3tv9XxA6iV/BqdUw0
	pwfXPqHk5UZ551tgYTJD8CrnEHMtd/EqXigl1mNuIABpDnoI6Nj4bciNLCJCy7Ym4k8iFstEAID
	JNdiSE80L0usxSkV+nCd6owFeGaeHlW2Tbhur3XCYgMzvA4CzeuK5Q+V6nA4HjlM3uYTd1N0xzT
	JCSK1mXFC423LvzSkM1Y/
X-Google-Smtp-Source: AGHT+IH6lABCGe6nUJ3kPvVb563/6ouywKEcAdbkht5BNXwnbBe1ECADH5tMvk01xS+e301pC/fA/g==
X-Received: by 2002:a05:6a20:1611:b0:240:d12:775c with SMTP id adf61e73a8af0-240330fb815mr6956353637.36.1754546596218;
        Wed, 06 Aug 2025 23:03:16 -0700 (PDT)
Received: from ?IPv6:::1? ([2409:40e0:b:6bac:8000::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c2ea6893csm2864209b3a.104.2025.08.06.23.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 23:03:15 -0700 (PDT)
Date: Thu, 07 Aug 2025 11:33:08 +0530
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org,
 ath10k@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: Packet loss with QCA9377 (ath10k) on ASUS VivoBook E410KA
User-Agent: Thunderbird for Android
In-Reply-To: <20250806204018.GA14933@bhelgaas>
References: <20250806204018.GA14933@bhelgaas>
Message-ID: <BBAB0136-BB7C-4D59-B29D-2F35FC29D7AC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_230317_572257_38914813 
X-CRM114-Status: UNSURE (   4.07  )
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

I'll tell the guy to clone the ath-next branch then and will inform you pre=
tty soon=2E

Bandhan


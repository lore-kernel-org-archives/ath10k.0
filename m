Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D62C197A0
	for <ath10k@archiver.kernel.org>; Mon, 20 Nov 2023 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bq71v+XoXC9X6KPlisbDizXFitGk5MCYbVxxVEzwmSI=; b=ZH7YmX9iL8GiGSQJQ49poV6zcu
	F9PGOe1sTujFjhEzpyGxcadd/o74aszNWRHFatT+/IZbby4eJJcmSOMsqk3yHuE8sHw/m708J4MN0
	prPF/Jb+BdkyCf/46CtvTg2jCRtRAxwO3Tlfn8j0c9Jh+KmX5LDA70fdELYFo4TWdHpDEEtSBibxN
	h65wFoJF6sw47d5arKOmruG3QjcxVrKzB8W15vouuHZCj8WfEgSzImOCKzh/i/BjNwVT4mgQxZbZY
	JCAm6wkefM3t4DL5CDAQoPvNgMzDkEjMM+dlSXXZ2CCsJGL34pAol00D35gTgq1wQQAhXKIpFSVHH
	8i0YBP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r57s1-00DgMR-2g;
	Mon, 20 Nov 2023 17:15:37 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r57ry-00DgIj-1Y
	for ath10k@lists.infradead.org;
	Mon, 20 Nov 2023 17:15:35 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3b6d88dbaa3so3071927b6e.1
        for <ath10k@lists.infradead.org>; Mon, 20 Nov 2023 09:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700500531; x=1701105331; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ql0g3tzh+gqE/f9mnzNJDTzWt5oirUW3agwQcz0Uqj8=;
        b=PsSkm5pCz8UOtwpkiGNbBmeBlRIFHNM1N2u98ltklGtO/kcHhrxUlrDr9VUWHLgx0U
         oO9SWypAyLuyE40+4qPQ2/057LchB9RZIxJjwxc69+fj56Z3I+ZHlcMEpSYwIg4MRGvL
         H+WVXqgOk2PrqtobEPPtSY6pY6niWK6n6hhbjrBVUSO6ns6ERcKigK1FBr4AuSXoEj8o
         g/s5Vus/+VQLIP35caockU0BXdFeO8YrJrLpS5CetKseMd1mr2N2DlTY89M/NDaTtuzw
         qsU/zGQ5Wc2ywqsDMenkFcMAe3ifBlwdupGmMxP9671bi5uumvAcxAoFNMn5U+Qi4NL2
         +UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700500531; x=1701105331;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ql0g3tzh+gqE/f9mnzNJDTzWt5oirUW3agwQcz0Uqj8=;
        b=uen2msNgVgP42cTaz8HIvLGhkAPdbPiYfLroBJY6hyLLSm24GB97+ep/UQ7qVKpG6L
         HBLStq6J3hgH+zylc/fcfzDFW4ziGRLEOfg/dh+eOFe7Aq1fertaNmgOZ6yzFHEHe8ky
         yPyYnzL807R0iKUElU/KZTTPcinSPkqr7n15lwF86eLirb1J10pOTmADslcjhBEq0TX5
         ReYzlJJum5QRv5GYInV2x48Ht1EW71yOJCEIH8R1AnMJA1gf0+6/3sm+2v2A3UH8m181
         eVfg0AhFRRaafO7D0IU4blWfEdEil0TNq79AG15SpLC/qETHX2IuTu8M75qd3+irpEqJ
         xwsw==
X-Gm-Message-State: AOJu0Yyg0Ae50Fu4jJWEa5d+JLy8TG2mSGBCuuBip8hQstDyZzKZIh3o
	lCmExClSV8B84IFBLLza+3dKiEiS124=
X-Google-Smtp-Source: AGHT+IEFMyChMtM4klEjCNMbFimxh5/PdhKrcJEqKBRt5zRU8b+XiodB67OGO+kwN/5uLCYe6pS/og==
X-Received: by 2002:a05:6808:de7:b0:3a9:bb08:d468 with SMTP id g39-20020a0568080de700b003a9bb08d468mr8982453oic.55.1700500530928;
        Mon, 20 Nov 2023 09:15:30 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id ka8-20020a05622a440800b0041b7f007546sm2762384qtb.82.2023.11.20.09.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 09:15:30 -0800 (PST)
Message-ID: <304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com>
Date: Mon, 20 Nov 2023 09:15:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
From: James Prestwood <prestwoj@gmail.com>
Subject: Power save setting while interface is down
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_091534_618440_F7F34AA7 
X-CRM114-Status: UNSURE (   6.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

I've noticed a somewhat rare behavior (<1% of the time) where bringing 
an interface up fails after disabling power save. This is done by IWD 
when a user-option is enabled, and follows an interface 
removal/creation. The sequence is:

1. Remove default interface

2. Create new interface

3. Disable power save on new interface

4. Bring up new interface (rarely fails with -110).

iwd[1286641]: src/netdev.c:netdev_disable_ps_cb() Disabled power save 
for ifindex 54
kernel: ath10k_pci 0000:02:00.0: wmi service ready event not received
iwd[1286641]: Error bringing interface 54 up: Connection timed out
kernel: ath10k_pci 0000:02:00.0: Could not init core: -110

I'm thinking maybe there is a race between creating the fresh interface 
and disabling PS, then bringing the interface back up?

Setting PS after the interface is up (so far) seems to be 100% reliable 
and have not yet seen this behavior. Regardless of any kernel fixes I'll 
need to reorder the command sequence in IWD to support existing kernels, 
but before I work around this issue I wanted to point it out so its not 
hidden from view.

Thanks,

James


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

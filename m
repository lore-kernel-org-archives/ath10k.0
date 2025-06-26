Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29F0C7EE30
	for <ath10k@archiver.kernel.org>; Thu, 26 Jun 2025 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wFpFSNBlPSYKrWJWlVZXFjfkWtDUfucxIxKm4CrwNk=; b=Hom6U1SbVKIXTAQoucATA9vgGD
	weI5CVyUI3uiWbz1DzmBCeFsrwvJ/EeV9c4Ld56pWjAhmbz+s+xEiKwuhXdkkVnMapDJI7jOJgtSg
	MqVu+SN7wcNLT/E3Nhwk2NsondsS9kS0AhGJfSFO03hwHCzvBTx0e5vIsPZyewZl2OojrBMFNcSN0
	W1PRmFp3YiMdf21CRHjECIJ9NdIDgurF1oh9V6CtoykHdL/r+LyU3vaMnjXssRnXOmIXADyvuFanR
	dHPSvm7hWiQ+nEtPkzH+InsK3Cy3abQJdwzdYAwzNna18f+uIzSDc4ht+3Vn45WGWg/mnJDkELxz0
	6796QIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUp6Z-0000000CDSL-3c20;
	Thu, 26 Jun 2025 16:05:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoEn-0000000C42D-1DPw
	for ath10k@lists.infradead.org;
	Thu, 26 Jun 2025 15:10:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a54700a463so746439f8f.1
        for <ath10k@lists.infradead.org>; Thu, 26 Jun 2025 08:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750950604; x=1751555404; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wFpFSNBlPSYKrWJWlVZXFjfkWtDUfucxIxKm4CrwNk=;
        b=daR8AbhNM5FJjT9RtepBsvcKtuD6S6ADF5Trva9mL0N7YQ0RwTXtvoCKphmAqzi3yd
         ufEUHzeN2OYBBa/KbTHky85r8bx0FoMOI0FHyT0ilZcCNVe0c66QVJrDCXewxtd9qp08
         MbyWBemnHHdA9X4ICOG8yBizbdQ8BCcrAtwE1Paep9uhmEdY8zDZFP1JVX0h5ghskmnn
         AU73i0yd9N1lv/REW1tIaXe2Ra7Quw1HVIf4Hf6gfijBGnW3ZZgrxlWMe6tDm3bW/o1A
         sV+cIKbt+z2C+3kTPhhY4yOjVsfwtxH0A8LhaRSekPpDDZCJJmNFSTKkE3jw5HorlZey
         uxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950604; x=1751555404;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0wFpFSNBlPSYKrWJWlVZXFjfkWtDUfucxIxKm4CrwNk=;
        b=py8YkEtBYSBszJ3lBXMpYoxySJU6VBDHYS63PaHvEbZ79R5u3ygN9pi+4IXn4yfjiu
         fgVxPPUCH3ZzA1nJ4RLe3h26AnWEoJrTx59n624Uxxunqu/QK8PBp6zbIzrFjiIRKSo0
         UcEinJTCBXN9FsArwwzaiBFcN4d/JsTpfNb0jw3UFSt28j5uliDlA1Or77stjH1rvxc+
         /2EnyBI3bkg2+m5q3VE4eEJ0qmktOiTIGht0gB0FyiyWJxwBMP+T3sk6MFaRCu1B1Msr
         sxWvC0jCmiHs4ppRBgq7mg92M4ZX2IhwHWHPZGoVmm7lEgc9DYcL1H2/jTtjaQNAUFdQ
         rihQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB2y6sU53gRyV8zTX8xUhknCT85Mw3WJFA/YWjvsKmSdH+NIvIdamM6G6DSvUjt2eYZRpMYbw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfnf2Mjgq6ynAMcYz82sFYOhYXPhwLb/7cUxxgCanR67fm3lth
	fMhSEgYIr5hbBzuGwUxgCR7oNQY9I12fvNq7x5ZR2xUgkhhQdVIqEfwMceq4eko3EGg=
X-Gm-Gg: ASbGncsv9+9pW9smiPp81yQpFO2tPmUZxhsyXaXXdbHLSBhka1DdFWpxZClKSyZLCci
	akW31HqQHNyJcshCsYyKNZeQNK05J+zIj6DXap3hbJbnIeEWzwBbMvbhYwVJ+x8D5ATQZDKIcxc
	AQ/VqLUIn9A7kJe0gQUdA2nbu019RJhDicHp3qhOMft6Uw30MR3lCdjRCBSsCswnd8bu/N24boC
	MNTaj5pwNlslV3uz2gguxoTYna5Go3FOjmTtMvTYkkQPX9O/ZARhWni5qgTTmrl8JW6UZJhk8GD
	WkGPVK3R73b8q/lVms4rGzr7PhfDMT5xRdyQdR3Bu9W2lLA+wlI8EveRPZ03hErCT0c=
X-Google-Smtp-Source: AGHT+IHVOJ5MNC7ERblDoBGa73QVpPtUVJ5JmIUJbTGb7y/4g0eYkLl3QwmmIgJKkXreAEOr/ujfsA==
X-Received: by 2002:a05:6000:288e:b0:3a4:f7ae:77c9 with SMTP id ffacd0b85a97d-3a6f30ffaa0mr3613832f8f.5.1750950603610;
        Thu, 26 Jun 2025 08:10:03 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52af3sm134620f8f.50.2025.06.26.08.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 08:10:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Jun 2025 16:10:02 +0100
Message-Id: <DAWK6QA1G5A5.354ABXPS2F2HQ@linaro.org>
Cc: <linux-wireless@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [question, bug] regularly disconnecting wifi on RB1 and RB2
 boards, ath10
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, <jjohnson@kernel.org>,
 <ath10k@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
 <3f6c106f-cbd3-4f9a-8e7c-e43b51457bfb@oss.qualcomm.com>
In-Reply-To: <3f6c106f-cbd3-4f9a-8e7c-e43b51457bfb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_081005_350309_1829BDE4 
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

On Thu Jun 26, 2025 at 4:02 PM BST, Jeff Johnson wrote:
> On 6/26/2025 7:48 AM, Alexey Klimov wrote:
> ...
>> Any hints on how to debug this? Any debug switches I can toggle to debug=
 this?
>> I am happy to provide more info or test changes/patches if any.
>
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/debug.=
html

Thanks! Let me try.

BR,
Alexey


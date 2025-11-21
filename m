Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407FBCFC279
	for <ath10k@archiver.kernel.org>; Fri, 21 Nov 2025 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4E4qgWLZbJvc0nks66Kf2sl/KD3LP6StGpvCGYDfDXY=; b=LAeSD/05D4pSTCHC7NhDDCruOS
	910fHZPyUDAFPg03VudslBSht3h/70dAebn0o3kUUtZV8oWydD2wusoOJOVlU4/xO8DtiVbTtu6ae
	a7BEuFzM+FB78UFWn+4oCRnkeOTBItiHKhqTsEce2/tshdu+sPVDI5IJoDtcuDiYe3j6DyoSM4TS4
	kAPcP0HDAekeT5CkU8Kpk+HURjOr1I4386bxQoyGtS20DfgDfQMsYCSbFjmthln6cjqldU5Y21ZMn
	QYS4B9cgc+rfbTn51CKQX+pl/QjlUTXSEXKvvY6xn3pc9G8GMpSNtwWsPsh2s5AKikk9P6K9j8hfF
	AMRRSGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRCM-00000008PcY-24ol;
	Fri, 21 Nov 2025 13:29:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRCJ-00000008PbP-0Atm
	for ath10k@lists.infradead.org;
	Fri, 21 Nov 2025 13:29:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b75c7cb722aso300928566b.1
        for <ath10k@lists.infradead.org>; Fri, 21 Nov 2025 05:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763731749; x=1764336549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E4qgWLZbJvc0nks66Kf2sl/KD3LP6StGpvCGYDfDXY=;
        b=AWolaUjX4sYRdipBZzETXgd4PZKzgXltuCuHTEMtwZBPutkMcVj1DuFQaqEeVJE7X2
         Py3Z8P18LQWaRS/V+O7V6/TvA9EEYPrL8q3ZQ4EeknHuvyIWjnvLcigCdnh5KPL+DOZu
         wh8qsxql/AVqCobSqLkd8Irw73lHJfob6hWZV4l2ZLSsKJ29FuTWkQO7pL2c9zZ04MQ8
         zv3vWjud1POG/zzCttSJ6hQpLZYbanqDiNKLPqsMqXTh5BLOjZ945CQSmX4hHBRGGzPU
         rn4ob8qrQU4qHaDEbRWZTK9dWMfK/hGVYHX2tL71Z3I0bfJK6CEBCFwNxINwMFqK3mb7
         S96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763731749; x=1764336549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4E4qgWLZbJvc0nks66Kf2sl/KD3LP6StGpvCGYDfDXY=;
        b=wFAhQyGBBqx5U0tRQNKH5y+l3S4WY3DNvqbEvthfbpo5BeMziOLJujsIhz1Zcqswr5
         nRlHhNMxafE4+Z59VwbLIyfzAw3t4sGMw9SYuSgex4kTSai3DImaf0ed7LDGhzYoDnVW
         JeiB6zq/OWmMohmez3/8qiI6a7yqm/XPHqUlNpMPG0qVTrJbN1PTlFZ6HA0tltUFhQ2j
         RV5wApKA3dTmiQd8jEITE43fItTThGV7O9bhJIZKd8O/q819wKhsEJPshNjABBCxOoaC
         Che60kH8IceTVN1D1ZZMt+eo4IM64HTkmEQJ2Q8bGdoartS3KLbrmUgloB+UTfiA0TbJ
         LbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK2ma/2j/Q8+eDuPRjq6nu1cZ+KY2EhdEumZyzLdeweiyGXonZq1lNwVeUQij0scbVapVGbPM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpV6UQDFHBkXuLRMX3e8drlykKskzrIcW/bxPUMWTxAW+uMGa8
	V9wTnQRi7oj6S/H8SUzNTaB5mn1AtwoPakI5Y2RUtmu8TOYka1ARrqiiX8D7ZI0=
X-Gm-Gg: ASbGncsjK8Z1Za5FZjYZ2wkjUJhfS7fhTbItb7h5jyKWH2jXxrMMy2Hz/1Ut6n9Z807
	C/dTPvH7Q8cGXxsEGd+u9l6ArmoMG95YwQFMIjqhzUvxPsiBHuOmdaoTSK74+A0JTMgM/uxBLey
	V0w4wDOgbYFfpY4zjti9nwoLVlPNIwcpCKyJxmcQB6Mjj/Vc+S4nx6wHgSS+eltH/5h67B8ro15
	+0ZigLXBwcmbrENTTZdIjzxV0m6CoXaZwoEr0KlzwV4xeqG2y96wHZiwwirU2qUwTfbSkAcIF43
	ADZQLr+oMdPDllipyyKdLXZsck7VgsFjgm7dHXz9mzu99QnY7IzUH0PVxLFLH6q6aatLP1K+7XL
	X3XWJK0u6zm2oe0ffnyaunwf70E169yLJX4n+EUgQC+vC5Tr+0gEeEEMlXeb4TMNwCB6qtfOew2
	dlWAzmuPZI2jPLhw0X8oumNksDNCctyWoTPbjtjM6y9wZKeRo=
X-Google-Smtp-Source: AGHT+IF+fRHUXtIbFHexbW+bX7vS6xhtJysRXvMNTGrbcAbQOhcG/TSSGP78YliQlRoGmwcWofF6oQ==
X-Received: by 2002:a17:907:da4:b0:b73:3ced:2f66 with SMTP id a640c23a62f3a-b767159eea3mr272040066b.14.1763731748949;
        Fri, 21 Nov 2025 05:29:08 -0800 (PST)
Received: from frutis-latitude7490 (public-gprs376887.centertel.pl. [37.47.103.120])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b7654cefe53sm459963266b.13.2025.11.21.05.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:29:08 -0800 (PST)
From: =?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: =?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>,
	ath10k <ath10k@lists.infradead.org>,
	ath11k <ath11k@lists.infradead.org>,
	ath12k <ath12k@lists.infradead.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Kalle Valo <quic_kvalo@quicinc.com>
Subject: Re: New staging repos for ath1*k firmware
Date: Fri, 21 Nov 2025 14:28:25 +0100
Message-ID: <20251121132825.1663248-1-frut3k7@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_052911_107504_6D06642B 
X-CRM114-Status: UNSURE (   5.35  )
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

Hi, is it possible to release the new firmware version (2.12) for the IPQ8074?
There's a problem with the latest ath11k driver on version 2.9:
https://lore.kernel.org/linux-wireless/CAKEyCaD8RMqPvwZOxgwAT4G=h-M94ToxoSdYwCjfvZMiM8mB-g@mail.gmail.com/

Regards,


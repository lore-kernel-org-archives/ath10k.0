Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973F3FC72C4
	for <ath10k@archiver.kernel.org>; Sun, 22 Mar 2026 13:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GsofZZy80LqOViURd0Cth7grp341lX7nawvGMXam0pQ=; b=O9+ZEMxJe+wKgfoT6R97OdU0h1
	HPCp47yI/5mBeYpFJUq/hGNNPpqIHyTwQ9OpT3qOluo4IzUGXTRZbjCn6xBhZfrpsdwyyaR/sqthY
	7grePrABkdjqi6+avNN1hBk8a529LYs/3NlwwU6IrOsq5CLkYwE8glMHRSwXzn6VAuf8oWEX+VskU
	Rd+mWdb3S0zCR52gfQh1jn77CvRAtkMb8OHdvk2UwflV6/XklU+OW4mHrFUHBF9AswtMmyWDjuyW2
	ayDHO44QuAVFaPrTyD/fL8xtntqr9B4TfaG0oPsLFqp08F47jxZ7VFJt6dNzRoMVnZrrM8dg5AZ+c
	t3bmtVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JB5-0000000FNZA-3hMv;
	Sun, 22 Mar 2026 13:49:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JB3-0000000FNYq-0Zgc
	for ath10k@lists.infradead.org;
	Sun, 22 Mar 2026 13:49:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-486fb439299so26018555e9.0
        for <ath10k@lists.infradead.org>; Sun, 22 Mar 2026 06:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774187351; x=1774792151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GsofZZy80LqOViURd0Cth7grp341lX7nawvGMXam0pQ=;
        b=cU9pXSQJkOUe8tZL3g05Qkp22pjjFr6ASOmYxBRlUOb7pqoV8GOn44CscDFV+3SPLr
         34VqHwf5iMU4SkIysLkhFqZh05usG/cZf+qqR6JxSLREZ6Mudh5mNoZrqzuN8UGwUd6Q
         KQjbAP6sdLaju2e9BReTxIdI36Udie19HfjzCmNVRe6bwQ91eForvQx6NR8oKhwP3Cye
         4Kn4HE07NONqAqg2d1ljwMYqa69wcBmBFYdEL/ikHi200FBOCEnqUZZt+0DxuzwHkFvV
         qvalfVpyFJh2dDEj2gZ0THCCtXEGnptt7sikG1sGSgY/eoFr7ZISC7k74ThBamO39goY
         o66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774187351; x=1774792151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsofZZy80LqOViURd0Cth7grp341lX7nawvGMXam0pQ=;
        b=ZgiVjikOsCdC0EJvHXzg1vPPljjp7LQmq6T4ufuoveQ+JHlrZan4yMTowhsHdlIubT
         cD6QyggpkW26ufyVnhlbhz2pTv4dwOw1EjtJbWRtgex+knM3VeT5/BwxA08RKEiZHHO2
         fwdyTtqZO66DqmBgR4W/o2WRA4idao4LbOTZ9RXUIwwztyGJ6sq8W+rj67/DMIfNG/Mg
         TAKpfa4k/8m/aFNw6oOQevV0dL7QX2wjzwBgla2zZ6kM6fOZ58eM7fDRBWmdHCi3JDdv
         U5wtWLM/0JklJgumdomRwB/qJ8+lZsELWqxY6uKJXo5AuXJF2eeu4f+NwE7HJA2HBIaH
         AibA==
X-Forwarded-Encrypted: i=1; AJvYcCWuLne4SaRZ69J4uwN4End5qiR0fYorMRjqOGfePa2FzJvE8KXJNR6Bo4QLJ8RgTjHlStT3EnA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/amPyDGX9NxReIZjMpe5SxOvSCUW5xcw94mQfAa/DMBmMS2eB
	cMis/7aGDjn/0Pr9JFnGN5L19O+znOyUEQ6g+HwiPyqJSDFBe3CZXg0G
X-Gm-Gg: ATEYQzzK7uC7jiOjFGiszU0vJlG1MLj4nAdbeM/AR4f8PP672SE6hdiQ/t9gSHwJe+h
	OTkq7RQd1/kXcHy0OW42MPet3Q83/VUyU+WV8fQOCS9VfMb9Ufn6KyJdX6dedQD8oU6ZqeoIHmm
	aX6VFFk8adbNvq7/cLPdfVvatupSQaAww/HoGDJdiyNgj501SXm6nMqHfq63R/b2GPsnM56ocVM
	1UXMrXvd/QXjuGNMFL1An3qRe1EAAv5HehrQQf/zM4ATkEjbh/kInkwuFSzDIwv+diITNoyZ5/J
	NNeAQK66FlYnU/VsHt5RczwKkpWA81MIqGeRiEO57PY8m60qv0uBi8W168DYbh5lBAGuVYXxMK9
	zeVQzshkrUlKuRJxN69UojLJyLDvUIR9lkv6mr+n3M4kTqxof8Fg/73yeYXyVefQBEJH4L4VE5I
	KoFpS33GnzK9XDvBnRSfNIVg2HfCvU57amF7JjhsjDHnCUappSFCNVH8KhOiICpucc0RhA+QRuf
	XeSEsTV3yLd1hjteuCDmyqvMQ==
X-Received: by 2002:a05:600c:45c5:b0:485:3f41:e113 with SMTP id 5b1f17b1804b1-486febb5d16mr127573655e9.1.1774187350439;
        Sun, 22 Mar 2026 06:49:10 -0700 (PDT)
Received: from DA4-DEB.fritz.box (p200300de871aef00290206c667fbb9b3.dip0.t-ipconnect.de. [2003:de:871a:ef00:2902:6c6:67fb:b9b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm268260335e9.4.2026.03.22.06.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 06:49:09 -0700 (PDT)
From: Malte Schababerle <m.schababerle@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Malte Schababerle <m.schababerle@gmail.com>
Subject: [PATCH 0/2] ath10k: WCN3990 firmware workarounds for WLAN.HL.3.2
Date: Sun, 22 Mar 2026 13:48:20 +0100
Message-ID: <20260322124822.230492-1-m.schababerle@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_064913_184074_35E5DF51 
X-CRM114-Status: UNSURE (   7.21  )
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

Two firmware workarounds for WCN3990 (QCA6174 integrated variant on
Qualcomm SM8150/SDM845 platforms) running WLAN.HL.3.2 firmware.

Both issues are firmware bugs where WCN3990 advertises capabilities it
cannot handle correctly. Tested on OnePlus 7T (SM8150) with
WLAN.HL.3.2.0.c2-00006 and WLAN.HL.3.2.0.c2-00011.

Patch 1 fixes a deterministic firmware crash caused by the quiet mode
WMI command. The existing guard from commit 53884577fbcef relied on
THERM_THROT not being advertised, but HL3.2 now advertises it despite
still crashing on the command.

Patch 2 works around a bug where active scan does not tune the radio
on 5GHz non-DFS channels, making 5GHz networks invisible. Forcing
passive scan mode restores 5GHz discovery.

Malte Schababerle (2):
  ath10k: skip quiet mode for WCN3990 to prevent firmware crash
  ath10k: force passive scan on 5GHz for WCN3990

 drivers/net/wireless/ath/ath10k/mac.c     |  8 ++++++++
 drivers/net/wireless/ath/ath10k/thermal.c | 10 ++++++++++
 2 files changed, 18 insertions(+)

-- 
2.47.3



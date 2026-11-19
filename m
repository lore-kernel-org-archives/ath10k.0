Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75C60A2601
	for <ath10k@archiver.kernel.org>; Thu, 19 Nov 2026 00:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zf3LA7Nv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAji/SZ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NneEHT9afGNlYm0ZfBjltKXbYGbaj4NHU2mtTyQ52S8=; b=zf3LA7NvqelzysmXmnv4mSNIHa
	fjuG/3pPDV5lmCnE4SM7QcZCtl/fMvTVyfOYR9IuEG/rA40Po5LdxdIATX4mTxaCQfBDw4R8U/kyy
	n3qCkZHPSxSmGGncW2FbPyVOkogVnnIPJuAwDhg5AEPUI4XUJAAI2L5NX/cYNnMZ7aCKkjQKIX2fe
	sxJ+yQxrClzLeKI4+3OYy4U5WbpmynaE5o8FNyRbrxejUtzhPm2LpbHcJ/JDQZw234h+s4GZQF9Kl
	tWCF18fvyvoJQZyHkzsvzM7fWVkV3TkKYg+mgT3mSC2JmNZOO3EdHmjRrlEg/mr024n4Q9MVD9l+T
	p5lM3C6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTq1R-0000000AZjp-35iH;
	Thu, 19 Nov 2026 00:29:05 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTq1P-0000000AZjT-1TNS
	for ath10k@lists.infradead.org;
	Thu, 19 Nov 2026 00:29:04 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-921159376efso17192066d6.2
        for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 16:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048142; x=1795652942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NneEHT9afGNlYm0ZfBjltKXbYGbaj4NHU2mtTyQ52S8=;
        b=WAji/SZ3/XogJC5afu3WTEU1odw0PV4lJm3EXGFb/F/81lvdIVVGnfVHSeyoQD20je
         +8A6J6nfhSlXeTWM5NEy36D7z79wQc0OGP/JOMtk8ioMO+PUhUBfrkZ0xXbvUAo3N0n9
         XKi/hVozK4DTMEJpwHyqOopZMwyC0yyfR5cc0bXAJlsjSDx8V0bfz0wyZ8szyI6x/wN+
         F3+NlMfUc+09HY7q3bAGsiyCkdgnzYzlLCCP35O+NdFXx39d+2DIpn/S+VInfJd9Wbk5
         4dRWHLxuuw9Qo7izGf657OE5yRb9cvopVAvyshp70GBmHxpkamA0sOz5G8+HHo13P9jy
         owfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048142; x=1795652942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NneEHT9afGNlYm0ZfBjltKXbYGbaj4NHU2mtTyQ52S8=;
        b=r/6KEj0G1SslSvBrShOlqWGBIM3AjLy3l0nd+VO0l2VsiqFuwJXJYOqfkfDR06FeRk
         kNQXNnWyKwY60h5tYbJ69hhlr1hiAfndMYKnlBsDCZ8D63MwWHNgH15MTqh/5GARxtvS
         sX6rDAmQg9XUg6punJ2ULJy/SFgmyH63UEbJGhH9U5K1JoT4TgXe/i++d0rF7cVUjpHv
         R5ZDxbLSi3uiUCX3Js3SVvx7YCy0rt+cYf6J86E/H9+ABNgR5CxsF8LEPBVBhJxOR7C4
         nZyOFf8oRPvXEglUrQhV6E7r2UTnNG20GNOsKVKrJ7z2dYq6Yp0QZF90of0/jhNzYKP2
         TKhA==
X-Forwarded-Encrypted: i=1; AL+hErHN/PjvnXW5LvF/3nRseC+ZH1UMFBy5imnRw99IIVkkijKG5AyOi595efRYzPM88Hq/FgYAn84=@lists.infradead.org
X-Gm-Message-State: APuU4Z+ZcU6X0MbRnpIgC7b4IlugrzBIXxBieSum8BA7EXHZe77VJgGJ
	P4IWevHvUn8ghwFjPVgv93jxWd+TppBb3Jlcn4Gl38kgo+GDHOMNeVMy
X-Gm-Gg: AZFdTZdvXLZciSDUHSXpbPy3g15SU1Mg3YBmnkU1K9Kg34s5ME5Mr+OpjWLgRPpoVrX
	F6ZfVXQzaEcbdLHESVlLs0oQaXM5HFZ9J+rXgHYRjZP6oGNugJGjlmICOMJPZ9G1BtaehAHU0jB
	objY0lZSBFv8qAozHfsHtVoJVz69GltRACPR05YkOjRN70GJZ/gh/3rQJtre9I+pcawoq5Tqg4c
	+/r7C/KJEtFOcsJkURRNDkmQYiGHU82C66wEYrS8SINu5MXqlG6+DeFOb7j6nIgu8KlKu0YHdEj
	xcAqG+RtZTnGKrJ/WFZ+lOls4Stl7srTaKY+g5c40DNOgBpYA3wzUbDrBpgNeTjWSlG3GCgv3mm
	UK4LK+Yio1jKW9kjNZgEMgjzuFFQXbe5O65GQjgGavKhOfNzHpl2E06GCT2mBPJAIRy3AyI3mNZ
	zJYvP2iVcarbNe/C2rCRs9di27AMd9lJqQCZnLVFjkOrtNdwManhfenjKVfGiHkuj4DwjXOyeWX
	TUt3aedGrh7sQVTjvtsjRS7AM6y3bK+Q4wqKgp4ipxPeG8azMaMpIHyF938jqtr0AB2yqgnq7Sl
	s0ZFY5y3tdDvutmPQOWTqh5OcpAwwMCNfORGO14LHO8kzZGBtdZeKt8ljlfvl8wxAR7x0x3BqtL
	NvGU/Uzv013Iu4+n6g31b
X-Received: by 2002:a05:6214:4306:b0:921:122b:80f0 with SMTP id 6a1803df08f44-92114f90a80mr69392036d6.46.1795048141981;
        Wed, 18 Nov 2026 16:29:01 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm34925086d6.7.2026.11.18.16.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:29:01 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-current v2 0/2] wifi: ath10k: fix leaks when HL TX fails
Date: Wed, 18 Nov 2026 19:28:56 -0500
Message-ID: <20261119002858.425666-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_162903_391986_9DD3C6B8 
X-CRM114-Status: UNSURE (   5.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For SDIO and USB devices, ath10k_htt_tx_hl() leaks the msdu_id and an
skb reference when ath10k_htc_send_hl() fails. v2 splits them into one
patch per Fixes tag.

Found with a static analysis tool we are developing. Compile-tested
only, with x86_64_defconfig plus ATH10K_SDIO, ATH10K_USB and W=1.

---
Changes in v2:
- Split into two patches, one per Fixes tag
- Target ath-current instead of ath-next
- Link to v1: https://lore.kernel.org/all/20261118052116.3901761-1-lcy8047@gmail.com/

Changyul Lee (2):
  wifi: ath10k: free msdu_id when HL TX fails
  wifi: ath10k: drop extra skb reference when HL TX fails

 drivers/net/wireless/ath/ath10k/htt_tx.c | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0



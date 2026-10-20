Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33432606A31D
	for <ath10k@archiver.kernel.org>; Tue, 20 Oct 2026 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IuzYZ8cm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s+Qv9Z+y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=; b=IuzYZ8cmdDjHn4yMhOdXdIrxzH
	UzTbl82WvjYFzyoj6tRqYeDSNqYMNppgHSQxpNLXIZVFzI4FWhm/k6JGuMSsThnnTtErOsQIu4vSC
	PgZm5RQ7hCZyJ0xaQHm+BrSYTrHo6j7ig2D2ens8oiQWo1F4FGl652AgnMt5ueHIi6XXr/r3brJ1F
	iwD2+5kPDX+pVWnRkub65xpxoP9L2CV+GapbsdX+ALEwERw5Gmd2zoIyIPylOypQSjKoilygvO4No
	sB7taRvta24PPF0WuisLor3U5lPi1IrEf9WbT0CxxfPcUdBj6nOdUu6BaNa5CvH71JeIE50oy5lhW
	jx59J8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFqy-0000000AYqM-0oNa;
	Tue, 20 Oct 2026 19:50:32 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFqv-0000000AYpu-3gje
	for ath10k@lists.infradead.org;
	Tue, 20 Oct 2026 19:50:31 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso2951885e87.3
        for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 12:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792525827; x=1793130627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
        b=s+Qv9Z+yhFY8tl0GVWb/RZw4ehoUDRwRcwckcDIi9yQnhg+H3ij4SRf4sipfk6+JGI
         qlKcwL+qgLU5pTUSyxJvkZJY29AyhFOKyEcgaTVkvtLWX0yrDmmMUmlDQu/CSGXWYMi7
         eJkejrb8PjCMwY6HPt8q9UFaNxSp1f1wKPUWljdjIDiBWviPeUTWH8+2aRqGmTKavNhC
         HqfEInz/gQxcAjX4DFnviJ9Dv1CXZMsl/CyQ3BIRLkoJQVE5ObrLxUcBE7amjASYPRHw
         xgjQjbZphxXcnZF9YzhWkSNt7aFkcSRry0bBDVDrZlJki7vlOawFIR/aYAh7lTuIdTMU
         UK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525827; x=1793130627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
        b=vfENvMmaRMVYTGuP096UOSeAf6X2HrDHoBgiPgVR58agQnB4xeiqEsImnsWo2W0IYD
         vkmvO0V+xjTuAg/mBbISmoiaU76r7ayxpJ5ACyPgGIE7LayI7aAQFYpRiMAAWxvtu4zH
         q8Jo4wUYHV6eXTi2d9ERNjZePXUmAJ3uQlhNIEwYiSRTiZUr40ke8NH0WXTtRK+0Hl5H
         gk+BYWVLLWJXWD8H5HjO7gnBjhd7rRStq6Alo5YX3Ga6pA57UHxRYUsavosvR5KXDheg
         fOiYgBsrMB/5WJSYqQi1vwNgKc1YV/SU1ND2TXWWfOa8Fi/W0CYkfLLMkE6bqFwDRR3E
         9erA==
X-Forwarded-Encrypted: i=1; AKwUvBz5iuZQHD82paZCqE4QVC5ZM2UCVgoT6DgoJHBDgMsu4NKFY3/wONAba/fCrDMXPBE49Dl4fPY=@lists.infradead.org
X-Gm-Message-State: AFq9FYLNaBAguQiK5M1S1kQAcf+Dk7+tU9tSxjw3r9NVIjLgNO4UmxYT
	XlBqb6vxNndMg6QJCAogLKkyMY655eFmXe7fQmTd6b0iPsd4zHtQTSwR
X-Gm-Gg: AYBFou2qwJjvhRIj9hP0QiDaPir5F0BL9HrxFMkgcde0sKi2AodcuAD3wiMoy6j7uDZ
	D0gq/AB83bvzxCmuRchbNbC+stq3WXYwPqt7Qoy0EDII2FXi/BOMGL30bg4zX0YI2zBXkvbvmA6
	z+K1TjBre5nc9/5sooOIBU8MS/YDGxsEdlgIYGY2HYTdoFxB1N5mT8X3F1xoeOMb3AUewagUQSX
	8oCbcrz5pzaC0Z/zcSbYLdNLXnfHs8euiKkIvcWq92xTdp9SgYFVeENbRvoOSzFiZEKbPre2H0c
	2YYHbzTVHEZa0u3D/TwOfrbgeGDFz/KBbhkopkIPiCHcGmkABF2KMb3jdTQT1YvmT9Muyc46rc9
	nXdTJ/+i6otO7+oGCGKZWn7wJq1UFp4G8CvukZ99gKls+6RhDDqhy/r9dxFhNLXfr7zadgGHKMV
	PsHA5ODiPkd6r4MRyiDHcfmG8g74S/zBD+YcjC2EXekdy5CrNk8vsfi6E7ngd2pJHZPhJvB2kB0
	tbpBxR/KCisnZ75GQJzR79ouKqYyxRZvtnNVc9cB/jVaRj5SS4gmEp6sdnggT7UxrfSnXvjNgFO
	expe095ypSwbdJkxioNgOEb3BwxdbfTnzV7Zs6QhT1VW0ZmMuBwpUQszSwMwecthBM6ukcThFIm
	O1Q==
X-Received: by 2002:a05:6512:3a8a:b0:5b8:bc5e:b57f with SMTP id 2adb3069b0e04-5bfa1c1fb76mr4379e87.55.1792525826617;
        Tue, 20 Oct 2026 12:50:26 -0700 (PDT)
Received: from kompukter-Systems ([83.142.235.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa11a8caesm75345e87.5.2026.10.20.12.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:50:26 -0700 (PDT)
From: Andrey Derkach <gabin278@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] wifi: ath10k: make in-order rx amsdu buffers persistent
Date: Tue, 20 Oct 2026 22:50:20 +0300
Message-ID: <20261020195021.1133728-1-gabin278@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz>
References: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_125029_933612_E50DEF8C 
X-CRM114-Status: UNSURE (   9.51  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 20:52:07 +0200, David Heidelberg wrote:
> The WCN3990 firmware may split an A-MSDU across multiple HTT "in-order"
> indications. Mainline drops these ("failed to extract amsdu: -11",
> rx_confused, recovery), collapsing throughput under load on affected
> devices. Stash the MSDUs of an incomplete MPDU in the driver state so
> it can be completed by the next indication instead of being dropped.

Tested on a Lenovo S5 Pro (SDM636) with a 7.2.3-based tree, on top of
"wifi: ath10k: trigger hardware recovery upon rx failures", replacing
the older out-of-tree version of this patch we carried before.

During TCP downloads the firmware split an A-MSDU across two in-order
indications (once in about 39,000 indications so far, counted with
kprobes on the stash and resume paths). The patch stashed the MSDUs and
the next indication completed the MPDU, with no warning and no
recovery. Throughput is the same as with the old version, about
60 Mbit/s here.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.1.0.1.c2-00455-QCAHLSWMTPLZ-1

Tested-by: Andrey Derkach <gabin278@gmail.com>


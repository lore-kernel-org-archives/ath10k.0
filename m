Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2A9C433F5
	for <ath10k@archiver.kernel.org>; Wed, 23 Feb 2022 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIZJrFiZZcgOtYnPiIu6B1hQYOe1sC0fx1ThqWeeiLs=; b=AEK+AtKj+XSExy
	1wdDBopejx86VJbBHzQ8fI7Mgt9fVQD7mEjrIG3ywcbFIPJVjFbfNby28fANx4+hjN7v/1273MtsM
	y9OBm6TK6kntoamVAnBj+Qs0vJYhm0Glpu+wFoofs9yfjXIIBvJ+ijBkdsJLWDG4bbELE8ZmQPjrF
	x2zutTcfwNY1rvnKvrRz5QjQTwa5ce99DQ0+CjqX5CqlB96Tcg803TxmFjLrOSm9lknA2tAh+auX/
	G/nxtBJ9S0fO528YCEHtkuUtIEX4cLLOHqi8spxQe8qdhlqT7sdUVaofaj9Br4YcbaljAY6GG1yna
	U5hKtPILTi12horKhS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMxhc-00Fvu4-FX; Wed, 23 Feb 2022 19:53:32 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMxhZ-00FvsP-Qh
 for ath10k@lists.infradead.org; Wed, 23 Feb 2022 19:53:31 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cm8so36332371edb.3
 for <ath10k@lists.infradead.org>; Wed, 23 Feb 2022 11:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Id7gLQHKMx+QutSy3tPhG606eG0uppY8RxjJxXA7nNw=;
 b=nfP0/TUTFvI0Bgnwxl2ARIRvtRqF0RX9/VDvI/8ZVANfriAu/bHsn9sUCT17WbAr/q
 4LO2PzE4OX9qxD0hCp/CNWMBR/K3XXEwdWH3uN7EUKYPcp5fjNcqY0T9SZ0xJHmwatf0
 y55CJ1iGnrFp6Zg/L4v1FZl+BzyVpZggfN8Wu60mvmOIUT7gKzs/9xsahmH/UsOzfrfw
 Kd3UcromWF7jwwUCZCBNIxLEeAz2PKDlUr74Fc9yNoxw5EWvXA8FhtOekd7ptQ5c7tYf
 uLc9cN9bFQC1DHttpQlbRJgdFKROaXh82A4k0l6JgF508sBMeFeLbTRDoquL/lImpA2+
 uxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Id7gLQHKMx+QutSy3tPhG606eG0uppY8RxjJxXA7nNw=;
 b=c540ggAyZbSIJ0lA7ZyPDGQq8JepGP5tyq8Jy1jsmVqeI8SeR8GyhPh29UD2R2GP0F
 kxEXMkBLZjY3kUQVRFlloCytifO/DYzU/Y7TqRJcMaWnq0BcO/ul9o5BlA25wkW1nWix
 1C58gdyw9y3hmdomWscs7LTMDpji2VfL44TBcar5iS8CG6391HHCA+EJQHxosbOqWe1+
 U+e81qVC4+OY7Gs/GIDtpJrPv2bngIC8pclWIb6sz17Lj8cjuKJsbbJ7FbDd9U/h/nq5
 xAktv8Cd9kzn1e1kWnpCiHS+NZdBALYJUhYF+6ElBBW/db4HVTcoVn1XEWpphVrY3qJQ
 uzZQ==
X-Gm-Message-State: AOAM5319IdCiFSNckL/Ej6e8OzFqDPKI0Mx6AdyTv1INm2diR/evAKUc
 5KmHm7xNp5Jq0HEQKSHkwoA=
X-Google-Smtp-Source: ABdhPJzAxB4++MHSIAdXpeX+gKgOFrcFoLnI4/+wSoI7sbwlNSZ4clhNVhuYq3cl2XwGrQqvDS6xZQ==
X-Received: by 2002:a05:6402:142f:b0:40d:e8eb:1dbe with SMTP id
 c15-20020a056402142f00b0040de8eb1dbemr974004edx.421.1645646005490; 
 Wed, 23 Feb 2022 11:53:25 -0800 (PST)
Received: from debian64.daheim (p5b0d779b.dip0.t-ipconnect.de. [91.13.119.155])
 by smtp.gmail.com with ESMTPSA id 23sm232417ejf.215.2022.02.23.11.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:53:24 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1nMxhU-001Rh8-1l;
 Wed, 23 Feb 2022 20:53:24 +0100
From: Christian Lamparter <chunkeey@gmail.com>
To: linux-firmware@kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH v2 5/5] ath10k: QCA6174 hw3.0: update board-2.bin
Date: Wed, 23 Feb 2022 20:53:23 +0100
Message-Id: <5ed7d88456e5fef317b71705c51247597e9ff2b9.1645645875.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <da7d9cff16246c5c8dc003248a0ec4832606b1c6.1645645875.git.chunkeey@gmail.com>
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com>
 <63972ee8daa620c57eda5eb89221ecfeb55f46af.1645645875.git.chunkeey@gmail.com>
 <623e92dfaae9117e59c9ff9c9d1189295072d034.1645645875.git.chunkeey@gmail.com>
 <da7d9cff16246c5c8dc003248a0ec4832606b1c6.1645645875.git.chunkeey@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_115329_924515_AA95C3FD 
X-CRM114-Status: UNSURE (   8.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

syncs linux-firmware.git with the latest releases from Kalle Valo (QCA):
<https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0>

556321a QCA6174 hw3.0: update board-2.bin
d1a9282 QCA6174 hw3.0: sync board-2.bin from upstream linux-firmware
c987e38 QCA6174 hw3.0: update board-2.bin
b44d86f QCA6174 hw3.0: update board-2.bin
8ba5ed7 QCA6174 hw3.0: update board-2.bin
3ce0d6d QCA6174 hw3.0: update board-2.bin

Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
v1->v2: sent to linux-wireless + ath10k mailing list too (Valo)
---
 ath10k/QCA6174/hw3.0/board-2.bin | Bin 715444 -> 723668 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/ath10k/QCA6174/hw3.0/board-2.bin b/ath10k/QCA6174/hw3.0/board-2.bin
index 0bc5ddabc3354269822edd75fb7ab329c0efd6a8..239db8985d7aecbb6662db917319512fdffdc876 100644
GIT binary patch
delta 47
zcmdmTRr|_RorV_17N!>F7M2#)7Pc1l7LFFqEnHh(O)k)6nZDp9M<|nt`F8z7j7Q}G
DvL_Lq

delta 29
lcmcaIRcFgp?S>Y{7N!>F7M2#)7Pc1l7LFFqEnHh(0RXGF3ikj2

-- 
2.35.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

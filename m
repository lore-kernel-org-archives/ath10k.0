Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BDA606A333
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CRFn0ACa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIVlY84N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vEYZIcEN6miNF4ppvgk3ec21E8vDAW2BxTkHvXErz94=; b=CRFn0ACa81tyGzXL1DwAmgNO5M
	+1GwBYLigfT/kwgLtQNf5HKVLo3t3EbVOA2TBoTWOTqFn+XQtq+S5IRM/hNVi7FdSxQYmyGvbSkd7
	AF60SWMiU7OkfwBU5UCqMYmGLz2szP8UKQkrsNcJkihAGBJ52zzx00xeTWacy8gUNajQHVewixtOL
	mSmQGuFnZYsaP7q1LuLjLuMQDUgk90gpPa7B1ytPZj5JmUPlR3+8LsYOWrzAe7XRpqrfxUHWNYzyU
	JhYC8olz53npVC2IsRQ3+a22zXY+uvbG7NkBd20wSGdF8ufWBUWZsWLkhopY/+tatkVvzGuE3WnRy
	yJFDr6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr60-000000008zA-3ave;
	Sat, 21 Nov 2026 19:50:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr5w-000000008xZ-42y8
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 19:49:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so18294165e9.3
        for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 11:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290595; x=1795895395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEYZIcEN6miNF4ppvgk3ec21E8vDAW2BxTkHvXErz94=;
        b=DIVlY84Ns/KSiJSUq+sxpby/7aEtMvAAa9Y88rwYep26qpvTNV29/G038df9IePrxE
         0q2C7WIvCpxhC8PTQhnC4b2nHJN+ALkYx+l91FOLWtJWeCa5ZABo1bd8UxyCuVdzf7W9
         2GJgIRh24xOVdf+4lfBSYhmM7S53bNmS4O0gJrmVFEcXfMcfzuSEagYZv/3DyfPTxF+O
         WCsee78PD9erTjQfKU365dbvDJp1AIroTIWMwEwNJW43l3DaSYgSCs8Cp84dPDjlAGyU
         U1MyQFZKote1C9mzOXswhh843A6Nkmw/SnrB5Aov+qV3CN0wPTZt3bgbQkJSQ2d8pfyJ
         JaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290595; x=1795895395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEYZIcEN6miNF4ppvgk3ec21E8vDAW2BxTkHvXErz94=;
        b=y+4tLa7oxQ9bd7WVb0wnScuhJc7wOR8mpGrkBzT4np96rt+DlmL65XGEZOUMzasZPb
         YOvRsS1fP+QaF21XHQkTtpNlAOFztowA8wJ5IKQbm4rpkP4X9gTiP2Mly2sKdr2WsqEv
         MfiXTpdDsKSJ412CNT7WhKFrOPUWJMCFrecOWqLoGEdEaNtbldj8oSTDUOudfMUtd3bD
         qtCzIk40KdgPQuLtbA3EZNCemGl28+Ld91TQkm794DmH4QTlhisJA/5MBsA9Msakjn3S
         FbA6Dtumk4bCEU+1oYKbWZZ0BgzPlwoRRgjbGCiMWqjQTpL8p+m7NHpLy8fuf6s7EMTl
         wjNA==
X-Forwarded-Encrypted: i=1; AL+hErFUy2zxHn7rVIx6pBO11/zSWJaoddkzEdhpbmE0Eijq98zg+Z8whlZmdS+xP5ulCNg/M7pinpk=@lists.infradead.org
X-Gm-Message-State: APuU4Z+QUqhJNJI2i3nI3uCxWAd1IGDch51gpJnR7Z7A8cdvKDndXB48
	ZjgsrowTk0WOKJ9dayV9jf39rGDh+9U1cNb9I1Mx/uOEqYc1QCVGuex637XjsWLs
X-Gm-Gg: AZFdTZcSWskpIKSORcDyiZbW6E5R3p4aFMCr778jrGDZeIVmPbq0f2BDavrdL10NUS8
	KDFKeeSBANcdogo4i50eIspp/+UgWjEynWkIg6YZvWKWsbcGDGVyg578MlIhTxdTxMVE+aQrGGg
	Nohj2hnA5S+KQqoLKIVKtgujxINd6h5wQRYIYU18A+8nHY3eIa5aSyxDVo1uxJiPXb6t2xEye1B
	TJGVFOT3sEv5k8XbcCMec8v535IiYDWJSVPsEKmrqvuNP6Ye2myppOydKmhNMjvq4pnAxdNxKNZ
	v36YX4f6Emdg93xjJmSJ65RodCAbTEPGvzgOwz8mA9brkiGy+HrB0ILSwF/9ZWLRqL+73YM3ALL
	5mU9TwVuUwo2JZDOQJp0JYH+G/FPs0K/Lfz2trSRKAX4SJ4Vv3idnLUQCLbQ0Mdoq7Whk2AF3fx
	IOmPwUM9tjp7vRcVdoYfszUUjYtmOMp8yTTnw/MNrEtc/8FhGvX0K+HTuYrEhyiKF9NknYjAvjN
	yVR4E15LYCVFSPERfMN4f5tpZQDsdcuJL5+b3rIIcAMUX90ks9qQIHQv+jImhom6ijxjo5osY62
	HH8BVndC+z7Gmb9O4mfMRwe8nrL6IR1tNOneww==
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr146998045e9.16.1795290594502;
        Sat, 21 Nov 2026 11:49:54 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:49:54 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 0/3] wifi: ath10k: firmware feature bits for WCN3990 on SDM660
Date: Sat, 21 Nov 2026 20:49:36 +0100
Message-ID: <20261121194939.3647400-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_114957_013020_932C2CF0 
X-CRM114-Status: UNSURE (   8.36  )
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

The WCN3990 firmware shipped for SDM660 devices crashes on two WMI
requests that ath10k sends by default (scan channel stats events and
pdev quiet mode), and finds no 5 GHz BSS when 5 GHz channels are
scanned actively.

Rather than adding chip checks, add three firmware feature bits so the
affected firmware images opt in through firmware-N.bin. Nothing changes
for firmware that does not set them. The ath10k-fwencoder change in
qca-swiss-army-knife to set the new names will be sent separately.

Tested on SDM660 (WCN3990).

Gianluca Boiano (3):
  wifi: ath10k: add firmware feature bit to skip channel stats events
  wifi: ath10k: add firmware feature bit to skip quiet mode
  wifi: ath10k: add firmware feature bit to force passive scan on 5 GHz

 drivers/net/wireless/ath/ath10k/core.c    |  3 +++
 drivers/net/wireless/ath/ath10k/core.h    | 13 +++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c     |  5 +++++
 drivers/net/wireless/ath/ath10k/thermal.c |  5 +++++
 drivers/net/wireless/ath/ath10k/wmi.c     |  4 +++-
 5 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.56.1



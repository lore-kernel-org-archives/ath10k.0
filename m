Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD628606A31D
	for <ath10k@archiver.kernel.org>; Tue, 27 Oct 2026 21:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LImCE6wl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=planestimations.com header.i=@planestimations.com header.a=rsa-sha256 header.s=202505 header.b=IWyLzYg8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Content-Transfer-Encoding:Subject:To:From:List-Unsubscribe-Post:
	Message-ID:In-Reply-To:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arZXWci/+a5ekCAKi/cuvTlFLbVxaHsozZ9N8+SzsAQ=; b=LImCE6wlC1u5lh
	TwEjccjoK12BNtir2Og0B+7ZC7uhLk437yVbflSWZqdfjRYWnkXLCiA7AUIaUbF17iZPcy+4k97d0
	ULbNuMk5Ign/F+UBZciuMC7mr7CjA1MhNwBAsz63bHGACSbb4Jeza57A3bU21BWgQUGKNnCA5m6D5
	Uq1HWucdwtP4BP/NQrUPPpSaS4q3yur/EoaD3ZCf6lhD5wnZ5os0xx0Gf4NIXMbQ6zv5vzYY2ILYX
	1xid2MgSsnjgUmvs1iDD4K1Vq032cAzDluJDQDNCiEij2BjljTKoRa3ZXi+K2A4evIghmtxH3c6Rf
	ROX6rToQP34M0CkB7PXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLolm-00000005naI-18Cx;
	Tue, 27 Oct 2026 21:31:46 +0000
Received: from mail.planestimations.com ([45.92.8.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLolj-00000005nZL-2lud
	for ath10k@lists.infradead.org;
	Tue, 27 Oct 2026 21:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=planestimations.com;
	s=202505; t=1793099765;
	bh=arZXWci/+a5ekCAKi/cuvTlFLbVxaHsozZ9N8+SzsAQ=;
	h=References:In-Reply-To:From:To:Subject:List-Unsubscribe:Date:
	 From;
	b=IWyLzYg8wKhXpGxKdc/I1MAldlXaQS/ZhiJYaOt7o+RHwgfr6UQ4ygYW5JywwmxRB
	 UK1vNvGBTQRvXvOaSoInBvHZKzHPko/mE/Jct/MExQz1ydIQ64p1hXUoZmE0O8GZe2
	 Ldnmw/duYkBQrGovwTpoQo7XKlJe1g5EsuHl6eVIySW7YmkDzSkAxGiOTuHEdvHKHJ
	 mJ6+rOKiyHs1UvWslvhv4larcU6iFAbV/4mZ9bhmdSJPs9IyyKGN2aL6gsIwzy5ujK
	 803E+qnrq/2Ybs5VfgiGBCIo2JW5Y/EaBIIACn7YDNLeSZx+Y+iOY1lqiZEzKurI0W
	 eXoAzEcXx/7mg==
Received: from [127.0.0.1] (ec2-44-200-4-20.compute-1.amazonaws.com [44.200.4.20])
	by mail.planestimations.com (Postfix) with ESMTPSA id 60524501F44
	for <ath10k@lists.infradead.org>; Tue, 27 Oct 2026 12:16:04 +0100 (CET)
References: <3d350336-cd83-44d8-85df-f4ba85b70267@planestimations.com>
In-Reply-To: <3d350336-cd83-44d8-85df-f4ba85b70267@planestimations.com>
Message-ID: <c30de7b6-eedd-429c-ae24-85ca238e86d8@planestimations.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Jane Wells <jw@planestimations.com>
To: ath10k@lists.infradead.org
Subject: Accurate CSI Cost Estimates for Your Builds
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:16:03 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_143143_868921_9B71FD08 
X-CRM114-Status: UNSURE (   2.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=1.3 required=3.0 tests=BAYES_50,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello ,

Just circling back in case my previous email got buried.

We support contractors with fast takeoffs to help save estimating time.

If helpful, I can provide a sample estimate so you can evaluate.

Feel free to reply if you=E2=80=99d like to take a look.

Best,

Jane Wells | Sales Representative
Plan Estimating

Click Here to =
Unsubscribe


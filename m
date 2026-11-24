Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE061606A6A6
	for <ath10k@archiver.kernel.org>; Tue, 24 Nov 2026 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oMKZKwhr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=planestimations.com header.i=@planestimations.com header.a=rsa-sha256 header.s=202505 header.b=G/oF/Y+r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Content-Transfer-Encoding:Subject:To:From:List-Unsubscribe-Post:
	Message-ID:In-Reply-To:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbAFmPqX3XvqwYc4BwMfbZfYCxq24qDv0ziYnqVdo9Q=; b=oMKZKwhre1P5rw
	b3tqq6/mLClgwaLMUNblqgiBO8cfTTZ5AJhFXF80F/enPVn7ePypWMW/HdrIM0dHN+oe/+EcpSxSc
	uUbDrlCb+XnpSvFGdR43ccsaFF0fbtxCg6Czwe1cDezY+Nz5KVgALjVxlzzTeLoHpGObi190uErHr
	Om4/rBQJYtnVROM5ROCf2lJMIk5wBGD1g1slkpylnuH2cZGv8r5hM4cRfa7YNyLjFQaQdcZfI5oqK
	MAgKCFO7YPDVVQuWjZFgK4fOQNUyjRGdOfZGm5lqJH+COOMMf1AwXc9Z2YHpVLhy73JBVJELgdLEi
	wP2atBMUbBE4sG+MGfzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoX6-00000006Jrs-2Bar;
	Tue, 24 Nov 2026 11:17:56 +0000
Received: from mail.planestimations.com ([45.92.8.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoX3-00000006JoU-0cAZ
	for ath10k@lists.infradead.org;
	Tue, 24 Nov 2026 11:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=planestimations.com;
	s=202505; t=1795519067;
	bh=qbAFmPqX3XvqwYc4BwMfbZfYCxq24qDv0ziYnqVdo9Q=;
	h=References:In-Reply-To:From:To:Subject:List-Unsubscribe:Date:
	 From;
	b=G/oF/Y+r2hF3awNv4EqKeBgydKMnnZc8Lca++a9/ngumzwb0Vyju754vcbDWALs6A
	 PgUYtWd9909L3x1Rh3w5/bUYWj/6vaHUL4uE6v+dCi1vmNzvquSFzezvk9BWgbnvzV
	 5R8pYUwngudUZ7m7ikga3e4DpYHmLSSTxZqxe1r1YMhfzRu8YEPbXylO3Rd+5ARuNn
	 nkSm3f50tFT2hWWhrQjc2pDwBoQAr2kBdPs0qXMuvLUtVT4rD5oyYEcJt53lR7uk6g
	 BpUkyCxRw17/0jZmCEDITDDB06Z4WqlgEnCYoO+P+biUi8/p+xvQ7IAeuc7Ikur1TT
	 1gCcqR1uiMvRw==
Received: from [127.0.0.1] (ec2-100-54-147-168.compute-1.amazonaws.com [100.54.147.168])
	by mail.planestimations.com (Postfix) with ESMTPSA id 7811C500C06
	for <ath10k@lists.infradead.org>; Tue, 24 Nov 2026 12:17:47 +0100 (CET)
References: <3d350336-cd83-44d8-85df-f4ba85b70267@planestimations.com>
 <c30de7b6-eedd-429c-ae24-85ca238e86d8@planestimations.com>
In-Reply-To: <3d350336-cd83-44d8-85df-f4ba85b70267@planestimations.com>
Message-ID: <b215ca80-a08f-42d2-80e7-5383e5d947a4@planestimations.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Jane Wells <jw@planestimations.com>
To: ath10k@lists.infradead.org
Subject: Accurate CSI Cost Estimates for Your Builds
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:17:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_031753_369765_253F3A40 
X-CRM114-Status: UNSURE (   2.92  )
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
X-Spam-Status: No, score=1.6 required=3.0 tests=BAYES_50,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello ,

I wanted to send a quick example of our estimating output.

We recently completed a detailed CSI takeoff covering multi-trade scope =
projects with structured cost breakdowns.

If interested, I can share a =
similar sample tailored to your work scope.

Should I send that?

Regards,

Jane Wells | Sales Representative
Plan Estimating

Click Here to =
Unsubscribe


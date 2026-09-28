Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD95CA5FA2
	for <ath10k@archiver.kernel.org>; Mon, 28 Sep 2026 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Content-Transfer-Encoding:Subject:To:From:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lFi2scO9M5BScPXAQZzT/fJWRItH1I0U5dkwADLFBvg=; b=1lajGxKZEtkFpaBAJT40EAkh8r
	f0QSMlRUbUBoV0/FRkCJaRL/PWCYmz0ld/BQzYKk3RdhY20dIwS7BDQgmiKDEz4O1UaC+aj5RGrbp
	MsJE1q5xgUsk9Qr5GjYsH74OFzbrA3LfMlpgVBd4t/EIG5SEu03AmZ8QApIroaIt+KmFvjU/TwZI0
	wstQ5MRNPjtzCb4e1MHuTuBSqLxMZSGAi6rl8hqZynYfGpTJ/0DnWfuidDXug1lRjYHZ1f3snMx2C
	b2GA3h2nbcyrfXS9DRvoBXudlJo9rkjtGuo8+/iz1FXNuRx6nCLiF6RWU8BAGY4u9hI/WDhNF4//9
	jFu9sIlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGOW-00000001Msv-1p58;
	Mon, 28 Sep 2026 18:48:08 +0000
Received: from mail.planestimations.com ([45.92.8.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGOU-00000001MsF-2ZXv
	for ath10k@lists.infradead.org;
	Mon, 28 Sep 2026 18:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=planestimations.com;
	s=202505; t=1790621281;
	bh=lFi2scO9M5BScPXAQZzT/fJWRItH1I0U5dkwADLFBvg=;
	h=From:To:Subject:List-Unsubscribe:Date:From;
	b=mVKhgjVtrGUseVp776U81k8GRPjnxcqygjojFdWRtca8Js8WfOOP7i7oy5jV187KI
	 DLYrrYJ9jSB1qBIUaByKLqnm+eccMlaPhnr+iLYZcEDobKutR6BRly6F0WYsJYOhu6
	 5ElmKWzDUZy6XgzAKYR+Y9YVSXjhDCE2PNzwMOSchDg5ju6J+iK7py11KaW2p4UUGb
	 FhjVnUuadKs38l9z7Ua8yZjHSCqqc7bnbX4zhO6AyVPFOnx/JrFtYSperhazVTSNk0
	 h5YToQE7ZyVBdUMAbnVyAMYdlrFvQtbLC64BLuQfEmh/Gem6IXkHo61MAMjV7fBMUI
	 o8VUN62VtoK3g==
Received: from [127.0.0.1] (ec2-100-26-148-17.compute-1.amazonaws.com [100.26.148.17])
	by mail.planestimations.com (Postfix) with ESMTPSA id 6E9F3500575
	for <ath10k@lists.infradead.org>; Mon, 28 Sep 2026 20:48:01 +0200 (CEST)
Message-ID: <3d350336-cd83-44d8-85df-f4ba85b70267@planestimations.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Jane Wells <jw@planestimations.com>
To: ath10k@lists.infradead.org
Subject: Accurate CSI Cost Estimates for Your Builds
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 18:48:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_114806_809209_A819D154 
X-CRM114-Status: UNSURE (   2.46  )
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

We focus on detailed CSI estimating solutions for developers working across=
 residential projects.

Each estimate comes with complete material =
breakdowns and clear trade separation to support better bidding.

Let me know if you=E2=80=99d like to see an example or schedule a short =
discussion.

Jane Wells | Sales Representative
Plan Estimating

Click Here to Unsubscribe


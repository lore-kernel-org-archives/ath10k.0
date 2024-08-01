Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70042C3DA64
	for <ath10k@archiver.kernel.org>; Thu,  1 Aug 2024 21:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:To:Subject:From:Cc:MIME-Version:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bflq4g2Ffnb32eJ3hjWPI7EP2EnvM5RlVXUl3h6oeoM=; b=BUYBhMkbvtDkpBFnREumV9zXBJ
	dACFT2IfnEEPvte5/YUCHkaf9o93LMK5kc9zxWQUR7gfERbF9a1Ne4E1XQzq/oin/Kav+/mKgNou3
	aiZC9UmHYgJS6oXfDUfSWNYq5VVfPS02GJ6s1A4xyuyhwwFMOngfUjAMk7NjHThr555q2ARVhLRIH
	Q6TYmkWkP9IOQMdcNV3AEp3xnIKyh4zUhKW1uowJ24FjPRUSssZPgZ94K8tSll+xYadzB+a0Pmw+/
	JACYcEafy52QUdiaIvjdpmqawI59GB7HH6/v0TVHRE/JH3S3hA+vb+Z9ITqofiidWicO8+NjQZ47p
	Iu43hVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZdfe-00000006nws-158r;
	Thu, 01 Aug 2024 21:49:14 +0000
Received: from 88-209-210-238.pool.panelnet.hu ([88.209.210.238] helo=mail.infoupdaters.one)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZdfc-00000006nwS-1gSE
	for ath10k@lists.infradead.org;
	Thu, 01 Aug 2024 21:49:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04E47181765
	for <ath10k@lists.infradead.org>; Thu,  1 Aug 2024 23:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infoupdaters.one;
	s=dkim; t=1722548241; h=from:reply-to:subject:date:message-id:to:content-type:
	 content-transfer-encoding; bh=Bflq4g2Ffnb32eJ3hjWPI7EP2EnvM5RlVXUl3h6oeoM=;
	b=plcvsaTiiW+rLNYq0R/jpkztw9whON+BkI3DptBBI2g9bzD6L3Ty9tHSszy/Qv/DPWYMA4
	klJyU+ny5VLRd3/mUrj/AvoQSiDjPP3Vlc/KZvYUoZDAnaTRDAmFSK1MGz9zPjAxALJ5wL
	AIwIo20sP6np7lRoIckTfW5b7UBgXyKYDX8lRoKypuTkosYFVOyM1rD+AJk5vdpfGHJwKw
	ufbTJ/SzGmGwELZDAIp16X0VS8GoDOidf/PJm076NUCOtmY1+PkftCd9Msp2EJcPUeooLE
	LugG8EwtIZsCOTY7MY1Vmco0ZTCf0T2QcWuGjFzesMFY4pIRcr1l6Mcpu+RX7Q==
From: "Lim Chew" <orders@infoupdaters.one>
Subject: RE:Attention
To: <ath10k@lists.infradead.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Thu, 1 Aug 2024 17:37:21 -0400
Message-Id: <2024010817371637A2053D48-DACB422E0D@infoupdaters.one>
X-Last-TLS-Session-Version: TLSv1.2
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_144912_605085_8606A9BC 
X-CRM114-Status: UNSURE (  -1.71  )
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
Reply-To: jlim5873@gmail.com
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

I'm Lim Chew  working with A Whitman Laboratories Ltd UKas a research 
consultant. Our company is one of UK's most respected and indigenous multi-
million Pounds pharma companies, manufacturing well over hundreds
  of various lifesaving bio pharmaceutical products and medical consumables.

 I have a business proposal that would interest you on this, and i
  shall explain deeply if i get a response from you to this regard.


You can feel free to message me through my personal email; jlim5873@gmail.com




Thank you.



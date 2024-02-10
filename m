Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D3EC48260
	for <ath10k@archiver.kernel.org>; Sat, 10 Feb 2024 20:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YoyWao8Wykc1Pr5spuTXW8YpK9nTlXIDPeul7sHGC8o=; b=cODU20PURfBLR6
	iNdFucMzFi5RrdCpOlY8KbD7gocoEBrNtZ8Ngsu5k/9tw2AlRSK98Ol2kjcjYpGp090k7VJBEc3Cj
	0UnfXHCViVx7ewTiqNrqnoMqQNF3j7jfF/5FYI1n0sjhbxN+5Mz9fddwGY4WNReOu2VEJJiLYGDcY
	QHyh4lmn43CojYHMhjZOoF4TUZvsIbb8qGkJpcA3Oct07uYT7jHojROIg7mSeyygEC9q3nljxSmWS
	S9lVkYcfltYv99VlBfjW4WQSiN5qnF/KBC+iXee5Vl/3rpUh07SoZsGpu4ormB+rqXlr8JSS6m/I5
	XUiC/myeOQIZVsJWksbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYuNr-00000002164-01r7;
	Sat, 10 Feb 2024 20:55:35 +0000
Received: from mail.ferum.org ([78.41.92.98])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYuNn-0000000215Q-1wOY
	for ath10k@lists.infradead.org;
	Sat, 10 Feb 2024 20:55:33 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.ferum.org (Postfix) with ESMTP id 4A68C2046155
	for <ath10k@lists.infradead.org>; Sun, 11 Feb 2024 00:34:54 +0700 (+07)
Received: from mail.ferum.org ([127.0.0.1])
 by localhost (mail.ferum.org [127.0.0.1]) (amavis, port 10032) with ESMTP
 id KcCcOHRu3ryu for <ath10k@lists.infradead.org>;
 Sun, 11 Feb 2024 00:34:53 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
	by mail.ferum.org (Postfix) with ESMTP id 9822A2046F4F
	for <ath10k@lists.infradead.org>; Sat, 10 Feb 2024 22:18:07 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.ferum.org 9822A2046F4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ferum.org; s=mail;
	t=1707578287; bh=YoyWao8Wykc1Pr5spuTXW8YpK9nTlXIDPeul7sHGC8o=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=SPgXg75UIpSw5sdIHU2mL76yJX9Q/iOPY8WtuqI0hw1RQ74zvcSDeNutLdOgE2jVN
	 euW7V3cUfb8tPxPj+a6cGoJW8mlsKZz7hR0y6BmQFxMe+2aw5NGDilv9IgGd0BzhJR
	 0w9sv8EJvF+ta41Ek7NBkuGfPXKjXjH5UT46pkfMcYsYxDXtfm8Rk8HYOyd9AQcVLE
	 gNbVaQyT/yejvzldzBr6k41bSfUJoLAyRjh1pJa4bD3+7wpkTPEodZRC2765G4MfVt
	 XPBnwKg/7xtEvyYX2TqWmaSmyhxM3OblTJ/J4gNRmZKmeCU1/RyPUaIiL/VXjoP2nB
	 wGuQ3mdDQTj1Q==
Received: from mail.ferum.org ([127.0.0.1])
 by localhost (mail.ferum.org [127.0.0.1]) (amavis, port 10026) with ESMTP
 id P1D3Xd9Y7mUI for <ath10k@lists.infradead.org>;
 Sat, 10 Feb 2024 22:18:07 +0700 (+07)
Received: from ferum.org (221.red-88-30-46.staticip.rima-tde.net [88.30.46.221])
	by mail.ferum.org (Postfix) with ESMTPA id 2A8812038C36
	for <ath10k@lists.infradead.org>; Sat, 10 Feb 2024 20:55:46 +0700 (+07)
From: "Steven Walker" <kyocera@ferum.org>
To: ath10k@lists.infradead.org
Subject: Attn: Important Message !!!
Date: 10 Feb 2024 14:55:47 +0100
Message-ID: <20240210145547.A9A57C027169F9EB@ferum.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_125532_073925_5CB3E868 
X-CRM114-Status: UNSURE (  -1.97  )
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
Reply-To: spwalker13721@gmail.com
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello Friend

How are you doing today?

I am Advocate Steven Walker, requesting you to contact me over an=20
unclaimed inheritance financial benefit that is connected to your=20
last name. I will make the details available on your=20
acknowledgment of this email. Please revert back at your earliest=20
convenience for complete details.

Kind Regards


Steven Walker


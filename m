Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544CEC433F5
	for <ath10k@archiver.kernel.org>; Mon, 16 May 2022 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRRylTRFWqzpmmy7mS0LytShifMKJJJDHSSVfDdrKxw=; b=NKBBPssMDCYOTK
	RbyMO5vZMmvf5m96nh4w+ivg9DTd7tuzXVXaW49qkcNfoTk9o00r+YSyaDvH/hnRQEuggqW6tMacl
	CaB9MGZScwUvG0F0BXKrtVQhfMetc/JY8meYRkutAFAYb22PihGDt0KI44brgvBgU2YPnoBAJbGx4
	2c5OX9va0btirfpwyD+Wj82iPle/3QYa5fIre4SRUJ8Hh2TwyWoCdTcBp+rfIXuN8H2J4t7CArCNO
	AtL9w5/qkfVzUm8cnxdFJgkJMOXj/UdOxVj2h61j7dI5ZyCd1h0tr5rp4d5HfTdpWdeTRzvn6zdrz
	/bJRvJHzhBUp4Ijol+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdVL-008x0Z-LP; Mon, 16 May 2022 16:23:31 +0000
Received: from ns.iliad.fr ([212.27.33.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdVG-008wxg-UA
 for ath10k@lists.infradead.org; Mon, 16 May 2022 16:23:29 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 23E5C200FA;
 Mon, 16 May 2022 18:23:25 +0200 (CEST)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 1FDD9200D9;
 Mon, 16 May 2022 18:23:25 +0200 (CEST)
Message-ID: <c4bf5262bc250afd9c9e52248f1b576a7882c8d4.camel@freebox.fr>
Subject: Re: [PATCH] ath10k: fix misreported tx bandwidth for 160Mhz
From: Maxime Bizon <mbizon@freebox.fr>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>
Date: Mon, 16 May 2022 18:23:25 +0200
In-Reply-To: <87o7zx4fue.fsf@kernel.org>
References: <cd2735a40da7f4fcc5323e3fca3775e7b5402ece.camel@freebox.fr>
 <87o7zx4fue.fsf@kernel.org>
Organization: Freebox
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Mon May 16 18:23:25 2022 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_092327_195224_032A8EEC 
X-CRM114-Status: UNSURE (   5.66  )
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
Reply-To: mbizon@freebox.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


On Mon, 2022-05-16 at 19:11 +0300, Kalle Valo wrote:

Hello Kalle,

> On what ath10k hardware and afirmware version did you test this? I
> can add that to the commit log.
> 

QCA9984 
10.4-3.10-00047

-- 
Maxime




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

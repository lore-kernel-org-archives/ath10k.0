Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4439CC43217
	for <ath10k@archiver.kernel.org>; Fri, 11 Feb 2022 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqjxSHGCRC0jhiKV1TQbkS/Ehv1vk4O6GYO1oCrI4oo=; b=aHIDtkQAi6oYSk
	8YccSxwnU7XJxfMzrXwCp9/3Ra0bBUEBeqhFXmt3xmZIh+FH+vr2vnhbhX9tg0Zo0gupLJjMcQBPa
	fWRwWt0EXmYb8TWPa4nS4VeRV13ODCmlb70ble+fiYl6JBVZCMTDHaA91gXQn7KBsRyutt1RGrtYx
	YAmJX0kdvKtun+Ox0dB0RSwOOJNrXsSjcNGw9sIgGE+fmpWhaApyhl+xUdMU0l9clGvDvGjTTE78f
	Fq5CifL9fYJAT9aXXKvHC8UK5hiLuhSQBeoffLrJ4CmWgox1H1tZOPGy1dzVq9NtetREfC5grwwy2
	3acoRcu+OK48iPU9sslg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIYUJ-007w0V-SB; Fri, 11 Feb 2022 16:09:35 +0000
Received: from ns.iliad.fr ([212.27.33.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIYUD-007vyF-O3
 for ath10k@lists.infradead.org; Fri, 11 Feb 2022 16:09:34 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 800CC1FFF0;
 Fri, 11 Feb 2022 17:03:39 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 7CDD91FF90;
 Fri, 11 Feb 2022 17:03:39 +0100 (CET)
Message-ID: <5b1bc5867346e67a746d87c099b0826c0169a84f.camel@freebox.fr>
Subject: Re: push-pull stalls (QCA 9888)
From: Maxime Bizon <mbizon@freebox.fr>
To: Guilherme Weidle <guileweidle@gmail.com>
Cc: ath10k@lists.infradead.org
Date: Fri, 11 Feb 2022 17:03:39 +0100
In-Reply-To: <CAKBt_AdkDqj+wocWM3CSNA7Fh1DRYEHz-vJCGQpR6woY2WAH7w@mail.gmail.com>
References: <CAKBt_AeMSV8Z98bZh3saK8G61e9m8JNXZrLmNT2oJsvAHJNTZg@mail.gmail.com>
 <e2adadf1ff5d26eddd657c3b5e6f5d547bd0270a.camel@freebox.fr>
 <CAKBt_AdkDqj+wocWM3CSNA7Fh1DRYEHz-vJCGQpR6woY2WAH7w@mail.gmail.com>
Organization: Freebox
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Fri Feb 11 17:03:39 2022 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_080930_020486_401627FC 
X-CRM114-Status: UNSURE (   7.95  )
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


On Fri, 2022-02-11 at 11:51 -0300, Guilherme Weidle wrote:

> 
> The kernel I'm using here (v4.4.60) does not have this patch. I
> believe this issue has been around for a long time now and is still
> there...

Sorry I thought you would have it since you use backport, but you run a
version that predates this patch

-- 
Maxime




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

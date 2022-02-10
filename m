Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B93FC433F5
	for <ath10k@archiver.kernel.org>; Thu, 10 Feb 2022 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Cc:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unIxFjr7yNYjcbBgvWnsHiZxLbiiAVXCkG9RX8fA4OI=; b=olcjjsQzUAlaAy
	uzs/qvhOsL5Gf0CMiyac8JnZYCVPicW11mZ/dSEK9chqWsK6KHKa8fE/0r9Dxv9/mrmRY39CPKsGF
	EXB5NgOHL3nNiv6c/ynkoFFucpsABHVFlk+NgsUqitovbHtX/l0tzwugmkDRYxp86wuuSpbpvQMFD
	iYk8FC8BLtxqf5eY2js3sxi9uh5yWxAE4GD8V62WiVOG8+0OKroMoTuUaTH3eP0T0IHGwv8gLbPbq
	Y0lM0sAMFXlgP+OIQCLJn6kASs8gurkIS0AJlW6nYo0eNOGduz2NPybcQnquBxP+vpmDekMbv/N7h
	j+JS748iHTdmja1kFejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIFWS-004okD-0M; Thu, 10 Feb 2022 19:54:32 +0000
Received: from ns.iliad.fr ([212.27.33.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIFWN-004ojW-Ou
 for ath10k@lists.infradead.org; Thu, 10 Feb 2022 19:54:30 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 3D5F12010B;
 Thu, 10 Feb 2022 20:48:57 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 3A00C200CC;
 Thu, 10 Feb 2022 20:48:57 +0100 (CET)
Message-ID: <e2adadf1ff5d26eddd657c3b5e6f5d547bd0270a.camel@freebox.fr>
Subject: Re: push-pull stalls (QCA 9888)
From: Maxime Bizon <mbizon@freebox.fr>
To: Guilherme Weidle <guileweidle@gmail.com>, ath10k@lists.infradead.org
Date: Thu, 10 Feb 2022 20:48:57 +0100
In-Reply-To: <CAKBt_AeMSV8Z98bZh3saK8G61e9m8JNXZrLmNT2oJsvAHJNTZg@mail.gmail.com>
References: <CAKBt_AeMSV8Z98bZh3saK8G61e9m8JNXZrLmNT2oJsvAHJNTZg@mail.gmail.com>
Organization: Freebox
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Thu Feb 10 20:48:57 2022 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_115428_013029_821F599A 
X-CRM114-Status: UNSURE (   7.92  )
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


On Tue, 2022-02-08 at 16:31 -0300, Guilherme Weidle wrote:

Hello,

> 
> Does anyone also came across this issue or have any idea how to solve
> it?
> 

I do and noticed the exact same thing with the push-pull switch, but I
did not have a clean way to reproduce like you have.

Can you please try to revert this:

"mac80211: Switch to a virtual time-based airtime scheduler"

and tell me if it fixes your problem ?

-- 
Maxime




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BAAC433EF
	for <ath10k@archiver.kernel.org>; Tue, 15 Feb 2022 10:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MxVMOZlxg7XQRPOtw3Goyv4x6BPNtD5BMXzuI89neVY=; b=wPQ0eXapRjDfdH
	sJQEDQXRz3RpiEp/q69oXebsLIQMbslpP/ZNbY/4cfdOzxzJubW3o7CsCvziS31z3yi/Q0nzxNQTb
	GnbToIycPZpYD7qdnrExyy3onuGHJdVvemd/pSU1NBHMxcId2Ru2RyeQ0RsHT20RyutVUZBfSaLSh
	ruWNIMKPeDp0thrDxKwRxlQkVsRhRnW/ceHANh9gdzoAbgQW/EdiazoCLOOtTobNHL7RB6mgsEyog
	NZKBCU5JbpJlbzWlrHHLZSDBhvazRXgE2rppfPmlwvOh5+8SyqXuCuk5hkwSUE83HYR2Gf5sMdf5i
	1WMmQHkSL3V1PbBjFyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJv0k-002IUU-Ga; Tue, 15 Feb 2022 10:24:42 +0000
Received: from ns.iliad.fr ([212.27.33.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJv0h-002IS6-8K
 for ath10k@lists.infradead.org; Tue, 15 Feb 2022 10:24:41 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id E0D9120288;
 Tue, 15 Feb 2022 11:17:14 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id DE56420180;
 Tue, 15 Feb 2022 11:17:14 +0100 (CET)
Message-ID: <0e7682cfd9c1a590e8b2e1bd45c39cf7c6527eb7.camel@freebox.fr>
Subject: Re: push-pull stalls (QCA 9888)
From: Maxime Bizon <mbizon@freebox.fr>
To: Guilherme Weidle <guileweidle@gmail.com>
Cc: ath10k@lists.infradead.org
Date: Tue, 15 Feb 2022 11:17:14 +0100
In-Reply-To: <CAKBt_Acz8=UG_4AeoPCQ4ed5fc4JjHfou9RF8MsgSSf1qW0wQA@mail.gmail.com>
References: <CAKBt_AeMSV8Z98bZh3saK8G61e9m8JNXZrLmNT2oJsvAHJNTZg@mail.gmail.com>
 <e2adadf1ff5d26eddd657c3b5e6f5d547bd0270a.camel@freebox.fr>
 <CAKBt_AdkDqj+wocWM3CSNA7Fh1DRYEHz-vJCGQpR6woY2WAH7w@mail.gmail.com>
 <5b1bc5867346e67a746d87c099b0826c0169a84f.camel@freebox.fr>
 <CAKBt_Acz8=UG_4AeoPCQ4ed5fc4JjHfou9RF8MsgSSf1qW0wQA@mail.gmail.com>
Organization: Freebox
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Tue Feb 15 11:17:14 2022 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_022439_514444_5C8960DC 
X-CRM114-Status: UNSURE (   5.22  )
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


On Fri, 2022-02-11 at 14:00 -0300, Guilherme Weidle wrote:

> BTW: Did you fix your problem by removing that patch?

Yes

I exchanged a bit with Toke and maybe the ath10k push-pull code is
somewhat incompatible with the new scheduler, he gave me some ideas to
try but I did not have time to try them yet.

Could you share your exact reproducer ?

-- 
Maxime




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

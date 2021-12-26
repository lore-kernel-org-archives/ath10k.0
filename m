Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC19C433F5
	for <ath10k@archiver.kernel.org>; Sun, 26 Dec 2021 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=evSpXr6ezJFNmvafJmteN0jw3ly6hPNrPzVUp4RYEtQ=; b=P2/By0UMOOieLZ
	v3GyBkYv6wwGbss3O6tuYExsEX7Vbdr4pzRRoXZdFgyTSefLJXAHFnsCugD6q6rkd0+qGLWwfxuvm
	1xWpWHVA3LQFf8cHkCWWVTbcWrugAGV9QJIgNVYtG0Lcyz+sh0c+mx5gajqtlQxJQD4rTqvVsDfrS
	BwHPaCHQTUaA+9yOmx1hR9nXKj4b3q2BDv8KHwvd6O7FXyDUYQkCZrwu4KUXz5EMXDPfqafnVdYkP
	em6yHdpv0CB7qAHkJN2Ax0MR6A0CnMx/6s8mdruCPgbiAE/VVzA4NIj4QZxjn9jJ2HWvpqm2wu0HY
	bHsLAPSiTrfQfBgDpVyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1PrG-00FPlV-Gh; Sun, 26 Dec 2021 09:30:26 +0000
Received: from slot0.jllresort.com ([62.197.136.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1Pr0-00FPdl-A7
 for ath10k@lists.infradead.org; Sun, 26 Dec 2021 09:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=jllresort.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=ele.mon@jllresort.com; bh=OCFGoXTJt7JDcArbwxfmx5hhO2w=;
 b=fziOnG6yCgmGpeaols5zcga2nlCwAFXW3+zN6VAX2XcvdW2ut4IhvXH2vMFH9XZQd+pn0q47Mplb
 PLAJHDYiz1hirShQY+tFZDCgjvcN6vlbZs1wLb4jpN0ul2r3evsQXArsatvCX056kF3kHFO+yuoh
 9/GtCmZrgXPj3lfnyeeAzHMS9MjaLH+IV8Ay6ltjY/6dB8c/Hk7TsbkhNADLId19IEuM4LJe93WL
 s11VM3GiRIKY5cMaeccPy2ynPTbkXW/sSynxJwwIz9DuzDoTPZMLtW7hL0af+hIHDwhxj2gReRHu
 92WYG3D4qQWu/RV9H+/G9+RCYUcxj5oAb+7VEw==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=jllresort.com;
 b=e7EzgFDQK69U1c25JrZrLBdIFb3psrlrOUJGWZM9ohU3KrDBviTS9VWc6p5VZuDmdf23nVrR5clc
 VOV7MkDrNtyEP+Uan1BwwQKb3xqmhKxrm9dtlyh4r2gzPRRdNar+g+MV3joqGucvcyTZjcz7rm3n
 s+SsmBt1C2d4aV9BnqGNXnPJklReQqMxOrG4W67EBZrS05BA/HAAgeKtAIahM1jWblaBhFxex+cV
 XfjUypx0wyxZFTg93OqXYb0eOa8vfKoU/UAP8KHLwh32A05EJKgtJZTuztkiW1+96LmMx9lDUX8p
 LzO8S9dDnsC0eyH92ZHXRIOEMAryCn80yGEQ4w==;
From: ele.mon@jllresort.com
To: ath10k@lists.infradead.org
Subject: Happy Weekend:
Date: 26 Dec 2021 10:29:35 +0100
Message-ID: <20211226102855.08327EC761DB30B6@jllresort.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_013010_522217_38C66FA2 
X-CRM114-Status: UNSURE (  -1.47  )
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
Reply-To: mustafa.ayvaz@ayvazburosu.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Greetings to you ath10k,

I was wondering if you got my previous email? I have been trying 
to reach you by email ath10k@lists.infradead.org, kindly get back 
to me swiftly, it is very important and urgent.

Thanks
Mustafa Ayvaz
Email: mustafa.ayvaz@ayvazburosu.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

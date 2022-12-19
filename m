Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E218C4332F
	for <ath10k@archiver.kernel.org>; Mon, 19 Dec 2022 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8LqlUjOKNpodwkKm1Ao1+NZdlSrXCm2doO21pRokyzQ=; b=WPcCM9NaRbRpxN
	e13hgf4YIThmYlNmus7tocWUSo3ynarLGDaEw/kLtDrof+VKu4pwdr2HGfAFlYsGzjeEddg50WPfo
	myFGrakhSnEgGSU5d1RmnaHyFAyen9Hviy+oOpqLsUo95UdUfOhQ4xu+r+y17UAhlKXEtqv8IH3O2
	AoNkVJ+y2pJlKfPPigOtja8+k193APNlmrwRPtQo43+EfRxnVffL7dLYaTPiSwUoIk1zFMR0j8thm
	c0HAJRxRG0Iuy7R9Eg6LYTD2Ujtkfhh8maoKGFWdaBvbGvjj7pd8Rr2i0LYObtEkcoz2r3XcrDQzT
	u2foGdA8CtK1+Sl2ewcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7C5d-00AzW8-1K; Mon, 19 Dec 2022 09:05:41 +0000
Received: from mail.glencoeaur.com ([217.61.97.113])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7C4p-00Az2i-6Q
	for ath10k@lists.infradead.org; Mon, 19 Dec 2022 09:04:54 +0000
Received: by mail.glencoeaur.com (Postfix, from userid 1001)
	id 9298D81A02; Mon, 19 Dec 2022 08:55:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=glencoeaur.com;
	s=mail; t=1671440160;
	bh=0BgaW9t8GFER5QecxVkFsHrVi3gO/4V5KAZgJaiRYBs=;
	h=Date:From:To:Subject:From;
	b=sDzEt2BWw41VSlPbPykSU2gxwRzK5ls+EIsPJo4ABKJUDfyWoOM/SFZH06jZdY25A
	 rb9DTEFqcAIiNs5R1v6z2weZWk+bjgbDao0DIr+VU52rUnrvAmWNoW9P8Fm2GAUWK2
	 vcSVcXcL8747p/eQUZZlt/6ZdPr2aoSCnHi4qdE9VwZbetL1YDXseSKAgFYP1mKOsx
	 CCb/PGrm/cQ7coAn/Se+1708MH3ZKvnnXv0YLPfTbfdY8LpzSuUty/n5o8Q2NIanLB
	 jI4YiN7bHJ+Rtcd6u2d5dScctuoGOTbx7ul923enGZM1cyai8O4qPduXHIBXgh0UDk
	 HpMLpfV3MXhGQ==
Received: by mail.glencoeaur.com for <ath10k@lists.infradead.org>; Mon, 19 Dec 2022 08:55:50 GMT
Message-ID: <20221219074500-0.1.j.15i6.0.rfi48c0bhk@glencoeaur.com>
Date: Mon, 19 Dec 2022 08:55:50 GMT
From: "Zbynek Spacek" <zbynek.spacek@glencoeaur.com>
To: <ath10k@lists.infradead.org>
Subject: Silikonmischungen
X-Mailer: mail.glencoeaur.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_010452_966831_B1C2AED9 
X-CRM114-Status: UNSURE (   1.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Good morning,

do you need intermediates for processing, plastics (e.g. rubber) or silicone mixtures?

We provide a wide range of silicone rubbers with various properties, silicone mixtures from renowned manufacturers such as Wacker, Elastosil LR and dyes, stabilizers, primers and anti-adhesive additives.

We also produce technical silicone compounds with increased resistance to oils, resistant to high temperatures and water vapor, conductive and many more.

We provide fast order fulfillment, timely deliveries and cost optimization.

Can I introduce what we can offer you?


Zbynek Spacek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

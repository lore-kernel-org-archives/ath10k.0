Return-Path: <SRS0=7cM+=LP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AD6C48BC2
	for <ath10k@archiver.kernel.org>; Mon, 21 Jun 2021 12:41:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A02B76101D
	for <ath10k@archiver.kernel.org>; Mon, 21 Jun 2021 12:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A02B76101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EZox+MXgpP3DbUULl77mNB2sCJIfB6UVYP5nVkwZWSg=; b=Xmr
	1SX01NX4/Q6r2vOTxEAYsGbdYUcxuing4etQSm1JqL6eVnr3SZMYF6f9/onCu7s7kZMrgwdqGluLM
	UFoJY0JhGJs83W/81MYRX32/YFLFReIS00UBWuk7bOYDAdnB/M+42v5AdIuK5heVKZhpqdt/eK2Rk
	pKuHFut4uXAjS1cNKpYn38pJ7O6znewJQFp4Xiddmdfnj/LXXpj8UTy8N2EK9SyIFvc/qqyPb3yfr
	sS4rSRq7X8XTMauEQA+/lCGwv9i9PJPzLquIx7FdLCGyeeMU4SsT9lKhUZwNRNFrTeLHR3beKtGgE
	eaeYwRT3SKll1yn8nkFLYdXHaV7Ue0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvJEV-003Ufs-Rj; Mon, 21 Jun 2021 12:40:55 +0000
Received: from mail2.protonmail.ch ([185.70.40.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvJER-003UeD-VH
 for ath10k@lists.infradead.org; Mon, 21 Jun 2021 12:40:54 +0000
Date: Mon, 21 Jun 2021 12:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1624279245;
 bh=MA3dPS58xISZxs78CKxvQt77Z17HjzqInHNl2FHBBG4=;
 h=Date:To:From:Reply-To:Subject:From;
 b=lSmCsHrTllJbVtLC33jRMswrCq4ZD6YwzNqjeD2WW6f3JtDVlB6pAWR6iLvB0uiZE
 8Jg2dGqlg2kMiVMoBliGCjYQIT3lmIiIfzPbkAibdUnQtiyUOXOg9z4FsFT5nhUt/S
 MlQ4bIEJZKMvU8OjWj2DQzF2LwuJDdDVOZMkjMTg=
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
From: Michael Yartys <michael.yartys@protonmail.com>
Subject: Beacon protection and operating channel validation
Message-ID: <1hc0oYM6j0RCTcyH7ctaBIRJ_y9VW0W_tvn1toYyc64eP0qkqJl5qQkgFbD0eDW1cz_kYJEIccj3cLhAJxrv3K9k3X5OBVUKeLdL20mErNg=@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_054052_370338_06892F2F 
X-CRM114-Status: UNSURE (   2.32  )
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
Reply-To: Michael Yartys <michael.yartys@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi

The WPA3 standard contains optional security features such as beacon protection and operating channel validation (see slide 27 here: https://www.wi-fi.org/downloads-public/202012_Wi-Fi_Security_Roadmap_and_WPA3_Updates.pdf/37230). From what I understand this is not implemented in ath10k at this time. Is there any plan to implement this in the near future?

Michael



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

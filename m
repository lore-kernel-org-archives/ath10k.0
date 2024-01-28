Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0652C47258
	for <ath10k@archiver.kernel.org>; Sun, 28 Jan 2024 21:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:
	From:To:Subject:Content-Description:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7OkD4IXxL9a1Yp20a848EjZLg6UfISbaeV/rHRChqnA=; b=v4eFyi7DghFIbPA49FgSeynskE
	YsAH3vDp0SlOvCJXla4we/BrbfO5ShENGfZqljCUtLsfGcS+45zZuQxsm8DZWM1jeMC5EwXkTh1b9
	pQqnfdKcpztnudgULI6FCAB872NlQ/QVtTpI8imRk3Hwl4j6J/iprdcFkC9tXEnDKtLp1y41c5J93
	ItnFKii+JUTVk0wryryealmkBmPjQsBpFeGA1ocwFrv5TiSkzuk17TTzUSGK441QBAz+ghj3qrRVD
	aeEb6zQKecgmiKzruuHMErz+IUCA4zuyMUwWBupXvCIVcw7jaC0t6XHGIuTcF2VGgwd401vVgF0OI
	RbxYahDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUCck-0000000AXjx-2jfR;
	Sun, 28 Jan 2024 21:23:30 +0000
Received: from mail4.meandermc.nl ([87.213.170.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUCch-0000000AXj0-0Lt1
	for ath10k@lists.infradead.org;
	Sun, 28 Jan 2024 21:23:28 +0000
Received: from mail4.meandermc.nl (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E10CDE7CE4
	for <ath10k@lists.infradead.org>; Sun, 28 Jan 2024 22:04:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meandermc.nl;
	s=20210113; t=1706475893;
	bh=7OkD4IXxL9a1Yp20a848EjZLg6UfISbaeV/rHRChqnA=; h=To:From:Date;
	b=ewmau+mMafD9lmVqGeC7NWhttuCzGkZ5CNBn+THYxCwRAwUq8MkFx1b6TO51Nyb1h
	 i804BcbFniveMMq8IRD4mX3FTLuJElqI+r7S43ARqR/PfvL16UQxWkweLEzhH9cC5J
	 7TJmK41CLrUd8iFIi/YFUcHkvBgb3LKoxjtHJjSqnKdVSU+naKprzwDMirsYlCZKRr
	 wv5cah9lkk27wqP+AAWxSSNvnJIBtlqsYpZoJodh23q3JoWEXCmWMTLfhM22iSgjIy
	 lRhy+ySBnL/DRMhk1Zo6njEVmvxkzMTVbSmjqTYXzX5sQH+uwBnY/WkC4TV5E+K8mj
	 1w2U4f0JK4yzg==
Received: from mail4.meandermc.nl (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF6AAE7C0F
	for <ath10k@lists.infradead.org>; Sun, 28 Jan 2024 22:04:39 +0100 (CET)
Received: from SRV-EXCH-02.meandermc.vineta.nl (unknown [10.1.129.122])
	by mail4.meandermc.nl (Postfix) with ESMTPS
	for <ath10k@lists.infradead.org>; Sun, 28 Jan 2024 22:04:39 +0100 (CET)
Received: from SRV-EXCH-01.meandermc.vineta.nl (10.1.129.121) by
 SRV-EXCH-02.meandermc.vineta.nl (10.1.129.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Jan 2024 22:04:29 +0100
Received: from [156.96.112.132] (87.213.170.55) by
 SRV-EXCH-01.meandermc.vineta.nl (10.1.129.121) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 28 Jan 2024 22:04:29 +0100
Content-Type: text/plain;
	charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: PERSONAL
To: <ath10k@lists.infradead.org>
From: Anna Pechorin <ap@meandermc.nl>
Date: Sun, 28 Jan 2024 13:04:52 -0800
Message-ID: <ed2e2a01-2b73-4bf3-bbbc-0c901a5884f7@SRV-EXCH-01.meandermc.vineta.nl>
X-TM-AS-Product-Ver: IMSVA-9.1.0.2164-9.0.0.1002-28148.002
X-TM-AS-Result: No-12-121.510400-8.000000
X-TMASE-MatchedRID: jaORi6T9uOz2TJ4X5Iv1garoPbyANljgUTBIPA569SGpFMAdzAAQJx2r
	rGe8rZbLO69+IARBiUM6gbIYokhQqc+4AFSJFoPJdnyATUcB4BtPNXOxcJBlasCUWF7FtWK6V72
	g61ngi5/CllxMzB5TMFqhASDshmIptNiL0CdBOIBswYo64ufkVcMFDjMfv7kDyJVZtTPPygVFRI
	+dOD7xzBJWbLCsbi+3Ac+HSbz+uQe2pjaFaKwUXRTs4T19wprxhgI0uYcq9JVTuaxdsRS+eIRbL
	zRlCBqQicNG1XIbG2INU0tjWb0+G3RtYUO/i0PCwfxJy/eAZt6cark75pTJS5s2IS2lEcJQRKgE
	yRnnaFsndTfoiM9wUn8mA3sDDq0A9FfgqD4hfpOQcHYOUcn/nrirEcQmvRfkdnYdrEck9S5JfaM
	WBkhEfQJBjaROnzbO8e8mccilGCgD+c09Hd/d3OJGF26G8SWyjVQoJT90hHlm8uqS0UmPYnmaMa
	GuGDWdWaGDwLl9D5HGXnElZguS7ilTNYMgTblU
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 12-126.510400-10.000000
X-TMASE-Version: IMSVA-9.1.0.2164-9.0.1002-28148.002
X-TM-SNTS-SMTP: 72C2BCD205FBB62B55B02BBBC5AC1F101809C879B33AC1857951BF29947CFEDD2000:8
X-TM-AS-GCONF: 00
X-TMASE-SNAP-Result: Not scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_132327_417602_63A8C1BF 
X-CRM114-Status: SPAM  (  -5.57  )
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
Reply-To: pechorinanna@gmail.com
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi there

I hope you are well and high in spirit? Before I continue, let me humbly =
apologize for coming into your space unsolicited. Nonetheless, I take sol=
ace in the fact that it is with the best intention and for our mutual ben=
efit.

I chose you among other contacts that I came across in my search for some=
one who can partner with me in investment venture. It took a great deal o=
f brain storming for me to arrive at this decision owing to my present pr=
edicament, which I will explain to you in my follow up email. I hope that=
 my contact with you will be private, confidential and fruitful.

Presently I am totally indisposed to carry out financial transactions due=
 to restrictions relating to the suspicious death of my husband, Ivan Pec=
horin who was totally against the Ukraine war. Before long it would be di=
scovered that President Vladimir Putin murdered my husband. My strongest =
desire is to partner with you in investing my family money domiciled outs=
ide the shores of Russia and you becoming my fund manager. I have no prob=
lem investing this money in your country if it offers investment friendly=
 environment. 

It will be an absolute pleasure, if you would have the wherewithal to han=
dle this project to my satisfaction. Every detail concerning this project=
 would be laid bare to you upon indication of your interest.

Please strictly respond to pechorinanna@gmail.com


Best regards

Anna Pechorin.
***************************DISCLAIMER****************************
De informatie in dit e-mail bericht is uitsluitend bestemd
voor de geadresseerde. Verstrekking aan en gebruik door
anderen is niet toegestaan. Door de elektronische verzending
van het bericht kunnen er geen rechten worden ontleend aan de
informatie.



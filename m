Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316E2C3DA4A
	for <ath10k@archiver.kernel.org>; Fri,  2 Aug 2024 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uGTmdNfeKWYppKfROrYtp0X+RK7/pRJQsBUrarqToyk=; b=BQoRxWuzYgHPJC/Q2TP+dtB6uN
	mIJrbtiYfL1J4LDiHY9N5Lkg68iVmsSyWuYIKXrUdiqsi1ENEinysEekzYJxQ4xQ1IFvZVOTZF9UI
	cajXwykqzsHDxFJ7lg39vPBz10u8xAg4zf5cLWitoy1RSzulZJqtBmcwEhcuV3JKYHEiZjOVBQYP0
	NVTDNfz1+xY3wQo9YW/vUJ1PFLvG9CXPreUUK0ebaCDn/9PSbqSsbAO+PG7WzTsBBwSykUJhyNg5/
	lhfDu2XWZHf5J5D81YLbOaxHBjkCWdOs71nDSvcMBKw/Mo0rWYP1XLB+mLyBV/3KD58HQ2eyxtfMJ
	tedqU9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnWj-000000085V3-1TjF;
	Fri, 02 Aug 2024 08:20:41 +0000
Received: from mail.envisioncraftsman.com ([162.19.67.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnWf-000000085TM-3RwK
	for ath10k@lists.infradead.org;
	Fri, 02 Aug 2024 08:20:39 +0000
Received: by mail.envisioncraftsman.com (Postfix, from userid 1002)
	id 2614F26BFD; Fri,  2 Aug 2024 10:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=envisioncraftsman.com; s=mail; t=1722586282;
	bh=uGTmdNfeKWYppKfROrYtp0X+RK7/pRJQsBUrarqToyk=;
	h=Date:From:To:Subject:From;
	b=ib/wbetG+3Ndnao8BPHKbvokuo9OhZkWI5K9l2fEHW9zh4nspMyKV63O6FAE2AvnN
	 rnq63Ms+jGkduBeWiBHUhA0gwjywfEO6iVGFHz4vxs815af1QNJtXsdOHpFDyRidPQ
	 9YehD7SorpJSNdvHa2PFyDuy8Cc5mLpVCjsgaz8nGWOTIWiNdpw272mjPc/PmN0AD1
	 k/U3jTeiMRi9tZ8lsV2RPrs6B4B/hELTdTbxkMF+gifA+t2bdrvwlPJPlKGjjQeyDE
	 NVCrUZ9MOIQ2ZW+yyZtY6D30qkiYOOWRxC4/UrqSpAgwcnExbfsrQJs6ioC1fSaGNS
	 Nwx10X/BQ7/Ig==
Received: by mail.envisioncraftsman.com for <ath10k@lists.infradead.org>; Fri,  2 Aug 2024 08:10:44 GMT
Message-ID: <20240802084500-0.1.47.rntd.0.998axv42am@envisioncraftsman.com>
Date: Fri,  2 Aug 2024 08:10:44 GMT
From: =?UTF-8?Q?"Jan_Pol=C3=A1=C5=A1ek"?= <jan.polasek@envisioncraftsman.com>
To: <ath10k@lists.infradead.org>
Subject: Quick Question About Collaboration
X-Mailer: mail.envisioncraftsman.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_012038_560293_C171EFBB 
X-CRM114-Status: UNSURE (   1.92  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello!

I am very impressed with the products and services you offer.

I thought we could help you reach a larger audience with your offerings. =
Would you be interested in collaborating with us in an affiliate marketin=
g campaign?

For example, our program for a company in the e-commerce sector resulted =
in an increase in revenue from 8% to an impressive 19% (on average per qu=
arter).

We achieve up to 13% turnover in GA4, while standard affiliate networks g=
enerate only 3-6%.

Would you have time for a short conversation in the next few days?


Best regards
Jan Pol=C3=A1=C5=A1ek


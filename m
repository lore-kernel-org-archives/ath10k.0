Return-Path: <SRS0=uzqH=HK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31998C433DB
	for <ath10k@archiver.kernel.org>; Mon,  8 Feb 2021 00:58:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D23E464E5A
	for <ath10k@archiver.kernel.org>; Mon,  8 Feb 2021 00:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D23E464E5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Subject:
	From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g+LrAXNFraWnTNH3Mq4qeqXgR58iSN6kFOlv2hIflE8=; b=ijEN9FAb5/dQlTcS9dQpxmgpoq
	a9fA+2gajdPfONIHtS7TBAWxRZncpOK7eSNupeIeYKEqz67vy7HbefyVYK7awZD8ktebVyV8Iezk8
	7sgp93tchLw9NmlbID3bRRODWeU5Hl0+5mImVDG1uDWGCRX19UBVpohc55rYuj0NBIM/maI/92Opn
	VLPZCNdpkkflv+7YxTV/7wbgy3Bk5rI9GRaAbxRiRfI7kpAqBbH1QXj9g6GmcdO27Ifcc1+AcRn4K
	nR8Q3DxtEXOF2Bj8vxtUssHQMOaH2MALqcftxbcLxzVygQ5DCBCAtym/nVyh5aVAAi/4LJ5FKxcA+
	2UVurqZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8urd-0003kq-II; Mon, 08 Feb 2021 00:57:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8urb-0003kc-PS
 for ath10k@merlin.infradead.org; Mon, 08 Feb 2021 00:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Date:Reply-To:Content-Type:To:Subject:
 From:Sender:Message-ID:Cc:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=22PjdP3HY0tZzoW6pHULZs18Ep/qcWy+gXqf0IurJHM=; b=VN28zIuapOXxVhm7ieQ/K1IZyI
 WC3mvhKxEK1Kb8dImyBY9Br15T6rURgBqX2E6BSABTjOecoBVjc5mEIeBFEQDSrfYo/fyZgC+lpk5
 8DWN5qY8eAsbN+EJ1J+FNsiukdjP/Cjsr8nuEju2+cWHO9mOdBCgn8TAFTt55bQ9Qh6S9pBwMtk2B
 dmtHKyJBxf88b64qsW38AJiuyQdSDPFCiK8HGyaTLz9x0HEswFVvyjpkXxlVp8c76LIOEgFO5fl9v
 g86N53epOSM2jE6MGbN3HtnvHqP1c8d8JesQl6QqXm3q1thP3I8ByCKUUVRfDABSRC799swCkNzM7
 bMgYOeyA==;
Received: from [209.141.46.27] (helo=50uj302.com)
 by casper.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1l8urY-005JSx-Qb
 for ath10k@lists.infradead.org; Mon, 08 Feb 2021 00:57:14 +0000
From: "Ms. Kim Chan" <mskmchanouk@gmail.com>
Subject: Investment research about your country
To: ath10k@lists.infradead.org
Date: Mon, 8 Feb 2021 07:57:12 +0700
X-Priority: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_005714_042635_62895D7A 
X-CRM114-Status: SPAM  (  -5.39  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: "Ms. Kim Chan" <mskmchanouk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Message-ID: <E1l8urd-0003kq-II@merlin.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

My name is Ms. Kim Chan Ouk, A Thai citizen in Asian Continent but currently
residing in abroad, I trust this email meets you in good health, I just got
your contact today during a research about your country and I will say that
I foresee success of my future investment ventures in your country. I want
to invest in your country and I would like you to assist me in my investment
my investment Please do reply me as soon as possible so
we can discuss more.

I look forward to hear from you soon
mskmchanouk@gmail.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <SRS0=pCY9=O5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CB6C433EF
	for <ath10k@archiver.kernel.org>; Sat,  9 Oct 2021 06:53:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA84060F55
	for <ath10k@archiver.kernel.org>; Sat,  9 Oct 2021 06:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA84060F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alice.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Message-ID:Reply-To:Cc:Content-ID:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Owner;
	bh=3yZKf/6YEiqzqW1sE/pRR4oipqFS2SLaYLKFnEzDc14=; b=yDFso7EjVUg+1e4ZtdwiTFlHKw
	1w/MZMgp1uMAdpokJtlOPEoeqRZPKO4UyA4GzTy3Ra0P2rQkYniI4xI6f2njlaYVdMYlqH3735rkh
	/LGVE8nkNL36UM3Pjjg8+6Oad2SEa28sMXHe6cWmHISBPSFi0avyWnTkmHniblx6zNRUcuPlQqfkl
	05zl/obN+a8knhuMgFWU2dRh5HiHHRUM/g3I/1SQYD9vvb748FL+WvwovyKjySGunoGMe5V5kMvaq
	B2dx9MRn8DIdCqVdESz/+b65uHfOjwQNNicip8fWOhwQ4KUR4a0p0dg44MgAlg2kjXvUVzNYbup+v
	dObpIKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ6E1-005Gph-9v; Sat, 09 Oct 2021 06:52:53 +0000
Received: from smtp217t.alice.it ([82.57.200.120] helo=smtp217t-alice.alice.it)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ6Dx-005GoJ-Bp
 for ath10k@lists.infradead.org; Sat, 09 Oct 2021 06:52:51 +0000
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtuddgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfvgffngfevqffokffvtefnkfetpdfqfgfvnecuuegrihhlohhuthemuceftddunecuogfpohfkffculddutddmnecujfgurheptggggffuvffhfffosehtqhdttdfvtddunecuhfhrohhmpedfofhishhsohhurhhiucfnohhtthhofdcuoehmihhrkhhordhmrghrtghonhesrghlihgtvgdrihhtqeenucggtffrrghtthgvrhhnpeefgfettdetveffgfehudffhedvteelhefhieeviefgvdehveehffetgfeijefgteenucffohhmrghinheplhhothhtvghrhihushgrrdgtohhmnecukfhppeejtddrfeehrdduleejrddufeefnecuvehluhhsthgvrhfuihiivgepvdekudenucfrrghrrghmpehhvghlohepfghsvghrqdfrvedrfedrhhhomhgvpdhinhgvthepjedtrdefhedrudeljedrudeffedpmhgrihhlfhhrohhmpeeomhhirhhkohdrmhgrrhgtohhnsegrlhhitggvrdhitheqpdhrtghpthhtohepoegrthhhuddtkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgheq
X-RazorGate-Vade-Verdict: clean 10
X-RazorGate-Vade-Classification: clean
Received: from User-PC.3.home (70.35.197.133) by smtp217t-alice.alice.it
 (5.8.604.04) (authenticated as mirko.marcon@alice.it)
 id 61116A131380F1EE for ath10k@lists.infradead.org;
 Sat, 9 Oct 2021 08:52:42 +0200
Message-ID: <61116A131380F1EE@smtp217t-alice.alice.it> (added by
 postmaster@alice.it)
MIME-Version: 1.0
Content-Description: Mail message body
Subject: W i n n e r
To: ath10k@lists.infradead.org
From: "Missouri Lotto" <mirko.marcon@alice.it>
Date: Sat, 09 Oct 2021 07:52:27 +0100
X-Mailer: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
 rv:1.6) Gecko/20040113
Sensitivity: Personal
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_235249_769607_B68DE51A 
X-CRM114-Status: SPAM  (  -5.92  )
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

A t t n Recipient : B e n e f i c i a r y,

We'd like to inform you that your email address has won Five million
nine hundred thousand ( $5.9 Million ) on the latest MO Lottery online
lottery games in Missouri, USA.

This lottery was organized and played with the automatic online voting
system "FAI". Fortunately, your email address has been selected as one
of the free online lottery winners.

For further confirmations, please visit the La Loterie Mo website
below to confirm your lottery date and number. Upon confirmation of
the lottery in which you were selected as one of the lucky winners of
the year. You can then contact the Mo Lottery Agent / Representative
in UNITED STATES, to claim your w i n n i n g s.

please visit the website below to confirm your lottery (https://www.lotteryusa.com/missouri/lotto/year)


Draw date. Wednesday, Sep 01, 2021
W i n n i n g number: 2 12 18 21 29 32
The annual amount is Est. Jackpot $5.9 Million
F I L E R E F NO: ILP/HW -7506172/20
R E F E R E N C E NO: 7506172/20
B A T C H NO: 0564909/19


In order to receive your a w a r d, it is recommended that you contact our
representative, DR. JOHN MORR of UNITED STATES OF AMERICA,
immediately to officially approve your a w a r d.

Remember to contact DR. JOHN MORR with your l o t t e r y  (  2 12
18 21 29 32 ) including a scanned copy of your ID or passport so he
can identify your payment details.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

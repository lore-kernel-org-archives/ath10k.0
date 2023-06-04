Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E5CC7EE29
	for <ath10k@archiver.kernel.org>; Sun,  4 Jun 2023 12:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tqLrtoeH3IUhrTCK9gpedvH2vJk0wez3zuFAmWRhh9c=; b=0ls3LdalDDwG0i
	/yA8MN4s3Ocl/IhgahJDN7TI7hdkNlNsqsyur+h8J1sq+d2ZYXOy2KeUPDYD1QjtvMb7NwcSaG//L
	YBSFVGQmsfWZn9o/KWxqjCOYHxy/0aeS0cP4y3I2sKrYst7a19jSQo3/xn6jIuTyTkdZIgy6D0cLH
	lGl1AzYOrLFHzIALMFBSROBzz9eYI1+NicI9xXpRmC4zkfod2y8HOs9yjvkDlLu8EU2A12GlynYiq
	csfGhhVe/T/j6hqLUOsA4m2uUIzdeHuQKcfoWH7SlaE14wsR6ad+Dfvzswhyb9Zpsp+WHc1qQWasg
	NpI/+3k8c0kLeejbhw4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5mPS-00C56e-2y;
	Sun, 04 Jun 2023 12:00:34 +0000
Received: from [202.157.188.57] (helo=synergy.bess.co.id)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5mPP-00C55H-1N
	for ath10k@lists.infradead.org;
	Sun, 04 Jun 2023 12:00:33 +0000
Received: from localhost (localhost [127.0.0.1])
	by synergy.bess.co.id (Postfix) with ESMTP id 36049A20CC32
	for <ath10k@lists.infradead.org>; Sun,  4 Jun 2023 18:47:01 +0700 (WIB)
Received: from synergy.bess.co.id ([127.0.0.1])
	by localhost (synergy.bess.co.id [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id IK1eygIL3agv for <ath10k@lists.infradead.org>;
	Sun,  4 Jun 2023 18:47:01 +0700 (WIB)
Received: from localhost (localhost [127.0.0.1])
	by synergy.bess.co.id (Postfix) with ESMTP id CE8DBA20D0BA
	for <ath10k@lists.infradead.org>; Sun,  4 Jun 2023 18:46:58 +0700 (WIB)
X-Virus-Scanned: amavisd-new at bess.co.id
Received: from synergy.bess.co.id ([127.0.0.1])
	by localhost (synergy.bess.co.id [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WxwpAiwD2v48 for <ath10k@lists.infradead.org>;
	Sun,  4 Jun 2023 18:46:58 +0700 (WIB)
Received: from bess.co.id (unknown [156.0.213.29])
	by synergy.bess.co.id (Postfix) with ESMTPSA id 77F24A20E717
	for <ath10k@lists.infradead.org>; Sun,  4 Jun 2023 18:46:53 +0700 (WIB)
From: Mr Philippe <reni@bess.co.id>
To: ath10k@lists.infradead.org
Subject: Re: Bonjour
Date: 04 Jun 2023 13:46:52 +0200
Message-ID: <20230604134652.B0203583E7575129@bess.co.id>
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_050031_713941_8877CDF1 
X-CRM114-Status: UNSURE (  -2.53  )
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
Reply-To: phillippemartinez@outlook.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Qm9uam91ciwKSmUgbWUgcHLDqXNlbnRlIE1vbnNpZXVyIFBoaWxpcHBlIE1BUlRJTkVaLCBqZSB2
b3VzIGNvbnRhY3RlIHN1aXRlIArDoCB1biBkb24gZGUgMSA1MjUgMDAwIOKCrCBxdWUgamUgdmV1
eCB2b3VzIG9mZnJpciwgY2FyIG1lcyBqb3VycyAKc29udCBjb21wdMOpcy4gUG91ciBwbHVzIGRl
IHJlbnNlaWduZW1lbnRzLCBqZSB2b3VzIHByaWUgZGUgYmllbiAKdm91bG9pciBtZSBjb250YWN0
ZXIgw6AgbW9uIGFkcmVzc2UgY291cnJpZWwgcGVyc29ubmVsOiAKcGhpbGxpcHBlbWFydGluZXpA
b3V0bG9vay5jb20KUXVlIGxlIFNlaWduZXVyIGRpZXUgY3LDqWF0ZXVyIGR1IGNpZWwgZXQgZGUg
bGEgdGVycmUgZXhhdWNlIHZvcyAKcHJpw6hyZXMsIEFtZW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==

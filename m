Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F3AC433F5
	for <ath10k@archiver.kernel.org>; Thu, 12 May 2022 04:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:Mime-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hQ1LmkYUdMSllpTl/KCn80A7qRYqSZ3qRZNccsTQg18=; b=YbDGgznqGQSfzT
	STlwnVxtbpcU1YHZBz3H8QQu/b1vbksRuNVvCO7A9VTGhNLQVKTcmdTRjhwAR0Br6ef+Wdf8Nyrf7
	7qhGq6cCy00z5v6RiMyoOiHsI2Rz3wI95ePNcBL10SEdghNMThLMh2LqmHytCIhQpbGPzNEnOdt8u
	kaZ/a72aFOagwcb2FLtglUm0p3qhAudMVF+zabrEUthCTI9Jp7F2npee41cxh211rmwnH1IFRTq89
	lu7W7+LQaJAPq91kTcqIfULPsRtTD92bF4t7fCCvDut9CK4FRyN0G9AYI0QzmeHwsvLUlwn9REhZb
	e+H3nvv4bQfizQOKjcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np0i0-00A0MT-VW; Thu, 12 May 2022 04:45:52 +0000
Received: from [94.249.236.152] (helo=host.securemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np0hy-00A0L3-K1
 for ath10k@lists.infradead.org; Thu, 12 May 2022 04:45:52 +0000
Received: from [103.252.117.68] (unknown [103.252.117.68])
 by host.securemail.com (Postfix) with ESMTPA id 2B365B530E1
 for <ath10k@lists.infradead.org>; Thu, 12 May 2022 07:40:50 +0300 (MSK)
Mime-Version: 1.0
Content-Description: Mail message body
Subject: Your kind attention
To: ath10k@lists.infradead.org
From: mathejohnson91@gmail.com
Date: Thu, 12 May 2022 07:40:50 +0300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_214551_013424_E100483E 
X-CRM114-Status: SPAM  (  -6.21  )
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
Reply-To: mathew@mjsconsortium.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Message-ID: <E1np0i0-00A0MT-VW@bombadil.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SGVsbG8gdGhlcmUsCgpNeSBuYW1lcyBhcmUgTWF0aGV3IEpvaG5zb24sIEkgYW0gcmVwcmVzZW50
aW5nIHRoZSBpbnRlcmVzdCBvZiBhIGNlcnRhaW4gcG9saXRpY2FsbHkgZXhwb3NlZCBwZXJzb24s
IHdlIGFyZSBsb29raW5nIGZvciBwYXJ0bmVycyBvdmVyc2VhcyB0aGF0IGNhbiBtYW5hZ2UgaGln
aC12YWx1ZSBmdW5kcyBmb3IgYSBwZXJpb2Qgb2YgNS0xMCB5ZWFycywgdGhlIGZ1bmRzIGhhdmUg
YmVlbiBhY2NydWVkIGJ5IHRoZSBpbmZsdWVuY2Ugb2YgdGhlIHBvd2VyIG9mIG15IGJlbmVmYWN0
b3LigJlzIG9mZmljZS4KClBsZWFzZSBkbyBjb250YWN0IG1lIGlmIHlvdSBhcmUgaW50ZXJlc3Rl
ZCBhbmQgSSB3aWxsIGV4cGxhaW4gdGhlIGJ1c2luZXNzIHRvIHlvdSBpbiBkZXRhaWwgZm9yIHlv
dSB0byBiZXR0ZXIgdW5kZXJzdGFuZCB0aGUgdHJhbnNhY3Rpb24sIEkgY2FuIGFzc3VyZSB5b3Ug
dGhhdCB0aGlzIHdpbGwgYmUgb2YgbXV0dWFsIGJlbmVmaXQgdG8gYWxsLgoKWW91IGNhbiByZXNw
b25kIHRvIG1lIGFuZCBpbGwgc2VuZCB5b3UgYSBkZXRhaWxlZCBleHBsYW5hdGlvbgoKWW91cnMu
CgpNYXRoZXcgSm9obnNvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

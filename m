Return-Path: <SRS0=ZFlJ=IZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE9BC433DB
	for <ath10k@archiver.kernel.org>; Sat, 27 Mar 2021 14:43:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D4F261976
	for <ath10k@archiver.kernel.org>; Sat, 27 Mar 2021 14:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D4F261976
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nic.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wPrCCdT24AaKxM1NKiSP7VLZTFuCZJqiLRZH5BGQlh4=; b=SKgEd+evMQEoTVNjGn3AGlARt
	ljYgFfc8k1fs2u3zQ6e06k4unD3WK1IW09qdwgi38PsXpvF+Tt5cqdQ7DzJGY8J4C3uToRHYJeaGq
	CZCV6yc2VZYdi+NauQRlUIacAcBbWffAZzcK+FKGU8vB65ykLbMOXM9EZ1cIFVNINHjFidfZqd5xY
	d9rBaah0kK4KgpCPIBbS7ny1ie/5xdEItommbuRvdy24sEPrLGGQzg4rgqONoSctyfXU8llPf3xV/
	JGoj9AEMnra7cTcT3UeZP4tzGMnMjEbekmDSUX9QiXbbMIwSjxy4RY0AHZP9G09R0lkacal0jL/38
	yXcEovSLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQA9K-005Bs8-Ma; Sat, 27 Mar 2021 14:42:50 +0000
Received: from lists.nic.cz ([2001:1488:800:400::400] helo=mail.nic.cz)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQA9G-005Brc-1e
 for ath10k@lists.infradead.org; Sat, 27 Mar 2021 14:42:47 +0000
Received: from dellmb.labs.office.nic.cz (unknown
 [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
 by mail.nic.cz (Postfix) with ESMTPSA id 33833140AE7;
 Sat, 27 Mar 2021 15:42:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1616856164; bh=nbYNsAK2One2JFvggre3QyTyFpQJQ7zSpNnqJUjIURM=;
 h=Date:From:To;
 b=gHQQoh7U/onyzxPBUweSPHiV5+X91lH1RlYcOfYSRYSyfpqbTVHBfwmk+H7AHP3si
 FgR6xYPEUZxB5fXDcr7rVcowKrKspJO3B+0pTLm3VM8eozVUH1QTVW6YUeXyXd2Zm2
 h9ZPLipHM14MFnXMOGeYaHeaQ8nQPVsJ9b5J6S7o=
Date: Sat, 27 Mar 2021 15:42:13 +0100
From: Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Kalle Valo <kvalo@codeaurora.org>, Toke
 =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, Marek
 =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, vtolkm@gmail.com, Rob Herring
 <robh@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Jason Cooper
 <jason@lakedaemon.net>, linux-pci@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: Disallow retraining link for Atheros QCA98xx chips
 on non-Gen1 PCIe bridges
Message-ID: <20210327154213.571aa263@dellmb.labs.office.nic.cz>
In-Reply-To: <20210327132959.fwkphna7gg57aove@pali>
References: <20210326124326.21163-1-pali@kernel.org>
 <YF540gjh156QIirA@rocinante> <20210327132959.fwkphna7gg57aove@pali>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_144246_204193_105BAAB4 
X-CRM114-Status: UNSURE (   8.96  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAyNyBNYXIgMjAyMSAxNDoyOTo1OSArMDEwMApQYWxpIFJvaMOhciA8cGFsaUBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gSSBjYW4gY2hhbmdlIHRoaXMgdG8gJ2lmICghcmV0KScgaWYgbmVl
ZGVkLCBubyBwcm9ibGVtLgo+IAo+IEkgdXNlICdpZiAoIXZhbCknIG1vc3RseSBmb3IgYm9vbGVh
biBhbmQgcG9pbnRlciB2YXJpYWJsZXMuIElmCj4gdmFyaWFibGUgY2FuIGNvbnRhaW4gbW9yZSBp
bnRlZ2VyIHZhbHVlcyB0aGVuIEkgbG90IG9mIHRpbWVzIEkgdXNlCj4gJz09Jy4KCkNvbXBhcmlu
ZyBpbnRlZ2VyIHZhcmliYWxlcyB3aXRoIGV4cGxpY2l0IGxpdGVyYWxzIGlzIHNlbnNpYmxlLCBi
dXQKaWYgYSBmdW5jdGlvbiByZXR1cm5pbmcgaW50ZWdlciByZXR1cm5zIDAgb24gc3VjY2VzcyBh
bmQgbmVnYXRpdmUgdmFsdWUKb24gZXJyb3IsIExpbnV4IGtlcm5lbCBoYXMgYSB0cmFkaXRpb24g
b2YgdXNpbmcganVzdAogIGlmICghcmV0KQpvciAKICBpZiAocmV0KQoKTWFyZWsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxp
c3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

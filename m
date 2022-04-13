Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD56C433EF
	for <ath10k@archiver.kernel.org>; Wed, 13 Apr 2022 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmoMEVM7OgOqyZrdTNLgF2QUNWXqQZ5MSLK66GgJPho=; b=BNWK+08fg4iJ3Q
	PpH+BUmB1vGKPnBzunP5RTnsndMx8gyXwyjpbSL+hakkMviiIMPfKqeyR05TXAIT1YcXUenEplY2f
	GV6s0G8k438SES70ow0ftWSEd2rk7cKcMjJgNsyFE2N7MdyyDWeZ1EQkYrqf7W3zqdm+SqHowWsOd
	mYxmtNH6wNZ9kmKMC7zMoXbU07JNBDRAyQc3Tsxagpw/jvh5QZ4uLgz7Euq4SrTMalOrjXJj/7oBX
	kYchkRqhREMVz1aREB1IthFg0bgu6L/lDDj0LA28/VF0nsNA+PZBiCPcRiae46n/zsf6nNfOCLcZF
	iNrRxD4f8plUy74nQD1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZ0p-000FCM-N4; Wed, 13 Apr 2022 09:10:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZ0m-000FAU-K0
 for ath10k@lists.infradead.org; Wed, 13 Apr 2022 09:10:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFF6161AD1;
 Wed, 13 Apr 2022 09:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A051C385AD;
 Wed, 13 Apr 2022 09:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649841002;
 bh=J4/0BISmt7fR+TAwQ6jTO7+X9Y8Sx4Kxgg6lLE7W5a0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=bxZaLXbMnOYejDerHSDnaOeMzdFY8PTo70TEkLqkzy5+eIoos6g6F4zEBFKlroliA
 GES1xu65MotImHZmoKUWrFKBJSguqVbRo7OsyHcBHkDQA0yOHlaGo9mMSPz9JkeW+5
 qt2jzq27FjdLJE4PxGM7B4Bvi99+OWyA2rrsPDnjdI8J7xgOc6RoYcpV67uqtgOTr0
 sad0lb07EW/3qKr+aaeSHMvK52AwAIJuEF67Mt+aXlWObSoRf7MzYElCYsiXzgtX77
 RIPONw7wcpmCqRnPXi7kcXAcJbR0RsnQLgL4GZ/tphbeWy4vTRjwXwOHjdme7NVyQG
 /ATM2UjGNc1hg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA6174: hw3.0: Add board file for DragonBoard
 820c
References: <CAA8EJppbd=s-R3PnAXCaZAHA-iiBLFaA79Y7fRFY+JUO8jU==g@mail.gmail.com>
Date: Wed, 13 Apr 2022 12:09:59 +0300
In-Reply-To: <CAA8EJppbd=s-R3PnAXCaZAHA-iiBLFaA79Y7fRFY+JUO8jU==g@mail.gmail.com>
 (Dmitry Baryshkov's message of "Sat, 2 Apr 2022 14:09:00 +0300")
Message-ID: <87ee21l57c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_021004_715554_200E903C 
X-CRM114-Status: GOOD (  16.06  )
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

RG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPiB3cml0ZXM6Cgo+
IEhpLAo+Cj4gV2UnZCBsaWtlIHRvIGFzayBmb3IgaW5jbHVzaW9uIG9mIHRoZSBib2FyZCBmaWxl
IGZvciB0aGUgOTZib2FyZHMKPiBEcmFnb25Cb2FyZCA4MjBjLiBJdCBpcyBhIGRldmVsb3BtZW50
IGJvYXJkIGlzIGJhc2VkIG9uIHRoZSBRdWFsY29tbcKuCj4gU25hcGRyYWdvbiA4MjBFIGVtYmVk
ZGVkIHBsYXRmb3JtIChBUFE4MDk2KS4KPiBGb2xsb3dpbmcgdGhlIHF1ZXN0aW9ucyBmcm9tIHRo
ZSBhdGgxMGsgd2lraSBwYWdlOgo+Cj4gKiBkZXNjcmlwdGlvbiBmb3Igd2hhdCBoYXJkd2FyZSB0
aGlzIGlzCj4gICAtIEl0IGlzIGFuIEFQUTgwOTYgYmFzZWQgYm9hcmQuCj4gICAtIEl0IHVzZXMg
cWNhNjE3NCBjaGlwIGFzIGEgV2lGaSBhbmQgQlQgcmFkaW8KPgo+ICogb3JpZ2luIG9mIHRoZSBi
b2FyZCBmaWxlCj4gICAtIEl0IGNvbWVzIGZyb20gdGhlIEJTUCBwYWNrYWdlIGRpc3RyaWJ1dGVk
IGJ5IExpbmFybwo+IChodHRwOi8vcmVsZWFzZXMubGluYXJvLm9yZy85NmJvYXJkcy9kcmFnb25i
b2FyZDgyMGMvcXVhbGNvbW0vZmlybXdhcmUvbGludXgtYm9hcmQtc3VwcG9ydC1wYWNrYWdlLXIw
MTcwMC4xLnppcCkKPgo+ICogaWRzIHRvIGJlIHVzZWQgd2l0aCB0aGUgYm9hcmQgZmlsZQo+IGJ1
cz1wY2ksYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MQo+Cj4gKiBtZDVzdW0gb2YgZWFjaCBu
ZXcgYm9hcmQgZmlsZSB0byBhZGQKPgo+ICQgbWQ1c3VtICoKPiAxMTg5ZTk5YWZjYWU3YjU3YmY1
YmQzNjllOWFkMTM4NiAgYnVzPXBjaSxibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0xLmJpbgo+
ICQgc2hhMjU2c3VtICoKPiBkNjUzOGYwNGFkMzUxYzFmOTExYWNlZTAzMzQyNDVhNGIzMjJmNzA5
MDk2ZjJhNzRlYzUxNjg0YjgwODBiZTJhCj4gYnVzPXBjaSxibWktY2hpcC1pZD0wLGJtaS1ib2Fy
ZC1pZD0xLmJpbgoKVGhhbmtzLCBhZGRlZCB0byBRQ0E2MTc0L2h3My4wL2JvYXJkLTIuYmluOgoK
TmV3OgpidXM9cGNpLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTEKCkNoYW5nZWQ6CgoKRGVs
ZXRlZDoKCjEgYm9hcmQgaW1hZ2UocykgYWRkZWQsIDAgY2hhbmdlZCwgMCBkZWxldGVkLCA4OSBp
biB0b3RhbAoKaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDEway1maXJtd2FyZS9jb21taXQv
ODIwNDc4MzhmMWNlMWY1ZDAxMGE0YWRhMTUwOWViYWQ4ZGNmNzljMgoKLS0gCmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93
aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1p
dHRpbmdwYXRjaGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

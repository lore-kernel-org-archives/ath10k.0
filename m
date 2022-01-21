Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEED9C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/SkT+GYD0khRM73g7ntKzLhguthYR61Pw/jrqfmINc=; b=RROzBQHTuO7H9d
	dqF0aN69L743D+aZI7+WPgGK+oagNEYhOUjGpIMa6IsLVWGQ4qxm16YFcNDJ6CLzYwa9RYipO5heh
	INfv31AD6savVj0G4Sn0OA1mZ98yFX/5rseKfKL3aC2AqlVzbJigNyk6airZg0DnH0TF+tDEXP+a6
	LbiFG8IdNnUhtL+mYG/UmoiMQZiWdqmVyDDFXS7Gs7CCCJLua//UmnjdeCInvjjOhzmt2ptb13Yit
	1yIQ8BMAEsHpiMc4eN8Hyr/v+0YomtAW9HLVy8B3hBqF0g2rupGak1ule0geU1X+joQxpEoh7OQm5
	MbBfsWWVctavVB49ZF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAttK-00F82I-7u; Fri, 21 Jan 2022 13:23:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAttB-00F7w1-Fw
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:23:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B09EC61440;
 Fri, 21 Jan 2022 13:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B49C340E1;
 Fri, 21 Jan 2022 13:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642771416;
 bh=xFd+FeLdLuixHYOlruJNafr2oPqNuFc8imwqXCOm6Uc=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=WkHMu7aOYDvNlzJGfd10/ZFXpvYGjRlWCjtihyMx334x1m1A7CkOIGrMWa4TizD0w
 k48BLe6Q9Gzqxng4LyVqhjQKaeUbTOqJfenJCyrUJTKOghaGVDp5MPWhsmWizG1PyR
 t5ZDCK/W87wJYzCNTsXPp4gXJ53NEfZ/quccDAruvqW+Rrdeup9VQA/pZF3zEB4tC0
 s3RjZfcb11rLEklXV9sr4uhIlFLp45u5qLDoAlshF8KnpFbjyfOi8UZnW0uoaxzTXc
 1ycy61Y737wjbaEXUFA8SAGOAgvjL9eIfm4tkUf7hibTCDIZkYf1hmpOxCUgGH+Jqa
 iOXgkjnbq4p0g==
From: Kalle Valo <kvalo@kernel.org>
To: <GH.Lin@senao.com>
Cc: <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add EnGenius ENH1350EXT specific
 BDFs
References: <54471877A6737544840EE124CA1EFD38BC55A478@snex01.senao.com>
 <54471877A6737544840EE124CA1EFD38BC55A4B5@snex01.senao.com>
Date: Fri, 21 Jan 2022 15:23:30 +0200
In-Reply-To: <54471877A6737544840EE124CA1EFD38BC55A4B5@snex01.senao.com> (GH
 Lin's message of "Thu, 19 Sep 2019 03:24:35 +0000")
Message-ID: <878rv9fcj1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_052337_612001_A37151B9 
X-CRM114-Status: GOOD (  13.30  )
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

PEdILkxpbkBzZW5hby5jb20+IHdyaXRlczoKCj4gVGhlIHN1cHBvcnQgZm9yIHRoaXMgZGV2aWNl
IHdhcyBhZGRlZCBhIHdoaWxlIGFnbyB0byBPcGVuV3J0LiBUaGlzIEFQCj4gcmVxdWlyZXMgdHdv
IHNwZWNpYWwgQkRGcyB0byBnZXQgdGhlIFdpLUZpIFBIWXMgd29ya2luZyAoY29ycmVjdGx5KS4K
PiBUaGUgYm1pLWJvYXJkLWlkPSdzIHdvdWxkIGNsYXNoIHdpdGggb25lIG9mIHRoZSBJUFE0MDFY
IEFQLURLIGJvYXJkcwo+IGJlY2F1c2UgUUNBIGRvZXNuJ3QgcHJvdmlkZSBzcGVjaWFsIElEcyBm
b3IgY3VzdG9tZXJzIGFuZCBzZWVtcyB0byB1c2UKPiB0aGUgQVAtREsgYm9hcmQtaWRzIGluIHRo
ZSB3aWZpIGZpcm13YXJlIHRvIGNoYW5nZSBpdHMgYmVoYXZpb3IuCj4KPiBOb3cgdG8gdGhlIHF1
ZXN0aW9ucyBmcm9tIHRoZSB3aWtpIHBhZ2UgWzFdOgo+Cj4gbMKgwqDCoMKgwqDCoCBkZXNjcmlw
dGlvbiBmb3Igd2hhdCBoYXJkd2FyZSB0aGlzIGlzOgo+IC3CoMKgwqDCoMKgwqAgSXQgaXMgYW4g
SVBRNDAxOCBiYXNlZCBib2FyZC4KPiAtwqDCoMKgwqDCoMKgIE9uZSBRQ0E0MHh4IHJhZGlvIGlz
IHVzZWQgYXMgMi40R0h6IHJhZGlvCj4gLcKgwqDCoMKgwqDCoCBPbmUgUUNBNDB4eCByYWRpbyBp
cyB1c2VkIGFzIDVHSHogcmFkaW8KPgo+IGzCoMKgwqDCoMKgwqAgb3JpZ2luIG9mIHRoZSBib2Fy
ZCBmaWxlIChkaWQgeW91IGNyZWF0ZSBpdCB5b3Vyc2VsZiBvciB3aGVyZSB5b3UgZG93bmxvYWRl
ZCkKPiAtwqDCoMKgwqDCoMKgIFRha2VuIGZyb20gc3RvY2sgZmlybXdhcmUgaW1hZ2UKPgo+IGzC
oMKgwqDCoMKgwqAgaWRzIHRvIGJlIHVzZWQgd2l0aCB0aGUgYm9hcmQgZmlsZSAoQVRIMTBLX0JE
X0lFX0JPQVJEX05BTUUgaW4gYXRoMTBrKQo+IC3CoMKgwqDCoMKgwqAgUUNBNDAxOSBodzEuMAo+
Cj4gYTdiZmQ4NTU3ZTI5NjIwMTkwZWVlM2EzNDUzN2I4ZjbCoAo+IGJ1cz1haGIsYm1pLWNoaXAt
aWQ9MCxibWktYm9hcmQtaWQ9MTYsdmFyaWFudD1Fbkdlbml1cy1FTkgxMzUwRVhULmJpbgo+IDdi
YjdlOWFiMTE3YzFhNTYwZGMzMjU5ZjMwYmY1MDgxwqAKPiBidXM9YWhiLGJtaS1jaGlwLWlkPTAs
Ym1pLWJvYXJkLWlkPTE3LHZhcmlhbnQ9RW5HZW5pdXMtRU5IMTM1MEVYVC5iaW4KClRoYW5rcywg
YWRkZWQgdG8gUUNBNDAxOS9odzEuMC9ib2FyZC0yLmJpbjoKCk5ldzoKYnVzPWFoYixibWktY2hp
cC1pZD0wLGJtaS1ib2FyZC1pZD0xNyx2YXJpYW50PUVuR2VuaXVzLUVOSDEzNTBFWFQKYnVzPWFo
YixibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0xNix2YXJpYW50PUVuR2VuaXVzLUVOSDEzNTBF
WFQKCkNoYW5nZWQ6CgoKRGVsZXRlZDoKCjIgYm9hcmQgaW1hZ2UocykgYWRkZWQsIDAgY2hhbmdl
ZCwgMCBkZWxldGVkLCA2MCBpbiB0b3RhbAoKaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDEw
ay1maXJtd2FyZS9jb21taXQvMDhmY2NiMWFlZDBjMTY5M2NkZjA0YWY4MDkzMmQ4MDMxZjk0OWMy
NgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVz
cy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9k
b2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==

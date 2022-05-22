Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FE4C433EF
	for <ath10k@archiver.kernel.org>; Sun, 22 May 2022 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaWTlVeBoxbEvBjY/5tf4WY9AagHhDciga5iEy/hC9I=; b=cWyuVNE8rDtp5U
	u3Fc3wHtEndbdt4+KT+iWgByLvFtRpYhGvGv0d5oQX/wJX2Z+NtsDdN+90MkOrTzuYCCUxk+CBnlC
	p76Hp4YXnPXzUriFgjnEI4O8UQltpH9sgV70VEmkBhU1cGPR7VjxjYyPTQYXhDdKK308nj/wCgjtZ
	XARvL93ph9EwpfFOAnVS+iUXsgik82At/aax+VHHEWSyYXcC2iv+AZjoSB2u0swzYv/oTrf2Neqz+
	yVjmG2cCqpJzBMvJYBE1fddrYXjL1y44d8q9Lg8Kr2VcUh9N8gHvi7HnOIzPYO16DcA6H2mgy8JED
	oGXjuASMdCQNnOpR+5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nskgs-001Ju6-K3; Sun, 22 May 2022 12:28:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nskgp-001JtW-Vw
 for ath10k@lists.infradead.org; Sun, 22 May 2022 12:28:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BE9D60FA2;
 Sun, 22 May 2022 12:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDE3C385AA;
 Sun, 22 May 2022 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653222486;
 bh=Gr6lYAsULYInKXakt5MSXApQOLKEm9j6nKisVE6yrMg=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=b2BVJAEeOC+9I1zZfh0k1UCp7EJHWSHs1NSRhe9dsY/AiIH7RDpSm69Ba6cNTPrDJ
 Kh3fVyRoIj72dNbEHtrZQyPWiZJevloeT/mpOA7Ox8zDDYaa717VEAgOHSQgYvk3H+
 kvtubdfDgN6FXBtF7o+/HumxrquwnmtmfmH3NSWh63zmMdZxFfOoHkG4pSXaeugcx5
 MjbWofwIiyPKIZ26oWklLqp0x0BHTfxhR3paKrFNnuEkn14wp4cJyl4EEqYW5f0eim
 ddbUI6Gdcat1RcfZg7DwxDLaW+q8fZ/b2jPXrOpMh8BNBc5sktDkL5X8bUaYYiya+m
 evzhyDGFvCJBg==
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath10k: improve tx status reporting
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220516032519.29831-2-ryazanov.s.a@gmail.com>
References: <20220516032519.29831-2-ryazanov.s.a@gmail.com>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Edward Matijevic <motolav@gmail.com>, John Crispin <john@phrozen.org>,
 =?utf-8?b?T2xkxZlpY2ggSmVkbGnEjWth?= <oldium.pro@gmail.com>,
 Tom Psyborg <pozega.tomislav@gmail.com>,
 Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>,
 Zhijun You <hujy652@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165322248212.774.8451941042648724092.kvalo@kernel.org>
Date: Sun, 22 May 2022 12:28:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_052808_102805_3041051A 
X-CRM114-Status: GOOD (  11.00  )
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

U2VyZ2V5IFJ5YXphbm92IDxyeWF6YW5vdi5zLmFAZ21haWwuY29tPiB3cm90ZToKCj4gV2UgdXNl
IGllZWU4MDIxMV90eF9zdGF0dXMoKSB0byByZXBvcnQgZWFjaCBjb21wbGV0ZWQgdHggZnJhbWUu
Cj4gSW50ZXJuYWxseSwgdGhpcyBmdW5jdGlvbiBjYWxscyBzdGFfaW5mb19nZXRfYnlfYWRkcnMo
KSwgd2hhdCBoYXMgYQo+IGNvdXBsZSBvZiBkcmF3YmFja3M6Cj4gMS4gYWRkaXRpb25hbCBzdGF0
aW9uIGxvb2t1cCBjYXVzZXMgYSBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbjsKPiAyLiBtYWM4MDIx
MSBjYW4gbm90IHByb3Blcmx5IGFjY291bnQgRXRoZXJuZXQgZW5jYXBzdWxhdGVkIGZyYW1lcyBk
dWUKPiAgICB0byB0aGUgaW5hYmlsaXR5IHRvIHByb3Blcmx5IGRldGVybWluZSB0aGUgZGVzdGlu
YXRpb24gKHN0YXRpb24pIE1BQwo+ICAgIGFkZHJlc3Mgc2luY2UgaWVlZTgwMjExX3R4X3N0YXR1
cygpIGFzc3VtZXMgdGhlIGZyYW1lIGhhcyBhIDgwMi4xMQo+ICAgIGhlYWRlci4KPiAKPiBUaGUg
bGF0dGVyIGlzIGVzcGVjaWFsbHkgZGVzdHJ1Y3RpdmUgaWYgd2Ugd2FudCB0byB1c2UgaGFyZHdh
cmUgZnJhbWVzCj4gZW5jYXBzdWxhdGlvbi4KPiAKPiBUbyBmaXggYm90aCBvZiB0aGVzZSBpc3N1
ZXMsIHJlcGxhY2UgaWVlZTgwMjExX3R4X3N0YXR1cygpIHdpdGgKPiBpZWVlODAyMTFfdHhfc3Rh
dHVzX2V4dCgpIGNhbGwgYW5kIGZlZWQgaXQgc3RhdGlvbiBwb2ludGVyIGZyb20gdGhlIHR4Cj4g
cXVldWUgYXNzb2NpYXRlZCB3aXRoIHRoZSB0cmFuc21pdHRlZCBmcmFtZS4KPiAKPiBUZXN0ZWQt
b246IFFDQTk4ODggaHcyLjAgUENJIDEwLjQtMy45LjAuMi0wMDEzMQo+IFRlc3RlZC1vbjogUUNB
NjE3NCBodzMuMiBQQ0kgV0xBTi5STS40LjQuMS0wMDE1Ny1RQ0FSTVNXUFotMQo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFNlcmdleSBSeWF6YW5vdiA8cnlhemFub3Yucy5hQGdtYWlsLmNvbT4KPiBUZXN0
ZWQtYnk6IE9sZMWZaWNoIEplZGxpxI1rYSA8b2xkaXVtLnByb0BnbWFpbC5jb20+ICMgVFAtTGlu
ayBBcmNoZXIgQzcgdjQgJiB2NSAoUUNBOTU2MyArIFFDQTk4ODApCj4gVGVzdGVkLWJ5OiBFZHdh
cmQgTWF0aWpldmljIDxtb3RvbGF2QGdtYWlsLmNvbT4gIyBUUC1MaW5rIEFyY2hlciBDMjYwMCAo
SVBRODA2NCArIFFDQTk5ODAgMTAuNC4xLjAwMDMwLTEpCj4gVGVzdGVkLWJ5OiBFZHdhcmQgTWF0
aWpldmljIDxtb3RvbGF2QGdtYWlsLmNvbT4gIyBRQ0E5Mzc3IFBDSSBpbiBTdGEgbW9kZQo+IFRl
c3RlZC1ieTogWmhpanVuIFlvdSA8aHVqeTY1MkBnbWFpbC5jb20+ICMgTkVUR0VBUiBSNzgwMCAo
UUNBOTk4NCAxMC40LTMuOS4wLjItMDAxNTkpCj4gU2lnbmVkLW9mZi1ieTogS2FsbGUgVmFsbyA8
cXVpY19rdmFsb0BxdWljaW5jLmNvbT4KCjQgcGF0Y2hlcyBhcHBsaWVkIHRvIGF0aC1uZXh0IGJy
YW5jaCBvZiBhdGguZ2l0LCB0aGFua3MuCgoyNTg3ZDUxOThhYTUgYXRoMTBrOiBpbXByb3ZlIHR4
IHN0YXR1cyByZXBvcnRpbmcKNzBmMTE5ZmI4MmFmIGF0aDEwazogaHR0X3R4OiBkbyBub3QgaW50
ZXJwcmV0IEV0aCBmcmFtZXMgYXMgV2lGaQphMDk3NDA1NDgyNzUgYXRoMTBrOiB0dXJuIHJhd21v
ZGUgaW50byBmcmFtZV9tb2RlCmFmNmQ4MjY1YzQ3ZSBhdGgxMGs6IGFkZCBlbmNhcHN1bGF0aW9u
IG9mZmxvYWRpbmcgc3VwcG9ydAoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJv
amVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8yMDIyMDUxNjAzMjUxOS4yOTgzMS0yLXJ5YXphbm92
LnMuYUBnbWFpbC5jb20vCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZl
bG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==

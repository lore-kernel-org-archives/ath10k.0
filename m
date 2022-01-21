Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAE5C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYx3Lo6eT9Bf4feGYzLmadK9vwNSaJr4POfPvvfhlK4=; b=ThssfWYKud6aWP
	+shINe7H3+wYVyUMytKACG42KkcXFqjxClks7qAWMnyd/2ohCNzyh3KDDAaLbTOFNjRure5y8dcLg
	jlBEYCEv1IEZ82UYwb53vZlihQdFGDVV3sVQRqHHjj+LBf4Mjna0tpFgv+0cKFWN7Q7n3/Yw2Z8FI
	OlaMAU/lHsFHO1I02+z95YDVMkPr8BfIKvVeba+k3oyfyZvxADkd7YjY0AwPWBgaW5AkKCjTJ5Ffx
	sA8MxfbYdVwKTPwgWZL+UD+FJdgWss1yPERIE21wdRpUZsUa89hCDGve2bWq6sqdsoWFGQ5+qrEzk
	A/SPTJGCxrvbHVq8rhSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtzw-00FAzb-Fi; Fri, 21 Jan 2022 13:30:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtzs-00FAxV-1I
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:30:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9798961381;
 Fri, 21 Jan 2022 13:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7414BC340E1;
 Fri, 21 Jan 2022 13:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642771831;
 bh=Q/SKCsod4h4xVqdizz03wo7+TbmMg+odH/IqJRBZjts=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=gePXO4WtKebXC4zYGtARe6cKrFQ/+UVquRnF0T0CEruWGgI6arJfyYk2lc7xJhCIm
 Zbu2EP97PolorgvFwkQbVmGysGxQUoOTSmV/VvBuWwaHdWjmxJxz8m58EjVcMO5c7K
 izKZfqr+lrI8SAMNLf21ZrMKNqt155UcWHcwlXKinG0DDB58KQSdRa/QmOI2/OeXtb
 4xfaZNtVbS30C/CmjZT1XNFj/nCHOar02ojebLkrwvwzesQrcNP87l8htWlaarud37
 ER3K5dJta/kSWheqU2ygZxbRX7x8JnAZTQddKuAuuOLfcrNVIrUia4PEnAIl1pn0ct
 m1jRNxbtA/c3g==
From: Kalle Valo <kvalo@kernel.org>
To: Tom Brouwer <tombrouwer@outlook.com>
Cc: "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add EZVIZ CS-W3-WD1200G EUP
 specific BDFs
References: <AM0PR09MB40176DDC8DF00113FC4BEC72C03A0@AM0PR09MB4017.eurprd09.prod.outlook.com>
Date: Fri, 21 Jan 2022 15:30:25 +0200
In-Reply-To: <AM0PR09MB40176DDC8DF00113FC4BEC72C03A0@AM0PR09MB4017.eurprd09.prod.outlook.com>
 (Tom Brouwer's message of "Sun, 12 Jan 2020 11:39:25 +0000")
Message-ID: <87mtjpdxn2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_053032_161889_8AFF7ABB 
X-CRM114-Status: GOOD (  15.89  )
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

VG9tIEJyb3V3ZXIgPHRvbWJyb3V3ZXJAb3V0bG9vay5jb20+IHdyaXRlczoKCj4gQ3VycmVudGx5
IHRoaXMgZGV2aWNlIGlzIGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nIGFkZGVkIHRvIE9wZW5XUlQg
KFNlZQo+IHB1bGwgcmVxdWVzdCBoZXJlOiBodHRwczovL2dpdGh1Yi5jb20vb3BlbndydC9vcGVu
d3J0L3B1bGwvMjY3MSkuIFRoZQo+IFdpRmkgd29uJ3QgZnVuY3Rpb24gcHJvcGVybHkgd2l0aG91
dCB0aGUgYm9hcmQgZmlsZXMgZnJvbSB0aGUgRmFjdG9yeQo+IEZpcm13YXJlLgo+Cj4gVG8gYW5z
d2VyIHRoZSBxdWVzdGlvbnMgb24gdGhlIHdpa2kgcGFnZToKPgo+ICogZGVzY3JpcHRpb24gZm9y
IHdoYXQgaGFyZHdhcmUgdGhpcyBpczoKPgo+IMKgIC0gaXQgaXMgYSBRQ0E0MDF4IGJhc2VkIGJv
YXJkIChmYWN0b3J5IGZpcm13YXJlIHNlZW1zIHRvIGluaWRpY2F0ZQo+IHFjb20taXBxNDB4eC1h
cC5kazAxLjEpCj4gwqAgLSBvbmUgUUNBNDB4eCByYWRpbyBpcyB1c2VkIGFzIDIuNEdIeiByYWRp
bwo+IMKgIC0gb25lIFFDQTQweHggcmFkaW8gaXMgdXNlZCBhcyA1R0h6IHJhZGlvCj4KPiAqIG9y
aWdpbiBvZiB0aGUgYm9hcmQgZmlsZSAoZGlkIHlvdSBjcmVhdGUgaXQgeW91cnNlbGYgb3Igd2hl
cmUgeW91wqAgZG93bmxvYWRlZCkKPgo+IMKgIC0gRXh0cmFjdGVkIGZyb20gZmFjdG9yeSBmaXJt
d2FyZQo+Cj4gKiBpZHMgdG8gYmUgdXNlZCB3aXRoIHRoZSBib2FyZCBmaWxlIChBVEgxMEtfQkRf
SUVfQk9BUkRfTkFNRSBpbiBhdGgxMGspCj4KPiDCoCAtIFFDQTQwMTkgaHcxLjAKPgo+IMKgIMKg
ICsgYnVzPWFoYixibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0yMCx2YXJpYW50PWV6dml6LWNz
LXczLXdkMTIwMGctZXVwCj4gwqAgwqAgwqAgc2hhMjU2c3VtOiBjMDE3OWRhYjNlMWViMmM2Yzc3
N2FiNTI0ZGNmYjNmMDMyYmI1ZjE1MmVhYjAzYWEwZDQzZjM2Yjc2MjZjMTZiCj4gwqAgwqAgwqAg
bWQ1c3VtOsKgYWE3NjcwMjcwNGQwOTg5Nzk0ZTJkZjg2Zjg5NGZiZjgKPiDCoCDCoCArIGJ1cz1h
aGIsYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MjEsdmFyaWFudD1lenZpei1jcy13My13ZDEy
MDBnLWV1cAo+IMKgIMKgIMKgIHNoYTI1NnN1bTogYmUyZjAwYzkyMDVhMzNjODMxNDM2MWVmNjlm
MWJiMDhlNjlmMmU1MTk3NmExODc2ZDQ2YzJlMTAwZjczZDg0Ygo+IMKgIMKgIMKgIG1kNXN1bTrC
oDExNzdkNjk5OTY2MTRkZDhmM2I3NTk5MzAzMjcwMmE0Cj4KPiAqIGF0dGFjaCB0aGUgYWN0dWFs
IGJvYXJkIGZpbGUgKGJvYXJkLmJpbikKPgo+IMKgIC0gVGhlIG5hbWUgb2YgdGhlIGZpbGVzIGFy
ZSBlcXVhbCB0byB0aGUgaWQgc3RyaW5nIGluIHRoZSBib2FyZC0yLmJpbgo+IMKgIMKgIChtaW51
cyB0aGUgIi5iaW4iKQoKVGhhbmtzLCBhZGRlZCB0byBRQ0E0MDE5L2h3MS4wL2JvYXJkLTIuYmlu
OgoKTmV3OgpidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTIxLHZhcmlhbnQ9ZXp2
aXotY3MtdzMtd2QxMjAwZy1ldXAKYnVzPWFoYixibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0y
MCx2YXJpYW50PWV6dml6LWNzLXczLXdkMTIwMGctZXVwCgpDaGFuZ2VkOgoKCkRlbGV0ZWQ6Cgoy
IGJvYXJkIGltYWdlKHMpIGFkZGVkLCAwIGNoYW5nZWQsIDAgZGVsZXRlZCwgNjggaW4gdG90YWwK
Cmh0dHBzOi8vZ2l0aHViLmNvbS9rdmFsby9hdGgxMGstZmlybXdhcmUvY29tbWl0L2MwN2IxMmEy
ZjZlYTJlZmRlYmE1NWFhMWE3YzYzYjgyOTVhZGE1ODEKCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNz
Lndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3Bh
dGNoZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

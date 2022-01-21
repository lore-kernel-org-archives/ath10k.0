Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D71DC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 15:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqHsCN/Ip62wdrBNCMWgmiwlHNZndc0PWpDPmjA3fWY=; b=MmD4aT1AJcKRLn
	BXFLeywjZtsdXlYtzYDAT/7HXAAPu3OefK4oamnfHAgMtPRDNRy1aRlW5mx3J7Kxt0ycY6wsOZRns
	oH6t8CmHpRa78DCRXHdvTCb+eTZ0stThIEt22P7yQUFtUNAEXK1UKFL42r8l4VQiYxyF9u/vBEWFd
	Xql5ccaOwFxgc6iMNTmZF8FDJ3Bh2xWMOcBlYz7aFZQqJHpcNWPhJfaxEufPxOmKA+WtTAz0ZW65y
	Uh/gnpFZL6QBBA6xbwYMSSUrgg9e+Uj6g6BUhFNgFeK7qcnlEXs6uPZAr62b9RhqiBrSwt3E3lMSY
	PRDu9WNQ+fotBmwSCQhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAvWP-00FSiH-ON; Fri, 21 Jan 2022 15:08:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAvWM-00FShx-LA
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 15:08:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C7A9B81FB0;
 Fri, 21 Jan 2022 15:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F69C340E1;
 Fri, 21 Jan 2022 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642777688;
 bh=GSfF6uaMiUxigvNoftTbTSpLJnQiUQSnAugVnPbGTAg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=UpAfAHt+hZNa56KDcFs4wNKaVPH2SiSWgW847SF2DjR8QlXRF/CPjkNvkppypVzmQ
 niAOH8IlPxJUPa48miXs7jRUgieNOzGycXfciRNSWlvKaoiVhcfIBzyCreXR6eFo40
 ZTVzZcNkhewVpvY/32Buxi63GdNEUYKcN5zF2r0IIi9HNvJXBUWaeLTBDQESz9ULad
 dhZHpFjlmo7BNh6/khbV31McWR8SJt9hrINWBHBLSltOb2jD5GoWj4qicn4/tF0+j1
 2rdLtH6zLhCh6qtQy0AK2yw5cUnmd3XqlSC+o46DJAwO2HyvUB43jdqg5c/8ShgTbF
 DseOoPiiQVBhg==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?B?5byg6bmP?= <1805692831@qq.com>
Cc: "ath10k" <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Qxwlan E2600AC specific BDFs
References: <tencent_C8E8FE1611319ED9CB77CAEDB58084D13709@qq.com>
Date: Fri, 21 Jan 2022 17:08:04 +0200
In-Reply-To: <tencent_C8E8FE1611319ED9CB77CAEDB58084D13709@qq.com>
 (=?utf-8?B?IuW8oOm5jyIncw==?=
 message of "Fri, 5 Jul 2019 14:55:04 +0800")
Message-ID: <87tudx86uj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_070810_870076_F1E25503 
X-CRM114-Status: GOOD (  16.72  )
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

IuW8oOm5jyIgPDE4MDU2OTI4MzFAcXEuY29tPiB3cml0ZXM6Cgo+IEhpLAo+ICAgICBPdXIgbW90
aGVyYm9hcmQgaGFzIGJlZW4gbW9kaWZpZWQgb25jZSwgYW5kIHRoZSBsYXRlc3QgYmFvcmQgZmls
ZSBpcyBhdHRhY2hlZC4KPgo+Cj4KPiBGb3IgdGhlIHF1ZXN0aW9ucyBmcm9tIHRoZSB3aWtpIHBh
Z2U6Cj4KPiAqIGRlc2NyaXB0aW9uIGZvciB3aGF0IGhhcmR3YXJlIHRoaXMgaXM6Cj4KPiAgIC0g
aXQgaXMgYSBJUFE0MDE4IGJhc2VkIGJvYXJkIChBUC1ESzA3LUMxKQo+ICAgLSBvbmUgUUNBNDB4
eCByYWRpbyBpcyB1c2VkIGFzIDIuNC81IEdIeiByYWRpbwo+ICAgLSBvbmUgUUNBNDB4eCByYWRp
byBpcyB1c2VkIGFzIDVHSHogcmFkaW8KPgo+ICogb3JpZ2luIG9mIHRoZSBib2FyZCBmaWxlIChk
aWQgeW91IGNyZWF0ZSBpdCB5b3Vyc2VsZiBvciB3aGVyZSB5b3UKPiAgIGRvd25sb2FkZWQpCj4K
PiAgIC0gVGhlIGJvYXJkIGZpbGUocykgd2hlcmUgZXh0cmFjdGVkIGZyb20gdGhlIFF4d2xhbiBm
aXJtd2FyZS4gCj4gICAtIFRoZSBmaWxlcyBpbiB0aGlzIGVtYWlsIGFyZToKPiAgICAgKiBib2Fy
ZF93aWZpMF8yZy5iaW4KPiAgICAgKiBib2FyZF93aWZpMF81Zy5iaW4KPiAgICAgKiBib2FyZF93
aWZpMV81Zy5iaW4KPgo+ICogaWRzIHRvIGJlIHVzZWQgd2l0aCB0aGUgYm9hcmQgZmlsZSAoQVRI
MTBLX0JEX0lFX0JPQVJEX05BTUUgaW4gYXRoMTBrKQo+Cj4gICAtIFFDQTQwMTkgaHcxLjAKPgo+
ICAgICArIGJ1cz1haGIsYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MjgsdmFyaWFudD1ReHds
YW4tRTI2MDBBQwo+ICAgICAgIHNoYTI1NnN1bToKPiAgICAgICA0YjUyZGIyZmI3ZTcyMmMxNmQ0
ODhkYzdjZjYyZWNjNTIzNzExNjRlOWNiNjE2YjBiNjgyODE5MTNlZmJhMDU5Cj4gICAgICsgYnVz
PWFoYixibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0yOSx2YXJpYW50PVF4d2xhbi1FMjYwMEFD
Cj4gICAgICAgc2hhMjU2c3VtOgo+ICAgICAgIDM4M2IxNjU2ZWZlNzEwYTM1ZDAxMzAyMTM1ZDMy
MzEzNjc4ZWMzZmNjYWRhZGI4MzdjMjNmYThkOWM5NTZiOWIKPiAgICAgKyBidXM9YWhiLGJtaS1j
aGlwLWlkPTAsYm1pLWJvYXJkLWlkPTMwLHZhcmlhbnQ9UXh3bGFuLUUyNjAwQUMKPiAgICAgICBz
aGEyNTZzdW06Cj4gICAgICAgYjNlMjkxZjlkZDI0NmQwM2MxMTRhYWQ4MDdkMjQyZGFmYWU3MjY5
M2VhYzAwOTA1NWFhZmU2NGEyOWYwNTY2MAo+Cj4gKiBhdHRhY2ggdGhlIGFjdHVhbCBib2FyZCBm
aWxlIChib2FyZC5iaW4pCj4KPiAgIC0gVGhlIG5hbWUgb2YgdGhlIGZpbGVzIGFyZSBlcXVhbCB0
byB0aGUgaWQgc3RyaW5nIGluIHRoZSBib2FyZC0yLmJpbgo+ICAgICAobWludXMgdGhlICIuYmlu
IikKClsyLiBhcHBsaWNhdGlvbi9vY3RldC1zdHJlYW07IGJvYXJkX3dpZmkwXzJnLmJpbl0uLi4K
ClszLiBhcHBsaWNhdGlvbi9vY3RldC1zdHJlYW07IGJvYXJkX3dpZmkwXzVnLmJpbl0uLi4KCls0
LiBhcHBsaWNhdGlvbi9vY3RldC1zdHJlYW07IGJvYXJkX3dpZmkxXzVnLmJpbl0uLi4KClRoZSBh
dHRhY2hlZCBmaWxlbmFtZXMgaGF2ZSB3cm9uZyBuYW1lcyB3aGljaCB3aWxsIGJyZWFrIG15IHNj
cmlwdC4gVGhleQpzaG91bGQgdXNlIHRoZSBleGFjdCBpZCB0byBiZSB1c2VkIHdpdGhpbiBib2Fy
ZC0yLmJpbiAocGx1cyAuYmluIGluIHRoZQplbmQpLCBmb3IgZXhhbXBsZQoiYnVzPWFoYixibWkt
Y2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0yMCx2YXJpYW50PU9NLUE2Mi5iaW4iLgoKTW9yZSBpbmZv
IGluIHRoZSB3aWtpOgoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vdXNlcnMv
ZHJpdmVycy9hdGgxMGsvYm9hcmRmaWxlcwoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtl
cm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

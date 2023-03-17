Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0DCC7618B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y//uez7LLZB/q7hsaVxEXDzSjCd9gEYbpVSf9azKmhY=; b=gI0mxRMvvTolou
	Pkd6F3GEpJ0Ic1QbdEolQI5vAePjvn6O4MFWKUomo3zeRpAmNMUJM850gnrBdSnZy1whHwDfcWRmy
	9qaOWtiNp8ovOxdo4sNphuiuOrRQisD8YoMIpP5zrD2oxjNN82uVZloBIiDpE6nGiVarEh6slIUeU
	2InDI4+61BzPdxAj2S/6Sqa3/dIT320GC34Iba51KQDtG7kH+iqE93J2NDSN1DCxDHm3zGgvfaLoj
	GxpRbwzl1bgflhAE0crh7w5JOfIWng3riZ3AefZht/FwAP/9hUzxSnlNUz4kB02Qm9+FQBCSLQI9H
	fVl0plNgq9sNe+3UQ6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8LI-0024OR-09;
	Fri, 17 Mar 2023 11:33:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8LB-0024Mx-1R
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:33:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 02CAAB825A1;
	Fri, 17 Mar 2023 11:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09727C433D2;
	Fri, 17 Mar 2023 11:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679052822;
	bh=RGPvAtBuZeTyFDv6lRZ4aYHOQffz4llvFqhrpleC98Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bebwvF4XmA2W8reNU9fjN6iSHguNycil0kuJTLlY7598UypM9OgLZnDhzmfr/ejll
	 TuJUj1/ElDWMTIZtgzp6j/dzvkG8CUFjVXGAcUvw33D1H5WnRw2EiPTKX1bYDmxCgg
	 vyqL9j3Azgl7wiV61L56jVtzlcNW0mVbCBwbw8aXhgRnJAjT23X9Wi9dS99oCe2JW3
	 1LFuloGOCYtxhsXr9B1+RqqqvDTzegVWM1tJpUO+MpTj3r2YQ0UleNNbsOldi1YVPs
	 olatOpQmVQ0PWTUIDAgBZCLpuC9ltAnF3CMT6gwW2Ou1HLbTpxoy0UJvYAz3Avv7Ww
	 gJI6O9scyZEeg==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>,  =?utf-8?B?5byg6bmP?=
 <1805692831@qq.com>
Subject: Re: [V2] ath10k-firmware: QCA4019 hw1.0: Update Qxwlan E2600AC c2 specific BDFs
References: <028d7d59-7b00-225b-6a53-87e67047bf23@gmail.com>
Date: Fri, 17 Mar 2023 13:33:40 +0200
In-Reply-To: <028d7d59-7b00-225b-6a53-87e67047bf23@gmail.com> (Christian
	Lamparter's message of "Fri, 1 Jul 2022 13:25:08 +0200")
Message-ID: <87o7orlii3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043345_631925_DAA3B506 
X-CRM114-Status: GOOD (  13.11  )
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

Q2hyaXN0aWFuIExhbXBhcnRlciA8Y2h1bmtlZXlAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEZyb206
IOW8oOm5jyA8MTgwNTY5MjgzMUBxcS5jb20+Cj4KPiBNb2RpZmllZCB0aGUgcmFkaW8gZnJlcXVl
bmN5IGhhcmR3YXJlIHBhcnQgb2YgZTI2MDBhYyBjMiwKPiBuZWVkIHRvIGNvb3BlcmF0ZSB3aXRo
IHRoZSBtb2RpZmllZCBib2FyZC5iaW4gZmlsZS4KPgo+IEZvciB0aGUgcXVlc3Rpb25zIGZyb20g
dGhlIHdpa2kgcGFnZToKPgo+ICogZGVzY3JpcHRpb24gZm9yIHdoYXQgaGFyZHdhcmUgdGhpcyBp
czoKPgo+ICAgICAgaXQgaXMgYSBJUFE0MDE5IGJhc2VkIGJvYXJkIChBUC1ESzA0IGFuZCBBUC1E
SzA3KQo+ICAgICAgLSBvbmUgUUNBNDB4eCByYWRpbyBpcyB1c2VkIGFzIDIuNCBHSHogcmFkaW8K
PiAgICAgIC0gb25lIFFDQTQweHggcmFkaW8gaXMgdXNlZCBhcyA1IEdIeiByYWRpbwo+ICAgICAg
LSBvbmUgUUNBNDB4eCByYWRpbyBpcyB1c2VkIGFzIDUgR0h6IHJhZGlvCj4KPiAqIG9yaWdpbiBv
ZiB0aGUgYm9hcmQgZmlsZSAoZGlkIHlvdSBjcmVhdGUgaXQgeW91cnNlbGYgb3Igd2hlcmUgeW91
IGRvd25sb2FkZWQpCj4KPiAgICAgIFRoZSBib2FyZCBmaWxlKHMpIHdoZXJlIGV4dHJhY3RlZCBm
cm9tIHRoZSBReHdsYW4gZmlybXdhcmUuCj4KPiAqIGlkcyB0byBiZSB1c2VkIHdpdGggdGhlIGJv
YXJkIGZpbGUgKEFUSDEwS19CRF9JRV9CT0FSRF9OQU1FIGluIGF0aDEwaykKPgo+ICAgIFFDQTQw
MTkgaHcxLjA6Cj4KPiAgICAgICAtIGJ1cz1haGIsYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9
MjAsdmFyaWFudD1ReHdsYW4tRTI2MDBBQy1DMgo+ICAgICAgICAgbWQ1c3VtOiBmZDg0N2FiOTQ2
YTY0ZjJmNzZkMTY5MGNiOWM4MjA5YQo+ICAgICAgIC0gYnVzPWFoYixibWktY2hpcC1pZD0wLGJt
aS1ib2FyZC1pZD0yMSx2YXJpYW50PVF4d2xhbi1FMjYwMEFDLUMyCj4gICAgICAgICBtZDVzdW06
IDE5NjE0YWM1ZWY5MTM5ZmQxYjNlMjcxNTRhMTg2ZmQ4Cj4gICAgICAgLSBidXM9YWhiLGJtaS1j
aGlwLWlkPTAsYm1pLWJvYXJkLWlkPTI5LHZhcmlhbnQ9UXh3bGFuLUUyNjAwQUMtQzIKPiAgICAg
ICAgIG1kNXN1bTogM2RiOTk2Mjk0NDJlN2M3MTRmNDAyMzYzNDAwM2I1YzIKClRoYW5rcywgYWRk
ZWQgdG8gUUNBNDAxOS9odzEuMC9ib2FyZC0yLmJpbjoKCk5ldzoKYnVzPWFoYixibWktY2hpcC1p
ZD0wLGJtaS1ib2FyZC1pZD0yMCx2YXJpYW50PVF4d2xhbi1FMjYwMEFDLUMyCmJ1cz1haGIsYm1p
LWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MjEsdmFyaWFudD1ReHdsYW4tRTI2MDBBQy1DMgpidXM9
YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTI5LHZhcmlhbnQ9UXh3bGFuLUUyNjAwQUMt
QzIKCkNoYW5nZWQ6CgoKRGVsZXRlZDoKCjMgYm9hcmQgaW1hZ2UocykgYWRkZWQsIDAgY2hhbmdl
ZCwgMCBkZWxldGVkLCAxMDYgaW4gdG90YWwKCmh0dHBzOi8vZ2l0aHViLmNvbS9rdmFsby9hdGgx
MGstZmlybXdhcmUvY29tbWl0L2ZiODE3ZmZkODA3YzEyMmYxNzBkM2RhMWMxN2MzOWRmNjFhNmFk
NjEKCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxl
c3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMv
ZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEwawo=

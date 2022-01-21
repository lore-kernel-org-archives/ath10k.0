Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7480DC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpJ5WIm8BobKHOH02X8uwMImDll68cNx0lebB5EhA80=; b=XYyqIFAiDvgC5m
	TURugRuXnkfmU1HQB5R8Dqql5xhMCmCKsZ51oD8QyXthnNHacNmxU1VGpHxsEI6twgF9oL27x5VGP
	Xkj4jXQ4RFR3u2MRXXHuiY42gqCm6D4igJvmFdxUXANwBS6VEoMOL0monrn0XHUrLliMPF2RqK7t7
	ocumfFhmcqT89+4MknEpBJBlegtXxg3fGqoBaS1AS4dZiN16m0oG7t32aMJVkIK4oSDfQ0Ao2ZunS
	UMrYZrdQFKRTKcnkb2J1i2euS7Eij+ZUBRf5FffCnPNVn94KvImpvHWu0LzaExUTvHKyng049kIuv
	wkBsSQ06S3n9klWcmwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtn1-00F4x1-Nz; Fri, 21 Jan 2022 13:17:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtm4-00F4TG-59
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:16:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C619FB81FAD;
 Fri, 21 Jan 2022 13:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF594C340E1;
 Fri, 21 Jan 2022 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642770973;
 bh=K616SJ/6JbHccFkx882PUIgV1Y8eW1PXooaZJBirip0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=e3ZMfQ/6hCK5+Pyjq+O/NISe/RjoujOTAhAKHt2pYsBLcNcigwOoFkaIHEAmPHlXd
 XSG3paPRyyjcf72UWG94Nhn360m4Zqe8snS0qc9cZQ2o+fDqYyK30P+0OgxuMCCERp
 sf4pz0ApKbpEzVEDBWqmQjklCc8Rkw/GmzzoT2pd2T2iJY6kAwZ/pwXb0wmoDEAUTF
 XW1WUolPU0qdG3CkX3SwVU+RlMA33bBHrRlmUolDJypNVEJvmolKfFB56sogbr1lMg
 JEiFbSiTZkIOtGxXVs/coE+HTaUiHYRRmvxnMEloMH/QSnJgWNLsmPujlEB83pp8Xx
 as6M7xqd3x8AQ==
From: Kalle Valo <kvalo@kernel.org>
To: <steven.lin@senao.com>
Cc: <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add EnGenius EAP2200 specific BDFs
References: <77B9977A4169C341AD4CDD465CB1B812BC44E4D9@snex01.senao.com>
Date: Fri, 21 Jan 2022 15:16:10 +0200
In-Reply-To: <77B9977A4169C341AD4CDD465CB1B812BC44E4D9@snex01.senao.com>
 (steven lin's message of "Mon, 2 Sep 2019 08:55:16 +0000")
Message-ID: <87pmolfcv9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_051616_387013_1B1D9F03 
X-CRM114-Status: GOOD (  17.02  )
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

PHN0ZXZlbi5saW5Ac2VuYW8uY29tPiB3cml0ZXM6Cgo+IEhpLAo+Cj4gVGhlIHN1cHBvcnQgZm9y
IHRoaXMgZGV2aWNlIHdhcyBhZGRlZCBhIHdoaWxlIGFnbyB0byBPcGVuV3J0LiBUaGlzIEFQCj4g
cmVxdWlyZXMgdHdvIHNwZWNpYWwgQkRGcyB0byBnZXQgdGhlIFdpLUZpIFBIWXMgd29ya2luZyAo
Y29ycmVjdGx5KS4KPiBUaGUgYm1pLWJvYXJkLWlkPSdzIHdvdWxkIGNsYXNoIHdpdGggb25lIG9m
IHRoZSB0aGUgSVBRNDAxWCBBUC1ESwo+IGJvYXJkcyBiZWNhdXNlIFFDQSBkb2Vzbid0IHByb3Zp
ZGUgc3BlY2lhbCBJRHMgZm9yIGN1c3RvbWVycyBhbmQgc2VlbXMKPiB0byB1c2UgdGhlIEFQLURL
IGJvYXJkLWlkcyBpbiB0aGUgd2lmaSBmaXJtd2FyZSB0byBjaGFuZ2UgaXRzCj4gYmVoYXZpb3Iu
Cj4KPiBOb3cgdG8gdGhlIHF1ZXN0aW9ucyBmcm9tIHRoZSB3aWtpIHBhZ2UgWzFdOgo+Cj4gKu+B
rAlkZXNjcmlwdGlvbiBmb3Igd2hhdCBoYXJkd2FyZSB0aGlzIGlzOgo+IC0JaXQgaXMgYSBJUFE0
MDE5IGJhc2VkIGJvYXJkCj4gLQlvbmUgUUNBNDAxOSByYWRpbyBpcyB1c2VkIGFzIDIuNEdIeiBy
YWRpbwo+IC0Jb25lIFFDQTQwMTkgcmFkaW8gaXMgdXNlZCBhcyA1R0h6IHJhZGlvCj4gLQlvbmUg
UUNBOTg4OCByYWRpbyBpcyB1c2VkIGFzIDVHSHogcmFkaW8KPgo+ICoJb3JpZ2luIG9mIHRoZSBi
b2FyZCBmaWxlIChkaWQgeW91IGNyZWF0ZSBpdCB5b3Vyc2VsZiBvciB3aGVyZSB5b3UgZG93bmxv
YWRlZCkKPiAtCXRha2VuIGZyb20gc3RvY2sgZmlybXdhcmUgaW1hZ2UKPgo+ICrvgawJaWRzIHRv
IGJlIHVzZWQgd2l0aCB0aGUgYm9hcmQgZmlsZSAoQVRIMTBLX0JEX0lFX0JPQVJEX05BTUUgaW4g
YXRoMTBrKQo+IC0JIFFDQTQwMTkgaHcxLjAKPgo+IG1kNXN1bSBvZiBlYWNoIG5ldyBib2FyZCBm
aWxlIHRvIGFkZAo+Cj4gKyBidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTIwLHZh
cmlhbnQ9RW5HZW5pdXMtRUFQMjIwMAo+IG1kNXN1bTogZTc2MTBkODY2ZTMyYjlhNDBlNWI3NWQ4
ODVjYzIyYTAKPiArIGJ1cz1haGIsYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MjEsdmFyaWFu
dD1Fbkdlbml1cy1FQVAyMjAwCj4gbWQ1c3VtOiA1YzM2OThiYTU1OTY1ZGYwZGQ4YmJkY2E3NzA2
ZWI1ZAoKVGhhbmtzLCBhZGRlZCB0byBRQ0E0MDE5L2h3MS4wL2JvYXJkLTIuYmluOgoKTmV3Ogpi
dXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTIwLHZhcmlhbnQ9RW5HZW5pdXMtRUFQ
MjIwMApidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTIxLHZhcmlhbnQ9RW5HZW5p
dXMtRUFQMjIwMAoKQ2hhbmdlZDoKCgpEZWxldGVkOgoKMiBib2FyZCBpbWFnZShzKSBhZGRlZCwg
MCBjaGFuZ2VkLCAwIGRlbGV0ZWQsIDUyIGluIHRvdGFsCgpodHRwczovL2dpdGh1Yi5jb20va3Zh
bG8vYXRoMTBrLWZpcm13YXJlL2NvbW1pdC8zOGViYjJkMjRlMWY1YjdhZmE4YTUzZWFmM2M5NWQ5
YjQ2YjZiM2FlCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZl
bG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK

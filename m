Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53CAC433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1V9/UNjaMgQXV/P/L6DUd7sTCdxnU/XjDUtCdgVtj0o=; b=ziKybA/TdHU2ob
	WjQVa8oeGxI8bFCW20XZhodYoIwrQ9YMjcPFsYIv6nI8sXt7ZKXv/ke6wFVLl4PO82q0dfVMoSEzE
	CNuc6khRZnqrETsnb5b1kiS+wTNtX6N/ap4FNWQA1Qu/WQkS1j48dzW+ATzKrq7LchBfmPRTL6ojE
	t3mo48yXaTeeRxyUOms+uF86sx+sXjqgcGP55fgFPZ91h4AIGCWvEevrNF7f7nFtWh4s01K1Vm9GI
	XMaCS1RS/EKI4YuEuMl4tUzu72ik4hqmKlX9oEPPvzKAUSrc5+hkdZYj0QkXWRp11glacquvZDaHY
	huO039qeKTc6rQM3QmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAu1D-00FBSA-3t; Fri, 21 Jan 2022 13:31:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAu18-00FBQ9-Cl
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:31:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08059B81FAC;
 Fri, 21 Jan 2022 13:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D626C340E1;
 Fri, 21 Jan 2022 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642771907;
 bh=rpj2yVqCCK4qdVJe1rN0SwFZgIoipXBDd/GcgiEGgdw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=eS9uydKu6+jWSmYfxBCyrCHg+cOEQyEdKsIs4Vn+7Menribf+UIdWTuIxzwox5K5F
 yn7+AmvGdgfQKtP0w9hsaPNBNkDUFu2I9Hs9dv1m5vmhsr8khSBpFaErMfl5elHxQ6
 lxIxzmI7/vbksP3gceCQuc1AE/e6wEi2cWYMus2MMnsDOgJewQGWI0HwcLt0m/RXxB
 Tkm0dYsp9tgyOKId6N/ymkp8PR9ZnMsF5LJy4CWE5B8EJRVGve83N8nD1GbFuXWitZ
 yrSORrDUDWlZBEyGZM7L21rixmg8bwBqBw1Y2oXsVTmJPom0EJc/ZSug1dp0Wx0d29
 0VFgSNeL3llvA==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?Pawe=C5=82?= Dembicki <paweldembicki@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Cell C RTL30VW specific BDF
References: <CAJN1Kkz5J+KJ-vjtX=Atvw91+H5VdPBQSCamwaQ+jTnkL+nEFA@mail.gmail.com>
Date: Fri, 21 Jan 2022 15:31:45 +0200
In-Reply-To: <CAJN1Kkz5J+KJ-vjtX=Atvw91+H5VdPBQSCamwaQ+jTnkL+nEFA@mail.gmail.com>
 (=?utf-8?Q?=22Pawe=C5=82?= Dembicki"'s message of "Sun, 22 Mar 2020
 23:06:17 +0100")
Message-ID: <87iluddxku.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_053150_600848_D34ACE2B 
X-CRM114-Status: GOOD (  15.12  )
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

UGF3ZcWCIERlbWJpY2tpIDxwYXdlbGRlbWJpY2tpQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBDdXJy
ZW50bHkgdGhpcyBkZXZpY2UgaXMgaW4gdGhlIHByb2Nlc3Mgb2YgYmVpbmcgYWRkZWQgdG8gT3Bl
bldSVAo+IChodHRwczovL2dpdGh1Yi5jb20vb3BlbndydC9vcGVud3J0L3B1bGwvMjg0MSkuCj4K
PiBUbyBhbnN3ZXIgdGhlIHF1ZXN0aW9ucyBvbiB0aGUgd2lraSBwYWdlOgo+Cj4gKiBkZXNjcmlw
dGlvbiBmb3Igd2hhdCBoYXJkd2FyZSB0aGlzIGlzOgo+Cj4gICAtIGl0IGlzIGEgUUNBNDAxeCBi
YXNlZCBib2FyZCAoQVAtREswMS4xLUMyIGJhc2VkKQo+ICAgLSBvbmUgUUNBNDB4eCByYWRpbyBp
cyB1c2VkIGFzIDIuNEdIeiByYWRpbwo+ICAgLSBvbmUgUUNBNDB4eCByYWRpbyBpcyB1c2VkIGFz
IDVHSHogcmFkaW8KPgo+ICogb3JpZ2luIG9mIHRoZSBib2FyZCBmaWxlIChkaWQgeW91IGNyZWF0
ZSBpdCB5b3Vyc2VsZiBvciB3aGVyZSB5b3UgIGRvd25sb2FkZWQpCj4KPiAgIC0gRXh0cmFjdGVk
IGZyb20gZmFjdG9yeSBmaXJtd2FyZQo+Cj4gKiBpZHMgdG8gYmUgdXNlZCB3aXRoIHRoZSBib2Fy
ZCBmaWxlIChBVEgxMEtfQkRfSUVfQk9BUkRfTkFNRSBpbiBhdGgxMGspCj4KPiAgIC0gUUNBNDAx
OSBodzEuMAo+Cj4gQm9hcmROYW1lczogJ2J1cz1haGIsYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQt
aWQ9MTYsdmFyaWFudD1jZWxsYyxydGwzMHZ3Jwo+IEJvYXJkTUQ1OiA1NGY3OGQ2MzQ4ZWJkZDE4
NTdiYTNkNDI0MDdiZDdlNAo+Cj4gTk9URToKPgo+ICJidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1p
LWJvYXJkLWlkPTE3LHZhcmlhbnQ9Y2VsbGMscnRsMzB2dyIgZmlsZQo+IGhhdmUgdGhlIHNhbWUg
bWQ1IHN1bSBhcwo+ICJidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTE3LHZhcmlh
bnQ9QVZNLUZSSVRaQm94LTQwNDAiLCBzbwo+IEkgZGlkbid0IHNlbmQgaXQuCj4KPiAqIGF0dGFj
aCB0aGUgYWN0dWFsIGJvYXJkIGZpbGUgKGJvYXJkLmJpbikKClRoYW5rcywgYWRkZWQgdG8gUUNB
NDAxOS9odzEuMC9ib2FyZC0yLmJpbjoKCk5ldzoKYnVzPWFoYixibWktY2hpcC1pZD0wLGJtaS1i
b2FyZC1pZD0xNix2YXJpYW50PWNlbGxjLHJ0bDMwdncKCkNoYW5nZWQ6CgoKRGVsZXRlZDoKCjEg
Ym9hcmQgaW1hZ2UocykgYWRkZWQsIDAgY2hhbmdlZCwgMCBkZWxldGVkLCA2OSBpbiB0b3RhbAoK
aHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDEway1maXJtd2FyZS9jb21taXQvMTVmMWJkZDM2
Zjk1NDIwNzlmYWZhYzFkZDJjNmM0ZjY5MzZkZmMyNgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53
aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRj
aGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgx
MGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

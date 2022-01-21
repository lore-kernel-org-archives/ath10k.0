Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E39DC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZJzAe7uuaGIPJgOjuxX1FUv+PgIHetF926m4nuhGAs=; b=TN8lFrKZX0v9ky
	1ewApMOBoLQbWArDHerE2qWRPfLWZSlTd4Vih6FzsCy7xEz12sR1/gJd5n7bZbPhlFKqfKBVXLe9d
	WD+Z5Otyix6bQA5dvSuWxvU7fB6pLy/Ktzt5x8Eb7SjKH8L1LY8tM7U/+BGbKUsVXkcKZI0dMu9oE
	yq26VoHJ4YYzE1aEp8dgcoUT7jygVt2Dc+1JxO9ftAN3Ne/j96mzP/P/7349IcT2n5fEFNi1p/5fP
	seD7930vcQdI+YSmgc5fd90BPyRE1i78oLJgOtkgxmFVbPpBMYxaRuPSbEPayYVfBN+93kY2ZGdSg
	IN5+5xoCSVgsWDVgwRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAu5G-00FCS8-Mm; Fri, 21 Jan 2022 13:36:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAu5D-00FCRa-Id
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:36:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A8B3B81FAC;
 Fri, 21 Jan 2022 13:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44119C340E1;
 Fri, 21 Jan 2022 13:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642772161;
 bh=3rfflvSXTLnsGz576Eg2TEsJm/38us/niLB43A9f4QI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=jzaCC3Z6LHOYbmStkU60OTrMz365w257dBda/96pZvoudR4TNK9T6YgJnj9LSh0Am
 KrNXip/nXiImPhkX4CKZcinGCNgG6UPZZv8gwTu4KRJy8ioL01QLatn6K4keS74g7O
 53npKQl+Bjw0rLLgucXxBFlKdrcPw+n3dYd3gpVU6J3GZwSBzgbx6fCCMMjO2eS9Pp
 ODpym+cP4DXGLGGYrm95zT+jY/wLuu+7YA65vue+d3UBy81drV52LjVNikdvjn68Br
 diePe+Ucb32iqOH1E6iEVH6K0k2Y+dDGnixyD2MyEymVqpJuEQtZ+RaXm06wNk5KcP
 6LCqP1fkDyu7w==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?Pawe=C5=82?= Dembicki <paweldembicki@gmail.com>
Cc: ath10k@lists.infradead.org,  Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [v2] ath10k-firmware: QCA4019 hw1.0: Add Cell C RTL30VW specific
 BDF
References: <CAJN1Kkwys-yynDaFAM_tQE-XSehcqoDaSVSCVEodWnRnSY5KmA@mail.gmail.com>
Date: Fri, 21 Jan 2022 15:35:58 +0200
In-Reply-To: <CAJN1Kkwys-yynDaFAM_tQE-XSehcqoDaSVSCVEodWnRnSY5KmA@mail.gmail.com>
 (=?utf-8?Q?=22Pawe=C5=82?= Dembicki"'s message of "Tue, 7 Apr 2020 21:19:39
 +0200")
Message-ID: <875yqddxdt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_053603_778864_5B5011F6 
X-CRM114-Status: GOOD (  15.84  )
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

UGF3ZcWCIERlbWJpY2tpIDxwYXdlbGRlbWJpY2tpQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBIaSwK
Pgo+IEN1cnJlbnRseSB0aGlzIGRldmljZSBpcyBpbiB0aGUgcHJvY2VzcyBvZiBiZWluZyBhZGRl
ZCB0byBPcGVuV1JUCj4gKGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVud3J0L29wZW53cnQvcHVsbC8y
ODQxKS4KPgo+IFRvIGFuc3dlciB0aGUgcXVlc3Rpb25zIG9uIHRoZSB3aWtpIHBhZ2U6Cj4KPiAq
IGRlc2NyaXB0aW9uIGZvciB3aGF0IGhhcmR3YXJlIHRoaXMgaXM6Cj4KPiAgIC0gaXQgaXMgYSBR
Q0E0MDF4IGJhc2VkIGJvYXJkIChBUC1ESzAxLjEtQzIgYmFzZWQpCj4gICAtIG9uZSBRQ0E0MHh4
IHJhZGlvIGlzIHVzZWQgYXMgMi40R0h6IHJhZGlvCj4gICAtIG9uZSBRQ0E0MHh4IHJhZGlvIGlz
IHVzZWQgYXMgNUdIeiByYWRpbwo+Cj4gKiBvcmlnaW4gb2YgdGhlIGJvYXJkIGZpbGUgKGRpZCB5
b3UgY3JlYXRlIGl0IHlvdXJzZWxmIG9yIHdoZXJlIHlvdSAgZG93bmxvYWRlZCkKPgo+ICAgLSBF
eHRyYWN0ZWQgZnJvbSBmYWN0b3J5IGZpcm13YXJlCj4KPiAqIGlkcyB0byBiZSB1c2VkIHdpdGgg
dGhlIGJvYXJkIGZpbGUgKEFUSDEwS19CRF9JRV9CT0FSRF9OQU1FIGluIGF0aDEwaykKPgo+ICAg
LSBRQ0E0MDE5IGh3MS4wCj4KPiBCb2FyZE5hbWVzOiAnYnVzPWFoYixibWktY2hpcC1pZD0wLGJt
aS1ib2FyZC1pZD0xNix2YXJpYW50PWNlbGxjLHJ0bDMwdncnCj4gQm9hcmRNRDU6IDU0Zjc4ZDYz
NDhlYmRkMTg1N2JhM2Q0MjQwN2JkN2U0Cj4KPiBCb2FyZE5hbWVzOiAnYnVzPWFoYixibWktY2hp
cC1pZD0wLGJtaS1ib2FyZC1pZD0xNyx2YXJpYW50PWNlbGxjLHJ0bDMwdncnCj4gQm9hcmRNRDU6
IDM5NjAxMzg1MWJiNWMyOGM2N2Y2MGYwOGNhMzY3NWI1Cj4KPiBOT1RFOgo+Cj4gImJ1cz1haGIs
Ym1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MTcsdmFyaWFudD1jZWxsYyxydGwzMHZ3IiBmaWxl
Cj4gaGF2ZSB0aGUgc2FtZSBtZDUgc3VtIGFzCj4gImJ1cz1haGIsYm1pLWNoaXAtaWQ9MCxibWkt
Ym9hcmQtaWQ9MTcsdmFyaWFudD1BVk0tRlJJVFpCb3gtNDA0MCIuCj4KPiBJbiBmaXJzdCBtZXNz
YWdlIGkgc2VudCAgb25lIGJpbiB3aXRob3V0IGR1cGxpY2F0ZSBidXQgQ2hyaXN0aWFuCj4gTGFt
cGFydGVyIG9uIE9wZW5XcnQgZ2l0aHViIGFzayBtZSBmb3IgcmVzZW5kIHdpdGggYm90aCBiaW4g
ZmlsZXMuCj4KPiAqIGF0dGFjaCB0aGUgYWN0dWFsIGJvYXJkIGZpbGUgKGJvYXJkLmJpbikKClRo
YW5rcywgYWRkZWQgdG8gUUNBNDAxOS9odzEuMC9ib2FyZC0yLmJpbjoKCk5ldzoKYnVzPWFoYixi
bWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0xNyx2YXJpYW50PWNlbGxjLHJ0bDMwdncKCkNoYW5n
ZWQ6CgoKRGVsZXRlZDoKCjEgYm9hcmQgaW1hZ2UocykgYWRkZWQsIDAgY2hhbmdlZCwgMCBkZWxl
dGVkLCA3NCBpbiB0b3RhbAoKaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDEway1maXJtd2Fy
ZS9jb21taXQvYTYzM2MxNWQ5MzUxOWYxYjBmODVlMDVmYzM5ODhlNzEwNGU4NWFjMQoKLS0gCmh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoK
aHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0
aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

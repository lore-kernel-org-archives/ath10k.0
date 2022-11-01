Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8596FA3747
	for <ath10k@archiver.kernel.org>; Tue,  1 Nov 2022 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sk4K+ZpeV4PnBKE/tGuK3JqKYggiQtaKz+h+fWW6gpg=; b=BdgkAkt7HpB2EU
	HKUeI1v6QuIDLSDIZh804nnBuNNaPEMvgwpxHuFWr2KlCsJoq1C2XQmFdnEFsCNRSKz1s+UPS3O9f
	xH2ButGLHZ1RD6ZgyEwaGHrLe5zrYzgROGa807JjRYEk8ijjgQlDrMd2P2err9ZkTm1Ix+LZmErO5
	h5nCHtSLcMPXw28pOwJA0oPHLn58RpkHHlAlQArx1xSHXG3MUgwq8kIp0e3FmlmIMMonZFabJOpyE
	vdkUScsgsZEvzGgkpNy3FXQ8KpDhg1H/hGAhJtzXCSxgyRFC2Rt43NZ315Ar9Qp8mIKIxzNXtDi85
	sLsJYzkdIiKYAeXektig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opn9Y-003QPB-5e; Tue, 01 Nov 2022 09:01:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opn9V-003QN8-Bb
	for ath10k@lists.infradead.org; Tue, 01 Nov 2022 09:01:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D95BFB81B0F;
	Tue,  1 Nov 2022 09:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E47C433D6;
	Tue,  1 Nov 2022 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667293299;
	bh=/l6xjH9YE6k/qmD9L/3uehZBNhad2DOqg7fgrAKNHes=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=oH9+lEVJoHcPuZ/xMdwHYURN084RwbfeXBo2dLwSuB1bHDM81jNR+0wEzeDZitIpd
	 gvAe0vpoQZdaESgqg/zmTjyXC7Hyfo8RpUiglv+hFXFthORBhFocHMij17j5+vD8ex
	 2sZIIYn0acKObxwkhBh7a78eBoPYWCmiGRgMasK19Q5CFnZutjyZbQzVsJiSGozUWq
	 ++nv0I/P3A6BIdGTNZPXGQgCWQTVvkogj17IWimmlBVbzuMNCz/O3/jNAdl5L6UgX5
	 IDU63aPLQ2lbFJMVrjRhSQPLvDOyPBNP+Lvdy128Gh2lscuqCUi5/e2HlpJ6gxUspB
	 bvQdNPJokczYA==
From: Kalle Valo <kvalo@kernel.org>
To: "Youghandhar Chintala \(Temp\)" <quic_youghand@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath10k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath10k: Add WLAN firmware image version info into smem
References: <20221026102257.19919-1-quic_youghand@quicinc.com>
	<b55ef95f-f400-9ef6-a427-525ae529d673@quicinc.com>
	<fd45187c-739c-cd5d-4d4b-ae6abad03a94@quicinc.com>
Date: Tue, 01 Nov 2022 11:01:33 +0200
In-Reply-To: <fd45187c-739c-cd5d-4d4b-ae6abad03a94@quicinc.com> (Youghandhar
	Chintala's message of "Mon, 31 Oct 2022 12:24:43 +0530")
Message-ID: <877d0fgiaa.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_020145_560247_B6D2DE33 
X-CRM114-Status: GOOD (  10.66  )
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

KGZpeGluZyBxdW90YXRpb24pCgoiWW91Z2hhbmRoYXIgQ2hpbnRhbGEgKFRlbXApIiA8cXVpY195
b3VnaGFuZEBxdWljaW5jLmNvbT4gd3JpdGVzOgoKPiBPbiAxMC8yOC8yMDIyIDEyOjE5IEFNLCBK
ZWZmIEpvaG5zb24gd3JvdGU6Cj4KPj4gT24gMTAvMjYvMjAyMiAzOjIyIEFNLCBZb3VnaGFuZGhh
ciBDaGludGFsYSB3cm90ZToKCj4+PiDCoCArc3RhdGljIHZvaWQgYXRoMTBrX3FtaV9hZGRfd2xh
bl92ZXJfc21lbShzdHJ1Y3QgYXRoMTBrICphciwgY2hhcgo+Pj4gKmZ3X2J1aWxkX2lkKQo+Pgo+
PiBjb25zdCBjaGFyICpmd19idWlsZF9pZD8KPj4KPj4+ICt7Cj4+PiArwqDCoMKgIHU4ICpzbWVt
X3RhYmxlX3B0cjsKPj4+ICvCoMKgwqAgc2l6ZV90IHNtZW1fYmxvY2tfc2l6ZTsKPj4+ICvCoMKg
wqAgY29uc3QgdTMyIHZlcnNpb25fc3RyaW5nX3NpemUgPSAxMjg7Cj4+Cj4+IHNob3VsZCB5b3Ug
cy8xMjgvTUFYX0JVSUxEX0lEX0xFTi8gc2luY2UgdGhhdCBpcyB3aGF0IGlzIHVzZWQgdG8KPj4g
c2l6ZSBxbWktPmZ3X2J1aWxkX2lkPwo+Pgo+PiBvciBhbHRlcm5hdGVseSBoYXZlIHRoZSBjYWxs
ZXIgcGFzcyBmd19idWlsZF9pZCBsZW5ndGggYXMgYSBzZXBhcmF0ZQo+PiBwYXJhbT8KPgo+IFN1
cmUgSmVmZi4gV2lsbCBhZGRyZXNzIGl0IGluIG5leHQgdmVyc2lvbiBvZiBwYXRjaC4KCkJUVyBZ
b3VnaGFuZGhhciwgeW91ciBxdW90ZXMgd2VyZSBicm9rZW4gaW4gdGhpcyBtYWlsIHNvIHlvdXIg
cmVwbHkgd2FzCmRpZmZpY3VsdCB0byBmaW5kLiBTZWUgaGVyZToKCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8yMDIyMTAyNjEwMjI1Ny4x
OTkxOS0xLXF1aWNfeW91Z2hhbmRAcXVpY2luYy5jb20vCgpJZiB5b3UgYXJlIHVzaW5nIE91dGxv
b2ssIEkgcmVjb21tZW5kIHN3aXRjaGluZyB0byBhbiBhcHBsaWNhdGlvbiB3aGljaApyZXNwZWN0
cyBzdGFuZGFyZHMgbW9yZSA6KSBGb3IgZXhhbXBsZSwgc29tZSBwZW9wbGUgc2VlbSB0byBiZSBo
YXBweQp3aXRoIFRodW5kZXJiaXJkLgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5l
bC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

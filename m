Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACBAC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxRqpcWBTnEcH91QyTw+t3UVJUtvR8nkX2wb32iM1ZA=; b=RALg1ANndDkHv0
	nfqE9re55kZ/Ut1eglM9La/zePl8sHOR7VE1ULvtSGukVmCROzre+tXeMcmYwe86IJNf6+tghxXpp
	6fauMgkEfAue4X4V7Ldvg59dTl9YLO3bNLzWedlMkSxvdLTB36ocdVtzMemNE06MhCCj09xZDxnIj
	BveukiKEvecptYFpNhJzGVasctca6kdzJq0azmMehxcX3WBpAI/+pBn5jFF8Lx4p6b25C36vqapn4
	c9dyLMeejJwtJtbzfaFLQ1LY7g7NE1uiYZST4tlWCbuhXuEUTlrU00vZsRl+g6Xo6crGL6pyLvhBU
	GhWmUPDjkt4yclSXYSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAueK-00FLIH-2t; Fri, 21 Jan 2022 14:12:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAueH-00FLHH-Eu
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:12:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64C166168F;
 Fri, 21 Jan 2022 14:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C179C340E1;
 Fri, 21 Jan 2022 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642774335;
 bh=DjtwcYqKwKdOoK05puaCMwYk28e95e2/E3YRVaNdZQA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=E+LGUmLgDr11GSffHiEuTGOZmHigxRBO8EEgeDYzmbGQzaiCUznlTxonRMTkTj/Ek
 1cBiT0/FUQ3qy9QzFoo8YXrYcOiIU84rD+ZMjley7qgbKKSfn6kFe4aFtYqGanpqDK
 RTbUbJAF9UjkAONNv/BXSxlOI9+N8VwRRQoYD7xvcIYFWdL7X/hk1YbNmU9nZhtAno
 Ba5L0P9r87Kf/RjtdzOXiInqmzcJYPzFLiRhtB5ZWDpfNSNVNsH7aQUUZI+48qftVc
 Sd6Kla3MR3ZjOAok4xtNEAiIe9HcUdZ/UBinasDZOqEucJsWJ3Shmii7CxCX8c9GA1
 mBavbEmYDdceg==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?Bla=C5=BE?= Hrastnik <blaz@mxxn.io>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA6174A hw3.2: Add Killer Networking/Surface Go
 specific board
References: <0765166b-aaf8-49f4-b7e6-cbed301aa4a6@www.fastmail.com>
Date: Fri, 21 Jan 2022 16:12:13 +0200
In-Reply-To: <0765166b-aaf8-49f4-b7e6-cbed301aa4a6@www.fastmail.com>
 (=?utf-8?Q?=22Bla=C5=BE?=
 Hrastnik"'s message of "Thu, 02 Apr 2020 04:49:25 +0000")
Message-ID: <87ilud9o02.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_061217_565858_4C3E8F47 
X-CRM114-Status: GOOD (  12.14  )
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

Qmxhxb4gSHJhc3RuaWsgPGJsYXpAbXh4bi5pbz4gd3JpdGVzOgoKPiAqIGRlc2NyaXB0aW9uIGZv
ciB3aGF0IGhhcmR3YXJlIHRoaXMgaXM6Cj4KPiAgIC0gaXQgaXMgYSBRQ0E2MTc0QSBiYXNlZCBy
YWRpbyB1c2VkIGZvciB3aS1maSBpbiBTdXJmYWNlIEdvIGFuZCB2YXJpb3VzIG90aGVyIGxhcHRv
cHMKPgo+ICogb3JpZ2luIG9mIHRoZSBib2FyZCBmaWxlIChkaWQgeW91IGNyZWF0ZSBpdCB5b3Vy
c2VsZiBvciB3aGVyZSB5b3UKPiAgIGRvd25sb2FkZWQpCj4KPiAgIC0gVGFrZW4gZnJvbSBLaWxs
ZXIgTmV0d29ya2luZydzIHdlYnNpdGU6Cj4gICAgIGh0dHBzOi8vc3VwcG9ydC5raWxsZXJuZXR3
b3JraW5nLmNvbS9rbm93bGVkZ2UtYmFzZS9pbnN0YWxsaW5nLXRoZS1raWxsZXItd2lyZWxlc3Mt
YWMtMTUzNS1pbi1zdGVhbW9zLwo+Cj4gICAgIGh0dHBzOi8vc3VwcG9ydC5raWxsZXJuZXR3b3Jr
aW5nLmNvbS9LMTUzNV9EZWJpYW4vYm9hcmQuYmluCj4KPiAqIGlkcyB0byBiZSB1c2VkIHdpdGgg
dGhlIGJvYXJkIGZpbGUgKEFUSDEwS19CRF9JRV9CT0FSRF9OQU1FIGluIGF0aDEwaykKPgo+ICAg
LSBRQ0E2MTc0IGh3My4yCj4KPiAgICAgKyBidXM9cGNpLHZlbmRvcj0xNjhjLGRldmljZT0wMDNl
LHN1YnN5c3RlbS12ZW5kb3I9MTY4YyxzdWJzeXN0ZW0tZGV2aWNlPTMzNzAKPiAgICAgICBzaGEy
NTZzdW06Cj4gICAgICAgZTc5YjgwZTIyNDNjNjJmNDFmYmFmMWNjOTI4NDVjZWZiMTEwMTliMGE2
ZDFjOTE0ODhjZjQzZmQ2M2RjZjg1YwoKVGhlcmUncyBub3cgYSBib2FyZCBmaWxlIGZvciB0aGVz
ZSBpZHM6CgpCb2FyZE5hbWVzWzg1XTogJ2J1cz1wY2ksdmVuZG9yPTE2OGMsZGV2aWNlPTAwM2Us
c3Vic3lzdGVtLXZlbmRvcj0xNjhjLHN1YnN5c3RlbS1kZXZpY2U9MzM3MCcKQm9hcmRMZW5ndGhb
ODVdOiA4MTI0CkJvYXJkQ1JDMzJbODVdOiBjOGY0MjMzNApCb2FyZE1ENVs4NV06IGJjNTJhYTU2
NDBiMjdmYTUwZjlkNGQxNDRmODFlMTY5CgpJIGFzc3VtZSBpdCdzIHRoZSBzYW1lIG9uZSBzbyBJ
J20gZHJvcHBpbmcgdGhpcyByZXF1ZXN0LgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtl
cm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

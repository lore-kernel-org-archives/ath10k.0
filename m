Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99F9C433F5
	for <ath10k@archiver.kernel.org>; Fri, 25 Mar 2022 10:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M24kR7iZZHOvKhc5RN5ze4ms3xi1SqvlpzLr+nF//Eo=; b=U1mFbcPlt21dOv
	8PVBuj2TTHA1SiD6cyJ0JK8L1ofmVGAKMxB8dz691kJA/z0b/3gIOsVv0n865lA+0MOE9AHZPiNbs
	SnZCKhsUtdegEULTBy1JTby5Y+Dx2P4y4VaM8wl42B1wo+z8eAA9dEy8dICQT2n8vaWw/6ReVxfng
	KcTVeyXS11nshSH8V25FQhcbQZK0NSIeFHRY6b+JoGdx3eQKlSFx+3BF78pZLo2dFm6UyBPrtdzw7
	Qmo1uQKo2i/qutElFzKVQW8r5EvGt6PVXrd0ikxn6VibE7YvduaksYveiYxnM0AtM9zVV4fmDF84T
	+NwChJgDIiPcjpVVaUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXhHJ-001kdt-Lm; Fri, 25 Mar 2022 10:34:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXgxP-001eVX-CZ
 for ath10k@lists.infradead.org; Fri, 25 Mar 2022 10:14:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7A64DCE2915;
 Fri, 25 Mar 2022 10:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B51C340E9;
 Fri, 25 Mar 2022 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648203245;
 bh=1AyXCUaVF27lg2Pu/f6PUHluvHvEPmMz80ep6pC4IPs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=HU2IR/kI6k+yon/hsxCL31++VtD1nlTYECvyauGrjuEHyGbeSTnqYgHiwm5dimmh6
 U/J5LEYvkvo08/Qq72WxsN48hhuJd7I7gHHrSzU5oRq0PEEDN4OIzZUS0DLnPTsb8O
 U1atias+3lYDibaRAcTKQ9Ufo2u4d2sfsVk/kL49LDOuIKJOG4PQfoCsXOep2zy1k1
 IIYabhnyg7G5iRgLcbsExm0eyEzgp+i4D8uxf1Q45Dm+yw3fDQLGxsK/SPs9TrFuKM
 d4boHWeavIftrPYcwwmcTYPzNFSTucnYx8oxrbUKstyPLn53PUjgF2RjQw45kJ4Jgh
 vbQi8YcPGc14Q==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?B?5byg6bmP?= <1805692831@qq.com>
Cc: "ath10k" <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update Qxwlan E2600AC c1 specific
 BDFs
References: <tencent_93B4B0DBC6D5DF0162F6335C796C3986D606@qq.com>
Date: Fri, 25 Mar 2022 12:14:02 +0200
In-Reply-To: <tencent_93B4B0DBC6D5DF0162F6335C796C3986D606@qq.com>
 (=?utf-8?B?IuW8oOm5jyIncw==?=
 message of "Fri, 25 Mar 2022 18:09:21 +0800")
Message-ID: <87a6de8hlh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_031411_651209_67C2375C 
X-CRM114-Status: UNSURE (   7.01  )
X-CRM114-Notice: Please train this message.
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

IuW8oOm5jyIgPDE4MDU2OTI4MzFAcXEuY29tPiB3cml0ZXM6Cgo+ICZuYnNwO01vZGlmaWVkIHRo
ZSByYWRpbyBmcmVxdWVuY3kgaGFyZHdhcmUgcGFydCBvZiBlMjYwMGFjIGMxLAo+IG5lZWQgdG8g
Y29vcGVyYXRlIHdpdGggdGhlIG1vZGlmaWVkIGJvYXJkLmJpbiBmaWxlLCB0aGUgZGV2aWNlCj4g
Y2FuIHdvcmsgbm9ybWFsbHkuCgpXaHkgYXJlIHlvdSBzZW5kaW5nIHRoZSBzYW1lIG1haWwgbXVs
dGlwbGUgdGltZXM/IEkgaGF2ZSBzZWVuIGF0IGxlYXN0CnRocmVlIGNvcGllcyBub3cuCgotLSAK
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3Qv
CgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50
YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

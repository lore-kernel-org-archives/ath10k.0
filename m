Return-Path: <SRS0=YXm1=OL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5681DC433FE
	for <ath10k@archiver.kernel.org>; Tue, 21 Sep 2021 07:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CFC4610A1
	for <ath10k@archiver.kernel.org>; Tue, 21 Sep 2021 07:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CFC4610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xH1uXiOfoPMDqlf0Cac+fOyGFWYW37rNHoVfd8Psa/k=; b=VO1fWjszOXPjgF4Am21kYIb/mg
	Zm4s7lfrh9qfqAFDATtehdhUC30EkB0t9M8tO7Sh97JWtGbWWr1lDnovumrsHOEh2+tDTRu0dHF2/
	dHpPGI/67Jyugaq1jN6AgGoIZHafUfWx14CFlGGCplCfHXKpUbiK8l1afCNY5kOB892P/GKwoRP/D
	O8S2Rzml582UXtblKaUE2FbodjpXx4gBikuQVbGIF4f2ZGGnYqMYNi8UJzZNkkVOPabDE2E/KGxY7
	ngaCKyJsRXJqTMOZ4CI+4WDunvXkNBccMCDHZviQlWoMYxuEsXDJVwLpOrAWEKud2NOF7NEMNtd1R
	i6kr1JRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSaYW-003rle-3e; Tue, 21 Sep 2021 07:51:08 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSaYR-003rjw-KB
 for ath10k@lists.infradead.org; Tue, 21 Sep 2021 07:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632210630;
 bh=cOgtnwrqtRUZbHwxWyhJ2gKO4mxwfCV4C5Cx3WB2LOY=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=H7ye5TYTQhgbR2iOO/O+dKAwp/U6o/8Q81eU0TaEyenTKrDpDEeDQfNl4RZqJdn//
 28Th/RV20bFN6Bs3EPDfe4z5/qtzGP4AHNPGvS4GvtLIBt7Qat4Zznz6ijEPskHIc/
 sdaGEg4+v3gGGVd46pFWbnPpjy6JbQdqEv4MTdkM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.100] ([79.206.239.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpf3-1n9dwP37B1-00mJPx; Tue, 21
 Sep 2021 09:50:30 +0200
Subject: Re: [PATCH V2] ath10k: don't fail if IRAM write fails
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ojab // <ojab@ojab.ru>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath10k@lists.infradead.org,
 Linux Wireless <linux-wireless@vger.kernel.org>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20210722193459.7474-1-ojab@ojab.ru>
 <CAKzrAgRt0jRFyFNjF-uq=feG-9nhCx=tTztCgCEitj1cpMk_Xg@mail.gmail.com>
 <CAKzrAgQgsN6=Cu4SvjSSFoJOqAkU2t8cjt7sgEsJdNhvM8f7jg@mail.gmail.com>
 <CAKzrAgSEiq-qOgetzryaE3JyBUe3URYjr=Fn0kz9sF7ZryQ5pA@mail.gmail.com>
 <538825a2-82f0-6102-01da-6e0385e53cf5@gmx.de> <87wnnav129.fsf@codeaurora.org>
From: "sparks71@gmx.de" <sparks71@gmx.de>
Message-ID: <4656706a-a87d-1bf6-d125-b66af57157ca@gmx.de>
Date: Tue, 21 Sep 2021 09:50:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87wnnav129.fsf@codeaurora.org>
Content-Language: en-US
X-Provags-ID: V03:K1:pp1k1nFwD8mCryzJkJtnEVeIctvaJT2FBpX17tUrHoHHD01nD3D
 zXbM9jxPNrRqWSyi2DedaGYi+p6ElRTbm2HofwEvEbdh2yp0QceuusLsN9FLbd/RXDdZ5Rc
 4MEKXXl5G7mdjVbJlXZFgxWttrzudZeV/vCWlmTqFwfSkVuiC59ilTzj97oAn8ZdF3ejyMU
 H+/f1187+Ny8/6fSsSLWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wa/9fgfFcN0=:UTh/weiCglGI3KfbirGRgt
 QvfkSwWJPHvipBWVpABrrpArgtwXE8J5F9uMXlmFAisS1YHDfHCbziDRrI9SIF1WDYQtZHnCK
 Om491LrEjN4RsLt239IoKnT3QxMHSPEpwNSrDL/aNwsLWryRFGkuNGT++C54zKIvwQzXUJyJz
 1sGSz4sSMAiI/Hb2NufVBpjCUK/O9jQO3r8t6RKipIAGEGvQBYszIKQE5qZ1wYEGH/c2xobzj
 HyQE95iR2VKuuffKms4wGq6ASeAi+V9tTS/7geJ7Tz0cHpzYZt90S0pzuLgGP4u9J++AvB4qh
 D/7o/GfNRACE+PnIiB/3m8e3R3BFN6uuBXLSJfY2kjhTFiCZafRCU2xbwLsNTEojhZPK2LFkP
 D2QIMGTj32m0UB0U84qZVbhnegIFrZEABTShUTitAqW+nosRTsRnhUaVKsLUmHrQ30zZ93S2i
 tE6mKDXc0JKbZlwthmBHiagPPT6Bc9jNOtU6PyfSesi5ugJ12wOt2uGw3nqMYrZ8cvYrulfyI
 ULGyPhoEuOvPfFY6MfUJP+mHhXDk5Z9GKnx0nubDyHM5i02U9iBVgkG5/lNSbHD1HykkumM3+
 AN6keOMkPfTvlYYKmoIZ8sCkmLlFUEdkp5q2GNnWEDNoi1ugQ6pPmc2XhvagN0OJ6svbpo+Hk
 0DZ3v9ZJaJw2l6sRaecUSTur3RGHOdU2taX8ga4sbbDwReJGKIpcw6/sq6yt/6s18cPL2P3Yk
 MThZ0dKUJTNQoB0YknymTd7kdznMYGLkdZM3nWLGxvdjFZfraog9oZnS5jMVvb6/JM5ZPb4NY
 hxwMAAlD2ugfC7k2+paog1JBmBHZvwuL4AZpCA33BNvtah+4EEY0e63FCgSJ6l+0dJEBQjN2K
 3rfNooz/HSgwc6OsdUR1strr3ZC05i5JuvHDOGhTxScDTWZBc03adNOy0tLdMdrBBziCymF1s
 pPaJFMoX3hJAMX8nAlkCFxu+4GPVpMA096pgZ4Gg7DAXj6N0uPp+cLrDj1UnOj10yvM5WOpMW
 GiCy/1lSkAMh1kPMyXThofFwSifDNlKeSFl6stf+8qP5e6IbOF/qJqxJK+Ujp20a0gQcZypaB
 mifPn6kHUJegZg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_005104_008404_6D2ACB57 
X-CRM114-Status: GOOD (  12.85  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

QW0gMjEuMDkuMjEgdW0gMDk6Mjkgc2NocmllYiBLYWxsZSBWYWxvOgo+ICJzcGFya3M3MUBnbXgu
ZGUiIDxzcGFya3M3MUBnbXguZGU+IHdyaXRlczoKPgo+PiBIYXZlIHlvdSBzZWVuIHRoZSBuZXcg
cGF0Y2g/Cj4+Cj4+IGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcvbXNnMTM3ODQuaHRtbAo+Pgo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9rdmFsby9hdGguZ2l0L2NvbW1pdC8/aD1tYXN0ZXItcGVu
ZGluZyZpZD05NzNkZTU4MjYzOWExZTQ1Mjc2ZTRlM2UyZjNjMmQ4MmEwNGFkMGE2Cj4+Cj4+Cj4+
IGNvdWxkIHByb2JhYmx5IGhhdmUgYmVlbiBjb21tdW5pY2F0ZWQgYmV0dGVyCj4gWWVhaCwgYXBw
YXJlbnRseSB0aGVyZSBhcmUgdHdvIGRpZmZlcmVudCBmaXhlcyBub3cuIEknbGwgcmV2aWV3IGJv
dGggb2YKPiB0aGVtIGFuZCB0cnkgdG8gY2hvb3NlIHdoaWNoIG9uZSB0byB0YWtlLgo+CkkgaGF2
ZSB0ZXN0ZWQgYm90aCBmaXhlcyAoeDg2XzY0IDJ4IFFDQTk5ODQpCgpGb3IgbWUgYm90aCBvZiB0
aGVtIHdvcmsuCgpbUEFUQ0ggVjJdIGF0aDEwazogZG9uJ3QgZmFpbCBpZiBJUkFNIHdyaXRlIGZh
aWxzOgoKClsxODI0NS42MTAxMTJdIGF0aDEwa19wY2kgMDAwMDowMzowMC4wOiBwY2kgaXJxIG1z
aSBvcGVyX2lycV9tb2RlIDIKaXJxX21vZGUgMCByZXNldF9tb2RlIDAKWzE4MjQ1LjY3NDgwMF0g
YXRoMTBrX3BjaSAwMDAwOjA0OjAwLjA6IHBjaSBpcnEgbXNpIG9wZXJfaXJxX21vZGUgMgppcnFf
bW9kZSAwIHJlc2V0X21vZGUgMApbMTgyNDUuNzMxNjA2XSBhdGgxMGtfcGNpIDAwMDA6MDM6MDAu
MDogcWNhOTk4NC9xY2E5OTk0IGh3MS4wIHRhcmdldAoweDAxMDAwMDAwIGNoaXBfaWQgMHgwMDAw
MDAwMCBzdWIgMTY4YzpjYWZlClsxODI0NS43MzE2MjBdIGF0aDEwa19wY2kgMDAwMDowMzowMC4w
OiBrY29uZmlnIGRlYnVnIDAgZGVidWdmcyAxCnRyYWNpbmcgMSBkZnMgMCB0ZXN0bW9kZSAwClsx
ODI0NS43MzMxNzJdIGF0aDEwa19wY2kgMDAwMDowMzowMC4wOiBmaXJtd2FyZSB2ZXIgMTAuNC0z
LjkuMC4yLTAwMTUyCmFwaSA1IGZlYXR1cmVzCm5vLXAycCxtZnAscGVlci1mbG93LWN0cmwsYnRj
b2V4LXBhcmFtLGFsbG93cy1tZXNoLWJjYXN0LG5vLXBzLHBlZXItZml4ZWQtcmF0ZSxpcmFtLXJl
Y292ZXJ5CmNyYzMyIDcyM2Y5NzcxClsxODI0NS43OTAzODBdIGF0aDEwa19wY2kgMDAwMDowNDow
MC4wOiBxY2E5OTg0L3FjYTk5OTQgaHcxLjAgdGFyZ2V0CjB4MDEwMDAwMDAgY2hpcF9pZCAweDAw
MDAwMDAwIHN1YiAxNjhjOmNhZmUKWzE4MjQ1Ljc5MDM4M10gYXRoMTBrX3BjaSAwMDAwOjA0OjAw
LjA6IGtjb25maWcgZGVidWcgMCBkZWJ1Z2ZzIDEKdHJhY2luZyAxIGRmcyAwIHRlc3Rtb2RlIDAK
WzE4MjQ1Ljc5MDcwM10gYXRoMTBrX3BjaSAwMDAwOjA0OjAwLjA6IGZpcm13YXJlIHZlciAxMC40
LTMuOS4wLjItMDAxNTIKYXBpIDUgZmVhdHVyZXMKbm8tcDJwLG1mcCxwZWVyLWZsb3ctY3RybCxi
dGNvZXgtcGFyYW0sYWxsb3dzLW1lc2gtYmNhc3Qsbm8tcHMscGVlci1maXhlZC1yYXRlLGlyYW0t
cmVjb3ZlcnkKY3JjMzIgNzIzZjk3NzEKWzE4MjQ2Ljk2Mzc2MF0gYXRoMTBrX3BjaSAwMDAwOjAz
OjAwLjA6IGJvYXJkX2ZpbGUgYXBpIDIgYm1pX2lkIDA6MQpjcmMzMiA4NTQ5ODczNApbMTgyNDcu
MDE5Njk5XSBhdGgxMGtfcGNpIDAwMDA6MDQ6MDAuMDogYm9hcmRfZmlsZSBhcGkgMiBibWlfaWQg
MDoyCmNyYzMyIDg1NDk4NzM0ClsxODI0OS41MTQwNTRdIGF0aDEwa19wY2kgMDAwMDowMzowMC4w
OiBObyBoYXJkd2FyZSBtZW1vcnkKWzE4MjQ5LjUxNDA1N10gYXRoMTBrX3BjaSAwMDAwOjAzOjAw
LjA6IGZhaWxlZCB0byBjb3B5IHRhcmdldCBpcmFtCmNvbnRlbnRzOiAtMTIKWzE4MjQ5LjU3MDQy
M10gYXRoMTBrX3BjaSAwMDAwOjA0OjAwLjA6IE5vIGhhcmR3YXJlIG1lbW9yeQpbMTgyNDkuNTcw
NDI2XSBhdGgxMGtfcGNpIDAwMDA6MDQ6MDAuMDogZmFpbGVkIHRvIGNvcHkgdGFyZ2V0IGlyYW0K
Y29udGVudHM6IC0xMgpbMTgyNDkuNjIwNjM3XSBhdGgxMGtfcGNpIDAwMDA6MDM6MDAuMDogaHR0
LXZlciAyLjIgd21pLW9wIDYgaHR0LW9wIDQKY2FsIG90cCBtYXgtc3RhIDUxMiByYXcgMCBod2Ny
eXB0byAxClsxODI0OS42NzgwMzVdIGF0aDEwa19wY2kgMDAwMDowNDowMC4wOiBodHQtdmVyIDIu
MiB3bWktb3AgNiBodHQtb3AgNApjYWwgb3RwIG1heC1zdGEgNTEyIHJhdyAwIGh3Y3J5cHRvIDEK
CgphdGgxMGs6IEZpeCBkZXZpY2UgYm9vdCBlcnJvcjoKClvCoMKgwqAgMy4zMTg5MzJdIGF0aDEw
a19wY2kgMDAwMDowMzowMC4wOiBwY2kgaXJxIG1zaSBvcGVyX2lycV9tb2RlIDIKaXJxX21vZGUg
MCByZXNldF9tb2RlIDAKW8KgwqDCoCAzLjM3NzA3MV0gYXRoMTBrX3BjaSAwMDAwOjA0OjAwLjA6
IHBjaSBpcnEgbXNpIG9wZXJfaXJxX21vZGUgMgppcnFfbW9kZSAwIHJlc2V0X21vZGUgMApbwqDC
oMKgIDMuNDM0MDUxXSBhdGgxMGtfcGNpIDAwMDA6MDM6MDAuMDogcWNhOTk4NC9xY2E5OTk0IGh3
MS4wIHRhcmdldAoweDAxMDAwMDAwIGNoaXBfaWQgMHgwMDAwMDAwMCBzdWIgMTY4YzpjYWZlClvC
oMKgwqAgMy40MzQwNTRdIGF0aDEwa19wY2kgMDAwMDowMzowMC4wOiBrY29uZmlnIGRlYnVnIDAg
ZGVidWdmcyAxCnRyYWNpbmcgMSBkZnMgMCB0ZXN0bW9kZSAwClvCoMKgwqAgMy40MzQ0MTJdIGF0
aDEwa19wY2kgMDAwMDowMzowMC4wOiBmaXJtd2FyZSB2ZXIgMTAuNC0zLjkuMC4yLTAwMTUyCmFw
aSA1IGZlYXR1cmVzCm5vLXAycCxtZnAscGVlci1mbG93LWN0cmwsYnRjb2V4LXBhcmFtLGFsbG93
cy1tZXNoLWJjYXN0LG5vLXBzLHBlZXItZml4ZWQtcmF0ZSxpcmFtLXJlY292ZXJ5CmNyYzMyIDcy
M2Y5NzcxClvCoMKgwqAgMy40ODcyMjVdIGF0aDEwa19wY2kgMDAwMDowNDowMC4wOiBxY2E5OTg0
L3FjYTk5OTQgaHcxLjAgdGFyZ2V0CjB4MDEwMDAwMDAgY2hpcF9pZCAweDAwMDAwMDAwIHN1YiAx
NjhjOmNhZmUKW8KgwqDCoCAzLjQ4NzIyOV0gYXRoMTBrX3BjaSAwMDAwOjA0OjAwLjA6IGtjb25m
aWcgZGVidWcgMCBkZWJ1Z2ZzIDEKdHJhY2luZyAxIGRmcyAwIHRlc3Rtb2RlIDAKW8KgwqDCoCAz
LjQ4NzU2OF0gYXRoMTBrX3BjaSAwMDAwOjA0OjAwLjA6IGZpcm13YXJlIHZlciAxMC40LTMuOS4w
LjItMDAxNTIKYXBpIDUgZmVhdHVyZXMKbm8tcDJwLG1mcCxwZWVyLWZsb3ctY3RybCxidGNvZXgt
cGFyYW0sYWxsb3dzLW1lc2gtYmNhc3Qsbm8tcHMscGVlci1maXhlZC1yYXRlLGlyYW0tcmVjb3Zl
cnkKY3JjMzIgNzIzZjk3NzEKW8KgwqDCoCA0LjY2NTc3Ml0gYXRoMTBrX3BjaSAwMDAwOjAzOjAw
LjA6IGJvYXJkX2ZpbGUgYXBpIDIgYm1pX2lkIDA6MQpjcmMzMiA4NTQ5ODczNApbwqDCoMKgIDQu
NzE2NTQ5XSBhdGgxMGtfcGNpIDAwMDA6MDQ6MDAuMDogYm9hcmRfZmlsZSBhcGkgMiBibWlfaWQg
MDoyCmNyYzMyIDg1NDk4NzM0ClvCoMKgwqAgNy40MjMxOTJdIGF0aDEwa19wY2kgMDAwMDowNDow
MC4wOiBodHQtdmVyIDIuMiB3bWktb3AgNiBodHQtb3AgNApjYWwgb3RwIG1heC1zdGEgNTEyIHJh
dyAwIGh3Y3J5cHRvIDEKW8KgwqDCoCA3LjQ0MzEwOV0gYXRoMTBrX3BjaSAwMDAwOjAzOjAwLjA6
IGh0dC12ZXIgMi4yIHdtaS1vcCA2IGh0dC1vcCA0CmNhbCBvdHAgbWF4LXN0YSA1MTIgcmF3IDAg
aHdjcnlwdG8gMQoKdGhlIHNlY29uZCBmaXhlcyB0aGUgZXJyb3IgbWVzc2FnZSBjb21wbGV0ZWx5
IGFuZCAiSVJBTSByZWNvdmVyeSIgc2VlbXMKdG8gd29yawoKYmVzdCByZWdhcmRzCgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

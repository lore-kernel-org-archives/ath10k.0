Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1C6C433DB
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 13:44:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E39E216FD
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 13:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E39E216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xtder3cHMjTW2X14n/9hOSoDLPFW5mNKY2rk5hnsJnA=; b=gkb6oeSC5iE+1aOHSB4U8t8LS
	d4mvnaNxsHZNLR0VL/Bc/B0wArTxhh7Oiuav5YoK/V3waIfKGWWp57/fgHP+NFACQ/IFXyo6TV1CC
	d6DbW43UOXcnZoreo/T+YM1UEnmOchyYTCcwzGE+T8EoGwaQ5Ss+OOiKCElVchCZNnIfzmGlJnDJv
	wTfQKKuS/rYLdAhFGKK9hNcP7PP2uUQinihBdjwm3/UPdd5ZPA0a5VwIl/g55qKp8Df1qGuf6XKvV
	Ncc8s2fgNfUPZvY2PhMu0u/6NeFxZdzgRv6NGoWg833zDxB+Q6YZw0xCraFi2VXbcoTzzHCQAoz/Z
	rroCF35Tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krLTC-00084D-Lk; Mon, 21 Dec 2020 13:43:26 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krLT7-00083b-Ig
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 13:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1608558186;
 bh=lnT7IUjJ3pir8wio/6n74DQE3hhlEbmsS/gxBfGG6Ig=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Qrt5MQ7vNMK9S4zIG8MTZSvoRVtC0NBlnPudWWe4YMLMvAu7p/ALlKu/i8oo+Y2MV
 yLi9fJ+aHfDyN8UagpAzPXK+ctyylYgEQip0i6NAE8VJVq9Wbr9+dPQDv8or4bPHTt
 uoPHPceUX0Y4wDN1e80IiNu2iYY/iuk4eEXoGFV8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.100] ([91.18.227.215]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma20q-1kWUes2udo-00W1Gl; Mon, 21
 Dec 2020 14:43:06 +0100
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
To: Alvin Sipraga <ALSI@bang-olufsen.dk>, Jouni Malinen <jkmalinen@gmail.com>
References: <20201022172113.GA1367233@capeo.gueux.org>
 <CANe27jKpYm29QOjYOZ_jwHiRxuWx66J+th8-zgbXK4geiCU0_Q@mail.gmail.com>
 <20201029140616.GG515433@capeo.gueux.org>
 <CANe27j+fur52HydqqzLc2hBV3QwC2La8+RTJcV=5W5LkUr=PqQ@mail.gmail.com>
 <6a7e3314-6f91-cedb-1ffc-55ae9189dcf4@bang-olufsen.dk>
From: "sparks71@gmx.de" <sparks71@gmx.de>
Message-ID: <19e636c1-fdbe-7222-a055-d668e4617070@gmx.de>
Date: Mon, 21 Dec 2020 14:43:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6a7e3314-6f91-cedb-1ffc-55ae9189dcf4@bang-olufsen.dk>
Content-Language: en-US
X-Provags-ID: V03:K1:e2872FetnzzVdMFwz+KwOmvS0WhTddOhA9kNFkPekFKoDxQibaX
 AD6bkYf8qZfjZypRK0G7dCjehAyisUkC9dD31d1yS5t/Oi0WECuMHywJH/DoYYrK0PMCLeH
 U16vRslmT8+Xfj84LQpfjLc9/9IDVhWOMx7nJVf3doXe4VNlLtVryoNV4WL/wAP7KKVHsqG
 xsCoL9nYwV3LX1Bsm+iVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZWZE+nBZp18=:GShuQO0dkGH165OKpfCPlV
 wj1sYwxYtm8iN/254ABzoQDwNLt0b1IaS/QpY5gy/usXEB57bfFGOSMXdPvpt86Rd2tmLmT7l
 XyewtgatCV7kR7O0hJX4HfZIFciGoo3mncXqJYG+G8ABEaM0txIrXSU0Myl5tqsn1G6y+CBd/
 xHZDuoZ3Y8bffrpqDBtN8BbzV99d/HvdRX/Slay1gES1ocsM8NCHCyF9bjrUOVtJdZ9/DpFVF
 Xl9n7t/QgC1/THB/aeEAT3sb55azxwpwLxFAjCPTkC8NidUZMloJNVncAYJIK0MNoUYg29iEW
 Eqmk5OZ40SCVhExBVF6ZblnHnBL8AduMRzrVSQxqktaY+WlDZumAIAzc9MNlDSICRByOD7J3a
 VXrvWYp+7w9M8Is5lBtFEytf7mNhRoLA3DEUPeT6nv8bJJb51x6AXZsg2sQgCqVYksr8AX6y9
 i4KcGQcScYdUsK3ibNS+xILkjtq7D4smWAg32ODCg1biikC1fY0WnaWJrTeDzcwG7bgDVmAFc
 RyQ/fdgAUcPuMdyCmD/Lugk+FAwL0WA0zEzln9tnd1LylUMtxf4fZph5NRfStotifhx3bjFds
 bRZTLp1QjFVW3YkUyl0E8YgBn6O6YQhhBrdTRuRAQFT4P/GGqhK620AP8PZmkSMFAlmsJnCX7
 45Q4wlWd/SGKIuw5ziCJVnZ9F1gkIfYbLDv4TCTC32isY8I5531fWYZP3deT2dLbAGkktzicO
 nMCrLzjJeeu2TqezVF2b3GTR/YZ+zZhshTgQgAFpJX1l3x5bZDlYXbCjwpvgZRwZ+6W3vgt8J
 hxoNHCpY57nqVEY6W1GO6/FLSwpluD2iU2eQ/eH5mWjn8P/PZjTsQImdo5UtYRyRRpzkVtFtK
 kpgMumlb3lsDVliaeeCQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_084321_837727_331F35D5 
X-CRM114-Status: GOOD (  30.01  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?F=c3=a9lix_Sipma?= <felix+kernel@gueux.org>,
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

QW0gMzAuMTAuMjAgdW0gMTQ6MjMgc2NocmllYiBBbHZpbiBTaXByYWdhOgo+IEhpLAo+Cj4gT24g
MTAvMzAvMjAgODoyMCBBTSwgSm91bmkgTWFsaW5lbiB3cm90ZToKPj4gU28gdGhlIGlzc3VlIGlz
IGluIG5vdCBiZWluZyBhYmxlIHRvIG9wZXJhdGUgYW4gQVAgb24gdGhlIDUgR0h6IGJhbmQ/Cj4+
IFRoYXQgc291bmRzIGxpa2UgdGhlIGV4cGVjdGVkIGJlaGF2aW9yIGZvciBhbnkgZGV2aWNlIHRo
YXQgaGFzIG5vdAo+PiBiZWVuIGNhbGlicmF0ZWQgYW5kIHByb3Zpc2lvbmVkIGZvciBhIHNwZWNp
ZmljIGNvdW50cnkgd2hlcmUKPj4gcmVndWxhdG9yeSBydWxlcyBhbGxvdyBvcGVyYXRpb24gb24g
dGhlIDUgR0h6IGJhbmQuIEkgdW5kZXJzdGFuZCB0aGF0Cj4+IHRoaXMgbWF5IGxvb2sgbGlrZSBh
IHJlZ3Jlc3Npb24gc2luY2UgdGhlIGNvbW1pdCByZW1vdmVkCj4+IGZ1bmN0aW9uYWxpdHksIGJ1
dCBpdCBmZWVscyBsaWtlIGEgYnVnIGZpeCB0byBtZSBzaW5jZSB0aGF0Cj4+IGZ1bmN0aW9uYWxp
dHkgc2hvdWxkIG5vdCBoYXZlIGJlZW4gZW5hYmxlZCBieSBkZWZhdWx0IGluIHRoZSBmaXJzdAo+
PiBwbGFjZS4gVGhlIGdvYWwgaGVyZSBpcyB0byBhdm9pZCBpbmFwcHJvcHJpYXRlIG9wZXJhdGlv
biBvbiB0aGUgYmFuZAo+PiB3aXRob3V0IGV4cGxpY2l0IGNvbmZpZ3VyYXRpb24gdG8gZW5hYmxl
IHN1Y2ggb3BlcmF0aW9uLiBJbiBBUAo+PiBkZXZpY2VzLCB0aGUgZGV2aWNlIHNob3VsZCBoYXZl
IGJlZW4gcHJvdmlzaW9uZWQgZm9yIGEgc3BlY2lmaWMKPj4gY291bnRyeSB0byBiZSBhYmxlIHRv
IGVuZm9yY2UgdGhlIGNvcnJlY3QgZnJlcXVlbmN5IHJhbmdlCj4+IHJlc3RyaWN0aW9ucy4gVGhl
IHNhZmUgZGVmYXVsdCBmb3IgYSBkZXZpY2UgdGhhdCBkb2VzIG5vdCBoYXZlIHN1Y2gKPj4gZXhw
bGljaXQgY29uZmlndXJhdGlvbiB3aXRoaW4gdGhlIFdMQU4gY29tcG9uZW50IGl0c2VsZiBpcyB0
byB1c2UgdGhlCj4+IHdvcmxkIHJvYW1pbmcgbW9kZSB3aGljaCBwcmV2ZW50cyBpbml0aWFsaXph
dGlvbiBvZiByYWRpYXRpb24gKGkuZS4sCj4+IGRvZXMgbm90IGFsbG93IEFQIG1vZGUgdG8gYmUg
c3RhcnRlZCBidXQgYWxsb3dzIHN0YXRpb24gbW9kZSBvcGVyYXRpb24KPj4gdG8gY29ubmVjdCB0
byBhbiBhbHJlYWR5IHN0YXJ0ZWQgQVApIG9uIHRoZSA1IEdIeiBiYW5kLgo+IFRoaXMgZXhwbGFu
YXRpb24gbWFrZXMgcGVyZmVjdCBzZW5zZSwgYnV0IGFyZSB5b3Ugc3VyZSB0aGF0IHRoYXQgaXMg
d2hhdAo+IHRoZSAweDAgcmVndWxhdG9yeSBkb21haW4gbWVhbnM/IEZvciBleGFtcGxlIHRoZSBw
YWdlcyBbMV1bMl0gc3RhdGUKPiB1bmVxdWl2b2NhbGx5IHRoYXQgMHgwIG1lYW5zIFVTLgo+Cj4g
SWYgd2UgYXNzdW1lIDB4MCA9IFVTLCBkbyB5b3UgYWdyZWUgdGhhdCBhbiBFRVBST00gcHJvZ3Jh
bW1lZCB3aXRoIDB4MAo+IHNob3VsZCBpbXBseSB0aGF0IHRoZSBkZXZpY2UgaXMgc3VpdGFibHkg
Y2FsaWJyYXRlZCBmb3Igb3BlcmF0aW9uIGluIHRoZQo+IFVuaXRlZCBTdGF0ZXMsIGFuZCBhcyBz
dWNoIHNob3VsZCBwZXJtaXQgaW5pdGlhdGluZyByYWRpYXRpb24gb24gdGhlIDUKPiBHSHogYmFu
ZCAoZXRjLik/IE9yIGhhdmUgSSBtaXNzZWQgc29tZXRoaW5nPwo+Cj4gSSBhbHNvIHRyaWVkIHRv
IGdldCB0aGUgcGF0Y2ggaW4gcXVlc3Rpb24gcmV2ZXJ0ZWQgYmFzZWQgb24gdGhpcwo+IHJhdGlv
bmFsZSwgc2VlIFszXSBmb3IgbW9yZSBpbmZvLiBJIGhvcGUgc29tZWJvZHkgY2FuIGhlbHAgY2xl
YXIgdXAgdGhpcwo+IG1pc3VuZGVyc3RhbmRpbmcsIHNpbmNlIGl0IHNlZW1zIHRvIG1lIHRoYXQg
dGhlIG1haW4gaXNzdWUgaXM6IHdoYXQgaXMKPiB0aGUgdHJ1ZSBtZWFuaW5nIG9mIDB4MD8KPgo+
IEJ0dywgdGhlIGhhcmR3YXJlIHRoYXQgRsOpbGl4IGlzIHJlZmVycmluZyB0byBkb2VzIGhhdmUg
YW4gRkNDIElEWzRdIGFuZAo+IHNlZW1zIHRvIGJlIHN1aXRhYmx5IGNlcnRpZmllZCBmb3IgdGhl
IFVTLgo+Cj4gS2luZCByZWdhcmRzLAo+IEFsdmluCj4KPiBbMV0KPiBodHRwczovL3dpcmVsZXNz
Lndpa2kua2VybmVsLm9yZy9lbi91c2Vycy9kcml2ZXJzL2F0aCN0aGVfMHgwX3JlZ3VsYXRvcnlf
ZG9tYWluCj4gWzJdCj4gaHR0cHM6Ly93ZWIuYXJjaGl2ZS5vcmcvd2ViLzIwMTUwMTE3MDQwMDIy
L2h0dHA6Ly9hcnRpY2xlLmdtYW5lLm9yZy9nbWFuZS5saW51eC5rZXJuZWwud2lyZWxlc3MuZ2Vu
ZXJhbC8zODQxMAo+IFszXQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9h
dGgxMGsvcGF0Y2gvMjAyMDA3MzAxMjQ5MjMuMjcxNDI5LTEtYWxzaUBiYW5nLW9sdWZzZW4uZGsv
Cj4gWzRdIGh0dHBzOi8vZmNjaWQuaW8vVEs0V0xFOTAwVlgKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGF0aDEwayBtYWlsaW5nIGxpc3QKPiBhdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCgpIZWxsbywgdGhpcyBpcyBub3QgY29ycmVjdC4uLgoKSSBoYXZl
IHN1Y2ggYSBjYXJkIHdpdGggMHgwIGluIHRoZSBlZXByb20KZHVlIHRvIHRoZSBwYXRjaCB0aGUg
Y29tcGxldGUgbWlkYmFuZCBpbiBzdGF0aW9uIG1vZGUgaXMgbWlzc2luZwpTbyB0aGUgY2FyZCBj
YW4ndCBzZWUgQVAncyBpbiBtaWRiYW5kIG9yIGNvbm5lY3QgdG8gQVAncyBlaXRoZXIuLi4uCgp3
aHkgYXJlIHRoZSBjYXJkcyBtYXBwZWQgdG8gMHg2NCBhbmQgbm90IDB4NmM/CgpodHRwczovL2J1
Z3MubGF1bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9saW51eC1maXJtd2FyZS8rYnVnLzE4OTUz
MzMKaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9hdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tc2cxMzA0MC5odG1sCgp0aGUgcGF0Y2ggaGFzIG1hZGUgdGhlIGNhcmQgdW51c2FibGUgZm9y
IG1lIGFuZCBJwqAgaGFkIHRvIGRlYWwKZXh0ZW5zaXZlbHkgd2l0aCB0aGUgdGhlbWF0aWNzIC4u
LgoKYW5kIHllcyBteSBjYXJkIGFsc28gaGFzIGEgRkNDIElEIGFuZCBpdCB3b3VsZCBiZSBuZXcg
dG8gbWUgdGhhdCB0aGVyZQppcyBubyBtaWRiYW5kIGluIHRoZSBVU0EuLi4KCgogwqBiZXN0IHJl
Z2FyZHMKCihzb3JyeSBmb3IgYnJlYWtpbmcgdGhlIGxpc3QpCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.codm.de ([185.95.212.174] helo=tera.codm.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifMhx-00017K-Gs
 for ath10k@lists.infradead.org; Thu, 12 Dec 2019 11:32:39 +0000
Received: from localhost (localhost [127.0.0.1])
 by tera.codm.de (Postfix) with ESMTP id E151F374A7F
 for <ath10k@lists.infradead.org>; Thu, 12 Dec 2019 12:22:37 +0100 (CET)
Received: from tera.codm.de ([127.0.0.1])
 by localhost (tera.codm.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qXHWxq7DBfPn for <ath10k@lists.infradead.org>;
 Thu, 12 Dec 2019 12:22:37 +0100 (CET)
Received: from dustins-mbp.codm.de (b2b-130-180-91-5.unitymedia.biz
 [130.180.91.5]) (Authenticated sender: dustin.utecht@codm.de)
 by tera.codm.de (Postfix) with ESMTPSA id 97CA2374A7E
 for <ath10k@lists.infradead.org>; Thu, 12 Dec 2019 12:22:37 +0100 (CET)
From: Dustin Utecht <dustin.utecht@codm.de>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: ath10k: wmi service ready event not received using QCA 9377
Message-Id: <3E3A6515-856C-42F5-ACC6-F526B8A0E69C@codm.de>
Date: Thu, 12 Dec 2019 12:22:37 +0100
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

SGVsbG8sCgpmaXJzdCBvZiBhbGwgaSBoYXZlIHRvIHNheSB0aGFuayB5b3UgZm9yIHlvdXIgZ3Jl
YXQgam9iIGFuZCB0aGUgc3VwcG9ydCEKCkl0IHNlZW1zIHdlIGhhdmUgdGhlIHNhbWUgYnVnIGFz
IGFscmVhZHkgZGVzY3JpYmVkIGhlcmU6IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVy
bWFpbC9hdGgxMGsvMjAxOS1NYXkvMDEzMzU4Lmh0bWwKV2Ugc2F3IHRoYXQgdGhlcmUgaXMgYSBG
aXggKGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9hdGgxMGsvMjAxOS1NYXkv
MDEzMzcwLmh0bWwpIGZvciBRQ0E2MTc0IHdoaWNoIGlzIGFscmVhZHkgcHVzaGVkIHRvIGdpdGh1
YiAoaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDEway1maXJtd2FyZS90cmVlL21hc3Rlci9R
Q0E2MTc0L2h3My4wKS4KCklzIHRoaXMgZml4IGFsc28gaW1wbGVtZW50ZWQgaW4gUUNBOTM3NyA/
CgoKU29tZSBpbmZvcm1hdGlvbnMgYWJvdXQgb3VyIHNldHVwOgoKV2VyZSB1c2luZyBhIE9wdGlw
bGV4IDMwNjAgKGh0dHBzOi8vd3d3LmRlbGwuY29tL2VuLWVuL3dvcmsvc2hvcC9kZXNrdG9wcy1h
bGwtaW4tb25lcy1wY3Mvb3B0aXBsZXgtMzA2MC1taWNyby1mb3JtLWZhY3Rvci9zcGQvb3B0aXBs
ZXgtMzA2MC1taWNybykgd2hpY2ggdXNlIGEgIlF1YWxjb21twq4gUUNBOTM3NyBEdWFsLWJhbmQg
MXgxIDgwMi4xMWFjIFdpcmVsZXNzIHdpdGggTVUtTUlNTyArIEJsdWV0b290aCA0LjHigJwuCldl
cmUgdXNpbmcgVWJ1bnR1IDE4LjA0IHdpdGggSFdFIGVuYWJsZWQgKHVzaW5nIGtlcm5lbCA1LjAu
MC0zNy1nZW5lcmljKS4KCk91dHB1dCBvZiBldGh0b29sIC1pIHdscDJzMDoKCmRyaXZlcjogYXRo
MTBrX3BjaQp2ZXJzaW9uOiA1LjAuMC0zNy1nZW5lcmljCmZpcm13YXJlLXZlcnNpb246IFdMQU4u
VEYuMi4xLTAwMDIxLVFDQVJNU1dQLTEKZXhwYW5zaW9uLXJvbS12ZXJzaW9uOiAKYnVzLWluZm86
IDAwMDA6MDI6MDAuMApzdXBwb3J0cy1zdGF0aXN0aWNzOiB5ZXMKc3VwcG9ydHMtdGVzdDogbm8K
c3VwcG9ydHMtZWVwcm9tLWFjY2Vzczogbm8Kc3VwcG9ydHMtcmVnaXN0ZXItZHVtcDogbm8Kc3Vw
cG9ydHMtcHJpdi1mbGFnczogbm8KCkkgaG9wZSB5b3UgY2FuIGhlbHAgdXMsIHdlIGNhbiB0ZXN0
IHBhdGNoZXMgaWYgeW91IHdpc2ghCgpraW5kIHJlZ2FyZHMsCkR1c3RpbiBVdGVjaHQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

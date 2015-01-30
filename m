Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHBvJ-00015v-GR
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 13:47:50 +0000
Received: by mail-wi0-f170.google.com with SMTP id bs8so3024332wib.1
 for <ath10k@lists.infradead.org>; Fri, 30 Jan 2015 05:47:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1422624670.1919.21.camel@sipsolutions.net>
References: <1422607287-12289-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-3-git-send-email-michal.kazior@tieto.com>
 <1422621903.1919.7.camel@sipsolutions.net>
 <CA+BoTQkdszYWbNJcV+1dDFsaSJ3aoTuC=ORUMr_aJx7_aQmcqw@mail.gmail.com>
 <1422623054.1919.18.camel@sipsolutions.net>
 <CA+BoTQnkqzHNWTFSc9VB4_itCK_+jC6HC8GmdMKiyrhu-Sz9Cg@mail.gmail.com>
 <1422624670.1919.21.camel@sipsolutions.net>
Date: Fri, 30 Jan 2015 14:47:27 +0100
Message-ID: <CA+BoTQ=YnQhjLwUU9jj_SBS_mji-pG=cYbdGtYusKC3pwVAirA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ath10k: implement chanctx API
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMzAgSmFudWFyeSAyMDE1IGF0IDE0OjMxLCBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBz
b2x1dGlvbnMubmV0PiB3cm90ZToKPiBPbiBGcmksIDIwMTUtMDEtMzAgYXQgMTQ6MjIgKzAxMDAs
IE1pY2hhbCBLYXppb3Igd3JvdGU6Cj4KPj4gWW91J2QgcHJvYmFibHkgaGF2ZSB0byBhZGQgcXVp
dGUgYSBmZXcgbXV0ZXhfbG9jayhpZmxpc3RfbXR4KSBhcm91bmQKPj4gZHJ2XyooKSBjYWxscyAo
bm90IGRpcmVjdGx5IGJ1dCBzb21ld2hlcmUgYXQgdGhlaXIgY2FsbCB0cmVlcykgdG8KPj4gZ3Vh
cmFudGVlIGRyaXZlciBjYW4gdXNlIGxvY2stZnJlZSBpdGVyYXRlKCkgdmVyc2lvbiAod2hpY2gg
ZG9lc24ndAo+PiBleGlzdCB5ZXQpLiBUaGlzIGNvdWxkIGJlIHRyaWNreS4KPgo+IFdlbGwsIEkg
d2FzIHRoaW5raW5nIHlvdSdkIG9ubHkgdXNlIGl0IGluIHNvbWUgcGxhY2VzIG5vdyAtIGJ1dCBp
dCBkb2VzCj4gc2VlbSBhIGJpdCBkaWZmaWN1bHQgdG8gbWFpbnRhaW4uCj4KPiBXZSd2ZSBub3Qg
dHlwaWNhbGx5IGhhZCB0byB3b3JyeSBhYm91dCB1c2luZyB0aGUgc3luY2hyb25vdXMgdmVyc2lv
bnMKPiBtdWNoIHNpbmNlIHdlIG1vc3RseSBqdXN0IG5lZWQgYSBzaW5nbGUgaW50ZXJmYWNlIHNv
IHdlIGp1c3QgcGFzcyBpdCBvdXQKPiBhbmQgdXNlIGl0IHRoZXJlLCBvciBzby4KCkknbSBub3Qg
c3VyZSBpZiB5b3UgcmVmZXIgdG8gaXdsd2lmaSBvciBtYWM4MDIxMSBub3c/IElmIGl0J3MgdGhl
CmxhdHRlcjogZXZlbiBpZiB5b3UgaGF2ZSBhbiBvcHMgd2l0aCwgZS5nLiB2aWYgcG9pbnRlciwg
ZHJpdmVyIG1heQpzdGlsbCBuZWVkIHRvIGl0ZXJhdGUgb3ZlciBpbnRlcmZhY2VzIGluIG9yZGVy
IHRvIHByb3BhZ2F0ZSBzb21lCnNpZGUtZWZmZWN0IGNoYW5nZXMgb3IgYWdncmVnYXRlIHNvbWUg
dmFsdWVzL3JlY2FsY3VsYXRlLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK

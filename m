Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDpcp-0000yg-OU
 for ath10k@lists.infradead.org; Wed, 21 Jan 2015 07:22:52 +0000
Received: by mail-wi0-f182.google.com with SMTP id n3so28528690wiv.3
 for <ath10k@lists.infradead.org>; Tue, 20 Jan 2015 23:22:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54BDDAD9.4010405@candelatech.com>
References: <54AEF595.9030205@candelatech.com>
 <CA+BoTQk86cnC1eRwqAbbnkMe7rDTvctH8o-JPvM3yT56nEes6g@mail.gmail.com>
 <54B00807.9060909@candelatech.com>
 <CA+BoTQ=Q-J0x1AbNNVAuwgTq1Ar8D=pki2=pWW=9upWp06h2rQ@mail.gmail.com>
 <54B56D00.4010401@candelatech.com>
 <CA+BoTQ=7BDPUs+B4-wBp5RRhKpvjHcTtbo=CFqj6e62rA+HnGA@mail.gmail.com>
 <54B6AE1E.3020900@candelatech.com>
 <CA+BoTQniiBEYnQYSp4H7yFQPT8sxG4kb3kiHsUB7SniyU_zorA@mail.gmail.com>
 <54BDDAD9.4010405@candelatech.com>
Date: Wed, 21 Jan 2015 08:22:27 +0100
Message-ID: <CA+BoTQkpDTxmwP9CFCzUmsSU0so2uaZswwOyM13a_6O88vrj9A@mail.gmail.com>
Subject: Re: Anyone seeing tx-credits 'hang'?
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

T24gMjAgSmFudWFyeSAyMDE1IGF0IDA1OjM0LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0
ZWNoLmNvbT4gd3JvdGU6Cj4gT2ssIHNvIEkgdGhpbmsgSSd2ZSBtb3N0bHkgZ290IHRoaXMgZmln
dXJlZCBvdXQuLi5hdCBsZWFzdCBlbm91Z2ggdG8KPiB3b3JrIGFyb3VuZCB0aGUgcHJvYmxlbS4K
Pgo+IEl0IHNlZW1zIHRoYXQgdGhlIGZpcm13YXJlIGFuZC9vciBOSUMgaGFyZHdhcmUgc3RvcHMg
ZG9pbmcgQ0UgaW50ZXJydXB0cwo+IGZvciB0aGUgV01JIHJpbmdzIChhdCBsZWFzdCkuICBJZiBJ
IGZvcmNlIGEgcG9sbCBvZgo+IHRoZSByaW5ncywgdGhlbiBwYWNrZXRzIGFyZSBmb3VuZCBhbmQg
bWF5IGJlIHByb2Nlc3NlZC4KClNvIHlvdSBqdXN0IGtlZXAgY2FsbGluZyBhdGgxMGtfaGlmX3Nl
bmRfY29tcGxldGVfY2hlY2soKSAob3IKYXRoMTBrX2NlX3Blcl9lbmdpbmVfc2VydmljZSkgZm9y
IHBvbGxpbmcsIHJpZ2h0PwoKCj4gSW4gb25lIGNhc2UgSSBsb29rZWQgYXQgY2xvc2VseSwgaXQg
c2VlbXMgSVJRcyB3ZW50IGF3YXkgZm9yIGFyb3VuZCAzMAo+IHNlY29uZHMsCj4gYW5kIHRoZW4g
Zm9yIG5vIG9idmlvdXMgcmVhc29uIElSUXMgZm9yIHRoZSByaW5ncyBzdGFydGVkIGJlaW5nIGRl
bGl2ZXJlZAo+IGFuZAo+IHByb2Nlc3NlZCBhZ2Fpbi4gfjIwIFdNSSBtZXNzYWdlcyB3ZXJlIHBy
b2Nlc3NlZCBkdWUgdG8gcG9sbGluZyBDRSByaW5ncyBpbgo+IHRoaXMKPiBpbnRlcnZhbC4KCk91
dCBvZiBjdXJpb3NpdHkgLSB3aGF0IGlycSBtb2RlIGFyZSB5b3UgdXNpbmc/IFNoYXJlZCBvciBN
U0k/IE9yIGRpZAp5b3UgdHJ5IGJvdGg/CgoKPiBUaGUgY29tYmluYXRpb24gb2YgV01JIGtlZXAt
YWxpdmUgbWVzc2FnZXMgc2VudCBmcm9tIGhvc3QsIGFuZAo+IHRpbWVyIHRvIGNoZWNrIGZvciB0
aW1lb3V0cyAoYW5kIGRvIENFIHBvbGxpbmcgYXQgaGlnaGVyIGludGVydmFscwo+IHdoZW4gdGlt
ZW91dCBpcyBkZXRlY3RlZCkgYXBwZWFycyB0byBiZSBlbm91Z2guICBJIGFsc28gY2hlY2sKPiBm
b3IgdGhlIElSUSB3b3JraW5nIGFnYWluIGFuZCBzdG9wIHRoZSBwb2xsaW5nIGF0IHRoYXQgdGlt
ZS4KPgo+IEkgcGxhbiB0byBjbGVhbiB0aGUgZmlybXdhcmUgY2hhbmdlcyB1cCBhbmQgY29tbWl0
IHRoZW0gdG8gbXkKPiBvd24gcmVwby4uLmJ1dCBpdCB3aWxsIHJlcXVpcmUgaG9zdCBjaGFuZ2Vz
IHRvIGVuYWJsZSB0aGUga2VlcC1hbGl2ZQo+IHRvIGZ1bGx5IHdvcmsgYXJvdW5kIHRoaXMgcHJv
YmxlbS4gIFByb2JhYmx5IG5vbmUgb2YgdGhpcyB3aWxsIG1ha2UKPiBpdCB1cHN0cmVhbS4uLi4K
CldlIGNvdWxkIGFkZCBhIHdhdGNoZG9nIHRvIFdNSSB3aGljaCB1c2VzIHRoZSBgZWNob2AgY29t
bWFuZCBhbmQgbG9vawphdCBlY2hvIGV2ZW50cyBhbmQgdHggY3JlZGl0IGNvbXBsZXRpb24gKFdN
SSBpcyBub3RpZmllZCBhYm91dCB0aGF0KS4KSW4gY2FzZSBuZWl0aGVyIGNvbWVzIGluIGluIGEg
dGltZWx5IGZhc2hpb24gKGxldHMgc2F5IDFzIHdoaWNoIGlzCmxlc3MgdGhhbiBXTUkgY29tbWFu
ZCB0aW1lb3V0IG9mIDNzKSB3ZSBzdGFydCBwb2xsaW5nIHVudGlsIHRoaW5ncwpzZXR0bGUgZG93
bi4gVGhpcyBzaG91bGQgd29yayB3aXRoIHN0YW5kYXJkIGZpcm13YXJlLCBubz8KCgpNaWNoYcWC
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsg
bWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

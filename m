Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHokv-0001Zm-GD
 for ath10k@lists.infradead.org; Wed, 22 Jul 2015 07:47:58 +0000
Received: by wicgb10 with SMTP id gb10so85581051wic.1
 for <ath10k@lists.infradead.org>; Wed, 22 Jul 2015 00:47:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFBinCBWQrf0k0vm_J68d2QdaFqWjxtEEOoqStJAEtXNgPF+tA@mail.gmail.com>
References: <CAFBinCCxWeAwpAU2Qjh3RbLX3YGxDUiVoiaTk-WEhySj6OvxFw@mail.gmail.com>
 <CA+BoTQ=HrQjvSwy0R5YDkkPLcQOi2zwiMAL0OEL2YswAASWnZQ@mail.gmail.com>
 <CAFBinCCymvnL5sTDJJQ6vEZZfchPPG=PeyrXzzt7cPqLJuUBMQ@mail.gmail.com>
 <55A44244.9000109@dd-wrt.com>
 <CA+BoTQn5rERqGT-vUKGV=Bs-rMYzx2132+BDGLTmQpWK=DJW7g@mail.gmail.com>
 <55A4E1FC.9000005@dd-wrt.com>
 <CA+BoTQkOeLarxTcOR=aeFoixP-41Jri72gM5MRqUQdNhbQoXOg@mail.gmail.com>
 <CAFBinCBN53s=wHf6428iaqj9sorQCz7XbGiT+UrhWtiYvUGH7g@mail.gmail.com>
 <CA+BoTQnhxJCt1eiUrE68PNawf5FYh96oK1o=517_UY6cE1bOjw@mail.gmail.com>
 <CAFBinCDfZZdTBJL_WcmtTVMha94SAktOF9u2-jmUvW_eces9XA@mail.gmail.com>
 <CAFBinCBWQrf0k0vm_J68d2QdaFqWjxtEEOoqStJAEtXNgPF+tA@mail.gmail.com>
Date: Wed, 22 Jul 2015 09:47:34 +0200
Message-ID: <CA+BoTQkw-DUBMxN1hSC+TRPqQ8BniFytAWRupag6Lr6wqD63Pw@mail.gmail.com>
Subject: Re: AP mode firmware crash on QCA9880-BR4A
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
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

T24gMjAgSnVseSAyMDE1IGF0IDE1OjM2LCBNYXJ0aW4gQmx1bWVuc3RpbmdsCjxtYXJ0aW4uYmx1
bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPiBPbiBNb24sIEp1bCAyMCwgMjAxNSBh
dCAyOjA2IFBNLCBNYXJ0aW4gQmx1bWVuc3RpbmdsCj4gPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29v
Z2xlbWFpbC5jb20+IHdyb3RlOgo+Pj4gSSdkIHJlY29tbWVuZCB1c2luZyB0cmFjZXNbMV0gaW5z
dGVhZCBhcyB0aGV5IHdvbid0IHN1ZmZlciBmcm9tIHRoaXMKPj4+IHByb2JsZW0uIEtlcm5lbCBs
b2cgYnVmZmVyIGlzbid0IGJpZyBlbm91Z2ggdG8gZGVidWcgZXZlcnl0aGluZyB3aXRoCj4+PiBt
ZXJlIHByaW50cy4KPiBJIG1hbmFnZWQgdG8gZ2V0IGEgdHJhY2UgZWFybGllci4gVGhlIG91dHB1
dCBpcyBxdWl0ZSBiaWcgc28gSSBhbSBub3QKPiBhdHRhY2hpbmcgaXQgdG8gdGhpcyBlbWFpbC4K
PiBZb3UgY2FuIGZpbmQgdGhlIHJlc3VsdCB3aXRoIGZpcm13YXJlIDEwLjIuNC43MC0yIGhlcmU6
IFswXQoKVGhhbmtzLgoKTm90ZTogSXQncyBiZXR0ZXIgdG8gcG9zdCB0cmFjZS5kYXQuIEl0IGNv
bnRhaW5zIG1vcmUgdXNlZnVsIGRhdGEgLQpgdHJhY2UtY21kIHJlcG9ydGAgZG9lc24ndCBkZWNv
ZGUsIGUuZy4gaGV4ZHVtcHMgdW5sZXNzIHlvdSBoYXZlIGV4dHJhCnBsdWdpbnMuCgpBbnl3YXks
IEknbSBydW5uaW5nIG91dCBvZiBpZGVhcy4gWW91IGNvdWxkIG1ha2UgYXRoMTBrIGlnbm9yZSBT
V0JBCmV2ZW50cyAoaS5lLiBub3Qgc2VuZCBiZWFjb24gY29tbWFuZHMpIGFuZCBzZWUgd2hhdCBo
YXBwZW5zLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

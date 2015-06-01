Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzL4v-00040E-AS
 for ath10k@lists.infradead.org; Mon, 01 Jun 2015 08:28:14 +0000
Received: by wgbgq6 with SMTP id gq6so107608577wgb.3
 for <ath10k@lists.infradead.org>; Mon, 01 Jun 2015 01:27:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87vbf7vr3j.fsf@kamboji.qca.qualcomm.com>
References: <CAOiWkA_i8mSx_DtW-Z8mdSiqMZcUXJp0nwCrZGkEZDWBUb3cVg@mail.gmail.com>
 <CA+BoTQnfXGLSvbx+hLfi_2w90-LgC3Uba0ZcO+Pt7J3FcEE9wg@mail.gmail.com>
 <87vbf7vr3j.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 1 Jun 2015 10:27:49 +0200
Message-ID: <CA+BoTQmmm6NA2Lb5TB9rSiXYWWarGLGaE5KFJW0_aaqz1YwR3g@mail.gmail.com>
Subject: Re: system hang with backports-20150511/20150525
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Martin Faltesek <martin.faltesek@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Marty Faltesek <mfaltesek@google.com>

T24gMSBKdW5lIDIwMTUgYXQgMDk6MTMsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gK2F0aDEwayBsaXN0Cj4+Cj4+IE9uIDEgSnVuZSAyMDE1IGF0IDAzOjM3LCBNYXJ0
eSBGYWx0ZXNlayA8bWZhbHRlc2VrQGdvb2dsZS5jb20+IHdyb3RlOgo+Pj4gU3RhcnRpbmcgd2l0
aCBiYWNrcG9ydHMtMjAxNTA1MTEsIGFuZCBjb250aW51aW5nIHdpdGgKPj4+IGJhY2twb3J0cy0y
MDE1MDUyNSwgd2Ugc2VlIGZyZXF1ZW50IHN5c3RlbSBoYW5ncy4gYmFja3BvcnRzLTIwMTUwNDI0
Cj4+PiBoYWQgbm8gaXNzdWUuCj4+Cj4+IEkgZG9uJ3Qgc2VlIHN1Y2ggYmluYXJ5IHJlbGVhc2Vz
IG9uCj4+IGh0dHBzOi8vYmFja3BvcnRzLndpa2kua2VybmVsLm9yZy9pbmRleC5waHAvTWFpbl9Q
YWdlCj4+IEhlbmNlIEkgZG9uJ3Qga25vdyB3aGF0IGtlcm5lbCB5b3UndmUgYmFja3BvcnRlZCB0
aGUgZHJpdmVycyBmcm9tIGFuZAo+PiBJIGNhbid0IGNvbXBhcmUgYW55dGhpbmcuCj4+Cj4+IENh
biB5b3UgcHJvdmlkZSBtb3JlIGRldGFpbHMsIHBsZWFzZT8KPgo+IEkgc3VzcGVjdCBpdCdzIGZy
b20gaGVyZToKPgo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5lbC9wcm9q
ZWN0cy9iYWNrcG9ydHMvMjAxNS8wNS8yNS8KPgo+IFRoZSBiYWNrcG9ydHMgcHJvamVjdCBwYWdl
cyBhcmUgYSBiaXQgY29uZnVzaW5nIGFuZCB0aGF0IGxvY2F0aW9uIGlzCj4gaGFyZCB0byBmaW5k
LgoKT2gsIHRoYW5rcyEKCkhtbS4uIFRoZXJlIHdhcyBhIHRvbiBvZiBjaGFuZ2VzIGJldHdlZW4g
MjAxNTA0MjQgYW5kIDIwMTUwNTExLiBGb3IKb25lLCBhdGgxMGsgc3RhcnRlZCB0byB1c2UgY2hh
bmN0eCBBUEkgYW5kIEZBU1RfWE1JVC4gQnV0IGl0J3Mgbm90IGEKZ2l2ZW4gdGhlc2UgdHdvIGFy
ZSB0byBibGFtZS4KClRoZSBsYXR0ZXIgY2FuIGJlIGVhc2lseSBkaXNhYmxlZCBieSByZW1vdmlu
ZwpJRUVFODAyMTFfSFdfU1VQUE9SVF9GQVNUX1hNSVQgZnJvbSBhci0+aHctPmZsYWdzIGluIGF0
aDEwaydzIG1hYy5jLgpUaGUgZm9ybWVyLi4gbm90IHNvIGVhc3kuIEknZCBiZSBhd2Vzb21lIGlm
IHlvdSBjb3VsZCBkbyBhIGdpdCBiaXNlY3QuClRoZSBjb21taXQgaWRzIGFyZSBhM2RhMGZiNihn
b29kKSBmMTcxMDdjKGJhZCkgKHlvdSBuZWVkIGxpbnV4LW5leHQKZ2l0IHJlcG8gaW5jbHVkaW5n
IGl0cyB0YWdzIGZvciB0aGVzZSBpZHMgdG8gYmUgcmVzb2x2YWJsZSkuCgoKTWljaGHFggoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

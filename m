Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggQO4-00020S-Ih
 for ath10k@lists.infradead.org; Mon, 07 Jan 2019 08:35:58 +0000
Received: by mail-qt1-x82c.google.com with SMTP id v11so46861549qtc.2
 for <ath10k@lists.infradead.org>; Mon, 07 Jan 2019 00:35:55 -0800 (PST)
MIME-Version: 1.0
References: <1542163824-795-1-git-send-email-wgong@codeaurora.org>
 <CABvG-CWg-VXAtoN8HZumW-ZdP6dX9cO_8fWJ58C22kD2yDcXdw@mail.gmail.com>
 <195f3bb0c88c43a6b1ca0ad336f947c0@aptaiexm02f.ap.qualcomm.com>
In-Reply-To: <195f3bb0c88c43a6b1ca0ad336f947c0@aptaiexm02f.ap.qualcomm.com>
From: =?UTF-8?Q?Micha=C5=82_Kazior?= <kazikcz@gmail.com>
Date: Mon, 7 Jan 2019 09:35:43 +0100
Message-ID: <CABvG-CWAfB8jjCDW4ggjJ8_YC++CjttJOMOt4s24F3mymvNR9A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw crash
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
To: Wen Gong <wgong@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

T24gTW9uLCA3IEphbiAyMDE5IGF0IDA4OjE2LCBXZW4gR29uZyA8d2dvbmdAcXRpLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4KPiA+ID4gSXQgaXMgYmVjYXVzZSB0aGUgc3RhdGUgaGFzIG5vdCBjaGFu
Z2VkIHRvIEFUSDEwS19TVEFURV9PTgo+ID4gPiBpbW1lZGlhdGVseSwgdGhlbiBpdCB3aWxsIGhh
dmUgbW9yZSB0aGFuIHR3byBzaW11bGF0ZSBjcmFzaCBwcm9jZXNzCj4gPiA+IHJ1bm5pbmcgbWVh
bndoaWxlLCBhbmQgY29tcGxldGUvd2FrZXVwIHNvbWUgZmllbGQgdHdpY2UsIGl0IGRlc3Ryb3kK
PiA+ID4gdGhlIG5vcm1hbCByZWNvdmVyeSBwcm9jZXNzLgo+ID4KPiA+IFRoaXMgd2FzIGludGVu
ZGVkIHRvIGFsbG93IHRlc3Rpbmcgbm90IG9ubHkgZmlybXdhcmUgY3Jhc2ggcGF0aCAoYW5kCj4g
PiByZWNvdmVyeSkgYnV0IGFsc28gZmlybXdhcmUgY3Jhc2ggd2hpbGUgcmVjb3ZlcmluZyBmcm9t
IGEgZmlybXdhcmUgY3Jhc2guCj4gPgo+IElmIGZpcm13YXJlIGlzIHJlY292ZXJpbmcgZnJvbSBj
cmFzaCwgdGhlbiBzaW11bGF0ZSBhIG5ldyBjcmFzaCB3aWxsIHRyaWdnZXIgZXJyb3IuCj4gU28g
cmVtb3ZlIGl0LgoKVGhhdCdzIGFjdHVhbGx5IGEgZmVhdHVyZSwgbm90IGEgYnVnLiBJZiBmaXJt
d2FyZSBjcmFzaGVzIHdoaWxlIGRyaXZlcgppcyByZXN0YXJ0aW5nIGFmdGVyIGEgY3Jhc2ggdGhl
biBpdHMgbGlrZWx5IGdvaW5nIHRvIGZhaWwgYWdhaW4gYW5kCmFnYWluIGNhdXNpbmcgYSBjcmFz
aC1yZXN0YXJ0IGxvb3Agd2hpY2ggY2FuIGFmZmVjdCBzeXN0ZW0gcGVyZm9ybWFuY2UKYW5kIHJl
c3BvbnNpdmVuZXNzLiBJdCdzIGJldHRlciB0byBnaXZlIHVwIGFuZCBsZXQgdGhlIHN5c3RlbSBh
ZG1pbgp0YWtlIG92ZXIuCgpJZiBpdCdzIHN0aWxsIGJvdGhlcmluZyB5b3UgdGhlbiBwbGVhc2Ug
Y29uc2lkZXIgYSBjcmFzaCBjb3VudGVyCnRocmVzaG9sZCBzbyB0aGF0LCBlLmcuIGFmdGVyIDUg
Y3Jhc2gtd2hpbGUtcmVzdGFydGluZyBpdCdzIGdvaW5nIHRvCmdpdmUgdXAuIEhvd2V2ZXIgSSBk
b3VidCBpdCdzIHdvcnRoIHRoZSBlZmZvcnQuIE15IGV4cGVyaWVuY2UgdGVsbHMgbWUKZmlybXdh
cmUgY3Jhc2hlcyBkdXJpbmcgcmVjb3ZlcnkgYXJlIHJhcmVseSwgaWYgYXQgYWxsLCB0cmFuc2ll
bnQuCgpUaGUgc2ltdWxhdGVkIGZ3IGNyYXNoIGlzIG5vdCByZXByZXNlbnRhdGl2ZSBoZXJlLiBJ
dCdzIGEgbWVyZSB0b29sIHRvCnRlc3QgZHJpdmVyIGNvZGUuCgoKTWljaGHFggoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

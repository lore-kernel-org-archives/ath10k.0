Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVGwy-0001NH-GW
 for ath10k@lists.infradead.org; Thu, 04 Aug 2016 11:36:36 +0000
References: <1470046905-17449-1-git-send-email-benjamin@sipsolutions.net>
 <1470046905-17449-3-git-send-email-benjamin@sipsolutions.net>
 <CA+BoTQ=cwMMQXWOd8TocVcUeV5+_0-HNFO=9a5KNr=q2vWDfgA@mail.gmail.com>
 <29736815-4728-181c-6656-527eb85c8fb3@dd-wrt.com>
 <CA+BoTQn30T9w1E63Ch51oYRJYuRBNLORy4=xAeEGzDo2yZqPbQ@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <dcd027e0-33d1-c329-73c4-8d1afb7ea080@dd-wrt.com>
Date: Thu, 4 Aug 2016 13:35:59 +0200
MIME-Version: 1.0
In-Reply-To: <CA+BoTQn30T9w1E63Ch51oYRJYuRBNLORy4=xAeEGzDo2yZqPbQ@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] ath10k: Allow setting coverage class
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Benjamin Berg <benjamin@sipsolutions.net>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Simon Wunderlich <sw@simonwunderlich.de>

QW0gMDQuMDguMjAxNiB1bSAwNzoyOCBzY2hyaWViIE1pY2hhbCBLYXppb3I6Cj4gT24gMyBBdWd1
c3QgMjAxNiBhdCAxNzozNywgU2ViYXN0aWFuIEdvdHRzY2hhbGwgPHMuZ290dHNjaGFsbEBkZC13
cnQuY29tPiB3cm90ZToKPj4+PiArICAgICAgIGlmICh2YWx1ZSA8IDApCj4+Pj4gKyAgICAgICAg
ICAgICAgIHZhbHVlID0gYXItPmZ3X2NvdmVyYWdlLmNvdmVyYWdlX2NsYXNzOwo+Pj4+ICsKPj4+
PiArICAgICAgIC8qIEJyZWFrIG91dCBpZiB0aGUgY292ZXJhZ2UgY2xhc3MgYW5kIHJlZ2lzdGVy
cyBoYXZlIHRoZQo+Pj4+IGV4cGVjdGVkCj4+Pj4gKyAgICAgICAgKiB2YWx1ZS4KPj4+PiArICAg
ICAgICAqLwo+Pj4+ICsgICAgICAgaWYgKHZhbHVlID09IGFyLT5md19jb3ZlcmFnZS5jb3ZlcmFn
ZV9jbGFzcyAmJgo+Pj4+ICsgICAgICAgICAgIHNsb3R0aW1lX3JlZyA9PSBhci0+ZndfY292ZXJh
Z2UucmVnX3Nsb3R0aW1lX2NvbmYgJiYKPj4+PiArICAgICAgICAgICB0aW1lb3V0X3JlZyA9PSBh
ci0+ZndfY292ZXJhZ2UucmVnX2Fja19jdHNfdGltZW91dF9jb25mKQo+Pj4+ICsgICAgICAgICAg
ICAgICBnb3RvIHVubG9jazsKPj4+IEkgd291bGQgbW92ZSB0aGlzIHBhcnQgdG8gdGhlIGNhbGxl
ciBhbmQga2VlcCB0aGUgaGFyZHdhcmUtc3BlY2lmaWMKPj4+IGZ1bmN0aW9uIGp1c3QgY29tcHV0
ZSBhbmQgc2V0IHJlZ2lzdGVycywgZS5nLiBoYXZlCj4+PiBhdGgxMGtfbWFjX3NldF9jb3ZlcmFn
ZV9jbGFzcyAoYXMgb3Bwb3NlZCB0bwo+Pj4gYXRoMTBrX21hY19vcF9zZXRfY292ZXJhZ2VfY2xh
c3MpLiBJdCBzaG91bGQgYWxzbyByZWR1Y2Ugc29tZSBjb2RlCj4+PiBkdXBsaWNhdGlvbi4KPj4g
ZG9lc250IG1ha2Ugc2Vuc2UuIGkgYWxyZWFkeSBlbmhhbmNlZCB0aGlzIGNvZGUgdG8gc3VwcG9y
dCBiZWVsaW5lciAoOTl4eCkKPj4gYW5kIG5ld2Vycy4KPj4gdGhlIGNvZGUgaXMgdGhhdCBtdWNo
IGRpZmZlcmVudCB0aGF0IHRoaXMgY2hlY2sgbmVlZCB0byBiZSB0cmVhZGVkIGluIGEKPj4gaW5k
aXZ1ZHVhbCB3YXkKPj4gcmVnX3Nsb3R0aW1lX2NvbmYgaXMgaGFyZHdhcmUgZGVmYWN0byBzcGVj
aWZpYyBzaW5jZSB0aGUgdmFsdWUgaXMgdGFrZW4gZnJvbQo+PiBhIGhhcmR3YXJlIHNwZWNpZmlj
IHJlZ2lzdGVyLgo+PiB5b3UgY2Fubm90IGhhbmRsZSB0aGlzIG91dHNpZGUgdGhpcyBmdW5jdGlv
biBzaW5jZSBvdGhlciBjaGlwcyBoYXZlCj4+IGRpZmZlcmVudCByZWdpc3RlcnMuCj4gQWgsIHlv
dSdyZSByaWdodCwgbXkgYmFkIDopCnRoZSBjdXJyZW50IGNvZGUgaSBzZW5kZWQgdG8gYmVuamFt
aW4gbWFrZXMgc2V2ZXJhbCBvZiB0aGVzZSB2YXJzIApvYnNvbGV0ZSBhbnl3YXkuCmp1c3Qgd2Fp
dGluZyBmb3IgaGlzIG5ldyBjbGVhbmVkIHVwIHZlcnNpb24gaGVyZSBvbiB0aGF0IGxpc3QuCgo+
Cj4KPiBNaWNoYcWCCj4KCgotLSAKTWl0IGZyZXVuZGxpY2hlbiBHcsO8c3NlbiAvIFJlZ2FyZHMK
ClNlYmFzdGlhbiBHb3R0c2NoYWxsIC8gQ1RPCgpOZXdNZWRpYS1ORVQgR21iSCAtIERELVdSVApG
aXJtZW5zaXR6OiAgQmVybGluZXIgUmluZyAxMDEsIDY0NjI1IEJlbnNoZWltClJlZ2lzdGVyZ2Vy
aWNodDogQW10c2dlcmljaHQgRGFybXN0YWR0LCBIUkIgMjU0NzMKR2VzY2jDpGZ0c2bDvGhyZXI6
IFBldGVyIFN0ZWluaMOkdXNlciwgQ2hyaXN0aWFuIFNjaGVlbGUKaHR0cDovL3d3dy5kZC13cnQu
Y29tCmVtYWlsOiBzLmdvdHRzY2hhbGxAZGQtd3J0LmNvbQpUZWwuOiArNDk2MjUxLTU4MjY1MCAv
IEZheDogKzQ5NjI1MS01ODI2NTY1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

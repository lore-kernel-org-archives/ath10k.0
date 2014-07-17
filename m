Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7e2X-0007E4-4u
 for ath10k@lists.infradead.org; Thu, 17 Jul 2014 05:15:34 +0000
Received: by mail-wg0-f48.google.com with SMTP id x13so1845356wgg.7
 for <ath10k@lists.infradead.org>; Wed, 16 Jul 2014 22:15:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53C69A32.3090305@candelatech.com>
References: <1405516873-26411-1-git-send-email-michal.kazior@tieto.com>
 <1405516873-26411-2-git-send-email-michal.kazior@tieto.com>
 <53C69A32.3090305@candelatech.com>
Date: Thu, 17 Jul 2014 07:15:07 +0200
Message-ID: <CA+BoTQ=X6GZLYmztehWp=gi6JHWZAJrOnvtB-HjbTqGfwUR4eA@mail.gmail.com>
Subject: Re: [RFC/RFT 2/2] ath10k: don't start monitor vdev for promisc
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
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Sven Schnelle <svens@stackframe.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTYgSnVseSAyMDE0IDE3OjI4LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNv
bT4gd3JvdGU6Cj4gT24gMDcvMTYvMjAxNCAwNjoyMSBBTSwgTWljaGFsIEthemlvciB3cm90ZToK
Pj4KPj4gYXRoMTBrIGRvZXNuJ3QgYXBwbHkgYW55IGV4dHJhIHJ4IGZpbHRlcnMgc28KPj4gdGhl
cmUncyBubyBuZWVkIHRvIHN0YXJ0IG1vbml0b3IgdmRldiBmb3IKPj4gcHJvbWlzY3VvdXMgbW9k
ZS4KPj4KPj4gVGhpcyBmaXhlcyBjcmFzaGVzIHdpdGggNGFkZHIgc3RhdGlvbiBpbnRlcmZhY2UK
Pj4gYnJpZGdpbmcgYW5kIHNvbWUgdmVyeSByYXJlIGNyYXNoZXMgb2YgQVAKPj4gaW50ZXJmYWNl
cyB3aXRoIGJyaWRnaW5nIGFzIHdlbGwuCj4KPgo+IEFoaCwgSSB3YXMganVzdCB3b3JraW5nIG9u
IHNvbWUgcmVsYXRlZCBoYWNrLWFyb3VuZHMgdG8gbWFrZSBzdXJlCj4gSSBsZWZ0IGEgdmRldiBz
bG90IG9wZW4gZm9yIHRoZSBtb25pdG9yIGludGVyZmFjZSBpbiBjYXNlIHNvbWUgcG9vcgo+IHBl
cnNvbiBzdGFydGVkIGEgc25pZmZlciBvbiBhbiBpbnRlcmZhY2UgYW5kIG1hZGUgaXQgZ28gcHJv
bWlzYy4uLgo+Cj4gV2l0aCB0aGlzIHBhdGNoLCBJIGNhbiBiZSBzdXJlIG1vbml0b3IgaW50ZXJm
YWNlcyB3aWxsIG5vdAo+IGJlIGF1dG9tYXRpY2FsbHkgY3JlYXRlZCB3aXRob3V0IGV4cGxpY2l0
IHVzZXIgcmVxdWVzdD8KCkknbSBub3Qgc3VyZSBpZiBJIHVuZGVyc3RhbmQgeW91IGNvcnJlY3Rs
eSwgYnV0OgoKV2l0aCB0aGlzIHBhdGNoIG1vbml0b3IgdmRldiB3aWxsIGJlIGNyZWF0ZWQgYW5k
IHN0YXJ0ZWQgb25seSBpZiB0aGVyZQppcyBhdCBsZWFzdCBvbmUgbW9uaXRvciBpbnRlcmZhY2Ug
dXAgYW5kIHJ1bm5pbmcgb3IgQ0FDIGlzIGluCnByb2dyZXNzLiBQcm9taXNjdW91cyBtb2RlIGRv
ZXMgbm90IGNoYW5nZSBkcml2ZXIgc3RhdGUgYXQgYWxsLiBJT1cgaWYKeW91IHN0YXJ0IHRjcGR1
bXAgb24gYSB3bGFuMCAoc3RhdGlvbiBpZnR5cGUpIG9yIGFkZCB3bGFuMCAoYXAgaWZ0eXBlLApz
dGEgaWZ0eXBlKSB0byBhIGJyaWRnZSB0aGVuIG1vbml0b3IgdmRldiB3aWxsIG5vdCBiZSBjcmVh
dGVkLiBZb3UKaGF2ZSB0byBpdyB3bGFuMCBpbnRlcmZhY2UgYWRkIG1vbiB0eXBlIG1vbml0b3Ig
JiYgaXAgbGluayBzZXQgbW9uIHVwCnRvIHN0YXJ0IG1vbml0b3IgdmRldi4gRnJvbSB0aGVuIG9u
IHlvdSBjYW4gdGNwZHVtcCBvciB0Y3BkdW1wIC1wIG9uCm1vbiB0byBzbmlmZiBldmVyeXRoaW5n
IHRoYXQgdGhlIGNhcmQgc2VlcyBvbiB0aGUgYWlyLgoKCj4gQW55IGlkZWEgaWYgaXQgd2lsbCBi
ZSBhIHByb2JsZW0gdG8gYXBwbHkgdGhpcyB0byB3aGF0IGlzCj4gZWZmZWN0aXZlbHkgYSAzLjE1
IGtlcm5lbD8KCkhtbS4uIEkgZ3Vlc3MgaXQgc2hvdWxkIGFwcGx5LiBUaGlzIGRlcGVuZHMgb24g
c29tZSBlYXJsaWVyIG1vbml0b3IKY2xlYW4gdXAgcGF0Y2hlcyBidXQgSSBjYW4ndCByZW1lbWJl
ciB3aGVuIHRob3NlIHdlcmUgbWVyZ2VkLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK

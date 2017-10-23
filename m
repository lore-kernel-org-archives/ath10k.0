Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6hTC-0006kh-Ex
 for ath10k@lists.infradead.org; Mon, 23 Oct 2017 18:29:04 +0000
Received: by mail-lf0-x22e.google.com with SMTP id l23so21199122lfk.10
 for <ath10k@lists.infradead.org>; Mon, 23 Oct 2017 11:28:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <9407ed1f-2bd9-3fd0-981d-1a20452e8ba9@dd-wrt.com>
References: <150851690590.5158.11970481736247725763.stgit@potku.adurom.net>
 <c9bdd915-0667-eee0-3b52-1fdf15abf249@dd-wrt.com>
 <CAGyitvP0wquoo_8_ma3rcj+riJ5Wgfo7+pmbUOx9pQRwFcQHYA@mail.gmail.com>
 <87376dds5e.fsf@kamboji.qca.qualcomm.com>
 <9407ed1f-2bd9-3fd0-981d-1a20452e8ba9@dd-wrt.com>
From: Jasmine Strong <jas@eero.com>
Date: Mon, 23 Oct 2017 11:28:18 -0700
Message-ID: <CAGyitvNj+74HafQ9Aps1HTmknTxa0ZUgV7hao1A8mJ4rV7cibw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: rebuild crypto header in RX data frames
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

VGhhdCdzIHdoYXQgSSBzYXcuICBBIGJjb20gY2xpZW50IHdhcyBhYmxlIHRvIGFzc29jaWF0ZSBh
bmQgbm90IHBhc3MKYW55IHRyYWZmaWMuICBUaGlzIGlzIG9uIGFsbCB0aHJlZSBvZiA5ODgyLCA5
ODg4IGFuZCA0MDE5LgoKT24gU3VuLCBPY3QgMjIsIDIwMTcgYXQgMzozMSBBTSwgU2ViYXN0aWFu
IEdvdHRzY2hhbGwKPHMuZ290dHNjaGFsbEBkZC13cnQuY29tPiB3cm90ZToKPiBhZnRlciBzb21l
IHRlc3RzIGkgaGF2ZSB0byBjb3JyZWN0IG15IHRlc3QKPgo+IDgwMi4xMW4gcWNhIGNoaXBzZXRz
IGNhbiBjb25uZWN0IHRvIHRoZSBhcCB3aXRob3V0IGlzc3Vlcy4gYnV0IGFub3RoZXIgOTk4NAo+
IGJhc2VkIGNoaXBzZXQgaW4gY2xpZW50IG1vZGUgaXMgYWJsZSB0byBjb25uZWN0LCBidXQgbm8g
ZGF0YSBpcyBwYXNzaW5nCj4gdGhyb3VnaC4gdGhlcmUgc2VlbXMgdG8gYmUgYSBlbmNyeXB0aW9u
IHByb2JsZW0KPiBBbSAyMS4xMC4yMDE3IHVtIDA2OjQ2IHNjaHJpZWIgS2FsbGUgVmFsbzoKPj4K
Pj4gSmFzbWluZSBTdHJvbmcgPGphc0BlZXJvLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gLS05NGViMmMx
YzFmZWFhM2FhZWEwNTVjMDNjMGNkCj4+PiBDb250ZW50LVR5cGU6IHRleHQvaHRtbDsgY2hhcnNl
dD0iVVRGLTgiCj4+PiBDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiBiYXNlNjQKPj4KPj4gQlRX
LCBJIHRoaW5rIHRoYXQgYm90aCBhdGgxMGsgYW5kIGxpbnV4LXdpcmVsZXNzIGxpc3RzIHJlamVj
dCBIVE1MIG1haWxzCj4+IHNvIG9ubHkgbWUgYW5kIFNlYmFzdGlhbiBzYXcgeW91ciBlbWFpbC4K
Pj4KPgo+IC0tCj4gTWl0IGZyZXVuZGxpY2hlbiBHcsO8c3NlbiAvIFJlZ2FyZHMKPgo+IFNlYmFz
dGlhbiBHb3R0c2NoYWxsIC8gQ1RPCj4KPiBOZXdNZWRpYS1ORVQgR21iSCAtIERELVdSVAo+IEZp
cm1lbnNpdHo6ICBTdHViZW53YWxkYWxsZWUgMjFhLCA2NDYyNSBCZW5zaGVpbQo+IFJlZ2lzdGVy
Z2VyaWNodDogQW10c2dlcmljaHQgRGFybXN0YWR0LCBIUkIgMjU0NzMKPiBHZXNjaMOkZnRzZsO8
aHJlcjogUGV0ZXIgU3RlaW5ow6R1c2VyLCBDaHJpc3RpYW4gU2NoZWVsZQo+IGh0dHA6Ly93d3cu
ZGQtd3J0LmNvbQo+IGVtYWlsOiBzLmdvdHRzY2hhbGxAZGQtd3J0LmNvbQo+IFRlbC46ICs0OTYy
NTEtNTgyNjUwIC8gRmF4OiArNDk2MjUxLTU4MjY1NjUKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDEwawo=

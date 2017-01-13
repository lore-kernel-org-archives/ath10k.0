Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRxHl-0003wV-PT
 for ath10k@lists.infradead.org; Fri, 13 Jan 2017 08:32:36 +0000
Received: by mail-qk0-x22c.google.com with SMTP id a20so47273356qkc.1
 for <ath10k@lists.infradead.org>; Fri, 13 Jan 2017 00:32:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1484292252.19860.5.camel@sipsolutions.net>
References: <1484234070-7431-1-git-send-email-michal.kazior@tieto.com>
 <1484235986.19860.1.camel@sipsolutions.net>
 <CA+BoTQkgD5umVsGnRM4uu_8GO=KjQ6MuJCjQRnSHrDuQdU4z1w@mail.gmail.com>
 <1484292252.19860.5.camel@sipsolutions.net>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Fri, 13 Jan 2017 09:32:11 +0100
Message-ID: <CA+BoTQmiJiLGQTNHxHA3vAHLJkRdZ=vZm-R9M8aQMUebv_Zwvw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: prevent sta pointer rcu violation
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

T24gMTMgSmFudWFyeSAyMDE3IGF0IDA4OjI0LCBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBz
b2x1dGlvbnMubmV0PiB3cm90ZToKPgo+PiBVbmxlc3MgeW91IHRoZW4gY29udGludWUgdG8gdXNl
IHRoYXQgc3RhIHBvaW50ZXIgYWZ0ZXIgeW91IHJlbGVhc2UKPj4gZGF0YV9sb2NrLgo+Cj4gT3Vj
aCwgb2suIFRoYXQncyByYXRoZXIgc3RyYW5nZWx5IGhpZGRlbiB0aG91Z2guCj4KPj4gQ29uc2lk
ZXIgdGhpczoKPj4KPj4gPiAgICAgICAgICBDUFUwICAgICAgICAgICAgIENQVTEKPj4gPiAxICAg
c3luY2hyb25pemVfbmV0KCkKPj4gPiAyICAgIGRydl9zdGFfc3RhdGUoKQo+PiA+IDMgICAgICAg
ICAgICAgICAgICAgICAgaHR0X2ZldGNoX2luZChwaWQsdGlkKSBjYWxsZWQKPj4gPiA0ICAgICAg
ICAgICAgICAgICAgICAgIHJjdV9yZWFkX2xvY2soKQo+PiA+IDUgICAgICAgICAgICAgICAgICAg
ICAgZ2V0KGRhdGFfbG9jaykKPj4gPiA2ICAgICAgICAgICAgICAgICAgICAgIHR4cT1wZWVyc1tw
aWRdLT5zdGEtPnR4cVt0aWRdCj4+ID4gNyAgICAgICAgICAgICAgICAgICAgICBwdXQoZGF0YV9s
b2NrKQo+PiA+IDggICAgZ2V0KGRhdGFfbG9jaykKPj4gPiA5ICAgICBwZWVyLT5zdGE9MAo+PiA+
IDEwICAgcHV0KGRhdGFfbG9jaykKPj4gPiAxMSAgICAga2ZyZWUoc3RhKQo+PiA+IDEyICAgICAg
ICAgICAgICAgICAgICAgaWVlZTgwMjExX3R4X2RlcXVldWUodHhxKQo+Pgo+PiBFdmVuIHRob3Vn
aCB0aGVyZSdzIG5vIGNvZGUgbGlrZSAoOSkgcGVyIHNlIHlvdSBjYW4gdGhpbmsgb2YgaXQgYXMK
Pj4gYW55dGhpbmcgdGhhdCB0cmllcyB0byAicmVtb3ZlIiB0aGUgcGVlci0tc3RhIGFzc29jaWF0
aW9uCj4+IChhdGgxMGtfcGVlcgo+PiBpcyByZW1vdmVkIGltcGxpY2l0bHkgdmlhIHdtaSBwZWVy
IGRlbGV0ZSBjb21tYW5kIGFuZCB3YWl0aW5nIGZvciBodHQKPj4gZXZlbnQgY29tcGxldGlvbiku
Cj4+Cj4+IEhvbGRpbmcgZGF0YV9sb2NrIGZvciB0aGUgZW50aXJlIGR1cmF0aW9uIG9mIGhhbmRs
aW5nIGZldGNoCj4+IGluZGljYXRpb24gaXNuJ3QgcmVhbGx5IGdvb2QgZm9yIHBlcmZvcm1hbmNl
IHNvIGl0J3MgYmV0dGVyIHRvIGZpeAo+PiBSQ1UgaGFuZGxpbmcuCj4KPiBZZWFoLCBJIHNlZSBp
dCBub3cgLSBhbHNvIHRoZSBjb21tZW50IHdoZXJlIHRoaXMgaGFwcGVucy4gWW91IHByb2JhYmx5
Cj4gc2hvdWxkIG1hcmsgc29tZSB0aGluZ3MgX19yY3UgdGhvdWdoIGFuZCBhY3R1YWxseSB1c2Ug
UkNVIHByaW1pdGl2ZXMsCj4gc28gdGhlIGNvZGUgaXMgYWN0dWFsbHkgdW5kZXJzdGFuZGFibGUg
OikKCkdvb2QgcG9pbnQuIEknbGwgZG8gdGhhdCBpbiBhbm90aGVyIHBhdGNoLgoKCk1pY2hhxYIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBt
YWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

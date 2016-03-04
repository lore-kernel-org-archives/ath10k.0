Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abmPN-0004d2-Ci
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 09:52:42 +0000
Received: by mail-wm0-x22d.google.com with SMTP id p65so22681786wmp.0
 for <ath10k@lists.infradead.org>; Fri, 04 Mar 2016 01:52:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87h9gmy538.fsf@kamboji.qca.qualcomm.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
 <1453384006-31907-11-git-send-email-michal.kazior@tieto.com>
 <87h9gmy538.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 4 Mar 2016 10:52:04 +0100
Message-ID: <CA+BoTQmgMBfz+Dkf-+0gDHvnhk5OA4_ZGZgwYDKXG5yP-xMRYw@mail.gmail.com>
Subject: Re: [PATCH 10/13] ath10k: implement flushing of pending frames in txqs
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gNCBNYXJjaCAyMDE2IGF0IDEwOjE3LCBWYWxvLCBLYWxsZSA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBGaXJtd2FyZSBzdXBwb3J0aW5nIHB1bGwtcHVzaCB0eCBtb2RlbCBtYXkgcmVx
dWVzdAo+PiBhIHN3aXRjaCBiZXR3ZWVuIG1vZGVzLiBXaGVuIHN3aXRjaGluZyBmcm9tCj4+IHB1
bGwtcHVzaCB0byBwdXNoLW9ubHkgaXQgd2lsbCBiZSBuZWNlc3NhcnkgdG8KPj4gZmx1c2ggYWxs
IHBlbmRpbmcgZnJhbWVzLiBUaGUgY29kZSB3aWxsIGRvIHRoYXQKPj4gb25jZSBvdGhlciBiaXRz
IHRoYXQgYWN0dWFsbHkgdHJpZ2dlciBpdCBhcmUgYWRkZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+Cj4gVGhpcyBmYWlscyB0
byBhcHBseToKPgo+IGZhdGFsOiBzaGExIGluZm9ybWF0aW9uIGlzIGxhY2tpbmcgb3IgdXNlbGVz
cyAoZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfcnguYykuCj4gUmVwb3NpdG9y
eSBsYWNrcyBuZWNlc3NhcnkgYmxvYnMgdG8gZmFsbCBiYWNrIG9uIDMtd2F5IG1lcmdlLgo+IENh
bm5vdCBmYWxsIGJhY2sgdG8gdGhyZWUtd2F5IG1lcmdlLgo+IFBhdGNoIGZhaWxlZCBhdCAwMDEw
IGF0aDEwazogaW1wbGVtZW50IGZsdXNoaW5nIG9mIHBlbmRpbmcgZnJhbWVzIGluIHR4cXMKPgo+
PiBAQCAtMjM3MCw2ICsyMzcxLDggQEAgc3RhdGljIHZvaWQgYXRoMTBrX2h0dF90eHJ4X2NvbXBs
X3Rhc2sodW5zaWduZWQgbG9uZyBwdHIpCj4+ICAgICAgICAgICAgICAgZGV2X2tmcmVlX3NrYl9h
bnkoc2tiKTsKPj4gICAgICAgfQo+Pgo+PiArICAgICBhdGgxMGtfbWFjX3R4X3B1c2hfcGVuZGlu
Zyhhcik7Cj4+ICsKPj4gICAgICAgc3Bpbl9sb2NrX2JoKCZodHQtPnJ4X3JpbmcubG9jayk7Cj4+
ICAgICAgIHdoaWxlICgoc2tiID0gX19za2JfZGVxdWV1ZSgmaHR0LT5yeF9jb21wbF9xKSkpIHsK
Pj4gICAgICAgICAgICAgICByZXNwID0gKHN0cnVjdCBodHRfcmVzcCAqKXNrYi0+ZGF0YTsKPgo+
IFRoaXMgaHVuayBzZWVtcyB0byBiZSB0aGUgcHJvYmxlbS4gSSBjb3VsZCB0cnkgdG8gZml4IGl0
IG15c2VsZiBidXQgdGhlCj4gZnVuY3Rpb24gaGFzIGNoYW5nZWQgc28gSSB3b3VsZCBwcmVmZXIg
dGhhdCB5b3UgcmVzcGluLgoKVGhpcyBwYXRjaCBpcyBpbiB2MS4gSXQncyBiYXNlIGluY2x1ZGVk
IHNvbWUgZXh0cmEgcGF0Y2hlcyB0aGF0CndlcmVuJ3QgaW4gYXRoLmdpdCBhdCB0aGUgdGltZS4K
ClRoZSB2MiBwYXRjaHNldCBoYXMgdGhpcyBwYXRjaCBzcXVhc2hlZCBpbnRvIHdha2VfdHhfcXVl
dWUgcGF0Y2ggYW5kCnRoZSBlbnRpcmUgdjIgcGF0Y2hzZXQgaXMgYmFzZWQgc29sZWx5IG9uIGF0
aC5naXQgd2l0aG91dCBhbnkgZXh0cmEKcGF0Y2hlcyBpbiBiZXR3ZWVuLiBEaWQgcGF0Y2h3b3Jr
IGNvbmZ1c2UgdGhlc2UgcGF0Y2hzZXRzPwoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9gXe-0000nB-3C
 for ath10k@lists.infradead.org; Thu, 17 Dec 2015 21:56:55 +0000
Message-ID: <56732F64.2020508@qca.qualcomm.com>
Date: Thu, 17 Dec 2015 13:55:48 -0800
From: Peter Oh <poh@qca.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add modparam 'hw_csum' to make HW checksum
 configurable
References: <1450290051-15593-1-git-send-email-poh@qca.qualcomm.com>	<5671AD10.70004@openwrt.org>	<5671C99A.703@codeaurora.org>	<5671CAF5.6010606@openwrt.org>	<5671CDBD.5060006@codeaurora.org>	<5671CF63.9040308@openwrt.org>	<5671D56F.8030903@codeaurora.org>	<5671DDA1.5030709@openwrt.org>	<5671F8B7.2060801@codeaurora.org>
 <CA+BoTQmOg3gACzk5PAtkyDo1a5WJuCauOXPZKqL+cgVi+n1HCg@mail.gmail.com>
In-Reply-To: <CA+BoTQmOg3gACzk5PAtkyDo1a5WJuCauOXPZKqL+cgVi+n1HCg@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, Peter Oh <poh@codeaurora.org>
Cc: "nbd@openwrt.org" <nbd@openwrt.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ck9uIDEyLzE2LzIwMTUgMTE6MjkgUE0sIE1pY2hhbCBLYXppb3Igd3JvdGU6Cj4gT24gMTcgRGVj
ZW1iZXIgMjAxNSBhdCAwMDo1MCwgUGV0ZXIgT2ggPHBvaEBjb2RlYXVyb3JhLm9yZz4gd3JvdGU6
Cj4+IE9uIDEyLzE2LzIwMTUgMDE6NTQgUE0sIEZlbGl4IEZpZXRrYXUgd3JvdGU6Cj4+PiBPbiAy
MDE1LTEyLTE2IDIyOjE5LCBQZXRlciBPaCB3cm90ZToKPiBbLi4uXQo+Pj4+IElmIG1lbnRpb25l
ZCB0byB1c2UgdGhlIGZ1bmN0aW9uIHRvIG1lc2ggZnJhbWUgb25seSB3aXRob3V0IHRvdWNoaW5n
Cj4+Pj4gbWFjODAyMTEsIHRoZW4gaG93IGRvIHlvdSBzdWdnZXN0IGl0IHRvIGFwcGx5IGl0IG9u
bHkgdG8gbWVzaCBmcmFtZQo+Pj4+IHdpdGhvdXQgaW50ZXJmZXJlIG90aGVyIGRhdGEgZnJhbWVz
Pwo+Pj4+IENhbiB5b3Ugc2hhcmUgeW91ciBleGFtcGxlPwo+Pj4gSXQncyB0cml2aWFsIC0gaW4g
YXRoMTBrX3R4IHlvdSBkbyB0aGlzOgo+Pj4KPj4+IGlmICh2aWYtPnR5cGUgPT0gTkw4MDIxMV9J
RlRZUEVfTUVTSF9QT0lOVCAmJgo+Pj4gICAgICAgc2tiLT5pcF9zdW1tZWQgPT0gQ0hFQ0tTVU1f
UEFSVElBTCkKPj4+ICAgICAgICAgIHNrYl9jaGVja3N1bV9oZWxwKHNrYik7Cgo+PiBUaGFuayB5
b3UgRmVsaXggZm9yIHRoZSBxdWljayByZXNwb25zZS4KPj4gSSBhZ3JlZSBvbiB5b3VyIHVzZXIg
ZXhwZXJpZW5jZSBvcGluaW9uLAo+PiBidXQgd2hhdCBkbyB5b3UgdGhpbmsgd2hlbiBhdGgxMGsg
aGFzIGEgbmV3IGNoaXAgc3VwcG9ydGluZyBIVyBjaGVja3N1bSBmb3IKPj4gTWVzaD8KPiBZb3Ug
Y2FuIHNpbXBseSBpbnRyb2R1Y2UgYSBmdy1mZWF0dXJlIGZsYWcgc2F5aW5nCj4gInN1cHBvcnRz
X21lc2hfY3N1bV9vZmZsb2FkIiBsYXRlciBhbmQgc2tpcCB0aGUgc2tiX2NoZWNrc3VtX2hlbHAo
KSBpZgo+IGl0J3Mgc2V0LgpJZiB3ZSByZWx5IG9uIGZ3LWZlYXR1cmUgZmxhZywgdGhlbiB3ZSBh
cmUgbm90IGFibGUgdG8gdXNlIEhXIGNoZWNrc3VtIAphdCBhbGwgZXZlbiBmb3IgQVAvU1RBIGlu
dGVyZmFjZXMuCgo+Cj4gTWljaGHFggpUaGFua3MsClBldGVyCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==

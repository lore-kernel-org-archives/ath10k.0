Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9T0n-0001QX-Pg
 for ath10k@lists.infradead.org; Thu, 17 Dec 2015 07:30:06 +0000
Received: by mail-wm0-x22f.google.com with SMTP id l126so8179244wml.1
 for <ath10k@lists.infradead.org>; Wed, 16 Dec 2015 23:29:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5671F8B7.2060801@codeaurora.org>
References: <1450290051-15593-1-git-send-email-poh@qca.qualcomm.com>
 <5671AD10.70004@openwrt.org> <5671C99A.703@codeaurora.org>
 <5671CAF5.6010606@openwrt.org> <5671CDBD.5060006@codeaurora.org>
 <5671CF63.9040308@openwrt.org> <5671D56F.8030903@codeaurora.org>
 <5671DDA1.5030709@openwrt.org> <5671F8B7.2060801@codeaurora.org>
Date: Thu, 17 Dec 2015 08:29:43 +0100
Message-ID: <CA+BoTQmOg3gACzk5PAtkyDo1a5WJuCauOXPZKqL+cgVi+n1HCg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add modparam 'hw_csum' to make HW checksum
 configurable
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
To: Peter Oh <poh@codeaurora.org>
Cc: Felix Fietkau <nbd@openwrt.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Peter Oh <poh@qca.qualcomm.com>

T24gMTcgRGVjZW1iZXIgMjAxNSBhdCAwMDo1MCwgUGV0ZXIgT2ggPHBvaEBjb2RlYXVyb3JhLm9y
Zz4gd3JvdGU6Cj4gT24gMTIvMTYvMjAxNSAwMTo1NCBQTSwgRmVsaXggRmlldGthdSB3cm90ZToK
Pj4gT24gMjAxNS0xMi0xNiAyMjoxOSwgUGV0ZXIgT2ggd3JvdGU6ClsuLi5dCj4+PiBJZiBtZW50
aW9uZWQgdG8gdXNlIHRoZSBmdW5jdGlvbiB0byBtZXNoIGZyYW1lIG9ubHkgd2l0aG91dCB0b3Vj
aGluZwo+Pj4gbWFjODAyMTEsIHRoZW4gaG93IGRvIHlvdSBzdWdnZXN0IGl0IHRvIGFwcGx5IGl0
IG9ubHkgdG8gbWVzaCBmcmFtZQo+Pj4gd2l0aG91dCBpbnRlcmZlcmUgb3RoZXIgZGF0YSBmcmFt
ZXM/Cj4+PiBDYW4geW91IHNoYXJlIHlvdXIgZXhhbXBsZT8KPj4KPj4gSXQncyB0cml2aWFsIC0g
aW4gYXRoMTBrX3R4IHlvdSBkbyB0aGlzOgo+Pgo+PiBpZiAodmlmLT50eXBlID09IE5MODAyMTFf
SUZUWVBFX01FU0hfUE9JTlQgJiYKPj4gICAgICBza2ItPmlwX3N1bW1lZCA9PSBDSEVDS1NVTV9Q
QVJUSUFMKQo+PiAgICAgICAgIHNrYl9jaGVja3N1bV9oZWxwKHNrYik7Cj4KPiBUaGFuayB5b3Ug
RmVsaXggZm9yIHRoZSBxdWljayByZXNwb25zZS4KPiBJIGFncmVlIG9uIHlvdXIgdXNlciBleHBl
cmllbmNlIG9waW5pb24sCj4gYnV0IHdoYXQgZG8geW91IHRoaW5rIHdoZW4gYXRoMTBrIGhhcyBh
IG5ldyBjaGlwIHN1cHBvcnRpbmcgSFcgY2hlY2tzdW0gZm9yCj4gTWVzaD8KCllvdSBjYW4gc2lt
cGx5IGludHJvZHVjZSBhIGZ3LWZlYXR1cmUgZmxhZyBzYXlpbmcKInN1cHBvcnRzX21lc2hfY3N1
bV9vZmZsb2FkIiBsYXRlciBhbmQgc2tpcCB0aGUgc2tiX2NoZWNrc3VtX2hlbHAoKSBpZgppdCdz
IHNldC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

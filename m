Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fShfY-0008Ad-Bj
 for ath10k@lists.infradead.org; Tue, 12 Jun 2018 11:41:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Update the phymode along with bandwidth change
 request
References: <1528482759-12604-1-git-send-email-ryanhsu@codeaurora.org>
 <944989ec907b98716f252524cf55e41807965253.camel@gmail.com>
Date: Tue, 12 Jun 2018 14:40:37 +0300
In-Reply-To: <944989ec907b98716f252524cf55e41807965253.camel@gmail.com>
 ("Timur \=\?utf-8\?Q\?Krist\=C3\=B3f\=22's\?\= message of "Mon,
 11 Jun 2018 18:05:53 +0200")
Message-ID: <87muw0cjwq.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Timur =?utf-8?Q?Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Ryan Hsu <ryanhsu@codeaurora.org>

VGltdXIgS3Jpc3TDs2YgPHRpbXVyLmtyaXN0b2ZAZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9uIEZy
aSwgMjAxOC0wNi0wOCBhdCAxMTozMiAtMDcwMCwgUnlhbiBIc3Ugd3JvdGU6Cj4+IEluIHRoZSBj
YXNlIG9mIFN0YXRpb24gY29ubmVjdHMgdG8gQVAgd2l0aCBuYXJyb3dlciBiYW5kd2lkdGggYXQK
Pj4gYmVnaW5uaW5nLgo+PiBBbmQgbGF0ZXIgdGhlIEFQIGNoYW5nZXMgdGhlIGJhbmR3aWR0aCB0
byB3aW5kZXIgYmFuZHdpZHRoLCB0aGUgQVAKPj4gd2lsbAo+PiBiZWFjb24gd2l0aCB3aWRlciBi
YW5kd2lkdGggSUUsIGVnIFZIVDIwLT5WSFQ0MC0+VkhUODAgb3IgVkhUNDAtCj4+ID5WSFQ4MC4K
Pj4gCj4+IFNpbmNlIHRoZSBzdXBwb3J0ZWQgQkFORFdJRFRIIHdpbGwgYmUgbGltaXRlZCBieSB0
aGUgUEhZTU9ERSwgc28KPj4gd2hpbGUKPj4gU3RhdGlvbiByZWNlaXZlcyB0aGUgYmFuZHdpZHRo
IGNoYW5nZSByZXF1ZXN0LCBpdCB3aWxsIGFsc28gbmVlZCB0bwo+PiByZWNvbmZpZ3VyZSB0aGUg
UEhZTU9ERSBzZXR0aW5nIHRvIGZpcm13YXJlIGluc3RlYWQgb2YganVzdAo+PiBjb25maWd1cmlu
Zwo+PiB0aGUgQkFORFdJRFRIIGluZm8sIG90aGVyd2lzZSBpdCdsbCB0cmlnZ2VyIGEgZmlybXdh
cmUgY3Jhc2ggd2l0aAo+PiBub24tc3VwcG9ydCBiYW5kd2lkdGguCj4+IAo+PiBUaGUgaXNzdWUg
d2FzIG9ic2VydmVkIGluIFdMQU4uUk0uNC40LjEtMDAwNTEtUUNBUk1TV1AtMSwgUUNBNjE3NAo+
PiB3aXRoCj4+IGJlbG93IHNjZW5hcmlvLgoKWy4uLl0KCj4gSSBjYW4gY29uZmlybSB0aGF0IHRo
aXMgcGF0Y2ggd29ya3Mgb24gbXkgbWFjaGluZSwgYW5kIHByZXZlbnRzIHRoZQo+IGNyYXNoIHBy
ZXZpb3VzbHkgY2F1c2VkIGJ5IGNoYW5naW5nIHRoZSBiYW5kd2lkdGguCgpHcmVhdCwgdGhhbmtz
IGEgbG90IGZvciB3b3JraW5nIG9uIHRoaXMuIEknbGwgYWRkIHlvdXIgVGVzdGVkLWJ5IHRvIHRo
ZQpjb21taXQgbG9nLgoKPiBDYW4gaXQgYmUgYWNjZXB0ZWQsIG9yIGlzIHRoZXJlIGFueXRoaW5n
IEkgY2FuIGhlbHAgd2l0aCwgdG8gZ2V0IGl0Cj4gYWNjZXB0ZWQ/CgpTdHJhbmdlbHkgSSBjYW4n
dCBmaW5kIFRpbXVyJ3MgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggZnJvbSBwYXRjaHdvcms6CgpodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8/c3Rh
dGU9KgoKTWF5YmUgaXQgZ290IGRyb3BwZWQgZHVlIHRvIHNvbWUgVVRGLTggcHJvYmxlbXM/IHBh
dGNod29yayBpcyBrbm93biB0bwpiZSBwcm9ibGVtYXRpYyB3aXRoIFVURi04LgoKQW55d2F5LCBJ
J2xsIHF1ZXVlIFJ5YW4ncyB2MiB0byA0LjE4LiBJdCBmaXJzdCBnb2VzIHRvIHRoZSBwZW5kaW5n
CmJyYW5jaCBmb3IgYnVpbGQgdGVzdGluZyBhbmQgZnJvbSB0aGVyZSB0byBhdGgtY3VycmVudCBi
cmFuY2guCgotLSAKS2FsbGUgVmFsbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

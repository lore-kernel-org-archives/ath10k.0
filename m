Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMCqs-0003zA-91
 for ath10k@lists.infradead.org; Tue, 26 Aug 2014 09:15:42 +0000
Received: by mail-wi0-f171.google.com with SMTP id hi2so3818342wib.10
 for <ath10k@lists.infradead.org>; Tue, 26 Aug 2014 02:15:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87iolf39jj.fsf@kamboji.qca.qualcomm.com>
References: <53fbf631.S4reREVxRQQKt8Ff%fengguang.wu@intel.com>
 <alpine.DEB.2.10.1408260856130.2436@hadrien>
 <87iolf39jj.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 26 Aug 2014 11:15:20 +0200
Message-ID: <CA+BoTQmyi1z-+HfX1evWL=FUhYWKL5G6x8g1uHSU_hhcG0cw0Q@mail.gmail.com>
Subject: Re: [ath6kl:ath-next-test 47/51]
 drivers/net/wireless/ath/ath10k/debug.c:169:5-8:
 Unneeded variable: "ret". Return "0" on line 178
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
Cc: Julia Lawall <julia.lawall@lip6.fr>, kbuild@01.org, kbuild test robot <fengguang.wu@intel.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>

T24gMjYgQXVndXN0IDIwMTQgMTE6MDUsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+ICsgYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKPgo+IEp1bGlhIExhd2Fs
bCA8anVsaWEubGF3YWxsQGxpcDYuZnI+IHdyaXRlczoKPgo+PiBPbiBUdWUsIDI2IEF1ZyAyMDE0
LCBrYnVpbGQgdGVzdCByb2JvdCB3cm90ZToKPj4KPj4+IHRyZWU6ICAgZ2l0Oi8vZ2l0aHViLmNv
bS9rdmFsby9hdGggYXRoLW5leHQtdGVzdAo+Pj4gaGVhZDogICAwNzcyNTZkYWYxMTFiNGRiMDc0
YWM2MDJiZWQxZTk2ZTk1ZTNhNGE0Cj4+PiBjb21taXQ6IDZiN2IyN2IxMmY0YWY2MjgzMDU5NDBj
MWMwODNiODU1OGQ3NjE4YWMgWzQ3LzUxXSBhdGgxMGs6IGltcHJvdmUgbG9nZ2luZyB0byBpbmNs
dWRlIGRldiBpZAo+Pj4gOjo6Ojo6IGJyYW5jaCBkYXRlOiAxNiBob3VycyBhZ28KPj4+IDo6Ojo6
OiBjb21taXQgZGF0ZTogMTYgaG91cnMgYWdvCj4+Pgo+Pj4gPj4gZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway9kZWJ1Zy5jOjE2OTo1LTg6IFVubmVlZGVkIHZhcmlhYmxlOiAicmV0Ii4g
UmV0dXJuICIwIiBvbiBsaW5lIDE3OAo+Pj4KPj4+IFBsZWFzZSBjb25zaWRlciBmb2xkaW5nIHRo
ZSBhdHRhY2hlZCBkaWZmIDotKQo+Pgo+PiBUaGUgdmFyaWFibGUgaXMgaW5kZWVkIG5vdCBuZWVk
ZWQuICBJIGd1ZXNzIHRoZSBmdW5jdGlvbiByZXR1cm5zIGEgdmFsdWUKPj4gZm9yIHBhcmFsbGVs
aXNtIHdpdGggYXRoMTBrX2Vyci4gIEJ1dCB0aGUgZnVuY3Rpb24gZGV2X2VyciB1c2VkIGluIHRo
YXQKPj4gZnVuY3Rpb24gcmV0dXJucyBhIHZhbHVlLCB3aGlsZSB0aGUgbWFjcm8gZGV2X3dhcm5f
cmF0ZWxpbWl0ZWQgdXNlZCBpbgo+PiB0aGlzIGZ1bmN0aW9uIGRvZXMgbm90Lgo+Cj4gT2suIElm
IGl0J3Mgb2sgZm9yIE1pY2hhbCBJJ2xsIGZvbGQgdGhlIHBhdGNoIGJlZm9yZSBJIGNvbW1pdCBp
dC4KCkknbSBva2F5IHdpdGggdGhhdC4gVGhhbmtzLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRo
MTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMGsK

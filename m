Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ftAaN-0001ga-3P
 for ath10k@lists.infradead.org; Fri, 24 Aug 2018 11:49:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Limit available channels via DT
 ieee80211-freq-limit
References: <20180730153933.3771-1-sven.eckelmann@openmesh.com>
 <5B5F5DE8.9060101@broadcom.com>
Date: Fri, 24 Aug 2018 14:46:47 +0300
In-Reply-To: <5B5F5DE8.9060101@broadcom.com> (Arend van Spriel's message of
 "Mon, 30 Jul 2018 20:50:16 +0200")
Message-ID: <87lg8whtqw.fsf@kamboji.qca.qualcomm.com>
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
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Sven Eckelmann <sven.eckelmann@openmesh.com>

QXJlbmQgdmFuIFNwcmllbCA8YXJlbmQudmFuc3ByaWVsQGJyb2FkY29tLmNvbT4gd3JpdGVzOgoK
PiArIFJhZmHFggo+Cj4gT24gNy8zMC8yMDE4IDU6MzkgUE0sIFN2ZW4gRWNrZWxtYW5uIHdyb3Rl
Ogo+PiBUcmktYmFuZCBkZXZpY2VzICgxeCAyLjRHSHogKyAyeCA1R0h6KSBvZnRlbiBpbmNvcnBv
cmF0ZSBzcGVjaWFsIGZpbHRlcnMgaW4KPj4gdGhlIFJYIGFuZCBUWCBwYXRoLiBUaGVzZSBmaWx0
ZXJlZCBjaGFubmVsIGNhbiBpbiB0aGVvcnkgc3RpbGwgYmUgdXNlZCBieQo+PiB0aGUgaGFyZHdh
cmUgYnV0IHRoZSBzaWduYWwgc3RyZW5ndGggaXMgcmVkdWNlZCBzbyBtdWNoIHRoYXQgaXQgbWFr
ZXMgbm8KPj4gc2Vuc2UuCj4+Cj4+IFRoZXJlIGlzIGFscmVhZHkgYSBEVCBwcm9wZXJ0eSB0byBs
aW1pdCB0aGUgYXZhaWxhYmxlIGNoYW5uZWxzIGJ1dCBhdGgxMGsKPj4gaGFzIHRvIG1hbnVhbGx5
IGNhbGwgdGhpcyBmdW5jdGlvbmFsaXR5IHRvIGxpbWl0IHRoZSBjdXJycmVudGx5IHNldCB3aXBo
eQo+PiBjaGFubmVscyBmdXJ0aGVyLgo+Cj4gV29uZGVyaW5nIHdoZXRoZXIgd2UgY2FuIGNhbGwg
aXQgaW4gd2lwaHlfcmVnaXN0ZXIoKSBsaWtlIGJlbG93LiBOb3QKPiBzdXJlIHdoeSB3ZSBkaWQg
bm90IGV4cGxvcmUgdGhhdCB3aXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgaXQgYnkgUmFmYcWCLgo+
IE1heWJlIGhlIHJlbWVtYmVycy4gSSBkaWQgbm90IGZpbmQgc29tZXRoaW5nIGluIHRoYXQgZGly
ZWN0aW9uIGluCj4gcGF0Y2h3b3JrLCBidXQgbWF5IGhhdmUgbWlzc2VkIGl0LiBJIGtub3cgbXQ3
NiBkcm9wcyB0aGUgYmFuZAo+IHJlZmVyZW5jZSBpZiBpdCBlbmRzIHVwIHdpdGggYWxsIGNoYW5u
ZWxzIGRpc2FibGVkLiBNYXliZSB0aGF0IHdhcyB0aGUKPiByZWFzb24uCj4KPiBSZWdhcmRzLAo+
IEFyZW5kCj4gLS0tCj4gZGlmZiAtLWdpdCBhL25ldC93aXJlbGVzcy9jb3JlLmMgYi9uZXQvd2ly
ZWxlc3MvY29yZS5jCj4gaW5kZXggYTg4NTUxZi4uMmUwMGNiMSAxMDA2NDQKPiAtLS0gYS9uZXQv
d2lyZWxlc3MvY29yZS5jCj4gKysrIGIvbmV0L3dpcmVsZXNzL2NvcmUuYwo+IEBAIC03NDIsNiAr
NzQyLDggQEAgaW50IHdpcGh5X3JlZ2lzdGVyKHN0cnVjdCB3aXBoeSAqd2lwaHkpCj4gCWlmIChy
ZXMpCj4gCQlyZXR1cm4gcmVzOwo+Cj4gKwl3aXBoeV9yZWFkX29mX2ZyZXFfbGltaXRzKHdpcGh5
KTsKPiArCj4gCS8qIHNhbml0eSBjaGVjayBzdXBwb3J0ZWQgYmFuZHMvY2hhbm5lbHMgKi8KPiAJ
Zm9yIChiYW5kID0gMDsgYmFuZCA8IE5VTV9OTDgwMjExX0JBTkRTOyBiYW5kKyspIHsKPiAJCXUx
NiB0eXBlcyA9IDA7CgpOb2JvZHkgY29tbWVudGVkIHRvIHRoaXMsIHNvIG5vdCBzdXJlIHdoYXQg
dG8gZG8uIE1heWJlIGl0J3MgYmVzdCB0bwphcHBseSBTdmVuJ3MgcGF0Y2ggbm93IGFuZCB3ZSBj
YW4gbGF0ZXIgbW92ZSB0aGUgY2FsbCB0byBjZmc4MDIxMSBpZgpuZWVkZWQuIFNvdW5kcyBnb29k
PwoKLS0gCkthbGxlIFZhbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

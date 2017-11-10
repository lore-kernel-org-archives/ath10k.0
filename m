Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eCxmm-0006aC-0G
 for ath10k@lists.infradead.org; Fri, 10 Nov 2017 01:07:12 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [Make-wifi-fast] [PATCH] ath10k: Re-enable TXQs for all devices
References: <20171109071945.11033-1-toke@toke.dk>
 <6112ae948ba2409da27709d01da567eb@NALASEXR01H.na.qualcomm.com>
 <87k1yzq9i8.fsf@toke.dk>
 <CAA93jw6yw5=ALMdRaRrGU9uySmov9HwM-mr2npRbzsSxHgSAGw@mail.gmail.com>
Date: Fri, 10 Nov 2017 03:06:41 +0200
In-Reply-To: <CAA93jw6yw5=ALMdRaRrGU9uySmov9HwM-mr2npRbzsSxHgSAGw@mail.gmail.com>
 (Dave Taht's message of "Thu, 9 Nov 2017 16:29:03 -0800")
Message-ID: <87tvy3lz6m.fsf@purkki.adurom.net>
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
To: Dave Taht <dave.taht@gmail.com>
Cc: "make-wifi-fast@lists.bufferbloat.net" <make-wifi-fast@lists.bufferbloat.net>, Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org

QWRkaW5nIGF0aDEwayBsaXN0IHRvIGdldCB0aGlzIGRpc2N1c3Npb24gdG8gdGhlIGxpc3QgYXJj
aGl2ZS4KCkRhdmUgVGFodCA8ZGF2ZS50YWh0QGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBPbiBUaHUs
IE5vdiA5LCAyMDE3IGF0IDQ6MTAgUE0sIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUB0
b2tlLmRrPiB3cm90ZToKPj4gUmFqa3VtYXIgTWFub2hhcmFuIDxybWFub2hhckBxdGkucXVhbGNv
bW0uY29tPiB3cml0ZXM6Cj4+Cj4+Pj4gQ29tbWl0IDRjYTE4MDc4MTVhYTY4MDFhYWNlZDdmZGVm
YTllZGFjYzI1MjE3NjcgZGlzYWJsZXMgdGhlIHVzZSBvZiB0aGUKPj4+PiBtYWM4MDIxMSBUWFFz
IGZvciBzb21lIGRldmljZXMgYmVjYXVzZSBvZiBhIHRoZW9yZXRpY2FsIHRocm91Z2hwdXQKPj4+
PiByZWdyZXNzaW9uLiBXZSBoYXZlIG5vdCBzZWVuIHRoaXMgcmVncmVzc2lvbiBmb3IgYSB3aGls
ZSBub3csIHNvIGl0IHNob3VsZCBiZQo+Pj4+IHNhZmUgdG8gcmUtZW5hYmxlIFRYUXMuCj4+Pj4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAdG9rZS5k
az4KPj4+PiAtLS0KPj4+PiBUaGlzIGhhcyBiZWVuIGluIExFREUgdHJ1bmsgZm9yIGEgY291cGxl
IG9mIG1vbnRocyBub3cgd2l0aCBnb29kIHJlc3VsdHMuCj4+Pj4KPj4+IFRva2UsCj4+Pgo+Pj4g
R29vZCB0byBrbm93IHRoYXQgdGhlIHBlcmZvcm1hbmNlIGRyb3AgaXMgbm90IHNlZW4gd2l0aCB0
aGUgY2hpcHMgdGhhdCBkb2VzIG5vdAo+Pj4gaGF2ZSBwdXNoLXB1bGwgc3VwcG9ydC4gVGhlIGlz
c3VlIHdhcyBvcmlnaW5hbGx5IHJlcG9ydGVkIHdpdGggYXAxNTIgKyBxY2E5ODh4Cj4+PiBieSBj
b21tdW5pdHkgWzFdLiBIb3BlIHRoaXMgY29tYmluYXRpb24gaXMgYWxzbyBjb25zaWRlcmVkIGlu
IExFREUuCj4+Cj4+IEFoLCB3YXMgdGhhdCB0aGUgb3JpZ2luYWwgYnVnIHJlcG9ydD8gVGhhbmsg
eW91LCBJIGhhdmUgbm90IGJlZW4gYWJsZSB0bwo+PiBmaW5kIHRoYXQgYW55d2hlcmUhCj4+Cj4+
IFRoZSBpc3N1ZSB0aGF0IHNlZW1zIHRvIHBvaW50IHRvIGhhcyBiZWVuIGZpeGVkIGEgd2hpbGUg
YWdvOyBJJ2xsIHNlbmQKPj4gYW5kIHVwZGF0ZWQgcGF0Y2ggd2l0aCBhIGJldHRlciBjb21taXQg
bWVzc2FnZSAoYWxzbyBmb3Jnb3QgdG8gY2MgdGhlCj4+IGF0aDEwayBsaXN0LCBJIHNlZSkuCj4+
Cj4+IC1Ub2tlCj4KPiBIbW0uIEkgcmVtZW1iZXIgdGhhdCB0aHJlYWQuIEkgdGhvdWdodCB3ZSdk
IGJhc2ljYWxseSByZXNvbHZlZCB0aGF0Cj4gaXNzdWUgKDQ1JSBvZiB0aGUgdGltZSBzcGVudCBp
biBmcV9jb2RlbF9kcm9wIHVuZGVyIHVkcCBmbG9vZCksCj4gYmFjayB0aGVuLCB3aXRoIGVyaWMg
YWRkaW5nIHRoZSBiYXRjaCBkcm9wIGZpeCB0byBmcV9jb2RlbCBpdHNlbGY6Cj4KPiBTZWUgY29t
bWl0OiBodHRwczovL29zZG4ubmV0L3Byb2plY3RzL2FuZHJvaWQteDg2L3NjbS9naXQva2VybmVs
L2NvbW1pdHMvOWQxODU2MmEyMjc4NzQyODlmZGE4Y2E1ZDExN2Q4ZjUwM2YxZGNjYQo+Cj4gd2hp
Y2ggZml4ZWQgdXAgdGhlIHByb2JsZW0gYmVhdXRpZnVsbHk6Cj4KPiBodHRwczovL2xpc3RzLmJ1
ZmZlcmJsb2F0Lm5ldC9waXBlcm1haWwvbWFrZS13aWZpLWZhc3QvMjAxNi1NYXkvMDAwNTkwLmh0
bWwKPgo+IFNvIGlmIHdlJ3ZlIGJlZW4gY2FycnlpbmcgdGhpcyBkYXJuIHBhdGNoIGZvciB0aGUg
YXRoMTBrIHZzIHNvbWV0aGluZwo+IHRoYXQgd2UnZCBhY3R1YWxseSBmaXhlZCBlbHNld2hlcmUg
aW4gdGhlIHN0YWNrLCBmb3Igb3ZlciBhIHllYXIsCj4gc2lnaC4KCi0tIApLYWxsZSBWYWxvCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

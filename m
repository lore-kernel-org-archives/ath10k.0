Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAdaU-0004Kf-SO
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 11:55:16 +0000
Received: by mail-wi0-f182.google.com with SMTP id h11so14026981wiw.3
 for <ath10k@lists.infradead.org>; Mon, 12 Jan 2015 03:54:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5492CFF5.9060107@open-mesh.com>
References: <5492CFF5.9060107@open-mesh.com>
Date: Mon, 12 Jan 2015 12:54:52 +0100
Message-ID: <CA+BoTQm1H9jAszUH_gQCjcEk-GCQG0r9r7Jb2VdpM1CQF7jXeg@mail.gmail.com>
Subject: Re: ath10k: fw_stats not reporting peer_stats with 10.2
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
To: Antonio Quartulli <antonio@open-mesh.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTggRGVjZW1iZXIgMjAxNCBhdCAxNDowMCwgQW50b25pbyBRdWFydHVsbGkgPGFudG9uaW9A
b3Blbi1tZXNoLmNvbT4gd3JvdGU6Cj4gSGVsbG8sCgpIaSwKClNvcnJ5IGZvciB0aGUgbGF0ZSBy
ZXBseS4KCgo+IChsaW5lIGdyYWJiZWQgZnJvbSBkbWVzZyBhdCBib290IHRpbWUpCj4KPiBPbiBt
eSBkZXZpY2UgSSBoYXZlIGNvbmZpZ3VyZWQgMiBBUCB2aWZzIGFuZCBmb3IgZWFjaCBvZiB0aGVt
IEkgd291bGQKPiBsaWtlIHRvIHJlYWQgdGhlIGxhc3QgVFggcmF0ZSBvZiB0aGUgYXNzb2NpYXRl
ZCBzdGF0aW9ucy4KPgo+IEFzIEkndmUgcmVhZCBvbiB3aXJlbGVzcy5rZXJuZWwub3JnIHRoaXMg
aXMgbm90IHBvc3NpYmxlIHRocm91Z2ggdGhlCj4gc3RhbmRhcmQgbmwvY2ZnODAyMTEgaW50ZXJm
YWNlIGFuZCB0aGVyZWZvcmUgSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIHJlYWQKPiAvc3lzL2tlcm5l
bC9kZWJ1Zy9pZWVlODAyMTEvcGh5MS9hdGgxMGsvZndfc3RhdHMgICwgYnV0IHRoaXMgZmlsZSBh
bHdheXMKPiByZXBvcnRzICJhdGgxMGsgUEVFUiBzdGF0cyAoMCkiIChubyBwZWVycy4uKS4KPgo+
IEkgdHJpZWQgcHJpbnRpbmcgc29tZSBkZWJ1ZyBtZXNzYWdlcyBoZXJlIGFuZCB0aGVyZSBhbmQg
dGhlIG9ubHkgdXNlZnVsCj4gaW5mb3JtYXRpb24gSSBnb3QgaXMgdGhhdCBpbiAiYXRoMTBrX3dt
aV8xMHhfcHVsbF9md19zdGF0cygpIiB0aGUgdmFsdWUKPiBvZiAiZXYtPm51bV9wZWVyX3N0YXRz
IiBpcyBhbHdheXMgMC4KPgo+IElzIHRoaXMgeWV0IGFub3RoZXIgZncgbGltaXRhdGlvbj8KCkZp
cm13YXJlIHN0YXRzIGhhcyBhIHZlcnkgZnJhZ2lsZSBBQkkuIEFwcGFyZW50bHkgMTAuMiBjaGFu
Z2VkIGl0CmFnYWluIGFuZCB0aHVzIGlzIGJyb2tlbi4gSSdsbCB0cnkgdG8gbG9vayBpbnRvIGl0
IG1vcmUgaWYgdGltZQpwZXJtaXRzLgoKCj4gSSBhbHNvIHJlYWxpemVkIHRoYXQgdXBvbiBzdGF0
aW9uIGNvbm5lY3Rpb24gYXRoMTBrIHJlY2VpdmVzIHRoZQo+IFdNSV8xMF8yX1BFRVJfUkFURUNP
REVfTElTVF9FVkVOVElEIGV2ZW50IGJ1dCBpdCBpcyBub3QgaGFuZGxlZCBhcyBubwo+IGhhbmRs
ZXIgaXMgaW1wbGVtZW50ZWQuIE1pZ2h0IGl0IGJlIHJlbGF0ZWQgd2l0aCBteSBwcm9ibGVtID8K
Ck5vLiBUaGF0J3Mgbm90IHRoZSBwcm9ibGVtLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7MKB-0001j8-PQ
 for ath10k@lists.infradead.org; Fri, 22 Mar 2019 15:43:17 +0000
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1h7MK8-0007b3-9J
 for ath10k@lists.infradead.org; Fri, 22 Mar 2019 15:43:12 +0000
Received: by mail-pf1-f197.google.com with SMTP id z26so2684799pfa.7
 for <ath10k@lists.infradead.org>; Fri, 22 Mar 2019 08:43:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: Ath10k on XPS 9380 regularly disconnects
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <87pnqknonc.fsf@codeaurora.org>
Date: Fri, 22 Mar 2019 23:43:07 +0800
Message-Id: <8ACA9157-127E-43B8-ADD0-28D9EBBCEEB0@canonical.com>
References: <042C2903-585B-47BA-8657-8819D225EEA8@canonical.com>
 <87pnqknonc.fsf@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Anthony Wong <anthony.wong@canonical.com>, ath10k@lists.infradead.org, Stephan Fabel <stephan.fabel@canonical.com>

YXQgMDE6MDUsIEthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKCj4gKyBh
dGgxMGsgbGlzdAo+IC0gbmV0ZGV2ICYgbGludXgta2VybmVsCj4KPiBLYWktSGVuZyBGZW5nIDxr
YWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+IHdyaXRlczoKPgo+PiBUaGVyZeKAmXMgYW4gaXNz
dWUgdGhhdCBhdGgxMGsgZGlzY29ubmVjdHMgYXQgcmVndWxhciBiYXNpcyBbMV0sIG9uCj4+IExp
bnV4IGtlcm5lbCA0LjE4Lgo+Pgo+PiBVbmZvcnR1bmF0ZWx5IEkgY2Fu4oCZdCByZXByb2R1Y2Ug
dGhlIGlzc3VlIG9uIFhQUyA5MzgwIGF0IG15IGhhbmQuCj4+Cj4+IElzIHRoZXJlIGFscmVhZHkg
YSBmaXggaW4gdXBzdHJlYW0ga2VybmVsPwo+Cj4gSSdtIG5vdCBhd2FyZSBvZiBhbnkgZml4ZXMg
cmVsYXRlZCB0byB0aGlzLiBJcyB0aGlzIGEgcmVncmVzc2lvbj8gSW4KPiBvdGhlciB3b3Jkcywg
aXMgdGhlcmUgYSBrbm93biB2ZXJzaW9uIG9mIGF0aDEwayBvciBmaXJtd2FyZSB3aGljaCBkaWRu
J3QKPiBoYXZlIHRoaXMgcHJvYmxlbT8KCldlIGtub3cgdGhpcyBpc3N1ZSBoYXBwZW4gb24ga2Vy
bmVsIHY0LjE1IGFuZCB2NC4xOCwgYnV0IGtlcm5lbHMgYmVmb3JlICAKdjQuMTUgd2VyZSBub3Qg
dGVzdGVkLgoKVGhlIGlzc3VlIGhhcHBlbnMgd2l0aCBHb29nbGUgTWVzaCwgd2hpY2ggaGFzIDgw
Mi4xMWFjIGNhcGFiaWxpdHkuCgpJIGhhdmVu4oCZdCBiZWVuIGFibGUgdG8gcmVwcm9kdWNlIHRo
ZSBpc3N1ZSB3aXRoIGFuIDgwMi4xMW4gcm91dGVyICh5ZXQpLgoKS2FpLUhlbmcKCj4KPj4gWzFd
IGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTgxODg4MQo+Cj4gUmVsZXZhbnQgaW5m
b3JtYXRpb24gZnJvbSBkbWVzZzoKPgo+IFsgICAxOS4zNDY4MTBdIGF0aDEwa19wY2kgMDAwMDow
MjowMC4wOiBxY2E2MTc0IGh3My4yIHRhcmdldCAweDA1MDMwMDAwICAKPiBjaGlwX2lkIDB4MDAz
NDBhZmYgc3ViIDFhNTY6MTQzYQo+IFsgICAxOS4zNDY4MTJdIGF0aDEwa19wY2kgMDAwMDowMjow
MC4wOiBrY29uZmlnIGRlYnVnIDAgZGVidWdmcyAxIHRyYWNpbmcgIAo+IDEgZGZzIDAgdGVzdG1v
ZGUgMAo+IFsgICAxOS4zNDcxMzZdIGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBmaXJtd2FyZSB2
ZXIgIAo+IFdMQU4uUk0uNC40LjEtMDAxMzItUUNBUk1TV1AtMSBhcGkgNiBmZWF0dXJlcyB3b3ds
YW4saWdub3JlLW90cCxtZnAgY3JjMzIgIAo+IDc5ZjRkYjg2Cj4KPiBbLi4uXQo+Cj4gWzc3NDUx
LjMzODMzOV0gV0FSTklORzogQ1BVOiA0IFBJRDogMCBhdCAgCj4gL2J1aWxkL2xpbnV4LWh3ZS05
S0owN3EvbGludXgtaHdlLTQuMTguMC9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0
dF9yeC5jOjQ2ICAKPiBhdGgxMGtfaHR0X3J4X3BvcF9wYWRkci5pc3JhLjI5KzB4ZDkvMHhmMCBb
YXRoMTBrX2NvcmVdCj4KPiBbLi4uXQo+Cj4gWzgxMjU0Ljg1NzY2N10gV0FSTklORzogQ1BVOiAx
IFBJRDogMCBhdCAgCj4gL2J1aWxkL2xpbnV4LWh3ZS05S0owN3EvbGludXgtaHdlLTQuMTguMC9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dF9yeC5jOjQ2ICAKPiBhdGgxMGtfaHR0
X3J4X3BvcF9wYWRkci5pc3JhLjI5KzB4ZDkvMHhmMCBbYXRoMTBrX2NvcmVdCj4KPiBbLi4uXQo+
Cj4gWzgxMzkwLjE4NjE2N10gV0FSTklORzogQ1BVOiAyIFBJRDogMCBhdCAgCj4gL2J1aWxkL2xp
bnV4LWh3ZS05S0owN3EvbGludXgtaHdlLTQuMTguMC9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL2h0dF9yeC5jOjQ2ICAKPiBhdGgxMGtfaHR0X3J4X3BvcF9wYWRkci5pc3JhLjI5KzB4
ZDkvMHhmMCBbYXRoMTBrX2NvcmVdCj4KPiAtLSAKPiBLYWxsZSBWYWxvCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK

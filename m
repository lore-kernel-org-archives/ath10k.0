Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdMfC-0007bJ-8d
 for ath10k@lists.infradead.org; Mon, 13 Feb 2017 19:51:56 +0000
Message-ID: <1487015489.19813.9.camel@sipsolutions.net>
Subject: Re: VHT 160Mhz and nss related config.
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 13 Feb 2017 20:51:29 +0100
In-Reply-To: <0f30d7bf-b710-10a8-91e6-bfd75457cf75@candelatech.com>
References: <0082a9e3-83f3-9bc3-af43-b890b91cfd93@candelatech.com>
 <1486969571.5142.3.camel@sipsolutions.net>
 <d53a8fac-b4e0-2fb2-c1e1-c537a2c5e8aa@candelatech.com>
 <1487014657.19813.3.camel@sipsolutions.net>
 <0f30d7bf-b710-10a8-91e6-bfd75457cf75@candelatech.com>
Mime-Version: 1.0
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
To: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

T24gTW9uLCAyMDE3LTAyLTEzIGF0IDExOjQyIC0wODAwLCBCZW4gR3JlZWFyIHdyb3RlOgo+IE9u
IDAyLzEzLzIwMTcgMTE6MzcgQU0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gPiAKPiA+ID4gPiBU
aGlzIHdhcyByZWNlbnRseSBhZGRlZCB0byB0aGUgVkhUIGNhcGFiaWxpdGllcyBpbiB0aGUgc3Bl
YywKPiA+ID4gPiBzZWUKPiA+ID4gPiBUYWJsZSA5LTI1MCBpbiA4MDIuMTEtMjAxNi4KPiA+ID4g
SSBkb24ndCBoYXZlIHRoYXQgc3BlYy4uLm1heWJlIHlvdSBjb3VsZCBwb3N0IGEgcGF0Y2ggdGhh
dCBhZGRzCj4gPiA+IHRoYXQKPiA+ID4gZmxhZyBhbmQvb3Igb3RoZXIgZmllbGRzIHRvIHRoZSBh
cHByb3ByaWF0ZSBoZWFkZXIgZmlsZXM/wqDCoEkgY2FuCj4gPiA+IGF0dGVtcHQgdG8gYWRkIHN1
cHBvcnQgdG8gYXRoMTBrIGFmdGVyIHRoYXQuLi4KPiA+IAo+ID4gV2UncmUgcGxhbm5pbmcgdG8s
IGJ1dCBpdCdzIG5vdCB0aGUgbW9zdCBpbXBvcnRhbnQgdGhpbmcgb24gbXkgbGlzdAo+ID4gcmln
aHQgbm93IC4uLiBJJ2xsIGNoZWNrIHdoZXJlIHRoYXQncyBhdCBub3cuCj4gPiAKPiA+IEkgY2Fu
J3QgZXZlbiBlYXNpbHkgZXhwbGFpbiBpdCwgc2luY2UgaXQncyByZWFsbHkgY29tcGxpY2F0ZWQu
Cj4gCj4gU28sIHRoaW5rIGl0IGlzIHdvcnRod2hpbGUgdG8gdXNlIHRoZSBtYXgtcngtcmF0ZSBh
cyBhIHByb3h5Cj4gdW50aWwgdGhlICdyZWFsJyBzcGVjIGlzIGltcGxlbWVudGVkP8KgwqBJZiAy
eDIgMTYwTWh6IGlzIHN1cGVyCj4gY29tcGxpY2F0ZWQsIGFuZCB5aWVsZHMgbm8gdXNlZnVsIHRo
cm91Z2hwdXQgaW1wcm92ZW1lbnQsIHRoZW4gbGlrZWx5Cj4gaXQgd2lsbCBiZSBhIGxvbmcgdGlt
ZSBiZWZvcmUgc29tZW9uZSBpbXBsZW1lbnRzIGl0IHByb3Blcmx5IEknZAo+IGd1ZXNzLgoKSSBk
b24ndCBrbm93LCBJIGhhdmVuJ3QgcmVhbGx5IGZvbGxvd2VkIHRoYXQgZGlzY3Vzc2lvbi4KCkkg
ZG9uJ3QgdGhpbmsgaW1wbGVtZW50aW5nIHRoZSBzcGVjIGhlcmUgd2lsbCBiZSByZWFsbHkgY29t
cGxpY2F0ZWQsCnRoZXJlIGFyZSBqdXN0IGEgYnVuY2ggb2YgY2FzZXMgdG8gY29uc2lkZXIgd2hl
biBwYXJzaW5nIHRoZSBWSFQKY2FwYWJpbGl0aWVzLiBJIHdvbid0IGRvIGFueXRoaW5nIHdpdGgg
bWF4IHJhdGUgaW4gbWFjODAyMTEsIGFuZCBJCmRvdWJ0IHlvdSByZWFsbHkgc2hvdWxkIGltcGxl
bWVudCBhbnkgd29ya2Fyb3VuZHMgZm9yIG5vdCBoYXZpbmcgdGhlCnNwZWMgaGVyZSBpbiB0aGUg
ZHJpdmVyIGl0c2VsZi4KCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==

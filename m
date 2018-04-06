Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4Mgq-0007d5-A2
 for ath10k@lists.infradead.org; Fri, 06 Apr 2018 08:25:45 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v12] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <20180226084406.2093-1-s.gottschall@dd-wrt.com>
 <871sftemru.fsf@kamboji.qca.qualcomm.com>
 <c4a1313a-73d2-a028-4fca-09f6fb6e56bd@dd-wrt.com>
 <de9c007f-26e3-a511-e944-91e90aac7787@dd-wrt.com>
 <1d917688-9f59-39ad-46a6-527d9e3dec03@dd-wrt.com>
 <87d0zcsqmv.fsf@codeaurora.org>
 <41fa794e-d5d5-004e-5403-1e14c77a567a@dd-wrt.com>
Date: Fri, 06 Apr 2018 11:25:29 +0300
In-Reply-To: <41fa794e-d5d5-004e-5403-1e14c77a567a@dd-wrt.com> (Sebastian
 Gottschall's message of "Fri, 6 Apr 2018 10:11:59 +0200")
Message-ID: <87sh88rbba.fsf@codeaurora.org>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

U2ViYXN0aWFuIEdvdHRzY2hhbGwgPHMuZ290dHNjaGFsbEBkZC13cnQuY29tPiB3cml0ZXM6Cgo+
IEFtIDA2LjA0LjIwMTggdW0gMTA6MDkgc2NocmllYiBLYWxsZSBWYWxvOgo+PiAoYWRkaW5nIGJh
Y2sgdGhlIGxpc3RzLCBwbGVhc2UgZG9uJ3QgdG9wIHBvc3QgYW5kIHRyaW0geW91ciBxdW90ZXMp
Cj4+Cj4+IFNlYmFzdGlhbiBHb3R0c2NoYWxsIDxzLmdvdHRzY2hhbGxAZGQtd3J0LmNvbT4gd3Jp
dGVzOgo+Pgo+Pj4gb2theS4gYXRoMTBrLWNoZWNrIGlzIGJ1Z2d5IGFuZCBkb2VzbnQgd29yay4g
c28gaXQgZG9lc250IGhlbHAgbXVjaAo+Pj4gd2l0aCBjb2RlIHN0eWxlcwo+Pj4KPj4+IHJvb3RA
c2VnLWRlc2t0b3A6L3hmcy9hdGgxMGsvYXRoLmdwaW8jIC4vYXRoMTBrLWNoZWNrCj4+PiBnbG9i
YWw6ICdkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL0tjb25maWcnIGlzIG5vdCBhIHNv
dXJjZSBmaWxlLgo+Pj4gVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgo+Pj4gIMKg
IEZpbGUgIi4vYXRoMTBrLWNoZWNrIiwgbGluZSA0NjEsIGluIDxtb2R1bGU+Cj4+PiAgwqDCoMKg
IG1haW4oKQo+Pj4gIMKgIEZpbGUgIi4vYXRoMTBrLWNoZWNrIiwgbGluZSA0NTUsIGluIG1haW4K
Pj4+ICDCoMKgwqAgcmV0ID0gcnVuX2NoZWNrcGF0Y2goYXJncykKPj4+ICDCoCBGaWxlICIuL2F0
aDEway1jaGVjayIsIGxpbmUgMjc1LCBpbiBydW5fY2hlY2twYXRjaAo+Pj4gIMKgwqDCoCBvdXRw
dXQgPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChjbWQsIHNoZWxsPVRydWUpCj4+PiAgwqAgRmls
ZSAiL3Vzci9saWIvcHl0aG9uMi43L3N1YnByb2Nlc3MucHkiLCBsaW5lIDIxOSwgaW4gY2hlY2tf
b3V0cHV0Cj4+PiAgwqDCoMKgIHJhaXNlIENhbGxlZFByb2Nlc3NFcnJvcihyZXRjb2RlLCBjbWQs
IG91dHB1dD1vdXRwdXQpCj4+PiBzdWJwcm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFu
ZCAnZ2xvYmFsIC1mCj4+PiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL0tjb25maWcn
IHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDEKPj4KPj4gWW91IGFyZSBtaXNzaW5nIGd0
YWdzLCBzZWUgJ2F0aDEway1jaGVjayAtLWhlbHAnIGZvciBob3cgdG8gaW5zdGFsbDoKPj4KPj4g
UmVxdWlyZW1lbnRzIChhbGwgYXZhaWxhYmxlIGluICRQQVRIKToKPj4KPj4gKiBnY2MKPj4gKiBz
cGFyc2UKPj4gKiBjaGVja3BhdGNoLnBsCj4+ICogZ3RhZ3MgKGZyb20gcGFja2FnZSBnbG9iYWwp
Cj4KPiBhaG0gaSBkaWQgcmVhZCB0aGlzIGFuZCB0aGlzIHdhcyBhbGwgaW5zdGFsbGVkLiBidXQg
YXRoMTBrLWNoZWNrCj4gcmVmdXNlcyB0byB3b3JrCj4KPiByb290QHNlZy1kZXNrdG9wOi9ob21l
L3NlZy9ERVYjIGd0YWdzIC0tdmVyc2lvbgo+IGd0YWdzIChHTlUgR0xPQkFMKSA2LjUuNwo+IENv
cHlyaWdodCAoYykgMTk5Ni0yMDE3IFRhbWEgQ29tbXVuaWNhdGlvbnMgQ29ycG9yYXRpb24KPiBM
aWNlbnNlIEdQTHYzKzogR05VIEdQTCB2ZXJzaW9uIDMgb3IgbGF0ZXIKPiA8aHR0cDovL3d3dy5n
bnUub3JnL2xpY2Vuc2VzL2dwbC5odG1sPgo+IFRoaXMgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGFy
ZSBmcmVlIHRvIGNoYW5nZSBhbmQgcmVkaXN0cmlidXRlIGl0Lgo+IFRoZXJlIGlzIE5PIFdBUlJB
TlRZLCB0byB0aGUgZXh0ZW50IHBlcm1pdHRlZCBieSBsYXcuCgpEYW1uLCBJIGd1ZXNzIHNvbWV0
aGluZyBoYXMgY2hhbmdlZCBpbiBndGFncyBhcyBJIHVzZSBvbGRlciB2ZXJzaW9uOgoKZ3RhZ3Mg
LSBHTlUgR0xPQkFMIDUuNy4xCgotLSAKS2FsbGUgVmFsbwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDEwawo=

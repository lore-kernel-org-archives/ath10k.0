Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4MR5-0000DO-6X
 for ath10k@lists.infradead.org; Fri, 06 Apr 2018 08:09:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v12] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <20180226084406.2093-1-s.gottschall@dd-wrt.com>
 <871sftemru.fsf@kamboji.qca.qualcomm.com>
 <c4a1313a-73d2-a028-4fca-09f6fb6e56bd@dd-wrt.com>
 <de9c007f-26e3-a511-e944-91e90aac7787@dd-wrt.com>
 <1d917688-9f59-39ad-46a6-527d9e3dec03@dd-wrt.com>
Date: Fri, 06 Apr 2018 11:09:12 +0300
In-Reply-To: <1d917688-9f59-39ad-46a6-527d9e3dec03@dd-wrt.com> (Sebastian
 Gottschall's message of "Thu, 5 Apr 2018 22:27:18 +0200")
Message-ID: <87d0zcsqmv.fsf@codeaurora.org>
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

KGFkZGluZyBiYWNrIHRoZSBsaXN0cywgcGxlYXNlIGRvbid0IHRvcCBwb3N0IGFuZCB0cmltIHlv
dXIgcXVvdGVzKQoKU2ViYXN0aWFuIEdvdHRzY2hhbGwgPHMuZ290dHNjaGFsbEBkZC13cnQuY29t
PiB3cml0ZXM6Cgo+IG9rYXkuIGF0aDEway1jaGVjayBpcyBidWdneSBhbmQgZG9lc250IHdvcmsu
IHNvIGl0IGRvZXNudCBoZWxwIG11Y2gKPiB3aXRoIGNvZGUgc3R5bGVzCj4KPiByb290QHNlZy1k
ZXNrdG9wOi94ZnMvYXRoMTBrL2F0aC5ncGlvIyAuL2F0aDEway1jaGVjawo+IGdsb2JhbDogJ2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvS2NvbmZpZycgaXMgbm90IGEgc291cmNlIGZp
bGUuCj4gVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgo+IMKgIEZpbGUgIi4vYXRo
MTBrLWNoZWNrIiwgbGluZSA0NjEsIGluIDxtb2R1bGU+Cj4gwqDCoMKgIG1haW4oKQo+IMKgIEZp
bGUgIi4vYXRoMTBrLWNoZWNrIiwgbGluZSA0NTUsIGluIG1haW4KPiDCoMKgwqAgcmV0ID0gcnVu
X2NoZWNrcGF0Y2goYXJncykKPiDCoCBGaWxlICIuL2F0aDEway1jaGVjayIsIGxpbmUgMjc1LCBp
biBydW5fY2hlY2twYXRjaAo+IMKgwqDCoCBvdXRwdXQgPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1
dChjbWQsIHNoZWxsPVRydWUpCj4gwqAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMi43L3N1YnByb2Nl
c3MucHkiLCBsaW5lIDIxOSwgaW4gY2hlY2tfb3V0cHV0Cj4gwqDCoMKgIHJhaXNlIENhbGxlZFBy
b2Nlc3NFcnJvcihyZXRjb2RlLCBjbWQsIG91dHB1dD1vdXRwdXQpCj4gc3VicHJvY2Vzcy5DYWxs
ZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ2dsb2JhbCAtZiAKPiBkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTBrL0tjb25maWcnIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDEKCllv
dSBhcmUgbWlzc2luZyBndGFncywgc2VlICdhdGgxMGstY2hlY2sgLS1oZWxwJyBmb3IgaG93IHRv
IGluc3RhbGw6CgpSZXF1aXJlbWVudHMgKGFsbCBhdmFpbGFibGUgaW4gJFBBVEgpOgoKKiBnY2MK
KiBzcGFyc2UKKiBjaGVja3BhdGNoLnBsCiogZ3RhZ3MgKGZyb20gcGFja2FnZSBnbG9iYWwpCgot
LSAKS2FsbGUgVmFsbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

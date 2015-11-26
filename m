Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1zw5-0008CJ-Gw
 for ath10k@lists.infradead.org; Thu, 26 Nov 2015 17:02:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10: Fix build with CONFIG_THERMAL=m
References: <201511260039.iQbaOe1h%fengguang.wu@intel.com>
 <1448552198-26911-1-git-send-email-mmarek@suse.com>
Date: Thu, 26 Nov 2015 19:01:42 +0200
In-Reply-To: <1448552198-26911-1-git-send-email-mmarek@suse.com> (Michal
 Marek's message of "Thu, 26 Nov 2015 16:36:38 +0100")
Message-ID: <87h9k8n18p.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Marek <mmarek@suse.com>
Cc: fengguang.wu@intel.com, linux-wireless@vger.kernel.org, kbuild-all@01.org, ath10k@lists.infradead.org, linux-kbuild@vger.kernel.org

KyBsaW51eC13aXJlbGVzcwoKTWljaGFsIE1hcmVrIDxtbWFyZWtAc3VzZS5jb20+IHdyaXRlczoK
Cj4gQWZ0ZXIgY29tbWl0IGNmNGYyMTkzOGUxMyAoImtidWlsZDogQWxsb3cgdG8gc3BlY2lmeSBj
b21wb3NpdGUgbW9kdWxlcwo+IHdpdGggbW9kbmFtZS1tIiksIHRoZXJtYWwuYyBnZXRzIGluY2x1
ZGVkIGluIHRoZSBkcml2ZXIgYW5kIHRoZSBidWlsZAo+IGZhaWxzIHdpdGgKPgo+IGRyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvdGhlcm1hbC5jOjExOTo2OiBlcnJvcjogcmVkZWZpbml0
aW9uIG9mIOKAmGF0aDEwa190aGVybWFsX2V2ZW50X3RlbXBlcmF0dXJl4oCZCj4gZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEway90aGVybWFsLmg6NTQ6MjA6IG5vdGU6IHByZXZpb3VzIGRl
ZmluaXRpb24gb2Yg4oCYYXRoMTBrX3RoZXJtYWxfZXZlbnRfdGVtcGVyYXR1cmXigJkgd2FzIGhl
cmUKPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3RoZXJtYWwuYzoxMzY6NjogZXJy
b3I6IHJlZGVmaW5pdGlvbiBvZiDigJhhdGgxMGtfdGhlcm1hbF9zZXRfdGhyb3R0bGluZ+KAmQo+
IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvdGhlcm1hbC5oOjU5OjIwOiBub3RlOiBw
cmV2aW91cyBkZWZpbml0aW9uIG9mIOKAmGF0aDEwa190aGVybWFsX3NldF90aHJvdHRsaW5n4oCZ
IHdhcyBoZXJlCj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway90aGVybWFsLmM6MTYy
OjU6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYYXRoMTBrX3RoZXJtYWxfcmVnaXN0ZXLigJkK
PiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3RoZXJtYWwuaDo0NToxOTogbm90ZTog
cHJldmlvdXMgZGVmaW5pdGlvbiBvZiDigJhhdGgxMGtfdGhlcm1hbF9yZWdpc3RlcuKAmSB3YXMg
aGVyZQo+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvdGhlcm1hbC5jOjIxNjo2OiBl
cnJvcjogcmVkZWZpbml0aW9uIG9mIOKAmGF0aDEwa190aGVybWFsX3VucmVnaXN0ZXLigJkKPiBk
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3RoZXJtYWwuaDo1MDoyMDogbm90ZTogcHJl
dmlvdXMgZGVmaW5pdGlvbiBvZiDigJhhdGgxMGtfdGhlcm1hbF91bnJlZ2lzdGVy4oCZIHdhcyBo
ZXJlCj4KPiBDaGFuZ2UgdGhlICNpZmRlZiB0byByZWZsZWN0IHRoZSBuZXcga2J1aWxkIGJlaGF2
aW9yLgo+Cj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxmZW5nZ3Vhbmcud3VAaW50
ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBNYXJlayA8bW1hcmVrQHN1c2UuY29tPgoK
UGxlYXNlIGZpeCB0aGUgc3ViamVjdCBwcmVmaXggdG8gImF0aDEwazogIiwgb3RoZXJ3aXNlIGxv
b2tzIGdvb2QuIEZlZWwKZnJlZSB0byBhcHBseSB0aGlzIHRvIHRoZSBrYnVpbGQgdHJlZS4KCkFj
a2VkLWJ5OiBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29tPgoKLS0gCkthbGxlIFZh
bG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

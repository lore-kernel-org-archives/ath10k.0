Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT1DJ-0001aG-Np
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 10:09:58 +0000
Message-ID: <1a2eb096119c9029e67caf797564d6511c8803a7.camel@sipsolutions.net>
Subject: Re: [PATCH v6 3/4] mac80211: Implement Airtime-based Queue Limit (AQL)
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 08 Nov 2019 11:09:53 +0100
In-Reply-To: <157182474287.150713.12867638269538730397.stgit@toke.dk>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474287.150713.12867638269538730397.stgit@toke.dk>
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: Kan Yan <kyan@google.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

T24gV2VkLCAyMDE5LTEwLTIzIGF0IDExOjU5ICswMjAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4gCj4gIAo+ICt2b2lkIGllZWU4MDIxMV9zdGFfdXBkYXRlX3BlbmRpbmdfYWly
dGltZShzdHJ1Y3QgaWVlZTgwMjExX2xvY2FsICpsb2NhbCwKPiArCQkJCQkgIHN0cnVjdCBzdGFf
aW5mbyAqc3RhLCB1OCBhYywKPiArCQkJCQkgIHUxNiB0eF9haXJ0aW1lLCBib29sIHR4X2NvbXBs
ZXRlZCkKPiArewo+ICsJc3Bpbl9sb2NrX2JoKCZsb2NhbC0+YWN0aXZlX3R4cV9sb2NrW2FjXSk7
Cj4gKwlpZiAodHhfY29tcGxldGVkKSB7Cj4gKwkJaWYgKHN0YSkgewo+ICsJCQlpZiAoV0FSTl9P
TkNFKHN0YS0+YWlydGltZVthY10uYXFsX3R4X3BlbmRpbmcgPCB0eF9haXJ0aW1lLAo+ICsJCQkJ
ICAgICAgIlRYUSBwZW5kaW5nIGFpcnRpbWUgdW5kZXJmbG93OiAldSwgJXUiLAo+ICsJCQkJICAg
ICAgc3RhLT5haXJ0aW1lW2FjXS5hcWxfdHhfcGVuZGluZywgdHhfYWlydGltZSkpCgpNYXliZSBh
ZGQgdGhlIFNUQS9BQyB0byB0aGUgbWVzc2FnZT8KCmpvaGFubmVzCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=

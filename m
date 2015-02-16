Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNFnZ-0000Zt-2x
 for ath10k@lists.infradead.org; Mon, 16 Feb 2015 07:08:53 +0000
Received: by mail-wi0-f173.google.com with SMTP id bs8so23855356wib.0
 for <ath10k@lists.infradead.org>; Sun, 15 Feb 2015 23:08:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87vbj3gqa3.fsf@kamboji.qca.qualcomm.com>
References: <1422611244-20767-1-git-send-email-michal.kazior@tieto.com>
 <87vbj3gqa3.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 16 Feb 2015 08:08:28 +0100
Message-ID: <CA+BoTQmtxLzHfuZ3NgwnH=ijwG=fm+oA2oCLoeo20HAD=TG9vg@mail.gmail.com>
Subject: Re: [PATCH 0/4] ath10k: implement fw stats for wmi-tlv
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTUgRmVicnVhcnkgMjAxNSBhdCAxNjoxNSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+
IHdyaXRlczoKPgo+PiBUaGVyZSBhcmUgc29tZSBzbGlnaHQgZGlmZmVyZW5jZXMgaW4gZncgc3Rh
dHMKPj4gKHNpYykgaW4gd21pLXRsdi4KPj4KPj4gRmlybXdhcmUgaGFzIGNoYW5nZWQgdGhlIHF1
ZXJ5aW5nIHNjaGVtZSBhbmQgbm8KPj4gbG9uZ2VyIHJlcXVpcmVzIHRoZSBwaW5nLXBvbmcgdG8g
Z2V0IGFsbCBzdGF0cy4KPj4gVGhlIHBhdGNoc2V0IGRvZXNuJ3QgY2hhbmdlIHRoaXMgYmVoYXZp
b3VyIHNvIHdpdGgKPj4gd21pLXRsdiBpdCdzIHBvc3NpYmxlIHRvIHNlZSB0aGUgZm9sbG93aW5n
Cj4+IHdhcm5pbmdzIHdoZW4gcmVhZGluZyBmdyBzdGF0czoKPj4KPj4gIGF0aDEwa19wY2kgMDAw
MDowMDowNi4wOiByZWNlaXZlZCB1bnNvbGljaXRlZCBzdGF0cyB1cGRhdGUgZXZlbnQKPj4KPj4g
VGhlIGxvZ2ljIGluIGF0aDEwayBzdGlsbCBwcm9kdWNlcyBjb3JyZWN0IHJlc3VsdHMKPj4gc28g
dGhpcyBpcyBoYXJtbGVzcy4KPj4KPj4gSSB3b25kZXIgaG93IHRvIGRlYWwgd2l0aCB0aGlzIGlu
IGEgc2FuZSB3YXkuIEFuCj4+IGBpZiAob3BfdmVyID09IFdNSV9UTFYpYCBpcyBhIGxpdHRsZSBi
YWQgYnV0Cj4+IGhhdmluZyBhIG5ldyBhci0+ZndfZmVhdHVyZSBmbGFnIGp1c3QgZm9yIGEgZGVi
dWcKPj4gZmFjaWxpdHkgbGlrZSB0aGlzIGlzIGEgYml0IHNpbGx5LiBPciB3ZSBjYW4ganVzdAo+
PiBkcm9wIHRoZSB3YXJuaW5nIGFuZCBsZWF2ZSBhIGNvbW1lbnQuIElkZWFzPwo+Cj4gSSB0aGlu
ayB3ZSBjb3VsZCBqdXN0IGRyb3AgdGhlIHdhcm5pbmcgYW5kIGxlYXZlIGEgY29tbWVudC4gVGhh
dAo+IHNob3VsZG4ndCBicmVhayBhbnl0aGluZywgcmlnaHQ/CgpXZSBlbmQgdXAgcGVyZm9ybWlu
ZyBhIGZldyBleHRyYSB3bWkgZXhjaGFuZ2VzIGJ1dCB0aGlzIGlzIGhhcm1sZXNzLgpIYXZpbmcg
YW4gZXh0cmEgY29uZGl0aW9uIHRvIGhhbmRsZSB0aGlzIGNsZWFubHkgd2l0aCB3bWktdGx2L3Fj
YTYxNzQKc2VlbXMgYSBiaXQgb2YgYW4gb3ZlcmtpbGwuCgpUaGUgd2FybmluZyB3YXMganVzdCBh
biBleHBsaWNpdCB3YXkgb2Ygc3BlY2lmeWluZyB3aGF0IHdlIGV4cGVjdGVkIG9mCnRoZSBmdyBz
dGF0cyBleGNoYW5nZSBsb2dpYy4gVGhlIGFzc2VydGlvbiBpcyBubyBsb25nZXIgdmFsaWQgc28g
aXQKY2FuIGdvIGF3YXkuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEw
awo=

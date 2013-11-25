Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkt9J-0001Pa-Ca
 for ath10k@lists.infradead.org; Mon, 25 Nov 2013 10:12:14 +0000
Received: by mail-wi0-f181.google.com with SMTP id hq4so3732830wib.8
 for <ath10k@lists.infradead.org>; Mon, 25 Nov 2013 02:11:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87k3fxsycw.fsf@kamboji.qca.qualcomm.com>
References: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
 <1385126819-15311-2-git-send-email-michal.kazior@tieto.com>
 <87k3fxsycw.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 25 Nov 2013 11:11:46 +0100
Message-ID: <CA+BoTQnFJzGNK7605M9XUhQK=sxhqHW=9h-ytvgcCci4Knj1ww@mail.gmail.com>
Subject: Re: [PATCH 1/3] ath10k: use nss provided by mac80211
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gMjQgTm92ZW1iZXIgMjAxMyAxNDo1MCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBDYWxjdWxhdGluZyBTVEEgTlNTIGp1c3QgZnJvbSB0aGUgcmF0ZXNldCBpcyBu
b3QKPj4gdGhlIGdyZWF0ZXN0IGlkZWEuIFRoZSBOU1MgY291bGQgYmUgcG9zc2libHkKPj4gaW5m
bHVlbmNlZCBieSBvdGhlciB0aGluZ3MgdGhhdCBvbmx5IG1hYzgwMjExCj4+IGtub3dzIGFib3V0
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRv
LmNvbT4KPgo+IElzIHRoZXJlIGEgYnVnIHdoaWNoIHRoaXMgcGF0Y2ggZml4ZXMgb3Igd2hhdCBt
b3RpdmF0ZWQgeW91IHRvIGRvIHRoaXM/CgpUaGlzIGRvZXNuJ3QgZml4IGFueSBidWcgdGhhdCBJ
IGtub3cgb2YuIEl0IGp1c3Qgc2VlbXMgbGlrZSBwcm9iYWJseQpzaG91bGQgdXNlIHJ4X25zcyBp
bnN0ZWFkIG9mIGNhbGN1bGF0aW5nIGl0IG9uIG91ciBvd24gKGluIGNhc2UKc29tZXRoaW5nIGNo
YW5nZXMgaW4gdGhlIGZ1dHVyZSkuCgpBIHN0YXRpb24gbWF5IGFjdHVhbGx5IGluY2x1ZGUgb3Bl
cmF0aW9uIG1vZGUgY2hhbmdlIG5vdGlmaWNhdGlvbiBpbgphc3NvYyByZXF1ZXN0IGRlY2xhcmlu
ZyBpdCB3YW50cyB0byB1c2UgYSBkaWZmZXJlbnQgbnVtYmVyIG9mIHN0cmVhbXMKdGhhbiBpdCBh
Y3R1YWxseSBzdXBwb3J0cyBhcyBwZXIgaXRzIG1jcyBtYXAuIFRoYXQncyBub3Qgc3VwcG9ydGVk
IGluCm1hYzgwMjExIHRob3VnaCB5ZXQuIE1hcmVrIGhhcyBwb3N0ZWQgc29tZSBwYXRjaGVzIGEg
ZmV3IGRheXMgYWdvIGJ1dAppdCBhY3R1YWxseSB1c2VzIGEgZGlmZmVyZW50IGNvZGVwYXRoIGZy
b20gd2hhdCBJIHVuZGVyc3RhbmQuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEwawo=

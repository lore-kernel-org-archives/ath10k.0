Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjOa7-0002Xv-P7
 for ath10k@lists.infradead.org; Thu, 21 Nov 2013 07:21:45 +0000
Received: by mail-wi0-f174.google.com with SMTP id ez12so831851wid.7
 for <ath10k@lists.infradead.org>; Wed, 20 Nov 2013 23:21:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <528D2BC5.7050902@elisanet.fi>
References: <87eh6i3ufk.fsf@kamboji.qca.qualcomm.com>
 <528D2BC5.7050902@elisanet.fi>
Date: Thu, 21 Nov 2013 08:21:16 +0100
Message-ID: <CA+BoTQkwQ08_xTcQ2XiBq1LYgL4u=8+qVSvMcOA_RatueUBgQQ@mail.gmail.com>
Subject: Re: Re: [PATCH] ath10k: clear tx status before submitting to mac80211
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
To: Matti Laakso <malaakso@elisanet.fi>
Cc: ath10k@lists.infradead.org

T24gMjAgTm92ZW1iZXIgMjAxMyAyMjozOCwgTWF0dGkgTGFha3NvIDxtYWxhYWtzb0BlbGlzYW5l
dC5maT4gd3JvdGU6Cj4+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3IgYXQgdGlldG8uY29t
IDxodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwaz4+IHdy
aXRlczoKPj4KPj4gPi8gR2FyYmFnZSB3YXMgcmVwb3J0ZWQgaW4gaWVlZTgwMjExX3R4X2luZm8u
IFRoaXMKPj4gLz4vIGxlZCB0byBhIFdBUk5fT04gaW4gY2ZnODAyMTFfY2FsY3VsYXRlX2JpdHJh
dGUoKS4KPj4gLz4vCj4+IC8+LyBUaGlzIGFsc28gZml4ZXMgc29tZSByYW5kb20gdHggYml0cmF0
ZSB2YWx1ZXMKPj4gLz4vIHJlcG9ydGVkIHRocm91Z2ggYGl3YCBjb21tYW5kLgo+PiAvPi8KPj4g
Lz4vIFJlcG9ydGVkLUJ5OiBLYWxsZSBWYWxvIDxrdmFsbyBhdCBxY2EucXVhbGNvbW0uY29tIDxo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwaz4+Cj4+IC8+
LyBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yIGF0IHRpZXRvLmNv
bSA8aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGs+Pgo+
PiAvCj4+IFRoYW5rcywgYXBwbGllZC4KPj4KPj4gLS0KPj4gS2FsbGUgVmFsbwo+Cj4gSSdtIHJ1
bm5pbmcgYXRoMTBrIG9uIGEgcm91dGVyLCBhbmQgY2hlcnJ5LXBpY2tpbmcgdGhpcyB0byBjdXJy
ZW50Cj4gT3BlbldydCAoMy4xMC4xOCB3aXRoIGJhY2twb3J0cyBmcm9tIGxpbnV4LW5leHQgYW5k
IHNvbWUKPiBPcGVuV3J0LXNwZWNpZmljIHBhdGNoZXMpIHByZXZlbnRzIGFsbCBzdGF0aW9ucyBm
cm9tIGFzc29jaWF0aW5nIHRvIHRoZQo+IGFjY2VzcyBwb2ludC4gQXMgZmFyIGFzIEkgY2FuIHNl
ZSB0aGlzIHBhdGNoIGRvZXNuJ3QgZGVwZW5kIG9uIGFueXRoaW5nCj4gZWxzZSBwdXNoZWQgaW4g
YmV0d2Vlbj8KCkFoLCBteSBtaXN0YWtlLiBUaGFuayB5b3UgZm9yIHRlc3RpbmcgYW5kIHJlcG9y
dGluZyBiYWNrLiBJJ2xsIHBvc3QgYQpmaXggZm9yIHRoYXQuCgoKTWljaGHFggoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

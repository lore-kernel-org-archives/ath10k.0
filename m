Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdHuu-0006ao-H9
 for ath10k@lists.infradead.org; Wed, 01 Apr 2015 12:38:45 +0000
Received: by widdi4 with SMTP id di4so43223009wid.0
 for <ath10k@lists.infradead.org>; Wed, 01 Apr 2015 05:38:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1427798961-7334-3-git-send-email-michal.kazior@tieto.com>
References: <1427798961-7334-1-git-send-email-michal.kazior@tieto.com>
 <1427798961-7334-3-git-send-email-michal.kazior@tieto.com>
Date: Wed, 1 Apr 2015 14:38:13 +0200
Message-ID: <CA+BoTQmhEf3fZSo2FPFbXa=Uc4ia0Sg2SD89gceyc8O+jVJeUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ath10k: implement more versatile set_bitrate_mask
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>

T24gMzEgTWFyY2ggMjAxNSBhdCAxMjo0OSwgTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0
aWV0by5jb20+IHdyb3RlOgo+IFVudGlsIG5vdyBvbmx5IGEgc2luZ2xlIGZpeGVkIHR4IHJhdGUg
b3IgbnNzIHdhcwo+IGFsbG93ZWQgdG8gYmUgc2V0Lgo+Cj4gVGhlIHBhdGNoIGF0dGVtcHRzIHRv
IGltcHJvdmUgdGhpcyBieSBhbGxvd2luZwo+IG1vc3QgYml0cmF0ZSBtYXNrcy4gVGhlIGxpbWl0
YXRpb24gaXMgVkhUIE1DUwo+IHJhdGVzIGNhbm5vdCBiZSBleHByZXNzZWQgc2VwYXJhdGVseSBh
bmQgb25seSB0aGUKPiBmb2xsb3dpbmcgVkhUIE1DUyByYW5nZXMgYXJlIHN1cHBvcnRlZDogbm9u
ZSwgMC03LAo+IDAtOCwgYW5kIDAtOS4KPgo+IFRoaXMga2VlcHMgdGhlIG9sZCBiZWhhdmlvdXIg
d2hlbiByZXF1ZXN0aW5nCj4gc2luZ2xlIHR4IHJhdGUgb3Igc2luZ2xlIG5zcy4gVGhlIG5ldyBi
aXRyYXRlIG1hc2sKPiBsb2dpYyBpcyBvbmx5IGFwcGxpZWQgdG8gb3RoZXIgY2FzZXMgdGhhdCB3
b3VsZAo+IHJldHVybiAtRUlOVkFMIHVudGlsIG5vdy4KPgo+IERlcGVuZGluZyBvbiBmaXJtd2Fy
ZSByZXZpc2lvbnMgc29tZSBjb21iaW5hdGlvbnMKPiBtYXkgY3Jhc2ggZmlybXdhcmUgc28gdXNl
IHdpdGggY2FyZSwgcGxlYXNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8bWlj
aGFsLmthemlvckB0aWV0by5jb20+Cj4gLS0tCgpIaSBLYWxsZSwKCkRyb3AgdGhpcyBwYXRjaCAo
WzIvMl0pIGZvciBub3csIHBsZWFzZS4gSXQgbG9va3MgbGlrZSBpdCBkb2Vzbid0IHdvcmsKd2Vs
bCB3aXRoIGNyeXB0byBuZXR3b3Jrcy4gSSdsbCBuZWVkIHRvIHJld29yayB0aGlzLiBUaGUgWzEv
Ml0gaXMgZmluZQphcyBpdCBpcyB0aG91Z2guCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22b.google.com ([2a00:1450:4008:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9Bl0-00032G-He
 for ath10k@lists.infradead.org; Tue, 13 Aug 2013 10:23:19 +0000
Received: by mail-bk0-f43.google.com with SMTP id mz13so2249332bkb.16
 for <ath10k@lists.infradead.org>; Tue, 13 Aug 2013 03:22:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376373578-2180-3-git-send-email-michal.kazior@tieto.com>
References: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
 <1376373578-2180-1-git-send-email-michal.kazior@tieto.com>
 <1376373578-2180-3-git-send-email-michal.kazior@tieto.com>
Date: Tue, 13 Aug 2013 12:22:51 +0200
Message-ID: <CA+BoTQ=5HwVpbWWBw_iRBhZ=yC_33buEdZ10=cU_7UJzQo=_kg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ath10k: fix HTC endpoint worker starvation
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

T24gMTMgQXVndXN0IDIwMTMgMDc6NTksIE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGll
dG8uY29tPiB3cm90ZToKPiBIVEMgdXNlZCBhIHdvcmtlciBmb3IgZWFjaCBlbmRwb2ludC4gVGhp
cyB3b3JrZWQKPiB1bnRpbCBhIHNsb3cgaG9zdCBtYWNoaW5lIHdhcyBmbG9vZGVkIHdpdGggbWFz
c2l2ZQo+IG51bWJlciBvZiBUWCByZXF1ZXN0cy4gSFRUIHJlbGF0ZWQgd29ya2VyIHdvdWxkCj4g
cmVtYWluIGFjdGl2ZSB3aGlsZSBXTUkgd29ya2VyIHdhcyBzdGFydmVkLiBUaGlzCj4gZW5kZWQg
dXAgd2l0aCAiY291bGQgbm90IHNlbmQgYmVhY29uIiBpbiBBUCBtb2RlLgo+IEl0IHdhcyBldmVu
IHBvc3NpYmxlIHRvIHNlZSB1c2Vyc3BhY2UgYmVpbmcKPiBzdGFydmVkLgo+Cj4gVGhlIHBhdGNo
IHN3aXRjaGVzIGZyb20gdXNpbmcgd29ya2VycyB0byB1c2luZwo+IHRhc2tsZXRzIGZvciBwcm9j
ZXNzaW5nIGFuZCBzdWJtaXR0aW5nIEhUQyBmcmFtZXMKPiB0byBISUYuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KCkknZCBsaWtlIGRy
b3AgdGhpcyBwYXRjaCwgYXQgbGVhc3QgZm9yIG5vdy4gSSdtIGhhdmluZyBkb3VidHMgdGhpcyBp
cwp0aGUgcmlnaHQgd2F5IHRvIHNvbHZlIHRoZSBwcm9ibGVtLgoKClBvemRyYXdpYW0gLyBCZXN0
IHJlZ2FyZHMsCk1pY2hhxYIgS2F6aW9yLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEw
awo=

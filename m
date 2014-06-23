Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x233.google.com ([2a00:1450:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz3CJ-000428-Nu
 for ath10k@lists.infradead.org; Mon, 23 Jun 2014 12:18:09 +0000
Received: by mail-we0-f179.google.com with SMTP id w62so6991654wes.10
 for <ath10k@lists.infradead.org>; Mon, 23 Jun 2014 05:17:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1403524278.4418.19.camel@jlt4.sipsolutions.net>
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400767955-16313-3-git-send-email-michal.kazior@tieto.com>
 <1400769683.4174.25.camel@jlt4.sipsolutions.net>
 <CA+BoTQk=DU=-HzVo-XsQTpCt6CS7aXxQMy5hTyQ7qC56ebBLZQ@mail.gmail.com>
 <1403524278.4418.19.camel@jlt4.sipsolutions.net>
Date: Mon, 23 Jun 2014 14:17:43 +0200
Message-ID: <CA+BoTQ=fpkOZXVgJt-OWdgSFX1_sO1g1E=J-7NnOb+e6a30FVA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: make core registering async
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjMgSnVuZSAyMDE0IDEzOjUxLCBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBzb2x1dGlv
bnMubmV0PiB3cm90ZToKPiBIaSwKPgo+PiAgW3dvcmtlcl0KPj4gIGNvbXBsZXRlX2FsbCgpCj4+
ICBkZXZpY2VfcmVsZWFzZV9kcml2ZXIoKQo+PiAgZGV2X2xvY2soKQo+PiAge2FscmVhZHkgaGVs
ZCwgeWllbGR9Cj4+ICBbc3lzY2FsbF0KPj4gIGZyZWUoaW50ZXJuYWwgc3RydWN0dXJlcykKPj4g
IGRldl91bmxvY2soKQo+PiAgcmV0dXJuCj4+ICBbd29ya2VyXQo+PiAge3dva2VuIHVwLCBidXQg
ZGV2LT5kcml2ZXIgPT0gTlVMTCBzbyBubyBjYWxsYmFja3N9Cj4+ICBkZXZfdW5sb2NrKCkKPj4g
IHJldHVybgo+Pgo+PiBUaGUgZHJpdmVyIGNvZGUgc2VjdGlvbiBtYXkgbm90IGJlIHJlYWNoYWJs
ZSBhbnltb3JlIHVwb24gd29ya2VyCj4+IHJldHVybmluZyBmcm9tIHRoZSBkZXZpY2VfcmVsZWFz
ZV9kcml2ZXIoKSBjYWxsLCByaWdodD8gQWxzbyBzaW5jZQo+PiBhdGgxMGsgdXNlcyBhbiBpbnRl
cm5hbCB3b3JrZXIgaXQgYWxzbyBtZWFucyB0aGUgd29ya19zdHJ1Y3Qgd291bGQgYmUKPj4gYWxy
ZWFkeSBmcmVlZCBieSB0aGUgc3lzY2FsbCBmbG93IChpLmUuIHdvcmtlciB3b3VsZCBydW4gYWZ0
ZXIgZHJpdmVyCj4+IGhhcyBzdXBwb3NlZGx5IGJlZW4gY2xlYW5lZCB1cC4uKS4gRXZlbiBpZiBh
dGgxMGsgd2FzIHRvIHVzZQo+PiByZXF1ZXN0X2Zpcm13YXJlX25vd2FpdCgpLCB3aGljaCBhbGxv
Y2F0ZXMgYSB0ZW1wb3Jhcnkgd29ya19zdHJ1Y3QsCj4+IHRoZSB1bnJlYWNoYWJsZSBjb2RlIHNl
Y3Rpb24gc3RpbGwgcmVtYWlucyBhIHByb2JsZW0uCj4+Cj4+IE9yIG1heWJlIHRoaXMgaXNuJ3Qg
cmVhbGx5IGEgcHJvYmxlbSBhbmQvb3IgSSdtIG1pc3Npbmcgc29tZXRoaW5nPwo+Cj4gWWVhaCwg
aG1tLCB0aGlzIGxvb2tzIGxpa2UgYSBwcm9ibGVtLiBJIGd1ZXNzIHdlIGRpZG4ndCByZWFsbHkg
Y29uc2lkZXIKPiBtb2R1bGUgdW5sb2FkIGluIHN1Y2ggZGV0YWlsIC4uLgo+Cj4gSSBndWVzcyB0
aGlzIHdvdWxkIGNyYXNoIHVwb24gcmV0dXJuIGZyb20gZGV2aWNlX3JlbGVhc2VfZHJpdmVyKCk/
IEkKPiBndWVzcyBpZiB0aGF0J3MgdGhlIGxhc3QgdGhpbmcgdGhlbiBtYXliZSB3ZSdkIGFjdHVh
bGx5IGdldCBhIHRhaWwtY2FsbAo+IG9wdGltaXNhdGlvbiwgYnV0IHdlIGRvbid0IHdhbnQgdG8g
cmVseSBvbiB0aGF0IG9mIGNvdXJzZSEKPgo+IFNlZW1zIGxpa2UgdG8gZml4IGl0IHdlIGp1c3Qg
bmVlZCB0byBnZXQgYSBtb2R1bGUgcmVmZXJlbmNlIHRob3VnaD8gQ2FuCj4gYSBtb2R1bGUgcHV0
KCkgaXRzZWxmIHRob3VnaD8gSG1tbS4KCkl0IHNlZW1zIHNvbWUgZHJpdmVycyB1c2UgbW9kdWxl
X3B1dChUSElTX01PRFVMRSkgYW5kCl9fbW9kdWxlX2dldChUSElTX01PRFVMRSksIGUuZy4gdHVu
L3RhcCBkcml2ZXIuCgpCdXQgZG9lcyB0aGlzIGJ1bXAgdXAgdGhlIG1vZHVsZSByZWZjb3VudCBp
biBzdWNoIGEgd2F5IHRoYXQgYW4KaW4tcHJvZ3Jlc3Mgcm1tb2Qgd2lsbCB3YWl0L2Jsb2NrIHVu
dGlsIHRoZSByZWZjb3VudCByZWFjaGVzIDA/CgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=

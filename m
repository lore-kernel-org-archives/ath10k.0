Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwXKy-0001OP-4i
 for ath10k@lists.infradead.org; Wed, 20 Feb 2019 19:15:22 +0000
Received: by mail-it1-x144.google.com with SMTP id r11so18026965itc.2
 for <ath10k@lists.infradead.org>; Wed, 20 Feb 2019 11:15:16 -0800 (PST)
MIME-Version: 1.0
References: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
 <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
 <87sh3pdtpg.fsf@toke.dk>
 <f185ab8722e84c959b375e606d25a29b@aptaiexm02f.ap.qualcomm.com>
 <87mutue4y8.fsf@toke.dk>
 <ef7b317006964c0fa72763bbfc5149e5@aptaiexm02f.ap.qualcomm.com>
 <CANEJEGvcj9gPT8yy++qvi3hz3t9pAXyeUves06gr+ADfn9Ouhg@mail.gmail.com>
 <1535967508.3437.31.camel@sipsolutions.net> <87in3m25uu.fsf@toke.dk>
 <1535975240.3437.61.camel@sipsolutions.net> <878t4i1z74.fsf@toke.dk>
 <CANEJEGsm_BKM6g2x0+a7_5dBy5jkROs+jEjHmrcneGrMdDK41g@mail.gmail.com>
 <871sa7ylmi.fsf@toke.dk>
In-Reply-To: <871sa7ylmi.fsf@toke.dk>
From: Grant Grundler <grundler@google.com>
Date: Wed, 20 Feb 2019 11:15:02 -0800
Message-ID: <CANEJEGuBoRMBJBOrFOYyPtiJSMfTahrVgTfxZ2ift6Q5uGazFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
 chips
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
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, wgong@qti.qualcomm.com, ath10k@lists.infradead.org, wgong@codeaurora.org

T24gVGh1LCBTZXAgNiwgMjAxOCBhdCAzOjE4IEFNIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8
dG9rZUB0b2tlLmRrPiB3cm90ZToKPgo+IEdyYW50IEdydW5kbGVyIDxncnVuZGxlckBnb29nbGUu
Y29tPiB3cml0ZXM6Cj4KPiA+PiBBbmQsIHdlbGwsIEdyYW50J3MgZGF0YSBpcyBmcm9tIGEgc2lu
Z2xlIHRlc3QgaW4gYSBub2lzeQo+ID4+IGVudmlyb25tZW50IHdoZXJlIHRoZSB0aW1lIHNlcmll
cyBncmFwaCBzaG93cyB0aGF0IHRocm91Z2hwdXQgaXMgYWxsIG92ZXIKPiA+PiB0aGUgcGxhY2Ug
Zm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUgdGVzdDsgc28gaXQncyBoYXJkIHRvIGRyYXcgc29saWQK
PiA+PiBjb25jbHVzaW9ucyBmcm9tIChmb3IgaW5zdGFuY2UsIGZvciB0aGUgNS1zdHJlYW0gdGVz
dCwgdGhlIGF2ZXJhZ2UKPiA+PiB0aHJvdWdocHV0IGZvciA2IGlzIDMzMSBhbmQgMzc5IE1icHMg
Zm9yIHRoZSB0d28gcmVwZXRpdGlvbnMsIGFuZCBmb3IgNwo+ID4+IGl0J3MgMzI2IGFuZCAzNzEg
TWJwcykgLiBVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSB0aGUgc2FtZSBoYXJkd2FyZQo+ID4+
IHVzZWQgaW4gdGhpcyB0ZXN0LCBzbyBJIGNhbid0IGdvIHZlcmlmeSBpdCBteXNlbGY7IHNvIHRo
ZSBvbmx5IHRoaW5nIEkKPiA+PiBjYW4gZG8gaXMgZ3J1bWJsZSBhYm91dCBpdCBoZXJlLi4uIDop
Cj4gPgo+ID4gSXQncyBhIGZhaXIgY29tcGxhaW50IGFuZCBJIGFncmVlIHdpdGggaXQuIE15IGNv
dW50ZXIgYXJndW1lbnQgaXMgdGhlCj4gPiBvcHBvc2l0ZSBpcyB0cnVlIHRvbzogbW9zdCBpZGVh
bCBiZW5jaG1hcmtzIGRvbid0IG1lYXN1cmUgd2hhdCBtb3N0Cj4gPiB1c2VycyBzZWUuIFdoaWxl
IHRoZSBkYXRhIHdnb25nIHByb3ZpZGVkIGFyZSB3YXkgbW9yZSBub2lzeSB0aGFuIEkKPiA+IGxp
a2UsIG15IG92ZXJhbGwgImNvbmZpZGVuY2UiIGluIHRoZSAiY29uY2x1c2lvbiIgSSBvZmZlcmVk
IGlzIHN0aWxsCj4gPiBwb3NpdGl2ZS4KPgo+IFJpZ2h0LiBJIGd1ZXNzIEkgd291bGQganVzdCBw
cmVmZXIgYSBzbGlnaHRseSBtb3JlIGNvbXByZWhlbnNpdmUKPiBldmFsdWF0aW9uIHRvIGJhc2Ug
YSA0eCBpbmNyZWFzZSBpbiBidWZmZXIgc2l6ZSBvbi4uLgoKS2FsbGUsIGlzIHRoaXMgd2h5IHlv
dSBkaWRuJ3QgYWNjZXB0IHRoaXMgcGF0Y2g/IE90aGVyIHJlYXNvbnM/CgpUb2tlLCB3aGF0IGVs
c2Ugd291bGQgeW91IGxpa2UgdG8gc2VlIGV2YWx1YXRlZD8KCkkgZ2VuZXJhbGx5IHdhbnQgdG8g
c2VlIHRocmVlIHRoaW5ncyBtZWFzdXJlZCB3aGVuICJiZW5jaG1hcmtpbmciCnRlY2hub2xvZ2ll
czogdGhyb3VnaHB1dCwgbGF0ZW5jeSwgY3B1IHV0aWxpemF0aW9uCldlJ3ZlIGNvdmVyZWQgdGhv
c2UgdGhyZWUgSSB0aGluayAicmVhc29uYWJseSIuCgpXaGF0IGRvZXMgYSAiNHggaW5jcmVhc2Ug
aW4gbWVtb3J5IiBtZWFuIGhlcmU/ICBXZW4sIGhvdyBtdWNoIG1vcmUKbWVtb3J5IGRvZXMgdGhp
cyBjYXVzZSBhdGgxMGsgdG8gdXNlPwoKSWYgYSAiNHggaW5jcmVhc2UgaW4gbWVtb3J5IiBtZWFu
cyBJJ20gdXNpbmcgMU1CIGluc3RlYWQgb2YgMjU2S0IsIEknbQpub3QgZ29pbmcgd29ycnkgYWJv
dXQgdGhhdCBvbiBhIHN5c3RlbSB3aXRoIDJHQi0xNkdCIG9mIFJBTSBpZiBpdApkb3VibGVzIHRo
ZSB0aHJvdWdocHV0IG9mIHRoZSBXSUZJIGZvciBhIGdpdmVuIHdvcmtsb2FkLiAgSSBleHBlY3QK
cm91dGVycyB3aXRoIDEyOC0yNTZNQiBSQU0gd291bGQgbWFrZSB0aGF0IHRyYWRlb2ZmIGFzIHdl
bGwgYXNzdW1pbmcKdGhleSBkb24ndCBoYXZlIG90aGVyIFJBTS1kZW1hbmRpbmcgd29ya2xvYWQu
CgpjaGVlcnMsCmdyYW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

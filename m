Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fizE4-0005vH-U2
 for ath10k@lists.infradead.org; Fri, 27 Jul 2018 09:39:58 +0000
MIME-Version: 1.0
Date: Fri, 27 Jul 2018 17:39:44 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi chips
In-Reply-To: <CABvG-CVwRyeD5=0HqTyNQPVOV1iPtAT_GJQSmSH4=DdDca6dYw@mail.gmail.com>
References: <1532589677-16428-1-git-send-email-wgong@codeaurora.org>
 <1532589677-16428-3-git-send-email-wgong@codeaurora.org>
 <87zhye1aqg.fsf@toke.dk>
 <CABvG-CVwRyeD5=0HqTyNQPVOV1iPtAT_GJQSmSH4=DdDca6dYw@mail.gmail.com>
Message-ID: <6715f59dc8e834cddd701c6f9ee9f344@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?Q?Micha=C5=82_Kazior?= <kazikcz@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gMjAxOC0wNy0yNiAyMTowMiwgTWljaGHFgiBLYXppb3Igd3JvdGU6Cj4gT24gMjYgSnVseSAy
MDE4IGF0IDEzOjQ1LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAdG9rZS5kaz4gd3Jv
dGU6Cj4+IFdlbiBHb25nIDx3Z29uZ0Bjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgo+PiAKPj4+IFVw
c3RyZWFtIGtlcm5lbCBoYXMgYW4gaW50ZXJmYWNlIHRvIGhlbHAgYWRqdXN0IHNrX3BhY2luZ19z
aGlmdCB0byAKPj4+IGhlbHAKPj4+IGltcHJvdmUgVENQIFVMIHRocm91Z2hwdXQuCj4+PiBUaGUg
c2tfcGFjaW5nX3NoaWZ0IGlzIDggaW4gbWFjODAyMTEsIHRoaXMgaXMgYmFzZWQgb24gdGVzdCB3
aXRoIDExTgo+Pj4gV2lGaSBjaGlwcyB3aXRoIGF0aDlrLiBGb3IgUUNBNjE3NC9RQ0E5Mzc3IFBD
SSAxMUFDIGNoaXBzLCB0aGUgMTFBQwo+Pj4gVkhUODAgVENQIFVMIHRocm91Z2hwdXQgdGVzdGlu
ZyByZXN1bHQgc2hvd3MgNiBpcyB0aGUgb3B0aW1hbC4KPj4+IE92ZXJ3cml0ZSB0aGUgc2tfcGFj
aW5nX3NoaWZ0IHRvIDYgaW4gYXRoMTBrIGRyaXZlci4KPj4gCj4+IFdoZW4gSSB0ZXN0ZWQgdGhp
cywgYSBwYWNpbmcgc2hpZnQgb2YgOCB3YXMgcXVpdGUgY2xvc2UgdG8gb3B0aW1hbCBhcwo+PiB3
ZWxsIGZvciBhdGgxMGsuIFdoeSBhcmUgeW91IGdldHRpbmcgZGlmZmVyZW50IHJlc3VsdHM/Cj4+
IAo+Pj4gVGVzdGVkIHdpdGggUUNBNjE3NCBQQ0kgd2l0aCBmaXJtd2FyZQo+Pj4gV0xBTi5STS40
LjQuMS0wMDEwOS1RQ0FSTVNXUFotMSwgYnV0IHRoaXMgd2lsbCBhbHNvIGFmZmVjdCBRQ0E5Mzc3
IAo+Pj4gUENJLgo+Pj4gSXQncyBub3QgYSByZWdyZXNzaW9uIHdpdGggbmV3IGZpcm13YXJlIHJl
bGVhc2VzLgo+Pj4gCj4+PiBUaGVyZSBoYXZlIDIgdGVzdCByZXN1bHQgb2YgZGlmZmVyZW50IHNl
dHRpbmdzOgo+Pj4gCj4+PiBBUk0gQ1BVIGJhc2VkIGRldmljZSB3aXRoIFFDQTYxNzRBIFBDSSB3
aXRoIGRpZmZlcmVudAo+Pj4gc2tfcGFjaW5nX3NoaWZ0Ogo+IAo+IERpZmZlcmVudCBmaXJtd2Fy
ZSByZWxlYXNlcyBoYXZlIGRpZmZlcmVudCB0eCBidWZmZXJpbmcKPiBjaGFyYWN0ZXJpc3RpY3Mu
IEluIHNvbWUgMTAuMiBmaXJtd2FyZSBydW5uaW5nIG9uIFFDQTk4ODggeW91IGNhbiBoYXZlCj4g
dXAgdG8gNW1zIG9mIGRlbGF5ZWQgYWdncmVnYXRpb24uIElkZWFsbHkgc2tfcGFjaW5nX3NoaWZ0
IHNob3VsZCBiZQo+IGFkanVzdGVkIHBlciBmaXJtd2FyZSByZWxlYXNlLiBNYXliZSB0aGlzIHNo
b3VsZCBiZWNvbWUgcGFydCBvZiB0aGUKPiBhdGgxMGsgZmlybXdhcmUgd3JhcHBpbmcgImZ3IGZl
YXR1cmVzIiBzdHVmZj8KPiAKcmVjZW50bHkgd2UgZG8gbm90IHdhbnQgdG8gZG8gbGlrZSB0aGlz
IHNpbmNlIG5vIHRlc3QgZGF0YSBmb3IgZWFjaCAKZmlybXdhcmUuCj4gCj4gTWljaGHFggoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fifv7-0000YR-HC
 for ath10k@lists.infradead.org; Thu, 26 Jul 2018 13:03:06 +0000
Received: by mail-qt0-x235.google.com with SMTP id b15-v6so1398166qtp.11
 for <ath10k@lists.infradead.org>; Thu, 26 Jul 2018 06:02:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87zhye1aqg.fsf@toke.dk>
References: <1532589677-16428-1-git-send-email-wgong@codeaurora.org>
 <1532589677-16428-3-git-send-email-wgong@codeaurora.org>
 <87zhye1aqg.fsf@toke.dk>
From: =?UTF-8?Q?Micha=C5=82_Kazior?= <kazikcz@gmail.com>
Date: Thu, 26 Jul 2018 15:02:53 +0200
Message-ID: <CABvG-CVwRyeD5=0HqTyNQPVOV1iPtAT_GJQSmSH4=DdDca6dYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi chips
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
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

T24gMjYgSnVseSAyMDE4IGF0IDEzOjQ1LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VA
dG9rZS5kaz4gd3JvdGU6Cj4gV2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6
Cj4KPj4gVXBzdHJlYW0ga2VybmVsIGhhcyBhbiBpbnRlcmZhY2UgdG8gaGVscCBhZGp1c3Qgc2tf
cGFjaW5nX3NoaWZ0IHRvIGhlbHAKPj4gaW1wcm92ZSBUQ1AgVUwgdGhyb3VnaHB1dC4KPj4gVGhl
IHNrX3BhY2luZ19zaGlmdCBpcyA4IGluIG1hYzgwMjExLCB0aGlzIGlzIGJhc2VkIG9uIHRlc3Qg
d2l0aCAxMU4KPj4gV2lGaSBjaGlwcyB3aXRoIGF0aDlrLiBGb3IgUUNBNjE3NC9RQ0E5Mzc3IFBD
SSAxMUFDIGNoaXBzLCB0aGUgMTFBQwo+PiBWSFQ4MCBUQ1AgVUwgdGhyb3VnaHB1dCB0ZXN0aW5n
IHJlc3VsdCBzaG93cyA2IGlzIHRoZSBvcHRpbWFsLgo+PiBPdmVyd3JpdGUgdGhlIHNrX3BhY2lu
Z19zaGlmdCB0byA2IGluIGF0aDEwayBkcml2ZXIuCj4KPiBXaGVuIEkgdGVzdGVkIHRoaXMsIGEg
cGFjaW5nIHNoaWZ0IG9mIDggd2FzIHF1aXRlIGNsb3NlIHRvIG9wdGltYWwgYXMKPiB3ZWxsIGZv
ciBhdGgxMGsuIFdoeSBhcmUgeW91IGdldHRpbmcgZGlmZmVyZW50IHJlc3VsdHM/Cj4KPj4gVGVz
dGVkIHdpdGggUUNBNjE3NCBQQ0kgd2l0aCBmaXJtd2FyZQo+PiBXTEFOLlJNLjQuNC4xLTAwMTA5
LVFDQVJNU1dQWi0xLCBidXQgdGhpcyB3aWxsIGFsc28gYWZmZWN0IFFDQTkzNzcgUENJLgo+PiBJ
dCdzIG5vdCBhIHJlZ3Jlc3Npb24gd2l0aCBuZXcgZmlybXdhcmUgcmVsZWFzZXMuCj4+Cj4+IFRo
ZXJlIGhhdmUgMiB0ZXN0IHJlc3VsdCBvZiBkaWZmZXJlbnQgc2V0dGluZ3M6Cj4+Cj4+IEFSTSBD
UFUgYmFzZWQgZGV2aWNlIHdpdGggUUNBNjE3NEEgUENJIHdpdGggZGlmZmVyZW50Cj4+IHNrX3Bh
Y2luZ19zaGlmdDoKCkRpZmZlcmVudCBmaXJtd2FyZSByZWxlYXNlcyBoYXZlIGRpZmZlcmVudCB0
eCBidWZmZXJpbmcKY2hhcmFjdGVyaXN0aWNzLiBJbiBzb21lIDEwLjIgZmlybXdhcmUgcnVubmlu
ZyBvbiBRQ0E5ODg4IHlvdSBjYW4gaGF2ZQp1cCB0byA1bXMgb2YgZGVsYXllZCBhZ2dyZWdhdGlv
bi4gSWRlYWxseSBza19wYWNpbmdfc2hpZnQgc2hvdWxkIGJlCmFkanVzdGVkIHBlciBmaXJtd2Fy
ZSByZWxlYXNlLiBNYXliZSB0aGlzIHNob3VsZCBiZWNvbWUgcGFydCBvZiB0aGUKYXRoMTBrIGZp
cm13YXJlIHdyYXBwaW5nICJmdyBmZWF0dXJlcyIgc3R1ZmY/CgoKTWljaGHFggoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

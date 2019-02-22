Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxGDB-0003TK-TF
 for ath10k@lists.infradead.org; Fri, 22 Feb 2019 19:10:19 +0000
Message-ID: <44add7675ef89dd61fcea9da6b55804c498a2d24.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: Change default tx_sk_pacing_shift to 7
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 22 Feb 2019 20:10:05 +0100
In-Reply-To: <87imxcvt4z.fsf@toke.dk>
References: <20190221172936.21816-1-toke@redhat.com>
 <E1gx9x3-0002j0-1J@sipsolutions.net> <87lg28vup0.fsf@toke.dk>
 <a5151441bdfe02cb11043aa0786185b8ee3c3ee9.camel@sipsolutions.net>
 <87imxcvt4z.fsf@toke.dk>
Mime-Version: 1.0
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Cc: Kan Yan <kyan@google.com>, wgong@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Grant Grundler <grundler@google.com>, wgong@codeaurora.org, Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@codeaurora.org>

T24gRnJpLCAyMDE5LTAyLTIyIGF0IDE0OjQwICswMTAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4gCj4gQW5kIHNlbmQgaXQgZGlyZWN0bHkgdG8gc3RhYmxlLCBvciBkb2VzIGl0
IG5lZWQgdG8gZ28gdGhyb3VnaCB5b3U/CgpJIGFkZGVkIGEgQ2M6IHN0YWJsZSB0YWcuIFNvIGFs
bCB5b3UgcmVhbGx5IG5lZWQgdG8gZG8gaXMgd2FpdCBmb3IgdGhlCmVtYWlscyB0ZWxsaW5nIHlv
dSBpdCBmYWlsZWQgdG8gYXBwbHksIGFuZCBoYW5kbGUgYWNjb3JkaW5nbHkgOikKCmpvaGFubmVz
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBr
IG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

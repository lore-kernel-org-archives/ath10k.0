Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY8v0-0003Sn-F2
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 06:57:03 +0000
Received: by mail-wi0-f174.google.com with SMTP id d1so10141582wiv.13
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 23:56:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ob09he5h.fsf@kamboji.qca.qualcomm.com>
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-4-git-send-email-michal.kazior@tieto.com>
 <87ob09he5h.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 10 Apr 2014 08:56:38 +0200
Message-ID: <CA+BoTQkTvOvjW51R2YmtW_5_5jtKan1u6jRY3_82FRZnZG2jEw@mail.gmail.com>
Subject: Re: [RFTv2 3/5] ath10k: rework peer accounting
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTAgQXByaWwgMjAxNCAwODo1MCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyaXRl
czoKPgo+PiBJdCB3YXMgdHJvdWJsZXNvbWUgdG8gaXRlcmF0ZSBvdmVyIHBlZXJzIGFuZAo+PiBw
ZXJmb3JtIHNsZWVwYWJsZSBjYWxscy4gVGhpcyB3aWxsIGJlIG5lY2Vzc2FyeQo+PiBmb3Igc29t
ZSB1cGNvbW1pbmcgY2hhbmdlcyB0byB0eCBmbHVzaGluZy4KPj4KPj4gTWFrZSBwZWVyIGFsbG9j
YXRpb24gYW5kIGluaXRpYWwgc2V0dXAKPj4gcHJvdGVjdGVkIGJ5IGJvdGggYXItPmNvbmZfbXV0
ZXggYW5kCj4+IGFyLT5kYXRhX2xvY2suIFRoaXMgd2F5IGl0J3MgcG9zc2libGUgdG8gaXRlcmF0
ZQo+PiBvdmVyIHBlZXJzIHdpdGggY29uZl9tdXRleCBhbmQgY2FsbCBzbGVlcGFibGUKPj4gZnVu
Y3Rpb25zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9y
QHRpZXRvLmNvbT4KPgo+IFNvcnJ5LCBidXQgSSdtIG5vdCByZWFsbHkgZ2V0dGluZyB5b3VyIGlk
ZWEgaGVyZSBvZiB1c2luZyBib3RoCj4gY29uZl9tdXRleCBhbmQgZGF0YV9sb2NrIHRvIHByb3Rl
Y3QgYXItPnBlZXJzLiBDYW4geW91IGVsYWJvcmF0ZSBtb3JlLAo+IHBsZWFzZT8gV2h5IGNhbid0
IHdlIGp1c3QgdXNlIGNvbmZfbXV0ZXggdGhlbj8gV2hhdCBhbSBJIG1pc3Npbmc/CgpPcmlnaW5h
bGx5IGFyLT5wZWVycyB3YXMgcHJvdGVjdGVkIGJ5IGRhdGFfbG9jay4gVGhlIHJlYXNvbiBmb3Ig
dGhhdAp0aGUgbGlzdCBpcyBhY2Nlc3NlZCBmcm9tIGEgdGFza2xldCBjb250ZXh0IGZvciBodHQg
cGVlciBtYXAvdW5tYXAKZXZlbnRzLiBPcmlnaW5hbGx5IHRob3NlIGV2ZW50cyBhbGxvY2F0ZWQv
ZnJlZWQgcGVlcnMuIFRoaXMgaG93ZXZlciBpcwpjdW1iZXJzb21lIHRvIHdvcmsgd2l0aCB3aGVu
IHlvdSB3YW50IHRvIGl0ZXJhdGUgb3ZlciBwZWVycyBhbmQgaXNzdWUKYmxvY2tpbmcvc2xlZXBh
YmxlIGNhbGxzIChlLmcuIGZsdXNoIHR4IHZpYSB3bWkpLgoKSGF2aW5nIGNvbmZfbXV0ZXgtb25s
eSBwcm90ZWN0ZWQgY29uZl9tdXRleCB3b3VsZCByZXF1aXJlIGh0dCBwZWVyCm1hcC91bm1hcCBl
dmVudCBwcm9jZXNzaW5nIHRvIGJlIG1vdmVkIGludG8gc2xlZXBhYmxlIGNvbnRleHQgKGUuZy4K
aW50byBhIHdvcmtlcikuCgpUaGF0J3Mgd2h5IEkndmUgbWFkZSBhci0+cGVlcnMgYmVpbmcgd3Jp
dGUtcHJvdGVjdGVkIGJ5IGJvdGggc28gdGhhdAppdCBjYW4gYmUgcmVhZCB3aGlsZSBob2xkaW5n
IGFueSBvZiB0aGVzZSBsb2Nrcy4KCkknbGwgdHJ5IHRvIG1ha2UgdGhlIGNvbW1pdCBtZXNzYWdl
IGNsZWFyZXIuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXOxm-0001Hy-NM
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 05:52:51 +0000
Received: by mail-wg0-f41.google.com with SMTP id n12so416709wgh.0
 for <ath10k@lists.infradead.org>; Mon, 07 Apr 2014 22:51:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53435F89.60500@candelatech.com>
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <5341F1A9.2030202@candelatech.com>
 <CA+BoTQndgEB7X-RUPPkxdjnp96LJzbv6=Q9K4XTTrky-QwE4Ww@mail.gmail.com>
 <53435F89.60500@candelatech.com>
Date: Tue, 8 Apr 2014 07:51:45 +0200
Message-ID: <CA+BoTQk6G4-h8HQENbK9snrXo6j6FW4D+07XKZMEEuvWiu03ww@mail.gmail.com>
Subject: Re: [RFT 0/4] ath10k: fix flushing and tx stalls
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gOCBBcHJpbCAyMDE0IDA0OjMxLCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNv
bT4gd3JvdGU6Cj4gT24gMDQvMDcvMjAxNCAwMjoxMSBBTSwgTWljaGFsIEthemlvciB3cm90ZToK
Pgo+PiBUaGVzZSBsb2dzIGFyZSBub3QgZW5vdWdoLiBJJ2QgbG92ZSB0byBzZWUgdHJhY2VzIGZv
ciB0aGlzIHRvIHNlZSB3aGF0Cj4+IGZyYW1lcyBhcmUgYWN0dWFsbHkgc3VibWl0dGVkIGFuZCB3
aGVuIHR4IGNyZWRpdHMgYXJlIHJlcGxlbmlzaGVkLgo+Pgo+PiBJIGFsc28gd29uZGVyIGlmIHRo
aXMgY2FuIGJlIHNvbWVob3cgcmVsYXRlZCB0byB5b3VyIEZXIGNoYW5nZXMgdG8KPj4gYWxsb3cg
Y29ubmVjdGluZyBtdWx0aXBsZSBjbGllbnQgdmlydHVhbCBpbnRlcmZhY2VzIHRvIGEgc2luZ2xl
IEFQPwo+Cj4KPiBJIHRoaW5rIGl0IGlzIHVubGlrZWx5IGR1ZSB0byBteSBmaXJtd2FyZSBjaGFu
Z2VzLi4ubGl0dGxlIG9mIHRoYXQgdG91Y2hlZAo+IHRoZSBoYW5kbGluZyBvZiBtYW5hZ2VtZW50
IGZyYW1lcy4gIEl0IG1pZ2h0IHZlcnkgd2VsbCBiZSBhIGJhc2ljIHByb2JsZW0gaW4KPiBlaXRo
ZXIgdGhlIGZpcm13YXJlIG9yIGRyaXZlciB3aGVuIHVzaW5nIG11bHRpcGxlIHN0YXRpb24gVklG
Uy4gIEkgdGhpbmsKPiB0aGF0Cj4gYXNpZGUgZnJvbSBteSB0ZXN0aW5nIHRoYXQgY29kZSBoYXMg
bm90IGJlZW4gdXNlZCBtdWNoLgo+Cj4gTm90ZSBteSBmb2xsb3d1cCBlbWFpbCB0aGF0IHByb2Js
ZW1zIHN0YXJ0ZWQgd2l0aCBwYXRjaCAzLzQuLi5ub3Qgc3VyZSB5b3UKPiBzYXcgdGhhdCBvbmUg
b3Igbm90LiAgSSBzYXcgc2ltaWxhciBmYWlsdXJlIHRvIGFzc29jaWF0ZSAmIGdldCBESENQIChh
bmQKPiBzbG93L2h1bmcgdXNlci1zcGFjZSkgd2l0aG91dCB0aGUga2VybmVsIGVycm9yIGxvZ3Mu
CgpJIGRpZCBnZXQgdGhhdCBtYWlsLiBJdCdzIGp1c3QgdGhhdCBpdCBtYWtlcyBsaXR0bGUgc2Vu
c2UuIFBhdGNoIDMvNApzaW1wbHkgZXh0ZW5kcyBhdGgxMGtfZmx1c2goKSB0byB3YWl0IGZvciBt
YW5hZ2VtZW50IGZyYW1lcy4gSXQKc2hvdWxkbid0IGNoYW5nZSBiZWhhdmlvdXIgb2YgdHggY3Jl
ZGl0IHN0YXJ2YXRpb24gd2hpY2ggYXBwZWFycyB0byBiZQp0aGUgY2FzZSBpbiB0aGUgbG9ncyB5
b3UgcHJvdmlkZWQuCgoKPiBJJ3ZlIGFkZGVkIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyB0byBteSB0
cmVlIGFuZCB3aWxsIGNvbnRpbnVlIHRvIHJ1bgo+IHdpdGggdGhlbSBzaW5jZSB0aGV5IGRvIG5v
dCBhcHBlYXIgdG8gY2F1c2UgcHJvYmxlbXMgc28gZmFyLgoKUGF0Y2ggMi80IGlzIHByb2JhYmx5
IG1lYW5pbmdsZXNzIGluIGl0c2VsZi4gSXQgaXMganVzdCBhIHByZXBhcmF0aW9uIGZvciA0LzQu
CgpBbnl3YXksIHRoYW5rcyBmb3IgdGVzdGluZyEKCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==

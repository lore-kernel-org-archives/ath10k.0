Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x235.google.com ([2607:f8b0:4003:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSLlh-0000UK-7o
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 07:27:31 +0000
Received: by mail-oa0-f53.google.com with SMTP id j17so81074oag.40
 for <ath10k@lists.infradead.org>; Tue, 25 Mar 2014 00:27:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53306239.2020006@candelatech.com>
References: <1395428150-31996-1-git-send-email-greearb@candelatech.com>
 <871txr7svw.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmquq7dXTV0sSV1mJ0+8-9OuiCnqz2iN8VNO4J3iaeexQ@mail.gmail.com>
 <53306239.2020006@candelatech.com>
Date: Tue, 25 Mar 2014 08:27:02 +0100
Message-ID: <CA+BoTQkCmJbvQjZ3vTV7AP1EwdcH_pAd0pex_v9bZDzwZdufbw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ath10k: Add debugging for tx-credits usage.
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjQgTWFyY2ggMjAxNCAxNzo1MCwgQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5j
b20+IHdyb3RlOgo+IE9uIDAzLzI0LzIwMTQgMDQ6MjEgQU0sIE1pY2hhbCBLYXppb3Igd3JvdGU6
Cj4+IE9uIDI0IE1hcmNoIDIwMTQgMTI6MTIsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+Cj4+Pj4gLSAgICAgc3RhdHVzID0gYXRoMTBrX2h0Y19zZW5kKGh0Yywg
QVRIMTBLX0hUQ19FUF8wLCBza2IpOwo+Pj4+ICsgICAgIHN0YXR1cyA9IGF0aDEwa19odGNfc2Vu
ZChodGMsIEFUSDEwS19IVENfRVBfMCwgc2tiLCBfX0xJTkVfXyk7Cj4+Pgo+Pj4gVXNpbmcgbGlu
ZSBudW1iZXJzIGluIGRlYnVnIG1lc3NhZ2VzIGlzIHZlcnkgY3VtYmVyc29tZS4gU29tZSBwZW9w
bGUKPj4+IGNoZXJyeSBwaWNrIHBhdGNoZXMsIGhhdmUgdGhlaXIgb3duIGNoYW5nZXMgYW5kIHdo
YXRub3Qgd2hpY2ggd2lsbCBtYWtlCj4+PiBpdCBtb3JlIGRpZmZpY3VsdCB0byByZWFkIHRoZSBk
ZWJ1ZyBsb2dzLiBJc24ndCB0aGVyZSBhbnkgYmV0dGVyIHdheSB0bwo+Pj4gZG8gdGhpcz8KPj4K
Pj4gSSB3b3VsZCBwcmVmZXIgdG8gZXhwbGljaXRseSB3YWl0IGZvciB0eCBjcmVkaXQgcmVwbGVu
aXNobWVudCBpbgo+PiBhdGgxMGtfd21pX2NtZF9zZW5kKCkgYWZ0ZXIgYSBjb21tYW5kIGlzIHNl
bnQgaW5zdGVhZCBvZiBhbGwgdGhlc2UKPj4gcHJpbnRzLiBUaGlzIHdheSB5b3UgY2FuIGdldCBh
IGZ1bGwgY2FsbCB0cmFjZSBpZiBpdCB0aW1lcyBvdXQuCj4KPiBXb3VsZCB0aGF0IGJlIGEgcGVy
Zm9ybWFuY2UgcHJvYmxlbSAoYnkgZWZmZWN0aXZlbHkgYWxsb3dpbmcgb25seSBhIHNpbmdsZQo+
IGl0ZW0gdG8gYmUgc2VudCB0byB0aGUgZmlybXdhcmUgYXQgYW55IGdpdmVuIHRpbWU/KQoKVGhl
IG9ubHkgdGhpbmcgdGhhdCBtYXkgc3VmZmVyIGhlcmUgaXMgd21pIG1nbXQgdHggYnV0IEkgd291
bGRuJ3QKY29uc2lkZXIgdGhhdCBwZXJmb3JtYW5jZSBjcml0aWNhbC4KCgpNaWNoYcWCCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

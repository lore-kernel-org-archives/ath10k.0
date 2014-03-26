Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSi6p-0005NO-Ef
 for ath10k@lists.infradead.org; Wed, 26 Mar 2014 07:18:48 +0000
Received: by mail-wi0-f175.google.com with SMTP id cc10so4360462wib.14
 for <ath10k@lists.infradead.org>; Wed, 26 Mar 2014 00:18:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53319D65.4090907@candelatech.com>
References: <1395428150-31996-1-git-send-email-greearb@candelatech.com>
 <871txr7svw.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmquq7dXTV0sSV1mJ0+8-9OuiCnqz2iN8VNO4J3iaeexQ@mail.gmail.com>
 <53306239.2020006@candelatech.com>
 <CA+BoTQkCmJbvQjZ3vTV7AP1EwdcH_pAd0pex_v9bZDzwZdufbw@mail.gmail.com>
 <53319D65.4090907@candelatech.com>
Date: Wed, 26 Mar 2014 08:18:20 +0100
Message-ID: <CA+BoTQnMmwsz0438yVrP_bQ-AKZaoktW7NrGAODVEx4w21-dEA@mail.gmail.com>
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

T24gMjUgTWFyY2ggMjAxNCAxNjoxNCwgQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5j
b20+IHdyb3RlOgo+IE9uIDAzLzI1LzIwMTQgMTI6MjcgQU0sIE1pY2hhbCBLYXppb3Igd3JvdGU6
Cj4+Cj4+IE9uIDI0IE1hcmNoIDIwMTQgMTc6NTAsIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVs
YXRlY2guY29tPiB3cm90ZToKPj4+Cj4+PiBPbiAwMy8yNC8yMDE0IDA0OjIxIEFNLCBNaWNoYWwg
S2F6aW9yIHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjQgTWFyY2ggMjAxNCAxMjoxMiwgS2FsbGUgVmFs
byA8a3ZhbG9AcWNhLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4KPj4+Pj4+IC0gICAgIHN0
YXR1cyA9IGF0aDEwa19odGNfc2VuZChodGMsIEFUSDEwS19IVENfRVBfMCwgc2tiKTsKPj4+Pj4+
ICsgICAgIHN0YXR1cyA9IGF0aDEwa19odGNfc2VuZChodGMsIEFUSDEwS19IVENfRVBfMCwgc2ti
LCBfX0xJTkVfXyk7Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFVzaW5nIGxpbmUgbnVtYmVycyBpbiBkZWJ1
ZyBtZXNzYWdlcyBpcyB2ZXJ5IGN1bWJlcnNvbWUuIFNvbWUgcGVvcGxlCj4+Pj4+IGNoZXJyeSBw
aWNrIHBhdGNoZXMsIGhhdmUgdGhlaXIgb3duIGNoYW5nZXMgYW5kIHdoYXRub3Qgd2hpY2ggd2ls
bCBtYWtlCj4+Pj4+IGl0IG1vcmUgZGlmZmljdWx0IHRvIHJlYWQgdGhlIGRlYnVnIGxvZ3MuIElz
bid0IHRoZXJlIGFueSBiZXR0ZXIgd2F5IHRvCj4+Pj4+IGRvIHRoaXM/Cj4+Pj4KPj4+Pgo+Pj4+
IEkgd291bGQgcHJlZmVyIHRvIGV4cGxpY2l0bHkgd2FpdCBmb3IgdHggY3JlZGl0IHJlcGxlbmlz
aG1lbnQgaW4KPj4+PiBhdGgxMGtfd21pX2NtZF9zZW5kKCkgYWZ0ZXIgYSBjb21tYW5kIGlzIHNl
bnQgaW5zdGVhZCBvZiBhbGwgdGhlc2UKPj4+PiBwcmludHMuIFRoaXMgd2F5IHlvdSBjYW4gZ2V0
IGEgZnVsbCBjYWxsIHRyYWNlIGlmIGl0IHRpbWVzIG91dC4KPj4+Cj4+Pgo+Pj4gV291bGQgdGhh
dCBiZSBhIHBlcmZvcm1hbmNlIHByb2JsZW0gKGJ5IGVmZmVjdGl2ZWx5IGFsbG93aW5nIG9ubHkg
YQo+Pj4gc2luZ2xlCj4+PiBpdGVtIHRvIGJlIHNlbnQgdG8gdGhlIGZpcm13YXJlIGF0IGFueSBn
aXZlbiB0aW1lPykKPj4KPj4KPj4gVGhlIG9ubHkgdGhpbmcgdGhhdCBtYXkgc3VmZmVyIGhlcmUg
aXMgd21pIG1nbXQgdHggYnV0IEkgd291bGRuJ3QKPj4gY29uc2lkZXIgdGhhdCBwZXJmb3JtYW5j
ZSBjcml0aWNhbC4KPgo+Cj4gSW4gdGhhdCBjYXNlLCB3aHkgdXNlIGNyZWRpdHMgYXQgYWxsPwoK
RXhjZWxsZW50IHF1ZXN0aW9uLgoKRmlybXdhcmUgcHJvdmlkZXMgMiBIVEMgdHggY3JlZGl0cyBm
b3IgV01JLiBJIGd1ZXNzIHRoaXMgaXMgb24KcHVycG9zZS4gSSBpbWFnaW5lIFdNSSBtZ210IHR4
IGNhbiBoYW5nIChpLmUuIG5vdCByZXBsZW5pc2ggdHgKY3JlZGl0cykuIEluIHRoYXQgY2FzZSB0
aGUgcmVtYWluaW5nIHR4IGNyZWRpdCBjb3VsZCBiZSB1c2VkIHRvIHRyeQpyZWNvdmVyaW5nLCBl
LmcuIGRvd24vc3RvcCB2ZGV2IChJIHRoaW5rIGl0IHNob3VsZCBkcm9wIGFsbCBwZW5kaW5nIHR4
CmFuZCB0aHVzIGZyZWUgdGhlIHN0dWNrIEhUQyB0eCBjcmVkaXQpLgoKSXQgbWlnaHQgYmUgYSBn
b29kIGlkZWEgdG8ga2VlcCB0aGlzIHJlY292ZXJ5IHN0cmF0ZWd5IGluIG1pbmQgd2hlbgppbXBs
ZW1lbnRpbmcgdGhlICJ3YWl0IGZvciB0eCByZXBsZW5pc2htZW50IiB3bWkgdHggYmxvY2tpbmcu
CgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGkdF-0001to-KV
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 13:29:46 +0000
Received: by mail-lj1-x244.google.com with SMTP id y6so22413278ljd.12
 for <ath10k@lists.infradead.org>; Wed, 17 Apr 2019 06:29:45 -0700 (PDT)
Subject: Re: [PATCH] ath10k: remove iteration in wake_tx_queue
References: <20190327162906.6010-1-erik.stromdahl@gmail.com>
 <87bm1qq92j.fsf@toke.dk> <8772dfe6-3f52-05ca-f55a-b7eae14fa7ac@gmail.com>
 <87imvdu5u8.fsf@toke.dk>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <f915fa20-a4e1-7312-dea2-d60b716e4877@gmail.com>
Date: Wed, 17 Apr 2019 15:29:41 +0200
MIME-Version: 1.0
In-Reply-To: <87imvdu5u8.fsf@toke.dk>
Content-Language: en-US
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
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: yiboz@codeaurora.org

CgpPbiA0LzE2LzE5IDk6MDcgUE0sIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPiBF
cmlrIFN0cm9tZGFobCA8ZXJpay5zdHJvbWRhaGxAZ21haWwuY29tPiB3cml0ZXM6Cj4gCj4+IE9u
IDQvMS8xOSAxOjA1IFBNLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+PiBFcmlr
IFN0cm9tZGFobCA8ZXJpay5zdHJvbWRhaGxAZ21haWwuY29tPiB3cml0ZXM6Cj4+Pgo+Pj4+IEl0
ZXJhdGluZyB0aGUgVFggcXVldWUgYW5kIHRoZXJlYnkgZGVxdWV1aW5nIGFsbCBhdmFpbGFibGUg
cGFja2V0cyBpbiB0aGUKPj4+PiBxdWV1ZSBjb3VsZCByZXN1bHQgaW4gcGVyZm9ybWFuY2UgcGVu
YWx0aWVzIG9uIHNvbWUgU01QIHN5c3RlbXMuCj4+Pj4KPj4+PiBUaGUgcmVhc29uIGZvciB0aGlz
IGlzIG1vc3QgbGlrZWx5IHRoYXQgdGhlIHBlci1hYyBsb2NrIChhY3RpdmVfdHhxX2xvY2spCj4+
Pj4gaW4gbWFjODAyMTEgd2lsbCBiZSBoZWxkIGJ5IHRoZSBDUFUgaXRlcmF0aW5nIHRoZSBjdXJy
ZW50IHF1ZXVlLgo+Pj4+Cj4+Pj4gVGhpcyB3aWxsIGxvY2sgdXAgb3RoZXIgQ1BVcyB0cnlpbmcg
dG8gcHVzaCBuZXcgbWVzc2FnZXMgb24gdGhlIFRYCj4+Pj4gcXVldWUuCj4+Pj4KPj4+PiBJbnN0
ZWFkIG9mIGl0ZXJhdGluZyB0aGUgcXVldWUgd2UgZmV0Y2gganVzdCBvbmUgcGFja2V0IGF0IHRo
ZSB0aW1lLAo+Pj4+IHJlc3VsdGluZyBpbiBtaW5pbWFsIHN0YXJ2YXRpb24gb2YgdGhlIG90aGVy
IENQVXMuCj4+Pgo+Pj4gRGlkIHlvdSB0ZXN0IHRoaXMgd2l0aCBGZWxpeCcgcGF0Y2hlcyByZWR1
Y2luZyB0aGUgdGltZSB0aGUgbG9jayBpcyBoZWxkCj4+PiBpbiBtYWM4MDIxMT8KPj4+Cj4+PiAt
VG9rZQo+Pj4KPj4gSGkgVG9rZSwKPj4KPj4gSSBhbSBub3QgYXdhcmUgb2YgdGhlc2UgcGF0Y2hl
cy4gQ2FuIHlvdSBwbGVhc2UgcG9pbnQgdGhlbSBvdXQgZm9yIG1lPwo+IAo+IFRoZXkndmUgYWxy
ZWFkeSBiZWVuIG1lcmdlZC4gQ29tbWl0cyBkY2VjMWQ5YmM4YTcgYW5kIDdlZjc2OTQ1OWYxNCBp
bgo+IG1hYzgwMjExLW5leHQgOikKPiAKPiAtVG9rZQo+IAoKSSBzZWUuIEkgYW0gdXNpbmcgdGhl
IGF0aCB0cmVlIGFuZCBJIGNvdWxkbid0IGZpbmQgdGhlbSB0aGVyZS4KSSBjYW4gY2hlcnJ5LXBp
Y2sgdGhlbSB0byBteSBvd24gdHJlZSBhbmQgdHJ5IHRoZW0gb3V0CihvciB3YWl0IHVudGlsIEth
bGxlIHVwZGF0ZXMgYXRoLmdpdCkuCgotLQpFcmlrCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==

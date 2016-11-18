Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7kUX-0002hq-Qr
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 14:50:14 +0000
Received: by mail-wm0-x229.google.com with SMTP id g23so42987863wme.1
 for <ath10k@lists.infradead.org>; Fri, 18 Nov 2016 06:49:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5b62d41b-7125-f1ce-b09f-29db7572a748@gmail.com>
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
 <1479141222-8493-5-git-send-email-erik.stromdahl@gmail.com>
 <CA+BoTQnTkwQjmNBdr8a+YauXffWGNBNyPTZ=RByoviTSp+1ZYQ@mail.gmail.com>
 <5b62d41b-7125-f1ce-b09f-29db7572a748@gmail.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Fri, 18 Nov 2016 15:49:50 +0100
Message-ID: <CA+BoTQk8kov-fZ3CiTrVdfoevM=AmO-a2GK2PcGtLh6Ch2-x6g@mail.gmail.com>
Subject: Re: [RFC 04/12] ath10k: htc: refactorization
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTcgTm92ZW1iZXIgMjAxNiBhdCAxNzozMiwgRXJpayBTdHJvbWRhaGwgPGVyaWsuc3Ryb21k
YWhsQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+IE9uIDExLzE1LzIwMTYgMTE6MTkgQU0sIE1pY2hh
bCBLYXppb3Igd3JvdGU6Cj4+IE9uIDE0IE5vdmVtYmVyIDIwMTYgYXQgMTc6MzMsIEVyaWsgU3Ry
b21kYWhsIDxlcmlrLnN0cm9tZGFobEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gQ29kZSByZWZhY3Rv
cml6YXRpb246Cj4+Pgo+Pj4gTW92ZWQgdGhlIGNvZGUgZm9yIGVwIDAgaW4gYXRoMTBrX2h0Y19y
eF9jb21wbGV0aW9uX2hhbmRsZXIKPj4+IHRvIGF0aDEwa19odGNfY29udHJvbF9yeF9jb21wbGV0
ZS4KPj4+Cj4+PiBUaGlzIGVhc2VzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBTRElPL21ib3ggc2ln
bmlmaWNhbnRseSBzaW5jZQo+Pj4gdGhlIGVwX3J4X2NvbXBsZXRlIGNiIGlzIGludm9rZWQgZGly
ZWN0bHkgZnJvbSB0aGUgU0RJTy9tYm94Cj4+PiBoaWYgbGF5ZXIuCj4+Pgo+Pj4gU2luY2UgdGhl
IGF0aDEwa19odGNfY29udHJvbF9yeF9jb21wbGV0ZSBhbHJlYWR5IGlzIHByZXNlbnQKPj4+IChv
bmx5IGNvbnRhaW5pbmcgYSB3YXJuaW5nIG1lc3NhZ2UpIHRoZXJlIGlzIG5vIHJlYXNvbiBmb3Ig
bm90Cj4+PiB1c2luZyBpdCAoaW5zdGVhZCBvZiBoYXZpbmcgYSBzcGVjaWFsIGNhc2UgZm9yIGVw
IDAgaW4KPj4+IGF0aDEwa19odGNfcnhfY29tcGxldGlvbl9oYW5kbGVyKS4KPj4KPj4gVGhpcyBz
aG91bGQgYmUgc3F1YXNoZWQgd2l0aCBQYXRjaCAzIHNpbmNlIGl0J3MgaW5zZXBhcmFibGUgcGFy
dCBvZgo+PiB0aGUgc2FtZSByZWZhY3Rvcml6YXRpb24uCj4+Cj4+Cj4+IE1pY2hhxYIKPj4KPgo+
Cj4gSG1tLCBJIGRvbid0IHJlYWxseSBzZWUgd2h5IHRoaXMgaXMgYW4gaW5zZXBhcmFibGUgcGFy
dCBvZiB0aGUgcHJldmlvdXMKPiBwYXRjaC4KPgo+IEFzIGZhciBhcyBJIHNlZSB0aGlzIHBhdGNo
IGhhcyBub3RoaW5nIHRvIGRvIHdpdGggcGF0Y2ggMywgb3IgYW0gSQo+IG1pc3NpbmcgYW55dGhp
bmc/Cj4KPiBBcmUgeW91IHJlYWxseSBzdXJlIHRoZXkgc2hvdWxkIGJlIHNxdWFzaGVkPwoKSG1t
Li4gb24gc2Vjb25kIHRob3VnaHQgdGhpcyBzaG91bGQgYmUgZmluZSBhcyBpdCBpcy4KCgpNaWNo
YcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgx
MGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

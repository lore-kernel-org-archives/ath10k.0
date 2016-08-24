Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x235.google.com ([2607:f8b0:4001:c0b::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcUwz-0002Np-46
 for ath10k@lists.infradead.org; Wed, 24 Aug 2016 09:58:25 +0000
Received: by mail-it0-x235.google.com with SMTP id x131so199430032ite.0
 for <ath10k@lists.infradead.org>; Wed, 24 Aug 2016 02:58:04 -0700 (PDT)
Message-ID: <57BD6FA7.4040003@gmail.com>
Date: Wed, 24 Aug 2016 17:57:59 +0800
From: Xuebing Wang <xbing6@gmail.com>
MIME-Version: 1.0
Subject: Re: ath10k: qca6174 firmware: difference between hw2.1/firmware-5
 and hw3.0/firmware-4
References: <57BD1B3D.3050104@gmail.com>
 <CA+BoTQnurvJv32Uszq-SngfJ5NDhjPMORDtbQGvK59LVqdxjVg@mail.gmail.com>
 <57BD64CE.7060106@gmail.com>
In-Reply-To: <57BD64CE.7060106@gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, Stanislaw Gruszka <sgruszka@redhat.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, marcus Wright <mwright@sharetracker.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

SGkgTWljaGFsLCBTdGFuaXNsYXcgYW5kIGNvbW11bml0eSwKCkFyZSB5b3UgYXdhcmUgb2YgYW55
IFdMQU4gY2FyZCB3aXRoIHFjYTYxNzQgaHczLjIgY2hpcCAoQk1JIHZlcnNpb24gCnNpZ25hdHVy
ZXMgPSAweDA1MDMwMDAwID0gUUNBNjE3NF9IV18zXzJfVkVSU0lPTiksIHNvIEkgY2FuIGJ1eSBv
bmUgdG8gCnRlc3Qgb24gTGludXggUEMgd2l0aCB1cHN0cmVhbSBrZXJuZWwsIHRvIGVuc3VyZSBo
dzMuMCBmaXJtd2FyZSAobm90IApodzIuMSBmaXJtd2FyZSkgKGhvcGVmdWxseSB3aXRob3V0IFJ4
IG9mZmxvYWRpbmcpIHdvcmtzIHdpdGggTW9uaXRvciBNb2RlPwoKVGhhbmtzLgoKeHVlYmluZwoK
Ck9uIDA4LzI0LzIwMTYgMDU6MTEgUE0sIFh1ZWJpbmcgV2FuZyB3cm90ZToKPiBIaSBNaWNoYWws
IHRoYW5rcy4KPgo+Cj4gSGkgS2FsbGUsCj4KPiBJcyB0aGVyZSBhIHZlcnNpb24gb2YgaHczLjAg
ZmlybXdhcmUgKHdpdGhvdXQgUnggb2ZmbG9hZGluZykgZm9yIG1lIHRvIAo+IGdpdmUgYSB0cnkg
b2YgTW9uaXRvciBNb2RlIG9uIHFjYTYxNzQgaHczLjIgY2hpcD8gVGhhbmtzLgo+Cj4geHVlYmlu
Zwo+Cj4gT24gMDgvMjQvMjAxNiAwMjoxMyBQTSwgTWljaGFsIEthemlvciB3cm90ZToKPj4gT24g
MjQgQXVndXN0IDIwMTYgYXQgMDU6NTcsIFh1ZWJpbmcgV2FuZyA8eGJpbmc2QGdtYWlsLmNvbT4g
d3JvdGU6Cj4+PiBIaSBLYWxsZSwKPj4+Cj4+PiBJIGNsb25lZCB5b3VyIGF0aDEway1maXJtd2Fy
ZSBmcm9tIHlvdXIgZ2l0aHViLiBXb3VsZCB5b3UgcGxlYXNlIAo+Pj4gYWR2aXNlIHdoYXQKPj4+
IGFyZSB0aGUgZGlmZmVyZW5jZXMgb2YgaHcyLjEvZmlybXdhcmUtNSBhbmQgaHczLjAvZmlybXdh
cmUtNCBmb3IgCj4+PiBxY2E2MTc0Pwo+Pj4gRG9lcyBodzMuMC9maXJtd2FyZS00IHN1cHBvcnQg
TW9uaXRvciBNb2RlPwo+Pj4KPj4+IEkgaGF2ZSBhIHdsYW4gY2FyZCB3aXRoIEJNSSB2ZXJzaW9u
IChRQ0E2MTc0X0hXXzJfMV9WRVJTSU9OIAo+Pj4gMHgwNTAxMDAwMCkgYW5kCj4+PiBNb25pdG9y
IE1vZGUgd29ya3Mgbm8gcHJvYmxlbSB3aXRoIGxhdGVzdCBrZXJuZWwgdjQuOC1yYzIuCj4+Pgo+
Pj4gSSBoYXZlIGFub3RoZXIgd2xhbiBjYXJkIHdpdGggKFFDQTYxNzRfSFdfM18yX1ZFUlNJT04g
MHgwNTAzMDAwMCkuIEkgYW0KPj4+IHRyeWluZyB0byBiYWNrLXBvcnQgYXRoMTBrIGZyb20gdjQu
OC1yYzIgdG8gMy4xMC43MyBmb3IgdGhpcyBIV18zXzIgCj4+PiBRQ0E2MTc0Cj4+PiB3bGFuIGNh
cmQuIFZpcnR1YWwgaW50ZXJmYWNlIChtb24wKSBjYW4gYmUgYWRkZWQgYW5kIGJyb3VnaHQtdXAs
IGJ1dCAKPj4+IHRjcGR1bXAKPj4+IGNhbiBub3QgY2FwdHVyZSBhbnkgcGFja2V0cy4gSSBhbSB3
b25kZXJpbmcgaWYgaXQgY291bGQgYmUgcmVsYXRlZCB0bwo+Pj4gKGh3Mi4xL2Zpcm13YXJlLTUg
dnMgaHczLjAvZmlybXdhcmUtNCk/Cj4+IE9mZmljaWFsIGh3My54J3MgZmlybXdhcmUgc3VwcG9y
dHMgZnVsbCByeCBvZmZsb2FkLiBSeCBldmVudCB1c2VkIHRvCj4+IGRlbGl2ZXIgZnJhbWVzIGlz
IHZlcnkgc3BlY2lhbGl6ZWQgZWZmZWN0aXZlbHkgcHJldmVudGluZyBzbmlmZmluZyAvCj4+IG1v
bml0b3Igb3BlcmF0aW9uLgo+Pgo+PiBJIGRvbid0IGtub3cgaWYgdGhlcmUncyBhbnkgd2F5IGFy
b3VuZCBpdCB3aXRob3V0IGdldHRpbmcgeW91ciBoYW5kcwo+PiBvbiBmaXJtd2FyZSBidWlsZCB0
aGF0IGRvZXNuJ3QgaGF2ZSB0aGUgZnVsbCByeCBvZmZsb2FkIGNvbXBpbGVkIGluCj4+IChhc3N1
bWluZyBzdWNoIGEgYnVpbGQgZXZlbiBleGlzdHMpLgo+Pgo+Pgo+PiBNaWNoYcWCCj4+Cj4KCi0t
IApYdWViaW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

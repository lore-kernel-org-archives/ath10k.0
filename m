Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x235.google.com ([2a00:1450:4008:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOMTw-0004hB-P9
 for ath10k@lists.infradead.org; Tue, 24 Sep 2013 06:52:25 +0000
Received: by mail-bk0-f53.google.com with SMTP id d7so1523880bkh.40
 for <ath10k@lists.infradead.org>; Mon, 23 Sep 2013 23:51:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87r4cebuxm.fsf@kamboji.qca.qualcomm.com>
References: <1379509691-19904-1-git-send-email-michal.kazior@tieto.com>
 <87r4cebuxm.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 24 Sep 2013 08:51:59 +0200
Message-ID: <CA+BoTQ=Tg1Qv8qXqw8++hXiDsBXyeQKDjYesWdNg25ORMQJGRg@mail.gmail.com>
Subject: Re: [RFC] ath10k: replenish HTT RX buffers in a tasklet
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gMjQgU2VwdGVtYmVyIDIwMTMgMDg6MjIsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3
cml0ZXM6Cj4KPj4gVGhpcyBmaXhlcyBzeXN0ZW0gc3RhcnZhdGlvbiB3aGVuIHVuZGVyIGhlYXZ5
IFJYCj4+IHRyYWZmaWMuIFRoaXMgcHJvYmxlbSBjb3VsZCBiZSBvYnNlcnZlZCBvbiBBUDEzNQo+
PiBhbmQgbGVkIHRvIHdhdGNoZG9nIHJlc2V0dGluZyB0aGUgcGxhdGZvcm0uCj4+Cj4+IFBhdGNo
IHN0YXJ2ZXMgRlcgUlggcmluZyBidWZmZXIgYnkgcHJvZ3Jlc3NpdmVseQo+PiByZXBsZW5pc2hp
bmcgYnVmZmVycyB0byBhdXRvLWJhbGFuY2UgdGhlIFJYCj4+IGhhbmRsZWQgdG8gdGhlIGhvc3Qg
c3lzdGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9y
QHRpZXRvLmNvbT4KPgo+IExvb2tzIGdvb2QgdG8gbWUuIEkgc3VzcGVjdCB0aGVyZSBpcyBhIGJl
dHRlciB3YXkgdG8gZG8gdGhpcyBpbiBsb25nCj4gdGVybSwgYnV0IHRoaXMgbG9va3MgbGlrZSBh
IHZpYWJsZSBzaG9ydCB0ZXJtIHNvbHV0aW9uLgo+Cj4gRG9lcyBpdCBkZWNyZWFzZSB0aHJvdWdo
cHV0IGluIGEgbm90aWNlYWJsZSB3YXk/CgpJIGhhdmUgeWV0IHRvIG9ic2VydmUgYW55IHJlZ3Jl
c3Npb25zLgoKCk1pY2hhxYIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

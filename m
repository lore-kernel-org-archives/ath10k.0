Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx3.wp.pl ([212.77.101.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJkIQ-0007QD-2E
 for ath10k@lists.infradead.org; Fri, 06 Feb 2015 14:54:16 +0000
Date: Fri, 6 Feb 2015 15:53:43 +0100
From: Jakub =?UTF-8?B?S2ljacWEc2tp?= <moorray3@wp.pl>
Subject: Re: [PATCH v2] ath10k: Replace ioread with mb to drain write buffer
Message-ID: <20150206155343.5fe43aa9@north>
In-Reply-To: <20150206095846.5d46f11e@north>
References: <7a87e5df81499e4d26a4f8bedf76ed3250a6f7bb.1422663244.git.poh@qca.qualcomm.com>
 <20150206095846.5d46f11e@north>
MIME-Version: 1.0
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gRnJpLCA2IEZlYiAyMDE1IDA5OjU4OjQ2ICswMTAwLCBKYWt1YiBLaWNpxYRza2kgd3JvdGU6
Cj4gT24gRnJpLCAzMCBKYW4gMjAxNSAxNjoxNDozMCAtMDgwMCwgUGV0ZXIgT2ggd3JvdGU6Cj4g
PiBVc2luZyBpb3JlYWQoKSB0byBwZXJmb3JtIGRyYWluaW5nIHdyaXRlIGJ1ZmZlciBpcyBleGNl
c3NpdmUuCj4gPiBVc2UgY29tcGFjdCBBUEksIG1iKCksIHRoYXQgaW50ZW5kZWQgdG8gYmUgdXNl
ZCBmb3IgdGhlIGNhc2UuCj4gPiBJdCByZWR1Y2VzIHRvdGFsIDE0IENQVSBjbG9ja3MgcGVyIGlu
dGVycnVwdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBPaCA8cG9oQHFjYS5xdWFsY29t
bS5jb20+Cj4gCj4gSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGUgY29kZSBkb2VzIGJ1dCB0aGlzIGNo
YW5nZSBsb29rcyBzdXNwaWNpb3VzLiAKPiBVc3VhbGx5IHRoZSBwb2ludCBvZiBpb3JlYWQoKSBp
cyB0byBmbHVzaCB0aGUgaW50ZXJjb25uZWN0IGJ1ZmZlcnMgCj4gd2hpbGUgbWIoKSBlbnN1cmVz
IG9yZGVyaW5nIG9ubHkgZnJvbSB0aGUgQ1BVIHBlcnNwZWN0aXZlLgo+IAo+IENvdWxkIHlvdSBw
cm92aWRlIHRoZSByZWFzb24gKndoeSogZmx1c2hpbmcgYnVmZmVycyBpcyB1bm5lY2Vzc2FyeQo+
IGluIHRoZSBjb21taXQgbWVzc2FnZT8KCkkganVzdCBub3RpY2VkIHRoZSBkaXNjdXNzaW9uIG9u
IHRoZSBmaXJzdCB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4KU29ycnkgYWJvdXQgdGhlIG5vaXNlLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

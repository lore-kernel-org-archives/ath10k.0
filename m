Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjKwd-0003Xk-8E
 for ath10k@lists.infradead.org; Mon, 12 Sep 2016 06:42:20 +0000
Message-ID: <1473662509.4201.0.camel@sipsolutions.net>
Subject: Re: [PATCH 2/3] ath10k:  Grab rcu_read_lock before the txqs spinlock.
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 12 Sep 2016 08:41:49 +0200
In-Reply-To: <57D2CB92.3020407@candelatech.com>
 (sfid-20160909_164754_211937_A51918C3)
References: <1471569995-10028-1-git-send-email-greearb@candelatech.com>
 <1471569995-10028-2-git-send-email-greearb@candelatech.com>
 <87k2elp53z.fsf@kamboji.qca.qualcomm.com>
 <57D2CB92.3020407@candelatech.com> (sfid-20160909_164754_211937_A51918C3)
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
To: Ben Greear <greearb@candelatech.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Cj4gPiA+IC0JcmN1X3JlYWRfdW5sb2NrKCk7Cj4gPiA+IMKgwqAJc3Bpbl91bmxvY2tfYmgoJmFy
LT50eHFzX2xvY2spOwo+ID4gPiArCXJjdV9yZWFkX3VubG9jaygpOwo+ID4gCj4gPiBJJ20gbm8g
UkNVIGV4cGVydCBidXQgdGhpcyBpc24ndCBtYWtpbmcgYW55IHNlbnNlLiBNYXliZSBpdCBjaGFu
Z2VzCj4gPiB0aW1pbmdzIG9uIHlvdXIga2VybmVsIHNvIHRoYXQgaXQgaGlkZXMgdGhlIHJlYWwg
cHJvYmxlbT8KPiAKPiBJJ20gbm90IHN1cmUgdGhpcyBmaXhlZCBhbnl0aGluZyBvciBub3QsIGl0
IGp1c3Qgc2VlbWVkIHdlaXJkIHNvIEkKPiBjaGFuZ2VkIGl0Lgo+IAo+IEkgd2FzIGhvcGluZyBz
b21lb25lIHRoYXQgdW5kZXJzdG9vZCByY3UgbG9ja2luZyB3b3VsZCBjb21tZW50Li4uCj4gCgpS
Q1UgaXMgbm8gImxvY2tpbmciLiBUaGUgc29vbmVyIHlvdSBnZXQgb3ZlciB0aGF0IG5vdGlvbiwg
dGhlIGJldHRlci4KClRoaXMgdGhlcmVmb3JlIG1ha2Ugbm8gc2Vuc2Ugd2hhdHNvZXZlci4KCklu
IGZhY3QsIHlvdSB3YW50IHRvIGtlZXAgdGhlIFJDVSBwcm90ZWN0ZWQgc2VjdGlvbiAqc21hbGwq
LCBzbyBoYXZpbmcKdGhlIHNwaW5sb2NrIGluc2lkZSBodXJ0cyBvdmVyYWxsIHN5c3RlbSBwZXJm
b3JtYW5jZS4KCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFEbq-0002d6-G7
 for ath10k@lists.infradead.org; Wed, 24 Oct 2018 08:33:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 5/6] ath10k: migrate to mac80211 txq scheduling
References: <1540033534-11211-1-git-send-email-rmanohar@codeaurora.org>
 <1540033534-11211-6-git-send-email-rmanohar@codeaurora.org>
Date: Wed, 24 Oct 2018 11:33:30 +0300
In-Reply-To: <1540033534-11211-6-git-send-email-rmanohar@codeaurora.org>
 (Rajkumar Manoharan's message of "Sat, 20 Oct 2018 04:05:33 -0700")
Message-ID: <87a7n3u4kl.fsf@codeaurora.org>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

UmFqa3VtYXIgTWFub2hhcmFuIDxybWFub2hhckBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgoKPiBh
dGgxMGsgbWFpbnRhaW5zIGNvbW1vbiB0eHFzIGxpc3QgZm9yIGFsbCBzdGF0aW9ucy4gVGhpcyB0
eHEKPiBtYW5hZ2VtZW50IGNhbiBiZSByZW1vdmVkIGJ5IG1pZ3JhdGluZyB0byBtYWM4MDIxMSB0
eHEgQVBJcwo+IGFuZCBsZXQgbWFjODAyMTEgaGFuZGxlIHR4cXMgcmVvcmRlcmluZyBiYXNlZCBv
biByZXBvcnRlZCBhaXJ0aW1lLgo+IEJ5IGRvaW5nIHRoaXMsIHR4cSBmYWlybmVzcyBtYWludGFp
bmVkIGluIGF0aDEwayBpLmUgcHJvY2Vzc2luZwo+IE4gZnJhbWVzIHBlciB0eHEgaXMgcmVtb3Zl
ZC4gQnkgYWRhcHRpbmcgdG8gbWFjODAyMTEgQVBJcywKPiBhdGgxMGsgd2lsbCBzdXBwb3J0IG1h
YzgwMjExIGJhc2VkIGFpcnRpbWUgZmFpcm5lc3MgYWxnb3JpdGhtLgo+Cj4gU2lnbmVkLW9mZi1i
eTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+Cj4gU2lnbmVkLW9mZi1i
eTogUmFqa3VtYXIgTWFub2hhcmFuIDxybWFub2hhckBjb2RlYXVyb3JhLm9yZz4KCklzIFRva2Ug
dGhlIG9yaWdpbmFsIGF1dGhvcj8gVGhlbiB5b3Ugc2hvdWxkIGFkZCAiRnJvbToiIHRhZyB0byBt
YXJrCnRoYXQuIEFuZCB5b3UgbWlnaHQgd2FudCB0byB1c2UgQ28tZGV2ZWxvcGVkLWJ5IHRvIG1h
cmsgeW91cnNlbGYgYXMKY28tZGV2ZWxvcGVyLgoKLS0gCkthbGxlIFZhbG8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bqyCq-0003cz-Nr
 for ath10k@lists.infradead.org; Mon, 03 Oct 2016 08:02:37 +0000
Received: by mail-wm0-x234.google.com with SMTP id p138so135626976wmb.1
 for <ath10k@lists.infradead.org>; Mon, 03 Oct 2016 01:02:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1473801118-103112-1-git-send-email-mfaltesek@google.com>
References: <1473801118-103112-1-git-send-email-mfaltesek@google.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Mon, 3 Oct 2016 10:02:11 +0200
Message-ID: <CA+BoTQkwSX954pPEh3oYzL62H9y4Y6UuPVLSxxxCkM5AznY7NA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: cache calibration data when the core is stopped.
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTMgU2VwdGVtYmVyIDIwMTYgYXQgMjM6MTEsIE1hcnR5IEZhbHRlc2VrIDxtZmFsdGVzZWtA
Z29vZ2xlLmNvbT4gd3JvdGU6ClsuLi5dCj4gK2ludAo+ICthdGgxMGtfY2FsX2RhdGFfYWxsb2Mo
c3RydWN0IGF0aDEwayAqYXIsIHZvaWQgKipidWYpCj4gK3sKPiArICAgICAgIHUzMiBoaV9hZGRy
Owo+ICsgICAgICAgX19sZTMyIGFkZHI7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAg
IHZmcmVlKCpidWYpOwo+ICsgICAgICAgKmJ1ZiA9IHZtYWxsb2MoUUNBOTg4WF9DQUxfREFUQV9M
RU4pOwoKU2hvdWxkbid0IHlvdSB1c2UgYXItPmh3X3BhcmFtcyB0byBnZXQgaHctc3BlY2lmaWMg
Y2FsZGF0YSBsZW5ndGg/CgoKWy4uLl0KPiBAQCAtMTcxNCw2ICsxNzUwLDEyIEBAIGludCBhdGgx
MGtfY29yZV9zdGFydChzdHJ1Y3QgYXRoMTBrICphciwgZW51bSBhdGgxMGtfZmlybXdhcmVfbW9k
ZSBtb2RlKQo+Cj4gICAgICAgICBJTklUX0xJU1RfSEVBRCgmYXItPmFydmlmcyk7Cj4KPiArICAg
ICAgIC8qCj4gKyAgICAgICAgKiBXZSBhcmUgdXAgbm93LCBzbyBubyBuZWVkIHRvIGNhY2hlIGNh
bGlicmF0aW9uIGRhdGEuCj4gKyAgICAgICAgKi8KClRoZSBjb21tZW50IHN0eWxlIGlzOgoKIC8q
IGNvbW1lbnQgKi8KCklmIGl0J3MgbXVsdGktbGluZSBpdCBzaG91bGQgYmU6CgogLyogY29tbWVu
dAogICogY29tbWVudAogICovCgpEaXR0byBmb3Igb3RoZXIgaW5zdGFuY2VzLgoKClsuLi5dCj4g
QEAgLTE3NTcsNiArMTc5OSwxMSBAQCB2b2lkIGF0aDEwa19jb3JlX3N0b3Aoc3RydWN0IGF0aDEw
ayAqYXIpCj4gICAgICAgICBsb2NrZGVwX2Fzc2VydF9oZWxkKCZhci0+Y29uZl9tdXRleCk7Cj4g
ICAgICAgICBhdGgxMGtfZGVidWdfc3RvcChhcik7Cj4KPiArICAgICAgIC8qCj4gKyAgICAgICAg
KiBDYWNoZSBjYWNsaWJyYXRpb24gZGF0YSB3aGlsZSBzdG9wcGVkLgoKdHlwby4gImNhbGlicmF0
aW9uIgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

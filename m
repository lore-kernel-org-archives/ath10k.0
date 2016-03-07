Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acoHc-0001ch-JM
 for ath10k@lists.infradead.org; Mon, 07 Mar 2016 06:04:45 +0000
Received: by mail-wm0-x22d.google.com with SMTP id l68so93832295wml.0
 for <ath10k@lists.infradead.org>; Sun, 06 Mar 2016 22:04:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87ziubvfzm.fsf@kamboji.qca.qualcomm.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
 <1456828376-2795-1-git-send-email-michal.kazior@tieto.com>
 <1456828376-2795-8-git-send-email-michal.kazior@tieto.com>
 <87ziubvfzm.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 7 Mar 2016 07:04:16 +0100
Message-ID: <CA+BoTQm=vskz3WhSZjQcMLscWEs4NVoM37hpoYHMiaQb0fYyAw@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] ath10k: implement wake_tx_queue
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gNiBNYXJjaCAyMDE2IGF0IDE1OjI3LCBWYWxvLCBLYWxsZSA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBUaGlzIGltcGxlbWVudHMgdmVyeSBiYXNpYyBzdXBwb3J0IGZvciBzb2Z0d2Fy
ZQo+PiBxdWV1ZWluZy4gSXQgYWxzbyBjb250YWlucyBzb21lIGtub2JzIHRoYXQgd2lsbCBiZQo+
PiBwYXRjaGVkIGxhdGVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNo
YWwua2F6aW9yQHRpZXRvLmNvbT4KPgo+IE9kZGx5IHRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5l
dyB3YXJuaW5nOgo+Cj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYzogSW4g
ZnVuY3Rpb24gYXRoMTBrX21hY19vcF90eDoKPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTBrL21hYy5jOjM5NDk6Mjk6IHdhcm5pbmc6IGlzX21nbXQgbWF5IGJlIHVzZWQgdW5pbml0aWFs
aXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV3VuaW5pdGlhbGl6ZWRdCj4KPiBCdXQgSSB0aGluayB0
aGF0J3MganVzdCBhIGZhbHNlIHdhcm5pbmcsIG1vc3QgbGlrZWx5IGJlY2F1c2UgbXkgZ2NjIGlz
Cj4gYW5jaWVudC4gRG8geW91IGFncmVlPwoKWWVzLCBJIGFncmVlLiBJdCBtdXN0IGJlIHRoZSBm
YWN0IGlzX21nbXQgaXMgc2V0L3VzZWQgYWNyb3NzIHR3bwppc19odHQgY29uZGl0aW9uIGJyYW5j
aGVzLgoKCj4gZ2NjIChVYnVudHUvTGluYXJvIDQuNi4zLTF1YnVudHU1KSA0LjYuMwoKZ2NjIChE
ZWJpYW4gNC45LjItMTApIDQuOS4yIC0tIG5vIHdhcm5pbmcgZm9yIG1lLgoKCk1pY2hhxYIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWls
aW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

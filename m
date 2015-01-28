Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGOK9-0001eT-Te
 for ath10k@lists.infradead.org; Wed, 28 Jan 2015 08:50:11 +0000
Received: by mail-wg0-f51.google.com with SMTP id k14so19173683wgh.10
 for <ath10k@lists.infradead.org>; Wed, 28 Jan 2015 00:49:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87h9vb9uzo.fsf@kamboji.qca.qualcomm.com>
References: <1421749440-10457-1-git-send-email-michal.kazior@tieto.com>
 <87h9vb9uzo.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 28 Jan 2015 09:49:47 +0100
Message-ID: <CA+BoTQkbN1jM22KO+BP9L+E8GCfp6QssTa2xD2G=gy7WOe4MAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: implement sta keepalive command
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjggSmFudWFyeSAyMDE1IGF0IDA5OjIwLCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNv
bW0uY29tPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4g
d3JpdGVzOgo+Cj4+IEZyb206IEphbnVzeiBEemllZHppYyA8amFudXN6LmR6aWVkemljQHRpZXRv
LmNvbT4KPj4KPj4gTmV3IHdtaS10bHYgZmlybXdhcmUgZm9yIHFjYTYxNzQgaGFzIFNUQSBrZWVw
YWxpdmUKPj4gc2VydmljZSBhdmFpbGFibGUuIFRoZSBzZXJ2aWNlIGNhbiBwcm92aWRlCj4+IGF1
dG9tYXRpYyBpZGxlIGNvbm5lY3Rpb24gcG9sbGluZyB2aWEgTnVsbEZ1bmMKPj4gZnJhbWVzIHRv
IEFQIHdoZW4gYWN0aW5nIGFzIGEgY2xpZW50Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW51c3og
RHppZWR6aWMgPGphbnVzei5kemllZHppY0B0aWV0by5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+Cj4gSSBoYWQgYSB0cml2aWFs
IGNvbmZsaWN0LCBwbGVhc2UgY2hlY2sgbXkgcmVzb2x1dGlvbiBmcm9tIHRoZSBwZW5kaW5nCj4g
YnJhbmNoOgo+Cj4gQXBwbHlpbmc6IGF0aDEwazogaW1wbGVtZW50IHN0YSBrZWVwYWxpdmUgY29t
bWFuZAo+IFVzaW5nIGluZGV4IGluZm8gdG8gcmVjb25zdHJ1Y3QgYSBiYXNlIHRyZWUuLi4KPiBG
YWxsaW5nIGJhY2sgdG8gcGF0Y2hpbmcgYmFzZSBhbmQgMy13YXkgbWVyZ2UuLi4KPiBBdXRvLW1l
cmdpbmcgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWkuaAo+IEF1dG8tbWVyZ2lu
ZyBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS10bHYuaAo+IENPTkZMSUNUIChj
b250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEw
ay93bWktdGx2LmgKPiBBdXRvLW1lcmdpbmcgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEw
ay93bWktdGx2LmMKPiBDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLXRsdi5jCj4gQXV0by1tZXJnaW5nIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLW9wcy5oCj4gQ09ORkxJQ1QgKGNvbnRlbnQp
OiBNZXJnZSBjb25mbGljdCBpbiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS1v
cHMuaAo+IEZhaWxlZCB0byBtZXJnZSBpbiB0aGUgY2hhbmdlcy4KPiBQYXRjaCBmYWlsZWQgYXQg
MDAwMSBhdGgxMGs6IGltcGxlbWVudCBzdGEga2VlcGFsaXZlIGNvbW1hbmQKCkxvb2tzIGdvb2Qu
IFRoYW5rcyEKCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acoQE-0005xU-QI
 for ath10k@lists.infradead.org; Mon, 07 Mar 2016 06:13:40 +0000
Received: by mail-wm0-x229.google.com with SMTP id l68so94030236wml.0
 for <ath10k@lists.infradead.org>; Sun, 06 Mar 2016 22:13:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <874mcjwv04.fsf@kamboji.qca.qualcomm.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
 <1456828376-2795-1-git-send-email-michal.kazior@tieto.com>
 <874mcjwv04.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 7 Mar 2016 07:13:15 +0100
Message-ID: <CA+BoTQnhZfwyCEiMpDsacxNiT_TiGCb7RMOAEwGzVYn+O7ZjPw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] ath10k: implement push-pull tx model
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

T24gNiBNYXJjaCAyMDE2IGF0IDE1OjE4LCBWYWxvLCBLYWxsZSA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBUaGlzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIG5ldyBsb2dpYyB3aGVyZSBob3N0
Cj4+IHRlbGxzIGZpcm13YXJlIGhvdyBtYW55IGZyYW1lcyBhcmUgcXVldWVkIGZvciBlYWNoCj4+
IHN0YXRpb24vdGlkIGFuZCB0aGVuIGZpcm13YXJlIGFza3MgaG9zdCB0byBzdWJtaXQKPj4gZnJh
bWVzIGZvciBnaXZlbiBzdGF0aW9uL3RpZC4KPj4KPj4gVGhlIHBhdGNoIGNvdW50IGlzIGEgYml0
IGhpZ2ggYnV0IEkgdHJpZWQKPj4gc3BsaXR0aW5nIHRoZSBwYXRjaGVzIGFzIG11Y2ggYXMgcG9z
c2libGUgdG8ga2VlcAo+PiB0aGVtIHNob3J0IGFuZCBlYXN5IHRvIHJldmlldy4gSG9wZWZ1bGx5
IGl0J3Mgbm90Cj4+IGdvaW5nIHRvIGJlIGEgaHVnZSBoZWFkYWNoZS4KPj4KPj4gdjI6Cj4+ICAt
IHNxdWFzaGVzIHNvbWUgcGF0Y2hlcwo+PiAgLSByZXdvcmtlZCBwZW5kaW5nIGZyYW1lIHNjaGVk
dWxpbmcKPj4KPj4KPj4gTWljaGFsIEthemlvciAoMTEpOgo+PiAgIGF0aDEwazogcmVmYWN0b3Ig
dHggY29kZQo+PiAgIGF0aDEwazogdW5pZnkgdHhwYXRoIGRlY2lzaW9uCj4+ICAgYXRoMTBrOiBy
ZWZhY3RvciB0eCBwZW5kaW5nIG1hbmFnZW1lbnQKPj4gICBhdGgxMGs6IG1haW50YWluIHBlZXJf
aWQgZm9yIGVhY2ggc3RhIGFuZCB2aWYKPj4gICBhdGgxMGs6IGFkZCBmYXN0IHBlZXJfbWFwIGxv
b2t1cAo+PiAgIGF0aDEwazogYWRkIG5ldyBodHQgbWVzc2FnZSBnZW5lcmF0aW9uL3BhcnNpbmcg
bG9naWMKPj4gICBhdGgxMGs6IGltcGxlbWVudCB3YWtlX3R4X3F1ZXVlCj4+ICAgYXRoMTBrOiBp
bXBsZW1lbnQgdXBkYXRpbmcgc2hhcmVkIGh0dCB0eHEgc3RhdGUKPj4gICBhdGgxMGs6IHN0b3Jl
IHR4cSBpbiBza2JfY2IKPj4gICBhdGgxMGs6IGtlZXAgdHJhY2sgb2YgcXVldWUgZGVwdGggcGVy
IHR4cQo+PiAgIGF0aDEwazogaW1wbGVtZW50IHB1c2gtcHVsbCB0eAo+Cj4gSSBzYXcgdHdvIGNv
bmZsaWN0cywgcGxlYXNlIGRvdWJsZSBjaGVjayBteSByZXNvbHV0aW9ucyBpbiB0aGUgcGVuZGlu
Zwo+IGJyYW5jaDoKPgo+IEFwcGx5aW5nOiBhdGgxMGs6IGltcGxlbWVudCB3YWtlX3R4X3F1ZXVl
Cj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBkcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTBrL2h0dF9yeC5jClsuLi5dCj4gQXBwbHlpbmc6IGF0aDEwazogaW1wbGVt
ZW50IHB1c2gtcHVsbCB0eAo+IENPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4g
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfcnguYwoKTG9va3MgZ29vZCwgdGhh
bmtzIQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

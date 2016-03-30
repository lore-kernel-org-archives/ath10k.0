Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alCLK-0005Za-IH
 for ath10k@lists.infradead.org; Wed, 30 Mar 2016 09:23:15 +0000
Received: by mail-wm0-x232.google.com with SMTP id r72so90496072wmg.0
 for <ath10k@lists.infradead.org>; Wed, 30 Mar 2016 02:22:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FAA518.2000805@candelatech.com>
References: <1458898743-21118-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQk7q7VerNC1KZK49REHn9rfo6sG5zW54P=-K3XkOL77pQ@mail.gmail.com>
 <CAA93jw7BEsEOP8O2BQFXUibkGzkzBZuyWxBxs5XDCZmOt6D+Qg@mail.gmail.com>
 <CA+BoTQnDtWNGQGkBNeBGSrjkjQc4dFuivQTL=0_1D+ooE-9+RQ@mail.gmail.com>
 <56FAA518.2000805@candelatech.com>
Date: Wed, 30 Mar 2016 11:22:51 +0200
Message-ID: <CA+BoTQnBadqR4F2OSwLhiqXebzRRdLOWabHmeVQVGnSSm9vVfQ@mail.gmail.com>
Subject: Re: [RFC] ath10k: implement dql for htt tx
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
To: Ben Greear <greearb@candelatech.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, linux-wireless <linux-wireless@vger.kernel.org>, Dave Taht <dave.taht@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjkgTWFyY2ggMjAxNiBhdCAxNzo1NCwgQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVj
aC5jb20+IHdyb3RlOgo+IE9uIDAzLzI5LzIwMTYgMTI6NDkgQU0sIE1pY2hhbCBLYXppb3Igd3Jv
dGU6Cj4KPj4+IGlmIHlvdSBhcmUgZ2V0dGluZyBhIHB1cmUgY29kZWwgcmVzdWx0IG9mIDE2MG1z
LCB0aGF0IG1lYW5zIHRoZQo+Pj4gaW1wbGVtZW50YXRpb24gaXMgYnJva2VuLiBCdXQgSSB0aGlu
ayAoYWZ0ZXIgaGF2aW5nIHJlYWQgeW91cgo+Pj4gZGVzY3JpcHRpb24gdHdpY2UpLCB0aGUgYmFz
ZWxpbmUgcmVzdWx0IHRvZGF5IG9mIDE2MG1zIG9mIHF1ZXVpbmcgd2FzCj4+PiB3aXRoIGEgZnFf
Y29kZWwgKnFkaXNjKiBkb2luZyB0aGUgd29yayBvbiB0b3Agb2YgaHVnZSBidWZmZXJzLAo+Pgo+
Pgo+PiBZZXMuIFRoZSAxNjBtcyBpcyB3aXRoIGZxX2NvZGVsIHFkaXNjIHdpdGggYXRoMTBrIGRv
aW5nIERRTCBhdCA2bWJwcy4KPj4gV2l0aG91dCBEUUwgYXRoMTBrIHdvdWxkIGNsb2cgdXAgYWxs
IHR4IHNsb3RzICgxNDI0IG9mIHRoZW0pIHdpdGgKPj4gZnJhbWVzLiBBdCA2bWJwcyB5b3UgdHlw
aWNhbGx5IHdhbnQvbmVlZCBhIGhhbmRmdWwgKDUtMTApIG9mIGZyYW1lcyB0bwo+PiBiZSBxdWV1
ZWQuCj4KPgo+IEhhdmUgeW91IGFjdHVhbGx5IHZlcmlmaWVkIHlvdSBjYW4gdXNlIGFsbCB0eCBz
bG90cz8KCkl0IHdvcmtzIGluIG1vc3QgY2FzZXMuIEkgZ3Vlc3MgeW91J3JlIHN1c3BlY3Rpbmcg
c29tZSBvZiB5b3VyCnR4KGZsdXNoaW5nPykgcHJvYmxlbXMgbWlnaHQgYmUgaW5kdWNlZCBieSBv
dmVyY29tbWl0aW5nPwoKPiBUaGUgd2F5IHRoZQo+IGZpcm13YXJlIHVzZXMgaXQncyB0eCBidWZm
ZXJzIEkgdGhpbmsgeW91IG1heSBub3QgYmUgYWJsZSB0byBhY3R1YWxseQo+IGRvIHRoYXQuLi5h
bmQgaW4gcHJhY3RpY2UsIHlvdSB3aWxsIGdldCBhIGxvdCBmZXdlciB1c2FibGUgdHgtYnVmZmVy
cwo+IHRoYW4gY29uZmlndXJlZC4uLi4KCkNvdWxkIGJlLCBlLmcuIEknbSBhd2FyZSBtYW5hZ2Vt
ZW50IGZyYW1lcyBhcmUga2luZCBvZiBhIHNwZWNpYWwgY2FzZQppbiByZWNlbnQgZmlybXdhcmUg
cmV2aXNpb25zLgoKV2hhdCB3b3VsZC9kbyB5b3UgZXhwZWN0IGZpcm13YXJlIHdvdWxkL3dpbGwg
ZG8gd2hlbiB3ZSBvdmVyY29tbWl0PwpUaGUgZHJpdmVyIGRvZXMgYWR2ZXJ0aXNlIG51bWJlciBv
ZiBIVFQgdHggc2xvdHMgc28gSSB3b3VsZCBleHBlY3QgaXQKdG8gd29yayBmaW5lIGlmIGl0IGRp
ZG4ndCBjcmFzaCBkdXJpbmcgYm9vdC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTBrCg==

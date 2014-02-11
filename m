Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22b.google.com ([2a00:1450:4008:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WD6fb-0007qW-BD
 for ath10k@lists.infradead.org; Tue, 11 Feb 2014 06:18:12 +0000
Received: by mail-bk0-f43.google.com with SMTP id mx11so2094103bkb.16
 for <ath10k@lists.infradead.org>; Mon, 10 Feb 2014 22:17:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1392052405-15337-1-git-send-email-marek.puzyniak@tieto.com>
References: <1392052405-15337-1-git-send-email-marek.puzyniak@tieto.com>
Date: Tue, 11 Feb 2014 07:17:45 +0100
Message-ID: <CA+BoTQ=q-940AsMfneU5SP8Ke1RxEZE12rrm4Z+KBaTBjrW64w@mail.gmail.com>
Subject: Re: [PATCH] ath10k: change simulate_fw_crash to work with 10.1
 firmware
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTAgRmVicnVhcnkgMjAxNCAxODoxMywgTWFyZWsgUHV6eW5pYWsgPG1hcmVrLnB1enluaWFr
QHRpZXRvLmNvbT4gd3JvdGU6Cj4gV21pIGNvbW1hbmQgV01JX0ZPUkNFX0ZXX0hBTkdfQ01ESUQg
aXMgbm90IHN1cHBvcnRlZAo+IGluIGZpcm13YXJlIDEwLjEuIEluIG9yZGVyIHRvIGhhdmUgZmly
bXdhcmUgY3Jhc2ggc2ltdWxhdGlvbgo+IGZ1bmN0aW9uYWxpdHkgYWxzbyBpbiBmaXJtd2FyZSAx
MC4xIGRyaXZlciBjYW4gZm9yY2UgZmlybXdhcmUKPiBjcmFzaCBieSBwZXJmb3JtaW5nIG5vdCBh
bGxvd2VkIG9wZXJhdGlvbi4gRHJpdmVyIGNhbiBkZWxpYmVyYXRlbHkKPiBjcmFzaCBmaXJtd2Fy
ZSB3aGVuIHNldHRpbmcgdmRldiBwYXJhbSBmb3IgdmRldiBpZCBvdXQgb2YgcmFuZ2UuCj4KPiBD
b21tYW5kIHRvIHRyaWdnZXIgZmlybXdhcmUgY3Jhc2g6Cj4gZWNobyAiY3Jhc2giID4gL3N5cy9r
ZXJuZWwvZGVidWcvaWVlZTgwMjExL3BoeVgvYXRoMTBrL3NpbXVsYXRlX2Z3X2NyYXNoCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNYXJlayBQdXp5bmlhayA8bWFyZWsucHV6eW5pYWtAdGlldG8uY29tPgo+
IC0tLQoKVGhlICdmdyBoYW5nIGFzc2VydCcgY3Jhc2ggY2FuIGJlIHJlY292ZXJlZCB3aXRoIGEg
d2FybSByZXNldCBidXQgYQpyZWFsIGNyYXNoIGNhbid0LiBUaHVzLCBJIHRoaW5rIHRoZSB0d28g
Y3Jhc2ggbWV0aG9kcyBzaG91bGQgYmUKZGlzdGluZ3Vpc2hhYmxlIGJ5IGhhdmluZyBlaXRoZXIg
dHdvIHNlcGFyYXRlIGRlYnVnZnMgZmlsZXMgb3IgdHdvCnNlcGFyYXRlIHRyaWdnZXIga2V5d29y
ZHMuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

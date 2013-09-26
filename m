Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP6Gf-0005ON-Sz
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 07:45:46 +0000
Received: by mail-bk0-f49.google.com with SMTP id r7so260660bkg.22
 for <ath10k@lists.infradead.org>; Thu, 26 Sep 2013 00:45:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87a9j0t5ep.fsf@kamboji.qca.qualcomm.com>
References: <1380028158-861-1-git-send-email-michal.kazior@tieto.com>
 <87a9j0t5ep.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 26 Sep 2013 09:45:23 +0200
Message-ID: <CA+BoTQke6JstVxtRxUinSxWMP6WDcO3JuqiaXqivSO2QD1aVgw@mail.gmail.com>
Subject: Re: [PATCH 0/5] ath10k: improve RX performance
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

T24gMjYgU2VwdGVtYmVyIDIwMTMgMDk6MjEsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3
cml0ZXM6Cj4KPj4gVGhpcyBwYXRjaHNldCBnaXZlcyBjbGVhciBSWCBwZXJmb3JtYW5jZQo+PiBp
bXByb3ZlbWVudCBvbiBBUDEzNS4gVGhyb3VnaHB1dCBpcyBhdCBsZWFzdAo+PiBkb3VibGVkICgz
MDBtYnBzIC0+IDYwMG1icHMsIFVEUCBSWCwgMngyKS4KPj4KPj4gVGhpcyBjb250YWlucyBhIHdv
cmthcm91bmQgZm9yCj4+IHJldHJhbnNtaXNzaW9uL2R1cGxpY2F0aW9uIHJlY292ZXJ5Lgo+Pgo+
PiBUaGVyZSdzIGEgcGVuZGluZyBwYXRjaCBmb3IgbWFjODAyMTEgdGhhdCB3aWxsCj4+IGFsbG93
IHByb3BlciBpbmRpdmlkaXVhbCBBLU1TRFUgc3ViZnJhbWUKPj4gcmVwb3J0aW5nLgo+Pgo+PiBD
aGFuZ2VzIHNpbmNlIFJGQzoKPj4gICogY29tbWVudHMgZml4ZXMgKEthbGxlKQo+PiAgKiBvbmUg
cGF0Y2ggZXh0cmFjdGVkL3NwbGl0IChLYWxsZSkKPj4gICogY29tbWl0IG1lc3NhZ2UgYWRqdXN0
bWVudHMKPj4KPj4KPj4gTWljaGFsIEthemlvciAoNSk6Cj4+ICAgYXRoMTBrOiByZXBvcnQgQS1N
U0RVIHN1YmZyYW1lcyBpbmRpdmlkdWFsbHkKPj4gICBhdGgxMGs6IGRvY3VtZW50IGRlY2FwIG1v
ZGVzCj4+ICAgYXRoMTBrOiBjbGVhbnVwIFJYIGRlY2FwIGhhbmRsaW5nCj4+ICAgYXRoMTBrOiBm
aXggTmF0aXZlIFdpZmkgZGVjYXAgbW9kZSBSWAo+PiAgIGF0aDEwazogYWxpZ24gUlggZnJhbWVz
IHByb3Blcmx5Cj4KPiBBbGwgZml2ZSBhcHBsaWVzLCB0aGFua3MuCj4KPiBUaGVyZSB3ZXJlIGZl
dyBsb25nIGxpbmVzLCBJIGZpeGVkIHRob3NlIG15c2VsZi4gQ2FuIHlvdSBwbGVhc2UgZG91Ymxl
Cj4gY2hlY2sgdGhhdCBJIGRpZG4ndCBicmVhayBhbnl0aGluZz8KPgo+IEthbGxlCj4KPiBGb3Ig
cGF0Y2ggMSBJIGRpZDoKPgo+ICguLi4pCgpMb29rcyBnb29kLiBUaGFua3MhCgoKTWljaGHFgi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBt
YWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

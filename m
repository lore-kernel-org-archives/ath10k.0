Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alV4p-0000lK-KS
 for ath10k@lists.infradead.org; Thu, 31 Mar 2016 05:23:28 +0000
Received: by mail-wm0-x22c.google.com with SMTP id 191so112588167wmq.0
 for <ath10k@lists.infradead.org>; Wed, 30 Mar 2016 22:23:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FC3C30.5060302@candelatech.com>
References: <56FAD6D6.9030105@candelatech.com>
 <CA+BoTQn8ptm785Dn14fT7OObFoTEeq2ym7AQFmu889P_BDt6jw@mail.gmail.com>
 <56FC3C30.5060302@candelatech.com>
Date: Thu, 31 Mar 2016 07:23:02 +0200
Message-ID: <CA+BoTQ=t_wF7N_b=Hw98H44yHrAwSY0Hqd_g9wixasFZKjAjpw@mail.gmail.com>
Subject: Re: How is tx-flushing supposed to work now?
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
Cc: ath10k <ath10k@lists.infradead.org>

T24gMzAgTWFyY2ggMjAxNiBhdCAyMjo1MCwgQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVj
aC5jb20+IHdyb3RlOgo+IE9uIDAzLzMwLzIwMTYgMDM6MzggQU0sIE1pY2hhbCBLYXppb3Igd3Jv
dGU6Cj4+Cj4+IE9uIDI5IE1hcmNoIDIwMTYgYXQgMjE6MjYsIEJlbiBHcmVlYXIgPGdyZWVhcmJA
Y2FuZGVsYXRlY2guY29tPiB3cm90ZToKPj4+Cj4+PiBXaGVuIHdlIGhhdmUgbXVsdGlwbGUgdmRl
dnMsIGFuZCB0aGUgMTAuNC4zIGZpcm13YXJlIHdpdGggdGhlIHR4LXB1c2gKPj4+IGxvZ2ljLAo+
Pj4gaG93IGlzIGZsdXNoaW5nIHN1cHBvc2VkIHRvIHdvcms/Cj4+Cj4+Cj4+IFRoaXMgaXNuJ3Qg
cmVhbGx5IGFzIG11Y2ggYWJvdXQgcHVsbC1wdXNoIGxvZ2ljIGluIDEwLjQuMyBhcyBpdCBpcwo+
PiBhYm91dCB3YWtlX3R4X3F1ZXVlKCkgaW4gZ2VuZXJhbCwgaXMgaXQ/Cj4KPgo+IEluIHBhcnRp
Y3VsYXIsIEkgYW0gY3VyaW91cyBhYm91dCB0aGUgYXItPnR4cXMsIGFuZCB0aGUKPiBhdGgxMGtf
bWFjX3R4X3B1c2hfcGVuZGluZwo+IG1ldGhvZC4gIFNob3VsZCB3ZSBwdXJnZSB0aGUgYXItPnR4
cXMgYXMgcGFydCBvZiB0aGUgZmx1c2ggbG9naWM/CgpObyBuZWVkIHRvLiBJZiBtYWM4MDIxMSBw
dXJnZXMgc29tZSB0eHFzIGF0aDEwayB3aWxsIGV2ZW50dWFsbHkgdmlzaXQKYW4gZW1wdHkgdHhx
IGFuZCByZW1vdmUgaXQgKHB1c2gvdGhyZXNob2xkIG1vZGUpLiBJZiBhdGgxMGsgRlcgaXMgaW4K
cHVsbC1wdXNoIGl0J2xsIHByb21wdCBmZXRjaC1pbmQgZXZlbnQgd2hpY2ggd2lsbCAxKSBzdWJt
aXQgMCBmcmFtZXMKMikgdXBkYXRlIGhvc3RxIHN0YXRlLgoKCk1pY2hhxYIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK

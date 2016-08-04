Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVBCt-0001Pp-E3
 for ath10k@lists.infradead.org; Thu, 04 Aug 2016 05:28:36 +0000
Received: by mail-wm0-x236.google.com with SMTP id q128so471570827wma.1
 for <ath10k@lists.infradead.org>; Wed, 03 Aug 2016 22:28:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <29736815-4728-181c-6656-527eb85c8fb3@dd-wrt.com>
References: <1470046905-17449-1-git-send-email-benjamin@sipsolutions.net>
 <1470046905-17449-3-git-send-email-benjamin@sipsolutions.net>
 <CA+BoTQ=cwMMQXWOd8TocVcUeV5+_0-HNFO=9a5KNr=q2vWDfgA@mail.gmail.com>
 <29736815-4728-181c-6656-527eb85c8fb3@dd-wrt.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Thu, 4 Aug 2016 07:28:08 +0200
Message-ID: <CA+BoTQn30T9w1E63Ch51oYRJYuRBNLORy4=xAeEGzDo2yZqPbQ@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] ath10k: Allow setting coverage class
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Benjamin Berg <benjamin@sipsolutions.net>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Simon Wunderlich <sw@simonwunderlich.de>

T24gMyBBdWd1c3QgMjAxNiBhdCAxNzozNywgU2ViYXN0aWFuIEdvdHRzY2hhbGwgPHMuZ290dHNj
aGFsbEBkZC13cnQuY29tPiB3cm90ZToKPgo+Pj4gKyAgICAgICBpZiAodmFsdWUgPCAwKQo+Pj4g
KyAgICAgICAgICAgICAgIHZhbHVlID0gYXItPmZ3X2NvdmVyYWdlLmNvdmVyYWdlX2NsYXNzOwo+
Pj4gKwo+Pj4gKyAgICAgICAvKiBCcmVhayBvdXQgaWYgdGhlIGNvdmVyYWdlIGNsYXNzIGFuZCBy
ZWdpc3RlcnMgaGF2ZSB0aGUKPj4+IGV4cGVjdGVkCj4+PiArICAgICAgICAqIHZhbHVlLgo+Pj4g
KyAgICAgICAgKi8KPj4+ICsgICAgICAgaWYgKHZhbHVlID09IGFyLT5md19jb3ZlcmFnZS5jb3Zl
cmFnZV9jbGFzcyAmJgo+Pj4gKyAgICAgICAgICAgc2xvdHRpbWVfcmVnID09IGFyLT5md19jb3Zl
cmFnZS5yZWdfc2xvdHRpbWVfY29uZiAmJgo+Pj4gKyAgICAgICAgICAgdGltZW91dF9yZWcgPT0g
YXItPmZ3X2NvdmVyYWdlLnJlZ19hY2tfY3RzX3RpbWVvdXRfY29uZikKPj4+ICsgICAgICAgICAg
ICAgICBnb3RvIHVubG9jazsKPj4KPj4gSSB3b3VsZCBtb3ZlIHRoaXMgcGFydCB0byB0aGUgY2Fs
bGVyIGFuZCBrZWVwIHRoZSBoYXJkd2FyZS1zcGVjaWZpYwo+PiBmdW5jdGlvbiBqdXN0IGNvbXB1
dGUgYW5kIHNldCByZWdpc3RlcnMsIGUuZy4gaGF2ZQo+PiBhdGgxMGtfbWFjX3NldF9jb3ZlcmFn
ZV9jbGFzcyAoYXMgb3Bwb3NlZCB0bwo+PiBhdGgxMGtfbWFjX29wX3NldF9jb3ZlcmFnZV9jbGFz
cykuIEl0IHNob3VsZCBhbHNvIHJlZHVjZSBzb21lIGNvZGUKPj4gZHVwbGljYXRpb24uCj4KPiBk
b2VzbnQgbWFrZSBzZW5zZS4gaSBhbHJlYWR5IGVuaGFuY2VkIHRoaXMgY29kZSB0byBzdXBwb3J0
IGJlZWxpbmVyICg5OXh4KQo+IGFuZCBuZXdlcnMuCj4gdGhlIGNvZGUgaXMgdGhhdCBtdWNoIGRp
ZmZlcmVudCB0aGF0IHRoaXMgY2hlY2sgbmVlZCB0byBiZSB0cmVhZGVkIGluIGEKPiBpbmRpdnVk
dWFsIHdheQo+IHJlZ19zbG90dGltZV9jb25mIGlzIGhhcmR3YXJlIGRlZmFjdG8gc3BlY2lmaWMg
c2luY2UgdGhlIHZhbHVlIGlzIHRha2VuIGZyb20KPiBhIGhhcmR3YXJlIHNwZWNpZmljIHJlZ2lz
dGVyLgo+IHlvdSBjYW5ub3QgaGFuZGxlIHRoaXMgb3V0c2lkZSB0aGlzIGZ1bmN0aW9uIHNpbmNl
IG90aGVyIGNoaXBzIGhhdmUKPiBkaWZmZXJlbnQgcmVnaXN0ZXJzLgoKQWgsIHlvdSdyZSByaWdo
dCwgbXkgYmFkIDopCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

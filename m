Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from universe.cdot.in ([49.128.111.121])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e7gMd-0007IR-Il
 for ath10k@lists.infradead.org; Thu, 26 Oct 2017 11:30:26 +0000
Received: from cdot.in (localhost [127.0.0.1])
 by universe.cdot.in (8.14.4/8.13.1) with ESMTP id v9QBKPxS008375
 for <ath10k@lists.infradead.org>; Thu, 26 Oct 2017 16:50:25 +0530
From: "KAVITA MATHUR" <kavitam@cdot.in>
Subject: Throughput drop with ath10k latest driver and
 firmware-5.bin_10.2.4.70.66
Date: Thu, 26 Oct 2017 16:50:25 +0530
Message-Id: <20171026105416.M52662@cdot.in>
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
To: ath10k <ath10k@lists.infradead.org>

SGksCiAKSW4gbXkgQVAgLCB0aGVyZSBhcmUgdHdvIHJhZGlvcywgb25lIGF0aDlrIGJhc2VkIG1v
ZHVsZSBXTEUyMDBOWCBhbmQgc2Vjb25kIGF0aDEwayBiYXNlZApXTEU2MDBWWC4KCkkgY29uZmln
dXJlZCBib3RoIHRoZSByYWRpb3MgYXMgQVAgaW4gSUVFRSA4MDIuMTFhIDQwIE1IeiBIVCBtb2Rl
IGFuZCBwZXJmb3JtZWQKdGhyb3VnaHB1dCB0ZXN0LgoKTWVhc3VyZWQgdGhyb3VnaHB1dCB3aXRo
IGF0aDlrIGlzIDE2NE1icHMgd2hpbGUgd2l0aCBhdGgxMGsgaXQgaXMgMTM3TWJwcy4gSSBjb3Vs
ZCBub3QKdW5kZXJzdGFuZCB0aGUgcmVhc29uIG9mIHRoaXMgZHJvcCgyNyBNYnBzKT8gCgpNeSB0
ZXN0IHNldHVwIHdhcyBpbnNpZGUgUkYtU2hpZWxkLiBUaGVyZSB3YXMgbm8gaW50ZXJmZXJlbmNl
IGFuZCBzeXN0ZW0gd2FzIGFzc29jaWF0ZWQKYXQgMzAwTWJwcyBpbiBib3RoIGNhc2VzLgoKYXRo
MTBrIGRyaXZlciB3YXMgdGFrZW4gZnJvbSBhdGgxMGsgZ2l0IGFuZCBmaXJtd2FyZSB2ZXJzaW9u
IGlzCmZpcm13YXJlLTUuYmluXzEwLjIuNC43MC42Ni4gCmF0aDlrIGRyaXZlcyB3YXMgdGFrZW4g
ZnJvbSBzdGFibGUgYmFja3BvcnQgcmVsZWFzZSBiYWNrcG9ydC00LjQuMi0xLgoKa2VybmVsIHZl
cnNpb24gOiAzLjEyCm9wZW53cnQgdmVyc2lvbiA6IENoYW9zIENhbG1lciAxNS4wNS4wCgpQbGVh
c2Ugc3VnZ2VzdCBtZSBob3cgY2FuIEkgaW5jcmVhc2UgdGhlIHRocm91Z2hwdXQgb2YgbXkgQVAu
IAoKCgoKVGhhbmtzICYgUmVnYXJkcywK4KSV4KS14KS/4KSk4KS+IOCkruCkvuCkpeClgeCksCBL
YXZpdGEgTWF0aHVyIArgpLXgpLDgpL/gpLfgpY3gpKAg4KSF4KSo4KWB4KS44KSC4KSn4KS+4KSo
IOCkheCkreCkv+Ckr+CkguCkpOCkviAgU2VuaW9yIFJlc2VhcmNoIEVuZ2luZWVyIArgpLjgpYAt
4KSh4KWJ4KSfICAgICAgICAgICAgICAgICAgICAgIEMtRE9UCuCkh+CksuCliOCkleCljeCkn+Cl
jeCksOClieCkqOCkv+CkleCljeCkuCDgpLjgpL/gpJ/gpYAg4KSr4KWH4KSc4KS8IEkgICAgICAg
ICBFbGVjdHJvbmljcyBDaXR5IFBoYXNlIEkK4KS54KWL4KS44KWC4KSwIOCksOCli+CkoSwg4KSs
4KWH4KSC4KSX4KSy4KWC4KSw4KWBICAgICAgICAgICAgICAgSG9zdXIgUm9hZCwgQmVuZ2FsdXJ1
IOKAkyA1NjAxMDAK4KSr4KWL4KSoICBQaCAwODAtMjg1Mjk4OTYKRGlzY2xhaW1lcjoKLS0tLS0t
LS0tLQpUaGlzIGVtYWlsIGFuZCBhbnkgZmlsZXMgdHJhbnNtaXR0ZWQgd2l0aCBpdAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

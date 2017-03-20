Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from universe.cdot.in ([49.128.111.121])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cpsZ9-0007v4-NJ
 for ath10k@lists.infradead.org; Mon, 20 Mar 2017 08:21:26 +0000
From: "KAVITA MATHUR" <kavitam@cdot.in>
Subject: Not able to set 0dBm Transmit Power using Backport 4.4.2-1 ath9k
 driver 
Date: Mon, 20 Mar 2017 13:43:08 +0530
Message-Id: <20170320080704.M21991@cdot.in>
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
To: ath10k@lists.infradead.org, ath9k-devel@qca.qualcomm.com

SGksCgpJIGhhdmUgdXNlZCBhdGhlcm9zIDkyMjAgYmFzZWQgV0xNMjAwTlggUkYgY2FyZCBpbiBt
eSBBY2Nlc3MgcG9pbnQgc3lzdGVtLmF0aDlrIGRyaXZlcgpoYXMgYmVlbiB0YWtlbiBmcm9tIGJh
Y2twb3J0IDQuNC4yLTEgcmVsZWFzZS4gVGhlIG1pbmltdW0gdHJhbnNtaXQgcG93ZXIgaXMgc2V0
IDNkQm0gZm9yCnRoZSBzeXN0ZW0uIEkgd2FudCB0byBzZXQgMGRCbSB0byB0ZXN0IHN5c3RlbSBp
bnNpZGUgUkYgc2hpZWxkIFRlbnQsIGJ1dCBpdCBnaXZlcyBtZSAzZEJtLiAKCktlcm5lbCBWZXJz
aW9uIDo6IDMuMTIKQXRoOWsgVmVyc2lvbiA6OiBCYWNrcG9ydCA0LjQuMi0xCgpXaGVuIEkgdXNl
ZCBpbmJ1aWx0IGF0aDlrIGRyaXZlciBmcm9tIExpbnV4IGtlcm5lbCAzLjEyLCBJIGFtIGFibGUg
dG8gc2V0IDBkQm0uCgpQbGVhc2UgaGVscCBtZSB0byBmaXggdGhpcyBwcm9ibGVtLgoKVGhhbmtz
ICYgUmVnYXJkcywK4KSV4KS14KS/4KSk4KS+IOCkruCkvuCkpeClgeCksCBLYXZpdGEgTWF0aHVy
IArgpLXgpLDgpL/gpLfgpY3gpKAg4KSF4KSo4KWB4KS44KSC4KSn4KS+4KSoIOCkheCkreCkv+Ck
r+CkguCkpOCkviAgU2VuaW9yIFJlc2VhcmNoIEVuZ2luZWVyIArgpLjgpYAt4KSh4KWJ4KSfICAg
ICAgICAgICAgICAgICAgICAgIEMtRE9UCuCkh+CksuCliOCkleCljeCkn+CljeCksOClieCkqOCk
v+CkleCljeCkuCDgpLjgpL/gpJ/gpYAg4KSr4KWH4KSc4KS8IEkgICAgICAgICBFbGVjdHJvbmlj
cyBDaXR5IFBoYXNlIEkK4KS54KWL4KS44KWC4KSwIOCksOCli+CkoSwg4KSs4KWH4KSC4KSX4KSy
4KWC4KSw4KWBICAgICAgICAgICAgICAgSG9zdXIgUm9hZCwgQmVuZ2FsdXJ1IOKAkyA1NjAxMDAK
4KSr4KWL4KSoICBQaCAwODAtMjg1Mjk4OTYKRGlzY2xhaW1lcjoKLS0tLS0tLS0tLQpUaGlzIGVt
YWlsIGFuZCBhbnkgZmlsZXMgdHJhbnNtaXR0ZWQgd2l0aCBpdAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK

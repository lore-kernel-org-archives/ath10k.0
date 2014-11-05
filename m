Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlw9d-00072E-7M
 for ath10k@lists.infradead.org; Wed, 05 Nov 2014 08:41:26 +0000
Received: by mail-pd0-f176.google.com with SMTP id ft15so327034pdb.35
 for <ath10k@lists.infradead.org>; Wed, 05 Nov 2014 00:41:03 -0800 (PST)
Received: from Mac-Pro.local ([147.46.243.214])
 by mx.google.com with ESMTPSA id yt3sm2488004pbc.34.2014.11.05.00.36.00
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Wed, 05 Nov 2014 00:36:01 -0800 (PST)
Date: Wed, 5 Nov 2014 17:35:59 +0900
From: Okhwan Lee <ohlee@mwnl.snu.ac.kr>
Message-ID: <etPan.5459e16f.19495cff.8770@Mac-Pro.local>
Subject: 11ac packet capture using Wireshark & QCA9880
MIME-Version: 1.0
Content-Disposition: inline
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
To: "=?utf-8?Q?ath10k=40lists.infradead.org?=" <ath10k@lists.infradead.org>

SGkgYWxsLMKgCgpXZSBpbnN0YWxsIGEgc3RhdGlvbiB0byBjYXB0dXJlIDExYWMgcGFja2V0cyB1
c2luZyB3aXJlc2hhcmsuwqAKVGhlIHN0YXRpb24gZXF1aXBzIHdpdGggUUNBIDk4ODAgYW5kIG9w
ZXJhdGVzIMKgVWJ1bnR1IChLZXJuZWwgdmVyc2lvbiAzLjE2LjEpCldlIGFsc28gaW5zdGFsbCBi
YWNrcG9ydCAoMy4xNi4xKSB0byB1c2UgdGhlIGVtZXJnaW5nIGF0aDEwayBkZXZpY2UgZHJpdmVy
IGFuZCAxMC4xLjQ2Ny4yLTEgZmlybXdhcmUuwqAKCkluIG91ciB0ZXN0YmVkLCB0aGVyZSBpcyB0
aHJlZSBub2RlcywgQVAgKEFTVVMgQUM2NiksIGNsaWVudCAoUUNBOTg4MCkgYW5kIHRoZSBtb25p
dG9yIHN0YXRpb24gKFFDQTk4ODApLsKgClRoZSBtb25pdG9yIHN0YXRpb24gY2FuIGNhcHR1cmUg
dGhlIHBhY2tldHMgdHJhbnNtaXR0ZWQgYnkgQVAgYnV0IG5vdCBjYXB0dXJlIHRoZSBwYWNrZXRz
IHRyYW5zbWl0dGVkIGJ5IHRoZSBjbGllbnQuwqAKV2UgdXNlIHRoZSBzYW1lIHBhcmFtZXRlciBz
ZXR0aW5ncyAoTUNTfjAsIDEgc3RyZWFtcywgMjAgTUh6IGJhbmR3aWR0aCwgQkNDLCBsb25nIHBy
ZWFtYmxlKSBvbiBib3RoIEFQIGFuZCBjbGllbnQsIHNvIHRoZXJlIG1heSBiZSBubyBwYWNrZXQg
ZXJyb3Igb3IgbG9zcy7CoApXZSBhbHNvIGNvbmZpcm0gdGhhdCB0aGUgcGFja2V0cyB0cmFuc21p
dHRlZCBieSBBUCBjb250YWluIFZIVCBpbmZvcm1hdGlvbi7CoApJbiBvdGhlciB3b3JkLCDCoHRo
ZSBtb25pdG9yIHN0YXRpb24gY2FuIGNhcHR1cmUgMTFhYyBwYWNrZXRzIChWSFQtUFBEVSkuwqAK
CklzIHRoZXJlIGFueSByZWFzb24gd2h5IFFDQSA5ODgwIGNhbiBub3QgY2FwdHVyZSBvbmx5IHBh
Y2tldHMgdHJhbnNtaXR0ZWQgYnkgdGhlIGNsaWVudCBlcXVpcHBlZCB3aXRoIFFDQTk4ODA/Cgot
LcKgCk9raHdhbiBMZWUKU2VudCB3aXRoIEFpcm1haWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK

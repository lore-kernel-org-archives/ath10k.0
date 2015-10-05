Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zj6v3-0007aR-Qd
 for ath10k@lists.infradead.org; Mon, 05 Oct 2015 14:39:14 +0000
Received: by igxx6 with SMTP id x6so58667977igx.1
 for <ath10k@lists.infradead.org>; Mon, 05 Oct 2015 07:38:51 -0700 (PDT)
Received: from amphitrite.acdjdg.dingman.org
 ([2601:801:200:c44c:ba86:87ff:fe46:f003])
 by smtp.gmail.com with ESMTPSA id q11sm10367975ioe.19.2015.10.05.07.38.50
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Oct 2015 07:38:50 -0700 (PDT)
Message-ID: <1444055929.9501.14.camel@dingman.org>
Subject: QCA6164 txbf failure
From: "Andrew C. Dingman" <andrew@dingman.org>
Date: Mon, 05 Oct 2015 10:38:49 -0400
Mime-Version: 1.0
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
To: ath10k@lists.infradead.org

SXQgbG9va3MgbGlrZSB0aGUgUUNBNjE2NCBpbiBteSBMZW5vdm8gWW9nYSAzIDExIiBoYXMgcHJv
YmxlbXMgd2l0aAp0eGJmLiBJJ20gdXNpbmcgRmVkb3JhIHdpdGggYSA0LjMuMC1yYzMga2VybmVs
IGZyb20gS29qaS4gKEEKZGV2ZWxvcG1lbnQgYnVpbGQgc3lzdGVtIC0gaXQncyBub3QgYSByZWxl
YXNlZCBrZXJuZWwpCgpVc2luZyBmaXJtd2FyZSBmcm9twqBodHRwczovL2dpdGh1Yi5jb20va3Zh
bG8vYXRoMTBrLWZpcm13YXJlLmdpdMKgZXhjZXB0CmZvciB0aGUgYm9hcmQuYmluLCB3aGljaCBj
YW1lwqBodHRwczovL2dpdGh1Yi5jb20vYXRvbmR3YWwvYXRoMTBrLWZpcm13YQpyZS5naXQuIFNw
ZWNpZmljYWxseSwgdG8gZ2V0IHRoZSBjYXJkIHRvIGJvb3QgSSByYW4gInN1ZG8gY3AKYXRoMTBr
L1FDQTYxNjQvaHcyLjEvYm9hcmQuYmluCi9saWIvZmlybXdhcmUvYXRoMTBrL1FDQTYxNzQvaHcy
LjEvYm9hcmQtcGNpLTE2OGM6MDA0MToxN2FhOjM1NDUuYmluIgpmcm9tIHRoZSBsYXR0ZXIgZ2l0
IHJlcG8uCgpVc2luZyB0aGUgdW5tb2RpZmllZCA0LjMga2VybmVsIGFib3ZlLCB0aGlzIGFsbG93
ZWQgdGhlIGNhcmQgdG8gYmUKcmVjb2duaXplZCwgYW5kIGV2ZW4gcmVwb3J0IHN1Y2Nlc3NmdWwg
YXV0aGVudGljYXRpb24gYW5kIGFzc29jaWF0aW9uCnRvIGFuIGFjY2VzcyBwb2ludCBpbiBkbWVz
Zy4gSG93ZXZlciwgaXQgbmV2ZXIgY29tcGxldGVkIGEgY29ubmVjdGlvbiwKYW5kIHNjYW5uaW5n
IGFjY2VzcyBwb2ludHMgZmFpbGVkLgoKQmFzZWQgb24gdGhlIGRtZXNnIG91dHB1dCwgbWljaGFs
ayBpbiBJUkMgc3VnZ2VzdGVkIHRoYXQgSSB0cnkgYXBwbHlpbmcKdGhlIHBhdGNoIGZyb20gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2F0aDEway8yMDE1LUF1Z3VzdC8KMDA1
OTA5Lmh0bWwuwqBXaXRoIHRoYXQgY2hhbmdlLCB0aGUgZGV2aWNlIHNlZW1zIHRvIHdvcmsgZmlu
ZS4KCi1BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

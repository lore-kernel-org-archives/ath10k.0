Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFZkZ-0003kt-EM
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 02:17:47 +0000
Received: by mail-la0-f46.google.com with SMTP id b8so4119798lan.5
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 19:17:24 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 7 Aug 2014 19:17:24 -0700
Message-ID: <CABnBrYXRSY7naVpKTthim=bhZ6zTj4STLhuRgYUiXvsTJCuD-Q@mail.gmail.com>
Subject: Firmware crash w/ iperf 30 minutes
From: Denton Gentry <denton.gentry@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Can anyone tell me what this firmware crash means?
It happens after running iperf on several clients for about a half hour.

ath10k: firmware crashed!
ath10k: hardware name qca988x hw2.0 version 0x4100016c
ath10k: firmware version: 10.1.467.2-1
ath10k: target register Dump Location: 0x0040A904
ath10k: target Register Dump
ath10k: [00]: 0x4100016C 0x000015B3 0x009A1C3D 0x00955B31
ath10k: [04]: 0x009A1C3D 0x00060330 0x00000011 0x0041D3C0
ath10k: [08]: 0x00000001 0x00447800 0x00000001 0x004345B8
ath10k: [12]: 0x00000009 0xFFFFFFFF 0x0095808C 0x009580A2
ath10k: [16]: 0x00958080 0x0094085D 0x00000000 0x00000000
ath10k: [20]: 0x409A1C3D 0x0040AA14 0x00000011 0x00000001
ath10k: [24]: 0x809A1832 0x0040AA74 0x00000000 0xC09A1C3D
ath10k: [28]: 0x809A1A33 0x0040AAC4 0x00448590 0x00447800
ath10k: [32]: 0x809A1AA1 0x0040AAF4 0x0043DD84 0x00000002
ath10k: [36]: 0x8098CE0E 0x0040AB14 0x0043DD84 0x0040AB54
ath10k: [40]: 0x80997CA7 0x0040AB34 0x004343F0 0x0040AB54
ath10k: [44]: 0x809AABDD 0x0040AB54 0x009BAF9C 0x00997C44
ath10k: [48]: 0x80997507 0x0040ABB4 0x0043DC98 0x009BAFF4
ath10k: [52]: 0x80997CE5 0x0040ABF4 0x009BAF9C 0x00000003
ath10k: [56]: 0x809AA9CB 0x0040AC14 0x009BAF9C 0x00000006

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

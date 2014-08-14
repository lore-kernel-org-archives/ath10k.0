Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from f117.i.mail.ru ([128.140.171.228])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XI1fX-0003G8-Tv
 for ath10k@lists.infradead.org; Thu, 14 Aug 2014 20:30:45 +0000
Received: from [91.76.86.191] (ident=mail)
 by f117.i.mail.ru with local (envelope-from <drserge@inbox.ru>)
 id 1XI1f6-0005jf-9n
 for ath10k@lists.infradead.org; Fri, 15 Aug 2014 00:30:16 +0400
From: =?UTF-8?B?U2VyZ2UgRHJ1emhpbmlu?= <drserge@inbox.ru>
Subject: =?UTF-8?B?ZmlybXdhcmUgMTAuMS40NjcuMi0xIGNyYXNo?=
Mime-Version: 1.0
Date: Fri, 15 Aug 2014 00:30:16 +0400
Message-ID: <1408048216.124582840@f117.i.mail.ru>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: =?UTF-8?B?U2VyZ2UgRHJ1emhpbmlu?= <drserge@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?B?YXRoMTBr?= <ath10k@lists.infradead.org>

Hello!

Got firmware crash on Compex WLE900VX (168c:003c), log:

[ 1518.821290] ath10k: firmware crashed!
[ 1518.821305] ath10k: hardware name qca988x hw2.0 version 0x4100016c
[ 1518.821311] ath10k: firmware version: 10.1.467.2-1
[ 1518.822336] ath10k: target register Dump Location: 0x0040AD64
[ 1518.823359] ath10k: target Register Dump
[ 1518.823375] ath10k: [00]: 0x4100016C 0x000015B3 0x00948ED1 0x00955B31
[ 1518.823382] ath10k: [04]: 0x00948ED1 0x00060130 0x00000004 0x00000000
[ 1518.823389] ath10k: [08]: 0x00955B31 0x00400600 0x00400000 0x00400A00
[ 1518.823395] ath10k: [12]: 0x00000009 0xFFFFFFFF 0x0095808C 0x009580A2
[ 1518.823403] ath10k: [16]: 0x00958080 0x0094085D 0x00000000 0x0094085D
[ 1518.823409] ath10k: [20]: 0x40948ED1 0x0040AE74 0x00409244 0x00000000
[ 1518.823415] ath10k: [24]: 0x80948F10 0x0040AED4 0x00000004 0xC0948ED1
[ 1518.823421] ath10k: [28]: 0x80942EB3 0x0040AEF4 0x00000000 0x004045F4
[ 1518.823425] ath10k: [32]: 0x80940F18 0x0040AF14 0x0000001C 0x00403BB0
[ 1518.823429] ath10k: [36]: 0x80940EEA 0x0040AF44 0x00400000 0x00000000
[ 1518.823434] ath10k: [40]: 0x80940F31 0x0040AF64 0x00401C10 0x00400600
[ 1518.823440] ath10k: [44]: 0x40940024 0x0040AF84 0x004068E8 0x004068E8
[ 1518.823444] ath10k: [48]: 0x00000000 0x0040AFA4 0x009BB001 0x00040020
[ 1518.823448] ath10k: [52]: 0x80940F31 0x0040AF64 0x00401C10 0x00400600
[ 1518.823452] ath10k: [56]: 0x00000001 0x00401BF0 0x0040423C 0x00400000
[ 1521.820623] ath10k: failed to put down monitor vdev 1: -11
[ 1524.819348] ath10k: failed to to request monitor vdev 1 stop: -11
[ 1529.817236] ath10k: failed to synchronise monitor vdev 1: -110
[ 1529.817240] ath10k: failed to stop monitor vdev: -110
[ 1532.815966] ath10k: failed to request wmi monitor vdev 1 removal: -11
[ 1532.815970] ath10k: failed to delete monitor vdev: -11
[ 1533.715869] ath10k_pci 0000:02:00.0: irq 51 for MSI/MSI-X
[ 1535.738366] ath10k: device successfully recovered

And also see this message each time drivers starts:

[ 2148.003745] ath10k: peer-unmap-event: unknown peer id 2

Best wishes, drserge.
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

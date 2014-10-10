Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out06.msg.oleane.net ([62.161.7.4])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcfUu-0005au-2D
 for ath10k@lists.infradead.org; Fri, 10 Oct 2014 19:05:05 +0000
Content-class: urn:content-classes:message
Subject: ath10k firmware crash
Date: Fri, 10 Oct 2014 16:46:40 +0200
Message-ID: <773DB8A82AB6A046AE0195C68612A319018C2750@sbs2003.acksys.local>
MIME-Version: 1.0
From: "Cedric VONCKEN" <cedric.voncken@acksys.fr>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

	Hi all, =


	I'm trying to use ath10k in client mode and AP mode with 2 wireless cards =
(Ap on one card and client on another card).
	The AP mode work, but the client mode always crash. Please find below the =
ath10k crash information

[=A0=A0 79.131301] ath10k: hardware name qca988x hw2.0 version 0x4100016c
[=A0=A0 79.149420] ath10k: firmware version: 999.999.0.636
[=A0=A0 79.167248] ath10k: target register Dump Location: 0x0040AC14
[=A0=A0 79.185939] ath10k: target Register Dump
[=A0=A0 79.201804] ath10k: [00]: 0x4100016C 0x00000000 0x009C4521 0x00000000
[=A0=A0 79.220184] ath10k: [04]: 0x009C4521 0x00060330 0x00000019 0x00955A00
[=A0=A0 79.238566] ath10k: [08]: 0x0000D0CE 0x00000000 0x0040CC94 0x00000020
[=A0=A0 79.256945] ath10k: [12]: 0x00000000 0x00000000 0x00958360 0x0095836B
[=A0=A0 79.275327] ath10k: [16]: 0x809A0978 0x0040AD94 0x00439304 0x0040D074
[=A0=A0 79.293706] ath10k: [20]: 0x0000FFFF 0x00000000 0x0041EFB8 0x00000000
[=A0=A0 79.312086] ath10k: [24]: 0x809A0978 0x0040AD94 0x00439304 0x0343389A
[=A0=A0 79.330466] ath10k: [28]: 0x809AD1A2 0x0040ADE4 0x00439304 0x0043F68C
[=A0=A0 79.348845] ath10k: [32]: 0x809B01DA 0x00000000 0x00410110 0x0041937C
[=A0=A0 79.367224] ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
[=A0=A0 79.385604] ath10k: [40]: 0x00000000 0x00000000 0x00000071 0x00412700
[=A0=A0 79.403984] ath10k: [44]: 0x00439BB8 0x00000000 0x00000000 0x00400000
[=A0=A0 79.422364] ath10k: [48]: 0x809AE0B4 0x0040AE04 0x00400000 0x0043F68C
[=A0=A0 79.440744] ath10k: [52]: 0x00000001 0x00000000 0x004231F0 0x00400000
[=A0=A0 79.459124] ath10k: [56]: 0x809AE17E 0x0040AE44 0x0040FE6C 0x0040D310

	I'm using openwrt, and I have the same problem with/without configuration =
option "Firmware optimized for sta operation".

	Is it possible to use at the same time on 2 different cards the AP mode an=
d client mode?

Cedric Voncken =



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

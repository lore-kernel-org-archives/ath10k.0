Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cflgb-00068h-Pk
 for ath10k@lists.infradead.org; Mon, 20 Feb 2017 10:59:20 +0000
Received: by mail-wr0-x236.google.com with SMTP id s27so14821013wrb.2
 for <ath10k@lists.infradead.org>; Mon, 20 Feb 2017 02:58:56 -0800 (PST)
MIME-Version: 1.0
From: "K.Mani" <sailormani@gmail.com>
Date: Mon, 20 Feb 2017 16:28:54 +0530
Message-ID: <CACBNxUG+N7X6pxcTqTeESVt9O_KOhH0BHL9daoTmUKj8N1pt0g@mail.gmail.com>
Subject: ath10k: MAC Address
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
To: ath10k@lists.infradead.org

I'm using QCA8994, with PCIe bus the first two bytes of MAC address is
returned as Null. This behavior is seen on all the 6 devices.

log: wmi event ready sw_version 16777216 abi_version 3 mac_addr
00:00:79:55:a0:14

Annapurna board(Alpine soc V1) on kernel-linux-3.10.20 openWRT
FW: board-2.bin, firmware-5.bin

Help needed.

Thanks
Mani

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

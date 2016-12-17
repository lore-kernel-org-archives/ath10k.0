Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cIMkp-0000LW-Q8
 for ath10k@lists.infradead.org; Sat, 17 Dec 2016 21:42:56 +0000
Received: by mail-wm0-x243.google.com with SMTP id m203so11781869wma.3
 for <ath10k@lists.infradead.org>; Sat, 17 Dec 2016 13:42:35 -0800 (PST)
Received: from DESKTOPFU0R907 ([213.57.52.209])
 by smtp.gmail.com with ESMTPSA id j1sm13094899wjm.26.2016.12.17.13.42.32
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 17 Dec 2016 13:42:33 -0800 (PST)
From: "Mikhail Sokolovskyy" <msokolovskii@gmail.com>
Subject: Compex WLE900VX wireless driver
Date: Sat, 17 Dec 2016 23:42:31 +0200
Message-ID: <000301d258ae$79b8be70$6d2a3b50$@gmail.com>
MIME-Version: 1.0
Content-Language: ru-ua
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

HI to all!


I've been trying to build my own wireless router from a regular PC for a
while now. Everything works fine except the wireless NIC Compex WLE900VX
which is based on Atheros QCA9880 chipset. Although I am able to run it in n
mode I'm getting this output on the command "dmesg | grep ath10". 

[    2.134534] ath10k_pci 0000:02:00.0: could not fetch firmware file
'ath10k/QCA988X/hw2.0/firmware-4.bin': -2
[    2.134561] ath10k_pci 0000:02:00.0: could not fetch firmware file
'ath10k/QCA988X/hw2.0/firmware-3.bin': -2

The card doesn't want to start at ac mode at all. The OS is ClearOS which is
based on Red Hat products. Here is the output for "ethtool -i wlp2s0"

driver: ath10k_pci
version: 3.10.0-327.36.3.v7.x86_64
firmware-version: 999.999.0.636
bus-info: 0000:02:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no 

Any help is much appreciated. If any extra information needed please let me
know.
Thanks!


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

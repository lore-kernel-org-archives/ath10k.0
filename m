Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.nic.cz ([2001:1488:800:400::400])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYLJp-00025B-Kn
 for ath10k@lists.infradead.org; Mon, 08 Jan 2018 00:29:39 +0000
Received: from localhost (unknown [172.20.6.218])
 by mail.nic.cz (Postfix) with ESMTPS id 9959963487
 for <ath10k@lists.infradead.org>; Mon,  8 Jan 2018 01:29:22 +0100 (CET)
Date: Mon, 8 Jan 2018 01:28:51 +0100
From: Marek Behun <marek.behun@nic.cz>
Subject: QCA6174 SDIO support?
Message-ID: <20180108012851.389d37c7@nic.cz>
MIME-Version: 1.0
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

Hello,

we at CZ.NIC are trying the current ath10k driver with High Latency +
SDIO support (which was done by Silex Technology) on our board. The
supported chip, QCA9377, works, but we only have 1x1 MIMO boards with
this chip. We are trying to get it work with 8274B-SR (QCA6174)
( http://www.fn-link.com/a-b-g-n-ac-wi-fi-bt-module/8274b-sr.html )

There is already some code in sdio.c mentoining QCA6174, but there are
no nodes in ath10k_hw_params. Because QCA6174 is supported via PCI bus,
I tried to write the ath10k_hw_params node (see patch
http://blackhole.sk/~kabel/src/qca6174.patch ) but do not know if the
changes I did are enough, because the driver fails after loading
firmware.

And the firmware is another point: Does board-sdio.bin have to be
different from board.bin? Do we have to create this binary ourselves,
or should the 8274B-SR board manufacturer sent us one? (We didn't
receive anything from fn-link.)

Any information is good, please let us know even if you have NDA on
this and therefore cannot give any more information about this.

Thank you.

Marek Behun, CZ.NIC

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

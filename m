Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smail.rz.tu-ilmenau.de ([141.24.186.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL3wB-0003lA-SP
 for ath10k@lists.infradead.org; Mon, 29 Apr 2019 10:55:09 +0000
Received: from [192.168.2.97] (wlan-control.prakinf.tu-ilmenau.de
 [141.24.207.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smail.rz.tu-ilmenau.de (Postfix) with ESMTPSA id 7D8F5580088
 for <ath10k@lists.infradead.org>; Mon, 29 Apr 2019 12:55:00 +0200 (CEST)
From: Markus Theil <markus.theil@tu-ilmenau.de>
Subject: [BUG] QCA9888 unable to tx data frames in mesh mode (fw:
 10.4-3.9.0.2-00024)
Message-ID: <4c59eaed-a39c-0041-3951-463edbf9c925@tu-ilmenau.de>
Date: Mon, 29 Apr 2019 12:55:00 +0200
MIME-Version: 1.0
Content-Language: en-US
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

Hi,

I currently use a QCA9888 based NIC in mesh mode under Linux 5.0.9.
Contrasting to other modes, like STA or AP, the card does not send data
frames to other stations in mesh mode (cannot see them in monitor mode
on nearby mesh devices). Receiving frames seems to work (I can see them
in tcpdump on the same box). I use the newest available firmware
10.4-3.9.0.2-00024.

Best regards,
Markus



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

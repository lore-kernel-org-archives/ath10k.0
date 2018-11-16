Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNeL0-0003cX-Gm
 for ath10k@lists.infradead.org; Fri, 16 Nov 2018 13:39:12 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 01C0521C6B
 for <ath10k@lists.infradead.org>; Fri, 16 Nov 2018 08:38:55 -0500 (EST)
Received: from adell35 (unknown [190.130.101.161])
 by mail.messagingengine.com (Postfix) with ESMTPA id 33EA0E414B
 for <ath10k@lists.infradead.org>; Fri, 16 Nov 2018 08:38:54 -0500 (EST)
Date: Fri, 16 Nov 2018 08:38:51 -0500
From: Anil Duggirala <anilduggirala@fastmail.fm>
Subject: missing firmware in debian 9
Message-ID: <20181116133851.czjhgfmttodnudzg@adell35>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

hello,
I am getting this message at boot.

[   10.678576] ath10k_pci 0000:03:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:03:00.0.bin (-2)
[   10.678631] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:03:00.0.bin failed with error -2
[   10.678655] ath10k_pci 0000:03:00.0: firmware: failed to load ath10k/cal-pci-0000:03:00.0.bin (-2)        
[   10.678699] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/cal-pci-0000:03:00.0.bin failed with error -2
[   10.681081] ath10k_pci 0000:03:00.0: firmware: failed to load ath10k/QCA6174/hw3.0/firmware-5.bin (-2)
[   10.681127] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
[   10.681131] ath10k_pci 0000:03:00.0: could not fetch firmware file 'ath10k/QCA6174/hw3.0/firmware-5.bin': -2  

I have installed the firmware-atheros package from backports in Debian 9, I had installed the package from the main repository before but I was also getting this message. I have also installed the firmware-linux-free package.

Help please,
thanks,

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from edge10.ethz.ch ([82.130.75.186])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlIs2-0005z4-OY
 for ath10k@lists.infradead.org; Thu, 23 Apr 2015 15:16:55 +0000
From: "Costa Molero  Edgar" <cedgar@student.ethz.ch>
Subject: Modifing and installing ath10k driver for kernel 4.0
Date: Thu, 23 Apr 2015 15:16:31 +0000
Message-ID: <BB63CF2605733841BD56CD9C38AC1F7E1E678CA8@MBX23.d.ethz.ch>
Content-Language: ca-ES
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi all,

In order to use the latest firmware version (10.2.4.48) for my access point  I installed the kernel version 4.0 in my Ubuntu 14.04 LTS laptop.

The problem is that with the ath10k driver it comes the option debug is not enabled, and my domain regulatory database do not allow me to use 80Mhz channels.

Before upgrading the kernel, I was using the latest backports release 3.19-r1-1-1. To install that driver I downloaded it then I enabled all the configuration options I needed for my project (debug, debugfs, etc) and I also modified the regulatory database by changing the content of the file /net/wireless/db.txt.

I never compiled a linux kernel. And therefore I don't quite understand what should I do know to modify the current driver version. (I just want to change the db.txt file and enable debug) Then I want to compile the driver and install it. Could some one give me some hints ?

Should not the driver source code be located at that  directory ? /usr/src/linux-headers-4.0.0-040000-generic/drivers/net/wireless/ath/ath10k# , and also the db.txt located here :/usr/src/linux-headers-4.0.0-040000-generic/net/wireless# .

Sorry for the long question and hope someone can guide me a little bit.

Edgar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

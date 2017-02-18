Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from fb1.poissonnet.fr ([82.235.198.48])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfDb9-0007s3-MH
 for ath10k@lists.infradead.org; Sat, 18 Feb 2017 22:35:26 +0000
Received: from 85.47.132.77.rev.sfr.net ([77.132.47.85]:53568
 helo=[192.168.1.97])
 by fb1.poissonnet.fr with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.80 and XAMS 0.2.4) id 1cfCzd-00051p-5r
 for ath10k@lists.infradead.org; Sat, 18 Feb 2017 22:56:37 +0100
From: Hugo Poissonnet <hugo@poissonnet.fr>
Subject: Performance issue with QCA9377
Message-ID: <49b97f14-be91-7cce-cac7-189253a2b805@poissonnet.fr>
Date: Sat, 18 Feb 2017 23:04:41 +0100
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello,
I recently get a laptop with a QCA9377 wifi chipset. I encountered major 
performance issue with kernel 4.4.0-53 (ubuntu generic build). I can 
connect to wifi network but performance are very bad below 1Mb/s (iperf 
with TCP). The network connection is very unstable, multiple disconnect 
in minutes.
I check the performance under Windows with same distance and same 
condition, I get 12Mb/s. So I upgrade to kernel 4.8.0-36 and performance 
are much better around 8Mb/s and no disconnection nor dmesg warn.

With 4.4 kernel in syslog/dmesg there is a lot of:
ath10k_pci 0000:02:00.0: no channel configured; ignoring frame(s)!
ath10k_warn: 217 callbacks suppressed

Sincerely yours,

Hugo Poissonnet

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

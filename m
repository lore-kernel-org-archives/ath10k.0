Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([79.140.42.25] helo=mail.mail.packetmixer.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vql0u-0006WM-Uz
 for ath10k@lists.infradead.org; Wed, 11 Dec 2013 14:43:49 +0000
Received: from prime.localnet (drsd-4dbd9d5e.pool.mediaWays.net
 [77.189.157.94])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.mail.packetmixer.de (Postfix) with ESMTPSA id 4F64E7107C
 for <ath10k@lists.infradead.org>; Wed, 11 Dec 2013 14:33:36 +0000 (UTC)
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Firmware Questions
Date: Wed, 11 Dec 2013 15:32:47 +0100
MIME-Version: 1.0
Message-Id: <201312111532.47679.sw@simonwunderlich.de>
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

Hey ath10k-devs,

since there are many firmwares uploaded now, I'd like to ask some questions 
about them. ;)

The ath10k-firmware repository[1] has two folders which are appearently from 
different branches. The ath10k (currently shipped default in OpenWRT) is 
supposed to support all modes, while the "ap" firmware appears to be optimzed 
for AP mode. I've tried both firmwares in OpenWRT with my QCA9882-based card in 
AP mode, and with the "ath10k" firmware there were some throughput problems 
while the "ap" showed some very good results (up to 250 mbit/s for my single 
stream cell phone in iperf).

As the firmware wiki page [2] appears to be a little outdated (it doesn't 
mention the "ap" firmware branch), my questions are:

 * are both firmwares still developed, or is one of them deprecated?
 * Is it possible to use IBSS mode with one or both of them? Since the AP 
branch worked better (for me), from what we have now I'd prefer this one. :)
 * if yes, is it possible to use AP and IBSS mode at the same time?
 * since there are different firmwares in the "ap" folder (389, 467 and 
untested/436), is there a changelog for them?
 * Are the limitations and capabilities of these firmwares documented 
somewhere?

Thanks,
    Simon

[1] https://github.com/kvalo/ath10k-firmware
[2] http://wireless.kernel.org/en/users/Drivers/ath10k/firmware

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

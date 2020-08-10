Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5Fys-0000O9-QD
 for ath10k@lists.infradead.org; Mon, 10 Aug 2020 22:09:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id x15so1075101plr.11
 for <ath10k@lists.infradead.org>; Mon, 10 Aug 2020 15:09:19 -0700 (PDT)
MIME-Version: 1.0
From: Ahmed Zaki <anzaki@gmail.com>
Date: Tue, 11 Aug 2020 00:08:41 +0200
Message-ID: <CANczwAH=3UvKNnN3Zhkbdizi8vf0vUFkNNFEX-op0gr8Stj5LQ@mail.gmail.com>
Subject: WMM not working for mcast packets on ath10k
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
Cc: ahmed nader <anzaki@gmail.com>

Hello,

I have 2 ath10k devices set in Mesh Point mode. When I use iptables'
DSCP target to set the WMM AC for some traffic ports to VO, the rules
work fine but only for unicast packets. All broadcast on the target
UDP ports goes out as BE, and not VO.

With some ath10k debugging enabled, it seems that the htt is indeed
sending the tx descriptor with the correct tid (6) set.

Is this the intended behavior for some reason? If not, is there any
more debugging on the TX path that I can do?

Any help is appreciated. Thank you.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

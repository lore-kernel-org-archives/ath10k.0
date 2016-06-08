Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.kau.se ([193.10.220.39] helo=nasse.dc.kau.se)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAfnl-0005gX-Dp
 for ath10k@lists.infradead.org; Wed, 08 Jun 2016 15:53:54 +0000
From: Andreas Kassler <andreas.kassler@kau.se>
Subject: Channel Switch Time
Message-ID: <8817589a-13bf-5c59-a3f2-c5bdadf2906b@kau.se>
Date: Wed, 8 Jun 2016 17:53:23 +0200
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: andreas.kassler@kau.se
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi,
we want to implement fast channel switching on ATH10K for IBSS mode. Any 
pointer on firmware modifications that allow to do that fast would be 
appreciated. Currently, we observe a latency of 2.5 sec under traffic. 
Also, 802.11h support for CSA would be nice to have in IBSS mode. How 
can we trigger this? I mean what interface do we have from outside to 
trigger a fast channel switch that then issues a 802.11h CSA so that all 
peers would also switch the channel, ideally in millisecond time?

Andreas
-- 
Andreas Kassler
==================================
Prof. Dr. Andreas J. Kassler
Computer Science Department - Telematics
Universitetsgatan 2
SE-65188 Karlstad
Sweden
Tel.: ++46 (0)54 700-2168
Fax: ++46 (0)54 700-1828
eMail: kassler@ieee.org
skype: andreaskassler
MSN: andreaskassler@hotmail.com
Web: www.cs.kau.se/~andreask


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

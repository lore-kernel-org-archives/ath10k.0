Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mcgraw.st-andrews.ac.uk ([138.251.8.95])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4slz-00011t-09
 for ath10k@lists.infradead.org; Wed, 09 Jul 2014 14:23:04 +0000
Received: from dyn-195-212.cs.st-andrews.ac.uk
 (dyn-195-212.cs.st-andrews.ac.uk [138.251.195.212])
 (authenticated bits=0)
 by mcgraw.st-andrews.ac.uk (8.14.3/8.14.3/Debian-9.4) with ESMTP id
 s69EMEIc011934
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
 for <ath10k@lists.infradead.org>; Wed, 9 Jul 2014 14:22:15 GMT
From: Mamun Abu-Tair <ma86@st-andrews.ac.uk>
Subject: Throughput is very low
Message-Id: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
Date: Wed, 9 Jul 2014 15:22:09 +0100
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
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


Dear all, 
I am trying to do throughput test with copmex AC cards Model (WLE900VX 7AA) .,using hostapd running on the server and  one client. 

I used Kalle sitting for the hostapd. However, the maximum throughput i can get is around 70Mbit/s which is far away from the throughput achieved by many users (UDP traffic). 

I have notice that Bit Rate keeps fixed 6 Mb/s . and it dose not responding to any commands to change it. 

The machines used: 
 Ubuntu 12.04, Kerenl 3.16 , updated regulatory to cover 80Mhz channels , and the latest  firmware 

Your help is appreciated . 
Kind regards 
Mamun


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.quicksilver.com ([68.1.194.114])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZMxQ-0003z8-8r
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 19:22:14 +0000
Received: from [192.168.1.144] ([192.168.1.144]) (authenticated bits=0)
 by mail.quicksilver.com (8.15.2/8.15.2/Debian-3) with ESMTPA id v12JLoP1024067
 for <ath10k@lists.infradead.org>; Thu, 2 Feb 2017 11:21:51 -0800
From: Michael Everett Feder <mfeder@quicksilver.com>
Subject: Does ath10k's spectral scan support I/Q or phase-magnitude?
Message-ID: <a1743d94-25bb-b273-6626-dbb283479540@quicksilver.com>
Date: Thu, 2 Feb 2017 11:21:50 -0800
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

I understand that both the ath9k and the ath10k drivers support a 
spectral scan feature with an FFT output. But the ath9k's output only 
lists the magnitudes of each frequency bin, and doesn't seem to support 
in-phase/quadrature (I/Q) or phase-magnitude output. I was wondering if 
the ath10k driver's spectral scan supports an I/Q or phase-magnitude 
output or, like ath9k, it just supports magnitude only?


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

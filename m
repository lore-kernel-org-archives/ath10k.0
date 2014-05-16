Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wl9uy-0000wt-7b
 for ath10k@lists.infradead.org; Fri, 16 May 2014 04:38:48 +0000
Received: by mail-vc0-f175.google.com with SMTP id hu19so5607110vcb.34
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 21:38:26 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 16 May 2014 12:38:26 +0800
Message-ID: <CAEFj986_nUoRY7qOf7=6divui_sa2tMnfjd8vS0w00Mk62GqnA@mail.gmail.com>
Subject: Protected flag is clear in Monitor Mode
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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

Hi, all

I try to use ath10k (firmware version 10.1.467.2-1_ as standalone
monitor mode. I assume that monitor mode will allows the frame to pass
to upper layer without any modification.

But it seems that the protected flag in frame control is clear while I
capture with wireshark. I has verified that the ath9k has not such
issue and the protected flag is set.

So is this a known issue in monitor mode for ath10k?

-----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

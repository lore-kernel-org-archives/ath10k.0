Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpE1V-00064n-90
 for ath10k@lists.infradead.org; Tue, 27 May 2014 09:50:21 +0000
Received: by mail-vc0-f176.google.com with SMTP id id10so6922939vcb.35
 for <ath10k@lists.infradead.org>; Tue, 27 May 2014 02:49:59 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 27 May 2014 17:49:59 +0800
Message-ID: <CAEFj986qfY7yKpNha7vojY77TPeOLcJgk1mJqr++tyXG-qiwqA@mail.gmail.com>
Subject: warning message
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

I have tested the ath-next with iperf, and one as AP and another one
as STA. I have received a lot of following warning messages:

[ 1812.690000] ath10k: failed to pop chained msdus, dropping
[ 1812.690000] ath10k: failed to pop amsdu from htt rx ring -22
[ 1812.980000] ath10k: failed to pop chained msdus, dropping
[ 1812.990000] ath10k: failed to pop amsdu from htt rx ring -22
[ 1815.360000] ath10k: failed to pop chained msdus, dropping
[ 1815.370000] ath10k: failed to pop amsdu from htt rx ring -22
[ 1815.380000] ath10k: failed to pop chained msdus, dropping
[ 1815.390000] ath10k: failed to pop amsdu from htt rx ring -22
[ 1815.490000] ath10k: failed to pop chained msdus, dropping
[ 1815.500000] ath10k: failed to pop amsdu from htt rx ring -22

Anyone has the same issue?

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

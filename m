Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ws76x-0003yO-10
 for ath10k@lists.infradead.org; Wed, 04 Jun 2014 09:03:55 +0000
Received: by mail-vc0-f180.google.com with SMTP id hq11so6285062vcb.11
 for <ath10k@lists.infradead.org>; Wed, 04 Jun 2014 02:03:31 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 4 Jun 2014 17:03:30 +0800
Message-ID: <CAEFj986inLh+Upgx-rVF0zviii+yaQZnr9cuMYOXAqEjXrVMvQ@mail.gmail.com>
Subject: Bridging problem in ath10k (STA)
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

I just found out that the bridging is not able to work for STA mode
even for firmware 10.1.467.2-1 if the AP is operating at 80MHz.

But it is working if the AP is operating at 20MHz or 802.11n instead
of 802.11ac. But off course, the STA needs to associate with AP first
before bridging.

Anyone has the similar problem?

----
ChunYeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

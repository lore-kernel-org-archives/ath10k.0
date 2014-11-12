Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XofZ5-00015R-6Z
 for ath10k@lists.infradead.org; Wed, 12 Nov 2014 21:34:59 +0000
Received: by mail-lb0-f173.google.com with SMTP id n15so10178838lbi.32
 for <ath10k@lists.infradead.org>; Wed, 12 Nov 2014 13:34:35 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 12 Nov 2014 16:34:35 -0500
Message-ID: <CABfbVPKXg2HiVHuEy13s2_F=xw5nxyC7r0J229LsfRgGHySCMg@mail.gmail.com>
Subject: RE: Ath10k leaves AR9880 in a state that will not enumerate again
 when CPU warm booted
From: David Dailey <daileycrew@gmail.com>
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

I discovered that this issue seems to follow at least 2 different
chipsets (AR9880 and AR9890) but doesn't happen with at least two BCM
chipsets.  And the enumeration failing after a warm boot doesn't
depend on ath10k loading at all.  Even with the module not present on
the system, the device doesn't enumerate after cold boot.  So it
appears this is something unique to the PCIe core on Atheros, not
ath10k.  I guess the only hope would be if somehow the unload of the
driver could restore the chipset back to a state where it would
enumerate again, but I don't have information on the chipset at that
level.

Dave

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from bias.opendreams.net ([107.191.118.74])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1boq5L-0005ny-Sr
 for ath10k@lists.infradead.org; Tue, 27 Sep 2016 10:58:04 +0000
From: J Mo <jmomo@jmomo.net>
Subject: Activity LEDs for QCA9980
Message-ID: <168ca60f-a193-ff87-9339-ff7b32fe3d02@jmomo.net>
Date: Tue, 27 Sep 2016 03:57:42 -0700
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


Hello!

I would like to inquire (belligerently pester) as to the possibility of 
getting LED activity lights working for the QCA9980.

I recently ported LEDE to a new router device which uses this chip, the 
fifth such LEDE device which I know of using it.

For these routers, the "WiFi" LEDs on our devices are controlled via the 
QCA9980 chip, not some SoC GIPO.

Heinz, one of the illustrious fellows working on the TP-Link Archer 
C2600, found this example u-boot code which seems to enable LED control:

https://forum.openwrt.org/viewtopic.php?pid=336237#p336237

Is this information helpful, or are there other things holding this 
feature back for this chip and driver?

Thanks in advance


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

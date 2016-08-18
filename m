Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from atlantic540.startdedicated.de ([188.138.9.77])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baN7m-0005M8-21
 for ath10k@lists.infradead.org; Thu, 18 Aug 2016 13:13:12 +0000
From: Daniel Wagner <wagi@monom.org>
Subject: [PATCH 0/2] wireless: Use complete() instead complete_all()
Date: Thu, 18 Aug 2016 15:12:04 +0200
Message-Id: <1471525926-20384-1-git-send-email-wagi@monom.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Daniel Wagner <daniel.wagner@bmw-carit.de>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Christian Lamparter <chunkeey@googlemail.com>

From: Daniel Wagner <daniel.wagner@bmw-carit.de>

Hi,

Using complete_all() is not wrong per se but it suggest that there
might be more than one reader. For -rt I am reviewing all
complete_all() users and would like to leave only the real ones in the
tree. The main problem for -rt about complete_all() is that it can be
uses inside IRQ context and that can lead to unbounded amount work
inside the interrupt handler. That is a no no for -rt.

The patches grouped per subsystem and in small batches to allow
reviewing.

This series ignores all complete_all() usages in the firmware loading
path. They will be hopefully address by Luis' sysdata patches [0].
That leaves a couple of complete_all() calls.

The first patch fixes a real glitch for the carl9170 driver. I was
able to test it because I have the hardware. For the second one I
haven't found any dongle with that chip in my drawers. 

This series against net-next of today.

cheers,
daniel

[0] https://lkml.kernel.org/r/1466117661-22075-1-git-send-email-mcgrof@kernel.org

Daniel Wagner (2):
  carl9170: Fix wrong completion usage
  ath10k: use complete() instead complete_all()

 drivers/net/wireless/ath/ath10k/core.c  | 16 ++++++++--------
 drivers/net/wireless/ath/ath10k/mac.c   |  2 +-
 drivers/net/wireless/ath/carl9170/usb.c |  6 ++----
 3 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

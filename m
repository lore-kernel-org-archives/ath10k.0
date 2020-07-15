Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 0/8] spelling.txt: /decriptors/descriptors/
Date: Wed, 15 Jul 2020 13:48:31 +0100
Message-Id: <20200715124839.252822-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
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
To: trivial@kernel.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org

I wouldn't normally go through spelling fixes, but I caught sight of
this typo twice, and then foolishly grepped the tree for it, and saw how
pervasive it was.

so here I am ... fixing a typo globally... but with an addition in
scripts/spelling.txt so it shouldn't re-appear ;-)

V2: Posting before the merge windows close to pick up the last few
non-merged patches, and ideally - to get the actaul spelling.txt entry
picked up, and this time including trivial@kernel.org to let these get
head through that tree if required.

Cc: trivial@kernel.org
Cc: linux-arm-kernel@lists.infradead.org (moderated list:ARM SUB-ARCHITECTURES)
Cc: linux-kernel@vger.kernel.org (open list)
Cc: linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...)
Cc: netdev@vger.kernel.org (open list:NETWORKING DRIVERS)
Cc: ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER)
Cc: linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS))
Cc: virtualization@lists.linux-foundation.org (open list:VIRTIO BALLOON)
Cc: linux-mm@kvack.org (open list:MEMORY MANAGEMENT)

Kieran Bingham (17):
  arch: arm: mach-davinci: Fix trivial spelling
  drivers: input: joystick: Fix trivial spelling
  drivers: net: wan: Fix trivial spelling
  drivers: net: wireless: Fix trivial spelling
  include: dynamic_debug.h: Fix trivial spelling
  kernel: trace: Fix trivial spelling
  mm/balloon_compaction: Fix trivial spelling
  scripts/spelling.txt: Add descriptors correction

 arch/arm/mach-davinci/board-da830-evm.c | 2 +-
 drivers/input/joystick/spaceball.c      | 2 +-
 drivers/net/wan/lmc/lmc_main.c          | 2 +-
 drivers/net/wireless/ath/ath10k/usb.c   | 2 +-
 drivers/net/wireless/ath/ath6kl/usb.c   | 2 +-
 drivers/net/wireless/cisco/airo.c       | 2 +-
 include/linux/dynamic_debug.h           | 2 +-
 kernel/trace/trace_events.c             | 2 +-
 mm/balloon_compaction.c                 | 4 ++--
 scripts/spelling.txt                    | 2 ++
 10 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

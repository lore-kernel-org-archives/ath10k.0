Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([79.140.42.25] helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coX6Q-0002M1-1I
 for ath10k@lists.infradead.org; Thu, 16 Mar 2017 15:14:12 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH 0/3] Channels in licensed bands, noise floor override
Date: Thu, 16 Mar 2017 16:13:34 +0100
Message-Id: <20170316151337.24163-1-sw@simonwunderlich.de>
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
To: ath10k@lists.infradead.org, ath9k-devel@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, Simon Wunderlich <sw@simonwunderlich.de>

This series contains two patches to enable channels in licensed bands.
Note that there are quite a few requirements to enable those:

 * channels must be explicitly enabled using a licensed band kernel config
   which contains a warning
 * it depends on CFG80211_CERTIFICATION_ONUS
 * users must install a custom regdb, since channels in those licensed
   bands are not included in the standard regdb

The ath9k patch has been proposed two times and rejected, but it also
included some channels on fractional center frequencies, which is not
the case this time (this would require more changes in mac80211 and
also userspace). The other concern about useres accidently tuning
should not be a problem based on the requirements mentioned above. I've
added another patch doing the same thing for ath10k.

Here is some more info on our need/background:

"We are working on a project that involves the use of Public Safety 
channels (4.9x GHz). It is typical 'First Responder' scenario where a 
communication network infrastructure should be set up in catastrophe 
situations.

As this is a controlled and managed network, the organization setting up 
the network has control over the channels that are being used, when and 
for how long and in which geographical area.  The enforcement of such a 
temporary license is a major requirement in this project.

To reduce the cost for the equipment (compared to commercial offerings 
in the 4k USD range), the outdoor devices run on hardened, but standard 
embedded hardware with a recent linux kernel and use Atheros radios.

We believe, that driver support for 4.9GHz channels should be included 
in the Linux kernel, as the driver just exposes specified hardware 
features which are disabled by default via

a) a separate compile-time flag. This is similar to the code used for 
compliance testing.

b) The default CRDA should (and does) not enable such channels.

Those two safeguards seem sufficient to protect against accidental misuse."

The third patch is adding an experimental debug option to override
the noise floor level, which is usually calibrated automatically.

Cheers,
     Simon

Ben Greear (1):
  ath9k: Support channels in licensed bands

Simon Wunderlich (2):
  ath10k: add support for channels in licensed bands
  ath9k: add noise floor override option

 drivers/net/wireless/ath/ath10k/Kconfig      | 20 +++++++++
 drivers/net/wireless/ath/ath10k/core.h       |  4 ++
 drivers/net/wireless/ath/ath10k/mac.c        |  9 ++++
 drivers/net/wireless/ath/ath10k/wmi.c        |  7 +++-
 drivers/net/wireless/ath/ath9k/Kconfig       | 20 +++++++++
 drivers/net/wireless/ath/ath9k/ath9k.h       |  2 +-
 drivers/net/wireless/ath/ath9k/calib.c       |  5 ++-
 drivers/net/wireless/ath/ath9k/common-init.c | 35 ++++++++++++----
 drivers/net/wireless/ath/ath9k/debug.c       | 62 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath9k/hw.h          |  5 ++-
 10 files changed, 155 insertions(+), 14 deletions(-)

-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

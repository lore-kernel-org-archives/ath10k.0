Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3izr-0005Fv-M8
 for ath10k@lists.infradead.org; Mon, 29 Jul 2013 08:40:04 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC 0/3] introduce chan_time parameter to scan request
Date: Mon, 29 Jul 2013 10:39:15 +0200
Message-ID: <1375087158-22077-1-git-send-email-michal.kazior@tieto.com>
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
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Hi,

This patchset adds a new scan parameter. It allows
specyfing for how long each channel should be
visited during scan.

I've tested this with ath9k (which doesn't have
hw_scan) and ath10k (does have hw_scan). It's not
super time-precise, but seems reasonable.

The main motivation behind this is to allow easier
ACS implementation in hostapd.

This could also perhaps be useful for spectral
scan and anyone interested in having ability to
tune scan times (e.g. very fast initial channel
scanning on mobile devices, long passive scans).

I'm wondering if it would be okay to set swscan
probe delay to 0 if chan_time is non-zero? Or does
probe delay need to be non-zero? Or maybe it
should also be configurable via a parameter?


Pozdrawiam / Best regards,
Michal Kazior.


Michal Kazior (3):
  nl/cfg80211: add chan_time for scan request
  mac80211: add support for scan chan_time parameter
  ath10k: respect chan_time parameter in scan request

 drivers/net/wireless/ath/ath10k/mac.c |    6 ++++++
 include/net/cfg80211.h                |    3 +++
 include/uapi/linux/nl80211.h          |    7 +++++++
 net/mac80211/scan.c                   |   22 ++++++++++++++++++++--
 net/wireless/nl80211.c                |    4 ++++
 5 files changed, 40 insertions(+), 2 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

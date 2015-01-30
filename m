Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YH8Bt-0005ac-AX
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 09:48:41 +0000
Received: by mail-wi0-f181.google.com with SMTP id fb4so1559829wid.2
 for <ath10k@lists.infradead.org>; Fri, 30 Jan 2015 01:48:19 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/4] ath10k: implement fw stats for wmi-tlv
Date: Fri, 30 Jan 2015 10:47:20 +0100
Message-Id: <1422611244-20767-1-git-send-email-michal.kazior@tieto.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

There are some slight differences in fw stats
(sic) in wmi-tlv.

Firmware has changed the querying scheme and no
longer requires the ping-pong to get all stats.
The patchset doesn't change this behaviour so with
wmi-tlv it's possible to see the following
warnings when reading fw stats:

 ath10k_pci 0000:00:06.0: received unsolicited stats update event

The logic in ath10k still produces correct results
so this is harmless.

I wonder how to deal with this in a sane way. An
`if (op_ver == WMI_TLV)` is a little bad but
having a new ar->fw_feature flag just for a debug
facility like this is a bit silly. Or we can just
drop the warning and leave a comment. Ideas?


Michal Kazior (4):
  ath10k: add vdev stats processing
  ath10k: change request stats command prototype
  ath10k: add more wmi fw stat defines
  ath10k: implement fw stats for wmi-tlv

 drivers/net/wireless/ath/ath10k/core.h    |  20 +++++
 drivers/net/wireless/ath/ath10k/debug.c   | 101 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi-ops.h |   7 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 117 ++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |   9 +++
 drivers/net/wireless/ath/ath10k/wmi.c     |   7 +-
 drivers/net/wireless/ath/ath10k/wmi.h     |  10 ++-
 7 files changed, 254 insertions(+), 17 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

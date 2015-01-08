Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x233.google.com ([2a00:1450:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9B1d-0003Nz-Q5
 for ath10k@lists.infradead.org; Thu, 08 Jan 2015 11:13:14 +0000
Received: by mail-we0-f179.google.com with SMTP id q59so1850529wes.10
 for <ath10k@lists.infradead.org>; Thu, 08 Jan 2015 03:12:51 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/5] ath10k: implement beacon offload
Date: Thu,  8 Jan 2015 12:12:25 +0100
Message-Id: <1420715550-16017-1-git-send-email-michal.kazior@tieto.com>
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

Hi,

New wmi-tlv firmware will support beacon/presp
offloading. This patchset adds appropriate
support.

These patches of mine were originally posted by
Bartosz before christmas after I went on my
holidays.

v2:
 * add a comment in patch 5


Michal Kazior (5):
  ath10k: implement new beacon tx status event
  ath10k: implement beacon template command
  ath10k: implement prb tmpl wmi command
  ath10k: implement p2p bcn ie command
  ath10k: implement support for ap beacon offloading

 drivers/net/wireless/ath/ath10k/mac.c     | 162 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  57 +++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 206 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  34 +++++
 drivers/net/wireless/ath/ath10k/wmi.c     |   9 ++
 5 files changed, 468 insertions(+)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

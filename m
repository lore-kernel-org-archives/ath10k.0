Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1HZ1-0007fS-PS
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 17:39:38 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 0/3] ath10k: introduce Mesh support in native WiFi mode for
 QCA988X
Date: Tue, 24 Nov 2015 09:37:32 -0800
Message-ID: <1448386655-13936-1-git-send-email-poh@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

QCA988X firmware has started supporting Mesh frame in native Wi-Fi mode
by adding its subtype since 10.2.4.70.12-2.
Hence update its WMI service map and vdev subtypes to be used for Mesh in
native Wi-Fi mode.

Peter Oh (3):
  ath10k: update WMI 10.x service map
  ath10k: introduce new subtypes for proxy STA and Mesh
  ath10k: apply Mesh subtype when Mesh interface created.

 drivers/net/wireless/ath/ath10k/mac.c |  4 +++-
 drivers/net/wireless/ath/ath10k/wmi.h | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

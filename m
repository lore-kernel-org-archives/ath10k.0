Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1CU1-0002ka-2z
 for ath10k@lists.infradead.org; Mon, 22 Jul 2013 09:32:45 +0000
Subject: [PATCH 1/2] MAINTAINERS: add ath10k
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 22 Jul 2013 12:32:20 +0300
Message-ID: <20130722093220.26562.14270.stgit@localhost6.localdomain6>
In-Reply-To: <20130722093113.26562.11543.stgit@localhost6.localdomain6>
References: <20130722093113.26562.11543.stgit@localhost6.localdomain6>
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
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org

I forgot to add an entry to MAINTAINERS when submitting the driver.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 MAINTAINERS |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf61e04..44626b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6719,6 +6719,14 @@ T:	git git://linuxtv.org/anttip/media_tree.git
 S:	Maintained
 F:	drivers/media/tuners/qt1010*
 
+QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
+M:	Kalle Valo <kvalo@qca.qualcomm.com>
+L:	ath10k@lists.infradead.org
+W:	http://wireless.kernel.org/en/users/Drivers/ath10k
+T:	git git://github.com/kvalo/ath.git
+S:	Supported
+F:	drivers/net/wireless/ath/ath10k/
+
 QUALCOMM HEXAGON ARCHITECTURE
 M:	Richard Kuo <rkuo@codeaurora.org>
 L:	linux-hexagon@vger.kernel.org


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

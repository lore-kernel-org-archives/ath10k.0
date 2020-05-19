Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb9ac-0006xv-W3
 for ath10k@lists.infradead.org; Tue, 19 May 2020 21:15:56 +0000
From: Jakub Kicinski <kuba@kernel.org>
Subject: [RFC 2/2] i2400m: use devlink health reporter
Date: Tue, 19 May 2020 14:15:31 -0700
Message-Id: <20200519211531.3702593-2-kuba@kernel.org>
In-Reply-To: <20200519010530.GS11244@42.do-not-panic.com>
References: <20200519010530.GS11244@42.do-not-panic.com>
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
To: mcgrof@kernel.org
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, greearb@candelatech.com, bhe@redhat.com, briannorris@chromium.org, ath10k@lists.infradead.org, derosier@gmail.com, tiwai@suse.de, mingo@redhat.com, Jakub Kicinski <kuba@kernel.org>, dyoung@redhat.com, pmladek@suse.com, jiri@resnulli.us, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, johannes@sipsolutions.net, kvalo@codeaurora.org, netdev@vger.kernel.org, schlad@suse.de, linux-kernel@vger.kernel.org, jeyu@kernel.org, akpm@linux-foundation.org, davem@davemloft.net

It builds.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/wimax/i2400m/rx.c  | 2 ++
 drivers/net/wimax/i2400m/usb.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wimax/i2400m/rx.c b/drivers/net/wimax/i2400m/rx.c
index c9fb619a9e01..cc7fe78f2df0 100644
--- a/drivers/net/wimax/i2400m/rx.c
+++ b/drivers/net/wimax/i2400m/rx.c
@@ -144,6 +144,7 @@
  *       i2400m_msg_size_check
  *       wimax_msg
  */
+#include <linux/devlink.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/if_arp.h>
@@ -712,6 +713,7 @@ void __i2400m_roq_queue(struct i2400m *i2400m, struct i2400m_roq *roq,
 	dev_err(dev, "SW BUG? failed to insert packet\n");
 	dev_err(dev, "ERX: roq %p [ws %u] skb %p nsn %d sn %u\n",
 		roq, roq->ws, skb, nsn, roq_data->sn);
+	devlink_simple_fw_reporter_report_crash(dev);
 	skb_queue_walk(&roq->queue, skb_itr) {
 		roq_data_itr = (struct i2400m_roq_data *) &skb_itr->cb;
 		nsn_itr = __i2400m_roq_nsn(roq, roq_data_itr->sn);
diff --git a/drivers/net/wimax/i2400m/usb.c b/drivers/net/wimax/i2400m/usb.c
index 9659f9e1aaa6..5c811dccbf1d 100644
--- a/drivers/net/wimax/i2400m/usb.c
+++ b/drivers/net/wimax/i2400m/usb.c
@@ -49,6 +49,7 @@
  *   usb_reset_device()
  */
 #include "i2400m-usb.h"
+#include <linux/devlink.h>
 #include <linux/wimax/i2400m.h>
 #include <linux/debugfs.h>
 #include <linux/slab.h>
@@ -423,6 +424,8 @@ int i2400mu_probe(struct usb_interface *iface,
 	if (usb_dev->speed != USB_SPEED_HIGH)
 		dev_err(dev, "device not connected as high speed\n");
 
+	devlink_simple_fw_reporter_prepare(dev);
+
 	/* Allocate instance [calls i2400m_netdev_setup() on it]. */
 	result = -ENOMEM;
 	net_dev = alloc_netdev(sizeof(*i2400mu), "wmx%d", NET_NAME_UNKNOWN,
@@ -506,6 +509,7 @@ int i2400mu_probe(struct usb_interface *iface,
 	usb_put_dev(i2400mu->usb_dev);
 	free_netdev(net_dev);
 error_alloc_netdev:
+	devlink_simple_fw_reporter_cleanup(dev);
 	return result;
 }
 
@@ -532,6 +536,7 @@ void i2400mu_disconnect(struct usb_interface *iface)
 	usb_set_intfdata(iface, NULL);
 	usb_put_dev(i2400mu->usb_dev);
 	free_netdev(net_dev);
+	devlink_simple_fw_reporter_cleanup(dev);
 	d_fnend(3, dev, "(iface %p i2400m %p) = void\n", iface, i2400m);
 }
 
-- 
2.25.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

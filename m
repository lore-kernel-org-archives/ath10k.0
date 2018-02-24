Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1epbIO-0002kl-2h
 for ath10k@lists.infradead.org; Sat, 24 Feb 2018 14:59:31 +0000
Date: Sat, 24 Feb 2018 22:58:43 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] ath10k: ath10k_register_gpio_chip() can be static
Message-ID: <20180224145843.GA55309@roam>
References: <20180222111534.31047-1-s.gottschall@dd-wrt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180222111534.31047-1-s.gottschall@dd-wrt.com>
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
To: s.gottschall@dd-wrt.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@newmedia-net.de>, kvalo@codeaurora.org, kbuild-all@01.org


Fixes: 35b91f175b35 ("ath10k: add LED and GPIO controlling support for various chipsets")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 gpio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/gpio.c b/drivers/net/wireless/ath/ath10k/gpio.c
index a760319..e9ce44b 100644
--- a/drivers/net/wireless/ath/ath10k/gpio.c
+++ b/drivers/net/wireless/ath/ath10k/gpio.c
@@ -81,7 +81,7 @@ static void ath10k_gpio_pin_set(struct gpio_chip *chip, unsigned offset,
 }
 
 /* register GPIO chip */
-int ath10k_register_gpio_chip(struct ath10k *ar)
+static int ath10k_register_gpio_chip(struct ath10k *ar)
 {
  
 	struct ath10k_gpiocontrol *gpio = ar->gpio;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

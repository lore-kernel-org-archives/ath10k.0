Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPSlc-0005rz-Qk
 for ath10k@lists.infradead.org; Thu, 04 Sep 2014 08:51:45 +0000
Received: by mail-oi0-f49.google.com with SMTP id g201so6426855oib.36
 for <ath10k@lists.infradead.org>; Thu, 04 Sep 2014 01:51:19 -0700 (PDT)
MIME-Version: 1.0
From: Matteo Croce <matteo@openwrt.org>
Date: Thu, 4 Sep 2014 10:50:39 +0200
Message-ID: <CAFnufp1Rg2JOLM4d6g_=uF+Nrydt0Wy_4DK85bnqNHkthD9zQw@mail.gmail.com>
Subject: [PATCH] ath10k: ATH10K_DEBUGFS depends on DEBUG_FS
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

enable ath10k debugfs only when debugfs is enabled,
fixes an invalid pointer on module insert

--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -24,7 +24,7 @@ config ATH10K_DEBUG

 config ATH10K_DEBUGFS
  bool "Atheros ath10k debugfs support"
- depends on ATH10K
+ depends on ATH10K && DEBUG_FS
  select RELAY
  ---help---
   Enabled debugfs support

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHopd-00025p-FA
 for ath10k@lists.infradead.org; Mon, 14 Sep 2020 13:47:46 +0000
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
 by mail.lysator.liu.se (Postfix) with ESMTP id A438740032
 for <ath10k@lists.infradead.org>; Mon, 14 Sep 2020 15:47:41 +0200 (CEST)
Received: from sara.hytechdrive.se (h-170-152-149.A163.priv.bahnhof.se
 [81.170.152.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.lysator.liu.se (Postfix) with ESMTPSA id 0C5B740032
 for <ath10k@lists.infradead.org>; Mon, 14 Sep 2020 15:47:41 +0200 (CEST)
Date: Mon, 14 Sep 2020 15:47:40 +0200 (CEST)
From: =?UTF-8?Q?Peter_=C3=85strand?= <astrand@lysator.liu.se>
Subject: Meshed WiFi with QCA9377 (USB/SDIO)
Message-ID: <alpine.LRH.2.23.451.2009141438290.19926@sara.hytechdrive.se>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="-1437493864-779028220-1600087637=:19926"
Content-ID: <alpine.LRH.2.23.451.2009141454260.19926@sara.hytechdrive.se>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1437493864-779028220-1600087637=:19926
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-ID: <alpine.LRH.2.23.451.2009141454261.19926@sara.hytechdrive.se>


Hi. We are designing an IOT system from scratch and want to select a WiFi 
module that works well with 80211s. ath9k is apparently tried and tested, 
but mostly covers older modules which are no longer available. We are 
evaluating ath10k and in particular QCA9377. Does that sound like a good 
choice, or do you have any other recommendations?


For the final board, we are planning to use QCA9377-3 (SDIO). As I 
understand it, this should work with Linux 5.7 and later? We will test 
using https://wireless.murata.com/type-1pj.html soon.


In the mean time, I tried to test QCA9377-7 (USB) using 
https://www.8devices.com/products/blue-bean unfortunately without success. 
I started out with Linux 5.7 and modified usb.c:

--- usb.c.org	2020-09-14 11:58:10.905346540 +0200
+++ usb.c	2020-09-14 15:39:51.555416792 +0200
@@ -1083,6 +1083,7 @@
  /* table of devices that work with this driver */
  static struct usb_device_id ath10k_usb_ids[] = {
  	{USB_DEVICE(0x13b1, 0x0042)}, /* Linksys WUSB6100M */
+	{USB_DEVICE(0x0cf3, 0xe500)}, /* 8devices BLUE bean */
  	{ /* Terminating entry */ },
  };

Unfortunately this did not work: ath10k_usb is loaded but, but no net 
device is created. No error messages; nothing. Firmware package is Debian 
10 firmware-atheros 20190114-2. I also noticed 
http://lists.infradead.org/pipermail/ath10k/2017-December/010672.html and 
as far as I can tell, this was never merged.


Br,
Peter Åstrand
---1437493864-779028220-1600087637=:19926
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

---1437493864-779028220-1600087637=:19926--

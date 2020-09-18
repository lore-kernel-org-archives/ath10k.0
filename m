Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.lysator.liu.se ([130.236.254.3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJB2I-0006A1-87
 for ath10k@lists.infradead.org; Fri, 18 Sep 2020 07:42:27 +0000
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
 by mail.lysator.liu.se (Postfix) with ESMTP id 36DD540005
 for <ath10k@lists.infradead.org>; Fri, 18 Sep 2020 09:42:18 +0200 (CEST)
Received: from sara.hytechdrive.se (h-170-152-149.A163.priv.bahnhof.se
 [81.170.152.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.lysator.liu.se (Postfix) with ESMTPSA id 3F40E40005
 for <ath10k@lists.infradead.org>; Fri, 18 Sep 2020 09:42:16 +0200 (CEST)
Date: Fri, 18 Sep 2020 09:42:16 +0200 (CEST)
From: Peter Astrand <astrand@lysator.liu.se>
Subject: Re: Meshed WiFi with QCA9377 (USB/SDIO)
In-Reply-To: <alpine.LRH.2.23.451.2009141438290.19926@sara.hytechdrive.se>
Message-ID: <alpine.LRH.2.23.451.2009180928250.29354@sara.hytechdrive.se>
References: <alpine.LRH.2.23.451.2009141438290.19926@sara.hytechdrive.se>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

> In the mean time, I tried to test QCA9377-7 (USB) using 
> https://www.8devices.com/products/blue-bean unfortunately without success. I 
> started out with Linux 5.7 and modified usb.c:
>
> --- usb.c.org	2020-09-14 11:58:10.905346540 +0200
> +++ usb.c	2020-09-14 15:39:51.555416792 +0200
> @@ -1083,6 +1083,7 @@
>  /* table of devices that work with this driver */
>  static struct usb_device_id ath10k_usb_ids[] = {
> 	{USB_DEVICE(0x13b1, 0x0042)}, /* Linksys WUSB6100M */
> +	{USB_DEVICE(0x0cf3, 0xe500)}, /* 8devices BLUE bean */
> 	 { /* Terminating entry */ },
>  };
>
> Unfortunately this did not work: ath10k_usb is loaded but, but no net device 
> is created. No error messages; nothing. Firmware package is Debian 10 
> firmware-atheros 20190114-2. I also noticed 
> http://lists.infradead.org/pipermail/ath10k/2017-December/010672.html and as 
> far as I can tell, this was never merged.

The patch above is bad; the correct product ID for BLUE bean is 0x9378. 
QCA9377_1_0_DEVICE_ID in hw.h also needs update. (Or perhaps add a 
QCA9377_1_1_DEVICE_ID)

I have now done many tests using both BLUE bean as well as the Linksys 
WUSB6100M, without success. I've created custom firmware and board files 
based on the instructions on 
https://github.com/erstrom/linux-ath/wiki/Firmware, so that shouldn't be 
the problem. Tested both the https://github.com/erstrom/linux-ath.git and 
https://github.com/kvalo/ath10k.git master branches. Regardless, I get the 
same kind of error:

[   35.350683] usb 1-1.2.1: Failed to submit usb control message: -110
[   35.350686] usb 1-1.2.1: unable to send the bmi data to the device: -110
[   35.350687] usb 1-1.2.1: unable to write to the device (-110)
[   35.350688] usb 1-1.2.1: settings HTC version failed
[   35.350691] usb 1-1.2.1: Could not init core: -22

I have seen https://github.com/erstrom/linux-ath/issues/6. This is the 
same type of problem I believe, except that I'm not trying AP mode.

My conclusion is that ath10k with QCA9377-7 (USB) devices are not working 
a this point. Just as 
https://wireless.wiki.kernel.org/en/users/drivers/ath10k says :-)


Will try SDIO based RED bean as soon as it arrives.


Best regards,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

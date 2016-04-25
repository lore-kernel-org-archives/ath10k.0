Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aujEk-0007yT-8e
 for ath10k@lists.infradead.org; Mon, 25 Apr 2016 16:19:50 +0000
Received: by mail-wm0-x229.google.com with SMTP id e201so91720488wme.0
 for <ath10k@lists.infradead.org>; Mon, 25 Apr 2016 09:19:29 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 25 Apr 2016 12:19:28 -0400
Message-ID: <CAOt_L3-9Ok-yQZeWDkRGr4YR8UoaK2=+2297Ag=tiE_GBe_4mQ@mail.gmail.com>
Subject: Issues with latest kernel versions and Monitor mode
From: Amato Carbonara <acarbonara13@gmail.com>
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
To: ath10k <ath10k@lists.infradead.org>

Hello,
  I recently updated the Linux kernel to latest stable release (4.5.1
and 4.5.2) and long term support releases (4.4.7 and 4.4.8).  With the
aforementioned kernel releases, the QCA988x chip was unable to be
placed in monitor mode.

More information:

OS = Ubuntu 14.04 LTS
WiFi chip = QCA988x
Firmware = ath10k
Version = 10.2.4.70.37-2

Commands used to enter WiFi adapter into monitor mode:
ifconfig wlan1 down
iw dev wlan1 set type monitor
ifconfig wlan1 up

After entering the last command (ifconfig wlan1 up), the following
error is displayed:
SIOCSIFFLAGS: Cannot send after transport endpoint shutdown

No error is displayed when using kernel version 4.3.3
I noticed the problem when I upgraded to 4.4.7 and 4.5.1

Regards,
Amato

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yh0-x235.google.com ([2607:f8b0:4002:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z64Lk-0004GJ-Tc
 for ath10k@lists.infradead.org; Fri, 19 Jun 2015 22:01:25 +0000
Received: by yhan67 with SMTP id n67so85710622yha.3
 for <ath10k@lists.infradead.org>; Fri, 19 Jun 2015 15:01:03 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 20 Jun 2015 01:01:03 +0300
Message-ID: <CABhs+6kp5KEtwUrE3xdDRz9pQ_An27bf5Hs46mg3pBNVw0rg6g@mail.gmail.com>
Subject: Problem with iw set bitrate in ath10k
From: Ilias Syrigos <ilias013@gmail.com>
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

Hello,

I'm trying to fix the bitrate with the iw set bitrates command.

More specifically, I want to use single stream rates (nss=1) and let
the driver choose the mcs. So, I use:

iw wlan0 set bitrates legacy-5 ht-mcs-5 vht-mcs-5 1:0-9

With this setting I observe successful transmissions with nss=2 and
rate_index=9, through monitor mode at the receiving node, and iperf
throughput of 300 Mbps.

Why is nss not fixed to 1?

Moreover, before using the iw command to fix the rate, driver uses
nss=2 and rate_index=4.

Shouldn't have been also 2:9 (nss=2, rate_index=9)?

In addition, when I manually fix the rate with the:

iw wlan0 set bitrates legacy-5 ht-mcs-5 vht-mcs-5 2:9  or even 2:8

I cannot receive anything and I notice too many fcs errors.

I'm only able to receive at the fixed 2:7.

I'm using the latest development driver and the latest firmware-5.

Can anyone help me understand the above?

Thank you,
Ilias

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

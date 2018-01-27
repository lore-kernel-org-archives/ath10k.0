Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1efHdo-0001Vv-08
 for ath10k@lists.infradead.org; Sat, 27 Jan 2018 03:58:57 +0000
Received: by mail-ua0-x22e.google.com with SMTP id x4so1550094uaj.11
 for <ath10k@lists.infradead.org>; Fri, 26 Jan 2018 19:58:45 -0800 (PST)
MIME-Version: 1.0
From: Nikolay Martynov <mar.kolya@gmail.com>
Date: Fri, 26 Jan 2018 22:58:43 -0500
Message-ID: <CALGY4fvrNGKtbtLBkvWcTSVbZcK9OaBRWs5KTrKDdf-cFbHbZg@mail.gmail.com>
Subject: QCA988X firmware version and speed
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
To: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

Hi.

  I've got some observation about firmware version and speed that I
would like to share.
  I have tp-link archer c5 with 'ath10k_pci 0000:01:00.0: qca988x
hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000' running
Openwrt.

  When I use firmware version 10.2.4.70.63-2 I get modulation speeds
about twice as large as with other firmware versions. I've also tried
10.2.4.70.66 and firmware-5.bin_10.2.4-1.0-00033 and one that was
Openwrt/Lede stock before that - all show performance noticeably worse
than 10.2.4.70.63-2.
  In fact if my laptop stands on my desk (some distance away from AP)
and I use 10.2.4.70.63-2 I get stable 2 spacial stream reception, if I
use other versions mentioned above I usually get one 1 special stream
as shown by 'iw' command on a client.

  I'm not sure if that observation if helpful or not, but since it
looks like newer FW versions have worse performance I thought I should
share it.

  Please let me know if I can provide any more information.

-- 
Martynov Nikolay.
Email: mar.kolya@gmail.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

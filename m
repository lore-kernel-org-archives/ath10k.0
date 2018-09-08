Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyjaI-0007SN-5W
 for ath10k@lists.infradead.org; Sat, 08 Sep 2018 20:11:59 +0000
Received: by mail-ua1-x929.google.com with SMTP id y10-v6so14475224uao.4
 for <ath10k@lists.infradead.org>; Sat, 08 Sep 2018 13:11:44 -0700 (PDT)
MIME-Version: 1.0
From: Nikolay Martynov <mar.kolya@gmail.com>
Date: Sat, 8 Sep 2018 16:11:31 -0400
Message-ID: <CALGY4ft2u2QufAcWLygNzRp8+=XvSz1FD+-f8Jr4A3qhuwU6JQ@mail.gmail.com>
Subject: QCA988X firmware version and performance
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
To: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, kavitam@cdot.in

Hi.

  I've got some observation about firmware version and speed that I
would like to share.
  I have tp-link archer c5 with 'ath10k_pci 0000:01:00.0: qca988x
hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000' running
Openwrt.

  When I use firmware version 10.2.4.70.61-2 I get modulation speeds
about twice as large as with other firmware versions. I've also tried
10.2.4.70.66 and firmware-5.bin_10.2.4-1.0-00033 and one that was
Openwrt/Lede stock before that - all show performance noticeably worse
than 10.2.4.70.61-2.
  In fact if my laptop stands on my desk (some distance away from AP)
and I use 10.2.4.70.61-2 I get stable 2 spacial stream reception, if I
use other versions mentioned above I usually get one 1 special stream
as shown by 'iw' command on a client.
  I've also perfomed some speed measurements with iperf:
* with latest firmware I get 30MB/s and iw on a client shows signal
strength of -72dBm
* with 10.2.4.70.61-2I get 53MB/s and iw on a client shows signal
strength of -63dBm
All with laptop (client) unmoved.
  So it looks like downgrading firmware gains 30+% performance.

  I've already tried to raise this question ~8 months ago but didn't
get any reply.

  It seems like this is a bug in newer versions of firmware and it
would be really nice if that bug could be fixed.
  Is there any way I can help with that? Maybe someone could provide
me with better channel to ask these questions?

  Please let me know if I can provide any more information.
  Thanks!
-- 
Martynov Nikolay.
Email: mar.kolya@gmail.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

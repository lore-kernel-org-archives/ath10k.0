Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yl13X-0004Sv-I4
 for ath10k@lists.infradead.org; Wed, 22 Apr 2015 20:15:36 +0000
Received: by iebrs15 with SMTP id rs15so46416409ieb.3
 for <ath10k@lists.infradead.org>; Wed, 22 Apr 2015 13:15:12 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 22 Apr 2015 16:15:12 -0400
Message-ID: <CAOt_L38ntK_iE9UNbU_GYLHmhWJYaBbKkc6Ow_hC=o7VSD_7mg@mail.gmail.com>
Subject: Upgrade firmware of QCA-9880
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

I am currently running:
driver=ath10k_pci driverversion=3.13.0-49-generic firmware=10.1.467.2-1

I would like to update the firmware to 10.2.4 (latest release).  I am
unable to update the software by copying the file
"firmware-4.bin_10.2.4.48" from
https://github.com/kvalo/ath10k-firmware/tree/master/10.2.4

I copy the file from github into /lib/firmware/ath10k/QCA988X/hw2.0/

I have kept the original file name, changed it to "firmware-4.bin" and
also changed it to "firmware-2.bin" but the firmware does not upgrade
to 10.2.4

Can you please assist in telling me how I go from 10.1.467.2-1 to 10.2.4?

Thank you,
Amato

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

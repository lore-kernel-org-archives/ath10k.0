Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yb0-x22f.google.com ([2607:f8b0:4002:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0gMF-0003Z5-Cu
 for ath10k@lists.infradead.org; Wed, 19 Apr 2017 03:32:45 +0000
Received: by mail-yb0-x22f.google.com with SMTP id s22so2822186ybe.3
 for <ath10k@lists.infradead.org>; Tue, 18 Apr 2017 20:32:20 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5a2Z5bu65biM?= <ycsunjane@gmail.com>
Date: Wed, 19 Apr 2017 11:32:19 +0800
Message-ID: <CABWe71yxXG5VMaPPUK3HeYjNDOn7PiHk1AJy8WnXb-nntOMz4g@mail.gmail.com>
Subject: ath10k otp.bin board.bin firmware.bin art.bin?
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

hi,

I am debugging ath10k QCA986x 5g WNIC. And installed the firmware. But
the card did not rise. The kernel log is as follows:

[    9.320705] ath10k_pci 0000:00:00.0: firmware ver 10.2.4-1.0-00029
api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 88595bb8
[    9.365636] ath10k_pci 0000:00:00.0: board id is not exist in otp, ignore it
[    9.372894] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/board-2.bin failed with error -2

What is the board id in otp?

I found ath10k have otp.bin board.bin firmware.bin art.bin. But ath9k
only have art.bin which used to calibrate wnic.

What are these bin files doing for?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

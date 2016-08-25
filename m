Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bctHQ-0003du-6t
 for ath10k@lists.infradead.org; Thu, 25 Aug 2016 11:57:09 +0000
Received: by mail-qk0-x242.google.com with SMTP id r128so3420232qkc.1
 for <ath10k@lists.infradead.org>; Thu, 25 Aug 2016 04:56:46 -0700 (PDT)
Message-ID: <57BEDCF4.8050105@gmail.com>
Date: Thu, 25 Aug 2016 19:56:36 +0800
From: Xuebing Wang <xbing6@gmail.com>
MIME-Version: 1.0
Subject: ath10k: is there hw3.0 firmware for qca6164 (one spatial stream)
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
To: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org
Cc: alanliu@qca.qualcomm.com

Hi Michal,

First of all, thank you very much for your help.

1) As you are the author of adding qca6164 (one spatial stream) to 
ath10k, are you aware if there is qca6164 chip with hw3.x which requires 
hw3.x firmware?

1.1) What qca6164 wlan card did you use while you authored the support 
of qca6164?

2) From the source code in core.c, there is only hw2.1 (.id = 
QCA6174_HW_2_1_VERSION) for qca6164.
---
static const struct ath10k_hw_params ath10k_hw_params_list[] = {
     {
         .id = QCA6174_HW_2_1_VERSION,
         .dev_id = QCA6164_2_1_DEVICE_ID,
         .name = "qca6164 hw2.1",
....
     };
---

3) I checked Kalle's ath10k-firmware repository at github, there is no 
such QCA6164/ folder (one spatial stream). Does 6164 use the same 
firmware as 6174?

4) As in your commit message as below, would you please advise where can 
I get this special board.bin file?
---
     The QCA6164 needs a dedicated board.bin file which
     is different than the one used for QCA6174. If the
     board.bin is wrong the device will crash early
     while trying to boot firmware. The register dump
     will look like this:
---

Thanks again.

-- 
Xuebing

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

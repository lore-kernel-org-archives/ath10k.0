Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcPKS-0006jS-BB
 for ath10k@lists.infradead.org; Wed, 24 Aug 2016 03:58:16 +0000
Received: by mail-qk0-x242.google.com with SMTP id v123so370554qkh.3
 for <ath10k@lists.infradead.org>; Tue, 23 Aug 2016 20:57:54 -0700 (PDT)
Message-ID: <57BD1B3D.3050104@gmail.com>
Date: Wed, 24 Aug 2016 11:57:49 +0800
From: Xuebing Wang <xbing6@gmail.com>
MIME-Version: 1.0
Subject: ath10k: qca6174 firmware: difference between hw2.1/firmware-5 and
 hw3.0/firmware-4
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

Hi Kalle,

I cloned your ath10k-firmware from your github. Would you please advise 
what are the differences of hw2.1/firmware-5 and hw3.0/firmware-4 for 
qca6174? Does hw3.0/firmware-4 support Monitor Mode?

I have a wlan card with BMI version (QCA6174_HW_2_1_VERSION 0x05010000) 
and Monitor Mode works no problem with latest kernel v4.8-rc2.

I have another wlan card with (QCA6174_HW_3_2_VERSION 0x05030000). I am 
trying to back-port ath10k from v4.8-rc2 to 3.10.73 for this HW_3_2 
QCA6174 wlan card. Virtual interface (mon0) can be added and brought-up, 
but tcpdump can not capture any packets. I am wondering if it could be 
related to (hw2.1/firmware-5 vs hw3.0/firmware-4)?

I can not try v4.8-rc2 for this HW_3_2 wlan card, because it is used in 
an android phone.

Thanks a lot for your help.

-- 
Xuebing

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0uUG-00056y-Ha
 for ath10k@lists.infradead.org; Wed, 19 Apr 2017 18:37:58 +0000
Received: by mail-qt0-x231.google.com with SMTP id m36so27302491qtb.0
 for <ath10k@lists.infradead.org>; Wed, 19 Apr 2017 11:37:36 -0700 (PDT)
From: Michael Scott <michael.scott@linaro.org>
Subject: odd msg using kvalo firmware-5.bin w/ KillerAC 1535(QCA6174)
Message-ID: <2103690e-ad1f-4612-e343-1ea711c14a00@linaro.org>
Date: Wed, 19 Apr 2017 11:37:33 -0700
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
Cc: kvalo@qca.qualcomm.com

I am currently testing a QCA6174-based M.2/NGFF card (KillerAC 1535) w/ 
linux-next kernel.  When I use the firmware-5.bin from Kalle Valo's 
github: https://github.com/kvalo/ath10k-firmware, I see the following 
message occasionally in dmesg:
ath10k_pci 0000:01:00.0: Unknown eventid: 90118

If I revert back to firmware-4.bin, that message goes away.

(Spoke with kvalo on IRC and passing this info along to the list)

- Mike

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

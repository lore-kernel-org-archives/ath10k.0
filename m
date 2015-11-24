Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm13-vm0.bullet.mail.bf1.yahoo.com ([98.139.213.79])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1EWD-0003rt-7Y
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 14:24:30 +0000
Date: Tue, 24 Nov 2015 14:24:04 +0000 (UTC)
From: Joerg Pommnitz <pommnitz@yahoo.com>
Message-ID: <35593366.8510667.1448375044619.JavaMail.yahoo@mail.yahoo.com>
Subject: kvalo firmware confusion
MIME-Version: 1.0
References: <35593366.8510667.1448375044619.JavaMail.yahoo.ref@mail.yahoo.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Joerg Pommnitz <pommnitz@yahoo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello all,
I'm confused about the git firmware situation for QCA988X.

I'm on linux 3.18.24. The driver want's to load firmware-2.bin. 

The suggested download site according to https://github.com/kvalo/ath10k-firmware
is https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/

The content of https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/tree/ath10k/QCA988X/hw2.0 is:

-rw-r--r--	board.bin	2116
-rw-r--r--	firmware-4.bin	241892
-rw-r--r--	firmware-5.bin	245312
-rw-r--r--	notice_ath10k_firmware-4.txt	13890
-rw-r--r--	notice_ath10k_firmware-5.txt	15594


No firmware-2.bin. What's going on? The onliest firmware-2.bin currently available seems to be
https://github.com/kvalo/ath10k-firmware/blob/master/QCA988X/main/firmware-2.bin_999.999.0.636

Is this the one to use?
 
--
  Regards       Joerg

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

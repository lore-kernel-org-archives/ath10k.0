Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from bl4ckb0x.de ([5.9.63.241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnyWx-0002Hk-Lh
 for ath10k@lists.infradead.org; Fri, 01 May 2015 00:10:13 +0000
Received: from mail.bl4ckb0x.com (bl4ckb0x.de
 [IPv6:2a01:4f8:161:64ec:5:9:63:241])
 by bl4ckb0x.de (Postfix) with ESMTPSA id E73F81F400F1
 for <ath10k@lists.infradead.org>; Fri,  1 May 2015 02:09:46 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 01 May 2015 02:09:46 +0200
From: Conrad Kostecki <ck+ath10k@bl4ckb0x.de>
Subject: failed to set kickout threshold on vdev 0: -11
Message-ID: <ee86758838b649211fa41226c162e7b4@bl4ckb0x.de>
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

Hi!
I am having some problems with my two ath10k card since kernel 4.0..

After booting a fresh system, I am unable to start hostapd, as it fails 
to start up the cards:

[ 3529.630065] ath10k_pci 0000:07:00.0: failed to set kickout threshold 
on vdev 0: -11
[ 3529.630076] ath10k_pci 0000:07:00.0: failed to set vdev 0 kickout 
parameters: -11
[ 3538.630064] ath10k_pci 0000:07:00.0: could not suspend target (-11)
[ 3696.390142] ath10k_pci 0000:0c:00.0: failed to set kickout threshold 
on vdev 0: -11
[ 3696.390153] ath10k_pci 0000:0c:00.0: failed to set vdev 0 kickout 
parameters: -11
[ 3705.390129] ath10k_pci 0000:0c:00.0: could not suspend target (-11)

After trying again 2-3 times, it's starting working and hostapd is 
starting up.

OS: Gentoo
Kernel: 4.0.1
ath10k_pci 0000:0c:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 
10.2-00082-4-2 api 4 htt 2.1 wmi 3 cal otp max_sta 128
ath10k_pci 0000:07:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 
10.2-00082-4-2 api 4 htt 2.1 wmi 3 cal otp max_sta 128

What's going on? Anybody some ideas?

Cheers
Conrad

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAiem-0000Np-V3
 for ath10k@lists.infradead.org; Thu, 02 Jul 2015 17:52:17 +0000
Received: by igcur8 with SMTP id ur8so125211911igc.0
 for <ath10k@lists.infradead.org>; Thu, 02 Jul 2015 10:51:55 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 2 Jul 2015 13:51:55 -0400
Message-ID: <CAOt_L39x93N4pMEXYEOh-L1vTEiDLMj9fijUoCT-E5Vmp9Ve0g@mail.gmail.com>
Subject: Trying to upgrade to latest ath10k driver version
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

Hello,
I am trying to upgrade my ath10k driver version to the latest version:
10.2.4.70.2
I am downloading the binary file from the following github location:
https://github.com/kvalo/ath10k-firmware/tree/master/10.2.4/untested

However, after placing the binary file in the directory
/lib/firmware/ath10k/QCA988X/hw2.0  the driver version remains at the
old version (10.2.4.48).  When I download the file from github, I
changed the name of the driver file from firmware-5.bin_10.2.4.70.2 to
firmware-5.bin


I have tried using kernel version 4.0, 4.1.0 and 4.1.1 but the ath10k
driver fails to upgrade to 10.2.4.70.2

Any suggestions?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

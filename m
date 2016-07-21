Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from champagne.comp.nus.edu.sg ([137.132.80.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQEm2-0000xm-Mm
 for ath10k@lists.infradead.org; Thu, 21 Jul 2016 14:16:33 +0000
Received: from mail-io0-f199.google.com ([209.85.223.199])
 by champagne.comp.nus.edu.sg (Exim) with esmtps (TLSv1:DES-CBC3-SHA:168)
 id 1bQElP-0006AN-MO
 for ath10k@lists.infradead.org; Thu, 21 Jul 2016 22:15:48 +0800
Received: by mail-io0-f199.google.com with SMTP id u25so162519923ioi.1
 for <ath10k@lists.infradead.org>; Thu, 21 Jul 2016 07:15:47 -0700 (PDT)
MIME-Version: 1.0
From: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Date: Thu, 21 Jul 2016 21:15:06 +0700
Message-ID: <CA+uUJGu6qSmxupEkaqPmLBQf53wQtjyXidFCf+4X9vMxL4WmoA@mail.gmail.com>
Subject: Completely disabling RTS/CTS
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

Hi all,

I am trying to "completely" disable RTS/CTS.

* Case 1: Using iw/iwconfig when I set the sender's RTS threshold to a
very high value (RTS thr=10000 B), I expect that no RTS should be
sent. However, it seems that this threshold is not being honored and I
can sniff large number of RTS/CTS frames. I verified that no A-MSDU is
exceeding 10000 B.
* Case 2: Interestingly, when I set the sender's RTS threshold to off
(RTS thr:off), compared to case #1 much less number of RTS/CTS frames
are seen and throughput is seen to improve. But I can still see
RTS/CTS frames being sent.
* Since the channel is clear and much isolated, and there is just one
AP and one STA, there is negligible chance of other factors playing
any role.
* There is one change though that I have disabled dynamic bandwidth
i.e. ar->wmi.pdev_param->dynamic_bw set zero in mac.c. I believe this
is likely not an issue as similar RTS/CTS behavior is seen even with
dynamic_bw set to 1 (there are no heterogeneous channel widths in the
network in any case).
* Another thing I noticed is that the RTS/CTS protection mode if set,
it is set to CTS-to-self, rather than "RTS/CTS" i.e.
ar->wmi.vdev_param->protection_mode in mac.c is either set to 1 or 0
(depending upon use_cts_prot), but not 2. This probably seems not
helpful in hidden node scenarios as the CTS frame is unicasted instead
broadcasting.

I would appreciate any pointers on completely disabling RTS/CTS as
well as the ability to choose between complete RTS/CTS versus
CTS-to-self whenever RTS/CTS is enabled.

Thanks,
Raj Joshi

--------------------------
More info on setup
--------------------------
- QCA9880 (Compex wle900vx)
- Ubuntu 16.04 x64 running kernel 4.7.0-rc4-wt-ath-201606202115 from ath.git
- firmware-version: 10.2.4.70.9-2

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

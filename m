Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x235.google.com ([2a00:1450:4010:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ymbue-00023M-Rn
 for ath10k@lists.infradead.org; Mon, 27 Apr 2015 05:49:01 +0000
Received: by lagv1 with SMTP id v1so71876853lag.3
 for <ath10k@lists.infradead.org>; Sun, 26 Apr 2015 22:48:39 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 27 Apr 2015 11:18:39 +0530
Message-ID: <CABHL29Hq8e+sgyfqtN-EbEpM1cC9XF_bO3F_rj68Piq-kKg4=w@mail.gmail.com>
Subject: Tips to debug Firmware crash
From: Venkat Ch <venkatch@gmail.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi All,

  I am an active developer of Atheros drivers for the last 10 years. I
have been working on QCA 10.2.2 driver for the last few months and
trying to understand the architecture of this offloading model. Though
this forum is nothing to do with Atheros provided drivers, I took the
liberty of posting the question to see if Ath10k community could help
me. Sorry if I violated any guidelines.

There is some problem at firmware level about which I am clueless.
Whenever there is a crash in firmware the 5GHz interface goes down
completely and there will not be any transmissions or receptions from
the interface from then. What all I see on the console is  some log
message "Target Asserted" . I don't get any stack trace to see in
which function it crashed.

 Can any of you please let me know if there is a way to dump the stack
trace and debug the firmware crash?


Thanks & Regards
Venkat


-- 
If you rest, you rust

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

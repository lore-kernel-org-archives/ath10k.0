Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gQNtq-0007tp-W1
 for ath10k@lists.infradead.org; Sat, 24 Nov 2018 02:42:28 +0000
Received: by mail-it1-x136.google.com with SMTP id x19so20809207itl.1
 for <ath10k@lists.infradead.org>; Fri, 23 Nov 2018 18:42:16 -0800 (PST)
MIME-Version: 1.0
From: David Timber <mieabby@gmail.com>
Date: Sat, 24 Nov 2018 13:42:04 +1100
Message-ID: <CAGYH49CnzzN9Q73U5VwARy8kT_JSMP2QbkLb1cMCbS-rx3nK4A@mail.gmail.com>
Subject: ath10k_pci firmware crash
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

Hi

After updating my kernel to 4.19.2, I noticed that my laptop's wifi
crashes fairly often. The system log shows that this never happened
before updating the kernel.

When the firmware crashed, I think I closed the lid of the laptop so
it would have had to go into the sleep mode.

I compared the firmware module and the source code to see if there was
any change since the last version of my kernel, and there were some
changes. I'm fine with using a bit older version of kernel(4.18.17),
but I'd appreciate the fix so I can update the kernel without any
trouble again.

I reported this bug to the kernel bugzilla, but no one seemed to care.
https://bugzilla.kernel.org/show_bug.cgi?id=201743

Thank you

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

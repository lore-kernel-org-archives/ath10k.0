Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIoJc-0004Rn-4q
 for ath10k@lists.infradead.org; Sat, 03 Nov 2018 05:17:45 +0000
Received: by mail-yb1-xb36.google.com with SMTP id g75-v6so1661828yba.10
 for <ath10k@lists.infradead.org>; Fri, 02 Nov 2018 22:17:32 -0700 (PDT)
MIME-Version: 1.0
From: Stuart Trusty <stuart.trusty@gmail.com>
Date: Sat, 3 Nov 2018 10:47:19 +0530
Message-ID: <CAL-+ky+JDJ6KMt=UPRPvpx5KHVg-NdBW+0P5Ly7raAmVsjiUzg@mail.gmail.com>
Subject: ath10k qca9377 802.11s fail ("awmode = 1 requires support from
 firmware")
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

Greetings all,

I am seeing conflicting reports about what works and doesn't for mesh in ath10k.

I just installed the latest firmware from kvalo and am still getting
this error on driver load:

[ 6582.327719] ath10k_pci 0000:03:00.0: rawmode = 1 requires support
from firmware
[ 6582.327722] ath10k_pci 0000:03:00.0: fatal problem with firmware
features: -22
[ 6582.327746] ath10k_pci 0000:03:00.0: could not probe fw (-22)

Is this some sort of forbidden fruit by QCA, or am I missing something here?

Thank much in advance,
Stuart

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

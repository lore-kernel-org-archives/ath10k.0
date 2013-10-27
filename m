Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaJ7i-0002iJ-VY
 for ath10k@lists.infradead.org; Sun, 27 Oct 2013 05:42:51 +0000
Received: by mail-wg0-f43.google.com with SMTP id b13so5405354wgh.22
 for <ath10k@lists.infradead.org>; Sat, 26 Oct 2013 22:42:28 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 26 Oct 2013 22:42:28 -0700
Message-ID: <CAPqRyK90OeJi_UVGV6V2SLFK0KZvc3Y9GkFgrOaNQYRNWeOMGA@mail.gmail.com>
Subject: 80 MHz support
From: Phil Moora <phil.moora@gmail.com>
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

Hello all,

Does ath10k provide 80 MHz channel support? I am using Compex
WLE900N5-18 miniPCIe (hw2) on latest ath10k-master branch. Everything
works fine but I can not make the card work on 80 MHz channel width.

I am trying to connect to a 80 MHz AP, but my card remains in 40 MHz.
Throughput tests reveal that it is indeed in 40 MHz.

Any suggestions? Any changes required to unlock 80 MHz?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

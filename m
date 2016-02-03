Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQp2M-0004XT-0T
 for ath10k@lists.infradead.org; Wed, 03 Feb 2016 04:27:26 +0000
Received: by mail-io0-x242.google.com with SMTP id m139so1886101ioe.2
 for <ath10k@lists.infradead.org>; Tue, 02 Feb 2016 20:27:05 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 2 Feb 2016 20:27:04 -0800
Message-ID: <CABy9W5=2-P+61L1uFbcdB0ky-hAwo05D95mkq3cuk8k898m-dA@mail.gmail.com>
Subject: Recovery from ath10k errors
From: Ann Lo <annlo.tech@gmail.com>
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

Hello,

Is there a recommended solution to recover from ath10k errors without
reboot? Example errors are:

- Repeated occurrences of "ath10k: SWBA overrun on vdev 0" leading to
other errors.

It appears that ath10k is in a strange state when errors happen. If we
use "modprobe -r ath10k_pci", this call just hangs. (The ifconfig
command hangs too).

We use kernel version 3.14.28. We have tried both Qualcomm firmware
999.999.0.636 and 10.1.467.3-1. Our hardware is WLE900VX.

Thanks,
Ann

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

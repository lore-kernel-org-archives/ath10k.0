Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnstD-0000Ck-RO
 for ath10k@lists.infradead.org; Fri, 23 May 2014 17:04:16 +0000
Received: by mail-we0-f174.google.com with SMTP id k48so5267209wev.33
 for <ath10k@lists.infradead.org>; Fri, 23 May 2014 10:03:53 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 23 May 2014 10:03:53 -0700
Message-ID: <CAPqRyK8WH14gjHGuBeCt3t8iz=cJLVbup_uoZgTpOi9vPd1NHA@mail.gmail.com>
Subject: changing channel width
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

Hi all,

I am trying to change the channel width (20, 40 or 80 MHz) with ath10k
using iw. I am not able to do so dynamically (while the radio is
operating in managed or AP mode). In some cases, it is not possible to
change channel width even when radio is off (ifconfig down). I always
get "Device busy" error.

Is it true that with current Ath10k, we have to reset the radio to
change the channel width? Is there a workaround?

I am using Compex WLE900N5-18 miniPCIe (hw2) with latest ath10k.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

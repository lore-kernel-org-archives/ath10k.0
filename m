Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V97Sx-00063F-5q
 for ath10k@lists.infradead.org; Tue, 13 Aug 2013 05:48:23 +0000
Received: by mail-lb0-f169.google.com with SMTP id u10so5498089lbi.0
 for <ath10k@lists.infradead.org>; Mon, 12 Aug 2013 22:48:00 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 Aug 2013 22:47:59 -0700
Message-ID: <CAH3sABq=52Fy_t7gBQcZWGC9Sb7GU2zb7TUY8xmh1vM=-AJQeA@mail.gmail.com>
Subject: Quick questions about changing channel width
From: Zeng Yunze <zengyunze@gmail.com>
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

Hi,

I am planning to implement some channel width adaptation algorithms
using 802.11ac. But I have the following questions:

1, Can ath10k support dynamic channel width changing? ( Is the related
hardware available in the market? )

2, If we make some modification on the driver, can it support?

3, Does the STA need to reconnect or re-associate with the AP when the
channel width is changed?

4, What is the delay approximately by switching between different
channel widths?

I really appreciate it if someone knows the answers and can reply me.

Thanks,
Yunze

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

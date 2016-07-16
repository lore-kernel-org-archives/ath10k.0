Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bOSOH-0003CR-5B
 for ath10k@lists.infradead.org; Sat, 16 Jul 2016 16:24:33 +0000
Received: by mail-vk0-x22e.google.com with SMTP id x130so192331583vkc.0
 for <ath10k@lists.infradead.org>; Sat, 16 Jul 2016 09:24:12 -0700 (PDT)
MIME-Version: 1.0
From: Josh Bendavid <joshbendavid@gmail.com>
Date: Sat, 16 Jul 2016 18:24:11 +0200
Message-ID: <CAD1MEweVh5ubi6sa609ip294WmSsPXkhOtzdJrH2TbLoQg=WBg@mail.gmail.com>
Subject: Re: Re: ath10k/QCA9980 - Issues introduced in wireless testing 2016-05
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

This patch solves the stack traces for me in lede trunk with the same
TP-Link Archer C2600 (QCA9980).

I still have occasionally clients "disconnected due to excessive
missing ACKs", but this is probably a separate issue.

Thanks,
Josh

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

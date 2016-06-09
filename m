Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]
 helo=omr2.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAqN4-0003Aw-G7
 for ath10k@lists.infradead.org; Thu, 09 Jun 2016 03:11:03 +0000
Received: from mr6.cc.vt.edu (mr6.cc.ipv6.vt.edu
 [IPv6:2001:468:c80:2105:0:250:3bcb:5b17])
 by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u593Ae2C007037
 for <ath10k@lists.infradead.org>; Wed, 8 Jun 2016 23:10:41 -0400
Received: from mail-wm0-f71.google.com (mail-wm0-f71.google.com [74.125.82.71])
 by mr6.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u593AZRB018338
 for <ath10k@lists.infradead.org>; Wed, 8 Jun 2016 23:10:40 -0400
Received: by mail-wm0-f71.google.com with SMTP id 4so14331788wmz.1
 for <ath10k@lists.infradead.org>; Wed, 08 Jun 2016 20:10:40 -0700 (PDT)
MIME-Version: 1.0
From: Gaurang Ramesh Naik <gaurang@vt.edu>
Date: Wed, 8 Jun 2016 23:10:34 -0400
Message-ID: <CAFc9h7uxTOUxONvW-gvgkFLUNR9OBn09kfetF9gqAtcNqN3SLg@mail.gmail.com>
Subject: Dynamic Bandwidth in hw rate control
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

I needed a small clarification related to dynamic bandwidth setup. The
documentation in wmi.h says " When enabled HW rate control tries
different bandwidths when retransmitting frames."

Does this mean that each packet is first always tried over VHT80 and
if that fails it goes to HT40 and then to HT20? I tried this with one
AP-Sta operating in VHT80 and one AP operating in its first secondary
channel. When I check the rx rate info using "iw dev wlanx station
dump", the bandwidth seems to sometimes alternate between 20 and 80,
but sometimes it stays fixed at 20. Hence, I was wondering what really
happens.

Thanks,
Gaurang.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

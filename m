Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]
 helo=omr1.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAZN8-0002ZG-Ku
 for ath10k@lists.infradead.org; Wed, 08 Jun 2016 09:01:59 +0000
Received: from mr3.cc.vt.edu (mr3.cc.ipv6.vt.edu
 [IPv6:2001:468:c80:2105:0:2b9:e1ff:8be3])
 by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u5891bnp019642
 for <ath10k@lists.infradead.org>; Wed, 8 Jun 2016 05:01:37 -0400
Received: from mail-wm0-f69.google.com (mail-wm0-f69.google.com [74.125.82.69])
 by mr3.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u5891Vx8024039
 for <ath10k@lists.infradead.org>; Wed, 8 Jun 2016 05:01:37 -0400
Received: by mail-wm0-f69.google.com with SMTP id k184so2668148wme.3
 for <ath10k@lists.infradead.org>; Wed, 08 Jun 2016 02:01:37 -0700 (PDT)
MIME-Version: 1.0
From: Gaurang Ramesh Naik <gaurang@vt.edu>
Date: Wed, 8 Jun 2016 05:01:30 -0400
Message-ID: <CAFc9h7synwZ1mt0PyRNN1Q6DOwtbL2im=PnxXhtrvZAFa2Yjcg@mail.gmail.com>
Subject: Number of Transmission retries
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

I know there is an iw command to set the number of transmission
retries using "iw phy phyx set retry short 'y' long 'z'". When I used
this command though, I did not observe any change in the performance
of the link throughput. Does ath10k honor this command? Also, if it
does, is it implemented in the firmware, or open-source?

Thanks,
GN.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

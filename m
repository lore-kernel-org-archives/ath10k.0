Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]
 helo=omr2.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSXXT-0000W9-0v
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 22:42:55 +0000
Received: from mr5.cc.vt.edu (smtp.ipv6.vt.edu
 [IPv6:2607:b400:92:9:0:9d:8fcb:4116])
 by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u6RMgQ3j018026
 for <ath10k@lists.infradead.org>; Wed, 27 Jul 2016 18:42:27 -0400
Received: from mail-lf0-f71.google.com (mail-lf0-f71.google.com
 [209.85.215.71])
 by mr5.cc.vt.edu (8.14.7/8.14.7) with ESMTP id u6RMgLdW013715
 for <ath10k@lists.infradead.org>; Wed, 27 Jul 2016 18:42:26 -0400
Received: by mail-lf0-f71.google.com with SMTP id k135so5052621lfb.2
 for <ath10k@lists.infradead.org>; Wed, 27 Jul 2016 15:42:26 -0700 (PDT)
MIME-Version: 1.0
From: Gaurang Ramesh Naik <gaurang@vt.edu>
Date: Wed, 27 Jul 2016 18:42:19 -0400
Message-ID: <CAFc9h7vkdFcns6zaeO0mAVPGAqcY62t5D2gNY5d6GkW=pwjVTA@mail.gmail.com>
Subject: Use Channel Switch Announcement (CSA) without DFS
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

Hi All,

Is it possible to use CSA when the AP operates on channel that do not
require DFS? Can I trigget CSA from the AP in some way?

Thanks,
GN.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

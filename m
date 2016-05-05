Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]
 helo=omr2.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayRYk-0004g9-Cz
 for ath10k@lists.infradead.org; Thu, 05 May 2016 22:15:50 +0000
Received: from mr6.cc.vt.edu (mr6.cc.ipv6.vt.edu
 [IPv6:2001:468:c80:2105:0:250:3bcb:5b17])
 by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u45MFTiB014239
 for <ath10k@lists.infradead.org>; Thu, 5 May 2016 18:15:29 -0400
Received: from mail-lf0-f71.google.com (mail-lf0-f71.google.com
 [209.85.215.71])
 by mr6.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u45MFONL012380
 for <ath10k@lists.infradead.org>; Thu, 5 May 2016 18:15:29 -0400
Received: by mail-lf0-f71.google.com with SMTP id y84so23163362lfc.3
 for <ath10k@lists.infradead.org>; Thu, 05 May 2016 15:15:29 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 5 May 2016 18:15:23 -0400
Message-ID: <CAFc9h7vhnd9iRKF-YsgkH6_+szjjhM4LdkhQuBQ0dqwNB+UoLg@mail.gmail.com>
Subject: Modifying the Interframe Spacing
From: Gaurang Ramesh Naik <gaurang@vt.edu>
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

I am working on a research project as a part of which I need to modify
the interframe spacing value (specifically the difs) of all 802.11ac
nodes (AP as well as STAs) in my test network. In one of the research
papers, I read that by changing the AIFSN in ath5k drivers, the
authors had changed the AIFS value. I have been trying to see where
this has been implemented in the source code under the ath/ath10k/
directory. Could someone please assist me with the following
questions,

(i) Is such a thing even possible in ath10k?
(ii) Am I looking in the right place (in the ath10k directory)?

Any insights will be extremely valuable.

Thanks,
GN.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

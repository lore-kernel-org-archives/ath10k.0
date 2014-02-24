Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp3.ugent.be ([157.193.49.127])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WI2hv-0003Bh-7c
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 21:05:00 +0000
Received: from localhost (mcheck3.ugent.be [157.193.71.89])
 by smtp3.ugent.be (Postfix) with ESMTP id 57163C712
 for <ath10k@lists.infradead.org>; Mon, 24 Feb 2014 22:04:35 +0100 (CET)
Received: from smtp3.ugent.be ([IPv6:::ffff:157.193.49.127])
 by localhost (mcheck3.UGent.be [::ffff:157.193.43.11]) (amavisd-new,
 port 10024)
 with ESMTP id wf40mth7u-Il for <ath10k@lists.infradead.org>;
 Mon, 24 Feb 2014 22:04:35 +0100 (CET)
Received: from [192.168.1.51] (178-116-9-163.access.telenet.be [178.116.9.163])
 (Authenticated sender: bjooris)
 by smtp3.ugent.be (Postfix) with ESMTPSA id E0888C711
 for <ath10k@lists.infradead.org>; Mon, 24 Feb 2014 22:04:34 +0100 (CET)
Message-ID: <530BB3E2.8000705@intec.ugent.be>
Date: Mon, 24 Feb 2014 22:04:34 +0100
From: Bart Jooris <Bart.Jooris@intec.ugent.be>
MIME-Version: 1.0
Subject: Compiling custom ath10k: step 5 minor issue
Reply-To: Bart.Jooris@intec.ugent.be
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

../ath/net/core/flow_dissector.c seems to be changed?

./gentree.py --verbose --clean --git-revision master --copy-list 
copy-list.ath ../ath ../backports-output
Get original source files from git ...
Apply patches ...
Not applying backport-adjustments/dma-buf.patch, not needed
Applying patch backport-adjustments/flow_dissector.patch
 > patching file compat/net-core-flow_dissector.c
 > Hunk #1 FAILED at 177.
 > 1 out of 1 hunk FAILED -- saving rejects to file 
compat/net-core-flow_dissector.c.rej

Kind regards,

Bart


-- 
Bart Jooris
Department of Information Technology
Internet Based Communication Networks and Services (IBCN)
Ghent University - iMinds
Gaston Crommenlaan 8 (Bus 201), B-9050 Gent, Belgium
E-mail: bart.jooris@intec.UGent.be
M: +32 474 59 53 42
Tel. +32 9 33 14900
Fax +32 9 33 14899


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

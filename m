Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrUU7-0004Y2-So
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 15:49:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC PATCH 0/2] ath10k: testmode support
References: <20140528091832.8030.93169.stgit@potku.adurom.net>
 <538B8446.50301@stackframe.org>
Date: Mon, 2 Jun 2014 18:48:47 +0300
In-Reply-To: <538B8446.50301@stackframe.org> (Sven Schnelle's message of "Sun, 
 1 Jun 2014 21:51:34 +0200")
Message-ID: <87iooj1fds.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Sven Schnelle <svens@stackframe.org>
Cc: ath10k@lists.infradead.org

Sven Schnelle <svens@stackframe.org> writes:

> Only one small thing: The firmware expects the UTF commands in
> segmented format. Should that splitting be done in your testmode
> patch, or should userspace handle that?

I would prefer to keep the driver as simple as possible. My idea here is
that the testmode interface is only about tranmitting and receiving WMI
packets, it does not look at all what's inside the packet. AFAIK the
user space should be able to handle everything on it's own.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

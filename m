Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSBES-0000Rc-Dj
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 20:44:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: support firmware crash-by-assert
References: <20140910155928.30418.45160.stgit@potku.adurom.net>
Date: Thu, 11 Sep 2014 23:44:00 +0300
In-Reply-To: <20140910155928.30418.45160.stgit@potku.adurom.net> (Kalle Valo's
 message of "Wed, 10 Sep 2014 18:59:28 +0300")
Message-ID: <87vbot28hb.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Ben Greear <greearb@candelatech.com>
>
> 10.1 firmware does not have an official way to
> cause assert on purpose, but it can be done with
> carefully crafted WMI command.  This is a different
> kind of crash from the 'hard' crash, which is
> a bad memory dereference.
>
> Different crashes decode in different manners, so
> this will help the crash-report testing as well as
> offer better ways to test firmware failure and
> recovery.
>
> kvalo: move the wmi command creation to debug.c, modify
> the info print
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Thanks Ben, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9wGJ-0006dK-J3
 for ath10k@lists.infradead.org; Thu, 15 Aug 2013 12:02:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Did ath9k/ath10k support AR9388?
References: <2013081513111459004272@gmail.com>
Date: Thu, 15 Aug 2013 15:02:14 +0300
In-Reply-To: <2013081513111459004272@gmail.com> (Ryane Luo's message of "Thu, 
 15 Aug 2013 13:11:16 +0800")
Message-ID: <87li4317sp.fsf@kamboji.qca.qualcomm.com>
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
To: luoqiwen1984 <luoqiwen1984@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

"Ryane Luo" <luoqiwen1984@gmail.com> writes:

> I got an Apple original WIFI module which chip is AR9388. Plug it to
> my latop, it doesn't recognize by Ubuntu 12.04 .
>
> And try to plug it to my router(base on Linux--DD-WRT ). ath9k doesn't work for it.
>
> Module works fine on Win7 PC, so HW is ok.
>
> AR9388 module is cheap and with 450M performance, very familar at AR9380.
>
> Anyone know howto support it by ath9k and ath10k ?
>
> Try lspci at the router, got this:
> #lspci
> 00:00.0 Class 0200:168c:abcd
> When manual add Device Id to the src code, it failure again.
>

[...]

> [ 12.953229] ath: phy0: Couldn't reset chip
> [ 12.957311] ath: phy0: Unable to initialize hardware; initialization status: -5
> [ 12.964574] ath9k 0000:00:00.0: Failed to initialize device
> [ 12.970146] ath9k: probe of 0000:00:00.0 failed with error -5
> [ 12.981140] ath: phy1: Unable to initialize hardware; initialization status: -5
> [ 12.988414] ath9k 0000:01:00.0: Failed to initialize device
> [ 12.993971] ath9k: probe of 0000:01:00.0 failed with error -5

You should send ath9k questions to ath9k-devel:

ath9k-devel@lists.ath9k.org

AFAIK AR9388 belongs to the family of chips which is supported by ath9k.
ath10k will not support it.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
